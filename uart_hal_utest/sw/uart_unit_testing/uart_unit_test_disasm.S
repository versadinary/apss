
uart_unit_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	01800293          	li	t0,24
  10:	01f00313          	li	t1,31

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
  48:	3c8000ef          	jal	410 <main>

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
  b8:	1a8000ef          	jal	260 <int_handler>
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

00000120 <config_uart_rx>:
 120:	ff010113          	add	sp,sp,-16
 124:	00812623          	sw	s0,12(sp)
 128:	01010413          	add	s0,sp,16
 12c:	050007b7          	lui	a5,0x5000
 130:	0001c737          	lui	a4,0x1c
 134:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 138:	00e7a623          	sw	a4,12(a5) # 500000c <_gbl_ptr+0x4fff80c>
 13c:	050007b7          	lui	a5,0x5000
 140:	00100713          	li	a4,1
 144:	00e7a823          	sw	a4,16(a5) # 5000010 <_gbl_ptr+0x4fff810>
 148:	050007b7          	lui	a5,0x5000
 14c:	00100713          	li	a4,1
 150:	00e7aa23          	sw	a4,20(a5) # 5000014 <_gbl_ptr+0x4fff814>
 154:	00000013          	nop
 158:	00c12403          	lw	s0,12(sp)
 15c:	01010113          	add	sp,sp,16
 160:	00008067          	ret

00000164 <config_uart_tx>:
 164:	ff010113          	add	sp,sp,-16
 168:	00812623          	sw	s0,12(sp)
 16c:	01010413          	add	s0,sp,16
 170:	060007b7          	lui	a5,0x6000
 174:	0001c737          	lui	a4,0x1c
 178:	20070713          	add	a4,a4,512 # 1c200 <_gbl_ptr+0x1ba00>
 17c:	00e7a623          	sw	a4,12(a5) # 600000c <_gbl_ptr+0x5fff80c>
 180:	060007b7          	lui	a5,0x6000
 184:	00100713          	li	a4,1
 188:	00e7a823          	sw	a4,16(a5) # 6000010 <_gbl_ptr+0x5fff810>
 18c:	060007b7          	lui	a5,0x6000
 190:	00100713          	li	a4,1
 194:	00e7aa23          	sw	a4,20(a5) # 6000014 <_gbl_ptr+0x5fff814>
 198:	00000013          	nop
 19c:	00c12403          	lw	s0,12(sp)
 1a0:	01010113          	add	sp,sp,16
 1a4:	00008067          	ret

000001a8 <send_char>:
 1a8:	fe010113          	add	sp,sp,-32
 1ac:	00812e23          	sw	s0,28(sp)
 1b0:	02010413          	add	s0,sp,32
 1b4:	fea42623          	sw	a0,-20(s0)
 1b8:	00058793          	mv	a5,a1
 1bc:	fef405a3          	sb	a5,-21(s0)
 1c0:	00000013          	nop
 1c4:	060007b7          	lui	a5,0x6000
 1c8:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 1cc:	fe079ce3          	bnez	a5,1c4 <send_char+0x1c>
 1d0:	fec42783          	lw	a5,-20(s0)
 1d4:	feb44703          	lbu	a4,-21(s0)
 1d8:	00e78023          	sb	a4,0(a5)
 1dc:	060007b7          	lui	a5,0x6000
 1e0:	feb44703          	lbu	a4,-21(s0)
 1e4:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 1e8:	00000013          	nop
 1ec:	01c12403          	lw	s0,28(sp)
 1f0:	02010113          	add	sp,sp,32
 1f4:	00008067          	ret

000001f8 <rcv_char>:
 1f8:	fe010113          	add	sp,sp,-32
 1fc:	00812e23          	sw	s0,28(sp)
 200:	02010413          	add	s0,sp,32
 204:	fea42623          	sw	a0,-20(s0)
 208:	feb42423          	sw	a1,-24(s0)
 20c:	00000ca3          	sb	zero,25(zero) # 19 <data_vld_int>
 210:	00000013          	nop
 214:	01904783          	lbu	a5,25(zero) # 19 <data_vld_int>
 218:	ffdff06f          	j	214 <rcv_char+0x1c>

0000021c <rcv_uart_int>:
 21c:	ff010113          	add	sp,sp,-16
 220:	00812623          	sw	s0,12(sp)
 224:	01010413          	add	s0,sp,16
 228:	00000013          	nop
 22c:	050007b7          	lui	a5,0x5000
 230:	0087a783          	lw	a5,8(a5) # 5000008 <_gbl_ptr+0x4fff808>
 234:	fe079ce3          	bnez	a5,22c <rcv_uart_int+0x10>
 238:	050007b7          	lui	a5,0x5000
 23c:	0007a783          	lw	a5,0(a5) # 5000000 <_gbl_ptr+0x4fff800>
 240:	0ff7f713          	zext.b	a4,a5
 244:	00e00c23          	sb	a4,24(zero) # 18 <rcv_data_int>
 248:	00100713          	li	a4,1
 24c:	00e00ca3          	sb	a4,25(zero) # 19 <data_vld_int>
 250:	00000013          	nop
 254:	00c12403          	lw	s0,12(sp)
 258:	01010113          	add	sp,sp,16
 25c:	00008067          	ret

00000260 <int_handler>:
 260:	ff010113          	add	sp,sp,-16
 264:	00112623          	sw	ra,12(sp)
 268:	00812423          	sw	s0,8(sp)
 26c:	01010413          	add	s0,sp,16
 270:	fadff0ef          	jal	21c <rcv_uart_int>
 274:	00000013          	nop
 278:	00c12083          	lw	ra,12(sp)
 27c:	00812403          	lw	s0,8(sp)
 280:	01010113          	add	sp,sp,16
 284:	00008067          	ret

00000288 <byte_test>:
 288:	fe010113          	add	sp,sp,-32
 28c:	00112e23          	sw	ra,28(sp)
 290:	00812c23          	sw	s0,24(sp)
 294:	02010413          	add	s0,sp,32
 298:	01c00513          	li	a0,28
 29c:	054000ef          	jal	2f0 <init_testing>
 2a0:	084000ef          	jal	324 <gen_data>
 2a4:	00050793          	mv	a5,a0
 2a8:	fef407a3          	sb	a5,-17(s0)
 2ac:	fef44783          	lbu	a5,-17(s0)
 2b0:	00078593          	mv	a1,a5
 2b4:	01c00513          	li	a0,28
 2b8:	ef1ff0ef          	jal	1a8 <send_char>
 2bc:	fe740793          	add	a5,s0,-25
 2c0:	00078593          	mv	a1,a5
 2c4:	01c00513          	li	a0,28
 2c8:	f31ff0ef          	jal	1f8 <rcv_char>
 2cc:	01c00513          	li	a0,28
 2d0:	074000ef          	jal	344 <cmp_snd_rcv>
 2d4:	fea42423          	sw	a0,-24(s0)
 2d8:	00000013          	nop
 2dc:	00078513          	mv	a0,a5
 2e0:	01c12083          	lw	ra,28(sp)
 2e4:	01812403          	lw	s0,24(sp)
 2e8:	02010113          	add	sp,sp,32
 2ec:	00008067          	ret

000002f0 <init_testing>:
 2f0:	fd010113          	add	sp,sp,-48
 2f4:	02112623          	sw	ra,44(sp)
 2f8:	02812423          	sw	s0,40(sp)
 2fc:	03010413          	add	s0,sp,48
 300:	fca42e23          	sw	a0,-36(s0)
 304:	fec42583          	lw	a1,-20(s0)
 308:	fdc42503          	lw	a0,-36(s0)
 30c:	eedff0ef          	jal	1f8 <rcv_char>
 310:	00000013          	nop
 314:	02c12083          	lw	ra,44(sp)
 318:	02812403          	lw	s0,40(sp)
 31c:	03010113          	add	sp,sp,48
 320:	00008067          	ret

00000324 <gen_data>:
 324:	ff010113          	add	sp,sp,-16
 328:	00812623          	sw	s0,12(sp)
 32c:	01010413          	add	s0,sp,16
 330:	0ab00793          	li	a5,171
 334:	00078513          	mv	a0,a5
 338:	00c12403          	lw	s0,12(sp)
 33c:	01010113          	add	sp,sp,16
 340:	00008067          	ret

00000344 <cmp_snd_rcv>:
 344:	fd010113          	add	sp,sp,-48
 348:	02812623          	sw	s0,44(sp)
 34c:	03010413          	add	s0,sp,48
 350:	fca42e23          	sw	a0,-36(s0)
 354:	fdc42783          	lw	a5,-36(s0)
 358:	0007c703          	lbu	a4,0(a5)
 35c:	fdc42783          	lw	a5,-36(s0)
 360:	0017c783          	lbu	a5,1(a5)
 364:	40f707b3          	sub	a5,a4,a5
 368:	0017b793          	seqz	a5,a5
 36c:	0ff7f793          	zext.b	a5,a5
 370:	fef42623          	sw	a5,-20(s0)
 374:	fec42783          	lw	a5,-20(s0)
 378:	00078513          	mv	a0,a5
 37c:	02c12403          	lw	s0,44(sp)
 380:	03010113          	add	sp,sp,48
 384:	00008067          	ret

00000388 <send_response>:
 388:	fd010113          	add	sp,sp,-48
 38c:	02112623          	sw	ra,44(sp)
 390:	02812423          	sw	s0,40(sp)
 394:	03010413          	add	s0,sp,48
 398:	fca42e23          	sw	a0,-36(s0)
 39c:	fdc42783          	lw	a5,-36(s0)
 3a0:	00078663          	beqz	a5,3ac <send_response+0x24>
 3a4:	00000793          	li	a5,0
 3a8:	0080006f          	j	3b0 <send_response+0x28>
 3ac:	00c00793          	li	a5,12
 3b0:	fef42423          	sw	a5,-24(s0)
 3b4:	fe042623          	sw	zero,-20(s0)
 3b8:	02c0006f          	j	3e4 <send_response+0x5c>
 3bc:	fec42783          	lw	a5,-20(s0)
 3c0:	fe842703          	lw	a4,-24(s0)
 3c4:	00f707b3          	add	a5,a4,a5
 3c8:	0007c783          	lbu	a5,0(a5)
 3cc:	00078593          	mv	a1,a5
 3d0:	01c00513          	li	a0,28
 3d4:	dd5ff0ef          	jal	1a8 <send_char>
 3d8:	fec42783          	lw	a5,-20(s0)
 3dc:	00178793          	add	a5,a5,1
 3e0:	fef42623          	sw	a5,-20(s0)
 3e4:	fec42783          	lw	a5,-20(s0)
 3e8:	fe842703          	lw	a4,-24(s0)
 3ec:	00f707b3          	add	a5,a4,a5
 3f0:	0007c783          	lbu	a5,0(a5)
 3f4:	fc0794e3          	bnez	a5,3bc <send_response+0x34>
 3f8:	00000013          	nop
 3fc:	00000013          	nop
 400:	02c12083          	lw	ra,44(sp)
 404:	02812403          	lw	s0,40(sp)
 408:	03010113          	add	sp,sp,48
 40c:	00008067          	ret

00000410 <main>:
 410:	ff010113          	add	sp,sp,-16
 414:	00112623          	sw	ra,12(sp)
 418:	00812423          	sw	s0,8(sp)
 41c:	01010413          	add	s0,sp,16
 420:	d01ff0ef          	jal	120 <config_uart_rx>
 424:	d41ff0ef          	jal	164 <config_uart_tx>
 428:	e61ff0ef          	jal	288 <byte_test>
 42c:	00000793          	li	a5,0
 430:	00078513          	mv	a0,a5
 434:	00c12083          	lw	ra,12(sp)
 438:	00812403          	lw	s0,8(sp)
 43c:	01010113          	add	sp,sp,16
 440:	00008067          	ret

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
  1e:	32727363          	bgeu	tp,t2,344 <cmp_snd_rcv>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

