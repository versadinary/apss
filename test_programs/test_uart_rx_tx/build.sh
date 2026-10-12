#!/bin/bash
COMPILER_DIR=$HOME/verilog/riscv_cc/bin

$COMPILER_DIR/riscv-none-elf-gcc -c -march=rv32i_zicsr -mabi=ilp32 main.c -o main.o &&

$COMPILER_DIR/riscv-none-elf-gcc -march=rv32i_zicsr -mabi=ilp32 -Wl,--gc-sections -nostartfiles -T linker_script.ld startup.o main.o -o result.elf &&

$COMPILER_DIR/riscv-none-elf-objcopy -O verilog --verilog-data-width=4 -j .text result.elf init_instr.mem && 

$COMPILER_DIR/riscv-none-elf-objcopy -O verilog --verilog-data-width=4 -j .data -j .bss -j .sdata result.elf init_data.mem &&

$COMPILER_DIR/riscv-none-elf-objdump -D result.elf > disasm.S
