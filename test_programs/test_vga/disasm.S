
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	02000293          	li	t0,32
  10:	02800313          	li	t1,40

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
  48:	414000ef          	jal	45c <main>

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
 130:	0047a783          	lw	a5,4(a5) # 3000004 <_gbl_ptr+0x2fff804>
 134:	00078863          	beqz	a5,144 <int_handler+0x24>
 138:	030007b7          	lui	a5,0x3000
 13c:	0007a783          	lw	a5,0(a5) # 3000000 <_gbl_ptr+0x2fff800>
 140:	0080006f          	j	148 <int_handler+0x28>
 144:	00000793          	li	a5,0
 148:	02f02023          	sw	a5,32(zero) # 20 <ps2_scan>
 14c:	02002783          	lw	a5,32(zero) # 20 <ps2_scan>
 150:	07600713          	li	a4,118
 154:	1ce78663          	beq	a5,a4,320 <_stack_size+0xa0>
 158:	07600713          	li	a4,118
 15c:	1cf76e63          	bltu	a4,a5,338 <_stack_size+0xb8>
 160:	05a00713          	li	a4,90
 164:	1ae78063          	beq	a5,a4,304 <_stack_size+0x84>
 168:	05a00713          	li	a4,90
 16c:	1cf76663          	bltu	a4,a5,338 <_stack_size+0xb8>
 170:	02300713          	li	a4,35
 174:	12e78c63          	beq	a5,a4,2ac <_stack_size+0x2c>
 178:	02300713          	li	a4,35
 17c:	1af76e63          	bltu	a4,a5,338 <_stack_size+0xb8>
 180:	01d00713          	li	a4,29
 184:	02e78063          	beq	a5,a4,1a4 <int_handler+0x84>
 188:	01d00713          	li	a4,29
 18c:	1af76663          	bltu	a4,a5,338 <_stack_size+0xb8>
 190:	01b00713          	li	a4,27
 194:	0ce78063          	beq	a5,a4,254 <int_handler+0x134>
 198:	01c00713          	li	a4,28
 19c:	06e78063          	beq	a5,a4,1fc <int_handler+0xdc>
 1a0:	1980006f          	j	338 <_stack_size+0xb8>
 1a4:	00000793          	li	a5,0
 1a8:	0007a783          	lw	a5,0(a5)
 1ac:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 1b0:	00e787b3          	add	a5,a5,a4
 1b4:	02000713          	li	a4,32
 1b8:	00e78023          	sb	a4,0(a5)
 1bc:	02402783          	lw	a5,36(zero) # 24 <_irq_config>
 1c0:	fb078713          	add	a4,a5,-80
 1c4:	02e02223          	sw	a4,36(zero) # 24 <_irq_config>
 1c8:	00000793          	li	a5,0
 1cc:	0007a783          	lw	a5,0(a5)
 1d0:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 1d4:	00e787b3          	add	a5,a5,a4
 1d8:	05800713          	li	a4,88
 1dc:	00e78023          	sb	a4,0(a5)
 1e0:	00000793          	li	a5,0
 1e4:	0047a783          	lw	a5,4(a5)
 1e8:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 1ec:	00e787b3          	add	a5,a5,a4
 1f0:	ff000713          	li	a4,-16
 1f4:	00e78023          	sb	a4,0(a5)
 1f8:	1400006f          	j	338 <_stack_size+0xb8>
 1fc:	00000793          	li	a5,0
 200:	0007a783          	lw	a5,0(a5)
 204:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 208:	00e787b3          	add	a5,a5,a4
 20c:	02000713          	li	a4,32
 210:	00e78023          	sb	a4,0(a5)
 214:	02402783          	lw	a5,36(zero) # 24 <_irq_config>
 218:	fff78713          	add	a4,a5,-1
 21c:	02e02223          	sw	a4,36(zero) # 24 <_irq_config>
 220:	00000793          	li	a5,0
 224:	0007a783          	lw	a5,0(a5)
 228:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 22c:	00e787b3          	add	a5,a5,a4
 230:	05800713          	li	a4,88
 234:	00e78023          	sb	a4,0(a5)
 238:	00000793          	li	a5,0
 23c:	0047a783          	lw	a5,4(a5)
 240:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 244:	00e787b3          	add	a5,a5,a4
 248:	ff000713          	li	a4,-16
 24c:	00e78023          	sb	a4,0(a5)
 250:	0e80006f          	j	338 <_stack_size+0xb8>
 254:	00000793          	li	a5,0
 258:	0007a783          	lw	a5,0(a5)
 25c:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 260:	00e787b3          	add	a5,a5,a4
 264:	02000713          	li	a4,32
 268:	00e78023          	sb	a4,0(a5)
 26c:	02402783          	lw	a5,36(zero) # 24 <_irq_config>
 270:	05078713          	add	a4,a5,80
 274:	02e02223          	sw	a4,36(zero) # 24 <_irq_config>
 278:	00000793          	li	a5,0
 27c:	0007a783          	lw	a5,0(a5)
 280:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 284:	00e787b3          	add	a5,a5,a4
 288:	05800713          	li	a4,88
 28c:	00e78023          	sb	a4,0(a5)
 290:	00000793          	li	a5,0
 294:	0047a783          	lw	a5,4(a5)
 298:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 29c:	00e787b3          	add	a5,a5,a4
 2a0:	ff000713          	li	a4,-16
 2a4:	00e78023          	sb	a4,0(a5)
 2a8:	0900006f          	j	338 <_stack_size+0xb8>
 2ac:	00000793          	li	a5,0
 2b0:	0007a783          	lw	a5,0(a5)
 2b4:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 2b8:	00e787b3          	add	a5,a5,a4
 2bc:	02000713          	li	a4,32
 2c0:	00e78023          	sb	a4,0(a5)
 2c4:	02402783          	lw	a5,36(zero) # 24 <_irq_config>
 2c8:	00178713          	add	a4,a5,1
 2cc:	02e02223          	sw	a4,36(zero) # 24 <_irq_config>
 2d0:	00000793          	li	a5,0
 2d4:	0007a783          	lw	a5,0(a5)
 2d8:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 2dc:	00e787b3          	add	a5,a5,a4
 2e0:	05800713          	li	a4,88
 2e4:	00e78023          	sb	a4,0(a5)
 2e8:	00000793          	li	a5,0
 2ec:	0047a783          	lw	a5,4(a5)
 2f0:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 2f4:	00e787b3          	add	a5,a5,a4
 2f8:	ff000713          	li	a4,-16
 2fc:	00e78023          	sb	a4,0(a5)
 300:	0380006f          	j	338 <_stack_size+0xb8>
 304:	00000793          	li	a5,0
 308:	0047a783          	lw	a5,4(a5)
 30c:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 310:	00e787b3          	add	a5,a5,a4
 314:	fff00713          	li	a4,-1
 318:	00e78023          	sb	a4,0(a5)
 31c:	01c0006f          	j	338 <_stack_size+0xb8>
 320:	00000793          	li	a5,0
 324:	0047a783          	lw	a5,4(a5)
 328:	02402703          	lw	a4,36(zero) # 24 <_irq_config>
 32c:	00e787b3          	add	a5,a5,a4
 330:	00078023          	sb	zero,0(a5)
 334:	00000013          	nop
 338:	00000013          	nop
 33c:	00c12403          	lw	s0,12(sp)
 340:	01010113          	add	sp,sp,16
 344:	00008067          	ret

00000348 <clear_canvas>:
 348:	fe010113          	add	sp,sp,-32
 34c:	00812e23          	sw	s0,28(sp)
 350:	02010413          	add	s0,sp,32
 354:	fe042623          	sw	zero,-20(s0)
 358:	0940006f          	j	3ec <clear_canvas+0xa4>
 35c:	fe042423          	sw	zero,-24(s0)
 360:	0740006f          	j	3d4 <clear_canvas+0x8c>
 364:	00000793          	li	a5,0
 368:	0007a683          	lw	a3,0(a5)
 36c:	fec42703          	lw	a4,-20(s0)
 370:	00070793          	mv	a5,a4
 374:	00279793          	sll	a5,a5,0x2
 378:	00e787b3          	add	a5,a5,a4
 37c:	00479793          	sll	a5,a5,0x4
 380:	00078713          	mv	a4,a5
 384:	fe842783          	lw	a5,-24(s0)
 388:	00f707b3          	add	a5,a4,a5
 38c:	00f687b3          	add	a5,a3,a5
 390:	02000713          	li	a4,32
 394:	00e78023          	sb	a4,0(a5)
 398:	00000793          	li	a5,0
 39c:	0047a683          	lw	a3,4(a5)
 3a0:	fec42703          	lw	a4,-20(s0)
 3a4:	00070793          	mv	a5,a4
 3a8:	00279793          	sll	a5,a5,0x2
 3ac:	00e787b3          	add	a5,a5,a4
 3b0:	00479793          	sll	a5,a5,0x4
 3b4:	00078713          	mv	a4,a5
 3b8:	fe842783          	lw	a5,-24(s0)
 3bc:	00f707b3          	add	a5,a4,a5
 3c0:	00f687b3          	add	a5,a3,a5
 3c4:	00078023          	sb	zero,0(a5)
 3c8:	fe842783          	lw	a5,-24(s0)
 3cc:	00178793          	add	a5,a5,1
 3d0:	fef42423          	sw	a5,-24(s0)
 3d4:	fe842703          	lw	a4,-24(s0)
 3d8:	04f00793          	li	a5,79
 3dc:	f8e7d4e3          	bge	a5,a4,364 <clear_canvas+0x1c>
 3e0:	fec42783          	lw	a5,-20(s0)
 3e4:	00178793          	add	a5,a5,1
 3e8:	fef42623          	sw	a5,-20(s0)
 3ec:	fec42703          	lw	a4,-20(s0)
 3f0:	01d00793          	li	a5,29
 3f4:	f6e7d4e3          	bge	a5,a4,35c <clear_canvas+0x14>
 3f8:	00000793          	li	a5,0
 3fc:	0047a783          	lw	a5,4(a5)
 400:	fff00713          	li	a4,-1
 404:	00e78023          	sb	a4,0(a5)
 408:	00000013          	nop
 40c:	01c12403          	lw	s0,28(sp)
 410:	02010113          	add	sp,sp,32
 414:	00008067          	ret

00000418 <init_devices>:
 418:	ff010113          	add	sp,sp,-16
 41c:	00112623          	sw	ra,12(sp)
 420:	00812423          	sw	s0,8(sp)
 424:	01010413          	add	s0,sp,16
 428:	f21ff0ef          	jal	348 <clear_canvas>
 42c:	080007b7          	lui	a5,0x8000
 430:	00200713          	li	a4,2
 434:	00e7a823          	sw	a4,16(a5) # 8000010 <_gbl_ptr+0x7fff810>
 438:	080007b7          	lui	a5,0x8000
 43c:	00031737          	lui	a4,0x31
 440:	d4070713          	add	a4,a4,-704 # 30d40 <_gbl_ptr+0x30540>
 444:	00e7a423          	sw	a4,8(a5) # 8000008 <_gbl_ptr+0x7fff808>
 448:	00000013          	nop
 44c:	00c12083          	lw	ra,12(sp)
 450:	00812403          	lw	s0,8(sp)
 454:	01010113          	add	sp,sp,16
 458:	00008067          	ret

0000045c <main>:
 45c:	ff010113          	add	sp,sp,-16
 460:	00112623          	sw	ra,12(sp)
 464:	00812423          	sw	s0,8(sp)
 468:	01010413          	add	s0,sp,16
 46c:	fadff0ef          	jal	418 <init_devices>
 470:	02002223          	sw	zero,36(zero) # 24 <_irq_config>
 474:	00000793          	li	a5,0
 478:	00078513          	mv	a0,a5
 47c:	00c12083          	lw	ra,12(sp)
 480:	00812403          	lw	s0,8(sp)
 484:	01010113          	add	sp,sp,16
 488:	00008067          	ret

Disassembly of section .data:

00000000 <vga>:
   0:	0000                	.insn	2, 0x
   2:	0700                	.insn	2, 0x0700
   4:	1000                	.insn	2, 0x1000
   6:	0700                	.insn	2, 0x0700
   8:	2000                	.insn	2, 0x2000
   a:	0700                	.insn	2, 0x0700

0000000c <collider_obj>:
	...
  1c:	0100                	.insn	2, 0x0100
  1e:	ff00                	.insn	2, 0xff00

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

