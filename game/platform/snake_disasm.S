
snake.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00001197          	auipc	gp,0x1
       4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
       8:	00002117          	auipc	sp,0x2
       c:	d7810113          	add	sp,sp,-648 # 1d80 <_stack_ptr>
      10:	0cc00293          	li	t0,204
      14:	30c00313          	li	t1,780

00000018 <_bss_init_loop>:
      18:	00534863          	blt	t1,t0,28 <_irq_config>
      1c:	0002a023          	sw	zero,0(t0)
      20:	00428293          	add	t0,t0,4
      24:	ff5ff06f          	j	18 <_bss_init_loop>

00000028 <_irq_config>:
      28:	05400293          	li	t0,84
      2c:	fff00313          	li	t1,-1
      30:	00002397          	auipc	t2,0x2
      34:	fd038393          	add	t2,t2,-48 # 2000 <_trap_stack_ptr>
      38:	30529073          	csrw	mtvec,t0
      3c:	34039073          	csrw	mscratch,t2
      40:	30431073          	csrw	mie,t1

00000044 <_main_call>:
      44:	00000513          	li	a0,0
      48:	00000593          	li	a1,0
      4c:	1e0000ef          	jal	22c <main>

00000050 <_endless_loop>:
      50:	0000006f          	j	50 <_endless_loop>

00000054 <_int_handler>:
      54:	34011173          	csrrw	sp,mscratch,sp
      58:	fb010113          	add	sp,sp,-80
      5c:	00112223          	sw	ra,4(sp)
      60:	00002097          	auipc	ra,0x2
      64:	d2008093          	add	ra,ra,-736 # 1d80 <_stack_ptr>
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
      c0:	144000ef          	jal	204 <int_handler>
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

00000128 <_Z13config_periphv>:
     128:	ff010113          	add	sp,sp,-16
     12c:	00812623          	sw	s0,12(sp)
     130:	01010413          	add	s0,sp,16
     134:	080007b7          	lui	a5,0x8000
     138:	00200713          	li	a4,2
     13c:	00e7a823          	sw	a4,16(a5) # 8000010 <_trap_stack_ptr+0x7ffe010>
     140:	080007b7          	lui	a5,0x8000
     144:	00031737          	lui	a4,0x31
     148:	d4070713          	add	a4,a4,-704 # 30d40 <_trap_stack_ptr+0x2ed40>
     14c:	00e7a423          	sw	a4,8(a5) # 8000008 <_trap_stack_ptr+0x7ffe008>
     150:	00000793          	li	a5,0
     154:	0007a703          	lw	a4,0(a5)
     158:	30e02223          	sw	a4,772(zero) # 304 <video_memory_1d>
     15c:	00000793          	li	a5,0
     160:	0007a703          	lw	a4,0(a5)
     164:	30e02023          	sw	a4,768(zero) # 300 <video_memory_2d>
     168:	00000013          	nop
     16c:	00c12403          	lw	s0,12(sp)
     170:	01010113          	add	sp,sp,16
     174:	00008067          	ret

00000178 <_Z7get_keyRh>:
     178:	fe010113          	add	sp,sp,-32
     17c:	00812e23          	sw	s0,28(sp)
     180:	02010413          	add	s0,sp,32
     184:	fea42623          	sw	a0,-20(s0)
     188:	030007b7          	lui	a5,0x3000
     18c:	0007a783          	lw	a5,0(a5) # 3000000 <_trap_stack_ptr+0x2ffe000>
     190:	0ff7f713          	zext.b	a4,a5
     194:	fec42783          	lw	a5,-20(s0)
     198:	00e78023          	sb	a4,0(a5)
     19c:	030007b7          	lui	a5,0x3000
     1a0:	0047a783          	lw	a5,4(a5) # 3000004 <_trap_stack_ptr+0x2ffe004>
     1a4:	00f037b3          	snez	a5,a5
     1a8:	0ff7f793          	zext.b	a5,a5
     1ac:	00078513          	mv	a0,a5
     1b0:	01c12403          	lw	s0,28(sp)
     1b4:	02010113          	add	sp,sp,32
     1b8:	00008067          	ret

000001bc <_Z16get_random_valuev>:
     1bc:	ff010113          	add	sp,sp,-16
     1c0:	00812623          	sw	s0,12(sp)
     1c4:	01010413          	add	s0,sp,16
     1c8:	080007b7          	lui	a5,0x8000
     1cc:	0007a783          	lw	a5,0(a5) # 8000000 <_trap_stack_ptr+0x7ffe000>
     1d0:	0047d793          	srl	a5,a5,0x4
     1d4:	00078513          	mv	a0,a5
     1d8:	00c12403          	lw	s0,12(sp)
     1dc:	01010113          	add	sp,sp,16
     1e0:	00008067          	ret

000001e4 <_Z8seed_rngj>:
     1e4:	fe010113          	add	sp,sp,-32
     1e8:	00812e23          	sw	s0,28(sp)
     1ec:	02010413          	add	s0,sp,32
     1f0:	fea42623          	sw	a0,-20(s0)
     1f4:	00000013          	nop
     1f8:	01c12403          	lw	s0,28(sp)
     1fc:	02010113          	add	sp,sp,32
     200:	00008067          	ret

00000204 <int_handler>:
     204:	ff010113          	add	sp,sp,-16
     208:	00112623          	sw	ra,12(sp)
     20c:	00812423          	sw	s0,8(sp)
     210:	01010413          	add	s0,sp,16
     214:	52c000ef          	jal	740 <_Z10game_cyclev>
     218:	00000013          	nop
     21c:	00c12083          	lw	ra,12(sp)
     220:	00812403          	lw	s0,8(sp)
     224:	01010113          	add	sp,sp,16
     228:	00008067          	ret

0000022c <main>:
     22c:	ff010113          	add	sp,sp,-16
     230:	00112623          	sw	ra,12(sp)
     234:	00812423          	sw	s0,8(sp)
     238:	01010413          	add	s0,sp,16
     23c:	eedff0ef          	jal	128 <_Z13config_periphv>
     240:	02c000ef          	jal	26c <_Z12clear_screenv>
     244:	238000ef          	jal	47c <_Z11do_new_gamev>
     248:	00000013          	nop
     24c:	02002783          	lw	a5,32(zero) # 20 <state>
     250:	fe079ee3          	bnez	a5,24c <main+0x20>
     254:	268000ef          	jal	4bc <_Z12prepare_gamev>
     258:	00000013          	nop
     25c:	02002703          	lw	a4,32(zero) # 20 <state>
     260:	00200793          	li	a5,2
     264:	fef71ce3          	bne	a4,a5,25c <main+0x30>
     268:	fddff06f          	j	244 <main+0x18>

0000026c <_Z12clear_screenv>:
     26c:	fe010113          	add	sp,sp,-32
     270:	00812e23          	sw	s0,28(sp)
     274:	02010413          	add	s0,sp,32
     278:	fe042623          	sw	zero,-20(s0)
     27c:	0240006f          	j	2a0 <_stack_size+0x20>
     280:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     284:	fec42783          	lw	a5,-20(s0)
     288:	00f707b3          	add	a5,a4,a5
     28c:	02000713          	li	a4,32
     290:	00e78023          	sb	a4,0(a5)
     294:	fec42783          	lw	a5,-20(s0)
     298:	00178793          	add	a5,a5,1
     29c:	fef42623          	sw	a5,-20(s0)
     2a0:	fec42703          	lw	a4,-20(s0)
     2a4:	000017b7          	lui	a5,0x1
     2a8:	95f78793          	add	a5,a5,-1697 # 95f <_Z11place_snackv+0xa3>
     2ac:	fce7fae3          	bgeu	a5,a4,280 <_stack_size>
     2b0:	00000013          	nop
     2b4:	00000013          	nop
     2b8:	01c12403          	lw	s0,28(sp)
     2bc:	02010113          	add	sp,sp,32
     2c0:	00008067          	ret

000002c4 <_Z12print_stringjjPKcj>:
     2c4:	fd010113          	add	sp,sp,-48
     2c8:	02812623          	sw	s0,44(sp)
     2cc:	03010413          	add	s0,sp,48
     2d0:	fca42e23          	sw	a0,-36(s0)
     2d4:	fcb42c23          	sw	a1,-40(s0)
     2d8:	fcc42a23          	sw	a2,-44(s0)
     2dc:	fcd42823          	sw	a3,-48(s0)
     2e0:	fe042623          	sw	zero,-20(s0)
     2e4:	0500006f          	j	334 <_bss_end+0x28>
     2e8:	fd442703          	lw	a4,-44(s0)
     2ec:	fec42783          	lw	a5,-20(s0)
     2f0:	00f70633          	add	a2,a4,a5
     2f4:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     2f8:	fdc42703          	lw	a4,-36(s0)
     2fc:	00070793          	mv	a5,a4
     300:	00279793          	sll	a5,a5,0x2
     304:	00e787b3          	add	a5,a5,a4
     308:	00479793          	sll	a5,a5,0x4
     30c:	00f686b3          	add	a3,a3,a5
     310:	fd842703          	lw	a4,-40(s0)
     314:	fec42783          	lw	a5,-20(s0)
     318:	00f707b3          	add	a5,a4,a5
     31c:	00064703          	lbu	a4,0(a2)
     320:	00f687b3          	add	a5,a3,a5
     324:	00e78023          	sb	a4,0(a5)
     328:	fec42783          	lw	a5,-20(s0)
     32c:	00178793          	add	a5,a5,1
     330:	fef42623          	sw	a5,-20(s0)
     334:	fec42703          	lw	a4,-20(s0)
     338:	fd042783          	lw	a5,-48(s0)
     33c:	faf766e3          	bltu	a4,a5,2e8 <backup_array2>
     340:	00000013          	nop
     344:	00000013          	nop
     348:	02c12403          	lw	s0,44(sp)
     34c:	03010113          	add	sp,sp,48
     350:	00008067          	ret

00000354 <_Z12print_uint32jjm>:
     354:	fd010113          	add	sp,sp,-48
     358:	02812623          	sw	s0,44(sp)
     35c:	03010413          	add	s0,sp,48
     360:	fca42e23          	sw	a0,-36(s0)
     364:	fcb42c23          	sw	a1,-40(s0)
     368:	fcc42a23          	sw	a2,-44(s0)
     36c:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     370:	fdc42703          	lw	a4,-36(s0)
     374:	00070793          	mv	a5,a4
     378:	00279793          	sll	a5,a5,0x2
     37c:	00e787b3          	add	a5,a5,a4
     380:	00479793          	sll	a5,a5,0x4
     384:	00f68733          	add	a4,a3,a5
     388:	fd842783          	lw	a5,-40(s0)
     38c:	00f707b3          	add	a5,a4,a5
     390:	03000713          	li	a4,48
     394:	00e78023          	sb	a4,0(a5)
     398:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     39c:	fdc42703          	lw	a4,-36(s0)
     3a0:	00070793          	mv	a5,a4
     3a4:	00279793          	sll	a5,a5,0x2
     3a8:	00e787b3          	add	a5,a5,a4
     3ac:	00479793          	sll	a5,a5,0x4
     3b0:	00f68733          	add	a4,a3,a5
     3b4:	fd842783          	lw	a5,-40(s0)
     3b8:	00178793          	add	a5,a5,1
     3bc:	00f707b3          	add	a5,a4,a5
     3c0:	07800713          	li	a4,120
     3c4:	00e78023          	sb	a4,0(a5)
     3c8:	fe042623          	sw	zero,-20(s0)
     3cc:	0900006f          	j	45c <_Z12print_uint32jjm+0x108>
     3d0:	fec42783          	lw	a5,-20(s0)
     3d4:	00279793          	sll	a5,a5,0x2
     3d8:	fd442703          	lw	a4,-44(s0)
     3dc:	00f757b3          	srl	a5,a4,a5
     3e0:	0ff7f793          	zext.b	a5,a5
     3e4:	00f7f793          	and	a5,a5,15
     3e8:	fef405a3          	sb	a5,-21(s0)
     3ec:	feb44703          	lbu	a4,-21(s0)
     3f0:	00900793          	li	a5,9
     3f4:	00e7ea63          	bltu	a5,a4,408 <_Z12print_uint32jjm+0xb4>
     3f8:	feb44783          	lbu	a5,-21(s0)
     3fc:	03078793          	add	a5,a5,48
     400:	0ff7f793          	zext.b	a5,a5
     404:	0100006f          	j	414 <_Z12print_uint32jjm+0xc0>
     408:	feb44783          	lbu	a5,-21(s0)
     40c:	05778793          	add	a5,a5,87
     410:	0ff7f793          	zext.b	a5,a5
     414:	fef40523          	sb	a5,-22(s0)
     418:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     41c:	fdc42703          	lw	a4,-36(s0)
     420:	00070793          	mv	a5,a4
     424:	00279793          	sll	a5,a5,0x2
     428:	00e787b3          	add	a5,a5,a4
     42c:	00479793          	sll	a5,a5,0x4
     430:	00f68733          	add	a4,a3,a5
     434:	fd842683          	lw	a3,-40(s0)
     438:	fec42783          	lw	a5,-20(s0)
     43c:	40f687b3          	sub	a5,a3,a5
     440:	00978793          	add	a5,a5,9
     444:	00f707b3          	add	a5,a4,a5
     448:	fea44703          	lbu	a4,-22(s0)
     44c:	00e78023          	sb	a4,0(a5)
     450:	fec42783          	lw	a5,-20(s0)
     454:	00178793          	add	a5,a5,1
     458:	fef42623          	sw	a5,-20(s0)
     45c:	fec42703          	lw	a4,-20(s0)
     460:	00700793          	li	a5,7
     464:	f6e7f6e3          	bgeu	a5,a4,3d0 <_Z12print_uint32jjm+0x7c>
     468:	00000013          	nop
     46c:	00000013          	nop
     470:	02c12403          	lw	s0,44(sp)
     474:	03010113          	add	sp,sp,48
     478:	00008067          	ret

0000047c <_Z11do_new_gamev>:
     47c:	ff010113          	add	sp,sp,-16
     480:	00112623          	sw	ra,12(sp)
     484:	00812423          	sw	s0,8(sp)
     488:	01010413          	add	s0,sp,16
     48c:	00200713          	li	a4,2
     490:	02e02023          	sw	a4,32(zero) # 20 <state>
     494:	0cc00513          	li	a0,204
     498:	618000ef          	jal	ab0 <_ZN5Snake5resetEv>
     49c:	02400593          	li	a1,36
     4a0:	00f00513          	li	a0,15
     4a4:	559000ef          	jal	11fc <_Z22print_string_at_centerILj32EEjjRAT__Kc>
     4a8:	00000013          	nop
     4ac:	00c12083          	lw	ra,12(sp)
     4b0:	00812403          	lw	s0,8(sp)
     4b4:	01010113          	add	sp,sp,16
     4b8:	00008067          	ret

000004bc <_Z12prepare_gamev>:
     4bc:	ff010113          	add	sp,sp,-16
     4c0:	00112623          	sw	ra,12(sp)
     4c4:	00812423          	sw	s0,8(sp)
     4c8:	01010413          	add	s0,sp,16
     4cc:	00000513          	li	a0,0
     4d0:	d15ff0ef          	jal	1e4 <_Z8seed_rngj>
     4d4:	d99ff0ef          	jal	26c <_Z12clear_screenv>
     4d8:	304000ef          	jal	7dc <_Z11place_wallsv>
     4dc:	3e0000ef          	jal	8bc <_Z11place_snackv>
     4e0:	0cc00513          	li	a0,204
     4e4:	5cc000ef          	jal	ab0 <_ZN5Snake5resetEv>
     4e8:	00000013          	nop
     4ec:	00c12083          	lw	ra,12(sp)
     4f0:	00812403          	lw	s0,8(sp)
     4f4:	01010113          	add	sp,sp,16
     4f8:	00008067          	ret

000004fc <_Z12do_game_overv>:
     4fc:	fe010113          	add	sp,sp,-32
     500:	00112e23          	sw	ra,28(sp)
     504:	00812c23          	sw	s0,24(sp)
     508:	02010413          	add	s0,sp,32
     50c:	00200713          	li	a4,2
     510:	02e02023          	sw	a4,32(zero) # 20 <state>
     514:	04400593          	li	a1,68
     518:	00e00513          	li	a0,14
     51c:	525000ef          	jal	1240 <_Z22print_string_at_centerILj27EEjjRAT__Kc>
     520:	fea42623          	sw	a0,-20(s0)
     524:	0cc00513          	li	a0,204
     528:	734000ef          	jal	c5c <_ZN5Snake4sizeEv>
     52c:	00050793          	mv	a5,a0
     530:	ffc78793          	add	a5,a5,-4
     534:	00078613          	mv	a2,a5
     538:	fec42583          	lw	a1,-20(s0)
     53c:	00e00513          	li	a0,14
     540:	e15ff0ef          	jal	354 <_Z12print_uint32jjm>
     544:	00000013          	nop
     548:	01c12083          	lw	ra,28(sp)
     54c:	01812403          	lw	s0,24(sp)
     550:	02010113          	add	sp,sp,32
     554:	00008067          	ret

00000558 <_Z14do_game_finishv>:
     558:	fe010113          	add	sp,sp,-32
     55c:	00112e23          	sw	ra,28(sp)
     560:	00812c23          	sw	s0,24(sp)
     564:	02010413          	add	s0,sp,32
     568:	00200713          	li	a4,2
     56c:	02e02023          	sw	a4,32(zero) # 20 <state>
     570:	06000593          	li	a1,96
     574:	00e00513          	li	a0,14
     578:	50d000ef          	jal	1284 <_Z22print_string_at_centerILj25EEjjRAT__Kc>
     57c:	fea42623          	sw	a0,-20(s0)
     580:	0cc00513          	li	a0,204
     584:	6d8000ef          	jal	c5c <_ZN5Snake4sizeEv>
     588:	00050793          	mv	a5,a0
     58c:	ffc78793          	add	a5,a5,-4
     590:	00078613          	mv	a2,a5
     594:	fec42583          	lw	a1,-20(s0)
     598:	00e00513          	li	a0,14
     59c:	db9ff0ef          	jal	354 <_Z12print_uint32jjm>
     5a0:	00000013          	nop
     5a4:	01c12083          	lw	ra,28(sp)
     5a8:	01812403          	lw	s0,24(sp)
     5ac:	02010113          	add	sp,sp,32
     5b0:	00008067          	ret

000005b4 <_Z13do_game_pausev>:
     5b4:	fe010113          	add	sp,sp,-32
     5b8:	00112e23          	sw	ra,28(sp)
     5bc:	00812c23          	sw	s0,24(sp)
     5c0:	02010413          	add	s0,sp,32
     5c4:	fe042623          	sw	zero,-20(s0)
     5c8:	03c0006f          	j	604 <_Z13do_game_pausev+0x50>
     5cc:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     5d0:	46078713          	add	a4,a5,1120
     5d4:	fec42783          	lw	a5,-20(s0)
     5d8:	02278793          	add	a5,a5,34
     5dc:	00f707b3          	add	a5,a4,a5
     5e0:	0007c783          	lbu	a5,0(a5)
     5e4:	0ff7f713          	zext.b	a4,a5
     5e8:	2dc00693          	li	a3,732
     5ec:	fec42783          	lw	a5,-20(s0)
     5f0:	00f687b3          	add	a5,a3,a5
     5f4:	00e78023          	sb	a4,0(a5)
     5f8:	fec42783          	lw	a5,-20(s0)
     5fc:	00178793          	add	a5,a5,1
     600:	fef42623          	sw	a5,-20(s0)
     604:	fec42703          	lw	a4,-20(s0)
     608:	00b00793          	li	a5,11
     60c:	fce7f0e3          	bgeu	a5,a4,5cc <_Z13do_game_pausev+0x18>
     610:	fe042423          	sw	zero,-24(s0)
     614:	03c0006f          	j	650 <_Z13do_game_pausev+0x9c>
     618:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     61c:	4b078713          	add	a4,a5,1200
     620:	fe842783          	lw	a5,-24(s0)
     624:	01c78793          	add	a5,a5,28
     628:	00f707b3          	add	a5,a4,a5
     62c:	0007c783          	lbu	a5,0(a5)
     630:	0ff7f713          	zext.b	a4,a5
     634:	2e800693          	li	a3,744
     638:	fe842783          	lw	a5,-24(s0)
     63c:	00f687b3          	add	a5,a3,a5
     640:	00e78023          	sb	a4,0(a5)
     644:	fe842783          	lw	a5,-24(s0)
     648:	00178793          	add	a5,a5,1
     64c:	fef42423          	sw	a5,-24(s0)
     650:	fe842703          	lw	a4,-24(s0)
     654:	01700793          	li	a5,23
     658:	fce7f0e3          	bgeu	a5,a4,618 <_Z13do_game_pausev+0x64>
     65c:	07c00593          	li	a1,124
     660:	00e00513          	li	a0,14
     664:	465000ef          	jal	12c8 <_Z22print_string_at_centerILj12EEjjRAT__Kc>
     668:	08800593          	li	a1,136
     66c:	00f00513          	li	a0,15
     670:	49d000ef          	jal	130c <_Z22print_string_at_centerILj24EEjjRAT__Kc>
     674:	00100713          	li	a4,1
     678:	02e02023          	sw	a4,32(zero) # 20 <state>
     67c:	00000013          	nop
     680:	01c12083          	lw	ra,28(sp)
     684:	01812403          	lw	s0,24(sp)
     688:	02010113          	add	sp,sp,32
     68c:	00008067          	ret

00000690 <_Z15do_game_unpausev>:
     690:	fe010113          	add	sp,sp,-32
     694:	00812e23          	sw	s0,28(sp)
     698:	02010413          	add	s0,sp,32
     69c:	fe042623          	sw	zero,-20(s0)
     6a0:	0380006f          	j	6d8 <_Z15do_game_unpausev+0x48>
     6a4:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     6a8:	46078693          	add	a3,a5,1120
     6ac:	fec42783          	lw	a5,-20(s0)
     6b0:	02278793          	add	a5,a5,34
     6b4:	2dc00613          	li	a2,732
     6b8:	fec42703          	lw	a4,-20(s0)
     6bc:	00e60733          	add	a4,a2,a4
     6c0:	00074703          	lbu	a4,0(a4)
     6c4:	00f687b3          	add	a5,a3,a5
     6c8:	00e78023          	sb	a4,0(a5)
     6cc:	fec42783          	lw	a5,-20(s0)
     6d0:	00178793          	add	a5,a5,1
     6d4:	fef42623          	sw	a5,-20(s0)
     6d8:	fec42703          	lw	a4,-20(s0)
     6dc:	00b00793          	li	a5,11
     6e0:	fce7f2e3          	bgeu	a5,a4,6a4 <_Z15do_game_unpausev+0x14>
     6e4:	fe042423          	sw	zero,-24(s0)
     6e8:	0380006f          	j	720 <_Z15do_game_unpausev+0x90>
     6ec:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     6f0:	4b078693          	add	a3,a5,1200
     6f4:	fe842783          	lw	a5,-24(s0)
     6f8:	01c78793          	add	a5,a5,28
     6fc:	2e800613          	li	a2,744
     700:	fe842703          	lw	a4,-24(s0)
     704:	00e60733          	add	a4,a2,a4
     708:	00074703          	lbu	a4,0(a4)
     70c:	00f687b3          	add	a5,a3,a5
     710:	00e78023          	sb	a4,0(a5)
     714:	fe842783          	lw	a5,-24(s0)
     718:	00178793          	add	a5,a5,1
     71c:	fef42423          	sw	a5,-24(s0)
     720:	fe842703          	lw	a4,-24(s0)
     724:	01700793          	li	a5,23
     728:	fce7f2e3          	bgeu	a5,a4,6ec <_Z15do_game_unpausev+0x5c>
     72c:	02002023          	sw	zero,32(zero) # 20 <state>
     730:	00000013          	nop
     734:	01c12403          	lw	s0,28(sp)
     738:	02010113          	add	sp,sp,32
     73c:	00008067          	ret

00000740 <_Z10game_cyclev>:
     740:	ff010113          	add	sp,sp,-16
     744:	00112623          	sw	ra,12(sp)
     748:	00812423          	sw	s0,8(sp)
     74c:	01010413          	add	s0,sp,16
     750:	0cc00513          	li	a0,204
     754:	3f8000ef          	jal	b4c <_ZN5Snake9get_inputEv>
     758:	02002783          	lw	a5,32(zero) # 20 <state>
     75c:	06079663          	bnez	a5,7c8 <_Z10game_cyclev+0x88>
     760:	0cc00513          	li	a0,204
     764:	558000ef          	jal	cbc <_ZN5Snake9move_headEv>
     768:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     76c:	00078593          	mv	a1,a5
     770:	0cc00513          	li	a0,204
     774:	7e0000ef          	jal	f54 <_ZN5Snake9is_eatingEj>
     778:	00050793          	mv	a5,a0
     77c:	02078863          	beqz	a5,7ac <_Z10game_cyclev+0x6c>
     780:	0cc00513          	li	a0,204
     784:	4d8000ef          	jal	c5c <_ZN5Snake4sizeEv>
     788:	00050793          	mv	a5,a0
     78c:	f0078793          	add	a5,a5,-256
     790:	0017b793          	seqz	a5,a5
     794:	0ff7f793          	zext.b	a5,a5
     798:	00078663          	beqz	a5,7a4 <_Z10game_cyclev+0x64>
     79c:	dbdff0ef          	jal	558 <_Z14do_game_finishv>
     7a0:	0280006f          	j	7c8 <_Z10game_cyclev+0x88>
     7a4:	118000ef          	jal	8bc <_Z11place_snackv>
     7a8:	0200006f          	j	7c8 <_Z10game_cyclev+0x88>
     7ac:	0cc00513          	li	a0,204
     7b0:	6b8000ef          	jal	e68 <_ZN5Snake9move_tailEv>
     7b4:	0cc00513          	li	a0,204
     7b8:	1a1000ef          	jal	1158 <_ZN5Snake17has_head_accidentEv>
     7bc:	00050793          	mv	a5,a0
     7c0:	00078463          	beqz	a5,7c8 <_Z10game_cyclev+0x88>
     7c4:	d39ff0ef          	jal	4fc <_Z12do_game_overv>
     7c8:	00000013          	nop
     7cc:	00c12083          	lw	ra,12(sp)
     7d0:	00812403          	lw	s0,8(sp)
     7d4:	01010113          	add	sp,sp,16
     7d8:	00008067          	ret

000007dc <_Z11place_wallsv>:
     7dc:	fe010113          	add	sp,sp,-32
     7e0:	00812e23          	sw	s0,28(sp)
     7e4:	02010413          	add	s0,sp,32
     7e8:	fe042623          	sw	zero,-20(s0)
     7ec:	0440006f          	j	830 <_gbl_ptr+0x30>
     7f0:	30002703          	lw	a4,768(zero) # 300 <video_memory_2d>
     7f4:	fec42783          	lw	a5,-20(s0)
     7f8:	00f707b3          	add	a5,a4,a5
     7fc:	f8700713          	li	a4,-121
     800:	00e78023          	sb	a4,0(a5)
     804:	30002703          	lw	a4,768(zero) # 300 <video_memory_2d>
     808:	000017b7          	lui	a5,0x1
     80c:	91078793          	add	a5,a5,-1776 # 910 <_Z11place_snackv+0x54>
     810:	00f70733          	add	a4,a4,a5
     814:	fec42783          	lw	a5,-20(s0)
     818:	00f707b3          	add	a5,a4,a5
     81c:	f8700713          	li	a4,-121
     820:	00e78023          	sb	a4,0(a5)
     824:	fec42783          	lw	a5,-20(s0)
     828:	00178793          	add	a5,a5,1
     82c:	fef42623          	sw	a5,-20(s0)
     830:	fec42703          	lw	a4,-20(s0)
     834:	04f00793          	li	a5,79
     838:	fae7fce3          	bgeu	a5,a4,7f0 <_Z11place_wallsv+0x14>
     83c:	00100793          	li	a5,1
     840:	fef42423          	sw	a5,-24(s0)
     844:	0580006f          	j	89c <_gbl_ptr+0x9c>
     848:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     84c:	fe842703          	lw	a4,-24(s0)
     850:	00070793          	mv	a5,a4
     854:	00279793          	sll	a5,a5,0x2
     858:	00e787b3          	add	a5,a5,a4
     85c:	00479793          	sll	a5,a5,0x4
     860:	00f687b3          	add	a5,a3,a5
     864:	f8700713          	li	a4,-121
     868:	00e78023          	sb	a4,0(a5)
     86c:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     870:	fe842703          	lw	a4,-24(s0)
     874:	00070793          	mv	a5,a4
     878:	00279793          	sll	a5,a5,0x2
     87c:	00e787b3          	add	a5,a5,a4
     880:	00479793          	sll	a5,a5,0x4
     884:	00f687b3          	add	a5,a3,a5
     888:	f8700713          	li	a4,-121
     88c:	04e787a3          	sb	a4,79(a5)
     890:	fe842783          	lw	a5,-24(s0)
     894:	00178793          	add	a5,a5,1
     898:	fef42423          	sw	a5,-24(s0)
     89c:	fe842703          	lw	a4,-24(s0)
     8a0:	01c00793          	li	a5,28
     8a4:	fae7f2e3          	bgeu	a5,a4,848 <_gbl_ptr+0x48>
     8a8:	00000013          	nop
     8ac:	00000013          	nop
     8b0:	01c12403          	lw	s0,28(sp)
     8b4:	02010113          	add	sp,sp,32
     8b8:	00008067          	ret

000008bc <_Z11place_snackv>:
     8bc:	fe010113          	add	sp,sp,-32
     8c0:	00112e23          	sw	ra,28(sp)
     8c4:	00812c23          	sw	s0,24(sp)
     8c8:	02010413          	add	s0,sp,32
     8cc:	fe042623          	sw	zero,-20(s0)
     8d0:	fec42703          	lw	a4,-20(s0)
     8d4:	06400793          	li	a5,100
     8d8:	02e7f463          	bgeu	a5,a4,900 <_Z11place_snackv+0x44>
     8dc:	0a000593          	li	a1,160
     8e0:	00000513          	li	a0,0
     8e4:	26d000ef          	jal	1350 <_Z22print_string_at_centerILj43EEjjRAT__Kc>
     8e8:	fea42423          	sw	a0,-24(s0)
     8ec:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     8f0:	00078613          	mv	a2,a5
     8f4:	fe842583          	lw	a1,-24(s0)
     8f8:	00000513          	li	a0,0
     8fc:	a59ff0ef          	jal	354 <_Z12print_uint32jjm>
     900:	8bdff0ef          	jal	1bc <_Z16get_random_valuev>
     904:	00050793          	mv	a5,a0
     908:	ffe7f713          	and	a4,a5,-2
     90c:	30e02423          	sw	a4,776(zero) # 308 <snack_coord>
     910:	fec42783          	lw	a5,-20(s0)
     914:	00178793          	add	a5,a5,1
     918:	fef42623          	sw	a5,-20(s0)
     91c:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     920:	00078593          	mv	a1,a5
     924:	0cc00513          	li	a0,204
     928:	680000ef          	jal	fa8 <_ZN5Snake17has_collided_withEj>
     92c:	00050793          	mv	a5,a0
     930:	00079e63          	bnez	a5,94c <_Z11place_snackv+0x90>
     934:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     938:	00078593          	mv	a1,a5
     93c:	0cc00513          	li	a0,204
     940:	614000ef          	jal	f54 <_ZN5Snake9is_eatingEj>
     944:	00050793          	mv	a5,a0
     948:	00078663          	beqz	a5,954 <_Z11place_snackv+0x98>
     94c:	00100793          	li	a5,1
     950:	0080006f          	j	958 <_Z11place_snackv+0x9c>
     954:	00000793          	li	a5,0
     958:	f6079ce3          	bnez	a5,8d0 <_Z11place_snackv+0x14>
     95c:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     960:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     964:	00f707b3          	add	a5,a4,a5
     968:	f8600713          	li	a4,-122
     96c:	00e78023          	sb	a4,0(a5)
     970:	00000013          	nop
     974:	01c12083          	lw	ra,28(sp)
     978:	01812403          	lw	s0,24(sp)
     97c:	02010113          	add	sp,sp,32
     980:	00008067          	ret

00000984 <_ZN5SnakeC1Ev>:
     984:	fe010113          	add	sp,sp,-32
     988:	00812e23          	sw	s0,28(sp)
     98c:	02010413          	add	s0,sp,32
     990:	fea42623          	sw	a0,-20(s0)
     994:	00000013          	nop
     998:	01c12403          	lw	s0,28(sp)
     99c:	02010113          	add	sp,sp,32
     9a0:	00008067          	ret

000009a4 <_ZN5Snake14turn_connectorE9directionS0_>:
     9a4:	fe010113          	add	sp,sp,-32
     9a8:	00812e23          	sw	s0,28(sp)
     9ac:	02010413          	add	s0,sp,32
     9b0:	fea42623          	sw	a0,-20(s0)
     9b4:	feb42423          	sw	a1,-24(s0)
     9b8:	fec42223          	sw	a2,-28(s0)
     9bc:	fe842703          	lw	a4,-24(s0)
     9c0:	05000793          	li	a5,80
     9c4:	00f71863          	bne	a4,a5,9d4 <_ZN5Snake14turn_connectorE9directionS0_+0x30>
     9c8:	fe442703          	lw	a4,-28(s0)
     9cc:	00200793          	li	a5,2
     9d0:	00f70e63          	beq	a4,a5,9ec <_ZN5Snake14turn_connectorE9directionS0_+0x48>
     9d4:	fe842703          	lw	a4,-24(s0)
     9d8:	ffe00793          	li	a5,-2
     9dc:	00f71c63          	bne	a4,a5,9f4 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     9e0:	fe442703          	lw	a4,-28(s0)
     9e4:	fb000793          	li	a5,-80
     9e8:	00f71663          	bne	a4,a5,9f4 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     9ec:	08100793          	li	a5,129
     9f0:	0b00006f          	j	aa0 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     9f4:	fe842703          	lw	a4,-24(s0)
     9f8:	05000793          	li	a5,80
     9fc:	00f71863          	bne	a4,a5,a0c <_ZN5Snake14turn_connectorE9directionS0_+0x68>
     a00:	fe442703          	lw	a4,-28(s0)
     a04:	ffe00793          	li	a5,-2
     a08:	00f70e63          	beq	a4,a5,a24 <_ZN5Snake14turn_connectorE9directionS0_+0x80>
     a0c:	fe842703          	lw	a4,-24(s0)
     a10:	00200793          	li	a5,2
     a14:	00f71c63          	bne	a4,a5,a2c <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a18:	fe442703          	lw	a4,-28(s0)
     a1c:	fb000793          	li	a5,-80
     a20:	00f71663          	bne	a4,a5,a2c <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a24:	08200793          	li	a5,130
     a28:	0780006f          	j	aa0 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a2c:	fe842703          	lw	a4,-24(s0)
     a30:	fb000793          	li	a5,-80
     a34:	00f71863          	bne	a4,a5,a44 <_ZN5Snake14turn_connectorE9directionS0_+0xa0>
     a38:	fe442703          	lw	a4,-28(s0)
     a3c:	ffe00793          	li	a5,-2
     a40:	00f70e63          	beq	a4,a5,a5c <_ZN5Snake14turn_connectorE9directionS0_+0xb8>
     a44:	fe842703          	lw	a4,-24(s0)
     a48:	00200793          	li	a5,2
     a4c:	00f71c63          	bne	a4,a5,a64 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a50:	fe442703          	lw	a4,-28(s0)
     a54:	05000793          	li	a5,80
     a58:	00f71663          	bne	a4,a5,a64 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a5c:	08300793          	li	a5,131
     a60:	0400006f          	j	aa0 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a64:	fe842703          	lw	a4,-24(s0)
     a68:	fb000793          	li	a5,-80
     a6c:	00f71863          	bne	a4,a5,a7c <_ZN5Snake14turn_connectorE9directionS0_+0xd8>
     a70:	fe442703          	lw	a4,-28(s0)
     a74:	00200793          	li	a5,2
     a78:	00f70e63          	beq	a4,a5,a94 <_ZN5Snake14turn_connectorE9directionS0_+0xf0>
     a7c:	fe842703          	lw	a4,-24(s0)
     a80:	ffe00793          	li	a5,-2
     a84:	00f71c63          	bne	a4,a5,a9c <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     a88:	fe442703          	lw	a4,-28(s0)
     a8c:	05000793          	li	a5,80
     a90:	00f71663          	bne	a4,a5,a9c <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     a94:	08400793          	li	a5,132
     a98:	0080006f          	j	aa0 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a9c:	07c00793          	li	a5,124
     aa0:	00078513          	mv	a0,a5
     aa4:	01c12403          	lw	s0,28(sp)
     aa8:	02010113          	add	sp,sp,32
     aac:	00008067          	ret

00000ab0 <_ZN5Snake5resetEv>:
     ab0:	fd010113          	add	sp,sp,-48
     ab4:	02112623          	sw	ra,44(sp)
     ab8:	02812423          	sw	s0,40(sp)
     abc:	03010413          	add	s0,sp,48
     ac0:	fca42e23          	sw	a0,-36(s0)
     ac4:	fdc42783          	lw	a5,-36(s0)
     ac8:	0007a023          	sw	zero,0(a5)
     acc:	fdc42783          	lw	a5,-36(s0)
     ad0:	0007a223          	sw	zero,4(a5)
     ad4:	fdc42783          	lw	a5,-36(s0)
     ad8:	00200713          	li	a4,2
     adc:	00e7a423          	sw	a4,8(a5)
     ae0:	fdc42783          	lw	a5,-36(s0)
     ae4:	00200713          	li	a4,2
     ae8:	00e7a623          	sw	a4,12(a5)
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	0047a783          	lw	a5,4(a5)
     af4:	fdc42703          	lw	a4,-36(s0)
     af8:	00878793          	add	a5,a5,8
     afc:	00179793          	sll	a5,a5,0x1
     b00:	00f707b3          	add	a5,a4,a5
     b04:	4ba00713          	li	a4,1210
     b08:	00e79023          	sh	a4,0(a5)
     b0c:	fe042623          	sw	zero,-20(s0)
     b10:	0180006f          	j	b28 <_ZN5Snake5resetEv+0x78>
     b14:	fdc42503          	lw	a0,-36(s0)
     b18:	1a4000ef          	jal	cbc <_ZN5Snake9move_headEv>
     b1c:	fec42783          	lw	a5,-20(s0)
     b20:	00178793          	add	a5,a5,1
     b24:	fef42623          	sw	a5,-20(s0)
     b28:	fec42703          	lw	a4,-20(s0)
     b2c:	00200793          	li	a5,2
     b30:	fee7f2e3          	bgeu	a5,a4,b14 <_ZN5Snake5resetEv+0x64>
     b34:	00000013          	nop
     b38:	00000013          	nop
     b3c:	02c12083          	lw	ra,44(sp)
     b40:	02812403          	lw	s0,40(sp)
     b44:	03010113          	add	sp,sp,48
     b48:	00008067          	ret

00000b4c <_ZN5Snake9get_inputEv>:
     b4c:	fd010113          	add	sp,sp,-48
     b50:	02112623          	sw	ra,44(sp)
     b54:	02812423          	sw	s0,40(sp)
     b58:	03010413          	add	s0,sp,48
     b5c:	fca42e23          	sw	a0,-36(s0)
     b60:	feb40793          	add	a5,s0,-21
     b64:	00078513          	mv	a0,a5
     b68:	e10ff0ef          	jal	178 <_Z7get_keyRh>
     b6c:	00050793          	mv	a5,a0
     b70:	0c078e63          	beqz	a5,c4c <_ZN5Snake9get_inputEv+0x100>
     b74:	02002703          	lw	a4,32(zero) # 20 <state>
     b78:	00100793          	li	a5,1
     b7c:	00f71c63          	bne	a4,a5,b94 <_ZN5Snake9get_inputEv+0x48>
     b80:	feb44703          	lbu	a4,-21(s0)
     b84:	05a00793          	li	a5,90
     b88:	0cf71063          	bne	a4,a5,c48 <_ZN5Snake9get_inputEv+0xfc>
     b8c:	b05ff0ef          	jal	690 <_Z15do_game_unpausev>
     b90:	0bc0006f          	j	c4c <_ZN5Snake9get_inputEv+0x100>
     b94:	02002023          	sw	zero,32(zero) # 20 <state>
     b98:	fdc42783          	lw	a5,-36(s0)
     b9c:	0087a783          	lw	a5,8(a5)
     ba0:	fef42623          	sw	a5,-20(s0)
     ba4:	feb44783          	lbu	a5,-21(s0)
     ba8:	07600713          	li	a4,118
     bac:	06e78863          	beq	a5,a4,c1c <_ZN5Snake9get_inputEv+0xd0>
     bb0:	07600713          	li	a4,118
     bb4:	06f74863          	blt	a4,a5,c24 <_ZN5Snake9get_inputEv+0xd8>
     bb8:	02300713          	li	a4,35
     bbc:	04e78a63          	beq	a5,a4,c10 <_ZN5Snake9get_inputEv+0xc4>
     bc0:	02300713          	li	a4,35
     bc4:	06f74063          	blt	a4,a5,c24 <_ZN5Snake9get_inputEv+0xd8>
     bc8:	01d00713          	li	a4,29
     bcc:	02e78063          	beq	a5,a4,bec <_ZN5Snake9get_inputEv+0xa0>
     bd0:	01d00713          	li	a4,29
     bd4:	04f74863          	blt	a4,a5,c24 <_ZN5Snake9get_inputEv+0xd8>
     bd8:	01b00713          	li	a4,27
     bdc:	02e78463          	beq	a5,a4,c04 <_ZN5Snake9get_inputEv+0xb8>
     be0:	01c00713          	li	a4,28
     be4:	00e78a63          	beq	a5,a4,bf8 <_ZN5Snake9get_inputEv+0xac>
     be8:	03c0006f          	j	c24 <_ZN5Snake9get_inputEv+0xd8>
     bec:	fb000793          	li	a5,-80
     bf0:	fef42623          	sw	a5,-20(s0)
     bf4:	0300006f          	j	c24 <_ZN5Snake9get_inputEv+0xd8>
     bf8:	ffe00793          	li	a5,-2
     bfc:	fef42623          	sw	a5,-20(s0)
     c00:	0240006f          	j	c24 <_ZN5Snake9get_inputEv+0xd8>
     c04:	05000793          	li	a5,80
     c08:	fef42623          	sw	a5,-20(s0)
     c0c:	0180006f          	j	c24 <_ZN5Snake9get_inputEv+0xd8>
     c10:	00200793          	li	a5,2
     c14:	fef42623          	sw	a5,-20(s0)
     c18:	00c0006f          	j	c24 <_ZN5Snake9get_inputEv+0xd8>
     c1c:	999ff0ef          	jal	5b4 <_Z13do_game_pausev>
     c20:	00000013          	nop
     c24:	fdc42783          	lw	a5,-36(s0)
     c28:	0087a783          	lw	a5,8(a5)
     c2c:	40f007b3          	neg	a5,a5
     c30:	fec42703          	lw	a4,-20(s0)
     c34:	00f70c63          	beq	a4,a5,c4c <_ZN5Snake9get_inputEv+0x100>
     c38:	fdc42783          	lw	a5,-36(s0)
     c3c:	fec42703          	lw	a4,-20(s0)
     c40:	00e7a423          	sw	a4,8(a5)
     c44:	0080006f          	j	c4c <_ZN5Snake9get_inputEv+0x100>
     c48:	00000013          	nop
     c4c:	02c12083          	lw	ra,44(sp)
     c50:	02812403          	lw	s0,40(sp)
     c54:	03010113          	add	sp,sp,48
     c58:	00008067          	ret

00000c5c <_ZN5Snake4sizeEv>:
     c5c:	fd010113          	add	sp,sp,-48
     c60:	02812623          	sw	s0,44(sp)
     c64:	03010413          	add	s0,sp,48
     c68:	fca42e23          	sw	a0,-36(s0)
     c6c:	10000793          	li	a5,256
     c70:	fef42623          	sw	a5,-20(s0)
     c74:	fdc42783          	lw	a5,-36(s0)
     c78:	0007a703          	lw	a4,0(a5)
     c7c:	fdc42783          	lw	a5,-36(s0)
     c80:	0047a783          	lw	a5,4(a5)
     c84:	40f707b3          	sub	a5,a4,a5
     c88:	10178793          	add	a5,a5,257
     c8c:	0ff7f793          	zext.b	a5,a5
     c90:	fef42423          	sw	a5,-24(s0)
     c94:	fe842783          	lw	a5,-24(s0)
     c98:	00078863          	beqz	a5,ca8 <_ZN5Snake4sizeEv+0x4c>
     c9c:	fe840793          	add	a5,s0,-24
     ca0:	0007a783          	lw	a5,0(a5)
     ca4:	0080006f          	j	cac <_ZN5Snake4sizeEv+0x50>
     ca8:	10000793          	li	a5,256
     cac:	00078513          	mv	a0,a5
     cb0:	02c12403          	lw	s0,44(sp)
     cb4:	03010113          	add	sp,sp,48
     cb8:	00008067          	ret

00000cbc <_ZN5Snake9move_headEv>:
     cbc:	fd010113          	add	sp,sp,-48
     cc0:	02112623          	sw	ra,44(sp)
     cc4:	02812423          	sw	s0,40(sp)
     cc8:	02912223          	sw	s1,36(sp)
     ccc:	03010413          	add	s0,sp,48
     cd0:	fca42e23          	sw	a0,-36(s0)
     cd4:	fdc42783          	lw	a5,-36(s0)
     cd8:	0007a783          	lw	a5,0(a5)
     cdc:	fdc42703          	lw	a4,-36(s0)
     ce0:	00878793          	add	a5,a5,8
     ce4:	00179793          	sll	a5,a5,0x1
     ce8:	00f707b3          	add	a5,a4,a5
     cec:	0007d783          	lhu	a5,0(a5)
     cf0:	fef42623          	sw	a5,-20(s0)
     cf4:	fdc42783          	lw	a5,-36(s0)
     cf8:	0087a783          	lw	a5,8(a5)
     cfc:	00078713          	mv	a4,a5
     d00:	fec42783          	lw	a5,-20(s0)
     d04:	00e787b3          	add	a5,a5,a4
     d08:	fef42423          	sw	a5,-24(s0)
     d0c:	fdc42783          	lw	a5,-36(s0)
     d10:	0087a703          	lw	a4,8(a5)
     d14:	fdc42783          	lw	a5,-36(s0)
     d18:	00c7a783          	lw	a5,12(a5)
     d1c:	04f71263          	bne	a4,a5,d60 <_ZN5Snake9move_headEv+0xa4>
     d20:	fdc42783          	lw	a5,-36(s0)
     d24:	0087a703          	lw	a4,8(a5)
     d28:	fb000793          	li	a5,-80
     d2c:	00f70a63          	beq	a4,a5,d40 <_ZN5Snake9move_headEv+0x84>
     d30:	fdc42783          	lw	a5,-36(s0)
     d34:	0087a703          	lw	a4,8(a5)
     d38:	05000793          	li	a5,80
     d3c:	00f71663          	bne	a4,a5,d48 <_ZN5Snake9move_headEv+0x8c>
     d40:	07c00793          	li	a5,124
     d44:	0080006f          	j	d4c <_ZN5Snake9move_headEv+0x90>
     d48:	02d00793          	li	a5,45
     d4c:	30402683          	lw	a3,772(zero) # 304 <video_memory_1d>
     d50:	fec42703          	lw	a4,-20(s0)
     d54:	00e68733          	add	a4,a3,a4
     d58:	00f70023          	sb	a5,0(a4)
     d5c:	0340006f          	j	d90 <_ZN5Snake9move_headEv+0xd4>
     d60:	fdc42783          	lw	a5,-36(s0)
     d64:	00c7a683          	lw	a3,12(a5)
     d68:	fdc42783          	lw	a5,-36(s0)
     d6c:	0087a603          	lw	a2,8(a5)
     d70:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     d74:	fec42783          	lw	a5,-20(s0)
     d78:	00f704b3          	add	s1,a4,a5
     d7c:	00068593          	mv	a1,a3
     d80:	fdc42503          	lw	a0,-36(s0)
     d84:	c21ff0ef          	jal	9a4 <_ZN5Snake14turn_connectorE9directionS0_>
     d88:	00050793          	mv	a5,a0
     d8c:	00f48023          	sb	a5,0(s1)
     d90:	fdc42783          	lw	a5,-36(s0)
     d94:	0087a703          	lw	a4,8(a5)
     d98:	00200793          	li	a5,2
     d9c:	00f70a63          	beq	a4,a5,db0 <_ZN5Snake9move_headEv+0xf4>
     da0:	fdc42783          	lw	a5,-36(s0)
     da4:	0087a703          	lw	a4,8(a5)
     da8:	ffe00793          	li	a5,-2
     dac:	04f71063          	bne	a4,a5,dec <_ZN5Snake9move_headEv+0x130>
     db0:	fdc42783          	lw	a5,-36(s0)
     db4:	0087a703          	lw	a4,8(a5)
     db8:	00200793          	li	a5,2
     dbc:	00f71863          	bne	a4,a5,dcc <_ZN5Snake9move_headEv+0x110>
     dc0:	fec42783          	lw	a5,-20(s0)
     dc4:	00178793          	add	a5,a5,1
     dc8:	00c0006f          	j	dd4 <_ZN5Snake9move_headEv+0x118>
     dcc:	fec42783          	lw	a5,-20(s0)
     dd0:	fff78793          	add	a5,a5,-1
     dd4:	fef42223          	sw	a5,-28(s0)
     dd8:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     ddc:	fe442783          	lw	a5,-28(s0)
     de0:	00f707b3          	add	a5,a4,a5
     de4:	f8500713          	li	a4,-123
     de8:	00e78023          	sb	a4,0(a5)
     dec:	fdc42783          	lw	a5,-36(s0)
     df0:	0087a703          	lw	a4,8(a5)
     df4:	fdc42783          	lw	a5,-36(s0)
     df8:	00e7a623          	sw	a4,12(a5)
     dfc:	fdc42783          	lw	a5,-36(s0)
     e00:	0007a783          	lw	a5,0(a5)
     e04:	00178793          	add	a5,a5,1
     e08:	0ff7f713          	zext.b	a4,a5
     e0c:	fdc42783          	lw	a5,-36(s0)
     e10:	00e7a023          	sw	a4,0(a5)
     e14:	fdc42783          	lw	a5,-36(s0)
     e18:	0007a783          	lw	a5,0(a5)
     e1c:	fe842703          	lw	a4,-24(s0)
     e20:	01071713          	sll	a4,a4,0x10
     e24:	01075713          	srl	a4,a4,0x10
     e28:	fdc42683          	lw	a3,-36(s0)
     e2c:	00878793          	add	a5,a5,8
     e30:	00179793          	sll	a5,a5,0x1
     e34:	00f687b3          	add	a5,a3,a5
     e38:	00e79023          	sh	a4,0(a5)
     e3c:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     e40:	fe842783          	lw	a5,-24(s0)
     e44:	00f707b3          	add	a5,a4,a5
     e48:	06f00713          	li	a4,111
     e4c:	00e78023          	sb	a4,0(a5)
     e50:	00000013          	nop
     e54:	02c12083          	lw	ra,44(sp)
     e58:	02812403          	lw	s0,40(sp)
     e5c:	02412483          	lw	s1,36(sp)
     e60:	03010113          	add	sp,sp,48
     e64:	00008067          	ret

00000e68 <_ZN5Snake9move_tailEv>:
     e68:	fd010113          	add	sp,sp,-48
     e6c:	02812623          	sw	s0,44(sp)
     e70:	03010413          	add	s0,sp,48
     e74:	fca42e23          	sw	a0,-36(s0)
     e78:	fdc42783          	lw	a5,-36(s0)
     e7c:	0047a783          	lw	a5,4(a5)
     e80:	fdc42703          	lw	a4,-36(s0)
     e84:	00878793          	add	a5,a5,8
     e88:	00179793          	sll	a5,a5,0x1
     e8c:	00f707b3          	add	a5,a4,a5
     e90:	0007d783          	lhu	a5,0(a5)
     e94:	fef42623          	sw	a5,-20(s0)
     e98:	fdc42783          	lw	a5,-36(s0)
     e9c:	0047a783          	lw	a5,4(a5)
     ea0:	00178793          	add	a5,a5,1
     ea4:	0ff7f793          	zext.b	a5,a5
     ea8:	fef42423          	sw	a5,-24(s0)
     eac:	fdc42703          	lw	a4,-36(s0)
     eb0:	fe842783          	lw	a5,-24(s0)
     eb4:	00878793          	add	a5,a5,8
     eb8:	00179793          	sll	a5,a5,0x1
     ebc:	00f707b3          	add	a5,a4,a5
     ec0:	0007d783          	lhu	a5,0(a5)
     ec4:	fef42223          	sw	a5,-28(s0)
     ec8:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     ecc:	fec42783          	lw	a5,-20(s0)
     ed0:	00f707b3          	add	a5,a4,a5
     ed4:	02000713          	li	a4,32
     ed8:	00e78023          	sb	a4,0(a5)
     edc:	fe442703          	lw	a4,-28(s0)
     ee0:	fec42783          	lw	a5,-20(s0)
     ee4:	40f707b3          	sub	a5,a4,a5
     ee8:	fef42023          	sw	a5,-32(s0)
     eec:	fe042703          	lw	a4,-32(s0)
     ef0:	00200793          	li	a5,2
     ef4:	02f71063          	bne	a4,a5,f14 <_ZN5Snake9move_tailEv+0xac>
     ef8:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     efc:	fec42783          	lw	a5,-20(s0)
     f00:	00178793          	add	a5,a5,1
     f04:	00f707b3          	add	a5,a4,a5
     f08:	02000713          	li	a4,32
     f0c:	00e78023          	sb	a4,0(a5)
     f10:	0280006f          	j	f38 <_ZN5Snake9move_tailEv+0xd0>
     f14:	fe042703          	lw	a4,-32(s0)
     f18:	ffe00793          	li	a5,-2
     f1c:	00f71e63          	bne	a4,a5,f38 <_ZN5Snake9move_tailEv+0xd0>
     f20:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     f24:	fec42783          	lw	a5,-20(s0)
     f28:	fff78793          	add	a5,a5,-1
     f2c:	00f707b3          	add	a5,a4,a5
     f30:	02000713          	li	a4,32
     f34:	00e78023          	sb	a4,0(a5)
     f38:	fdc42783          	lw	a5,-36(s0)
     f3c:	fe842703          	lw	a4,-24(s0)
     f40:	00e7a223          	sw	a4,4(a5)
     f44:	00000013          	nop
     f48:	02c12403          	lw	s0,44(sp)
     f4c:	03010113          	add	sp,sp,48
     f50:	00008067          	ret

00000f54 <_ZN5Snake9is_eatingEj>:
     f54:	fe010113          	add	sp,sp,-32
     f58:	00812e23          	sw	s0,28(sp)
     f5c:	02010413          	add	s0,sp,32
     f60:	fea42623          	sw	a0,-20(s0)
     f64:	feb42423          	sw	a1,-24(s0)
     f68:	fec42783          	lw	a5,-20(s0)
     f6c:	0007a783          	lw	a5,0(a5)
     f70:	fec42703          	lw	a4,-20(s0)
     f74:	00878793          	add	a5,a5,8
     f78:	00179793          	sll	a5,a5,0x1
     f7c:	00f707b3          	add	a5,a4,a5
     f80:	0007d783          	lhu	a5,0(a5)
     f84:	00078713          	mv	a4,a5
     f88:	fe842783          	lw	a5,-24(s0)
     f8c:	40e787b3          	sub	a5,a5,a4
     f90:	0017b793          	seqz	a5,a5
     f94:	0ff7f793          	zext.b	a5,a5
     f98:	00078513          	mv	a0,a5
     f9c:	01c12403          	lw	s0,28(sp)
     fa0:	02010113          	add	sp,sp,32
     fa4:	00008067          	ret

00000fa8 <_ZN5Snake17has_collided_withEj>:
     fa8:	fc010113          	add	sp,sp,-64
     fac:	02112e23          	sw	ra,60(sp)
     fb0:	02812c23          	sw	s0,56(sp)
     fb4:	04010413          	add	s0,sp,64
     fb8:	fca42623          	sw	a0,-52(s0)
     fbc:	fcb42423          	sw	a1,-56(s0)
     fc0:	fc842783          	lw	a5,-56(s0)
     fc4:	05000593          	li	a1,80
     fc8:	00078513          	mv	a0,a5
     fcc:	3d0000ef          	jal	139c <__hidden___udivsi3>
     fd0:	00050793          	mv	a5,a0
     fd4:	fef42423          	sw	a5,-24(s0)
     fd8:	fe842783          	lw	a5,-24(s0)
     fdc:	00078863          	beqz	a5,fec <_ZN5Snake17has_collided_withEj+0x44>
     fe0:	fe842703          	lw	a4,-24(s0)
     fe4:	01d00793          	li	a5,29
     fe8:	00f71663          	bne	a4,a5,ff4 <_ZN5Snake17has_collided_withEj+0x4c>
     fec:	00100793          	li	a5,1
     ff0:	1540006f          	j	1144 <_ZN5Snake17has_collided_withEj+0x19c>
     ff4:	fc842783          	lw	a5,-56(s0)
     ff8:	05000593          	li	a1,80
     ffc:	00078513          	mv	a0,a5
    1000:	3e4000ef          	jal	13e4 <__umodsi3>
    1004:	00050793          	mv	a5,a0
    1008:	fef42223          	sw	a5,-28(s0)
    100c:	fe442783          	lw	a5,-28(s0)
    1010:	00078863          	beqz	a5,1020 <_ZN5Snake17has_collided_withEj+0x78>
    1014:	fe442703          	lw	a4,-28(s0)
    1018:	04f00793          	li	a5,79
    101c:	00f71663          	bne	a4,a5,1028 <_ZN5Snake17has_collided_withEj+0x80>
    1020:	00100793          	li	a5,1
    1024:	1200006f          	j	1144 <_ZN5Snake17has_collided_withEj+0x19c>
    1028:	fcc42783          	lw	a5,-52(s0)
    102c:	0047a783          	lw	a5,4(a5)
    1030:	fef42623          	sw	a5,-20(s0)
    1034:	0fc0006f          	j	1130 <_ZN5Snake17has_collided_withEj+0x188>
    1038:	fcc42703          	lw	a4,-52(s0)
    103c:	fec42783          	lw	a5,-20(s0)
    1040:	00878793          	add	a5,a5,8
    1044:	00179793          	sll	a5,a5,0x1
    1048:	00f707b3          	add	a5,a4,a5
    104c:	0007d783          	lhu	a5,0(a5)
    1050:	00078713          	mv	a4,a5
    1054:	fc842783          	lw	a5,-56(s0)
    1058:	00e79663          	bne	a5,a4,1064 <_ZN5Snake17has_collided_withEj+0xbc>
    105c:	00100793          	li	a5,1
    1060:	0e40006f          	j	1144 <_ZN5Snake17has_collided_withEj+0x19c>
    1064:	fec42783          	lw	a5,-20(s0)
    1068:	00178793          	add	a5,a5,1
    106c:	0ff7f793          	zext.b	a5,a5
    1070:	fef42023          	sw	a5,-32(s0)
    1074:	fcc42703          	lw	a4,-52(s0)
    1078:	fe042783          	lw	a5,-32(s0)
    107c:	00878793          	add	a5,a5,8
    1080:	00179793          	sll	a5,a5,0x1
    1084:	00f707b3          	add	a5,a4,a5
    1088:	0007d783          	lhu	a5,0(a5)
    108c:	00078693          	mv	a3,a5
    1090:	fcc42703          	lw	a4,-52(s0)
    1094:	fec42783          	lw	a5,-20(s0)
    1098:	00878793          	add	a5,a5,8
    109c:	00179793          	sll	a5,a5,0x1
    10a0:	00f707b3          	add	a5,a4,a5
    10a4:	0007d783          	lhu	a5,0(a5)
    10a8:	40f687b3          	sub	a5,a3,a5
    10ac:	fcf42e23          	sw	a5,-36(s0)
    10b0:	fdc42703          	lw	a4,-36(s0)
    10b4:	00200793          	li	a5,2
    10b8:	02f71863          	bne	a4,a5,10e8 <_ZN5Snake17has_collided_withEj+0x140>
    10bc:	fcc42703          	lw	a4,-52(s0)
    10c0:	fec42783          	lw	a5,-20(s0)
    10c4:	00878793          	add	a5,a5,8
    10c8:	00179793          	sll	a5,a5,0x1
    10cc:	00f707b3          	add	a5,a4,a5
    10d0:	0007d783          	lhu	a5,0(a5)
    10d4:	00178713          	add	a4,a5,1
    10d8:	fc842783          	lw	a5,-56(s0)
    10dc:	00f71663          	bne	a4,a5,10e8 <_ZN5Snake17has_collided_withEj+0x140>
    10e0:	00100793          	li	a5,1
    10e4:	0600006f          	j	1144 <_ZN5Snake17has_collided_withEj+0x19c>
    10e8:	fdc42703          	lw	a4,-36(s0)
    10ec:	ffe00793          	li	a5,-2
    10f0:	02f71863          	bne	a4,a5,1120 <_ZN5Snake17has_collided_withEj+0x178>
    10f4:	fcc42703          	lw	a4,-52(s0)
    10f8:	fec42783          	lw	a5,-20(s0)
    10fc:	00878793          	add	a5,a5,8
    1100:	00179793          	sll	a5,a5,0x1
    1104:	00f707b3          	add	a5,a4,a5
    1108:	0007d783          	lhu	a5,0(a5)
    110c:	fff78713          	add	a4,a5,-1
    1110:	fc842783          	lw	a5,-56(s0)
    1114:	00f71663          	bne	a4,a5,1120 <_ZN5Snake17has_collided_withEj+0x178>
    1118:	00100793          	li	a5,1
    111c:	0280006f          	j	1144 <_ZN5Snake17has_collided_withEj+0x19c>
    1120:	fec42783          	lw	a5,-20(s0)
    1124:	00178793          	add	a5,a5,1
    1128:	0ff7f793          	zext.b	a5,a5
    112c:	fef42623          	sw	a5,-20(s0)
    1130:	fcc42783          	lw	a5,-52(s0)
    1134:	0007a783          	lw	a5,0(a5)
    1138:	fec42703          	lw	a4,-20(s0)
    113c:	eef71ee3          	bne	a4,a5,1038 <_ZN5Snake17has_collided_withEj+0x90>
    1140:	00000793          	li	a5,0
    1144:	00078513          	mv	a0,a5
    1148:	03c12083          	lw	ra,60(sp)
    114c:	03812403          	lw	s0,56(sp)
    1150:	04010113          	add	sp,sp,64
    1154:	00008067          	ret

00001158 <_ZN5Snake17has_head_accidentEv>:
    1158:	fe010113          	add	sp,sp,-32
    115c:	00112e23          	sw	ra,28(sp)
    1160:	00812c23          	sw	s0,24(sp)
    1164:	02010413          	add	s0,sp,32
    1168:	fea42623          	sw	a0,-20(s0)
    116c:	fec42783          	lw	a5,-20(s0)
    1170:	0007a783          	lw	a5,0(a5)
    1174:	fec42703          	lw	a4,-20(s0)
    1178:	00878793          	add	a5,a5,8
    117c:	00179793          	sll	a5,a5,0x1
    1180:	00f707b3          	add	a5,a4,a5
    1184:	0007d783          	lhu	a5,0(a5)
    1188:	00078593          	mv	a1,a5
    118c:	fec42503          	lw	a0,-20(s0)
    1190:	e19ff0ef          	jal	fa8 <_ZN5Snake17has_collided_withEj>
    1194:	00050793          	mv	a5,a0
    1198:	00078513          	mv	a0,a5
    119c:	01c12083          	lw	ra,28(sp)
    11a0:	01812403          	lw	s0,24(sp)
    11a4:	02010113          	add	sp,sp,32
    11a8:	00008067          	ret

000011ac <_Z41__static_initialization_and_destruction_0v>:
    11ac:	ff010113          	add	sp,sp,-16
    11b0:	00112623          	sw	ra,12(sp)
    11b4:	00812423          	sw	s0,8(sp)
    11b8:	01010413          	add	s0,sp,16
    11bc:	0cc00513          	li	a0,204
    11c0:	fc4ff0ef          	jal	984 <_ZN5SnakeC1Ev>
    11c4:	00000013          	nop
    11c8:	00c12083          	lw	ra,12(sp)
    11cc:	00812403          	lw	s0,8(sp)
    11d0:	01010113          	add	sp,sp,16
    11d4:	00008067          	ret

000011d8 <_GLOBAL__sub_I_state>:
    11d8:	ff010113          	add	sp,sp,-16
    11dc:	00112623          	sw	ra,12(sp)
    11e0:	00812423          	sw	s0,8(sp)
    11e4:	01010413          	add	s0,sp,16
    11e8:	fc5ff0ef          	jal	11ac <_Z41__static_initialization_and_destruction_0v>
    11ec:	00c12083          	lw	ra,12(sp)
    11f0:	00812403          	lw	s0,8(sp)
    11f4:	01010113          	add	sp,sp,16
    11f8:	00008067          	ret

000011fc <_Z22print_string_at_centerILj32EEjjRAT__Kc>:
    11fc:	fe010113          	add	sp,sp,-32
    1200:	00112e23          	sw	ra,28(sp)
    1204:	00812c23          	sw	s0,24(sp)
    1208:	02010413          	add	s0,sp,32
    120c:	fea42623          	sw	a0,-20(s0)
    1210:	feb42423          	sw	a1,-24(s0)
    1214:	01f00693          	li	a3,31
    1218:	fe842603          	lw	a2,-24(s0)
    121c:	01800593          	li	a1,24
    1220:	fec42503          	lw	a0,-20(s0)
    1224:	8a0ff0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    1228:	03700793          	li	a5,55
    122c:	00078513          	mv	a0,a5
    1230:	01c12083          	lw	ra,28(sp)
    1234:	01812403          	lw	s0,24(sp)
    1238:	02010113          	add	sp,sp,32
    123c:	00008067          	ret

00001240 <_Z22print_string_at_centerILj27EEjjRAT__Kc>:
    1240:	fe010113          	add	sp,sp,-32
    1244:	00112e23          	sw	ra,28(sp)
    1248:	00812c23          	sw	s0,24(sp)
    124c:	02010413          	add	s0,sp,32
    1250:	fea42623          	sw	a0,-20(s0)
    1254:	feb42423          	sw	a1,-24(s0)
    1258:	01a00693          	li	a3,26
    125c:	fe842603          	lw	a2,-24(s0)
    1260:	01b00593          	li	a1,27
    1264:	fec42503          	lw	a0,-20(s0)
    1268:	85cff0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    126c:	03500793          	li	a5,53
    1270:	00078513          	mv	a0,a5
    1274:	01c12083          	lw	ra,28(sp)
    1278:	01812403          	lw	s0,24(sp)
    127c:	02010113          	add	sp,sp,32
    1280:	00008067          	ret

00001284 <_Z22print_string_at_centerILj25EEjjRAT__Kc>:
    1284:	fe010113          	add	sp,sp,-32
    1288:	00112e23          	sw	ra,28(sp)
    128c:	00812c23          	sw	s0,24(sp)
    1290:	02010413          	add	s0,sp,32
    1294:	fea42623          	sw	a0,-20(s0)
    1298:	feb42423          	sw	a1,-24(s0)
    129c:	01800693          	li	a3,24
    12a0:	fe842603          	lw	a2,-24(s0)
    12a4:	01c00593          	li	a1,28
    12a8:	fec42503          	lw	a0,-20(s0)
    12ac:	818ff0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    12b0:	03400793          	li	a5,52
    12b4:	00078513          	mv	a0,a5
    12b8:	01c12083          	lw	ra,28(sp)
    12bc:	01812403          	lw	s0,24(sp)
    12c0:	02010113          	add	sp,sp,32
    12c4:	00008067          	ret

000012c8 <_Z22print_string_at_centerILj12EEjjRAT__Kc>:
    12c8:	fe010113          	add	sp,sp,-32
    12cc:	00112e23          	sw	ra,28(sp)
    12d0:	00812c23          	sw	s0,24(sp)
    12d4:	02010413          	add	s0,sp,32
    12d8:	fea42623          	sw	a0,-20(s0)
    12dc:	feb42423          	sw	a1,-24(s0)
    12e0:	00b00693          	li	a3,11
    12e4:	fe842603          	lw	a2,-24(s0)
    12e8:	02200593          	li	a1,34
    12ec:	fec42503          	lw	a0,-20(s0)
    12f0:	fd5fe0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    12f4:	02d00793          	li	a5,45
    12f8:	00078513          	mv	a0,a5
    12fc:	01c12083          	lw	ra,28(sp)
    1300:	01812403          	lw	s0,24(sp)
    1304:	02010113          	add	sp,sp,32
    1308:	00008067          	ret

0000130c <_Z22print_string_at_centerILj24EEjjRAT__Kc>:
    130c:	fe010113          	add	sp,sp,-32
    1310:	00112e23          	sw	ra,28(sp)
    1314:	00812c23          	sw	s0,24(sp)
    1318:	02010413          	add	s0,sp,32
    131c:	fea42623          	sw	a0,-20(s0)
    1320:	feb42423          	sw	a1,-24(s0)
    1324:	01700693          	li	a3,23
    1328:	fe842603          	lw	a2,-24(s0)
    132c:	01c00593          	li	a1,28
    1330:	fec42503          	lw	a0,-20(s0)
    1334:	f91fe0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    1338:	03300793          	li	a5,51
    133c:	00078513          	mv	a0,a5
    1340:	01c12083          	lw	ra,28(sp)
    1344:	01812403          	lw	s0,24(sp)
    1348:	02010113          	add	sp,sp,32
    134c:	00008067          	ret

00001350 <_Z22print_string_at_centerILj43EEjjRAT__Kc>:
    1350:	fe010113          	add	sp,sp,-32
    1354:	00112e23          	sw	ra,28(sp)
    1358:	00812c23          	sw	s0,24(sp)
    135c:	02010413          	add	s0,sp,32
    1360:	fea42623          	sw	a0,-20(s0)
    1364:	feb42423          	sw	a1,-24(s0)
    1368:	02a00693          	li	a3,42
    136c:	fe842603          	lw	a2,-24(s0)
    1370:	01300593          	li	a1,19
    1374:	fec42503          	lw	a0,-20(s0)
    1378:	f4dfe0ef          	jal	2c4 <_Z12print_stringjjPKcj>
    137c:	03d00793          	li	a5,61
    1380:	00078513          	mv	a0,a5
    1384:	01c12083          	lw	ra,28(sp)
    1388:	01812403          	lw	s0,24(sp)
    138c:	02010113          	add	sp,sp,32
    1390:	00008067          	ret

00001394 <__divsi3>:
    1394:	06054063          	bltz	a0,13f4 <__umodsi3+0x10>
    1398:	0605c663          	bltz	a1,1404 <__umodsi3+0x20>

0000139c <__hidden___udivsi3>:
    139c:	00058613          	mv	a2,a1
    13a0:	00050593          	mv	a1,a0
    13a4:	fff00513          	li	a0,-1
    13a8:	02060c63          	beqz	a2,13e0 <__hidden___udivsi3+0x44>
    13ac:	00100693          	li	a3,1
    13b0:	00b67a63          	bgeu	a2,a1,13c4 <__hidden___udivsi3+0x28>
    13b4:	00c05863          	blez	a2,13c4 <__hidden___udivsi3+0x28>
    13b8:	00161613          	sll	a2,a2,0x1
    13bc:	00169693          	sll	a3,a3,0x1
    13c0:	feb66ae3          	bltu	a2,a1,13b4 <__hidden___udivsi3+0x18>
    13c4:	00000513          	li	a0,0
    13c8:	00c5e663          	bltu	a1,a2,13d4 <__hidden___udivsi3+0x38>
    13cc:	40c585b3          	sub	a1,a1,a2
    13d0:	00d56533          	or	a0,a0,a3
    13d4:	0016d693          	srl	a3,a3,0x1
    13d8:	00165613          	srl	a2,a2,0x1
    13dc:	fe0696e3          	bnez	a3,13c8 <__hidden___udivsi3+0x2c>
    13e0:	00008067          	ret

000013e4 <__umodsi3>:
    13e4:	00008293          	mv	t0,ra
    13e8:	fb5ff0ef          	jal	139c <__hidden___udivsi3>
    13ec:	00058513          	mv	a0,a1
    13f0:	00028067          	jr	t0
    13f4:	40a00533          	neg	a0,a0
    13f8:	00b04863          	bgtz	a1,1408 <__umodsi3+0x24>
    13fc:	40b005b3          	neg	a1,a1
    1400:	f9dff06f          	j	139c <__hidden___udivsi3>
    1404:	40b005b3          	neg	a1,a1
    1408:	00008293          	mv	t0,ra
    140c:	f91ff0ef          	jal	139c <__hidden___udivsi3>
    1410:	40a00533          	neg	a0,a0
    1414:	00028067          	jr	t0

00001418 <__modsi3>:
    1418:	00008293          	mv	t0,ra
    141c:	0005ca63          	bltz	a1,1430 <__modsi3+0x18>
    1420:	00054c63          	bltz	a0,1438 <__modsi3+0x20>
    1424:	f79ff0ef          	jal	139c <__hidden___udivsi3>
    1428:	00058513          	mv	a0,a1
    142c:	00028067          	jr	t0
    1430:	40b005b3          	neg	a1,a1
    1434:	fe0558e3          	bgez	a0,1424 <__modsi3+0xc>
    1438:	40a00533          	neg	a0,a0
    143c:	f61ff0ef          	jal	139c <__hidden___udivsi3>
    1440:	40b00533          	neg	a0,a1
    1444:	00028067          	jr	t0

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

00000020 <state>:
  20:	0002                	.insn	2, 0x0002
  22:	0000                	.insn	2, 0x
  24:	7250                	.insn	2, 0x7250
  26:	7365                	.insn	2, 0x7365
  28:	6e612073          	.insn	4, 0x6e612073
  2c:	2079                	.insn	2, 0x2079
  2e:	2079656b          	.insn	4, 0x2079656b
  32:	6f74                	.insn	2, 0x6f74
  34:	7320                	.insn	2, 0x7320
  36:	6174                	.insn	2, 0x6174
  38:	7472                	.insn	2, 0x7472
  3a:	6e20                	.insn	2, 0x6e20
  3c:	7765                	.insn	2, 0x7765
  3e:	6720                	.insn	2, 0x6720
  40:	6d61                	.insn	2, 0x6d61
  42:	0065                	.insn	2, 0x0065
  44:	656d6147          	.insn	4, 0x656d6147
  48:	6f20                	.insn	2, 0x6f20
  4a:	6576                	.insn	2, 0x6576
  4c:	2e72                	.insn	2, 0x2e72
  4e:	5920                	.insn	2, 0x5920
  50:	2072756f          	jal	a0,27a56 <_trap_stack_ptr+0x25a56>
  54:	726f6373          	.insn	4, 0x726f6373
  58:	2065                	.insn	2, 0x2065
  5a:	7369                	.insn	2, 0x7369
  5c:	203a                	.insn	2, 0x203a
  5e:	0000                	.insn	2, 0x
  60:	6f59                	.insn	2, 0x6f59
  62:	2075                	.insn	2, 0x2075
  64:	2e6e6f77          	.insn	4, 0x2e6e6f77
  68:	5920                	.insn	2, 0x5920
  6a:	2072756f          	jal	a0,27a70 <_trap_stack_ptr+0x25a70>
  6e:	726f6373          	.insn	4, 0x726f6373
  72:	2065                	.insn	2, 0x2065
  74:	7369                	.insn	2, 0x7369
  76:	203a                	.insn	2, 0x203a
  78:	0000                	.insn	2, 0x
	...

0000007c <_ZL10pause_str1>:
  7c:	656d6147          	.insn	4, 0x656d6147
  80:	7020                	.insn	2, 0x7020
  82:	7561                	.insn	2, 0x7561
  84:	00646573          	.insn	4, 0x00646573

00000088 <_ZL10pause_str2>:
  88:	7250                	.insn	2, 0x7250
  8a:	7365                	.insn	2, 0x7365
  8c:	6e452073          	.insn	4, 0x6e452073
  90:	6574                	.insn	2, 0x6574
  92:	2072                	.insn	2, 0x2072
  94:	6f74                	.insn	2, 0x6f74
  96:	6320                	.insn	2, 0x6320
  98:	69746e6f          	jal	t3,46f2e <_trap_stack_ptr+0x44f2e>
  9c:	756e                	.insn	2, 0x756e
  9e:	0065                	.insn	2, 0x0065
  a0:	63757453          	.insn	4, 0x63757453
  a4:	7461206b          	.insn	4, 0x7461206b
  a8:	6720                	.insn	2, 0x6720
  aa:	6e65                	.insn	2, 0x6e65
  ac:	7265                	.insn	2, 0x7265
  ae:	7461                	.insn	2, 0x7461
  b0:	6e69                	.insn	2, 0x6e69
  b2:	6e732067          	.insn	4, 0x6e732067
  b6:	6361                	.insn	2, 0x6361
  b8:	49202e6b          	.insn	4, 0x49202e6b
  bc:	2774                	.insn	2, 0x2774
  be:	6f632073          	.insn	4, 0x6f632073
  c2:	2064726f          	jal	tp,472c8 <_trap_stack_ptr+0x452c8>
  c6:	7369                	.insn	2, 0x7369
  c8:	203a                	.insn	2, 0x203a
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
   8:	01007663          	bgeu	zero,a6,14 <collider_obj+0x8>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <_bss_end+0x38>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

