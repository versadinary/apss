main:
    li a1 -32768 # first operand
    li a2 29900 # second operand
    addi sp sp -8
    sw a1 0(sp)
    sw a2 4(sp)
    jal ra prod
    lw a2 4(sp)
    lw a1 0(sp)
    addi sp sp 8
    j end

prod:
    add a0 x0 x0
    addi t0 x0 1
loop:
    and t1 a2 t0
    beq t1 x0 no_add
    add a0 a0 a1
no_add:
    sll a1 a1 t0
    srl a2 a2 t0
    bne a2 x0 loop
    ret

end:
