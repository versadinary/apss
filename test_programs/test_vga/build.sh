#!/bin/bash

~/verilog/riscv_cc/bin/riscv-none-elf-gcc -c -march=rv32i_zicsr -mabi=ilp32 main.c -o main.o &&

~/verilog/riscv_cc/bin/riscv-none-elf-gcc -c -march=rv32i_zicsr -mabi=ilp32 startup.S -o startup.o &&

~/verilog/riscv_cc/bin/riscv-none-elf-gcc -march=rv32i_zicsr -mabi=ilp32 -Wl,--gc-sections -nostartfiles -T linker_script.ld startup.o main.o -o result.elf &&

~/verilog/riscv_cc/bin/riscv-none-elf-objcopy -O verilog --verilog-data-width=4 -j .text result.elf init_instr.mem && 

~/verilog/riscv_cc/bin/riscv-none-elf-objcopy -O verilog --verilog-data-width=4 -j .data -j .bss -j .sdata result.elf init_data.mem &&

~/verilog/riscv_cc/bin/riscv-none-elf-objdump -D result.elf > disasm.S

~/verilog/riscv_cc/bin/riscv-none-elf-size result.elf