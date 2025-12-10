
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	0c400293          	li	t0,196
  10:	0c800313          	li	t1,200

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
  48:	2dc000ef          	jal	324 <main>

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
 12c:	030007b7          	lui	a5,0x3000
 130:	0007a703          	lw	a4,0(a5) # 3000000 <_gbl_ptr+0x2fff800>
 134:	0ce02223          	sw	a4,196(zero) # c4 <sc>
 138:	00000013          	nop
 13c:	00c12403          	lw	s0,12(sp)
 140:	01010113          	add	sp,sp,16
 144:	00008067          	ret

00000148 <scan>:
 148:	fe010113          	add	sp,sp,-32
 14c:	00812e23          	sw	s0,28(sp)
 150:	02010413          	add	s0,sp,32
 154:	fea42623          	sw	a0,-20(s0)
 158:	0c002223          	sw	zero,196(zero) # c4 <sc>
 15c:	00000013          	nop
 160:	0c402783          	lw	a5,196(zero) # c4 <sc>
 164:	fe078ee3          	beqz	a5,160 <scan+0x18>
 168:	00000013          	nop
 16c:	0c402703          	lw	a4,196(zero) # c4 <sc>
 170:	0f000793          	li	a5,240
 174:	fef71ce3          	bne	a4,a5,16c <scan+0x24>
 178:	00000013          	nop
 17c:	0c402703          	lw	a4,196(zero) # c4 <sc>
 180:	0f000793          	li	a5,240
 184:	fef70ce3          	beq	a4,a5,17c <scan+0x34>
 188:	0c402703          	lw	a4,196(zero) # c4 <sc>
 18c:	05a00793          	li	a5,90
 190:	00f71663          	bne	a4,a5,19c <scan+0x54>
 194:	00100793          	li	a5,1
 198:	0fc0006f          	j	294 <_stack_size+0x14>
 19c:	0c402703          	lw	a4,196(zero) # c4 <sc>
 1a0:	07600793          	li	a5,118
 1a4:	00f71663          	bne	a4,a5,1b0 <scan+0x68>
 1a8:	00200793          	li	a5,2
 1ac:	0e80006f          	j	294 <_stack_size+0x14>
 1b0:	0c402783          	lw	a5,196(zero) # c4 <sc>
 1b4:	fea78793          	add	a5,a5,-22
 1b8:	03000713          	li	a4,48
 1bc:	0cf76a63          	bltu	a4,a5,290 <_stack_size+0x10>
 1c0:	00279713          	sll	a4,a5,0x2
 1c4:	00000793          	li	a5,0
 1c8:	00f707b3          	add	a5,a4,a5
 1cc:	0007a783          	lw	a5,0(a5)
 1d0:	00078067          	jr	a5
 1d4:	fec42783          	lw	a5,-20(s0)
 1d8:	0007a023          	sw	zero,0(a5)
 1dc:	fec42783          	lw	a5,-20(s0)
 1e0:	00100713          	li	a4,1
 1e4:	00e7a023          	sw	a4,0(a5)
 1e8:	fec42783          	lw	a5,-20(s0)
 1ec:	00200713          	li	a4,2
 1f0:	00e7a023          	sw	a4,0(a5)
 1f4:	fec42783          	lw	a5,-20(s0)
 1f8:	00300713          	li	a4,3
 1fc:	00e7a023          	sw	a4,0(a5)
 200:	fec42783          	lw	a5,-20(s0)
 204:	00400713          	li	a4,4
 208:	00e7a023          	sw	a4,0(a5)
 20c:	fec42783          	lw	a5,-20(s0)
 210:	00500713          	li	a4,5
 214:	00e7a023          	sw	a4,0(a5)
 218:	fec42783          	lw	a5,-20(s0)
 21c:	00600713          	li	a4,6
 220:	00e7a023          	sw	a4,0(a5)
 224:	fec42783          	lw	a5,-20(s0)
 228:	00700713          	li	a4,7
 22c:	00e7a023          	sw	a4,0(a5)
 230:	fec42783          	lw	a5,-20(s0)
 234:	00800713          	li	a4,8
 238:	00e7a023          	sw	a4,0(a5)
 23c:	fec42783          	lw	a5,-20(s0)
 240:	00900713          	li	a4,9
 244:	00e7a023          	sw	a4,0(a5)
 248:	fec42783          	lw	a5,-20(s0)
 24c:	00a00713          	li	a4,10
 250:	00e7a023          	sw	a4,0(a5)
 254:	fec42783          	lw	a5,-20(s0)
 258:	00b00713          	li	a4,11
 25c:	00e7a023          	sw	a4,0(a5)
 260:	fec42783          	lw	a5,-20(s0)
 264:	00c00713          	li	a4,12
 268:	00e7a023          	sw	a4,0(a5)
 26c:	fec42783          	lw	a5,-20(s0)
 270:	00d00713          	li	a4,13
 274:	00e7a023          	sw	a4,0(a5)
 278:	fec42783          	lw	a5,-20(s0)
 27c:	00e00713          	li	a4,14
 280:	00e7a023          	sw	a4,0(a5)
 284:	fec42783          	lw	a5,-20(s0)
 288:	00f00713          	li	a4,15
 28c:	00e7a023          	sw	a4,0(a5)
 290:	00000793          	li	a5,0
 294:	00078513          	mv	a0,a5
 298:	01c12403          	lw	s0,28(sp)
 29c:	02010113          	add	sp,sp,32
 2a0:	00008067          	ret

000002a4 <print>:
 2a4:	fe010113          	add	sp,sp,-32
 2a8:	00812e23          	sw	s0,28(sp)
 2ac:	02010413          	add	s0,sp,32
 2b0:	fea42623          	sw	a0,-20(s0)
 2b4:	feb42423          	sw	a1,-24(s0)
 2b8:	fe842783          	lw	a5,-24(s0)
 2bc:	00079a63          	bnez	a5,2d0 <print+0x2c>
 2c0:	040007b7          	lui	a5,0x4000
 2c4:	fec42703          	lw	a4,-20(s0)
 2c8:	00072703          	lw	a4,0(a4)
 2cc:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 2d0:	fe842703          	lw	a4,-24(s0)
 2d4:	00100793          	li	a5,1
 2d8:	00f71a63          	bne	a4,a5,2ec <print+0x48>
 2dc:	040007b7          	lui	a5,0x4000
 2e0:	fec42703          	lw	a4,-20(s0)
 2e4:	00072703          	lw	a4,0(a4)
 2e8:	00e7a223          	sw	a4,4(a5) # 4000004 <_gbl_ptr+0x3fff804>
 2ec:	040007b7          	lui	a5,0x4000
 2f0:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 2f4:	040007b7          	lui	a5,0x4000
 2f8:	00171713          	sll	a4,a4,0x1
 2fc:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 300:	040007b7          	lui	a5,0x4000
 304:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 308:	040007b7          	lui	a5,0x4000
 30c:	00170713          	add	a4,a4,1
 310:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 314:	00000013          	nop
 318:	01c12403          	lw	s0,28(sp)
 31c:	02010113          	add	sp,sp,32
 320:	00008067          	ret

00000324 <main>:
 324:	fe010113          	add	sp,sp,-32
 328:	00112e23          	sw	ra,28(sp)
 32c:	00812c23          	sw	s0,24(sp)
 330:	02010413          	add	s0,sp,32
 334:	fe042423          	sw	zero,-24(s0)
 338:	fe042623          	sw	zero,-20(s0)
 33c:	0240006f          	j	360 <main+0x3c>
 340:	fec42703          	lw	a4,-20(s0)
 344:	fe840793          	add	a5,s0,-24
 348:	00070593          	mv	a1,a4
 34c:	00078513          	mv	a0,a5
 350:	f55ff0ef          	jal	2a4 <print>
 354:	fec42783          	lw	a5,-20(s0)
 358:	00178793          	add	a5,a5,1
 35c:	fef42623          	sw	a5,-20(s0)
 360:	fe840793          	add	a5,s0,-24
 364:	00078513          	mv	a0,a5
 368:	de1ff0ef          	jal	148 <scan>
 36c:	00050793          	mv	a5,a0
 370:	fcf058e3          	blez	a5,340 <main+0x1c>
 374:	00000793          	li	a5,0
 378:	00078513          	mv	a0,a5
 37c:	01c12083          	lw	ra,28(sp)
 380:	01812403          	lw	s0,24(sp)
 384:	02010113          	add	sp,sp,32
 388:	00008067          	ret

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	01dc                	.insn	2, 0x01dc
   2:	0000                	.insn	2, 0x
   4:	0290                	.insn	2, 0x0290
   6:	0000                	.insn	2, 0x
   8:	0290                	.insn	2, 0x0290
   a:	0000                	.insn	2, 0x
   c:	0290                	.insn	2, 0x0290
   e:	0000                	.insn	2, 0x
  10:	0290                	.insn	2, 0x0290
  12:	0000                	.insn	2, 0x
  14:	0290                	.insn	2, 0x0290
  16:	0000                	.insn	2, 0x
  18:	0248                	.insn	2, 0x0248
  1a:	0000                	.insn	2, 0x
  1c:	0290                	.insn	2, 0x0290
  1e:	0000                	.insn	2, 0x
  20:	01e8                	.insn	2, 0x01e8
  22:	0000                	.insn	2, 0x
  24:	0290                	.insn	2, 0x0290
  26:	0000                	.insn	2, 0x
  28:	0290                	.insn	2, 0x0290
  2a:	0000                	.insn	2, 0x
  2c:	0260                	.insn	2, 0x0260
  2e:	0000                	.insn	2, 0x
  30:	0290                	.insn	2, 0x0290
  32:	0000                	.insn	2, 0x
  34:	026c                	.insn	2, 0x026c
  36:	0000                	.insn	2, 0x
  38:	0278                	.insn	2, 0x0278
  3a:	0000                	.insn	2, 0x
  3c:	0200                	.insn	2, 0x0200
  3e:	0000                	.insn	2, 0x
  40:	01f4                	.insn	2, 0x01f4
  42:	0000                	.insn	2, 0x
  44:	0290                	.insn	2, 0x0290
  46:	0000                	.insn	2, 0x
  48:	0290                	.insn	2, 0x0290
  4a:	0000                	.insn	2, 0x
  4c:	0290                	.insn	2, 0x0290
  4e:	0000                	.insn	2, 0x
  50:	0290                	.insn	2, 0x0290
  52:	0000                	.insn	2, 0x
  54:	0284                	.insn	2, 0x0284
  56:	0000                	.insn	2, 0x
  58:	0290                	.insn	2, 0x0290
  5a:	0000                	.insn	2, 0x
  5c:	0290                	.insn	2, 0x0290
  5e:	0000                	.insn	2, 0x
  60:	020c                	.insn	2, 0x020c
  62:	0000                	.insn	2, 0x
  64:	0290                	.insn	2, 0x0290
  66:	0000                	.insn	2, 0x
  68:	0290                	.insn	2, 0x0290
  6a:	0000                	.insn	2, 0x
  6c:	0290                	.insn	2, 0x0290
  6e:	0000                	.insn	2, 0x
  70:	0254                	.insn	2, 0x0254
  72:	0000                	.insn	2, 0x
  74:	0290                	.insn	2, 0x0290
  76:	0000                	.insn	2, 0x
  78:	0290                	.insn	2, 0x0290
  7a:	0000                	.insn	2, 0x
  7c:	0290                	.insn	2, 0x0290
  7e:	0000                	.insn	2, 0x
  80:	0218                	.insn	2, 0x0218
  82:	0000                	.insn	2, 0x
  84:	0290                	.insn	2, 0x0290
  86:	0000                	.insn	2, 0x
  88:	0290                	.insn	2, 0x0290
  8a:	0000                	.insn	2, 0x
  8c:	0290                	.insn	2, 0x0290
  8e:	0000                	.insn	2, 0x
  90:	0290                	.insn	2, 0x0290
  92:	0000                	.insn	2, 0x
  94:	0290                	.insn	2, 0x0290
  96:	0000                	.insn	2, 0x
  98:	0290                	.insn	2, 0x0290
  9a:	0000                	.insn	2, 0x
  9c:	0224                	.insn	2, 0x0224
  9e:	0000                	.insn	2, 0x
  a0:	0230                	.insn	2, 0x0230
  a2:	0000                	.insn	2, 0x
  a4:	0290                	.insn	2, 0x0290
  a6:	0000                	.insn	2, 0x
  a8:	0290                	.insn	2, 0x0290
  aa:	0000                	.insn	2, 0x
  ac:	0290                	.insn	2, 0x0290
  ae:	0000                	.insn	2, 0x
  b0:	0290                	.insn	2, 0x0290
  b2:	0000                	.insn	2, 0x
  b4:	0290                	.insn	2, 0x0290
  b6:	0000                	.insn	2, 0x
  b8:	0290                	.insn	2, 0x0290
  ba:	0000                	.insn	2, 0x
  bc:	01d4                	.insn	2, 0x01d4
  be:	0000                	.insn	2, 0x
  c0:	023c                	.insn	2, 0x023c
	...

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
  1e:	32727363          	bgeu	tp,t2,344 <main+0x20>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

