#!/bin/bash

CC_BASE=/c/riscv_cc/bin/riscv-none-elf
CC="$CC_BASE"-gcc
OBJ_DUMP="$CC_BASE"-objdump
OBJ_COPY="$CC_BASE"-objcopy
SIZE="$CC_BASE"-size
CC_FLAGS="-march=rv32i_zicsr -mabi=ilp32 -I./ -I./barebones"
LD_FLAGS="-Wl,--gc-sections -nostartfiles -T linker_script.ld"
OC_FLAGS="-O verilog --verilog-data-width=4"

$CC -c $CC_FLAGS -o main.o main.c
$CC -c $CC_FLAGS -o startup.o startup.S
$CC $CC_FLAGS $LD_FLAGS *.o -o program.elf

$OBJ_DUMP -D program.elf > program_disasm.S

$OBJ_COPY $OC_FLAGS -j .data -j .bss program.elf program_data.mem
$OBJ_COPY $OC_FLAGS -j .text program.elf program_instr.mem

$SIZE program.elf
