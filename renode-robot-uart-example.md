# Renode: минимальный UART-тест для RISC-V bare-metal

## 1. Цель

Минимальный пример автоматизированного тестирования UART в Renode:

* собственная платформа с RISC-V CPU, RAM и NS16550 UART;
* bare-metal firmware на C;
* загрузка ELF в Renode;
* тестирование через Robot Framework;
* побайтная проверка UART в `binaryMode`;
* текстовая проверка UART через `Terminal Tester`.

В качестве тестового поведения используется простой UART echo: каждый принятый байт немедленно передаётся обратно.

---

## 2. Структура проекта

```text
uart_lb_test/
├── uart-demo.repl
├── link.ld
├── start.S
├── main.c
├── uart.robot
└── firmware.elf
```

`firmware.elf` генерируется из `start.S`, `main.c` и `link.ld`.

---

# 3. Платформа Renode

## 3.1. Установка:

Устанавливаем apt-зависимости:

```bash
sudo apt install policykit-1 libgtk2.0-0 screen uml-utilities gtk-sharp2 libc6-dev libicu-dev gcc python3 python3-pip
```

Качаем портативный релиз под Linux:

```
mkdir renode_portable
wget https://builds.renode.io/renode-latest.linux-portable.tar.gz
tar xf  renode-latest.linux-portable.tar.gz -C renode_portable --strip-components=1
```

Добавляем renode в PATH:

```bash
cd renode_portable
export PATH="`pwd`:$PATH"
```

Качаем python-зависимости для robot framework:

```bash
python -m venv venv
source venv/scripts/activate
python3 -m pip install -r tests/requirements.txt
```

Качаем сборку [riscv-тулчейна](https://github.com/riscv-collab/riscv-gnu-toolchain) (или собираем руками) под свою систему. Для ubuntu 22.04 можно взять [эту](https://github.com/riscv-collab/riscv-gnu-toolchain/releases/download/2026.08.27/riscv64-elf-ubuntu-22.04-gcc.tar.xz). Добавляем тулчейн в PATH.

## З.2. Сборка прошивки

Пример исходников для быстрого старта:

### 3.2.1 `start.S`

```asm
.section .text
.global _start

_start:
    la sp, _stack_top
    call main

1:
    j 1b
```

### 3.2.1 `main.c`

```c
#define UART_BASE 0x10000000UL

#define UART_THR (*(volatile unsigned char *)(UART_BASE + 0x00))
#define UART_RBR (*(volatile unsigned char *)(UART_BASE + 0x00))
#define UART_LSR (*(volatile unsigned char *)(UART_BASE + 0x05))

#define UART_LSR_DR   (1 << 0)
#define UART_LSR_THRE (1 << 5)

static void uart_putc(char c)
{
    while (!(UART_LSR & UART_LSR_THRE))
        ;

    UART_THR = c;
}

static char uart_getc(void)
{
    while (!(UART_LSR & UART_LSR_DR))
        ;

    return UART_RBR;
}

int main(void)
{
    uart_putc('>');

    while (1) {
        char c = uart_getc();
        uart_putc(c);
    }

    return 0;
}
```

### 3.2.1 `link.ld`

```ld
ENTRY(_start)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x80000000, LENGTH = 64K
}

SECTIONS
{
    .text : {
        *(.text.init)
        *(.text*)
    } > RAM

    .rodata : {
        *(.rodata*)
    } > RAM

    .data : {
        *(.data*)
    } > RAM

    .bss : {
        *(.bss*)
        *(COMMON)
    } > RAM

    . = ALIGN(16);
    . += 0x1000;
    _stack_top = .;
}
```

Собираем командной:
```bash
riscv64-unknown-elf-gcc \
 -march=rv64imac \
 -mabi=lp64 \
 -mcmodel=medany \
 -nostdlib \
 -ffreestanding \
 -Wl,-T,link.ld \
 start.S main.c \
 -o firmware.elf
```

Ключевой параметр:

```text
-mcmodel=medany
```

Он необходим для корректной сборки данного варианта программы с используемым расположением кода и данных.

## 3.3. Запуск

В первую очередь рекомендуется пройти ручной маршрут проверки, а уже после этого приступать к автоматизированному тестированию.
Порядок ручного запуска:

```bash
renode
```

откроется графическое окно. В данном окне вводим (команды добиваются табом, можно даже забить на регистр, таб все исправит, путь к файлам указывается через `@`, изначально ищет в папке renode):

1. создание виртуальной машины:
   ```
   mach create
   ```
2. загружаем модель микроконтроллера:
   ```
   machine LoadPlatformDescription @/path/to/uart-demo.repl
   ```
   Файл `uart-demo.repl`. Описывает модель микроконтроллера, эмулируемого с Renode:

   ```repl
   cpu: CPU.RiscV64 @ sysbus
        cpuType: "rv64imac"

   ram: Memory.MappedMemory @ sysbus 0x80000000
        size: 0x10000

   uart: UART.NS16550 @ sysbus 0x10000000
    ```

   Подробней о REPL-файлах можно почитать [здесь](https://renode.readthedocs.io/en/latest/basic/describing_platforms.html#describing-platforms).
   Можно посмотреть получившуюся карту устройств на системной шине командой:

   ```
   peripherals
   ```

   Должно получиться:

   ```text
   Available peripherals:
     sysbus (SystemBus)
     │   
     ├── cpu (RiscV64)
     │       Slot: 0
     │       
     ├── ram (MappedMemory)
     │       <0x80000000, 0x8000FFFF>
     │       
     └── uart (NS16550)
             <0x10000000, 0x100000FF>
   ```
3. Загружаем собранную в пункте 3.2 прошивку, загружаем ее в модель:

   ```
   sysbus LoadELF @/path/to/firmware.elf
   ```
4. Стартуем прошивку
   ```
   start
   ```
5. Запускаем UART-терминал, подключенный к нашей периферии:
   ```
   showAnalyzer uart
   ```
   Откроется новое графическое окно куда прошивка уже должна вывести символ `>`.
   Поскольку в прошивке работает лупбэк, все что вы введете в терминал будет там отображаться.
6. Закрываем графическое окно UART-терминала, гасим машину командой `quit`/`q`.

## 3.4. Robot framework

Данный фреймворк позволяет выполнять действия, выполненные в предыдущем пункте автоматизированно. Для этого описывается файл формата `.robot`. Важно: аргументы команд робота отделяются минимум двумя пробелами (если используется один пробел, то это просто один аргумент в виде строки с пробелами).

```robot
*** Test Cases ***
UART Echo
    Execute Command    mach create
    Execute Command    machine LoadPlatformDescription @${CURDIR}/uart-demo.repl
    Execute Command    sysbus LoadELF @${CURDIR}/firmware.elf

    Create Terminal Tester    sysbus.uart

    Start Emulation

    Wait For Prompt On Uart     >
    Write Line To Uart          Hello  waitForEcho=false
    Wait For Prompt On Uart     Hello
```

- `Execute Command` делает выполняет те же самые команды, что выполнялись в п. 3.3;
- `Create Terminal Tester` создает терминал для робота, а не графическое окно;
- Поскольку прошивка при старте выводит символ `>`, в тест добавляем команду:
  `Wait For Prompt On Uart`. Есть также команда `Wait For Line On Uart`, отличие в том, что она ждет ещё и символы завершения строки `\r\n`, которые наша прошивка не посылает при старте.
- Далее отправляем тестовые строку по UART командой `Write Line To Uart`, по умолчанию, эта же команда настроена на проверку лупбэка и ждет что UART вернёт эту же строку (что нам и надо), но для демонстрации большей части функционала, мы отключаем эту проверку аргументом `waitForEcho=false` (отделённым двумя пробелами!);
- Проверяем лупбэк вручную командой `Wait For Prompt On Uart     Hello`.

Запуск автоматизированного тестирования выполняется командой

```
./renode-test uart_lb_test/uart.robot
```

Если всё сделано правильно, тест завершится успешно с логом:

```
Preparing suites
Will run the following 1 test files:
  - uart_lb_test/uart.robot

Starting suites
Running suite on Renode pid 277711 using port 49152: uart_lb_test/uart.robot
+++++ Starting test 'uart.UART Echo'
+++++ Finished test 'uart.UART Echo' in 0.64 seconds with status OK
Suite uart_lb_test/uart.robot finished successfully in 0.9 seconds.
+++++ Finished suite 1/1
Cleaning up suites
Closing Renode pid 277711
Renode pid 277711 closed
Aggregating all robot results
Output:  /home/hepoh/renode_portable/robot_output.xml
Log:     /home/hepoh/renode_portable/log.html
Report:  /home/hepoh/renode_portable/report.html
Failed robot critical tests:
        1. uart.UART Echo
------
Tests finished successfully :)
```

В папке renode появится файл log.html, где результаты теста будут представлены в виде html-странички.

## 3.5 Binary mode

Текущая проверка работала с ascii-символами, но нам может потребоваться проверка сырых байт (например для выполнения инверсии принятых данных). Это можно реализовать следующим robot-файлом:

```robot
*** Test Cases ***
UART Echo
    Execute Command    mach create
    Execute Command    machine LoadPlatformDescription @${CURDIR}/uart-demo.repl
    Execute Command    sysbus LoadELF @${CURDIR}/firmware.elf

    Create Terminal Tester    sysbus.uart    binaryMode=true

    Start Emulation

    Wait For Bytes On Uart    3E
    Write To Uart    Hello
    Wait For Bytes On Uart    48 65 6C 6C 6F
```

Здесь байты `48 65 6C 6C 6F` — это исходное `Hello` без инверсии, но идея понятна. Важно уточнить, что в binary-мод нельзя пользоваться командами `Wait For Prompt On Uart`/`Wait For Line On Uart`.
