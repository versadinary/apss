
uart_unit_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	18000113          	li	sp,384
   c:	01800293          	li	t0,24
  10:	01700313          	li	t1,23

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
  44:	48c000ef          	jal	4d0 <main>

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
  b4:	244000ef          	jal	2f8 <int_handler>
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

0000011c <config_uart_rx>:
 11c:	ff010113          	add	sp,sp,-16
 120:	00812623          	sw	s0,12(sp)
 124:	01010413          	add	s0,sp,16
 128:	050007b7          	lui	a5,0x5000
 12c:	0001c737          	lui	a4,0x1c
 130:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 134:	00e7a623          	sw	a4,12(a5) # 500000c <_gbl_ptr+0x4fff80c>
 138:	050007b7          	lui	a5,0x5000
 13c:	00100713          	li	a4,1
 140:	00e7a823          	sw	a4,16(a5) # 5000010 <_gbl_ptr+0x4fff810>
 144:	050007b7          	lui	a5,0x5000
 148:	00100713          	li	a4,1
 14c:	00e7aa23          	sw	a4,20(a5) # 5000014 <_gbl_ptr+0x4fff814>
 150:	00000013          	nop
 154:	00c12403          	lw	s0,12(sp)
 158:	01010113          	add	sp,sp,16
 15c:	00008067          	ret

00000160 <config_uart_tx>:
 160:	ff010113          	add	sp,sp,-16
 164:	00812623          	sw	s0,12(sp)
 168:	01010413          	add	s0,sp,16
 16c:	060007b7          	lui	a5,0x6000
 170:	0001c737          	lui	a4,0x1c
 174:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 178:	00e7a623          	sw	a4,12(a5) # 600000c <_gbl_ptr+0x5fff80c>
 17c:	060007b7          	lui	a5,0x6000
 180:	00100713          	li	a4,1
 184:	00e7a823          	sw	a4,16(a5) # 6000010 <_gbl_ptr+0x5fff810>
 188:	060007b7          	lui	a5,0x6000
 18c:	00100713          	li	a4,1
 190:	00e7aa23          	sw	a4,20(a5) # 6000014 <_gbl_ptr+0x5fff814>
 194:	00000013          	nop
 198:	00c12403          	lw	s0,12(sp)
 19c:	01010113          	add	sp,sp,16
 1a0:	00008067          	ret

000001a4 <send_char_bare>:
 1a4:	fe010113          	add	sp,sp,-32
 1a8:	00812e23          	sw	s0,28(sp)
 1ac:	02010413          	add	s0,sp,32
 1b0:	00050793          	mv	a5,a0
 1b4:	fef407a3          	sb	a5,-17(s0)
 1b8:	00000013          	nop
 1bc:	060007b7          	lui	a5,0x6000
 1c0:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 1c4:	fe079ce3          	bnez	a5,1bc <send_char_bare+0x18>
 1c8:	060007b7          	lui	a5,0x6000
 1cc:	fef44703          	lbu	a4,-17(s0)
 1d0:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 1d4:	00000013          	nop
 1d8:	060007b7          	lui	a5,0x6000
 1dc:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 1e0:	fe079ce3          	bnez	a5,1d8 <send_char_bare+0x34>
 1e4:	00000013          	nop
 1e8:	00000013          	nop
 1ec:	01c12403          	lw	s0,28(sp)
 1f0:	02010113          	add	sp,sp,32
 1f4:	00008067          	ret

000001f8 <send_char>:
 1f8:	fe010113          	add	sp,sp,-32
 1fc:	00812e23          	sw	s0,28(sp)
 200:	02010413          	add	s0,sp,32
 204:	fea42623          	sw	a0,-20(s0)
 208:	00058793          	mv	a5,a1
 20c:	fef405a3          	sb	a5,-21(s0)
 210:	00000013          	nop
 214:	060007b7          	lui	a5,0x6000
 218:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 21c:	fe079ce3          	bnez	a5,214 <send_char+0x1c>
 220:	fec42783          	lw	a5,-20(s0)
 224:	feb44703          	lbu	a4,-21(s0)
 228:	00e78023          	sb	a4,0(a5)
 22c:	060007b7          	lui	a5,0x6000
 230:	feb44703          	lbu	a4,-21(s0)
 234:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 238:	00000013          	nop
 23c:	060007b7          	lui	a5,0x6000
 240:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 244:	fe079ce3          	bnez	a5,23c <send_char+0x44>
 248:	00000013          	nop
 24c:	00000013          	nop
 250:	01c12403          	lw	s0,28(sp)
 254:	02010113          	add	sp,sp,32
 258:	00008067          	ret

0000025c <rcv_char>:
 25c:	fe010113          	add	sp,sp,-32
 260:	00812e23          	sw	s0,28(sp)
 264:	02010413          	add	s0,sp,32
 268:	fea42623          	sw	a0,-20(s0)
 26c:	feb42423          	sw	a1,-24(s0)
 270:	00000b23          	sb	zero,22(zero) # 16 <data_vld_int>
 274:	00000013          	nop
 278:	01604783          	lbu	a5,22(zero) # 16 <data_vld_int>
 27c:	0ff7f713          	zext.b	a4,a5
 280:	00100793          	li	a5,1
 284:	fef71ae3          	bne	a4,a5,278 <rcv_char+0x1c>
 288:	00000b23          	sb	zero,22(zero) # 16 <data_vld_int>
 28c:	01504703          	lbu	a4,21(zero) # 15 <rcv_data_int>
 290:	fec42783          	lw	a5,-20(s0)
 294:	00e780a3          	sb	a4,1(a5)
 298:	fec42783          	lw	a5,-20(s0)
 29c:	00100713          	li	a4,1
 2a0:	00e78123          	sb	a4,2(a5)
 2a4:	00000013          	nop
 2a8:	01c12403          	lw	s0,28(sp)
 2ac:	02010113          	add	sp,sp,32
 2b0:	00008067          	ret

000002b4 <rcv_uart_int>:
 2b4:	ff010113          	add	sp,sp,-16
 2b8:	00812623          	sw	s0,12(sp)
 2bc:	01010413          	add	s0,sp,16
 2c0:	00000013          	nop
 2c4:	050007b7          	lui	a5,0x5000
 2c8:	0087a783          	lw	a5,8(a5) # 5000008 <_gbl_ptr+0x4fff808>
 2cc:	fe079ce3          	bnez	a5,2c4 <rcv_uart_int+0x10>
 2d0:	050007b7          	lui	a5,0x5000
 2d4:	0007a783          	lw	a5,0(a5) # 5000000 <_gbl_ptr+0x4fff800>
 2d8:	0ff7f713          	zext.b	a4,a5
 2dc:	00e00aa3          	sb	a4,21(zero) # 15 <rcv_data_int>
 2e0:	00100713          	li	a4,1
 2e4:	00e00b23          	sb	a4,22(zero) # 16 <data_vld_int>
 2e8:	00000013          	nop
 2ec:	00c12403          	lw	s0,12(sp)
 2f0:	01010113          	add	sp,sp,16
 2f4:	00008067          	ret

000002f8 <int_handler>:
 2f8:	ff010113          	add	sp,sp,-16
 2fc:	00112623          	sw	ra,12(sp)
 300:	00812423          	sw	s0,8(sp)
 304:	01010413          	add	s0,sp,16
 308:	fadff0ef          	jal	2b4 <rcv_uart_int>
 30c:	00000013          	nop
 310:	00c12083          	lw	ra,12(sp)
 314:	00812403          	lw	s0,8(sp)
 318:	01010113          	add	sp,sp,16
 31c:	00008067          	ret

00000320 <byte_test>:
 320:	fd010113          	add	sp,sp,-48
 324:	02112623          	sw	ra,44(sp)
 328:	02812423          	sw	s0,40(sp)
 32c:	03010413          	add	s0,sp,48
 330:	fca42e23          	sw	a0,-36(s0)
 334:	fdc42503          	lw	a0,-36(s0)
 338:	060000ef          	jal	398 <init_testing>
 33c:	090000ef          	jal	3cc <gen_data>
 340:	00050793          	mv	a5,a0
 344:	fef407a3          	sb	a5,-17(s0)
 348:	fef44783          	lbu	a5,-17(s0)
 34c:	00078593          	mv	a1,a5
 350:	fdc42503          	lw	a0,-36(s0)
 354:	ea5ff0ef          	jal	1f8 <send_char>
 358:	fe740793          	add	a5,s0,-25
 35c:	00078593          	mv	a1,a5
 360:	fdc42503          	lw	a0,-36(s0)
 364:	ef9ff0ef          	jal	25c <rcv_char>
 368:	fdc42503          	lw	a0,-36(s0)
 36c:	080000ef          	jal	3ec <cmp_snd_rcv>
 370:	fea42423          	sw	a0,-24(s0)
 374:	fdc42583          	lw	a1,-36(s0)
 378:	fe842503          	lw	a0,-24(s0)
 37c:	0c8000ef          	jal	444 <send_response>
 380:	00000013          	nop
 384:	00078513          	mv	a0,a5
 388:	02c12083          	lw	ra,44(sp)
 38c:	02812403          	lw	s0,40(sp)
 390:	03010113          	add	sp,sp,48
 394:	00008067          	ret

00000398 <init_testing>:
 398:	fd010113          	add	sp,sp,-48
 39c:	02112623          	sw	ra,44(sp)
 3a0:	02812423          	sw	s0,40(sp)
 3a4:	03010413          	add	s0,sp,48
 3a8:	fca42e23          	sw	a0,-36(s0)
 3ac:	fec42583          	lw	a1,-20(s0)
 3b0:	fdc42503          	lw	a0,-36(s0)
 3b4:	ea9ff0ef          	jal	25c <rcv_char>
 3b8:	00000013          	nop
 3bc:	02c12083          	lw	ra,44(sp)
 3c0:	02812403          	lw	s0,40(sp)
 3c4:	03010113          	add	sp,sp,48
 3c8:	00008067          	ret

000003cc <gen_data>:
 3cc:	ff010113          	add	sp,sp,-16
 3d0:	00812623          	sw	s0,12(sp)
 3d4:	01010413          	add	s0,sp,16
 3d8:	0ab00793          	li	a5,171
 3dc:	00078513          	mv	a0,a5
 3e0:	00c12403          	lw	s0,12(sp)
 3e4:	01010113          	add	sp,sp,16
 3e8:	00008067          	ret

000003ec <cmp_snd_rcv>:
 3ec:	fd010113          	add	sp,sp,-48
 3f0:	02812623          	sw	s0,44(sp)
 3f4:	03010413          	add	s0,sp,48
 3f8:	fca42e23          	sw	a0,-36(s0)
 3fc:	fdc42783          	lw	a5,-36(s0)
 400:	0007c703          	lbu	a4,0(a5)
 404:	fdc42783          	lw	a5,-36(s0)
 408:	0017c783          	lbu	a5,1(a5)
 40c:	00f747b3          	xor	a5,a4,a5
 410:	0ff7f793          	zext.b	a5,a5
 414:	fff7c793          	not	a5,a5
 418:	fef407a3          	sb	a5,-17(s0)
 41c:	fef44783          	lbu	a5,-17(s0)
 420:	f0178793          	add	a5,a5,-255
 424:	0017b793          	seqz	a5,a5
 428:	0ff7f793          	zext.b	a5,a5
 42c:	fef42423          	sw	a5,-24(s0)
 430:	fe842783          	lw	a5,-24(s0)
 434:	00078513          	mv	a0,a5
 438:	02c12403          	lw	s0,44(sp)
 43c:	03010113          	add	sp,sp,48
 440:	00008067          	ret

00000444 <send_response>:
 444:	fd010113          	add	sp,sp,-48
 448:	02112623          	sw	ra,44(sp)
 44c:	02812423          	sw	s0,40(sp)
 450:	03010413          	add	s0,sp,48
 454:	fca42e23          	sw	a0,-36(s0)
 458:	fcb42c23          	sw	a1,-40(s0)
 45c:	fdc42783          	lw	a5,-36(s0)
 460:	00078663          	beqz	a5,46c <send_response+0x28>
 464:	00000793          	li	a5,0
 468:	0080006f          	j	470 <send_response+0x2c>
 46c:	00c00793          	li	a5,12
 470:	fef42423          	sw	a5,-24(s0)
 474:	fe042623          	sw	zero,-20(s0)
 478:	02c0006f          	j	4a4 <send_response+0x60>
 47c:	fec42783          	lw	a5,-20(s0)
 480:	fe842703          	lw	a4,-24(s0)
 484:	00f707b3          	add	a5,a4,a5
 488:	0007c783          	lbu	a5,0(a5)
 48c:	00078593          	mv	a1,a5
 490:	fd842503          	lw	a0,-40(s0)
 494:	d65ff0ef          	jal	1f8 <send_char>
 498:	fec42783          	lw	a5,-20(s0)
 49c:	00178793          	add	a5,a5,1
 4a0:	fef42623          	sw	a5,-20(s0)
 4a4:	fec42783          	lw	a5,-20(s0)
 4a8:	fe842703          	lw	a4,-24(s0)
 4ac:	00f707b3          	add	a5,a4,a5
 4b0:	0007c783          	lbu	a5,0(a5)
 4b4:	fc0794e3          	bnez	a5,47c <send_response+0x38>
 4b8:	00000013          	nop
 4bc:	00000013          	nop
 4c0:	02c12083          	lw	ra,44(sp)
 4c4:	02812403          	lw	s0,40(sp)
 4c8:	03010113          	add	sp,sp,48
 4cc:	00008067          	ret

000004d0 <main>:
 4d0:	fe010113          	add	sp,sp,-32
 4d4:	00112e23          	sw	ra,28(sp)
 4d8:	00812c23          	sw	s0,24(sp)
 4dc:	02010413          	add	s0,sp,32
 4e0:	c3dff0ef          	jal	11c <config_uart_rx>
 4e4:	c7dff0ef          	jal	160 <config_uart_tx>
 4e8:	fec40793          	add	a5,s0,-20
 4ec:	00078513          	mv	a0,a5
 4f0:	e31ff0ef          	jal	320 <byte_test>
 4f4:	00000793          	li	a5,0
 4f8:	00078513          	mv	a0,a5
 4fc:	01c12083          	lw	ra,28(sp)
 500:	01812403          	lw	s0,24(sp)
 504:	02010113          	add	sp,sp,32
 508:	00008067          	ret

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	43435553          	.insn	4, 0x43435553
   4:	5345                	.insn	2, 0x5345
   6:	00000a53          	.insn	4, 0x0a53
   a:	0000                	.insn	2, 0x
   c:	4146                	.insn	2, 0x4146
   e:	4c49                	.insn	2, 0x4c49
  10:	5255                	.insn	2, 0x5255
  12:	0a45                	.insn	2, 0x0a45
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
  1e:	32727363          	bgeu	tp,t2,344 <byte_test+0x24>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

