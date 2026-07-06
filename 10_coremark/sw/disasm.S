
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	00003117          	auipc	sp,0x3
   c:	5f810113          	add	sp,sp,1528 # 3600 <_stack_ptr>
  10:	00000293          	li	t0,0
  14:	00400313          	li	t1,4

00000018 <_bss_init_loop>:
  18:	00534863          	blt	t1,t0,28 <_irq_config>
  1c:	0002a023          	sw	zero,0(t0)
  20:	00428293          	add	t0,t0,4
  24:	ff5ff06f          	j	18 <_bss_init_loop>

00000028 <_irq_config>:
  28:	05400293          	li	t0,84
  2c:	fff00313          	li	t1,-1
  30:	00004397          	auipc	t2,0x4
  34:	fd038393          	add	t2,t2,-48 # 4000 <_trap_stack_ptr>
  38:	30529073          	csrw	mtvec,t0
  3c:	34039073          	csrw	mscratch,t2
  40:	30431073          	csrw	mie,t1

00000044 <_main_call>:
  44:	00000513          	li	a0,0
  48:	00000593          	li	a1,0
  4c:	664000ef          	jal	6b0 <main>

00000050 <_endless_loop>:
  50:	0000006f          	j	50 <_endless_loop>

00000054 <_int_handler>:
  54:	34011173          	csrrw	sp,mscratch,sp
  58:	fb010113          	add	sp,sp,-80
  5c:	00112223          	sw	ra,4(sp)
  60:	00003097          	auipc	ra,0x3
  64:	5a008093          	add	ra,ra,1440 # 3600 <_stack_ptr>
  68:	fe1144e3          	blt	sp,ra,50 <_endless_loop>
  6c:	00512623          	sw	t0,12(sp)
  70:	00612823          	sw	t1,16(sp)
  74:	00712a23          	sw	t2,20(sp)
  78:	00a12c23          	sw	a0,24(sp)
  7c:	00b12e23          	sw	a1,28(sp)
  80:	02c12023          	sw	a2,32(sp)
  84:	02d12223          	sw	a3,36(sp)
  88:	02e12423          	sw	a4,40(sp)
  8c:	02f12623          	sw	a5,44(sp)
  90:	03012823          	sw	a6,48(sp)
  94:	03112a23          	sw	a7,52(sp)
  98:	03c12c23          	sw	t3,56(sp)
  9c:	03d12e23          	sw	t4,60(sp)
  a0:	05e12023          	sw	t5,64(sp)
  a4:	05f12223          	sw	t6,68(sp)
  a8:	340022f3          	csrr	t0,mscratch
  ac:	34102373          	csrr	t1,mepc
  b0:	34202573          	csrr	a0,mcause
  b4:	00512423          	sw	t0,8(sp)
  b8:	04612423          	sw	t1,72(sp)
  bc:	04a12623          	sw	a0,76(sp)
  c0:	068000ef          	jal	128 <int_handler>
  c4:	00010513          	mv	a0,sp
  c8:	04852303          	lw	t1,72(a0)
  cc:	04c52383          	lw	t2,76(a0)
  d0:	05010113          	add	sp,sp,80
  d4:	34011073          	csrw	mscratch,sp
  d8:	34131073          	csrw	mepc,t1
  dc:	34239073          	csrw	mcause,t2
  e0:	00452083          	lw	ra,4(a0)
  e4:	00852103          	lw	sp,8(a0)
  e8:	00c52283          	lw	t0,12(a0)
  ec:	01052303          	lw	t1,16(a0)
  f0:	01452383          	lw	t2,20(a0)
  f4:	01c52583          	lw	a1,28(a0)
  f8:	02052603          	lw	a2,32(a0)
  fc:	02452683          	lw	a3,36(a0)
 100:	02852703          	lw	a4,40(a0)
 104:	02c52783          	lw	a5,44(a0)
 108:	03052803          	lw	a6,48(a0)
 10c:	03452883          	lw	a7,52(a0)
 110:	03852e03          	lw	t3,56(a0)
 114:	03c52e83          	lw	t4,60(a0)
 118:	04052f03          	lw	t5,64(a0)
 11c:	04452f83          	lw	t6,68(a0)
 120:	01852503          	lw	a0,24(a0)
 124:	30200073          	mret

00000128 <int_handler>:
 128:	ff010113          	add	sp,sp,-16
 12c:	00812623          	sw	s0,12(sp)
 130:	01010413          	add	s0,sp,16
 134:	030007b7          	lui	a5,0x3000
 138:	0007a703          	lw	a4,0(a5) # 3000000 <_trap_stack_ptr+0x2ffc000>
 13c:	00e02023          	sw	a4,0(zero) # 0 <_start>
 140:	00000013          	nop
 144:	00c12403          	lw	s0,12(sp)
 148:	01010113          	add	sp,sp,16
 14c:	00008067          	ret

00000150 <scan>:
 150:	fe010113          	add	sp,sp,-32
 154:	00812e23          	sw	s0,28(sp)
 158:	02010413          	add	s0,sp,32
 15c:	fea42623          	sw	a0,-20(s0)
 160:	00002023          	sw	zero,0(zero) # 0 <_start>
 164:	00000013          	nop
 168:	00002783          	lw	a5,0(zero) # 0 <_start>
 16c:	fe078ee3          	beqz	a5,168 <scan+0x18>
 170:	00000013          	nop
 174:	00002703          	lw	a4,0(zero) # 0 <_start>
 178:	0f000793          	li	a5,240
 17c:	fef71ce3          	bne	a4,a5,174 <scan+0x24>
 180:	00000013          	nop
 184:	00002703          	lw	a4,0(zero) # 0 <_start>
 188:	0f000793          	li	a5,240
 18c:	fef70ce3          	beq	a4,a5,184 <scan+0x34>
 190:	00002703          	lw	a4,0(zero) # 0 <_start>
 194:	05a00793          	li	a5,90
 198:	00f71663          	bne	a4,a5,1a4 <scan+0x54>
 19c:	00100793          	li	a5,1
 1a0:	1980006f          	j	338 <scan+0x1e8>
 1a4:	00002703          	lw	a4,0(zero) # 0 <_start>
 1a8:	07600793          	li	a5,118
 1ac:	00f71663          	bne	a4,a5,1b8 <scan+0x68>
 1b0:	00200793          	li	a5,2
 1b4:	1840006f          	j	338 <scan+0x1e8>
 1b8:	00002703          	lw	a4,0(zero) # 0 <_start>
 1bc:	04500793          	li	a5,69
 1c0:	00f71663          	bne	a4,a5,1cc <scan+0x7c>
 1c4:	fec42783          	lw	a5,-20(s0)
 1c8:	0007a023          	sw	zero,0(a5)
 1cc:	00002703          	lw	a4,0(zero) # 0 <_start>
 1d0:	01600793          	li	a5,22
 1d4:	00f71863          	bne	a4,a5,1e4 <scan+0x94>
 1d8:	fec42783          	lw	a5,-20(s0)
 1dc:	00100713          	li	a4,1
 1e0:	00e7a023          	sw	a4,0(a5)
 1e4:	00002703          	lw	a4,0(zero) # 0 <_start>
 1e8:	01e00793          	li	a5,30
 1ec:	00f71863          	bne	a4,a5,1fc <scan+0xac>
 1f0:	fec42783          	lw	a5,-20(s0)
 1f4:	00200713          	li	a4,2
 1f8:	00e7a023          	sw	a4,0(a5)
 1fc:	00002703          	lw	a4,0(zero) # 0 <_start>
 200:	02600793          	li	a5,38
 204:	00f71863          	bne	a4,a5,214 <scan+0xc4>
 208:	fec42783          	lw	a5,-20(s0)
 20c:	00300713          	li	a4,3
 210:	00e7a023          	sw	a4,0(a5)
 214:	00002703          	lw	a4,0(zero) # 0 <_start>
 218:	02500793          	li	a5,37
 21c:	00f71863          	bne	a4,a5,22c <scan+0xdc>
 220:	fec42783          	lw	a5,-20(s0)
 224:	00400713          	li	a4,4
 228:	00e7a023          	sw	a4,0(a5)
 22c:	00002703          	lw	a4,0(zero) # 0 <_start>
 230:	02e00793          	li	a5,46
 234:	00f71863          	bne	a4,a5,244 <scan+0xf4>
 238:	fec42783          	lw	a5,-20(s0)
 23c:	00500713          	li	a4,5
 240:	00e7a023          	sw	a4,0(a5)
 244:	00002703          	lw	a4,0(zero) # 0 <_start>
 248:	03600793          	li	a5,54
 24c:	00f71863          	bne	a4,a5,25c <scan+0x10c>
 250:	fec42783          	lw	a5,-20(s0)
 254:	00600713          	li	a4,6
 258:	00e7a023          	sw	a4,0(a5)
 25c:	00002703          	lw	a4,0(zero) # 0 <_start>
 260:	03d00793          	li	a5,61
 264:	00f71863          	bne	a4,a5,274 <scan+0x124>
 268:	fec42783          	lw	a5,-20(s0)
 26c:	00700713          	li	a4,7
 270:	00e7a023          	sw	a4,0(a5)
 274:	00002703          	lw	a4,0(zero) # 0 <_start>
 278:	03e00793          	li	a5,62
 27c:	00f71863          	bne	a4,a5,28c <scan+0x13c>
 280:	fec42783          	lw	a5,-20(s0)
 284:	00800713          	li	a4,8
 288:	00e7a023          	sw	a4,0(a5)
 28c:	00002703          	lw	a4,0(zero) # 0 <_start>
 290:	04600793          	li	a5,70
 294:	00f71863          	bne	a4,a5,2a4 <scan+0x154>
 298:	fec42783          	lw	a5,-20(s0)
 29c:	00900713          	li	a4,9
 2a0:	00e7a023          	sw	a4,0(a5)
 2a4:	00002703          	lw	a4,0(zero) # 0 <_start>
 2a8:	01c00793          	li	a5,28
 2ac:	00f71863          	bne	a4,a5,2bc <scan+0x16c>
 2b0:	fec42783          	lw	a5,-20(s0)
 2b4:	00a00713          	li	a4,10
 2b8:	00e7a023          	sw	a4,0(a5)
 2bc:	00002703          	lw	a4,0(zero) # 0 <_start>
 2c0:	03200793          	li	a5,50
 2c4:	00f71863          	bne	a4,a5,2d4 <scan+0x184>
 2c8:	fec42783          	lw	a5,-20(s0)
 2cc:	00b00713          	li	a4,11
 2d0:	00e7a023          	sw	a4,0(a5)
 2d4:	00002703          	lw	a4,0(zero) # 0 <_start>
 2d8:	02100793          	li	a5,33
 2dc:	00f71863          	bne	a4,a5,2ec <scan+0x19c>
 2e0:	fec42783          	lw	a5,-20(s0)
 2e4:	00c00713          	li	a4,12
 2e8:	00e7a023          	sw	a4,0(a5)
 2ec:	00002703          	lw	a4,0(zero) # 0 <_start>
 2f0:	02300793          	li	a5,35
 2f4:	00f71863          	bne	a4,a5,304 <scan+0x1b4>
 2f8:	fec42783          	lw	a5,-20(s0)
 2fc:	00d00713          	li	a4,13
 300:	00e7a023          	sw	a4,0(a5)
 304:	00002703          	lw	a4,0(zero) # 0 <_start>
 308:	02400793          	li	a5,36
 30c:	00f71863          	bne	a4,a5,31c <scan+0x1cc>
 310:	fec42783          	lw	a5,-20(s0)
 314:	00e00713          	li	a4,14
 318:	00e7a023          	sw	a4,0(a5)
 31c:	00002703          	lw	a4,0(zero) # 0 <_start>
 320:	02b00793          	li	a5,43
 324:	00f71863          	bne	a4,a5,334 <scan+0x1e4>
 328:	fec42783          	lw	a5,-20(s0)
 32c:	00f00713          	li	a4,15
 330:	00e7a023          	sw	a4,0(a5)
 334:	00000793          	li	a5,0
 338:	00078513          	mv	a0,a5
 33c:	01c12403          	lw	s0,28(sp)
 340:	02010113          	add	sp,sp,32
 344:	00008067          	ret

00000348 <print>:
 348:	fe010113          	add	sp,sp,-32
 34c:	00812e23          	sw	s0,28(sp)
 350:	02010413          	add	s0,sp,32
 354:	fea42623          	sw	a0,-20(s0)
 358:	feb42423          	sw	a1,-24(s0)
 35c:	fe842783          	lw	a5,-24(s0)
 360:	00079a63          	bnez	a5,374 <print+0x2c>
 364:	040007b7          	lui	a5,0x4000
 368:	fec42703          	lw	a4,-20(s0)
 36c:	00072703          	lw	a4,0(a4)
 370:	00e7a023          	sw	a4,0(a5) # 4000000 <_trap_stack_ptr+0x3ffc000>
 374:	fe842703          	lw	a4,-24(s0)
 378:	00100793          	li	a5,1
 37c:	00f71a63          	bne	a4,a5,390 <print+0x48>
 380:	040007b7          	lui	a5,0x4000
 384:	fec42703          	lw	a4,-20(s0)
 388:	00072703          	lw	a4,0(a4)
 38c:	00e7a223          	sw	a4,4(a5) # 4000004 <_trap_stack_ptr+0x3ffc004>
 390:	fe842703          	lw	a4,-24(s0)
 394:	00200793          	li	a5,2
 398:	00f71a63          	bne	a4,a5,3ac <print+0x64>
 39c:	040007b7          	lui	a5,0x4000
 3a0:	fec42703          	lw	a4,-20(s0)
 3a4:	00072703          	lw	a4,0(a4)
 3a8:	00e7a423          	sw	a4,8(a5) # 4000008 <_trap_stack_ptr+0x3ffc008>
 3ac:	fe842703          	lw	a4,-24(s0)
 3b0:	00300793          	li	a5,3
 3b4:	00f71a63          	bne	a4,a5,3c8 <print+0x80>
 3b8:	040007b7          	lui	a5,0x4000
 3bc:	fec42703          	lw	a4,-20(s0)
 3c0:	00072703          	lw	a4,0(a4)
 3c4:	00e7a623          	sw	a4,12(a5) # 400000c <_trap_stack_ptr+0x3ffc00c>
 3c8:	fe842703          	lw	a4,-24(s0)
 3cc:	00400793          	li	a5,4
 3d0:	00f71a63          	bne	a4,a5,3e4 <print+0x9c>
 3d4:	040007b7          	lui	a5,0x4000
 3d8:	fec42703          	lw	a4,-20(s0)
 3dc:	00072703          	lw	a4,0(a4)
 3e0:	00e7a823          	sw	a4,16(a5) # 4000010 <_trap_stack_ptr+0x3ffc010>
 3e4:	fe842703          	lw	a4,-24(s0)
 3e8:	00500793          	li	a5,5
 3ec:	00f71a63          	bne	a4,a5,400 <print+0xb8>
 3f0:	040007b7          	lui	a5,0x4000
 3f4:	fec42703          	lw	a4,-20(s0)
 3f8:	00072703          	lw	a4,0(a4)
 3fc:	00e7aa23          	sw	a4,20(a5) # 4000014 <_trap_stack_ptr+0x3ffc014>
 400:	fe842703          	lw	a4,-24(s0)
 404:	00600793          	li	a5,6
 408:	00f71a63          	bne	a4,a5,41c <print+0xd4>
 40c:	040007b7          	lui	a5,0x4000
 410:	fec42703          	lw	a4,-20(s0)
 414:	00072703          	lw	a4,0(a4)
 418:	00e7ac23          	sw	a4,24(a5) # 4000018 <_trap_stack_ptr+0x3ffc018>
 41c:	fe842703          	lw	a4,-24(s0)
 420:	00700793          	li	a5,7
 424:	00f71a63          	bne	a4,a5,438 <print+0xf0>
 428:	040007b7          	lui	a5,0x4000
 42c:	fec42703          	lw	a4,-20(s0)
 430:	00072703          	lw	a4,0(a4)
 434:	00e7ae23          	sw	a4,28(a5) # 400001c <_trap_stack_ptr+0x3ffc01c>
 438:	040007b7          	lui	a5,0x4000
 43c:	0207a703          	lw	a4,32(a5) # 4000020 <_trap_stack_ptr+0x3ffc020>
 440:	040007b7          	lui	a5,0x4000
 444:	00171713          	sll	a4,a4,0x1
 448:	02e7a023          	sw	a4,32(a5) # 4000020 <_trap_stack_ptr+0x3ffc020>
 44c:	040007b7          	lui	a5,0x4000
 450:	0207a703          	lw	a4,32(a5) # 4000020 <_trap_stack_ptr+0x3ffc020>
 454:	040007b7          	lui	a5,0x4000
 458:	00170713          	add	a4,a4,1
 45c:	02e7a023          	sw	a4,32(a5) # 4000020 <_trap_stack_ptr+0x3ffc020>
 460:	00000013          	nop
 464:	01c12403          	lw	s0,28(sp)
 468:	02010113          	add	sp,sp,32
 46c:	00008067          	ret

00000470 <product>:
 470:	fd010113          	add	sp,sp,-48
 474:	02112623          	sw	ra,44(sp)
 478:	02812423          	sw	s0,40(sp)
 47c:	03010413          	add	s0,sp,48
 480:	fc042e23          	sw	zero,-36(s0)
 484:	fe042623          	sw	zero,-20(s0)
 488:	fe042423          	sw	zero,-24(s0)
 48c:	fe042223          	sw	zero,-28(s0)
 490:	0400006f          	j	4d0 <product+0x60>
 494:	fec42703          	lw	a4,-20(s0)
 498:	fdc40793          	add	a5,s0,-36
 49c:	00070593          	mv	a1,a4
 4a0:	00078513          	mv	a0,a5
 4a4:	ea5ff0ef          	jal	348 <print>
 4a8:	fec42783          	lw	a5,-20(s0)
 4ac:	00178793          	add	a5,a5,1
 4b0:	fef42623          	sw	a5,-20(s0)
 4b4:	fe842703          	lw	a4,-24(s0)
 4b8:	fdc42783          	lw	a5,-36(s0)
 4bc:	00f707b3          	add	a5,a4,a5
 4c0:	fef42423          	sw	a5,-24(s0)
 4c4:	fe842783          	lw	a5,-24(s0)
 4c8:	00479793          	sll	a5,a5,0x4
 4cc:	fef42423          	sw	a5,-24(s0)
 4d0:	fdc40793          	add	a5,s0,-36
 4d4:	00078513          	mv	a0,a5
 4d8:	c79ff0ef          	jal	150 <scan>
 4dc:	00050793          	mv	a5,a0
 4e0:	00f04863          	bgtz	a5,4f0 <product+0x80>
 4e4:	fec42703          	lw	a4,-20(s0)
 4e8:	00700793          	li	a5,7
 4ec:	fae7d4e3          	bge	a5,a4,494 <product+0x24>
 4f0:	fe842783          	lw	a5,-24(s0)
 4f4:	4047d793          	sra	a5,a5,0x4
 4f8:	fef42423          	sw	a5,-24(s0)
 4fc:	040007b7          	lui	a5,0x4000
 500:	00100713          	li	a4,1
 504:	02e7a223          	sw	a4,36(a5) # 4000024 <_trap_stack_ptr+0x3ffc024>
 508:	040007b7          	lui	a5,0x4000
 50c:	0207a223          	sw	zero,36(a5) # 4000024 <_trap_stack_ptr+0x3ffc024>
 510:	fe042623          	sw	zero,-20(s0)
 514:	fc042e23          	sw	zero,-36(s0)
 518:	0400006f          	j	558 <_stack_size+0x58>
 51c:	fec42703          	lw	a4,-20(s0)
 520:	fdc40793          	add	a5,s0,-36
 524:	00070593          	mv	a1,a4
 528:	00078513          	mv	a0,a5
 52c:	e1dff0ef          	jal	348 <print>
 530:	fec42783          	lw	a5,-20(s0)
 534:	00178793          	add	a5,a5,1
 538:	fef42623          	sw	a5,-20(s0)
 53c:	fe442703          	lw	a4,-28(s0)
 540:	fdc42783          	lw	a5,-36(s0)
 544:	00f707b3          	add	a5,a4,a5
 548:	fef42223          	sw	a5,-28(s0)
 54c:	fe442783          	lw	a5,-28(s0)
 550:	00479793          	sll	a5,a5,0x4
 554:	fef42223          	sw	a5,-28(s0)
 558:	fdc40793          	add	a5,s0,-36
 55c:	00078513          	mv	a0,a5
 560:	bf1ff0ef          	jal	150 <scan>
 564:	00050793          	mv	a5,a0
 568:	00f04863          	bgtz	a5,578 <_stack_size+0x78>
 56c:	fec42703          	lw	a4,-20(s0)
 570:	00700793          	li	a5,7
 574:	fae7d4e3          	bge	a5,a4,51c <_stack_size+0x1c>
 578:	fe442783          	lw	a5,-28(s0)
 57c:	4047d793          	sra	a5,a5,0x4
 580:	fef42223          	sw	a5,-28(s0)
 584:	fe042023          	sw	zero,-32(s0)
 588:	040007b7          	lui	a5,0x4000
 58c:	00100713          	li	a4,1
 590:	02e7a223          	sw	a4,36(a5) # 4000024 <_trap_stack_ptr+0x3ffc024>
 594:	040007b7          	lui	a5,0x4000
 598:	0207a223          	sw	zero,36(a5) # 4000024 <_trap_stack_ptr+0x3ffc024>
 59c:	0380006f          	j	5d4 <_stack_size+0xd4>
 5a0:	fe442783          	lw	a5,-28(s0)
 5a4:	0017f793          	and	a5,a5,1
 5a8:	00078a63          	beqz	a5,5bc <_stack_size+0xbc>
 5ac:	fe842783          	lw	a5,-24(s0)
 5b0:	fe042703          	lw	a4,-32(s0)
 5b4:	00f707b3          	add	a5,a4,a5
 5b8:	fef42023          	sw	a5,-32(s0)
 5bc:	fe842783          	lw	a5,-24(s0)
 5c0:	00179793          	sll	a5,a5,0x1
 5c4:	fef42423          	sw	a5,-24(s0)
 5c8:	fe442783          	lw	a5,-28(s0)
 5cc:	4017d793          	sra	a5,a5,0x1
 5d0:	fef42223          	sw	a5,-28(s0)
 5d4:	fe442783          	lw	a5,-28(s0)
 5d8:	fcf044e3          	bgtz	a5,5a0 <_stack_size+0xa0>
 5dc:	040007b7          	lui	a5,0x4000
 5e0:	0ff00713          	li	a4,255
 5e4:	02e7a023          	sw	a4,32(a5) # 4000020 <_trap_stack_ptr+0x3ffc020>
 5e8:	040007b7          	lui	a5,0x4000
 5ec:	fe042703          	lw	a4,-32(s0)
 5f0:	00e7a023          	sw	a4,0(a5) # 4000000 <_trap_stack_ptr+0x3ffc000>
 5f4:	fe042783          	lw	a5,-32(s0)
 5f8:	0047d793          	srl	a5,a5,0x4
 5fc:	fef42023          	sw	a5,-32(s0)
 600:	040007b7          	lui	a5,0x4000
 604:	fe042703          	lw	a4,-32(s0)
 608:	00e7a223          	sw	a4,4(a5) # 4000004 <_trap_stack_ptr+0x3ffc004>
 60c:	fe042783          	lw	a5,-32(s0)
 610:	0047d793          	srl	a5,a5,0x4
 614:	fef42023          	sw	a5,-32(s0)
 618:	040007b7          	lui	a5,0x4000
 61c:	fe042703          	lw	a4,-32(s0)
 620:	00e7a423          	sw	a4,8(a5) # 4000008 <_trap_stack_ptr+0x3ffc008>
 624:	fe042783          	lw	a5,-32(s0)
 628:	0047d793          	srl	a5,a5,0x4
 62c:	fef42023          	sw	a5,-32(s0)
 630:	040007b7          	lui	a5,0x4000
 634:	fe042703          	lw	a4,-32(s0)
 638:	00e7a623          	sw	a4,12(a5) # 400000c <_trap_stack_ptr+0x3ffc00c>
 63c:	fe042783          	lw	a5,-32(s0)
 640:	0047d793          	srl	a5,a5,0x4
 644:	fef42023          	sw	a5,-32(s0)
 648:	040007b7          	lui	a5,0x4000
 64c:	fe042703          	lw	a4,-32(s0)
 650:	00e7a823          	sw	a4,16(a5) # 4000010 <_trap_stack_ptr+0x3ffc010>
 654:	fe042783          	lw	a5,-32(s0)
 658:	0047d793          	srl	a5,a5,0x4
 65c:	fef42023          	sw	a5,-32(s0)
 660:	040007b7          	lui	a5,0x4000
 664:	fe042703          	lw	a4,-32(s0)
 668:	00e7aa23          	sw	a4,20(a5) # 4000014 <_trap_stack_ptr+0x3ffc014>
 66c:	fe042783          	lw	a5,-32(s0)
 670:	0047d793          	srl	a5,a5,0x4
 674:	fef42023          	sw	a5,-32(s0)
 678:	040007b7          	lui	a5,0x4000
 67c:	fe042703          	lw	a4,-32(s0)
 680:	00e7ac23          	sw	a4,24(a5) # 4000018 <_trap_stack_ptr+0x3ffc018>
 684:	fe042783          	lw	a5,-32(s0)
 688:	0047d793          	srl	a5,a5,0x4
 68c:	fef42023          	sw	a5,-32(s0)
 690:	040007b7          	lui	a5,0x4000
 694:	fe042703          	lw	a4,-32(s0)
 698:	00e7ae23          	sw	a4,28(a5) # 400001c <_trap_stack_ptr+0x3ffc01c>
 69c:	00000013          	nop
 6a0:	02c12083          	lw	ra,44(sp)
 6a4:	02812403          	lw	s0,40(sp)
 6a8:	03010113          	add	sp,sp,48
 6ac:	00008067          	ret

000006b0 <main>:
 6b0:	fe010113          	add	sp,sp,-32
 6b4:	00112e23          	sw	ra,28(sp)
 6b8:	00812c23          	sw	s0,24(sp)
 6bc:	02010413          	add	s0,sp,32
 6c0:	fe042623          	sw	zero,-20(s0)
 6c4:	dadff0ef          	jal	470 <product>
 6c8:	fec40793          	add	a5,s0,-20
 6cc:	00078513          	mv	a0,a5
 6d0:	a81ff0ef          	jal	150 <scan>
 6d4:	00050713          	mv	a4,a0
 6d8:	00100793          	li	a5,1
 6dc:	fef712e3          	bne	a4,a5,6c0 <main+0x10>
 6e0:	040007b7          	lui	a5,0x4000
 6e4:	00100713          	li	a4,1
 6e8:	02e7a223          	sw	a4,36(a5) # 4000024 <_trap_stack_ptr+0x3ffc024>
 6ec:	fd5ff06f          	j	6c0 <main+0x10>

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
   8:	01007663          	bgeu	zero,a6,14 <_bss_end+0x10>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <scan+0x1f4>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

