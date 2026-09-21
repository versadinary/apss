
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
  44:	3e0000ef          	jal	424 <main>

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
  b4:	1f4000ef          	jal	2a8 <int_handler>
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
 1b8:	060007b7          	lui	a5,0x6000
 1bc:	fef44703          	lbu	a4,-17(s0)
 1c0:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 1c4:	00000013          	nop
 1c8:	060007b7          	lui	a5,0x6000
 1cc:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 1d0:	fe079ce3          	bnez	a5,1c8 <send_char_bare+0x24>
 1d4:	00000013          	nop
 1d8:	00000013          	nop
 1dc:	01c12403          	lw	s0,28(sp)
 1e0:	02010113          	add	sp,sp,32
 1e4:	00008067          	ret

000001e8 <send_char>:
 1e8:	fe010113          	add	sp,sp,-32
 1ec:	00812e23          	sw	s0,28(sp)
 1f0:	02010413          	add	s0,sp,32
 1f4:	00050793          	mv	a5,a0
 1f8:	fef407a3          	sb	a5,-17(s0)
 1fc:	060007b7          	lui	a5,0x6000
 200:	fef44703          	lbu	a4,-17(s0)
 204:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 208:	00000013          	nop
 20c:	060007b7          	lui	a5,0x6000
 210:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 214:	fe079ce3          	bnez	a5,20c <send_char+0x24>
 218:	00000013          	nop
 21c:	00000013          	nop
 220:	01c12403          	lw	s0,28(sp)
 224:	02010113          	add	sp,sp,32
 228:	00008067          	ret

0000022c <rcv_char>:
 22c:	fe010113          	add	sp,sp,-32
 230:	00812e23          	sw	s0,28(sp)
 234:	02010413          	add	s0,sp,32
 238:	00000b23          	sb	zero,22(zero) # 16 <data_vld_int>
 23c:	00000013          	nop
 240:	01604783          	lbu	a5,22(zero) # 16 <data_vld_int>
 244:	0ff7f713          	zext.b	a4,a5
 248:	00100793          	li	a5,1
 24c:	fef71ae3          	bne	a4,a5,240 <rcv_char+0x14>
 250:	050007b7          	lui	a5,0x5000
 254:	0007a783          	lw	a5,0(a5) # 5000000 <_gbl_ptr+0x4fff800>
 258:	fef407a3          	sb	a5,-17(s0)
 25c:	00000b23          	sb	zero,22(zero) # 16 <data_vld_int>
 260:	fef44783          	lbu	a5,-17(s0)
 264:	00078513          	mv	a0,a5
 268:	01c12403          	lw	s0,28(sp)
 26c:	02010113          	add	sp,sp,32
 270:	00008067          	ret

00000274 <rcv_uart_int>:
 274:	ff010113          	add	sp,sp,-16
 278:	00812623          	sw	s0,12(sp)
 27c:	01010413          	add	s0,sp,16
 280:	00000013          	nop
 284:	050007b7          	lui	a5,0x5000
 288:	0087a783          	lw	a5,8(a5) # 5000008 <_gbl_ptr+0x4fff808>
 28c:	fe079ce3          	bnez	a5,284 <_stack_size+0x4>
 290:	00100713          	li	a4,1
 294:	00e00b23          	sb	a4,22(zero) # 16 <data_vld_int>
 298:	00000013          	nop
 29c:	00c12403          	lw	s0,12(sp)
 2a0:	01010113          	add	sp,sp,16
 2a4:	00008067          	ret

000002a8 <int_handler>:
 2a8:	ff010113          	add	sp,sp,-16
 2ac:	00112623          	sw	ra,12(sp)
 2b0:	00812423          	sw	s0,8(sp)
 2b4:	01010413          	add	s0,sp,16
 2b8:	fbdff0ef          	jal	274 <rcv_uart_int>
 2bc:	00000013          	nop
 2c0:	00c12083          	lw	ra,12(sp)
 2c4:	00812403          	lw	s0,8(sp)
 2c8:	01010113          	add	sp,sp,16
 2cc:	00008067          	ret

000002d0 <byte_test>:
 2d0:	fd010113          	add	sp,sp,-48
 2d4:	02112623          	sw	ra,44(sp)
 2d8:	02812423          	sw	s0,40(sp)
 2dc:	03010413          	add	s0,sp,48
 2e0:	0f4000ef          	jal	3d4 <init_testing>
 2e4:	120000ef          	jal	404 <gen_data>
 2e8:	00050793          	mv	a5,a0
 2ec:	fef403a3          	sb	a5,-25(s0)
 2f0:	fe744783          	lbu	a5,-25(s0)
 2f4:	00078513          	mv	a0,a5
 2f8:	ef1ff0ef          	jal	1e8 <send_char>
 2fc:	f31ff0ef          	jal	22c <rcv_char>
 300:	00050793          	mv	a5,a0
 304:	fef40323          	sb	a5,-26(s0)
 308:	fe0402a3          	sb	zero,-27(s0)
 30c:	fe040223          	sb	zero,-28(s0)
 310:	fe744783          	lbu	a5,-25(s0)
 314:	00078713          	mv	a4,a5
 318:	fe644783          	lbu	a5,-26(s0)
 31c:	00f747b3          	xor	a5,a4,a5
 320:	fef40223          	sb	a5,-28(s0)
 324:	00000793          	li	a5,0
 328:	fef42023          	sw	a5,-32(s0)
 32c:	00c00793          	li	a5,12
 330:	fcf42e23          	sw	a5,-36(s0)
 334:	fe444783          	lbu	a5,-28(s0)
 338:	04078463          	beqz	a5,380 <byte_test+0xb0>
 33c:	fe042623          	sw	zero,-20(s0)
 340:	0280006f          	j	368 <byte_test+0x98>
 344:	fec42783          	lw	a5,-20(s0)
 348:	fe042703          	lw	a4,-32(s0)
 34c:	00f707b3          	add	a5,a4,a5
 350:	0007c783          	lbu	a5,0(a5)
 354:	00078513          	mv	a0,a5
 358:	e91ff0ef          	jal	1e8 <send_char>
 35c:	fec42783          	lw	a5,-20(s0)
 360:	00178793          	add	a5,a5,1
 364:	fef42623          	sw	a5,-20(s0)
 368:	fec42783          	lw	a5,-20(s0)
 36c:	fdc42703          	lw	a4,-36(s0)
 370:	00f707b3          	add	a5,a4,a5
 374:	0007c783          	lbu	a5,0(a5)
 378:	fc0796e3          	bnez	a5,344 <byte_test+0x74>
 37c:	0440006f          	j	3c0 <byte_test+0xf0>
 380:	fe042423          	sw	zero,-24(s0)
 384:	0280006f          	j	3ac <byte_test+0xdc>
 388:	fe842783          	lw	a5,-24(s0)
 38c:	fdc42703          	lw	a4,-36(s0)
 390:	00f707b3          	add	a5,a4,a5
 394:	0007c783          	lbu	a5,0(a5)
 398:	00078513          	mv	a0,a5
 39c:	e4dff0ef          	jal	1e8 <send_char>
 3a0:	fe842783          	lw	a5,-24(s0)
 3a4:	00178793          	add	a5,a5,1
 3a8:	fef42423          	sw	a5,-24(s0)
 3ac:	fe842783          	lw	a5,-24(s0)
 3b0:	fe042703          	lw	a4,-32(s0)
 3b4:	00f707b3          	add	a5,a4,a5
 3b8:	0007c783          	lbu	a5,0(a5)
 3bc:	fc0796e3          	bnez	a5,388 <byte_test+0xb8>
 3c0:	00000013          	nop
 3c4:	02c12083          	lw	ra,44(sp)
 3c8:	02812403          	lw	s0,40(sp)
 3cc:	03010113          	add	sp,sp,48
 3d0:	00008067          	ret

000003d4 <init_testing>:
 3d4:	fe010113          	add	sp,sp,-32
 3d8:	00112e23          	sw	ra,28(sp)
 3dc:	00812c23          	sw	s0,24(sp)
 3e0:	02010413          	add	s0,sp,32
 3e4:	e49ff0ef          	jal	22c <rcv_char>
 3e8:	00050793          	mv	a5,a0
 3ec:	fef407a3          	sb	a5,-17(s0)
 3f0:	00000013          	nop
 3f4:	01c12083          	lw	ra,28(sp)
 3f8:	01812403          	lw	s0,24(sp)
 3fc:	02010113          	add	sp,sp,32
 400:	00008067          	ret

00000404 <gen_data>:
 404:	ff010113          	add	sp,sp,-16
 408:	00812623          	sw	s0,12(sp)
 40c:	01010413          	add	s0,sp,16
 410:	0ab00793          	li	a5,171
 414:	00078513          	mv	a0,a5
 418:	00c12403          	lw	s0,12(sp)
 41c:	01010113          	add	sp,sp,16
 420:	00008067          	ret

00000424 <main>:
 424:	ff010113          	add	sp,sp,-16
 428:	00112623          	sw	ra,12(sp)
 42c:	00812423          	sw	s0,8(sp)
 430:	01010413          	add	s0,sp,16
 434:	ce9ff0ef          	jal	11c <config_uart_rx>
 438:	d29ff0ef          	jal	160 <config_uart_tx>
 43c:	e95ff0ef          	jal	2d0 <byte_test>
 440:	00000793          	li	a5,0
 444:	00078513          	mv	a0,a5
 448:	00c12083          	lw	ra,12(sp)
 44c:	00812403          	lw	s0,8(sp)
 450:	01010113          	add	sp,sp,16
 454:	00008067          	ret

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	4146                	.insn	2, 0x4146
   2:	4c49                	.insn	2, 0x4c49
   4:	5255                	.insn	2, 0x5255
   6:	0a45                	.insn	2, 0x0a45
   8:	0000                	.insn	2, 0x
   a:	0000                	.insn	2, 0x
   c:	43435553          	.insn	4, 0x43435553
  10:	5345                	.insn	2, 0x5345
  12:	Address 0x12 is out of bounds.


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
  1e:	32727363          	bgeu	tp,t2,344 <byte_test+0x74>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

