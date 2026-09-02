CC_PATH = ~/verilog/riscv_cc/bin
CC_PREFIX = riscv-none-elf

CC      =   $(CC_PATH)/$(CC_PREFIX)-gcc
OBJDUMP =   $(CC_PATH)/$(CC_PREFIX)-objdump
OBJCOPY =   $(CC_PATH)/$(CC_PREFIX)-objcopy
SIZE    =   $(CC_PATH)/$(CC_PREFIX)-size

OBJS = src/startup.o src/main.o

LINK_SCRIPT = src/linker_script.ld
OUTPUT      = rx_tx_test
OUTPUT_PROD = $(addprefix $(OUTPUT), .mem _instr.mem _data.mem .elf _disasm.S)

INC_DIRS    = $(addprefix "-I", ./inc/ ../snake/inc)
CC_FLAGS    = -march=rv32i_zicsr -mabi=ilp32 $(INC_DIRS)
LD_FLAGS    = -Wl,--gc-sections -nostartfiles -T $(LINK_SCRIPT)

.PHONY: all clean size harvard princeton

all: clean harvard

harvard: $(OUTPUT).elf $(OUTPUT)_disasm.S size
# $< означает "первая зависимость"
	${OBJCOPY} -O verilog --verilog-data-width=4 -j .data -j .sdata -j .bss $< $(OUTPUT)_data.mem
	${OBJCOPY} -O verilog --verilog-data-width=4 -j .text $< $(OUTPUT)_instr.mem

princeton: $(OUTPUT).elf $(OUTPUT)_disasm.S size
	${OBJCOPY} -O verilog --verilog-data-width=4 --remove-section=.comment $< $(OUTPUT).mem

$(OUTPUT).elf: $(OBJS)
# $^ Означает "все зависимости".
	${CC} $^ $(CC_FLAGS) $(LD_FLAGS) -o $(OUTPUT).elf

$(OUTPUT)_disasm.S: $(OUTPUT).elf
# $< означает "первая зависимость", $@ — "цель рецепта".
	${OBJDUMP} -D $< > $@


# Шаблонные рецепты (см. https://web.mit.edu/gnu/doc/html/make_10.html#SEC91)
# Здесь говорится как создать объектные файлы из одноименных исходников
%.o:	%.S
	${CC} -c $(CC_DEFINES) $(CC_FLAGS) $^ -o $@

%.o:	%.c
	${CC} -c $(CC_DEFINES) $(CC_FLAGS) $^ -o $@

%.o:	%.cpp
	${CC} -c $(CC_DEFINES) $(CC_FLAGS) $^ -o $@

size: $(OUTPUT).elf
# $< означает "первая зависимость"
	$(SIZE) $<

clean:
	rm -f $(OUTPUT_PROD) $(OBJS)
