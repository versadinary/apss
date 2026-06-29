
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	00000293          	li	t0,0
  10:	00400313          	li	t1,4

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
  48:	660000ef          	jal	6a8 <main>

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
 134:	00e02023          	sw	a4,0(zero) # 0 <_start>
 138:	00000013          	nop
 13c:	00c12403          	lw	s0,12(sp)
 140:	01010113          	add	sp,sp,16
 144:	00008067          	ret

00000148 <scan>:
 148:	fe010113          	add	sp,sp,-32
 14c:	00812e23          	sw	s0,28(sp)
 150:	02010413          	add	s0,sp,32
 154:	fea42623          	sw	a0,-20(s0)
 158:	00002023          	sw	zero,0(zero) # 0 <_start>
 15c:	00000013          	nop
 160:	00002783          	lw	a5,0(zero) # 0 <_start>
 164:	fe078ee3          	beqz	a5,160 <scan+0x18>
 168:	00000013          	nop
 16c:	00002703          	lw	a4,0(zero) # 0 <_start>
 170:	0f000793          	li	a5,240
 174:	fef71ce3          	bne	a4,a5,16c <scan+0x24>
 178:	00000013          	nop
 17c:	00002703          	lw	a4,0(zero) # 0 <_start>
 180:	0f000793          	li	a5,240
 184:	fef70ce3          	beq	a4,a5,17c <scan+0x34>
 188:	00002703          	lw	a4,0(zero) # 0 <_start>
 18c:	05a00793          	li	a5,90
 190:	00f71663          	bne	a4,a5,19c <scan+0x54>
 194:	00100793          	li	a5,1
 198:	1980006f          	j	330 <_stack_size+0xb0>
 19c:	00002703          	lw	a4,0(zero) # 0 <_start>
 1a0:	07600793          	li	a5,118
 1a4:	00f71663          	bne	a4,a5,1b0 <scan+0x68>
 1a8:	00200793          	li	a5,2
 1ac:	1840006f          	j	330 <_stack_size+0xb0>
 1b0:	00002703          	lw	a4,0(zero) # 0 <_start>
 1b4:	04500793          	li	a5,69
 1b8:	00f71663          	bne	a4,a5,1c4 <scan+0x7c>
 1bc:	fec42783          	lw	a5,-20(s0)
 1c0:	0007a023          	sw	zero,0(a5)
 1c4:	00002703          	lw	a4,0(zero) # 0 <_start>
 1c8:	01600793          	li	a5,22
 1cc:	00f71863          	bne	a4,a5,1dc <scan+0x94>
 1d0:	fec42783          	lw	a5,-20(s0)
 1d4:	00100713          	li	a4,1
 1d8:	00e7a023          	sw	a4,0(a5)
 1dc:	00002703          	lw	a4,0(zero) # 0 <_start>
 1e0:	01e00793          	li	a5,30
 1e4:	00f71863          	bne	a4,a5,1f4 <scan+0xac>
 1e8:	fec42783          	lw	a5,-20(s0)
 1ec:	00200713          	li	a4,2
 1f0:	00e7a023          	sw	a4,0(a5)
 1f4:	00002703          	lw	a4,0(zero) # 0 <_start>
 1f8:	02600793          	li	a5,38
 1fc:	00f71863          	bne	a4,a5,20c <scan+0xc4>
 200:	fec42783          	lw	a5,-20(s0)
 204:	00300713          	li	a4,3
 208:	00e7a023          	sw	a4,0(a5)
 20c:	00002703          	lw	a4,0(zero) # 0 <_start>
 210:	02500793          	li	a5,37
 214:	00f71863          	bne	a4,a5,224 <scan+0xdc>
 218:	fec42783          	lw	a5,-20(s0)
 21c:	00400713          	li	a4,4
 220:	00e7a023          	sw	a4,0(a5)
 224:	00002703          	lw	a4,0(zero) # 0 <_start>
 228:	02e00793          	li	a5,46
 22c:	00f71863          	bne	a4,a5,23c <scan+0xf4>
 230:	fec42783          	lw	a5,-20(s0)
 234:	00500713          	li	a4,5
 238:	00e7a023          	sw	a4,0(a5)
 23c:	00002703          	lw	a4,0(zero) # 0 <_start>
 240:	03600793          	li	a5,54
 244:	00f71863          	bne	a4,a5,254 <scan+0x10c>
 248:	fec42783          	lw	a5,-20(s0)
 24c:	00600713          	li	a4,6
 250:	00e7a023          	sw	a4,0(a5)
 254:	00002703          	lw	a4,0(zero) # 0 <_start>
 258:	03d00793          	li	a5,61
 25c:	00f71863          	bne	a4,a5,26c <scan+0x124>
 260:	fec42783          	lw	a5,-20(s0)
 264:	00700713          	li	a4,7
 268:	00e7a023          	sw	a4,0(a5)
 26c:	00002703          	lw	a4,0(zero) # 0 <_start>
 270:	03e00793          	li	a5,62
 274:	00f71863          	bne	a4,a5,284 <_stack_size+0x4>
 278:	fec42783          	lw	a5,-20(s0)
 27c:	00800713          	li	a4,8
 280:	00e7a023          	sw	a4,0(a5)
 284:	00002703          	lw	a4,0(zero) # 0 <_start>
 288:	04600793          	li	a5,70
 28c:	00f71863          	bne	a4,a5,29c <_stack_size+0x1c>
 290:	fec42783          	lw	a5,-20(s0)
 294:	00900713          	li	a4,9
 298:	00e7a023          	sw	a4,0(a5)
 29c:	00002703          	lw	a4,0(zero) # 0 <_start>
 2a0:	01c00793          	li	a5,28
 2a4:	00f71863          	bne	a4,a5,2b4 <_stack_size+0x34>
 2a8:	fec42783          	lw	a5,-20(s0)
 2ac:	00a00713          	li	a4,10
 2b0:	00e7a023          	sw	a4,0(a5)
 2b4:	00002703          	lw	a4,0(zero) # 0 <_start>
 2b8:	03200793          	li	a5,50
 2bc:	00f71863          	bne	a4,a5,2cc <_stack_size+0x4c>
 2c0:	fec42783          	lw	a5,-20(s0)
 2c4:	00b00713          	li	a4,11
 2c8:	00e7a023          	sw	a4,0(a5)
 2cc:	00002703          	lw	a4,0(zero) # 0 <_start>
 2d0:	02100793          	li	a5,33
 2d4:	00f71863          	bne	a4,a5,2e4 <_stack_size+0x64>
 2d8:	fec42783          	lw	a5,-20(s0)
 2dc:	00c00713          	li	a4,12
 2e0:	00e7a023          	sw	a4,0(a5)
 2e4:	00002703          	lw	a4,0(zero) # 0 <_start>
 2e8:	02300793          	li	a5,35
 2ec:	00f71863          	bne	a4,a5,2fc <_stack_size+0x7c>
 2f0:	fec42783          	lw	a5,-20(s0)
 2f4:	00d00713          	li	a4,13
 2f8:	00e7a023          	sw	a4,0(a5)
 2fc:	00002703          	lw	a4,0(zero) # 0 <_start>
 300:	02400793          	li	a5,36
 304:	00f71863          	bne	a4,a5,314 <_stack_size+0x94>
 308:	fec42783          	lw	a5,-20(s0)
 30c:	00e00713          	li	a4,14
 310:	00e7a023          	sw	a4,0(a5)
 314:	00002703          	lw	a4,0(zero) # 0 <_start>
 318:	02b00793          	li	a5,43
 31c:	00f71863          	bne	a4,a5,32c <_stack_size+0xac>
 320:	fec42783          	lw	a5,-20(s0)
 324:	00f00713          	li	a4,15
 328:	00e7a023          	sw	a4,0(a5)
 32c:	00000793          	li	a5,0
 330:	00078513          	mv	a0,a5
 334:	01c12403          	lw	s0,28(sp)
 338:	02010113          	add	sp,sp,32
 33c:	00008067          	ret

00000340 <print>:
 340:	fe010113          	add	sp,sp,-32
 344:	00812e23          	sw	s0,28(sp)
 348:	02010413          	add	s0,sp,32
 34c:	fea42623          	sw	a0,-20(s0)
 350:	feb42423          	sw	a1,-24(s0)
 354:	fe842783          	lw	a5,-24(s0)
 358:	00079a63          	bnez	a5,36c <print+0x2c>
 35c:	040007b7          	lui	a5,0x4000
 360:	fec42703          	lw	a4,-20(s0)
 364:	00072703          	lw	a4,0(a4)
 368:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 36c:	fe842703          	lw	a4,-24(s0)
 370:	00100793          	li	a5,1
 374:	00f71a63          	bne	a4,a5,388 <print+0x48>
 378:	040007b7          	lui	a5,0x4000
 37c:	fec42703          	lw	a4,-20(s0)
 380:	00072703          	lw	a4,0(a4)
 384:	00e7a223          	sw	a4,4(a5) # 4000004 <_gbl_ptr+0x3fff804>
 388:	fe842703          	lw	a4,-24(s0)
 38c:	00200793          	li	a5,2
 390:	00f71a63          	bne	a4,a5,3a4 <print+0x64>
 394:	040007b7          	lui	a5,0x4000
 398:	fec42703          	lw	a4,-20(s0)
 39c:	00072703          	lw	a4,0(a4)
 3a0:	00e7a423          	sw	a4,8(a5) # 4000008 <_gbl_ptr+0x3fff808>
 3a4:	fe842703          	lw	a4,-24(s0)
 3a8:	00300793          	li	a5,3
 3ac:	00f71a63          	bne	a4,a5,3c0 <print+0x80>
 3b0:	040007b7          	lui	a5,0x4000
 3b4:	fec42703          	lw	a4,-20(s0)
 3b8:	00072703          	lw	a4,0(a4)
 3bc:	00e7a623          	sw	a4,12(a5) # 400000c <_gbl_ptr+0x3fff80c>
 3c0:	fe842703          	lw	a4,-24(s0)
 3c4:	00400793          	li	a5,4
 3c8:	00f71a63          	bne	a4,a5,3dc <print+0x9c>
 3cc:	040007b7          	lui	a5,0x4000
 3d0:	fec42703          	lw	a4,-20(s0)
 3d4:	00072703          	lw	a4,0(a4)
 3d8:	00e7a823          	sw	a4,16(a5) # 4000010 <_gbl_ptr+0x3fff810>
 3dc:	fe842703          	lw	a4,-24(s0)
 3e0:	00500793          	li	a5,5
 3e4:	00f71a63          	bne	a4,a5,3f8 <print+0xb8>
 3e8:	040007b7          	lui	a5,0x4000
 3ec:	fec42703          	lw	a4,-20(s0)
 3f0:	00072703          	lw	a4,0(a4)
 3f4:	00e7aa23          	sw	a4,20(a5) # 4000014 <_gbl_ptr+0x3fff814>
 3f8:	fe842703          	lw	a4,-24(s0)
 3fc:	00600793          	li	a5,6
 400:	00f71a63          	bne	a4,a5,414 <print+0xd4>
 404:	040007b7          	lui	a5,0x4000
 408:	fec42703          	lw	a4,-20(s0)
 40c:	00072703          	lw	a4,0(a4)
 410:	00e7ac23          	sw	a4,24(a5) # 4000018 <_gbl_ptr+0x3fff818>
 414:	fe842703          	lw	a4,-24(s0)
 418:	00700793          	li	a5,7
 41c:	00f71a63          	bne	a4,a5,430 <print+0xf0>
 420:	040007b7          	lui	a5,0x4000
 424:	fec42703          	lw	a4,-20(s0)
 428:	00072703          	lw	a4,0(a4)
 42c:	00e7ae23          	sw	a4,28(a5) # 400001c <_gbl_ptr+0x3fff81c>
 430:	040007b7          	lui	a5,0x4000
 434:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 438:	040007b7          	lui	a5,0x4000
 43c:	00171713          	sll	a4,a4,0x1
 440:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 444:	040007b7          	lui	a5,0x4000
 448:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 44c:	040007b7          	lui	a5,0x4000
 450:	00170713          	add	a4,a4,1
 454:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 458:	00000013          	nop
 45c:	01c12403          	lw	s0,28(sp)
 460:	02010113          	add	sp,sp,32
 464:	00008067          	ret

00000468 <product>:
 468:	fd010113          	add	sp,sp,-48
 46c:	02112623          	sw	ra,44(sp)
 470:	02812423          	sw	s0,40(sp)
 474:	03010413          	add	s0,sp,48
 478:	fc042e23          	sw	zero,-36(s0)
 47c:	fe042623          	sw	zero,-20(s0)
 480:	fe042423          	sw	zero,-24(s0)
 484:	fe042223          	sw	zero,-28(s0)
 488:	0400006f          	j	4c8 <product+0x60>
 48c:	fec42703          	lw	a4,-20(s0)
 490:	fdc40793          	add	a5,s0,-36
 494:	00070593          	mv	a1,a4
 498:	00078513          	mv	a0,a5
 49c:	ea5ff0ef          	jal	340 <print>
 4a0:	fec42783          	lw	a5,-20(s0)
 4a4:	00178793          	add	a5,a5,1
 4a8:	fef42623          	sw	a5,-20(s0)
 4ac:	fe842703          	lw	a4,-24(s0)
 4b0:	fdc42783          	lw	a5,-36(s0)
 4b4:	00f707b3          	add	a5,a4,a5
 4b8:	fef42423          	sw	a5,-24(s0)
 4bc:	fe842783          	lw	a5,-24(s0)
 4c0:	00479793          	sll	a5,a5,0x4
 4c4:	fef42423          	sw	a5,-24(s0)
 4c8:	fdc40793          	add	a5,s0,-36
 4cc:	00078513          	mv	a0,a5
 4d0:	c79ff0ef          	jal	148 <scan>
 4d4:	00050793          	mv	a5,a0
 4d8:	00f04863          	bgtz	a5,4e8 <product+0x80>
 4dc:	fec42703          	lw	a4,-20(s0)
 4e0:	00700793          	li	a5,7
 4e4:	fae7d4e3          	bge	a5,a4,48c <product+0x24>
 4e8:	fe842783          	lw	a5,-24(s0)
 4ec:	4047d793          	sra	a5,a5,0x4
 4f0:	fef42423          	sw	a5,-24(s0)
 4f4:	040007b7          	lui	a5,0x4000
 4f8:	00100713          	li	a4,1
 4fc:	02e7a223          	sw	a4,36(a5) # 4000024 <_gbl_ptr+0x3fff824>
 500:	040007b7          	lui	a5,0x4000
 504:	0207a223          	sw	zero,36(a5) # 4000024 <_gbl_ptr+0x3fff824>
 508:	fe042623          	sw	zero,-20(s0)
 50c:	fc042e23          	sw	zero,-36(s0)
 510:	0400006f          	j	550 <product+0xe8>
 514:	fec42703          	lw	a4,-20(s0)
 518:	fdc40793          	add	a5,s0,-36
 51c:	00070593          	mv	a1,a4
 520:	00078513          	mv	a0,a5
 524:	e1dff0ef          	jal	340 <print>
 528:	fec42783          	lw	a5,-20(s0)
 52c:	00178793          	add	a5,a5,1
 530:	fef42623          	sw	a5,-20(s0)
 534:	fe442703          	lw	a4,-28(s0)
 538:	fdc42783          	lw	a5,-36(s0)
 53c:	00f707b3          	add	a5,a4,a5
 540:	fef42223          	sw	a5,-28(s0)
 544:	fe442783          	lw	a5,-28(s0)
 548:	00479793          	sll	a5,a5,0x4
 54c:	fef42223          	sw	a5,-28(s0)
 550:	fdc40793          	add	a5,s0,-36
 554:	00078513          	mv	a0,a5
 558:	bf1ff0ef          	jal	148 <scan>
 55c:	00050793          	mv	a5,a0
 560:	00f04863          	bgtz	a5,570 <product+0x108>
 564:	fec42703          	lw	a4,-20(s0)
 568:	00700793          	li	a5,7
 56c:	fae7d4e3          	bge	a5,a4,514 <product+0xac>
 570:	fe442783          	lw	a5,-28(s0)
 574:	4047d793          	sra	a5,a5,0x4
 578:	fef42223          	sw	a5,-28(s0)
 57c:	fe042023          	sw	zero,-32(s0)
 580:	040007b7          	lui	a5,0x4000
 584:	00100713          	li	a4,1
 588:	02e7a223          	sw	a4,36(a5) # 4000024 <_gbl_ptr+0x3fff824>
 58c:	040007b7          	lui	a5,0x4000
 590:	0207a223          	sw	zero,36(a5) # 4000024 <_gbl_ptr+0x3fff824>
 594:	0380006f          	j	5cc <_stack_ptr+0x4c>
 598:	fe442783          	lw	a5,-28(s0)
 59c:	0017f793          	and	a5,a5,1
 5a0:	00078a63          	beqz	a5,5b4 <_stack_ptr+0x34>
 5a4:	fe842783          	lw	a5,-24(s0)
 5a8:	fe042703          	lw	a4,-32(s0)
 5ac:	00f707b3          	add	a5,a4,a5
 5b0:	fef42023          	sw	a5,-32(s0)
 5b4:	fe842783          	lw	a5,-24(s0)
 5b8:	00179793          	sll	a5,a5,0x1
 5bc:	fef42423          	sw	a5,-24(s0)
 5c0:	fe442783          	lw	a5,-28(s0)
 5c4:	4017d793          	sra	a5,a5,0x1
 5c8:	fef42223          	sw	a5,-28(s0)
 5cc:	fe442783          	lw	a5,-28(s0)
 5d0:	fcf044e3          	bgtz	a5,598 <_stack_ptr+0x18>
 5d4:	040007b7          	lui	a5,0x4000
 5d8:	0ff00713          	li	a4,255
 5dc:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 5e0:	040007b7          	lui	a5,0x4000
 5e4:	fe042703          	lw	a4,-32(s0)
 5e8:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 5ec:	fe042783          	lw	a5,-32(s0)
 5f0:	0047d793          	srl	a5,a5,0x4
 5f4:	fef42023          	sw	a5,-32(s0)
 5f8:	040007b7          	lui	a5,0x4000
 5fc:	fe042703          	lw	a4,-32(s0)
 600:	00e7a223          	sw	a4,4(a5) # 4000004 <_gbl_ptr+0x3fff804>
 604:	fe042783          	lw	a5,-32(s0)
 608:	0047d793          	srl	a5,a5,0x4
 60c:	fef42023          	sw	a5,-32(s0)
 610:	040007b7          	lui	a5,0x4000
 614:	fe042703          	lw	a4,-32(s0)
 618:	00e7a423          	sw	a4,8(a5) # 4000008 <_gbl_ptr+0x3fff808>
 61c:	fe042783          	lw	a5,-32(s0)
 620:	0047d793          	srl	a5,a5,0x4
 624:	fef42023          	sw	a5,-32(s0)
 628:	040007b7          	lui	a5,0x4000
 62c:	fe042703          	lw	a4,-32(s0)
 630:	00e7a623          	sw	a4,12(a5) # 400000c <_gbl_ptr+0x3fff80c>
 634:	fe042783          	lw	a5,-32(s0)
 638:	0047d793          	srl	a5,a5,0x4
 63c:	fef42023          	sw	a5,-32(s0)
 640:	040007b7          	lui	a5,0x4000
 644:	fe042703          	lw	a4,-32(s0)
 648:	00e7a823          	sw	a4,16(a5) # 4000010 <_gbl_ptr+0x3fff810>
 64c:	fe042783          	lw	a5,-32(s0)
 650:	0047d793          	srl	a5,a5,0x4
 654:	fef42023          	sw	a5,-32(s0)
 658:	040007b7          	lui	a5,0x4000
 65c:	fe042703          	lw	a4,-32(s0)
 660:	00e7aa23          	sw	a4,20(a5) # 4000014 <_gbl_ptr+0x3fff814>
 664:	fe042783          	lw	a5,-32(s0)
 668:	0047d793          	srl	a5,a5,0x4
 66c:	fef42023          	sw	a5,-32(s0)
 670:	040007b7          	lui	a5,0x4000
 674:	fe042703          	lw	a4,-32(s0)
 678:	00e7ac23          	sw	a4,24(a5) # 4000018 <_gbl_ptr+0x3fff818>
 67c:	fe042783          	lw	a5,-32(s0)
 680:	0047d793          	srl	a5,a5,0x4
 684:	fef42023          	sw	a5,-32(s0)
 688:	040007b7          	lui	a5,0x4000
 68c:	fe042703          	lw	a4,-32(s0)
 690:	00e7ae23          	sw	a4,28(a5) # 400001c <_gbl_ptr+0x3fff81c>
 694:	00000013          	nop
 698:	02c12083          	lw	ra,44(sp)
 69c:	02812403          	lw	s0,40(sp)
 6a0:	03010113          	add	sp,sp,48
 6a4:	00008067          	ret

000006a8 <main>:
 6a8:	fe010113          	add	sp,sp,-32
 6ac:	00112e23          	sw	ra,28(sp)
 6b0:	00812c23          	sw	s0,24(sp)
 6b4:	02010413          	add	s0,sp,32
 6b8:	fe042623          	sw	zero,-20(s0)
 6bc:	dadff0ef          	jal	468 <product>
 6c0:	fec40793          	add	a5,s0,-20
 6c4:	00078513          	mv	a0,a5
 6c8:	a81ff0ef          	jal	148 <scan>
 6cc:	00050713          	mv	a4,a0
 6d0:	00100793          	li	a5,1
 6d4:	fef712e3          	bne	a4,a5,6b8 <main+0x10>
 6d8:	040007b7          	lui	a5,0x4000
 6dc:	00100713          	li	a4,1
 6e0:	02e7a223          	sw	a4,36(a5) # 4000024 <_gbl_ptr+0x3fff824>
 6e4:	fd5ff06f          	j	6b8 <main+0x10>

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
  1e:	32727363          	bgeu	tp,t2,344 <print+0x4>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

