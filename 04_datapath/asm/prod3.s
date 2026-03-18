main:
    li a1 2 # first operand
    li a2 2 # second operand
    addi sp sp -12
    sw ra 0(sp)
    sw a1 4(sp)
    sw a2 8(sp)
    jal ra prod
    lw a2 8(sp)
    lw a1 4(sp)
    lw ra 0(sp)
    addi sp sp 8
    j end

prod:
    addi t0 x0 1
    add a0 x0 x0
    addi sp sp -16
    sw ra 0(sp)
    sw a0 4(sp)
    sw a1 8(sp)
    sw a2 12(sp)
    beq a2 x0 return
    and t1 a2 t0
    bne t1 x0 call
    add a0 a0 a1
call:
    sll a1 a1 t0
    srl a2 a2 t0
    jal ra prod
    lw ra 0(sp)
    lw t2 4(sp)
    lw a1 8(sp)
    lw a2 12(sp)
    addi sp sp 12
    add a0 a0 t2
return:
    lw ra 0(sp)
    lw t2 4(sp)
    lw a1 8(sp)
    lw a2 12(sp)
    addi sp sp 12
    add a0 a0 t2
    ret

end:
