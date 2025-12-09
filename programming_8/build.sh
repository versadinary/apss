#!/bin/bash

~/riscv_cc/bin/riscv-none-elf-gcc -c -march=rv32i_zicsr -mabi=ilp32 main.c -o main.o &&

~/riscv_cc/bin/riscv-none-elf-gcc -march=rv32i_zicsr -mabi=ilp32 -Wl,--gc-sections -nostartfiles -T linker_script.ld startup.o main.o -o result.elf &&

~/riscv_cc/bin/riscv-none-elf-objcopy -O verilog -j .text result.elf init_instr.mem && 

~/riscv_cc/bin/riscv-none-elf-objcopy -O verilog -j .data -j .bss -j .sdata result.elf init_data.mem &&

~/riscv_cc/bin/riscv-none-elf-objdump -D result.elf > disasm.S
