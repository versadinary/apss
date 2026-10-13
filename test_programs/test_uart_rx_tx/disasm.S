
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	18000113          	li	sp,384
   c:	00000293          	li	t0,0
  10:	00800313          	li	t1,8

00000014 <_bss_init_loop>:
  14:	00534863          	blt	t1,t0,24 <_irq_config>
  18:	0002a023          	sw	zero,0(t0)
  1c:	00428293          	add	t0,t0,4
  20:	ff5ff06f          	j	14 <_bss_init_loop>

00000024 <_irq_config>:
  24:	04c00293          	li	t0,76
  28:	fff00313          	li	t1,-1
  2c:	40000393          	li	t2,1024
  30:	30529073          	csrw	mtvec,t0
  34:	34039073          	csrw	mscratch,t2
  38:	30431073          	csrw	mie,t1

0000003c <_main_call>:
  3c:	00000513          	li	a0,0
  40:	00000593          	li	a1,0
  44:	4b0000ef          	jal	4f4 <main>

00000048 <_endless_loop>:
  48:	0000006f          	j	48 <_endless_loop>

0000004c <_int_handler>:
  4c:	34011173          	csrrw	sp,mscratch,sp
  50:	fb010113          	add	sp,sp,-80
  54:	00112223          	sw	ra,4(sp)
  58:	18000093          	li	ra,384
  5c:	fe1146e3          	blt	sp,ra,48 <_endless_loop>
  60:	00512623          	sw	t0,12(sp)
  64:	00612823          	sw	t1,16(sp)
  68:	00712a23          	sw	t2,20(sp)
  6c:	00a12c23          	sw	a0,24(sp)
  70:	00b12e23          	sw	a1,28(sp)
  74:	02c12023          	sw	a2,32(sp)
  78:	02d12223          	sw	a3,36(sp)
  7c:	02e12423          	sw	a4,40(sp)
  80:	02f12623          	sw	a5,44(sp)
  84:	03012823          	sw	a6,48(sp)
  88:	03112a23          	sw	a7,52(sp)
  8c:	03c12c23          	sw	t3,56(sp)
  90:	03d12e23          	sw	t4,60(sp)
  94:	05e12023          	sw	t5,64(sp)
  98:	05f12223          	sw	t6,68(sp)
  9c:	340022f3          	csrr	t0,mscratch
  a0:	34102373          	csrr	t1,mepc
  a4:	34202573          	csrr	a0,mcause
  a8:	00512423          	sw	t0,8(sp)
  ac:	04612423          	sw	t1,72(sp)
  b0:	04a12623          	sw	a0,76(sp)
  b4:	068000ef          	jal	11c <int_handler>
  b8:	00010513          	mv	a0,sp
  bc:	04852303          	lw	t1,72(a0)
  c0:	04c52383          	lw	t2,76(a0)
  c4:	05010113          	add	sp,sp,80
  c8:	34011073          	csrw	mscratch,sp
  cc:	34131073          	csrw	mepc,t1
  d0:	34239073          	csrw	mcause,t2
  d4:	00452083          	lw	ra,4(a0)
  d8:	00852103          	lw	sp,8(a0)
  dc:	00c52283          	lw	t0,12(a0)
  e0:	01052303          	lw	t1,16(a0)
  e4:	01452383          	lw	t2,20(a0)
  e8:	01c52583          	lw	a1,28(a0)
  ec:	02052603          	lw	a2,32(a0)
  f0:	02452683          	lw	a3,36(a0)
  f4:	02852703          	lw	a4,40(a0)
  f8:	02c52783          	lw	a5,44(a0)
  fc:	03052803          	lw	a6,48(a0)
 100:	03452883          	lw	a7,52(a0)
 104:	03852e03          	lw	t3,56(a0)
 108:	03c52e83          	lw	t4,60(a0)
 10c:	04052f03          	lw	t5,64(a0)
 110:	04452f83          	lw	t6,68(a0)
 114:	01852503          	lw	a0,24(a0)
 118:	30200073          	mret

0000011c <int_handler>:
 11c:	fe010113          	add	sp,sp,-32
 120:	00812e23          	sw	s0,28(sp)
 124:	02010413          	add	s0,sp,32
 128:	050007b7          	lui	a5,0x5000
 12c:	fef42623          	sw	a5,-20(s0)
 130:	00000013          	nop
 134:	fec42783          	lw	a5,-20(s0)
 138:	00878793          	add	a5,a5,8 # 5000008 <_gbl_ptr+0x4fff808>
 13c:	0007a783          	lw	a5,0(a5)
 140:	fe079ae3          	bnez	a5,134 <int_handler+0x18>
 144:	fec42783          	lw	a5,-20(s0)
 148:	0007a783          	lw	a5,0(a5)
 14c:	0ff7f713          	zext.b	a4,a5
 150:	00e00023          	sb	a4,0(zero) # 0 <_start>
 154:	00000013          	nop
 158:	01c12403          	lw	s0,28(sp)
 15c:	02010113          	add	sp,sp,32
 160:	00008067          	ret

00000164 <init_uart_rx>:
 164:	fe010113          	add	sp,sp,-32
 168:	00812e23          	sw	s0,28(sp)
 16c:	02010413          	add	s0,sp,32
 170:	050007b7          	lui	a5,0x5000
 174:	fef42623          	sw	a5,-20(s0)
 178:	fec42783          	lw	a5,-20(s0)
 17c:	00c78793          	add	a5,a5,12 # 500000c <_gbl_ptr+0x4fff80c>
 180:	0001c737          	lui	a4,0x1c
 184:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 188:	00e7a023          	sw	a4,0(a5)
 18c:	fec42783          	lw	a5,-20(s0)
 190:	01078793          	add	a5,a5,16
 194:	00100713          	li	a4,1
 198:	00e7a023          	sw	a4,0(a5)
 19c:	fec42783          	lw	a5,-20(s0)
 1a0:	01478793          	add	a5,a5,20
 1a4:	00100713          	li	a4,1
 1a8:	00e7a023          	sw	a4,0(a5)
 1ac:	00000013          	nop
 1b0:	01c12403          	lw	s0,28(sp)
 1b4:	02010113          	add	sp,sp,32
 1b8:	00008067          	ret

000001bc <init_uart_tx>:
 1bc:	fe010113          	add	sp,sp,-32
 1c0:	00812e23          	sw	s0,28(sp)
 1c4:	02010413          	add	s0,sp,32
 1c8:	060007b7          	lui	a5,0x6000
 1cc:	fef42623          	sw	a5,-20(s0)
 1d0:	fec42783          	lw	a5,-20(s0)
 1d4:	00c78793          	add	a5,a5,12 # 600000c <_gbl_ptr+0x5fff80c>
 1d8:	0001c737          	lui	a4,0x1c
 1dc:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 1e0:	00e7a023          	sw	a4,0(a5)
 1e4:	fec42783          	lw	a5,-20(s0)
 1e8:	01078793          	add	a5,a5,16
 1ec:	00100713          	li	a4,1
 1f0:	00e7a023          	sw	a4,0(a5)
 1f4:	fec42783          	lw	a5,-20(s0)
 1f8:	01478793          	add	a5,a5,20
 1fc:	00100713          	li	a4,1
 200:	00e7a023          	sw	a4,0(a5)
 204:	00000013          	nop
 208:	01c12403          	lw	s0,28(sp)
 20c:	02010113          	add	sp,sp,32
 210:	00008067          	ret

00000214 <uart_send_char>:
 214:	fd010113          	add	sp,sp,-48
 218:	02812623          	sw	s0,44(sp)
 21c:	03010413          	add	s0,sp,48
 220:	00050793          	mv	a5,a0
 224:	fcf40fa3          	sb	a5,-33(s0)
 228:	060007b7          	lui	a5,0x6000
 22c:	fef42623          	sw	a5,-20(s0)
 230:	fdf44703          	lbu	a4,-33(s0)
 234:	fec42783          	lw	a5,-20(s0)
 238:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 23c:	00000013          	nop
 240:	02c12403          	lw	s0,44(sp)
 244:	03010113          	add	sp,sp,48
 248:	00008067          	ret

0000024c <full_read_tx>:
 24c:	fe010113          	add	sp,sp,-32
 250:	00112e23          	sw	ra,28(sp)
 254:	00812c23          	sw	s0,24(sp)
 258:	02010413          	add	s0,sp,32
 25c:	060007b7          	lui	a5,0x6000
 260:	0007a703          	lw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 264:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 268:	fe042623          	sw	zero,-20(s0)
 26c:	02c0006f          	j	298 <_stack_size+0x18>
 270:	00402703          	lw	a4,4(zero) # 4 <read_data>
 274:	fec42783          	lw	a5,-20(s0)
 278:	00279793          	sll	a5,a5,0x2
 27c:	00f757b3          	srl	a5,a4,a5
 280:	0ff7f793          	zext.b	a5,a5
 284:	00078513          	mv	a0,a5
 288:	f8dff0ef          	jal	214 <uart_send_char>
 28c:	fec42783          	lw	a5,-20(s0)
 290:	00178793          	add	a5,a5,1
 294:	fef42623          	sw	a5,-20(s0)
 298:	fec42703          	lw	a4,-20(s0)
 29c:	00200793          	li	a5,2
 2a0:	fce7d8e3          	bge	a5,a4,270 <full_read_tx+0x24>
 2a4:	060007b7          	lui	a5,0x6000
 2a8:	00c78793          	add	a5,a5,12 # 600000c <_gbl_ptr+0x5fff80c>
 2ac:	0007a703          	lw	a4,0(a5)
 2b0:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 2b4:	fe042423          	sw	zero,-24(s0)
 2b8:	02c0006f          	j	2e4 <_stack_size+0x64>
 2bc:	00402703          	lw	a4,4(zero) # 4 <read_data>
 2c0:	fe842783          	lw	a5,-24(s0)
 2c4:	00279793          	sll	a5,a5,0x2
 2c8:	00f757b3          	srl	a5,a4,a5
 2cc:	0ff7f793          	zext.b	a5,a5
 2d0:	00078513          	mv	a0,a5
 2d4:	f41ff0ef          	jal	214 <uart_send_char>
 2d8:	fe842783          	lw	a5,-24(s0)
 2dc:	00178793          	add	a5,a5,1
 2e0:	fef42423          	sw	a5,-24(s0)
 2e4:	fe842703          	lw	a4,-24(s0)
 2e8:	00200793          	li	a5,2
 2ec:	fce7d8e3          	bge	a5,a4,2bc <_stack_size+0x3c>
 2f0:	060007b7          	lui	a5,0x6000
 2f4:	01078793          	add	a5,a5,16 # 6000010 <_gbl_ptr+0x5fff810>
 2f8:	0007a703          	lw	a4,0(a5)
 2fc:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 300:	fe042223          	sw	zero,-28(s0)
 304:	02c0006f          	j	330 <_stack_size+0xb0>
 308:	00402703          	lw	a4,4(zero) # 4 <read_data>
 30c:	fe442783          	lw	a5,-28(s0)
 310:	00279793          	sll	a5,a5,0x2
 314:	00f757b3          	srl	a5,a4,a5
 318:	0ff7f793          	zext.b	a5,a5
 31c:	00078513          	mv	a0,a5
 320:	ef5ff0ef          	jal	214 <uart_send_char>
 324:	fe442783          	lw	a5,-28(s0)
 328:	00178793          	add	a5,a5,1
 32c:	fef42223          	sw	a5,-28(s0)
 330:	fe442703          	lw	a4,-28(s0)
 334:	00200793          	li	a5,2
 338:	fce7d8e3          	bge	a5,a4,308 <_stack_size+0x88>
 33c:	060007b7          	lui	a5,0x6000
 340:	01478793          	add	a5,a5,20 # 6000014 <_gbl_ptr+0x5fff814>
 344:	0007a703          	lw	a4,0(a5)
 348:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 34c:	fe042023          	sw	zero,-32(s0)
 350:	02c0006f          	j	37c <_stack_size+0xfc>
 354:	00402703          	lw	a4,4(zero) # 4 <read_data>
 358:	fe042783          	lw	a5,-32(s0)
 35c:	00279793          	sll	a5,a5,0x2
 360:	00f757b3          	srl	a5,a4,a5
 364:	0ff7f793          	zext.b	a5,a5
 368:	00078513          	mv	a0,a5
 36c:	ea9ff0ef          	jal	214 <uart_send_char>
 370:	fe042783          	lw	a5,-32(s0)
 374:	00178793          	add	a5,a5,1
 378:	fef42023          	sw	a5,-32(s0)
 37c:	fe042703          	lw	a4,-32(s0)
 380:	00200793          	li	a5,2
 384:	fce7d8e3          	bge	a5,a4,354 <_stack_size+0xd4>
 388:	00000013          	nop
 38c:	00000013          	nop
 390:	01c12083          	lw	ra,28(sp)
 394:	01812403          	lw	s0,24(sp)
 398:	02010113          	add	sp,sp,32
 39c:	00008067          	ret

000003a0 <full_read_rx>:
 3a0:	fe010113          	add	sp,sp,-32
 3a4:	00112e23          	sw	ra,28(sp)
 3a8:	00812c23          	sw	s0,24(sp)
 3ac:	02010413          	add	s0,sp,32
 3b0:	050007b7          	lui	a5,0x5000
 3b4:	0007a703          	lw	a4,0(a5) # 5000000 <_gbl_ptr+0x4fff800>
 3b8:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 3bc:	fe042623          	sw	zero,-20(s0)
 3c0:	02c0006f          	j	3ec <full_read_rx+0x4c>
 3c4:	00402703          	lw	a4,4(zero) # 4 <read_data>
 3c8:	fec42783          	lw	a5,-20(s0)
 3cc:	00279793          	sll	a5,a5,0x2
 3d0:	00f757b3          	srl	a5,a4,a5
 3d4:	0ff7f793          	zext.b	a5,a5
 3d8:	00078513          	mv	a0,a5
 3dc:	e39ff0ef          	jal	214 <uart_send_char>
 3e0:	fec42783          	lw	a5,-20(s0)
 3e4:	00178793          	add	a5,a5,1
 3e8:	fef42623          	sw	a5,-20(s0)
 3ec:	fec42703          	lw	a4,-20(s0)
 3f0:	00200793          	li	a5,2
 3f4:	fce7d8e3          	bge	a5,a4,3c4 <full_read_rx+0x24>
 3f8:	050007b7          	lui	a5,0x5000
 3fc:	00c78793          	add	a5,a5,12 # 500000c <_gbl_ptr+0x4fff80c>
 400:	0007a703          	lw	a4,0(a5)
 404:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 408:	fe042423          	sw	zero,-24(s0)
 40c:	02c0006f          	j	438 <_trap_stack_ptr+0x38>
 410:	00402703          	lw	a4,4(zero) # 4 <read_data>
 414:	fe842783          	lw	a5,-24(s0)
 418:	00279793          	sll	a5,a5,0x2
 41c:	00f757b3          	srl	a5,a4,a5
 420:	0ff7f793          	zext.b	a5,a5
 424:	00078513          	mv	a0,a5
 428:	dedff0ef          	jal	214 <uart_send_char>
 42c:	fe842783          	lw	a5,-24(s0)
 430:	00178793          	add	a5,a5,1
 434:	fef42423          	sw	a5,-24(s0)
 438:	fe842703          	lw	a4,-24(s0)
 43c:	00200793          	li	a5,2
 440:	fce7d8e3          	bge	a5,a4,410 <_trap_stack_ptr+0x10>
 444:	050007b7          	lui	a5,0x5000
 448:	01078793          	add	a5,a5,16 # 5000010 <_gbl_ptr+0x4fff810>
 44c:	0007a703          	lw	a4,0(a5)
 450:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 454:	fe042223          	sw	zero,-28(s0)
 458:	02c0006f          	j	484 <_trap_stack_ptr+0x84>
 45c:	00402703          	lw	a4,4(zero) # 4 <read_data>
 460:	fe442783          	lw	a5,-28(s0)
 464:	00279793          	sll	a5,a5,0x2
 468:	00f757b3          	srl	a5,a4,a5
 46c:	0ff7f793          	zext.b	a5,a5
 470:	00078513          	mv	a0,a5
 474:	da1ff0ef          	jal	214 <uart_send_char>
 478:	fe442783          	lw	a5,-28(s0)
 47c:	00178793          	add	a5,a5,1
 480:	fef42223          	sw	a5,-28(s0)
 484:	fe442703          	lw	a4,-28(s0)
 488:	00200793          	li	a5,2
 48c:	fce7d8e3          	bge	a5,a4,45c <_trap_stack_ptr+0x5c>
 490:	050007b7          	lui	a5,0x5000
 494:	01478793          	add	a5,a5,20 # 5000014 <_gbl_ptr+0x4fff814>
 498:	0007a703          	lw	a4,0(a5)
 49c:	00e02223          	sw	a4,4(zero) # 4 <read_data>
 4a0:	fe042023          	sw	zero,-32(s0)
 4a4:	02c0006f          	j	4d0 <_trap_stack_ptr+0xd0>
 4a8:	00402703          	lw	a4,4(zero) # 4 <read_data>
 4ac:	fe042783          	lw	a5,-32(s0)
 4b0:	00279793          	sll	a5,a5,0x2
 4b4:	00f757b3          	srl	a5,a4,a5
 4b8:	0ff7f793          	zext.b	a5,a5
 4bc:	00078513          	mv	a0,a5
 4c0:	d55ff0ef          	jal	214 <uart_send_char>
 4c4:	fe042783          	lw	a5,-32(s0)
 4c8:	00178793          	add	a5,a5,1
 4cc:	fef42023          	sw	a5,-32(s0)
 4d0:	fe042703          	lw	a4,-32(s0)
 4d4:	00200793          	li	a5,2
 4d8:	fce7d8e3          	bge	a5,a4,4a8 <_trap_stack_ptr+0xa8>
 4dc:	00000013          	nop
 4e0:	00000013          	nop
 4e4:	01c12083          	lw	ra,28(sp)
 4e8:	01812403          	lw	s0,24(sp)
 4ec:	02010113          	add	sp,sp,32
 4f0:	00008067          	ret

000004f4 <main>:
 4f4:	ff010113          	add	sp,sp,-16
 4f8:	00112623          	sw	ra,12(sp)
 4fc:	00812423          	sw	s0,8(sp)
 500:	01010413          	add	s0,sp,16
 504:	d49ff0ef          	jal	24c <full_read_tx>
 508:	e99ff0ef          	jal	3a0 <full_read_rx>
 50c:	cb1ff0ef          	jal	1bc <init_uart_tx>
 510:	c55ff0ef          	jal	164 <init_uart_rx>
 514:	d39ff0ef          	jal	24c <full_read_tx>
 518:	e89ff0ef          	jal	3a0 <full_read_rx>
 51c:	00000793          	li	a5,0
 520:	00078513          	mv	a0,a5
 524:	00c12083          	lw	ra,12(sp)
 528:	00812403          	lw	s0,8(sp)
 52c:	01010113          	add	sp,sp,16
 530:	00008067          	ret

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

