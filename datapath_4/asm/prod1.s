	li x1 0 # result
	li x2 -23213 # first operand (sw_i)
	li x3 1 # 1 constant for shifting and last bit checking
	li x4 203 # second operand (a)

loop:
	and x5 x2 x3
    beq x5 x0 no_add
    add x1 x1 x4
no_add:
	sll x4 x4 x3
    srl x2 x2 x3
    bne x2 x0 loop
