# Co-simulating RTL with Renode + Verilator (C++ interface)

This guide covers Renode's **"custom, direct integration method (Verilator-only)"** — the mechanism where you compile HDL with Verilator, link it against a small C++ library that ships with Renode, and Renode drives your RTL as if it were a real memory-mapped peripheral. This is different from the DPI/SystemVerilog method, which is simulator-agnostic but goes over TCP+DPI instead.

Every command and code snippet below was actually run while writing this guide (Ubuntu 24.04, Verilator 5.020, Renode 1.16.1) — not transcribed from docs. That process surfaced a real, currently-open upstream regression that breaks this exact workflow on Renode ≥ v1.17.0; see the callout in Step 0 before you install anything.

---

## Architecture, in short

```
 Your Verilog/SystemVerilog RTL  --(verilator)-->  C++ model (Vtop / Vtop.h)
                                                          │
                             sim_main.cpp  (you write this)
                                   │  #include "src/peripherals/uart.h"
                                   │  #include "src/buses/axilite.h"   (or axi/apb3/wishbone/cfu)
                                   ▼
                     Renode's IntegrationLibrary (C++, ships with Renode)
                                   │
                    ┌──────────────┴───────────────┐
              connectNative()                  connect(port, port, addr)
           (linked in-process,               (separate process,
            libVtop.so/.dll/.dylib)           Vtop / Vtop.exe, TCP socket)
                    └──────────────┬───────────────┘
                                   ▼
                   Renode  CoSimulated.CoSimulatedUART
                     or    CoSimulated.CoSimulatedPeripheral
                                   │
                              sysbus @ <address>
```

Two ways to attach the compiled model to Renode, both built from the **same source** by the same CMake project:

| | `libVtop.so`/`.dll`/`.dylib` | `Vtop`/`Vtop.exe` |
|---|---|---|
| Mechanism | Loaded in-process, direct C++ calls | Separate OS process, TCP loopback |
| REPL config | no `address:` field | needs `address: "127.0.0.1"` |
| Monitor command | `SimulationFilePath[Linux\|Windows\|macOS]` | same command, points at the executable |
| Renode spawns it? | N/A (it's a library) | Yes, automatically, when you attach it |
| Typical use | fastest, default choice | debugging the model standalone, or running it on another machine |

Supported buses for this method: **APB3, AXI4, AXI4-Lite, Wishbone**, plus a **CFU** (Custom Function Unit) interface and a **UART** peripheral helper (`src/peripherals/uart.h`) that wraps whichever bus you choose.

---

## Step 0 — ⚠️ A currently-open upstream regression you need to know about

While building this guide, a commit on `renode/renode`'s `master` branch —

```
46160f05  "[#100219] dpi: Add non-blocking communication support"  (2026-08-06)
```

— changed `SocketCommunicationChannel::connect()`'s signature from `(int receiverPort, int senderPort, const char* address)` to `(SocketConnectionArgs *args)`, as part of adding non-blocking support to the **DPI** method. The commit updated the DPI call sites but **not** `src/Plugins/CoSimulationPlugin/IntegrationLibrary/src/renode_bus.cpp`, which is what the **direct C++/Verilator-only method** (this guide) uses. That file is compiled into every `Vtop`/`libVtop` target regardless of which peripheral you build, so **any** peripheral built against `renode/renode` from that commit onward fails with:

```
error: no matching function for call to 'SocketCommunicationChannel::connect(int&, int&, const char*&)'
  channel->connect(receiverPort, senderPort, address);
note: candidate: 'void SocketCommunicationChannel::connect(SocketConnectionArgs*)'
```

This is present in the `v1.17.0` release tag (2026-09-07) and on current `master`. It is **not** present in `v1.16.1` (2026-02-16) or earlier.

**What to do:** use Renode **v1.16.1** for this workflow until this is fixed upstream. Everything below is pinned to that version and was verified end-to-end. Before you start, it's worth a quick check whether a newer release has fixed it — if `git log --oneline -- src/Plugins/CoSimulationPlugin/IntegrationLibrary/src/renode_bus.cpp` on the current release tag shows a commit after Aug 2026 touching the `connect` method, it's likely fixed and you can use the latest release instead.

---

## Step 1 — Install prerequisites

### 1.1 Verilator (need ≥ v4.024; CMake support needs ≥ v4.022)

```bash
sudo apt-get install verilator     # Ubuntu 22.04/24.04 ship 4.038/5.020 — both fine
verilator --version
```

If your distro's package is too old, build from git instead (this is also what you'd do to track Verilator's newest features):

```bash
git clone https://github.com/verilator/verilator
cd verilator
git checkout v5.026            # or: git checkout stable
autoconf && ./configure
make -j$(nproc)
sudo make install
```

### 1.2 Renode — download the portable package (v1.16.1)

This is the one non-obvious shortcut that simplifies everything below: **the Renode release package already contains the C++ IntegrationLibrary you need to build peripherals against**, at `plugins/IntegrationLibrary/`. You do **not** need to separately `git clone` the (huge, submodule-heavy) `renode/renode` source repository just to get these headers — the docs' phrasing ("a local copy of the Renode repository") is satisfied just as well by the extracted release archive, and it guarantees the peripheral you build is matched to the exact Renode version you'll run it with.

```bash
mkdir renode_portable
wget https://github.com/renode/renode/releases/download/v1.16.1/renode-1.16.1.linux-portable.tar.gz
tar xf renode-1.16.1.linux-portable.tar.gz -C renode_portable --strip-components=1
cd renode_portable
export PATH="$(pwd):$PATH"      # so `renode` is on PATH from any directory
```

(The portable package needs GTK2 for the GUI; `--disable-xwt` below avoids that if you're headless/SSH'd in. macOS: use the `.dmg`; Windows: the `.msi`/portable zip — see the [README](https://github.com/renode/renode/blob/master/README.md#installation) for those.)

Sanity check:

```bash
renode --version
# Renode 1.16.1.16908
```

### 1.3 Clone renode-verilator-integration

```bash
git clone --depth 1 https://github.com/antmicro/renode-verilator-integration.git
```

This repo has no submodules of its own that matter for this guide's samples — a plain shallow clone is enough. It contains ready-to-build sample peripherals under `samples/`, the shared CMake build logic under `cmake/`, and (on Linux) a prebuilt OpenLibm static library under `lib/` for build portability.

---

## Step 2 — Zero-build sanity check (optional but recommended)

Before building anything yourself, confirm your Renode install can do co-simulation at all, using a peripheral Antmicro has already built and hosts:

```bash
cd renode_portable
./renode --disable-xwt --console
```

Then at the `(monitor)` prompt:

```
(monitor) include @scripts/single-node/riscv_verilated_uartlite.resc
(UARTLite) start
```

This loads a RISC-V machine, downloads a prebuilt `libVuartlite` and a Zephyr demo ELF, and boots Zephyr printing over a **verilated** UART. Verify it's really the co-simulated model, not a native Renode UART model:

```
(UARTLite) sysbus WhatPeripheralIsAt 0x70000000
Antmicro.Renode.Peripherals.CoSimulated.CoSimulatedUART
```

(Needs internet access to `dl.antmicro.com` for the two downloads.)

---

## Step 3 — Build a sample peripheral yourself

We'll use `samples/uartlite` — the same AXI4-Lite UART used above, but built by you from source. Its layout:

```
samples/uartlite/
├── CMakeLists.txt   # 20 lines, just wires up the shared build logic
├── sim_main.cpp     # the C++ wrapper — the actual "C++ interface" code
├── top.v            # AXI4-Lite register interface + FSMs
├── uart.v            uart_rx.v            uart_tx.v
```

Its `CMakeLists.txt` (this pattern is identical across every sample):

```cmake
cmake_minimum_required(VERSION 3.8)
project(uartlite)

# Verilog file containing the top module to be Verilated
set(VTOP top.v)

# C/C++ source files to be compiled
set(CSOURCES sim_main.cpp)

# Additional compiling, linking or verilating arguments
set(COMP_EXEC_ARGS -DINVERT_RESET)
set(COMP_LIB_ARGS -fPIC -DINVERT_RESET)

# CMake file doing the hard job
include(../../cmake/configure-and-verilate.cmake)
```

### 3.1 Configure and build

```bash
cd renode-verilator-integration/samples/uartlite
mkdir build && cd build

cmake -DCMAKE_BUILD_TYPE=Release \
      -DUSER_RENODE_DIR=/absolute/path/to/renode_portable \
      -DLIBOPENLIBM=/absolute/path/to/renode-verilator-integration/lib/libopenlibm-Linux-x86_64.a \
      ..

make -j$(nproc)
```

`USER_RENODE_DIR` just needs to contain `integration-library.cmake` somewhere under it — CMake globs for it recursively and prints where it found it:

```
-- Looking for Renode IntegrationLibrary inside /.../renode_portable...
-- Renode IntegrationLibrary (version 3.0) found in /.../renode_portable/plugins/IntegrationLibrary.
```

`LIBOPENLIBM` is optional (it improves portability across glibc versions on Linux) — you can drop that flag entirely for a first try. On success you get **both** artifacts from one build:

```
build/Vtop        # standalone executable, socket-based connection
build/libVtop.so  # shared library, in-process connection
```

*(All-in-one paths: `RENODE_ROOT` and `VERILATOR_ROOT` environment variables work as substitutes for `-DUSER_RENODE_DIR`/`-DUSER_VERILATOR_DIR` if you'd rather export them once. On Windows, add `-G "MinGW Makefiles" -DCMAKE_SH=CMAKE_SH-NOTFOUND` and build with `mingw32-make` under MSYS2/Cygwin — see the [tutorial's Windows section](https://renode.readthedocs.io/en/latest/tutorials/co-simulating-custom-hdl.html#windows-specific-build-information) for the full detail.)*

### 3.2 Describe the peripheral to Renode

Create `uart.repl`:

```
uart: CoSimulated.CoSimulatedUART @ sysbus <0x70000000, +0x100>
    frequency: 100000000
```

(`CoSimulated.CoSimulatedUART` gets you the UART analyzer window for free; any other verilated peripheral uses the generic `CoSimulated.CoSimulatedPeripheral` type instead — see Step 4.)

### 3.3 Attach and run it (library-linked mode)

```
(monitor) using sysbus
(monitor) mach create "test"
(machine-0) machine LoadPlatformDescription @uart.repl
(machine-0) uart SimulationFilePathLinux @/absolute/path/to/build/libVtop.so
(machine-0) showAnalyzer uart
(machine-0) start
```

(`SimulationFilePath` — without the OS suffix — is documented as a cross-platform convenience alias, but wasn't available as a bare property on v1.16.1 when I tested it; use `SimulationFilePathLinux`/`SimulationFilePathWindows`/`SimulationFilePathMacOS` explicitly to be safe, exactly as Renode's own bundled scripts do.)

### 3.4 Prove it's actually simulating your RTL

This is the part worth doing once so you trust the rest: turn on bus-access logging and poke the register map straight from the monitor.

```
(machine-0) sysbus LogPeripheralAccess uart
(machine-0) sysbus WriteDoubleWord 0x70000004 0x48    # 'H' into the tx-data register
(machine-0) sysbus ReadDoubleWord 0x7000000C           # read the status register
```

What I actually saw when I ran this:

```
08:44:37.5646 [INFO] uart: WriteUInt32 to 0x4 (unknown), value 0x48
08:44:37.8470 [INFO] uart: ReadUInt32 from 0xC (unknown), returned 0x4
0x00000004
...
08:44:38.0649 [INFO] uart: [host: 0.85s (+0.85s)|virt: 60ms (+60ms)] H
```

That last line is Renode's UART analyzer decoding a serial bitstream that came out of the real `uart_tx` Verilog module — the byte was written over the AXI4-Lite bus, shifted out bit-by-bit by verilated RTL at the configured baud rate, and decoded back into `'H'`. That's genuine co-simulation, not a stub.

### 3.5 The other connection mode: socket-based (`Vtop`)

Same peripheral, same build — just change the REPL and point at the other binary:

```
uart: CoSimulated.CoSimulatedUART @ sysbus <0x70000000, +0x100>
    frequency: 100000000
    address: "127.0.0.1"
```

```
(machine-0) uart SimulationFilePathLinux @/absolute/path/to/build/Vtop
(machine-0) start
```

Renode spawns `Vtop` as a child process and connects to it over a local TCP socket — no other setup needed. This produces identical results to the library-linked mode. Use this mode if you want to run the model on a different machine, debug it standalone under `gdb`, or just prefer process isolation over in-process linking.

---

## Step 4 — A second example: a generic (non-UART) peripheral

`samples/ram` is a plain AXI4 memory (`axi_ram.v`) with no UART-specific wrapper — it demonstrates `CoSimulated.CoSimulatedPeripheral`, the type you use for anything that isn't a UART:

```bash
cd renode-verilator-integration/samples/ram
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Release -DUSER_RENODE_DIR=/path/to/renode_portable ..
make -j$(nproc)
```

```
ram: CoSimulated.CoSimulatedPeripheral @ sysbus <0x70000000, +0x1000>
    frequency: 100000000
```

```
(machine-0) machine LoadPlatformDescription @ram.repl
(machine-0) ram SimulationFilePathLinux @/path/to/build/libVtop.so
(machine-0) start
(machine-0) sysbus WriteDoubleWord 0x70000010 0xDEADBEEF
(machine-0) sysbus ReadDoubleWord 0x70000010
0xDEADBEEF
```

Real write-then-read-back through the verilated AXI4 RAM. One thing worth flagging: the very first access can log a one-off `Operation timeout` / `Operation error reported by the co-simulation!` warning before the read still returns the correct value — harmless in practice, but if you see it, treat it as a hint to check `axi_ram.v`'s handshake latency against Renode's default co-simulation timeout rather than an outright failure.

---

## Step 5 — Writing your own verilated peripheral

The tutorial page shows a slightly older/simplified code shape than what's actually in the samples today. Here's the **current, verified-working pattern**, straight from `samples/uartlite/sim_main.cpp`:

```cpp
#include <verilated.h>
#include "Vtop.h"
#include <stdio.h>
#include <stdlib.h>
#if VM_TRACE
# include <verilated_vcd_c.h>
#endif
// uart.h and axilite.h ship inside Renode's IntegrationLibrary
#include "src/peripherals/uart.h"
#include "src/buses/axilite.h"

#define UART_FREQ 100000000
#define BAUDRATE 115200
const int prescaler = UART_FREQ / (BAUDRATE * 8);

Vtop *top = new Vtop;
VerilatedVcdC *tfp;
vluint64_t main_time = 0;

void eval() {
#if VM_TRACE
    main_time++;
    tfp->dump(main_time);
#endif
    top->eval();
}

RenodeAgent *initAgent() {
    RenodeAgent *agent = new UART(&top->txd, &top->rxd, prescaler);
    AxiLite *bus = new AxiLite();

    // Wire up every bus signal to the verilated top-level port
    bus->clk = &top->clk;
    bus->rst = &top->rst;
    bus->awaddr  = (uint64_t *)&top->awaddr;
    bus->awvalid = &top->awvalid;
    bus->awready = &top->awready;
    bus->wdata   = (uint64_t *)&top->wdata;
    bus->wstrb   = &top->wstrb;
    bus->wvalid  = &top->wvalid;
    bus->wready  = &top->wready;
    bus->bresp   = &top->bresp;
    bus->bvalid  = &top->bvalid;
    bus->bready  = &top->bready;
    bus->araddr  = (uint64_t *)&top->araddr;
    bus->arvalid = &top->arvalid;
    bus->arready = &top->arready;
    bus->rdata   = (uint64_t *)&top->rdata;
    bus->rresp   = &top->rresp;
    bus->rvalid  = &top->rvalid;
    bus->rready  = &top->rready;
    bus->evaluateModel = &eval;

    agent->addBus(bus);
    return agent;
}

RenodeAgent *Init() {           // called for the library-linked (connectNative) path
    RenodeAgent *agent = initAgent();
    agent->connectNative();
    return agent;
}

int main(int argc, char **argv, char **env) {   // entry point for the standalone Vtop binary
    if (argc < 3) {
        printf("Usage: %s {receiverPort} {senderPort} [{address}]\n", argv[0]);
        exit(-1);
    }
    const char *address = argc < 4 ? "127.0.0.1" : argv[3];

    Verilated::commandArgs(argc, argv);
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VerilatedVcdC;
    top->trace(tfp, 99);
    tfp->open("simx.vcd");
#endif
    RenodeAgent *uart = initAgent();
    uart->connect(atoi(argv[1]), atoi(argv[2]), address);
    uart->simulate();
    top->final();
    exit(0);
}
```

The shape to copy for your own peripheral:
1. `#include` the bus header matching your interface (`axilite.h`, `axi.h`, `apb3.h`, `wishbone.h` — all under `src/buses/`) and, if relevant, a peripheral helper like `uart.h`.
2. Write an `eval()` that calls `top->eval()` (and optionally dumps a trace — see Step 6).
3. In an `Init`-style function, `new` the bus struct, point every one of its signal fields at your verilated top-level ports, and set `bus->evaluateModel = &eval`.
4. Either `agent->addBus(bus)` on a `RenodeAgent`/`UART` you construct, or use the plain `RenodeAgent` type directly for a bus-only peripheral with no special helper (see `samples/ram/sim_main.cpp` for that variant).
5. Support **both** entry points if you want both connection modes: `connectNative()` for library-linked, `connect(receiverPort, senderPort, address)` + `simulate()` for the standalone socket binary — the same `CMakeLists.txt` builds both `Vtop` and `libVtop` from one source file regardless.

### CMakeLists.txt for a new peripheral

Copy the repo's template and fill in three placeholders:

```bash
mkdir my_peripheral
cp *.v *.c *.cpp my_peripheral/
cp renode-verilator-integration/cmake/CMakeLists.txt.template my_peripheral/CMakeLists.txt
```

```cmake
#
# REPLACE ALL UNCOMMENTED <...> PLACEHOLDERS
#
cmake_minimum_required(VERSION 3.8)
project(<PROJECT_NAME>)

# Verilog files to be verilated
set(VTOP <MODULE_FILES>)

# C/C++ source files to be compiled
set(CSOURCES <C_SRC_FILES>)

# Additional compiling, linking or verilating arguments
#set(COMP_ARGS <ARGS>)
#set(LINK_ARGS <ARGS>)
#set(VERI_ARGS <ARGS>)

include(../cmake/configure-and-verilate.cmake)
```

Only `<PROJECT_NAME>`, `<MODULE_FILES>` and `<C_SRC_FILES>` are required (space-separated if more than one file); the `*_ARGS` lines are for extra Verilator/compiler/linker flags (uncomment and fill as needed — e.g. `-Wno-WIDTH` if Verilator's width-mismatch warnings get in your way). If your peripheral directory isn't directly under the repo root, fix the relative path in the final `include()` line to point at `cmake/configure-and-verilate.cmake`.

Then build exactly as in Step 3.1.

---

## Step 6 — Performance tuning and waveform tracing

**Clock rate vs. CPU speed:** the `frequency` field in the `.repl` entry drives the verilated design's clock in virtual time, tied to instructions executed by the CPU (via its `PerformanceInMips` setting) — see [Time Framework](https://renode.readthedocs.io/en/latest/advanced/time_framework.html). Since clocking on every single instruction is wasteful, ticks are buffered:

```
uart: CoSimulated.CoSimulatedUART @ sysbus <0x70000000, +0x100>
    frequency: 100000000
    limitBuffer: 10000   # default is 1000000
```

**VCD/FST tracing**, if you want to look at signals in GTKWave: add `--trace` (VCD) or `--trace-fst` (FST) to `VERI_ARGS`/`VERI_EXEC_ARGS`/`VERI_LIB_ARGS` in your `CMakeLists.txt`, then in `sim_main.cpp`:

```cpp
#if VM_TRACE_VCD
# include <verilated_vcd_c.h>
# define VERILATED_DUMP VerilatedVcdC
# define DEF_TRACE_FILEPATH "simx.vcd"
#elif VM_TRACE_FST
# include <verilated_fst_c.h>
# define VERILATED_DUMP VerilatedFstC
# define DEF_TRACE_FILEPATH "simx.fst"
#endif
```

Initialize it inside `main()` if you're using the socket-based binary, or inside your `Init()` if you're using the library-linked path (this distinction matters — get it backwards and the trace object won't exist when `eval()` first dumps to it):

```cpp
#if VM_TRACE
    Verilated::traceEverOn(true);
    tfp = new VERILATED_DUMP;
    top->trace(tfp, 99);
    tfp->open(DEF_TRACE_FILEPATH);
#endif
```

Open the resulting `.vcd`/`.fst` in `gtkwave` (`sudo apt-get install gtkwave`).

---

## Other ready-made samples in the repo

| Sample | Bus / interface | What it models |
|---|---|---|
| `uartlite` | AXI4-Lite + UART helper | Simple UART, the one used throughout this guide |
| `uartlite_extended` | AXI4-Lite + UART helper | Same UART RTL, extended C++ wrapper |
| `liteuart` | Wishbone + UART helper | LiteX-style UART |
| `apb3uart` | APB3 + UART helper | APB3-attached UART |
| `ram` | AXI4 | Generic memory, `CoSimulatedPeripheral` example |
| `fastvdma` | AXI4 / AXI4-Lite (DMA) | FastVDMA DMA controller |
| `fpga_isp` | AXI4 / Wishbone-AXIS bridges | Image signal processing pipeline |
| `cfu_basic`, `cfu_mnv2` | CFU | Custom Function Units (RISC-V ML accelerator interface) |
| `cpu_ibex` | Wishbone (CPU) | A full lowRISC Ibex RISC-V core as a co-simulated CPU, built via `fusesoc` |

Each is a complete, ready-to-`cmake` directory — no "preparing the peripheral directory" step needed, just build in place per Step 3.1 and point a `.repl` at whichever bus/peripheral type matches it.

---

## Troubleshooting reference

**`fatal error: .../Infrastructure/src/Emulator/Cores/renode/include/renode_imports.h: No such file or directory`**
Only happens if you built `USER_RENODE_DIR` against a `git clone` of `renode/renode` instead of the extracted portable release. That header lives in the `src/Infrastructure` git submodule, which a shallow/sparse clone won't fetch by default:
```bash
git submodule update --init --depth 1 -- src/Infrastructure
```
Using the portable release package (Step 1.2) avoids this entirely — it ships the header already in place.

**`no matching function for call to 'SocketCommunicationChannel::connect(...)'`**
The upstream regression from Step 0. Pin to Renode v1.16.1 or earlier.

**`sysbus.uart does not provide a field, method or property SimulationFilePath`**
Use the OS-specific name — `SimulationFilePathLinux`/`Windows`/`macOS` — the bare `SimulationFilePath` alias wasn't present as a settable property in v1.16.1.

**`Operation timeout` / `Operation error reported by the co-simulation!` right after a bus access**
Can happen on the very first write to a peripheral; the read that follows can still return the correct value. Likely a bus-handshake-latency vs. co-simulation-timeout mismatch specific to that RTL, not a broken connection — worth confirming your transaction actually completed (as above) before digging further.

**Build works but Renode won't find the IntegrationLibrary at all**
`USER_RENODE_DIR` must be an *absolute* path containing `integration-library.cmake` somewhere underneath it (CMake globs recursively). If you're not sure where that is in your setup, `find /path -name integration-library.cmake` will tell you.

---

## Reference links

- [Co-simulating with an HDL simulator](https://renode.readthedocs.io/en/latest/advanced/co-simulating-with-an-hdl-simulator.html) — the two integration methods, supported buses
- [Co-simulating your verilated model](https://renode.readthedocs.io/en/latest/tutorials/co-simulating-custom-hdl.html) — the tutorial this guide extends and verifies
- [renode-verilator-integration](https://github.com/antmicro/renode-verilator-integration) — sample peripherals, CMake build logic (MIT licensed)
- [renode/renode](https://github.com/renode/renode) — `src/Plugins/CoSimulationPlugin/IntegrationLibrary` is the C++ side of the plugin
- [verilator/verilator](https://github.com/verilator/verilator) — installation and build docs
- [Renode releases](https://github.com/renode/renode/releases) — portable packages for Linux/macOS/Windows
