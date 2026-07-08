
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_bss_end>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	00000293          	li	t0,0
  10:	00000313          	li	t1,0

00000014 <_bss_init_loop>:
  14:	00534863          	blt	t1,t0,24 <_irq_config>
  18:	0002a023          	sw	zero,0(t0)
  1c:	00428293          	add	t0,t0,4
  20:	ff5ff06f          	j	14 <_bss_init_loop>

00000024 <_irq_config>:
  24:	05000293          	li	t0,80
  28:	fff00313          	li	t1,-1
  2c:	00000397          	auipc	t2,0x0
  30:	7d438393          	add	t2,t2,2004 # 800 <_gbl_ptr>
  34:	30529073          	csrw	mtvec,t0
  38:	34039073          	csrw	mscratch,t2
  3c:	30431073          	csrw	mie,t1

00000040 <_main_call>:
  40:	00000513          	li	a0,0
  44:	00000593          	li	a1,0
  48:	18c000ef          	jal	1d4 <main>

0000004c <_endless_loop>:
  4c:	0000006f          	j	4c <_endless_loop>

00000050 <_int_handler>:
  50:	34011173          	csrrw	sp,mscratch,sp
  54:	fb010113          	add	sp,sp,-80
  58:	00112223          	sw	ra,4(sp)
  5c:	58000093          	li	ra,1408
  60:	fe1146e3          	blt	sp,ra,4c <_endless_loop>
  64:	00512623          	sw	t0,12(sp)
  68:	00612823          	sw	t1,16(sp)
  6c:	00712a23          	sw	t2,20(sp)
  70:	00a12c23          	sw	a0,24(sp)
  74:	00b12e23          	sw	a1,28(sp)
  78:	02c12023          	sw	a2,32(sp)
  7c:	02d12223          	sw	a3,36(sp)
  80:	02e12423          	sw	a4,40(sp)
  84:	02f12623          	sw	a5,44(sp)
  88:	03012823          	sw	a6,48(sp)
  8c:	03112a23          	sw	a7,52(sp)
  90:	03c12c23          	sw	t3,56(sp)
  94:	03d12e23          	sw	t4,60(sp)
  98:	05e12023          	sw	t5,64(sp)
  9c:	05f12223          	sw	t6,68(sp)
  a0:	340022f3          	csrr	t0,mscratch
  a4:	34102373          	csrr	t1,mepc
  a8:	34202573          	csrr	a0,mcause
  ac:	00512423          	sw	t0,8(sp)
  b0:	04612423          	sw	t1,72(sp)
  b4:	04a12623          	sw	a0,76(sp)
  b8:	068000ef          	jal	120 <int_handler>
  bc:	00010513          	mv	a0,sp
  c0:	04852303          	lw	t1,72(a0)
  c4:	04c52383          	lw	t2,76(a0)
  c8:	05010113          	add	sp,sp,80
  cc:	34011073          	csrw	mscratch,sp
  d0:	34131073          	csrw	mepc,t1
  d4:	34239073          	csrw	mcause,t2
  d8:	00452083          	lw	ra,4(a0)
  dc:	00852103          	lw	sp,8(a0)
  e0:	00c52283          	lw	t0,12(a0)
  e4:	01052303          	lw	t1,16(a0)
  e8:	01452383          	lw	t2,20(a0)
  ec:	01c52583          	lw	a1,28(a0)
  f0:	02052603          	lw	a2,32(a0)
  f4:	02452683          	lw	a3,36(a0)
  f8:	02852703          	lw	a4,40(a0)
  fc:	02c52783          	lw	a5,44(a0)
 100:	03052803          	lw	a6,48(a0)
 104:	03452883          	lw	a7,52(a0)
 108:	03852e03          	lw	t3,56(a0)
 10c:	03c52e83          	lw	t4,60(a0)
 110:	04052f03          	lw	t5,64(a0)
 114:	04452f83          	lw	t6,68(a0)
 118:	01852503          	lw	a0,24(a0)
 11c:	30200073          	mret

00000120 <int_handler>:
 120:	ff010113          	add	sp,sp,-16
 124:	00812623          	sw	s0,12(sp)
 128:	01010413          	add	s0,sp,16
 12c:	00000013          	nop
 130:	00c12403          	lw	s0,12(sp)
 134:	01010113          	add	sp,sp,16
 138:	00008067          	ret

0000013c <uart_send_char>:
 13c:	fe010113          	add	sp,sp,-32
 140:	00812e23          	sw	s0,28(sp)
 144:	02010413          	add	s0,sp,32
 148:	00050793          	mv	a5,a0
 14c:	fef407a3          	sb	a5,-17(s0)
 150:	00000013          	nop
 154:	060007b7          	lui	a5,0x6000
 158:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 15c:	fe079ce3          	bnez	a5,154 <uart_send_char+0x18>
 160:	060007b7          	lui	a5,0x6000
 164:	fef44703          	lbu	a4,-17(s0)
 168:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 16c:	00000013          	nop
 170:	060007b7          	lui	a5,0x6000
 174:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 178:	fe079ce3          	bnez	a5,170 <uart_send_char+0x34>
 17c:	00000013          	nop
 180:	00000013          	nop
 184:	01c12403          	lw	s0,28(sp)
 188:	02010113          	add	sp,sp,32
 18c:	00008067          	ret

00000190 <uart_init>:
 190:	ff010113          	add	sp,sp,-16
 194:	00812623          	sw	s0,12(sp)
 198:	01010413          	add	s0,sp,16
 19c:	060007b7          	lui	a5,0x6000
 1a0:	0001c737          	lui	a4,0x1c
 1a4:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 1a8:	00e7a623          	sw	a4,12(a5) # 600000c <_gbl_ptr+0x5fff80c>
 1ac:	060007b7          	lui	a5,0x6000
 1b0:	00100713          	li	a4,1
 1b4:	00e7a823          	sw	a4,16(a5) # 6000010 <_gbl_ptr+0x5fff810>
 1b8:	060007b7          	lui	a5,0x6000
 1bc:	00100713          	li	a4,1
 1c0:	00e7aa23          	sw	a4,20(a5) # 6000014 <_gbl_ptr+0x5fff814>
 1c4:	00000013          	nop
 1c8:	00c12403          	lw	s0,12(sp)
 1cc:	01010113          	add	sp,sp,16
 1d0:	00008067          	ret

000001d4 <main>:
 1d4:	fd010113          	add	sp,sp,-48
 1d8:	02112623          	sw	ra,44(sp)
 1dc:	02812423          	sw	s0,40(sp)
 1e0:	03010413          	add	s0,sp,48
 1e4:	fadff0ef          	jal	190 <uart_init>
 1e8:	6c6c67b7          	lui	a5,0x6c6c6
 1ec:	56878793          	add	a5,a5,1384 # 6c6c6568 <_gbl_ptr+0x6c6c5d68>
 1f0:	fcf42e23          	sw	a5,-36(s0)
 1f4:	772037b7          	lui	a5,0x77203
 1f8:	c6f78793          	add	a5,a5,-913 # 77202c6f <_gbl_ptr+0x7720246f>
 1fc:	fef42023          	sw	a5,-32(s0)
 200:	646c77b7          	lui	a5,0x646c7
 204:	26f78793          	add	a5,a5,623 # 646c726f <_gbl_ptr+0x646c6a6f>
 208:	fef42223          	sw	a5,-28(s0)
 20c:	fe040423          	sb	zero,-24(s0)
 210:	fe042623          	sw	zero,-20(s0)
 214:	0280006f          	j	23c <main+0x68>
 218:	fec42783          	lw	a5,-20(s0)
 21c:	ff078793          	add	a5,a5,-16
 220:	008787b3          	add	a5,a5,s0
 224:	fec7c783          	lbu	a5,-20(a5)
 228:	00078513          	mv	a0,a5
 22c:	f11ff0ef          	jal	13c <uart_send_char>
 230:	fec42783          	lw	a5,-20(s0)
 234:	00178793          	add	a5,a5,1
 238:	fef42623          	sw	a5,-20(s0)
 23c:	fec42703          	lw	a4,-20(s0)
 240:	00c00793          	li	a5,12
 244:	fce7fae3          	bgeu	a5,a4,218 <main+0x44>
 248:	00000793          	li	a5,0
 24c:	00078513          	mv	a0,a5
 250:	02c12083          	lw	ra,44(sp)
 254:	02812403          	lw	s0,40(sp)
 258:	03010113          	add	sp,sp,48
 25c:	00008067          	ret

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	5078                	.insn	2, 0x5078
   8:	6361                	.insn	2, 0x6361
   a:	4e47206b          	.insn	4, 0x4e47206b
   e:	2055                	.insn	2, 0x2055
  10:	4952                	.insn	2, 0x4952
  12:	562d4353          	.insn	4, 0x562d4353
  16:	4520                	.insn	2, 0x4520
  18:	626d                	.insn	2, 0x626d
  1a:	6465                	.insn	2, 0x6465
  1c:	6564                	.insn	2, 0x6564
  1e:	2064                	.insn	2, 0x2064
  20:	20434347          	.insn	4, 0x20434347
  24:	3878                	.insn	2, 0x3878
  26:	5f36                	.insn	2, 0x5f36
  28:	3436                	.insn	2, 0x3436
  2a:	2029                	.insn	2, 0x2029
  2c:	3331                	.insn	2, 0x3331
  2e:	322e                	.insn	2, 0x322e
  30:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2841                	.insn	2, 0x2841
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_bss_init_loop>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <_stack_size+0xc4>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

