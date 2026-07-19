
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00001197          	auipc	gp,0x1
       4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
       8:	00002117          	auipc	sp,0x2
       c:	d7810113          	add	sp,sp,-648 # 1d80 <_stack_ptr>
      10:	20000293          	li	t0,512
      14:	57800313          	li	t1,1400

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
      4c:	208000ef          	jal	254 <main>

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
      c0:	16c000ef          	jal	22c <int_handler>
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
     134:	00000793          	li	a5,0
     138:	0007a703          	lw	a4,0(a5)
     13c:	56e02823          	sw	a4,1392(zero) # 570 <video_memory_1d>
     140:	00000793          	li	a5,0
     144:	0007a703          	lw	a4,0(a5)
     148:	56e02623          	sw	a4,1388(zero) # 56c <video_memory_2d>
     14c:	080007b7          	lui	a5,0x8000
     150:	00200713          	li	a4,2
     154:	00e7a823          	sw	a4,16(a5) # 8000010 <_trap_stack_ptr+0x7ffe010>
     158:	080007b7          	lui	a5,0x8000
     15c:	00031737          	lui	a4,0x31
     160:	d4070713          	add	a4,a4,-704 # 30d40 <_trap_stack_ptr+0x2ed40>
     164:	00e7a423          	sw	a4,8(a5) # 8000008 <_trap_stack_ptr+0x7ffe008>
     168:	00000013          	nop
     16c:	00c12403          	lw	s0,12(sp)
     170:	01010113          	add	sp,sp,16
     174:	00008067          	ret

00000178 <_Z7get_keyRh>:
     178:	fd010113          	add	sp,sp,-48
     17c:	02812623          	sw	s0,44(sp)
     180:	03010413          	add	s0,sp,48
     184:	fca42e23          	sw	a0,-36(s0)
     188:	030007b7          	lui	a5,0x3000
     18c:	0047a783          	lw	a5,4(a5) # 3000004 <_trap_stack_ptr+0x2ffe004>
     190:	00f037b3          	snez	a5,a5
     194:	fef407a3          	sb	a5,-17(s0)
     198:	030007b7          	lui	a5,0x3000
     19c:	0007a783          	lw	a5,0(a5) # 3000000 <_trap_stack_ptr+0x2ffe000>
     1a0:	0ff7f713          	zext.b	a4,a5
     1a4:	fdc42783          	lw	a5,-36(s0)
     1a8:	00e78023          	sb	a4,0(a5)
     1ac:	fef44783          	lbu	a5,-17(s0)
     1b0:	00078513          	mv	a0,a5
     1b4:	02c12403          	lw	s0,44(sp)
     1b8:	03010113          	add	sp,sp,48
     1bc:	00008067          	ret

000001c0 <_Z16get_random_valuev>:
     1c0:	fe010113          	add	sp,sp,-32
     1c4:	00112e23          	sw	ra,28(sp)
     1c8:	00812c23          	sw	s0,24(sp)
     1cc:	02010413          	add	s0,sp,32
     1d0:	2b0010ef          	jal	1480 <rand>
     1d4:	00050793          	mv	a5,a0
     1d8:	fef42623          	sw	a5,-20(s0)
     1dc:	fec42783          	lw	a5,-20(s0)
     1e0:	00078513          	mv	a0,a5
     1e4:	01c12083          	lw	ra,28(sp)
     1e8:	01812403          	lw	s0,24(sp)
     1ec:	02010113          	add	sp,sp,32
     1f0:	00008067          	ret

000001f4 <_Z8seed_rngj>:
     1f4:	fe010113          	add	sp,sp,-32
     1f8:	00112e23          	sw	ra,28(sp)
     1fc:	00812c23          	sw	s0,24(sp)
     200:	02010413          	add	s0,sp,32
     204:	fea42623          	sw	a0,-20(s0)
     208:	080007b7          	lui	a5,0x8000
     20c:	0007a783          	lw	a5,0(a5) # 8000000 <_trap_stack_ptr+0x7ffe000>
     210:	00078513          	mv	a0,a5
     214:	25c010ef          	jal	1470 <srand>
     218:	00000013          	nop
     21c:	01c12083          	lw	ra,28(sp)
     220:	01812403          	lw	s0,24(sp)
     224:	02010113          	add	sp,sp,32
     228:	00008067          	ret

0000022c <int_handler>:
     22c:	ff010113          	add	sp,sp,-16
     230:	00112623          	sw	ra,12(sp)
     234:	00812423          	sw	s0,8(sp)
     238:	01010413          	add	s0,sp,16
     23c:	52c000ef          	jal	768 <_Z10game_cyclev>
     240:	00000013          	nop
     244:	00c12083          	lw	ra,12(sp)
     248:	00812403          	lw	s0,8(sp)
     24c:	01010113          	add	sp,sp,16
     250:	00008067          	ret

00000254 <main>:
     254:	ff010113          	add	sp,sp,-16
     258:	00112623          	sw	ra,12(sp)
     25c:	00812423          	sw	s0,8(sp)
     260:	01010413          	add	s0,sp,16
     264:	ec5ff0ef          	jal	128 <_Z13config_periphv>
     268:	02c000ef          	jal	294 <_Z12clear_screenv>
     26c:	238000ef          	jal	4a4 <_Z11do_new_gamev>
     270:	00000013          	nop
     274:	02002783          	lw	a5,32(zero) # 20 <state>
     278:	fe079ee3          	bnez	a5,274 <main+0x20>
     27c:	268000ef          	jal	4e4 <_Z12prepare_gamev>
     280:	00000013          	nop
     284:	02002703          	lw	a4,32(zero) # 20 <state>
     288:	00200793          	li	a5,2
     28c:	fef71ce3          	bne	a4,a5,284 <_stack_size+0x4>
     290:	fddff06f          	j	26c <main+0x18>

00000294 <_Z12clear_screenv>:
     294:	fe010113          	add	sp,sp,-32
     298:	00812e23          	sw	s0,28(sp)
     29c:	02010413          	add	s0,sp,32
     2a0:	fe042623          	sw	zero,-20(s0)
     2a4:	0240006f          	j	2c8 <_Z12clear_screenv+0x34>
     2a8:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     2ac:	fec42783          	lw	a5,-20(s0)
     2b0:	00f707b3          	add	a5,a4,a5
     2b4:	02000713          	li	a4,32
     2b8:	00e78023          	sb	a4,0(a5)
     2bc:	fec42783          	lw	a5,-20(s0)
     2c0:	00178793          	add	a5,a5,1
     2c4:	fef42623          	sw	a5,-20(s0)
     2c8:	fec42703          	lw	a4,-20(s0)
     2cc:	000017b7          	lui	a5,0x1
     2d0:	95f78793          	add	a5,a5,-1697 # 95f <_Z11place_snackv+0x7b>
     2d4:	fce7fae3          	bgeu	a5,a4,2a8 <_Z12clear_screenv+0x14>
     2d8:	00000013          	nop
     2dc:	00000013          	nop
     2e0:	01c12403          	lw	s0,28(sp)
     2e4:	02010113          	add	sp,sp,32
     2e8:	00008067          	ret

000002ec <_Z12print_stringjjPKcj>:
     2ec:	fd010113          	add	sp,sp,-48
     2f0:	02812623          	sw	s0,44(sp)
     2f4:	03010413          	add	s0,sp,48
     2f8:	fca42e23          	sw	a0,-36(s0)
     2fc:	fcb42c23          	sw	a1,-40(s0)
     300:	fcc42a23          	sw	a2,-44(s0)
     304:	fcd42823          	sw	a3,-48(s0)
     308:	fe042623          	sw	zero,-20(s0)
     30c:	0500006f          	j	35c <_Z12print_stringjjPKcj+0x70>
     310:	fd442703          	lw	a4,-44(s0)
     314:	fec42783          	lw	a5,-20(s0)
     318:	00f70633          	add	a2,a4,a5
     31c:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     320:	fdc42703          	lw	a4,-36(s0)
     324:	00070793          	mv	a5,a4
     328:	00279793          	sll	a5,a5,0x2
     32c:	00e787b3          	add	a5,a5,a4
     330:	00479793          	sll	a5,a5,0x4
     334:	00f686b3          	add	a3,a3,a5
     338:	fd842703          	lw	a4,-40(s0)
     33c:	fec42783          	lw	a5,-20(s0)
     340:	00f707b3          	add	a5,a4,a5
     344:	00064703          	lbu	a4,0(a2)
     348:	00f687b3          	add	a5,a3,a5
     34c:	00e78023          	sb	a4,0(a5)
     350:	fec42783          	lw	a5,-20(s0)
     354:	00178793          	add	a5,a5,1
     358:	fef42623          	sw	a5,-20(s0)
     35c:	fec42703          	lw	a4,-20(s0)
     360:	fd042783          	lw	a5,-48(s0)
     364:	faf766e3          	bltu	a4,a5,310 <_Z12print_stringjjPKcj+0x24>
     368:	00000013          	nop
     36c:	00000013          	nop
     370:	02c12403          	lw	s0,44(sp)
     374:	03010113          	add	sp,sp,48
     378:	00008067          	ret

0000037c <_Z12print_uint32jjm>:
     37c:	fd010113          	add	sp,sp,-48
     380:	02812623          	sw	s0,44(sp)
     384:	03010413          	add	s0,sp,48
     388:	fca42e23          	sw	a0,-36(s0)
     38c:	fcb42c23          	sw	a1,-40(s0)
     390:	fcc42a23          	sw	a2,-44(s0)
     394:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     398:	fdc42703          	lw	a4,-36(s0)
     39c:	00070793          	mv	a5,a4
     3a0:	00279793          	sll	a5,a5,0x2
     3a4:	00e787b3          	add	a5,a5,a4
     3a8:	00479793          	sll	a5,a5,0x4
     3ac:	00f68733          	add	a4,a3,a5
     3b0:	fd842783          	lw	a5,-40(s0)
     3b4:	00f707b3          	add	a5,a4,a5
     3b8:	03000713          	li	a4,48
     3bc:	00e78023          	sb	a4,0(a5)
     3c0:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     3c4:	fdc42703          	lw	a4,-36(s0)
     3c8:	00070793          	mv	a5,a4
     3cc:	00279793          	sll	a5,a5,0x2
     3d0:	00e787b3          	add	a5,a5,a4
     3d4:	00479793          	sll	a5,a5,0x4
     3d8:	00f68733          	add	a4,a3,a5
     3dc:	fd842783          	lw	a5,-40(s0)
     3e0:	00178793          	add	a5,a5,1
     3e4:	00f707b3          	add	a5,a4,a5
     3e8:	07800713          	li	a4,120
     3ec:	00e78023          	sb	a4,0(a5)
     3f0:	fe042623          	sw	zero,-20(s0)
     3f4:	0900006f          	j	484 <__sf+0x50>
     3f8:	fec42783          	lw	a5,-20(s0)
     3fc:	00279793          	sll	a5,a5,0x2
     400:	fd442703          	lw	a4,-44(s0)
     404:	00f757b3          	srl	a5,a4,a5
     408:	0ff7f793          	zext.b	a5,a5
     40c:	00f7f793          	and	a5,a5,15
     410:	fef405a3          	sb	a5,-21(s0)
     414:	feb44703          	lbu	a4,-21(s0)
     418:	00900793          	li	a5,9
     41c:	00e7ea63          	bltu	a5,a4,430 <backup_array2+0x14>
     420:	feb44783          	lbu	a5,-21(s0)
     424:	03078793          	add	a5,a5,48
     428:	0ff7f793          	zext.b	a5,a5
     42c:	0100006f          	j	43c <__sf+0x8>
     430:	feb44783          	lbu	a5,-21(s0)
     434:	05778793          	add	a5,a5,87
     438:	0ff7f793          	zext.b	a5,a5
     43c:	fef40523          	sb	a5,-22(s0)
     440:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     444:	fdc42703          	lw	a4,-36(s0)
     448:	00070793          	mv	a5,a4
     44c:	00279793          	sll	a5,a5,0x2
     450:	00e787b3          	add	a5,a5,a4
     454:	00479793          	sll	a5,a5,0x4
     458:	00f68733          	add	a4,a3,a5
     45c:	fd842683          	lw	a3,-40(s0)
     460:	fec42783          	lw	a5,-20(s0)
     464:	40f687b3          	sub	a5,a3,a5
     468:	00978793          	add	a5,a5,9
     46c:	00f707b3          	add	a5,a4,a5
     470:	fea44703          	lbu	a4,-22(s0)
     474:	00e78023          	sb	a4,0(a5)
     478:	fec42783          	lw	a5,-20(s0)
     47c:	00178793          	add	a5,a5,1
     480:	fef42623          	sw	a5,-20(s0)
     484:	fec42703          	lw	a4,-20(s0)
     488:	00700793          	li	a5,7
     48c:	f6e7f6e3          	bgeu	a5,a4,3f8 <_Z12print_uint32jjm+0x7c>
     490:	00000013          	nop
     494:	00000013          	nop
     498:	02c12403          	lw	s0,44(sp)
     49c:	03010113          	add	sp,sp,48
     4a0:	00008067          	ret

000004a4 <_Z11do_new_gamev>:
     4a4:	ff010113          	add	sp,sp,-16
     4a8:	00112623          	sw	ra,12(sp)
     4ac:	00812423          	sw	s0,8(sp)
     4b0:	01010413          	add	s0,sp,16
     4b4:	00200713          	li	a4,2
     4b8:	02e02023          	sw	a4,32(zero) # 20 <state>
     4bc:	20000513          	li	a0,512
     4c0:	618000ef          	jal	ad8 <_ZN5Snake5resetEv>
     4c4:	02400593          	li	a1,36
     4c8:	00f00513          	li	a0,15
     4cc:	559000ef          	jal	1224 <_Z22print_string_at_centerILj32EEjjRAT__Kc>
     4d0:	00000013          	nop
     4d4:	00c12083          	lw	ra,12(sp)
     4d8:	00812403          	lw	s0,8(sp)
     4dc:	01010113          	add	sp,sp,16
     4e0:	00008067          	ret

000004e4 <_Z12prepare_gamev>:
     4e4:	ff010113          	add	sp,sp,-16
     4e8:	00112623          	sw	ra,12(sp)
     4ec:	00812423          	sw	s0,8(sp)
     4f0:	01010413          	add	s0,sp,16
     4f4:	00000513          	li	a0,0
     4f8:	cfdff0ef          	jal	1f4 <_Z8seed_rngj>
     4fc:	d99ff0ef          	jal	294 <_Z12clear_screenv>
     500:	304000ef          	jal	804 <_Z11place_wallsv>
     504:	3e0000ef          	jal	8e4 <_Z11place_snackv>
     508:	20000513          	li	a0,512
     50c:	5cc000ef          	jal	ad8 <_ZN5Snake5resetEv>
     510:	00000013          	nop
     514:	00c12083          	lw	ra,12(sp)
     518:	00812403          	lw	s0,8(sp)
     51c:	01010113          	add	sp,sp,16
     520:	00008067          	ret

00000524 <_Z12do_game_overv>:
     524:	fe010113          	add	sp,sp,-32
     528:	00112e23          	sw	ra,28(sp)
     52c:	00812c23          	sw	s0,24(sp)
     530:	02010413          	add	s0,sp,32
     534:	00200713          	li	a4,2
     538:	02e02023          	sw	a4,32(zero) # 20 <state>
     53c:	04400593          	li	a1,68
     540:	00e00513          	li	a0,14
     544:	525000ef          	jal	1268 <_Z22print_string_at_centerILj27EEjjRAT__Kc>
     548:	fea42623          	sw	a0,-20(s0)
     54c:	20000513          	li	a0,512
     550:	734000ef          	jal	c84 <_ZN5Snake4sizeEv>
     554:	00050793          	mv	a5,a0
     558:	ffc78793          	add	a5,a5,-4
     55c:	00078613          	mv	a2,a5
     560:	fec42583          	lw	a1,-20(s0)
     564:	00e00513          	li	a0,14
     568:	e15ff0ef          	jal	37c <_Z12print_uint32jjm>
     56c:	00000013          	nop
     570:	01c12083          	lw	ra,28(sp)
     574:	01812403          	lw	s0,24(sp)
     578:	02010113          	add	sp,sp,32
     57c:	00008067          	ret

00000580 <_Z14do_game_finishv>:
     580:	fe010113          	add	sp,sp,-32
     584:	00112e23          	sw	ra,28(sp)
     588:	00812c23          	sw	s0,24(sp)
     58c:	02010413          	add	s0,sp,32
     590:	00200713          	li	a4,2
     594:	02e02023          	sw	a4,32(zero) # 20 <state>
     598:	06000593          	li	a1,96
     59c:	00e00513          	li	a0,14
     5a0:	50d000ef          	jal	12ac <_Z22print_string_at_centerILj25EEjjRAT__Kc>
     5a4:	fea42623          	sw	a0,-20(s0)
     5a8:	20000513          	li	a0,512
     5ac:	6d8000ef          	jal	c84 <_ZN5Snake4sizeEv>
     5b0:	00050793          	mv	a5,a0
     5b4:	ffc78793          	add	a5,a5,-4
     5b8:	00078613          	mv	a2,a5
     5bc:	fec42583          	lw	a1,-20(s0)
     5c0:	00e00513          	li	a0,14
     5c4:	db9ff0ef          	jal	37c <_Z12print_uint32jjm>
     5c8:	00000013          	nop
     5cc:	01c12083          	lw	ra,28(sp)
     5d0:	01812403          	lw	s0,24(sp)
     5d4:	02010113          	add	sp,sp,32
     5d8:	00008067          	ret

000005dc <_Z13do_game_pausev>:
     5dc:	fe010113          	add	sp,sp,-32
     5e0:	00112e23          	sw	ra,28(sp)
     5e4:	00812c23          	sw	s0,24(sp)
     5e8:	02010413          	add	s0,sp,32
     5ec:	fe042623          	sw	zero,-20(s0)
     5f0:	03c0006f          	j	62c <_Z13do_game_pausev+0x50>
     5f4:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     5f8:	46078713          	add	a4,a5,1120
     5fc:	fec42783          	lw	a5,-20(s0)
     600:	02278793          	add	a5,a5,34
     604:	00f707b3          	add	a5,a4,a5
     608:	0007c783          	lbu	a5,0(a5)
     60c:	0ff7f713          	zext.b	a4,a5
     610:	41000693          	li	a3,1040
     614:	fec42783          	lw	a5,-20(s0)
     618:	00f687b3          	add	a5,a3,a5
     61c:	00e78023          	sb	a4,0(a5)
     620:	fec42783          	lw	a5,-20(s0)
     624:	00178793          	add	a5,a5,1
     628:	fef42623          	sw	a5,-20(s0)
     62c:	fec42703          	lw	a4,-20(s0)
     630:	00b00793          	li	a5,11
     634:	fce7f0e3          	bgeu	a5,a4,5f4 <_Z13do_game_pausev+0x18>
     638:	fe042423          	sw	zero,-24(s0)
     63c:	03c0006f          	j	678 <_Z13do_game_pausev+0x9c>
     640:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     644:	4b078713          	add	a4,a5,1200
     648:	fe842783          	lw	a5,-24(s0)
     64c:	01c78793          	add	a5,a5,28
     650:	00f707b3          	add	a5,a4,a5
     654:	0007c783          	lbu	a5,0(a5)
     658:	0ff7f713          	zext.b	a4,a5
     65c:	41c00693          	li	a3,1052
     660:	fe842783          	lw	a5,-24(s0)
     664:	00f687b3          	add	a5,a3,a5
     668:	00e78023          	sb	a4,0(a5)
     66c:	fe842783          	lw	a5,-24(s0)
     670:	00178793          	add	a5,a5,1
     674:	fef42423          	sw	a5,-24(s0)
     678:	fe842703          	lw	a4,-24(s0)
     67c:	01700793          	li	a5,23
     680:	fce7f0e3          	bgeu	a5,a4,640 <_Z13do_game_pausev+0x64>
     684:	07c00593          	li	a1,124
     688:	00e00513          	li	a0,14
     68c:	465000ef          	jal	12f0 <_Z22print_string_at_centerILj12EEjjRAT__Kc>
     690:	08800593          	li	a1,136
     694:	00f00513          	li	a0,15
     698:	49d000ef          	jal	1334 <_Z22print_string_at_centerILj24EEjjRAT__Kc>
     69c:	00100713          	li	a4,1
     6a0:	02e02023          	sw	a4,32(zero) # 20 <state>
     6a4:	00000013          	nop
     6a8:	01c12083          	lw	ra,28(sp)
     6ac:	01812403          	lw	s0,24(sp)
     6b0:	02010113          	add	sp,sp,32
     6b4:	00008067          	ret

000006b8 <_Z15do_game_unpausev>:
     6b8:	fe010113          	add	sp,sp,-32
     6bc:	00812e23          	sw	s0,28(sp)
     6c0:	02010413          	add	s0,sp,32
     6c4:	fe042623          	sw	zero,-20(s0)
     6c8:	0380006f          	j	700 <_Z15do_game_unpausev+0x48>
     6cc:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     6d0:	46078693          	add	a3,a5,1120
     6d4:	fec42783          	lw	a5,-20(s0)
     6d8:	02278793          	add	a5,a5,34
     6dc:	41000613          	li	a2,1040
     6e0:	fec42703          	lw	a4,-20(s0)
     6e4:	00e60733          	add	a4,a2,a4
     6e8:	00074703          	lbu	a4,0(a4)
     6ec:	00f687b3          	add	a5,a3,a5
     6f0:	00e78023          	sb	a4,0(a5)
     6f4:	fec42783          	lw	a5,-20(s0)
     6f8:	00178793          	add	a5,a5,1
     6fc:	fef42623          	sw	a5,-20(s0)
     700:	fec42703          	lw	a4,-20(s0)
     704:	00b00793          	li	a5,11
     708:	fce7f2e3          	bgeu	a5,a4,6cc <_Z15do_game_unpausev+0x14>
     70c:	fe042423          	sw	zero,-24(s0)
     710:	0380006f          	j	748 <_Z15do_game_unpausev+0x90>
     714:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     718:	4b078693          	add	a3,a5,1200
     71c:	fe842783          	lw	a5,-24(s0)
     720:	01c78793          	add	a5,a5,28
     724:	41c00613          	li	a2,1052
     728:	fe842703          	lw	a4,-24(s0)
     72c:	00e60733          	add	a4,a2,a4
     730:	00074703          	lbu	a4,0(a4)
     734:	00f687b3          	add	a5,a3,a5
     738:	00e78023          	sb	a4,0(a5)
     73c:	fe842783          	lw	a5,-24(s0)
     740:	00178793          	add	a5,a5,1
     744:	fef42423          	sw	a5,-24(s0)
     748:	fe842703          	lw	a4,-24(s0)
     74c:	01700793          	li	a5,23
     750:	fce7f2e3          	bgeu	a5,a4,714 <_Z15do_game_unpausev+0x5c>
     754:	02002023          	sw	zero,32(zero) # 20 <state>
     758:	00000013          	nop
     75c:	01c12403          	lw	s0,28(sp)
     760:	02010113          	add	sp,sp,32
     764:	00008067          	ret

00000768 <_Z10game_cyclev>:
     768:	ff010113          	add	sp,sp,-16
     76c:	00112623          	sw	ra,12(sp)
     770:	00812423          	sw	s0,8(sp)
     774:	01010413          	add	s0,sp,16
     778:	20000513          	li	a0,512
     77c:	3f8000ef          	jal	b74 <_ZN5Snake9get_inputEv>
     780:	02002783          	lw	a5,32(zero) # 20 <state>
     784:	06079663          	bnez	a5,7f0 <_Z10game_cyclev+0x88>
     788:	20000513          	li	a0,512
     78c:	558000ef          	jal	ce4 <_ZN5Snake9move_headEv>
     790:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     794:	00078593          	mv	a1,a5
     798:	20000513          	li	a0,512
     79c:	7e0000ef          	jal	f7c <_ZN5Snake9is_eatingEj>
     7a0:	00050793          	mv	a5,a0
     7a4:	02078863          	beqz	a5,7d4 <_Z10game_cyclev+0x6c>
     7a8:	20000513          	li	a0,512
     7ac:	4d8000ef          	jal	c84 <_ZN5Snake4sizeEv>
     7b0:	00050793          	mv	a5,a0
     7b4:	f0078793          	add	a5,a5,-256
     7b8:	0017b793          	seqz	a5,a5
     7bc:	0ff7f793          	zext.b	a5,a5
     7c0:	00078663          	beqz	a5,7cc <_Z10game_cyclev+0x64>
     7c4:	dbdff0ef          	jal	580 <_Z14do_game_finishv>
     7c8:	0280006f          	j	7f0 <_Z10game_cyclev+0x88>
     7cc:	118000ef          	jal	8e4 <_Z11place_snackv>
     7d0:	0200006f          	j	7f0 <_Z10game_cyclev+0x88>
     7d4:	20000513          	li	a0,512
     7d8:	6b8000ef          	jal	e90 <_ZN5Snake9move_tailEv>
     7dc:	20000513          	li	a0,512
     7e0:	1a1000ef          	jal	1180 <_ZN5Snake17has_head_accidentEv>
     7e4:	00050793          	mv	a5,a0
     7e8:	00078463          	beqz	a5,7f0 <_Z10game_cyclev+0x88>
     7ec:	d39ff0ef          	jal	524 <_Z12do_game_overv>
     7f0:	00000013          	nop
     7f4:	00c12083          	lw	ra,12(sp)
     7f8:	00812403          	lw	s0,8(sp)
     7fc:	01010113          	add	sp,sp,16
     800:	00008067          	ret

00000804 <_Z11place_wallsv>:
     804:	fe010113          	add	sp,sp,-32
     808:	00812e23          	sw	s0,28(sp)
     80c:	02010413          	add	s0,sp,32
     810:	fe042623          	sw	zero,-20(s0)
     814:	0440006f          	j	858 <_Z11place_wallsv+0x54>
     818:	56c02703          	lw	a4,1388(zero) # 56c <video_memory_2d>
     81c:	fec42783          	lw	a5,-20(s0)
     820:	00f707b3          	add	a5,a4,a5
     824:	f8700713          	li	a4,-121
     828:	00e78023          	sb	a4,0(a5)
     82c:	56c02703          	lw	a4,1388(zero) # 56c <video_memory_2d>
     830:	000017b7          	lui	a5,0x1
     834:	91078793          	add	a5,a5,-1776 # 910 <_Z11place_snackv+0x2c>
     838:	00f70733          	add	a4,a4,a5
     83c:	fec42783          	lw	a5,-20(s0)
     840:	00f707b3          	add	a5,a4,a5
     844:	f8700713          	li	a4,-121
     848:	00e78023          	sb	a4,0(a5)
     84c:	fec42783          	lw	a5,-20(s0)
     850:	00178793          	add	a5,a5,1
     854:	fef42623          	sw	a5,-20(s0)
     858:	fec42703          	lw	a4,-20(s0)
     85c:	04f00793          	li	a5,79
     860:	fae7fce3          	bgeu	a5,a4,818 <_Z11place_wallsv+0x14>
     864:	00100793          	li	a5,1
     868:	fef42423          	sw	a5,-24(s0)
     86c:	0580006f          	j	8c4 <_Z11place_wallsv+0xc0>
     870:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     874:	fe842703          	lw	a4,-24(s0)
     878:	00070793          	mv	a5,a4
     87c:	00279793          	sll	a5,a5,0x2
     880:	00e787b3          	add	a5,a5,a4
     884:	00479793          	sll	a5,a5,0x4
     888:	00f687b3          	add	a5,a3,a5
     88c:	f8700713          	li	a4,-121
     890:	00e78023          	sb	a4,0(a5)
     894:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     898:	fe842703          	lw	a4,-24(s0)
     89c:	00070793          	mv	a5,a4
     8a0:	00279793          	sll	a5,a5,0x2
     8a4:	00e787b3          	add	a5,a5,a4
     8a8:	00479793          	sll	a5,a5,0x4
     8ac:	00f687b3          	add	a5,a3,a5
     8b0:	f8700713          	li	a4,-121
     8b4:	04e787a3          	sb	a4,79(a5)
     8b8:	fe842783          	lw	a5,-24(s0)
     8bc:	00178793          	add	a5,a5,1
     8c0:	fef42423          	sw	a5,-24(s0)
     8c4:	fe842703          	lw	a4,-24(s0)
     8c8:	01c00793          	li	a5,28
     8cc:	fae7f2e3          	bgeu	a5,a4,870 <_Z11place_wallsv+0x6c>
     8d0:	00000013          	nop
     8d4:	00000013          	nop
     8d8:	01c12403          	lw	s0,28(sp)
     8dc:	02010113          	add	sp,sp,32
     8e0:	00008067          	ret

000008e4 <_Z11place_snackv>:
     8e4:	fe010113          	add	sp,sp,-32
     8e8:	00112e23          	sw	ra,28(sp)
     8ec:	00812c23          	sw	s0,24(sp)
     8f0:	02010413          	add	s0,sp,32
     8f4:	fe042623          	sw	zero,-20(s0)
     8f8:	fec42703          	lw	a4,-20(s0)
     8fc:	06400793          	li	a5,100
     900:	02e7f463          	bgeu	a5,a4,928 <_Z11place_snackv+0x44>
     904:	0a000593          	li	a1,160
     908:	00000513          	li	a0,0
     90c:	26d000ef          	jal	1378 <_Z22print_string_at_centerILj43EEjjRAT__Kc>
     910:	fea42423          	sw	a0,-24(s0)
     914:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     918:	00078613          	mv	a2,a5
     91c:	fe842583          	lw	a1,-24(s0)
     920:	00000513          	li	a0,0
     924:	a59ff0ef          	jal	37c <_Z12print_uint32jjm>
     928:	899ff0ef          	jal	1c0 <_Z16get_random_valuev>
     92c:	00050793          	mv	a5,a0
     930:	ffe7f713          	and	a4,a5,-2
     934:	56e02a23          	sw	a4,1396(zero) # 574 <snack_coord>
     938:	fec42783          	lw	a5,-20(s0)
     93c:	00178793          	add	a5,a5,1
     940:	fef42623          	sw	a5,-20(s0)
     944:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     948:	00078593          	mv	a1,a5
     94c:	20000513          	li	a0,512
     950:	680000ef          	jal	fd0 <_ZN5Snake17has_collided_withEj>
     954:	00050793          	mv	a5,a0
     958:	00079e63          	bnez	a5,974 <_Z11place_snackv+0x90>
     95c:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     960:	00078593          	mv	a1,a5
     964:	20000513          	li	a0,512
     968:	614000ef          	jal	f7c <_ZN5Snake9is_eatingEj>
     96c:	00050793          	mv	a5,a0
     970:	00078663          	beqz	a5,97c <_Z11place_snackv+0x98>
     974:	00100793          	li	a5,1
     978:	0080006f          	j	980 <_Z11place_snackv+0x9c>
     97c:	00000793          	li	a5,0
     980:	f6079ce3          	bnez	a5,8f8 <_Z11place_snackv+0x14>
     984:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     988:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     98c:	00f707b3          	add	a5,a4,a5
     990:	f8600713          	li	a4,-122
     994:	00e78023          	sb	a4,0(a5)
     998:	00000013          	nop
     99c:	01c12083          	lw	ra,28(sp)
     9a0:	01812403          	lw	s0,24(sp)
     9a4:	02010113          	add	sp,sp,32
     9a8:	00008067          	ret

000009ac <_ZN5SnakeC1Ev>:
     9ac:	fe010113          	add	sp,sp,-32
     9b0:	00812e23          	sw	s0,28(sp)
     9b4:	02010413          	add	s0,sp,32
     9b8:	fea42623          	sw	a0,-20(s0)
     9bc:	00000013          	nop
     9c0:	01c12403          	lw	s0,28(sp)
     9c4:	02010113          	add	sp,sp,32
     9c8:	00008067          	ret

000009cc <_ZN5Snake14turn_connectorE9directionS0_>:
     9cc:	fe010113          	add	sp,sp,-32
     9d0:	00812e23          	sw	s0,28(sp)
     9d4:	02010413          	add	s0,sp,32
     9d8:	fea42623          	sw	a0,-20(s0)
     9dc:	feb42423          	sw	a1,-24(s0)
     9e0:	fec42223          	sw	a2,-28(s0)
     9e4:	fe842703          	lw	a4,-24(s0)
     9e8:	05000793          	li	a5,80
     9ec:	00f71863          	bne	a4,a5,9fc <_ZN5Snake14turn_connectorE9directionS0_+0x30>
     9f0:	fe442703          	lw	a4,-28(s0)
     9f4:	00200793          	li	a5,2
     9f8:	00f70e63          	beq	a4,a5,a14 <_ZN5Snake14turn_connectorE9directionS0_+0x48>
     9fc:	fe842703          	lw	a4,-24(s0)
     a00:	ffe00793          	li	a5,-2
     a04:	00f71c63          	bne	a4,a5,a1c <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     a08:	fe442703          	lw	a4,-28(s0)
     a0c:	fb000793          	li	a5,-80
     a10:	00f71663          	bne	a4,a5,a1c <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     a14:	08100793          	li	a5,129
     a18:	0b00006f          	j	ac8 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a1c:	fe842703          	lw	a4,-24(s0)
     a20:	05000793          	li	a5,80
     a24:	00f71863          	bne	a4,a5,a34 <_ZN5Snake14turn_connectorE9directionS0_+0x68>
     a28:	fe442703          	lw	a4,-28(s0)
     a2c:	ffe00793          	li	a5,-2
     a30:	00f70e63          	beq	a4,a5,a4c <_ZN5Snake14turn_connectorE9directionS0_+0x80>
     a34:	fe842703          	lw	a4,-24(s0)
     a38:	00200793          	li	a5,2
     a3c:	00f71c63          	bne	a4,a5,a54 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a40:	fe442703          	lw	a4,-28(s0)
     a44:	fb000793          	li	a5,-80
     a48:	00f71663          	bne	a4,a5,a54 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a4c:	08200793          	li	a5,130
     a50:	0780006f          	j	ac8 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a54:	fe842703          	lw	a4,-24(s0)
     a58:	fb000793          	li	a5,-80
     a5c:	00f71863          	bne	a4,a5,a6c <_ZN5Snake14turn_connectorE9directionS0_+0xa0>
     a60:	fe442703          	lw	a4,-28(s0)
     a64:	ffe00793          	li	a5,-2
     a68:	00f70e63          	beq	a4,a5,a84 <_ZN5Snake14turn_connectorE9directionS0_+0xb8>
     a6c:	fe842703          	lw	a4,-24(s0)
     a70:	00200793          	li	a5,2
     a74:	00f71c63          	bne	a4,a5,a8c <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a78:	fe442703          	lw	a4,-28(s0)
     a7c:	05000793          	li	a5,80
     a80:	00f71663          	bne	a4,a5,a8c <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a84:	08300793          	li	a5,131
     a88:	0400006f          	j	ac8 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a8c:	fe842703          	lw	a4,-24(s0)
     a90:	fb000793          	li	a5,-80
     a94:	00f71863          	bne	a4,a5,aa4 <_ZN5Snake14turn_connectorE9directionS0_+0xd8>
     a98:	fe442703          	lw	a4,-28(s0)
     a9c:	00200793          	li	a5,2
     aa0:	00f70e63          	beq	a4,a5,abc <_ZN5Snake14turn_connectorE9directionS0_+0xf0>
     aa4:	fe842703          	lw	a4,-24(s0)
     aa8:	ffe00793          	li	a5,-2
     aac:	00f71c63          	bne	a4,a5,ac4 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     ab0:	fe442703          	lw	a4,-28(s0)
     ab4:	05000793          	li	a5,80
     ab8:	00f71663          	bne	a4,a5,ac4 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     abc:	08400793          	li	a5,132
     ac0:	0080006f          	j	ac8 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     ac4:	07c00793          	li	a5,124
     ac8:	00078513          	mv	a0,a5
     acc:	01c12403          	lw	s0,28(sp)
     ad0:	02010113          	add	sp,sp,32
     ad4:	00008067          	ret

00000ad8 <_ZN5Snake5resetEv>:
     ad8:	fd010113          	add	sp,sp,-48
     adc:	02112623          	sw	ra,44(sp)
     ae0:	02812423          	sw	s0,40(sp)
     ae4:	03010413          	add	s0,sp,48
     ae8:	fca42e23          	sw	a0,-36(s0)
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	0007a023          	sw	zero,0(a5)
     af4:	fdc42783          	lw	a5,-36(s0)
     af8:	0007a223          	sw	zero,4(a5)
     afc:	fdc42783          	lw	a5,-36(s0)
     b00:	00200713          	li	a4,2
     b04:	00e7a423          	sw	a4,8(a5)
     b08:	fdc42783          	lw	a5,-36(s0)
     b0c:	00200713          	li	a4,2
     b10:	00e7a623          	sw	a4,12(a5)
     b14:	fdc42783          	lw	a5,-36(s0)
     b18:	0047a783          	lw	a5,4(a5)
     b1c:	fdc42703          	lw	a4,-36(s0)
     b20:	00878793          	add	a5,a5,8
     b24:	00179793          	sll	a5,a5,0x1
     b28:	00f707b3          	add	a5,a4,a5
     b2c:	4ba00713          	li	a4,1210
     b30:	00e79023          	sh	a4,0(a5)
     b34:	fe042623          	sw	zero,-20(s0)
     b38:	0180006f          	j	b50 <_ZN5Snake5resetEv+0x78>
     b3c:	fdc42503          	lw	a0,-36(s0)
     b40:	1a4000ef          	jal	ce4 <_ZN5Snake9move_headEv>
     b44:	fec42783          	lw	a5,-20(s0)
     b48:	00178793          	add	a5,a5,1
     b4c:	fef42623          	sw	a5,-20(s0)
     b50:	fec42703          	lw	a4,-20(s0)
     b54:	00200793          	li	a5,2
     b58:	fee7f2e3          	bgeu	a5,a4,b3c <_ZN5Snake5resetEv+0x64>
     b5c:	00000013          	nop
     b60:	00000013          	nop
     b64:	02c12083          	lw	ra,44(sp)
     b68:	02812403          	lw	s0,40(sp)
     b6c:	03010113          	add	sp,sp,48
     b70:	00008067          	ret

00000b74 <_ZN5Snake9get_inputEv>:
     b74:	fd010113          	add	sp,sp,-48
     b78:	02112623          	sw	ra,44(sp)
     b7c:	02812423          	sw	s0,40(sp)
     b80:	03010413          	add	s0,sp,48
     b84:	fca42e23          	sw	a0,-36(s0)
     b88:	feb40793          	add	a5,s0,-21
     b8c:	00078513          	mv	a0,a5
     b90:	de8ff0ef          	jal	178 <_Z7get_keyRh>
     b94:	00050793          	mv	a5,a0
     b98:	0c078e63          	beqz	a5,c74 <_ZN5Snake9get_inputEv+0x100>
     b9c:	02002703          	lw	a4,32(zero) # 20 <state>
     ba0:	00100793          	li	a5,1
     ba4:	00f71c63          	bne	a4,a5,bbc <_ZN5Snake9get_inputEv+0x48>
     ba8:	feb44703          	lbu	a4,-21(s0)
     bac:	05a00793          	li	a5,90
     bb0:	0cf71063          	bne	a4,a5,c70 <_ZN5Snake9get_inputEv+0xfc>
     bb4:	b05ff0ef          	jal	6b8 <_Z15do_game_unpausev>
     bb8:	0bc0006f          	j	c74 <_ZN5Snake9get_inputEv+0x100>
     bbc:	02002023          	sw	zero,32(zero) # 20 <state>
     bc0:	fdc42783          	lw	a5,-36(s0)
     bc4:	0087a783          	lw	a5,8(a5)
     bc8:	fef42623          	sw	a5,-20(s0)
     bcc:	feb44783          	lbu	a5,-21(s0)
     bd0:	07600713          	li	a4,118
     bd4:	06e78863          	beq	a5,a4,c44 <_ZN5Snake9get_inputEv+0xd0>
     bd8:	07600713          	li	a4,118
     bdc:	06f74863          	blt	a4,a5,c4c <_ZN5Snake9get_inputEv+0xd8>
     be0:	02300713          	li	a4,35
     be4:	04e78a63          	beq	a5,a4,c38 <_ZN5Snake9get_inputEv+0xc4>
     be8:	02300713          	li	a4,35
     bec:	06f74063          	blt	a4,a5,c4c <_ZN5Snake9get_inputEv+0xd8>
     bf0:	01d00713          	li	a4,29
     bf4:	02e78063          	beq	a5,a4,c14 <_ZN5Snake9get_inputEv+0xa0>
     bf8:	01d00713          	li	a4,29
     bfc:	04f74863          	blt	a4,a5,c4c <_ZN5Snake9get_inputEv+0xd8>
     c00:	01b00713          	li	a4,27
     c04:	02e78463          	beq	a5,a4,c2c <_ZN5Snake9get_inputEv+0xb8>
     c08:	01c00713          	li	a4,28
     c0c:	00e78a63          	beq	a5,a4,c20 <_ZN5Snake9get_inputEv+0xac>
     c10:	03c0006f          	j	c4c <_ZN5Snake9get_inputEv+0xd8>
     c14:	fb000793          	li	a5,-80
     c18:	fef42623          	sw	a5,-20(s0)
     c1c:	0300006f          	j	c4c <_ZN5Snake9get_inputEv+0xd8>
     c20:	ffe00793          	li	a5,-2
     c24:	fef42623          	sw	a5,-20(s0)
     c28:	0240006f          	j	c4c <_ZN5Snake9get_inputEv+0xd8>
     c2c:	05000793          	li	a5,80
     c30:	fef42623          	sw	a5,-20(s0)
     c34:	0180006f          	j	c4c <_ZN5Snake9get_inputEv+0xd8>
     c38:	00200793          	li	a5,2
     c3c:	fef42623          	sw	a5,-20(s0)
     c40:	00c0006f          	j	c4c <_ZN5Snake9get_inputEv+0xd8>
     c44:	999ff0ef          	jal	5dc <_Z13do_game_pausev>
     c48:	00000013          	nop
     c4c:	fdc42783          	lw	a5,-36(s0)
     c50:	0087a783          	lw	a5,8(a5)
     c54:	40f007b3          	neg	a5,a5
     c58:	fec42703          	lw	a4,-20(s0)
     c5c:	00f70c63          	beq	a4,a5,c74 <_ZN5Snake9get_inputEv+0x100>
     c60:	fdc42783          	lw	a5,-36(s0)
     c64:	fec42703          	lw	a4,-20(s0)
     c68:	00e7a423          	sw	a4,8(a5)
     c6c:	0080006f          	j	c74 <_ZN5Snake9get_inputEv+0x100>
     c70:	00000013          	nop
     c74:	02c12083          	lw	ra,44(sp)
     c78:	02812403          	lw	s0,40(sp)
     c7c:	03010113          	add	sp,sp,48
     c80:	00008067          	ret

00000c84 <_ZN5Snake4sizeEv>:
     c84:	fd010113          	add	sp,sp,-48
     c88:	02812623          	sw	s0,44(sp)
     c8c:	03010413          	add	s0,sp,48
     c90:	fca42e23          	sw	a0,-36(s0)
     c94:	10000793          	li	a5,256
     c98:	fef42623          	sw	a5,-20(s0)
     c9c:	fdc42783          	lw	a5,-36(s0)
     ca0:	0007a703          	lw	a4,0(a5)
     ca4:	fdc42783          	lw	a5,-36(s0)
     ca8:	0047a783          	lw	a5,4(a5)
     cac:	40f707b3          	sub	a5,a4,a5
     cb0:	10178793          	add	a5,a5,257
     cb4:	0ff7f793          	zext.b	a5,a5
     cb8:	fef42423          	sw	a5,-24(s0)
     cbc:	fe842783          	lw	a5,-24(s0)
     cc0:	00078863          	beqz	a5,cd0 <_ZN5Snake4sizeEv+0x4c>
     cc4:	fe840793          	add	a5,s0,-24
     cc8:	0007a783          	lw	a5,0(a5)
     ccc:	0080006f          	j	cd4 <_ZN5Snake4sizeEv+0x50>
     cd0:	10000793          	li	a5,256
     cd4:	00078513          	mv	a0,a5
     cd8:	02c12403          	lw	s0,44(sp)
     cdc:	03010113          	add	sp,sp,48
     ce0:	00008067          	ret

00000ce4 <_ZN5Snake9move_headEv>:
     ce4:	fd010113          	add	sp,sp,-48
     ce8:	02112623          	sw	ra,44(sp)
     cec:	02812423          	sw	s0,40(sp)
     cf0:	02912223          	sw	s1,36(sp)
     cf4:	03010413          	add	s0,sp,48
     cf8:	fca42e23          	sw	a0,-36(s0)
     cfc:	fdc42783          	lw	a5,-36(s0)
     d00:	0007a783          	lw	a5,0(a5)
     d04:	fdc42703          	lw	a4,-36(s0)
     d08:	00878793          	add	a5,a5,8
     d0c:	00179793          	sll	a5,a5,0x1
     d10:	00f707b3          	add	a5,a4,a5
     d14:	0007d783          	lhu	a5,0(a5)
     d18:	fef42623          	sw	a5,-20(s0)
     d1c:	fdc42783          	lw	a5,-36(s0)
     d20:	0087a783          	lw	a5,8(a5)
     d24:	00078713          	mv	a4,a5
     d28:	fec42783          	lw	a5,-20(s0)
     d2c:	00e787b3          	add	a5,a5,a4
     d30:	fef42423          	sw	a5,-24(s0)
     d34:	fdc42783          	lw	a5,-36(s0)
     d38:	0087a703          	lw	a4,8(a5)
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	00c7a783          	lw	a5,12(a5)
     d44:	04f71263          	bne	a4,a5,d88 <_ZN5Snake9move_headEv+0xa4>
     d48:	fdc42783          	lw	a5,-36(s0)
     d4c:	0087a703          	lw	a4,8(a5)
     d50:	fb000793          	li	a5,-80
     d54:	00f70a63          	beq	a4,a5,d68 <_ZN5Snake9move_headEv+0x84>
     d58:	fdc42783          	lw	a5,-36(s0)
     d5c:	0087a703          	lw	a4,8(a5)
     d60:	05000793          	li	a5,80
     d64:	00f71663          	bne	a4,a5,d70 <_ZN5Snake9move_headEv+0x8c>
     d68:	07c00793          	li	a5,124
     d6c:	0080006f          	j	d74 <_ZN5Snake9move_headEv+0x90>
     d70:	02d00793          	li	a5,45
     d74:	57002683          	lw	a3,1392(zero) # 570 <video_memory_1d>
     d78:	fec42703          	lw	a4,-20(s0)
     d7c:	00e68733          	add	a4,a3,a4
     d80:	00f70023          	sb	a5,0(a4)
     d84:	0340006f          	j	db8 <_ZN5Snake9move_headEv+0xd4>
     d88:	fdc42783          	lw	a5,-36(s0)
     d8c:	00c7a683          	lw	a3,12(a5)
     d90:	fdc42783          	lw	a5,-36(s0)
     d94:	0087a603          	lw	a2,8(a5)
     d98:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     d9c:	fec42783          	lw	a5,-20(s0)
     da0:	00f704b3          	add	s1,a4,a5
     da4:	00068593          	mv	a1,a3
     da8:	fdc42503          	lw	a0,-36(s0)
     dac:	c21ff0ef          	jal	9cc <_ZN5Snake14turn_connectorE9directionS0_>
     db0:	00050793          	mv	a5,a0
     db4:	00f48023          	sb	a5,0(s1)
     db8:	fdc42783          	lw	a5,-36(s0)
     dbc:	0087a703          	lw	a4,8(a5)
     dc0:	00200793          	li	a5,2
     dc4:	00f70a63          	beq	a4,a5,dd8 <_ZN5Snake9move_headEv+0xf4>
     dc8:	fdc42783          	lw	a5,-36(s0)
     dcc:	0087a703          	lw	a4,8(a5)
     dd0:	ffe00793          	li	a5,-2
     dd4:	04f71063          	bne	a4,a5,e14 <_ZN5Snake9move_headEv+0x130>
     dd8:	fdc42783          	lw	a5,-36(s0)
     ddc:	0087a703          	lw	a4,8(a5)
     de0:	00200793          	li	a5,2
     de4:	00f71863          	bne	a4,a5,df4 <_ZN5Snake9move_headEv+0x110>
     de8:	fec42783          	lw	a5,-20(s0)
     dec:	00178793          	add	a5,a5,1
     df0:	00c0006f          	j	dfc <_ZN5Snake9move_headEv+0x118>
     df4:	fec42783          	lw	a5,-20(s0)
     df8:	fff78793          	add	a5,a5,-1
     dfc:	fef42223          	sw	a5,-28(s0)
     e00:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     e04:	fe442783          	lw	a5,-28(s0)
     e08:	00f707b3          	add	a5,a4,a5
     e0c:	f8500713          	li	a4,-123
     e10:	00e78023          	sb	a4,0(a5)
     e14:	fdc42783          	lw	a5,-36(s0)
     e18:	0087a703          	lw	a4,8(a5)
     e1c:	fdc42783          	lw	a5,-36(s0)
     e20:	00e7a623          	sw	a4,12(a5)
     e24:	fdc42783          	lw	a5,-36(s0)
     e28:	0007a783          	lw	a5,0(a5)
     e2c:	00178793          	add	a5,a5,1
     e30:	0ff7f713          	zext.b	a4,a5
     e34:	fdc42783          	lw	a5,-36(s0)
     e38:	00e7a023          	sw	a4,0(a5)
     e3c:	fdc42783          	lw	a5,-36(s0)
     e40:	0007a783          	lw	a5,0(a5)
     e44:	fe842703          	lw	a4,-24(s0)
     e48:	01071713          	sll	a4,a4,0x10
     e4c:	01075713          	srl	a4,a4,0x10
     e50:	fdc42683          	lw	a3,-36(s0)
     e54:	00878793          	add	a5,a5,8
     e58:	00179793          	sll	a5,a5,0x1
     e5c:	00f687b3          	add	a5,a3,a5
     e60:	00e79023          	sh	a4,0(a5)
     e64:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     e68:	fe842783          	lw	a5,-24(s0)
     e6c:	00f707b3          	add	a5,a4,a5
     e70:	06f00713          	li	a4,111
     e74:	00e78023          	sb	a4,0(a5)
     e78:	00000013          	nop
     e7c:	02c12083          	lw	ra,44(sp)
     e80:	02812403          	lw	s0,40(sp)
     e84:	02412483          	lw	s1,36(sp)
     e88:	03010113          	add	sp,sp,48
     e8c:	00008067          	ret

00000e90 <_ZN5Snake9move_tailEv>:
     e90:	fd010113          	add	sp,sp,-48
     e94:	02812623          	sw	s0,44(sp)
     e98:	03010413          	add	s0,sp,48
     e9c:	fca42e23          	sw	a0,-36(s0)
     ea0:	fdc42783          	lw	a5,-36(s0)
     ea4:	0047a783          	lw	a5,4(a5)
     ea8:	fdc42703          	lw	a4,-36(s0)
     eac:	00878793          	add	a5,a5,8
     eb0:	00179793          	sll	a5,a5,0x1
     eb4:	00f707b3          	add	a5,a4,a5
     eb8:	0007d783          	lhu	a5,0(a5)
     ebc:	fef42623          	sw	a5,-20(s0)
     ec0:	fdc42783          	lw	a5,-36(s0)
     ec4:	0047a783          	lw	a5,4(a5)
     ec8:	00178793          	add	a5,a5,1
     ecc:	0ff7f793          	zext.b	a5,a5
     ed0:	fef42423          	sw	a5,-24(s0)
     ed4:	fdc42703          	lw	a4,-36(s0)
     ed8:	fe842783          	lw	a5,-24(s0)
     edc:	00878793          	add	a5,a5,8
     ee0:	00179793          	sll	a5,a5,0x1
     ee4:	00f707b3          	add	a5,a4,a5
     ee8:	0007d783          	lhu	a5,0(a5)
     eec:	fef42223          	sw	a5,-28(s0)
     ef0:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     ef4:	fec42783          	lw	a5,-20(s0)
     ef8:	00f707b3          	add	a5,a4,a5
     efc:	02000713          	li	a4,32
     f00:	00e78023          	sb	a4,0(a5)
     f04:	fe442703          	lw	a4,-28(s0)
     f08:	fec42783          	lw	a5,-20(s0)
     f0c:	40f707b3          	sub	a5,a4,a5
     f10:	fef42023          	sw	a5,-32(s0)
     f14:	fe042703          	lw	a4,-32(s0)
     f18:	00200793          	li	a5,2
     f1c:	02f71063          	bne	a4,a5,f3c <_ZN5Snake9move_tailEv+0xac>
     f20:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     f24:	fec42783          	lw	a5,-20(s0)
     f28:	00178793          	add	a5,a5,1
     f2c:	00f707b3          	add	a5,a4,a5
     f30:	02000713          	li	a4,32
     f34:	00e78023          	sb	a4,0(a5)
     f38:	0280006f          	j	f60 <_ZN5Snake9move_tailEv+0xd0>
     f3c:	fe042703          	lw	a4,-32(s0)
     f40:	ffe00793          	li	a5,-2
     f44:	00f71e63          	bne	a4,a5,f60 <_ZN5Snake9move_tailEv+0xd0>
     f48:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     f4c:	fec42783          	lw	a5,-20(s0)
     f50:	fff78793          	add	a5,a5,-1
     f54:	00f707b3          	add	a5,a4,a5
     f58:	02000713          	li	a4,32
     f5c:	00e78023          	sb	a4,0(a5)
     f60:	fdc42783          	lw	a5,-36(s0)
     f64:	fe842703          	lw	a4,-24(s0)
     f68:	00e7a223          	sw	a4,4(a5)
     f6c:	00000013          	nop
     f70:	02c12403          	lw	s0,44(sp)
     f74:	03010113          	add	sp,sp,48
     f78:	00008067          	ret

00000f7c <_ZN5Snake9is_eatingEj>:
     f7c:	fe010113          	add	sp,sp,-32
     f80:	00812e23          	sw	s0,28(sp)
     f84:	02010413          	add	s0,sp,32
     f88:	fea42623          	sw	a0,-20(s0)
     f8c:	feb42423          	sw	a1,-24(s0)
     f90:	fec42783          	lw	a5,-20(s0)
     f94:	0007a783          	lw	a5,0(a5)
     f98:	fec42703          	lw	a4,-20(s0)
     f9c:	00878793          	add	a5,a5,8
     fa0:	00179793          	sll	a5,a5,0x1
     fa4:	00f707b3          	add	a5,a4,a5
     fa8:	0007d783          	lhu	a5,0(a5)
     fac:	00078713          	mv	a4,a5
     fb0:	fe842783          	lw	a5,-24(s0)
     fb4:	40e787b3          	sub	a5,a5,a4
     fb8:	0017b793          	seqz	a5,a5
     fbc:	0ff7f793          	zext.b	a5,a5
     fc0:	00078513          	mv	a0,a5
     fc4:	01c12403          	lw	s0,28(sp)
     fc8:	02010113          	add	sp,sp,32
     fcc:	00008067          	ret

00000fd0 <_ZN5Snake17has_collided_withEj>:
     fd0:	fc010113          	add	sp,sp,-64
     fd4:	02112e23          	sw	ra,60(sp)
     fd8:	02812c23          	sw	s0,56(sp)
     fdc:	04010413          	add	s0,sp,64
     fe0:	fca42623          	sw	a0,-52(s0)
     fe4:	fcb42423          	sw	a1,-56(s0)
     fe8:	fc842783          	lw	a5,-56(s0)
     fec:	05000593          	li	a1,80
     ff0:	00078513          	mv	a0,a5
     ff4:	3d0000ef          	jal	13c4 <__hidden___udivsi3>
     ff8:	00050793          	mv	a5,a0
     ffc:	fef42423          	sw	a5,-24(s0)
    1000:	fe842783          	lw	a5,-24(s0)
    1004:	00078863          	beqz	a5,1014 <_ZN5Snake17has_collided_withEj+0x44>
    1008:	fe842703          	lw	a4,-24(s0)
    100c:	01d00793          	li	a5,29
    1010:	00f71663          	bne	a4,a5,101c <_ZN5Snake17has_collided_withEj+0x4c>
    1014:	00100793          	li	a5,1
    1018:	1540006f          	j	116c <_ZN5Snake17has_collided_withEj+0x19c>
    101c:	fc842783          	lw	a5,-56(s0)
    1020:	05000593          	li	a1,80
    1024:	00078513          	mv	a0,a5
    1028:	3e4000ef          	jal	140c <__umodsi3>
    102c:	00050793          	mv	a5,a0
    1030:	fef42223          	sw	a5,-28(s0)
    1034:	fe442783          	lw	a5,-28(s0)
    1038:	00078863          	beqz	a5,1048 <_ZN5Snake17has_collided_withEj+0x78>
    103c:	fe442703          	lw	a4,-28(s0)
    1040:	04f00793          	li	a5,79
    1044:	00f71663          	bne	a4,a5,1050 <_ZN5Snake17has_collided_withEj+0x80>
    1048:	00100793          	li	a5,1
    104c:	1200006f          	j	116c <_ZN5Snake17has_collided_withEj+0x19c>
    1050:	fcc42783          	lw	a5,-52(s0)
    1054:	0047a783          	lw	a5,4(a5)
    1058:	fef42623          	sw	a5,-20(s0)
    105c:	0fc0006f          	j	1158 <_ZN5Snake17has_collided_withEj+0x188>
    1060:	fcc42703          	lw	a4,-52(s0)
    1064:	fec42783          	lw	a5,-20(s0)
    1068:	00878793          	add	a5,a5,8
    106c:	00179793          	sll	a5,a5,0x1
    1070:	00f707b3          	add	a5,a4,a5
    1074:	0007d783          	lhu	a5,0(a5)
    1078:	00078713          	mv	a4,a5
    107c:	fc842783          	lw	a5,-56(s0)
    1080:	00e79663          	bne	a5,a4,108c <_ZN5Snake17has_collided_withEj+0xbc>
    1084:	00100793          	li	a5,1
    1088:	0e40006f          	j	116c <_ZN5Snake17has_collided_withEj+0x19c>
    108c:	fec42783          	lw	a5,-20(s0)
    1090:	00178793          	add	a5,a5,1
    1094:	0ff7f793          	zext.b	a5,a5
    1098:	fef42023          	sw	a5,-32(s0)
    109c:	fcc42703          	lw	a4,-52(s0)
    10a0:	fe042783          	lw	a5,-32(s0)
    10a4:	00878793          	add	a5,a5,8
    10a8:	00179793          	sll	a5,a5,0x1
    10ac:	00f707b3          	add	a5,a4,a5
    10b0:	0007d783          	lhu	a5,0(a5)
    10b4:	00078693          	mv	a3,a5
    10b8:	fcc42703          	lw	a4,-52(s0)
    10bc:	fec42783          	lw	a5,-20(s0)
    10c0:	00878793          	add	a5,a5,8
    10c4:	00179793          	sll	a5,a5,0x1
    10c8:	00f707b3          	add	a5,a4,a5
    10cc:	0007d783          	lhu	a5,0(a5)
    10d0:	40f687b3          	sub	a5,a3,a5
    10d4:	fcf42e23          	sw	a5,-36(s0)
    10d8:	fdc42703          	lw	a4,-36(s0)
    10dc:	00200793          	li	a5,2
    10e0:	02f71863          	bne	a4,a5,1110 <_ZN5Snake17has_collided_withEj+0x140>
    10e4:	fcc42703          	lw	a4,-52(s0)
    10e8:	fec42783          	lw	a5,-20(s0)
    10ec:	00878793          	add	a5,a5,8
    10f0:	00179793          	sll	a5,a5,0x1
    10f4:	00f707b3          	add	a5,a4,a5
    10f8:	0007d783          	lhu	a5,0(a5)
    10fc:	00178713          	add	a4,a5,1
    1100:	fc842783          	lw	a5,-56(s0)
    1104:	00f71663          	bne	a4,a5,1110 <_ZN5Snake17has_collided_withEj+0x140>
    1108:	00100793          	li	a5,1
    110c:	0600006f          	j	116c <_ZN5Snake17has_collided_withEj+0x19c>
    1110:	fdc42703          	lw	a4,-36(s0)
    1114:	ffe00793          	li	a5,-2
    1118:	02f71863          	bne	a4,a5,1148 <_ZN5Snake17has_collided_withEj+0x178>
    111c:	fcc42703          	lw	a4,-52(s0)
    1120:	fec42783          	lw	a5,-20(s0)
    1124:	00878793          	add	a5,a5,8
    1128:	00179793          	sll	a5,a5,0x1
    112c:	00f707b3          	add	a5,a4,a5
    1130:	0007d783          	lhu	a5,0(a5)
    1134:	fff78713          	add	a4,a5,-1
    1138:	fc842783          	lw	a5,-56(s0)
    113c:	00f71663          	bne	a4,a5,1148 <_ZN5Snake17has_collided_withEj+0x178>
    1140:	00100793          	li	a5,1
    1144:	0280006f          	j	116c <_ZN5Snake17has_collided_withEj+0x19c>
    1148:	fec42783          	lw	a5,-20(s0)
    114c:	00178793          	add	a5,a5,1
    1150:	0ff7f793          	zext.b	a5,a5
    1154:	fef42623          	sw	a5,-20(s0)
    1158:	fcc42783          	lw	a5,-52(s0)
    115c:	0007a783          	lw	a5,0(a5)
    1160:	fec42703          	lw	a4,-20(s0)
    1164:	eef71ee3          	bne	a4,a5,1060 <_ZN5Snake17has_collided_withEj+0x90>
    1168:	00000793          	li	a5,0
    116c:	00078513          	mv	a0,a5
    1170:	03c12083          	lw	ra,60(sp)
    1174:	03812403          	lw	s0,56(sp)
    1178:	04010113          	add	sp,sp,64
    117c:	00008067          	ret

00001180 <_ZN5Snake17has_head_accidentEv>:
    1180:	fe010113          	add	sp,sp,-32
    1184:	00112e23          	sw	ra,28(sp)
    1188:	00812c23          	sw	s0,24(sp)
    118c:	02010413          	add	s0,sp,32
    1190:	fea42623          	sw	a0,-20(s0)
    1194:	fec42783          	lw	a5,-20(s0)
    1198:	0007a783          	lw	a5,0(a5)
    119c:	fec42703          	lw	a4,-20(s0)
    11a0:	00878793          	add	a5,a5,8
    11a4:	00179793          	sll	a5,a5,0x1
    11a8:	00f707b3          	add	a5,a4,a5
    11ac:	0007d783          	lhu	a5,0(a5)
    11b0:	00078593          	mv	a1,a5
    11b4:	fec42503          	lw	a0,-20(s0)
    11b8:	e19ff0ef          	jal	fd0 <_ZN5Snake17has_collided_withEj>
    11bc:	00050793          	mv	a5,a0
    11c0:	00078513          	mv	a0,a5
    11c4:	01c12083          	lw	ra,28(sp)
    11c8:	01812403          	lw	s0,24(sp)
    11cc:	02010113          	add	sp,sp,32
    11d0:	00008067          	ret

000011d4 <_Z41__static_initialization_and_destruction_0v>:
    11d4:	ff010113          	add	sp,sp,-16
    11d8:	00112623          	sw	ra,12(sp)
    11dc:	00812423          	sw	s0,8(sp)
    11e0:	01010413          	add	s0,sp,16
    11e4:	20000513          	li	a0,512
    11e8:	fc4ff0ef          	jal	9ac <_ZN5SnakeC1Ev>
    11ec:	00000013          	nop
    11f0:	00c12083          	lw	ra,12(sp)
    11f4:	00812403          	lw	s0,8(sp)
    11f8:	01010113          	add	sp,sp,16
    11fc:	00008067          	ret

00001200 <_GLOBAL__sub_I_state>:
    1200:	ff010113          	add	sp,sp,-16
    1204:	00112623          	sw	ra,12(sp)
    1208:	00812423          	sw	s0,8(sp)
    120c:	01010413          	add	s0,sp,16
    1210:	fc5ff0ef          	jal	11d4 <_Z41__static_initialization_and_destruction_0v>
    1214:	00c12083          	lw	ra,12(sp)
    1218:	00812403          	lw	s0,8(sp)
    121c:	01010113          	add	sp,sp,16
    1220:	00008067          	ret

00001224 <_Z22print_string_at_centerILj32EEjjRAT__Kc>:
    1224:	fe010113          	add	sp,sp,-32
    1228:	00112e23          	sw	ra,28(sp)
    122c:	00812c23          	sw	s0,24(sp)
    1230:	02010413          	add	s0,sp,32
    1234:	fea42623          	sw	a0,-20(s0)
    1238:	feb42423          	sw	a1,-24(s0)
    123c:	01f00693          	li	a3,31
    1240:	fe842603          	lw	a2,-24(s0)
    1244:	01800593          	li	a1,24
    1248:	fec42503          	lw	a0,-20(s0)
    124c:	8a0ff0ef          	jal	2ec <_Z12print_stringjjPKcj>
    1250:	03700793          	li	a5,55
    1254:	00078513          	mv	a0,a5
    1258:	01c12083          	lw	ra,28(sp)
    125c:	01812403          	lw	s0,24(sp)
    1260:	02010113          	add	sp,sp,32
    1264:	00008067          	ret

00001268 <_Z22print_string_at_centerILj27EEjjRAT__Kc>:
    1268:	fe010113          	add	sp,sp,-32
    126c:	00112e23          	sw	ra,28(sp)
    1270:	00812c23          	sw	s0,24(sp)
    1274:	02010413          	add	s0,sp,32
    1278:	fea42623          	sw	a0,-20(s0)
    127c:	feb42423          	sw	a1,-24(s0)
    1280:	01a00693          	li	a3,26
    1284:	fe842603          	lw	a2,-24(s0)
    1288:	01b00593          	li	a1,27
    128c:	fec42503          	lw	a0,-20(s0)
    1290:	85cff0ef          	jal	2ec <_Z12print_stringjjPKcj>
    1294:	03500793          	li	a5,53
    1298:	00078513          	mv	a0,a5
    129c:	01c12083          	lw	ra,28(sp)
    12a0:	01812403          	lw	s0,24(sp)
    12a4:	02010113          	add	sp,sp,32
    12a8:	00008067          	ret

000012ac <_Z22print_string_at_centerILj25EEjjRAT__Kc>:
    12ac:	fe010113          	add	sp,sp,-32
    12b0:	00112e23          	sw	ra,28(sp)
    12b4:	00812c23          	sw	s0,24(sp)
    12b8:	02010413          	add	s0,sp,32
    12bc:	fea42623          	sw	a0,-20(s0)
    12c0:	feb42423          	sw	a1,-24(s0)
    12c4:	01800693          	li	a3,24
    12c8:	fe842603          	lw	a2,-24(s0)
    12cc:	01c00593          	li	a1,28
    12d0:	fec42503          	lw	a0,-20(s0)
    12d4:	818ff0ef          	jal	2ec <_Z12print_stringjjPKcj>
    12d8:	03400793          	li	a5,52
    12dc:	00078513          	mv	a0,a5
    12e0:	01c12083          	lw	ra,28(sp)
    12e4:	01812403          	lw	s0,24(sp)
    12e8:	02010113          	add	sp,sp,32
    12ec:	00008067          	ret

000012f0 <_Z22print_string_at_centerILj12EEjjRAT__Kc>:
    12f0:	fe010113          	add	sp,sp,-32
    12f4:	00112e23          	sw	ra,28(sp)
    12f8:	00812c23          	sw	s0,24(sp)
    12fc:	02010413          	add	s0,sp,32
    1300:	fea42623          	sw	a0,-20(s0)
    1304:	feb42423          	sw	a1,-24(s0)
    1308:	00b00693          	li	a3,11
    130c:	fe842603          	lw	a2,-24(s0)
    1310:	02200593          	li	a1,34
    1314:	fec42503          	lw	a0,-20(s0)
    1318:	fd5fe0ef          	jal	2ec <_Z12print_stringjjPKcj>
    131c:	02d00793          	li	a5,45
    1320:	00078513          	mv	a0,a5
    1324:	01c12083          	lw	ra,28(sp)
    1328:	01812403          	lw	s0,24(sp)
    132c:	02010113          	add	sp,sp,32
    1330:	00008067          	ret

00001334 <_Z22print_string_at_centerILj24EEjjRAT__Kc>:
    1334:	fe010113          	add	sp,sp,-32
    1338:	00112e23          	sw	ra,28(sp)
    133c:	00812c23          	sw	s0,24(sp)
    1340:	02010413          	add	s0,sp,32
    1344:	fea42623          	sw	a0,-20(s0)
    1348:	feb42423          	sw	a1,-24(s0)
    134c:	01700693          	li	a3,23
    1350:	fe842603          	lw	a2,-24(s0)
    1354:	01c00593          	li	a1,28
    1358:	fec42503          	lw	a0,-20(s0)
    135c:	f91fe0ef          	jal	2ec <_Z12print_stringjjPKcj>
    1360:	03300793          	li	a5,51
    1364:	00078513          	mv	a0,a5
    1368:	01c12083          	lw	ra,28(sp)
    136c:	01812403          	lw	s0,24(sp)
    1370:	02010113          	add	sp,sp,32
    1374:	00008067          	ret

00001378 <_Z22print_string_at_centerILj43EEjjRAT__Kc>:
    1378:	fe010113          	add	sp,sp,-32
    137c:	00112e23          	sw	ra,28(sp)
    1380:	00812c23          	sw	s0,24(sp)
    1384:	02010413          	add	s0,sp,32
    1388:	fea42623          	sw	a0,-20(s0)
    138c:	feb42423          	sw	a1,-24(s0)
    1390:	02a00693          	li	a3,42
    1394:	fe842603          	lw	a2,-24(s0)
    1398:	01300593          	li	a1,19
    139c:	fec42503          	lw	a0,-20(s0)
    13a0:	f4dfe0ef          	jal	2ec <_Z12print_stringjjPKcj>
    13a4:	03d00793          	li	a5,61
    13a8:	00078513          	mv	a0,a5
    13ac:	01c12083          	lw	ra,28(sp)
    13b0:	01812403          	lw	s0,24(sp)
    13b4:	02010113          	add	sp,sp,32
    13b8:	00008067          	ret

000013bc <__divsi3>:
    13bc:	06054063          	bltz	a0,141c <__umodsi3+0x10>
    13c0:	0605c663          	bltz	a1,142c <__umodsi3+0x20>

000013c4 <__hidden___udivsi3>:
    13c4:	00058613          	mv	a2,a1
    13c8:	00050593          	mv	a1,a0
    13cc:	fff00513          	li	a0,-1
    13d0:	02060c63          	beqz	a2,1408 <__hidden___udivsi3+0x44>
    13d4:	00100693          	li	a3,1
    13d8:	00b67a63          	bgeu	a2,a1,13ec <__hidden___udivsi3+0x28>
    13dc:	00c05863          	blez	a2,13ec <__hidden___udivsi3+0x28>
    13e0:	00161613          	sll	a2,a2,0x1
    13e4:	00169693          	sll	a3,a3,0x1
    13e8:	feb66ae3          	bltu	a2,a1,13dc <__hidden___udivsi3+0x18>
    13ec:	00000513          	li	a0,0
    13f0:	00c5e663          	bltu	a1,a2,13fc <__hidden___udivsi3+0x38>
    13f4:	40c585b3          	sub	a1,a1,a2
    13f8:	00d56533          	or	a0,a0,a3
    13fc:	0016d693          	srl	a3,a3,0x1
    1400:	00165613          	srl	a2,a2,0x1
    1404:	fe0696e3          	bnez	a3,13f0 <__hidden___udivsi3+0x2c>
    1408:	00008067          	ret

0000140c <__umodsi3>:
    140c:	00008293          	mv	t0,ra
    1410:	fb5ff0ef          	jal	13c4 <__hidden___udivsi3>
    1414:	00058513          	mv	a0,a1
    1418:	00028067          	jr	t0
    141c:	40a00533          	neg	a0,a0
    1420:	00b04863          	bgtz	a1,1430 <__umodsi3+0x24>
    1424:	40b005b3          	neg	a1,a1
    1428:	f9dff06f          	j	13c4 <__hidden___udivsi3>
    142c:	40b005b3          	neg	a1,a1
    1430:	00008293          	mv	t0,ra
    1434:	f91ff0ef          	jal	13c4 <__hidden___udivsi3>
    1438:	40a00533          	neg	a0,a0
    143c:	00028067          	jr	t0

00001440 <__modsi3>:
    1440:	00008293          	mv	t0,ra
    1444:	0005ca63          	bltz	a1,1458 <__modsi3+0x18>
    1448:	00054c63          	bltz	a0,1460 <__modsi3+0x20>
    144c:	f79ff0ef          	jal	13c4 <__hidden___udivsi3>
    1450:	00058513          	mv	a0,a1
    1454:	00028067          	jr	t0
    1458:	40b005b3          	neg	a1,a1
    145c:	fe0558e3          	bgez	a0,144c <__modsi3+0xc>
    1460:	40a00533          	neg	a0,a0
    1464:	f61ff0ef          	jal	13c4 <__hidden___udivsi3>
    1468:	40b00533          	neg	a0,a1
    146c:	00028067          	jr	t0

00001470 <srand>:
    1470:	0d802783          	lw	a5,216(zero) # d8 <_impure_ptr>
    1474:	08a7ac23          	sw	a0,152(a5)
    1478:	0807ae23          	sw	zero,156(a5)
    147c:	00008067          	ret

00001480 <rand>:
    1480:	ff010113          	add	sp,sp,-16
    1484:	00812423          	sw	s0,8(sp)
    1488:	fffff797          	auipc	a5,0xfffff
    148c:	c4878793          	add	a5,a5,-952 # d0 <_ZL10pause_str2+0x48>
    1490:	0d802403          	lw	s0,216(zero) # d8 <_impure_ptr>
    1494:	09842503          	lw	a0,152(s0)
    1498:	09c42583          	lw	a1,156(s0)
    149c:	0007a603          	lw	a2,0(a5)
    14a0:	0047a683          	lw	a3,4(a5)
    14a4:	00112623          	sw	ra,12(sp)
    14a8:	030000ef          	jal	14d8 <__muldi3>
    14ac:	00150793          	add	a5,a0,1
    14b0:	00a7b533          	sltu	a0,a5,a0
    14b4:	00b505b3          	add	a1,a0,a1
    14b8:	00c12083          	lw	ra,12(sp)
    14bc:	08f42c23          	sw	a5,152(s0)
    14c0:	08b42e23          	sw	a1,156(s0)
    14c4:	00812403          	lw	s0,8(sp)
    14c8:	00159513          	sll	a0,a1,0x1
    14cc:	00155513          	srl	a0,a0,0x1
    14d0:	01010113          	add	sp,sp,16
    14d4:	00008067          	ret

000014d8 <__muldi3>:
    14d8:	ff010113          	add	sp,sp,-16
    14dc:	00812423          	sw	s0,8(sp)
    14e0:	00050413          	mv	s0,a0
    14e4:	00112623          	sw	ra,12(sp)
    14e8:	00060513          	mv	a0,a2
    14ec:	00068393          	mv	t2,a3
    14f0:	00040713          	mv	a4,s0
    14f4:	00060813          	mv	a6,a2
    14f8:	00000793          	li	a5,0
    14fc:	00000313          	li	t1,0
    1500:	00000f13          	li	t5,0
    1504:	01e708b3          	add	a7,a4,t5
    1508:	00187e93          	and	t4,a6,1
    150c:	00f30fb3          	add	t6,t1,a5
    1510:	01f75e13          	srl	t3,a4,0x1f
    1514:	00185813          	srl	a6,a6,0x1
    1518:	00e8b2b3          	sltu	t0,a7,a4
    151c:	00179793          	sll	a5,a5,0x1
    1520:	000e8663          	beqz	t4,152c <__muldi3+0x54>
    1524:	00088f13          	mv	t5,a7
    1528:	01f28333          	add	t1,t0,t6
    152c:	00171713          	sll	a4,a4,0x1
    1530:	01c7e7b3          	or	a5,a5,t3
    1534:	fc0818e3          	bnez	a6,1504 <__muldi3+0x2c>
    1538:	00058663          	beqz	a1,1544 <__muldi3+0x6c>
    153c:	034000ef          	jal	1570 <__mulsi3>
    1540:	00650333          	add	t1,a0,t1
    1544:	00038a63          	beqz	t2,1558 <__muldi3+0x80>
    1548:	00040513          	mv	a0,s0
    154c:	00038593          	mv	a1,t2
    1550:	020000ef          	jal	1570 <__mulsi3>
    1554:	00650333          	add	t1,a0,t1
    1558:	00c12083          	lw	ra,12(sp)
    155c:	00812403          	lw	s0,8(sp)
    1560:	000f0513          	mv	a0,t5
    1564:	00030593          	mv	a1,t1
    1568:	01010113          	add	sp,sp,16
    156c:	00008067          	ret

00001570 <__mulsi3>:
    1570:	00050613          	mv	a2,a0
    1574:	00000513          	li	a0,0
    1578:	0015f693          	and	a3,a1,1
    157c:	00068463          	beqz	a3,1584 <__mulsi3+0x14>
    1580:	00c50533          	add	a0,a0,a2
    1584:	0015d593          	srl	a1,a1,0x1
    1588:	00161613          	sll	a2,a2,0x1
    158c:	fe0596e3          	bnez	a1,1578 <__mulsi3+0x8>
    1590:	00008067          	ret

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
  ca:	0000                	.insn	2, 0x
  cc:	0000                	.insn	2, 0x
  ce:	0000                	.insn	2, 0x
  d0:	7f2d                	.insn	2, 0x7f2d
  d2:	4c95                	.insn	2, 0x4c95
  d4:	f42d                	.insn	2, 0xf42d
  d6:	5851                	.insn	2, 0x5851

000000d8 <_impure_ptr>:
  d8:	00e0                	.insn	2, 0x00e0
  da:	0000                	.insn	2, 0x
  dc:	0000                	.insn	2, 0x
	...

000000e0 <_impure_data>:
  e0:	0000                	.insn	2, 0x
  e2:	0000                	.insn	2, 0x
  e4:	0434                	.insn	2, 0x0434
  e6:	0000                	.insn	2, 0x
  e8:	049c                	.insn	2, 0x049c
  ea:	0000                	.insn	2, 0x
  ec:	0504                	.insn	2, 0x0504
	...
 176:	0000                	.insn	2, 0x
 178:	0001                	.insn	2, 0x0001
 17a:	0000                	.insn	2, 0x
 17c:	0000                	.insn	2, 0x
 17e:	0000                	.insn	2, 0x
 180:	330e                	.insn	2, 0x330e
 182:	abcd                	.insn	2, 0xabcd
 184:	1234                	.insn	2, 0x1234
 186:	e66d                	.insn	2, 0xe66d
 188:	deec                	.insn	2, 0xdeec
 18a:	0005                	.insn	2, 0x0005
 18c:	0000000b          	.insn	4, 0x000b
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
  1e:	32727363          	bgeu	tp,t2,344 <_Z12print_stringjjPKcj+0x58>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

