
game.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00001197          	auipc	gp,0x1
       4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
       8:	00001117          	auipc	sp,0x1
       c:	d7810113          	add	sp,sp,-648 # d80 <_stack_ptr>
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
      30:	00001397          	auipc	t2,0x1
      34:	fd038393          	add	t2,t2,-48 # 1000 <_trap_stack_ptr>
      38:	30529073          	csrw	mtvec,t0
      3c:	34039073          	csrw	mscratch,t2
      40:	30431073          	csrw	mie,t1

00000044 <_main_call>:
      44:	00000513          	li	a0,0
      48:	00000593          	li	a1,0
      4c:	264000ef          	jal	2b0 <main>

00000050 <_endless_loop>:
      50:	0000006f          	j	50 <_endless_loop>

00000054 <_int_handler>:
      54:	34011173          	csrrw	sp,mscratch,sp
      58:	fb010113          	add	sp,sp,-80
      5c:	00112223          	sw	ra,4(sp)
      60:	00001097          	auipc	ra,0x1
      64:	d2008093          	add	ra,ra,-736 # d80 <_stack_ptr>
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
      c0:	1c8000ef          	jal	288 <int_handler>
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
     154:	00e7a823          	sw	a4,16(a5) # 8000010 <__mulsi3+0x7ffea44>
     158:	080007b7          	lui	a5,0x8000
     15c:	001e8737          	lui	a4,0x1e8
     160:	48070713          	add	a4,a4,1152 # 1e8480 <__mulsi3+0x1e6eb4>
     164:	00e7a423          	sw	a4,8(a5) # 8000008 <__mulsi3+0x7ffea3c>
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
     18c:	0047a783          	lw	a5,4(a5) # 3000004 <__mulsi3+0x2ffea38>
     190:	00f037b3          	snez	a5,a5
     194:	fef407a3          	sb	a5,-17(s0)
     198:	030007b7          	lui	a5,0x3000
     19c:	0007a783          	lw	a5,0(a5) # 3000000 <__mulsi3+0x2ffea34>
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
     1d0:	30c010ef          	jal	14dc <rand>
     1d4:	00050793          	mv	a5,a0
     1d8:	05000593          	li	a1,80
     1dc:	00078513          	mv	a0,a5
     1e0:	288010ef          	jal	1468 <__umodsi3>
     1e4:	00050793          	mv	a5,a0
     1e8:	00178793          	add	a5,a5,1
     1ec:	fef42623          	sw	a5,-20(s0)
     1f0:	2ec010ef          	jal	14dc <rand>
     1f4:	00050793          	mv	a5,a0
     1f8:	01e00593          	li	a1,30
     1fc:	00078513          	mv	a0,a5
     200:	268010ef          	jal	1468 <__umodsi3>
     204:	00050793          	mv	a5,a0
     208:	00178793          	add	a5,a5,1
     20c:	fef42423          	sw	a5,-24(s0)
     210:	fe842703          	lw	a4,-24(s0)
     214:	00070793          	mv	a5,a4
     218:	00479793          	sll	a5,a5,0x4
     21c:	40e787b3          	sub	a5,a5,a4
     220:	00179793          	sll	a5,a5,0x1
     224:	00078713          	mv	a4,a5
     228:	fec42783          	lw	a5,-20(s0)
     22c:	00e787b3          	add	a5,a5,a4
     230:	fef42223          	sw	a5,-28(s0)
     234:	fe442783          	lw	a5,-28(s0)
     238:	00078513          	mv	a0,a5
     23c:	01c12083          	lw	ra,28(sp)
     240:	01812403          	lw	s0,24(sp)
     244:	02010113          	add	sp,sp,32
     248:	00008067          	ret

0000024c <_Z8seed_rngj>:
     24c:	fe010113          	add	sp,sp,-32
     250:	00112e23          	sw	ra,28(sp)
     254:	00812c23          	sw	s0,24(sp)
     258:	02010413          	add	s0,sp,32
     25c:	fea42623          	sw	a0,-20(s0)
     260:	080007b7          	lui	a5,0x8000
     264:	0007a783          	lw	a5,0(a5) # 8000000 <__mulsi3+0x7ffea34>
     268:	fef42623          	sw	a5,-20(s0)
     26c:	fec42503          	lw	a0,-20(s0)
     270:	25c010ef          	jal	14cc <srand>
     274:	00000013          	nop
     278:	01c12083          	lw	ra,28(sp)
     27c:	01812403          	lw	s0,24(sp)
     280:	02010113          	add	sp,sp,32
     284:	00008067          	ret

00000288 <int_handler>:
     288:	ff010113          	add	sp,sp,-16
     28c:	00112623          	sw	ra,12(sp)
     290:	00812423          	sw	s0,8(sp)
     294:	01010413          	add	s0,sp,16
     298:	52c000ef          	jal	7c4 <_Z10game_cyclev>
     29c:	00000013          	nop
     2a0:	00c12083          	lw	ra,12(sp)
     2a4:	00812403          	lw	s0,8(sp)
     2a8:	01010113          	add	sp,sp,16
     2ac:	00008067          	ret

000002b0 <main>:
     2b0:	ff010113          	add	sp,sp,-16
     2b4:	00112623          	sw	ra,12(sp)
     2b8:	00812423          	sw	s0,8(sp)
     2bc:	01010413          	add	s0,sp,16
     2c0:	e69ff0ef          	jal	128 <_Z13config_periphv>
     2c4:	02c000ef          	jal	2f0 <_Z12clear_screenv>
     2c8:	238000ef          	jal	500 <_Z11do_new_gamev>
     2cc:	00000013          	nop
     2d0:	02002783          	lw	a5,32(zero) # 20 <state>
     2d4:	fe079ee3          	bnez	a5,2d0 <main+0x20>
     2d8:	268000ef          	jal	540 <_Z12prepare_gamev>
     2dc:	00000013          	nop
     2e0:	02002703          	lw	a4,32(zero) # 20 <state>
     2e4:	00200793          	li	a5,2
     2e8:	fef71ce3          	bne	a4,a5,2e0 <main+0x30>
     2ec:	fddff06f          	j	2c8 <main+0x18>

000002f0 <_Z12clear_screenv>:
     2f0:	fe010113          	add	sp,sp,-32
     2f4:	00812e23          	sw	s0,28(sp)
     2f8:	02010413          	add	s0,sp,32
     2fc:	fe042623          	sw	zero,-20(s0)
     300:	0240006f          	j	324 <_Z12clear_screenv+0x34>
     304:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     308:	fec42783          	lw	a5,-20(s0)
     30c:	00f707b3          	add	a5,a4,a5
     310:	02000713          	li	a4,32
     314:	00e78023          	sb	a4,0(a5)
     318:	fec42783          	lw	a5,-20(s0)
     31c:	00178793          	add	a5,a5,1
     320:	fef42623          	sw	a5,-20(s0)
     324:	fec42703          	lw	a4,-20(s0)
     328:	000017b7          	lui	a5,0x1
     32c:	95f78793          	add	a5,a5,-1697 # 95f <_Z11place_snackv+0x1f>
     330:	fce7fae3          	bgeu	a5,a4,304 <_Z12clear_screenv+0x14>
     334:	00000013          	nop
     338:	00000013          	nop
     33c:	01c12403          	lw	s0,28(sp)
     340:	02010113          	add	sp,sp,32
     344:	00008067          	ret

00000348 <_Z12print_stringjjPKcj>:
     348:	fd010113          	add	sp,sp,-48
     34c:	02812623          	sw	s0,44(sp)
     350:	03010413          	add	s0,sp,48
     354:	fca42e23          	sw	a0,-36(s0)
     358:	fcb42c23          	sw	a1,-40(s0)
     35c:	fcc42a23          	sw	a2,-44(s0)
     360:	fcd42823          	sw	a3,-48(s0)
     364:	fe042623          	sw	zero,-20(s0)
     368:	0500006f          	j	3b8 <_Z12print_stringjjPKcj+0x70>
     36c:	fd442703          	lw	a4,-44(s0)
     370:	fec42783          	lw	a5,-20(s0)
     374:	00f70633          	add	a2,a4,a5
     378:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     37c:	fdc42703          	lw	a4,-36(s0)
     380:	00070793          	mv	a5,a4
     384:	00279793          	sll	a5,a5,0x2
     388:	00e787b3          	add	a5,a5,a4
     38c:	00479793          	sll	a5,a5,0x4
     390:	00f686b3          	add	a3,a3,a5
     394:	fd842703          	lw	a4,-40(s0)
     398:	fec42783          	lw	a5,-20(s0)
     39c:	00f707b3          	add	a5,a4,a5
     3a0:	00064703          	lbu	a4,0(a2)
     3a4:	00f687b3          	add	a5,a3,a5
     3a8:	00e78023          	sb	a4,0(a5)
     3ac:	fec42783          	lw	a5,-20(s0)
     3b0:	00178793          	add	a5,a5,1
     3b4:	fef42623          	sw	a5,-20(s0)
     3b8:	fec42703          	lw	a4,-20(s0)
     3bc:	fd042783          	lw	a5,-48(s0)
     3c0:	faf766e3          	bltu	a4,a5,36c <_Z12print_stringjjPKcj+0x24>
     3c4:	00000013          	nop
     3c8:	00000013          	nop
     3cc:	02c12403          	lw	s0,44(sp)
     3d0:	03010113          	add	sp,sp,48
     3d4:	00008067          	ret

000003d8 <_Z12print_uint32jjm>:
     3d8:	fd010113          	add	sp,sp,-48
     3dc:	02812623          	sw	s0,44(sp)
     3e0:	03010413          	add	s0,sp,48
     3e4:	fca42e23          	sw	a0,-36(s0)
     3e8:	fcb42c23          	sw	a1,-40(s0)
     3ec:	fcc42a23          	sw	a2,-44(s0)
     3f0:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     3f4:	fdc42703          	lw	a4,-36(s0)
     3f8:	00070793          	mv	a5,a4
     3fc:	00279793          	sll	a5,a5,0x2
     400:	00e787b3          	add	a5,a5,a4
     404:	00479793          	sll	a5,a5,0x4
     408:	00f68733          	add	a4,a3,a5
     40c:	fd842783          	lw	a5,-40(s0)
     410:	00f707b3          	add	a5,a4,a5
     414:	03000713          	li	a4,48
     418:	00e78023          	sb	a4,0(a5)
     41c:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     420:	fdc42703          	lw	a4,-36(s0)
     424:	00070793          	mv	a5,a4
     428:	00279793          	sll	a5,a5,0x2
     42c:	00e787b3          	add	a5,a5,a4
     430:	00479793          	sll	a5,a5,0x4
     434:	00f68733          	add	a4,a3,a5
     438:	fd842783          	lw	a5,-40(s0)
     43c:	00178793          	add	a5,a5,1
     440:	00f707b3          	add	a5,a4,a5
     444:	07800713          	li	a4,120
     448:	00e78023          	sb	a4,0(a5)
     44c:	fe042623          	sw	zero,-20(s0)
     450:	0900006f          	j	4e0 <__sf+0xac>
     454:	fec42783          	lw	a5,-20(s0)
     458:	00279793          	sll	a5,a5,0x2
     45c:	fd442703          	lw	a4,-44(s0)
     460:	00f757b3          	srl	a5,a4,a5
     464:	0ff7f793          	zext.b	a5,a5
     468:	00f7f793          	and	a5,a5,15
     46c:	fef405a3          	sb	a5,-21(s0)
     470:	feb44703          	lbu	a4,-21(s0)
     474:	00900793          	li	a5,9
     478:	00e7ea63          	bltu	a5,a4,48c <__sf+0x58>
     47c:	feb44783          	lbu	a5,-21(s0)
     480:	03078793          	add	a5,a5,48
     484:	0ff7f793          	zext.b	a5,a5
     488:	0100006f          	j	498 <__sf+0x64>
     48c:	feb44783          	lbu	a5,-21(s0)
     490:	05778793          	add	a5,a5,87
     494:	0ff7f793          	zext.b	a5,a5
     498:	fef40523          	sb	a5,-22(s0)
     49c:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     4a0:	fdc42703          	lw	a4,-36(s0)
     4a4:	00070793          	mv	a5,a4
     4a8:	00279793          	sll	a5,a5,0x2
     4ac:	00e787b3          	add	a5,a5,a4
     4b0:	00479793          	sll	a5,a5,0x4
     4b4:	00f68733          	add	a4,a3,a5
     4b8:	fd842683          	lw	a3,-40(s0)
     4bc:	fec42783          	lw	a5,-20(s0)
     4c0:	40f687b3          	sub	a5,a3,a5
     4c4:	00978793          	add	a5,a5,9
     4c8:	00f707b3          	add	a5,a4,a5
     4cc:	fea44703          	lbu	a4,-22(s0)
     4d0:	00e78023          	sb	a4,0(a5)
     4d4:	fec42783          	lw	a5,-20(s0)
     4d8:	00178793          	add	a5,a5,1
     4dc:	fef42623          	sw	a5,-20(s0)
     4e0:	fec42703          	lw	a4,-20(s0)
     4e4:	00700793          	li	a5,7
     4e8:	f6e7f6e3          	bgeu	a5,a4,454 <__sf+0x20>
     4ec:	00000013          	nop
     4f0:	00000013          	nop
     4f4:	02c12403          	lw	s0,44(sp)
     4f8:	03010113          	add	sp,sp,48
     4fc:	00008067          	ret

00000500 <_Z11do_new_gamev>:
     500:	ff010113          	add	sp,sp,-16
     504:	00112623          	sw	ra,12(sp)
     508:	00812423          	sw	s0,8(sp)
     50c:	01010413          	add	s0,sp,16
     510:	00200713          	li	a4,2
     514:	02e02023          	sw	a4,32(zero) # 20 <state>
     518:	20000513          	li	a0,512
     51c:	618000ef          	jal	b34 <_ZN5Snake5resetEv>
     520:	02400593          	li	a1,36
     524:	00f00513          	li	a0,15
     528:	559000ef          	jal	1280 <_Z22print_string_at_centerILj32EEjjRAT__Kc>
     52c:	00000013          	nop
     530:	00c12083          	lw	ra,12(sp)
     534:	00812403          	lw	s0,8(sp)
     538:	01010113          	add	sp,sp,16
     53c:	00008067          	ret

00000540 <_Z12prepare_gamev>:
     540:	ff010113          	add	sp,sp,-16
     544:	00112623          	sw	ra,12(sp)
     548:	00812423          	sw	s0,8(sp)
     54c:	01010413          	add	s0,sp,16
     550:	00000513          	li	a0,0
     554:	cf9ff0ef          	jal	24c <_Z8seed_rngj>
     558:	d99ff0ef          	jal	2f0 <_Z12clear_screenv>
     55c:	304000ef          	jal	860 <_Z11place_wallsv>
     560:	3e0000ef          	jal	940 <_Z11place_snackv>
     564:	20000513          	li	a0,512
     568:	5cc000ef          	jal	b34 <_ZN5Snake5resetEv>
     56c:	00000013          	nop
     570:	00c12083          	lw	ra,12(sp)
     574:	00812403          	lw	s0,8(sp)
     578:	01010113          	add	sp,sp,16
     57c:	00008067          	ret

00000580 <_Z12do_game_overv>:
     580:	fe010113          	add	sp,sp,-32
     584:	00112e23          	sw	ra,28(sp)
     588:	00812c23          	sw	s0,24(sp)
     58c:	02010413          	add	s0,sp,32
     590:	00200713          	li	a4,2
     594:	02e02023          	sw	a4,32(zero) # 20 <state>
     598:	04400593          	li	a1,68
     59c:	00e00513          	li	a0,14
     5a0:	525000ef          	jal	12c4 <_Z22print_string_at_centerILj27EEjjRAT__Kc>
     5a4:	fea42623          	sw	a0,-20(s0)
     5a8:	20000513          	li	a0,512
     5ac:	734000ef          	jal	ce0 <_ZN5Snake4sizeEv>
     5b0:	00050793          	mv	a5,a0
     5b4:	ffc78793          	add	a5,a5,-4
     5b8:	00078613          	mv	a2,a5
     5bc:	fec42583          	lw	a1,-20(s0)
     5c0:	00e00513          	li	a0,14
     5c4:	e15ff0ef          	jal	3d8 <_Z12print_uint32jjm>
     5c8:	00000013          	nop
     5cc:	01c12083          	lw	ra,28(sp)
     5d0:	01812403          	lw	s0,24(sp)
     5d4:	02010113          	add	sp,sp,32
     5d8:	00008067          	ret

000005dc <_Z14do_game_finishv>:
     5dc:	fe010113          	add	sp,sp,-32
     5e0:	00112e23          	sw	ra,28(sp)
     5e4:	00812c23          	sw	s0,24(sp)
     5e8:	02010413          	add	s0,sp,32
     5ec:	00200713          	li	a4,2
     5f0:	02e02023          	sw	a4,32(zero) # 20 <state>
     5f4:	06000593          	li	a1,96
     5f8:	00e00513          	li	a0,14
     5fc:	50d000ef          	jal	1308 <_Z22print_string_at_centerILj25EEjjRAT__Kc>
     600:	fea42623          	sw	a0,-20(s0)
     604:	20000513          	li	a0,512
     608:	6d8000ef          	jal	ce0 <_ZN5Snake4sizeEv>
     60c:	00050793          	mv	a5,a0
     610:	ffc78793          	add	a5,a5,-4
     614:	00078613          	mv	a2,a5
     618:	fec42583          	lw	a1,-20(s0)
     61c:	00e00513          	li	a0,14
     620:	db9ff0ef          	jal	3d8 <_Z12print_uint32jjm>
     624:	00000013          	nop
     628:	01c12083          	lw	ra,28(sp)
     62c:	01812403          	lw	s0,24(sp)
     630:	02010113          	add	sp,sp,32
     634:	00008067          	ret

00000638 <_Z13do_game_pausev>:
     638:	fe010113          	add	sp,sp,-32
     63c:	00112e23          	sw	ra,28(sp)
     640:	00812c23          	sw	s0,24(sp)
     644:	02010413          	add	s0,sp,32
     648:	fe042623          	sw	zero,-20(s0)
     64c:	03c0006f          	j	688 <_Z13do_game_pausev+0x50>
     650:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     654:	46078713          	add	a4,a5,1120
     658:	fec42783          	lw	a5,-20(s0)
     65c:	02278793          	add	a5,a5,34
     660:	00f707b3          	add	a5,a4,a5
     664:	0007c783          	lbu	a5,0(a5)
     668:	0ff7f713          	zext.b	a4,a5
     66c:	41000693          	li	a3,1040
     670:	fec42783          	lw	a5,-20(s0)
     674:	00f687b3          	add	a5,a3,a5
     678:	00e78023          	sb	a4,0(a5)
     67c:	fec42783          	lw	a5,-20(s0)
     680:	00178793          	add	a5,a5,1
     684:	fef42623          	sw	a5,-20(s0)
     688:	fec42703          	lw	a4,-20(s0)
     68c:	00b00793          	li	a5,11
     690:	fce7f0e3          	bgeu	a5,a4,650 <_Z13do_game_pausev+0x18>
     694:	fe042423          	sw	zero,-24(s0)
     698:	03c0006f          	j	6d4 <_Z13do_game_pausev+0x9c>
     69c:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     6a0:	4b078713          	add	a4,a5,1200
     6a4:	fe842783          	lw	a5,-24(s0)
     6a8:	01c78793          	add	a5,a5,28
     6ac:	00f707b3          	add	a5,a4,a5
     6b0:	0007c783          	lbu	a5,0(a5)
     6b4:	0ff7f713          	zext.b	a4,a5
     6b8:	41c00693          	li	a3,1052
     6bc:	fe842783          	lw	a5,-24(s0)
     6c0:	00f687b3          	add	a5,a3,a5
     6c4:	00e78023          	sb	a4,0(a5)
     6c8:	fe842783          	lw	a5,-24(s0)
     6cc:	00178793          	add	a5,a5,1
     6d0:	fef42423          	sw	a5,-24(s0)
     6d4:	fe842703          	lw	a4,-24(s0)
     6d8:	01700793          	li	a5,23
     6dc:	fce7f0e3          	bgeu	a5,a4,69c <_Z13do_game_pausev+0x64>
     6e0:	07c00593          	li	a1,124
     6e4:	00e00513          	li	a0,14
     6e8:	465000ef          	jal	134c <_Z22print_string_at_centerILj12EEjjRAT__Kc>
     6ec:	08800593          	li	a1,136
     6f0:	00f00513          	li	a0,15
     6f4:	49d000ef          	jal	1390 <_Z22print_string_at_centerILj24EEjjRAT__Kc>
     6f8:	00100713          	li	a4,1
     6fc:	02e02023          	sw	a4,32(zero) # 20 <state>
     700:	00000013          	nop
     704:	01c12083          	lw	ra,28(sp)
     708:	01812403          	lw	s0,24(sp)
     70c:	02010113          	add	sp,sp,32
     710:	00008067          	ret

00000714 <_Z15do_game_unpausev>:
     714:	fe010113          	add	sp,sp,-32
     718:	00812e23          	sw	s0,28(sp)
     71c:	02010413          	add	s0,sp,32
     720:	fe042623          	sw	zero,-20(s0)
     724:	0380006f          	j	75c <_Z15do_game_unpausev+0x48>
     728:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     72c:	46078693          	add	a3,a5,1120
     730:	fec42783          	lw	a5,-20(s0)
     734:	02278793          	add	a5,a5,34
     738:	41000613          	li	a2,1040
     73c:	fec42703          	lw	a4,-20(s0)
     740:	00e60733          	add	a4,a2,a4
     744:	00074703          	lbu	a4,0(a4)
     748:	00f687b3          	add	a5,a3,a5
     74c:	00e78023          	sb	a4,0(a5)
     750:	fec42783          	lw	a5,-20(s0)
     754:	00178793          	add	a5,a5,1
     758:	fef42623          	sw	a5,-20(s0)
     75c:	fec42703          	lw	a4,-20(s0)
     760:	00b00793          	li	a5,11
     764:	fce7f2e3          	bgeu	a5,a4,728 <_Z15do_game_unpausev+0x14>
     768:	fe042423          	sw	zero,-24(s0)
     76c:	0380006f          	j	7a4 <_Z15do_game_unpausev+0x90>
     770:	56c02783          	lw	a5,1388(zero) # 56c <video_memory_2d>
     774:	4b078693          	add	a3,a5,1200
     778:	fe842783          	lw	a5,-24(s0)
     77c:	01c78793          	add	a5,a5,28
     780:	41c00613          	li	a2,1052
     784:	fe842703          	lw	a4,-24(s0)
     788:	00e60733          	add	a4,a2,a4
     78c:	00074703          	lbu	a4,0(a4)
     790:	00f687b3          	add	a5,a3,a5
     794:	00e78023          	sb	a4,0(a5)
     798:	fe842783          	lw	a5,-24(s0)
     79c:	00178793          	add	a5,a5,1
     7a0:	fef42423          	sw	a5,-24(s0)
     7a4:	fe842703          	lw	a4,-24(s0)
     7a8:	01700793          	li	a5,23
     7ac:	fce7f2e3          	bgeu	a5,a4,770 <_Z15do_game_unpausev+0x5c>
     7b0:	02002023          	sw	zero,32(zero) # 20 <state>
     7b4:	00000013          	nop
     7b8:	01c12403          	lw	s0,28(sp)
     7bc:	02010113          	add	sp,sp,32
     7c0:	00008067          	ret

000007c4 <_Z10game_cyclev>:
     7c4:	ff010113          	add	sp,sp,-16
     7c8:	00112623          	sw	ra,12(sp)
     7cc:	00812423          	sw	s0,8(sp)
     7d0:	01010413          	add	s0,sp,16
     7d4:	20000513          	li	a0,512
     7d8:	3f8000ef          	jal	bd0 <_ZN5Snake9get_inputEv>
     7dc:	02002783          	lw	a5,32(zero) # 20 <state>
     7e0:	06079663          	bnez	a5,84c <_gbl_ptr+0x4c>
     7e4:	20000513          	li	a0,512
     7e8:	558000ef          	jal	d40 <_ZN5Snake9move_headEv>
     7ec:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     7f0:	00078593          	mv	a1,a5
     7f4:	20000513          	li	a0,512
     7f8:	7e0000ef          	jal	fd8 <_ZN5Snake9is_eatingEj>
     7fc:	00050793          	mv	a5,a0
     800:	02078863          	beqz	a5,830 <_gbl_ptr+0x30>
     804:	20000513          	li	a0,512
     808:	4d8000ef          	jal	ce0 <_ZN5Snake4sizeEv>
     80c:	00050793          	mv	a5,a0
     810:	f0078793          	add	a5,a5,-256
     814:	0017b793          	seqz	a5,a5
     818:	0ff7f793          	zext.b	a5,a5
     81c:	00078663          	beqz	a5,828 <_gbl_ptr+0x28>
     820:	dbdff0ef          	jal	5dc <_Z14do_game_finishv>
     824:	0280006f          	j	84c <_gbl_ptr+0x4c>
     828:	118000ef          	jal	940 <_Z11place_snackv>
     82c:	0200006f          	j	84c <_gbl_ptr+0x4c>
     830:	20000513          	li	a0,512
     834:	6b8000ef          	jal	eec <_ZN5Snake9move_tailEv>
     838:	20000513          	li	a0,512
     83c:	1a1000ef          	jal	11dc <_ZN5Snake17has_head_accidentEv>
     840:	00050793          	mv	a5,a0
     844:	00078463          	beqz	a5,84c <_gbl_ptr+0x4c>
     848:	d39ff0ef          	jal	580 <_Z12do_game_overv>
     84c:	00000013          	nop
     850:	00c12083          	lw	ra,12(sp)
     854:	00812403          	lw	s0,8(sp)
     858:	01010113          	add	sp,sp,16
     85c:	00008067          	ret

00000860 <_Z11place_wallsv>:
     860:	fe010113          	add	sp,sp,-32
     864:	00812e23          	sw	s0,28(sp)
     868:	02010413          	add	s0,sp,32
     86c:	fe042623          	sw	zero,-20(s0)
     870:	0440006f          	j	8b4 <_Z11place_wallsv+0x54>
     874:	56c02703          	lw	a4,1388(zero) # 56c <video_memory_2d>
     878:	fec42783          	lw	a5,-20(s0)
     87c:	00f707b3          	add	a5,a4,a5
     880:	f8700713          	li	a4,-121
     884:	00e78023          	sb	a4,0(a5)
     888:	56c02703          	lw	a4,1388(zero) # 56c <video_memory_2d>
     88c:	000017b7          	lui	a5,0x1
     890:	91078793          	add	a5,a5,-1776 # 910 <_Z11place_wallsv+0xb0>
     894:	00f70733          	add	a4,a4,a5
     898:	fec42783          	lw	a5,-20(s0)
     89c:	00f707b3          	add	a5,a4,a5
     8a0:	f8700713          	li	a4,-121
     8a4:	00e78023          	sb	a4,0(a5)
     8a8:	fec42783          	lw	a5,-20(s0)
     8ac:	00178793          	add	a5,a5,1
     8b0:	fef42623          	sw	a5,-20(s0)
     8b4:	fec42703          	lw	a4,-20(s0)
     8b8:	04f00793          	li	a5,79
     8bc:	fae7fce3          	bgeu	a5,a4,874 <_Z11place_wallsv+0x14>
     8c0:	00100793          	li	a5,1
     8c4:	fef42423          	sw	a5,-24(s0)
     8c8:	0580006f          	j	920 <_Z11place_wallsv+0xc0>
     8cc:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     8d0:	fe842703          	lw	a4,-24(s0)
     8d4:	00070793          	mv	a5,a4
     8d8:	00279793          	sll	a5,a5,0x2
     8dc:	00e787b3          	add	a5,a5,a4
     8e0:	00479793          	sll	a5,a5,0x4
     8e4:	00f687b3          	add	a5,a3,a5
     8e8:	f8700713          	li	a4,-121
     8ec:	00e78023          	sb	a4,0(a5)
     8f0:	56c02683          	lw	a3,1388(zero) # 56c <video_memory_2d>
     8f4:	fe842703          	lw	a4,-24(s0)
     8f8:	00070793          	mv	a5,a4
     8fc:	00279793          	sll	a5,a5,0x2
     900:	00e787b3          	add	a5,a5,a4
     904:	00479793          	sll	a5,a5,0x4
     908:	00f687b3          	add	a5,a3,a5
     90c:	f8700713          	li	a4,-121
     910:	04e787a3          	sb	a4,79(a5)
     914:	fe842783          	lw	a5,-24(s0)
     918:	00178793          	add	a5,a5,1
     91c:	fef42423          	sw	a5,-24(s0)
     920:	fe842703          	lw	a4,-24(s0)
     924:	01c00793          	li	a5,28
     928:	fae7f2e3          	bgeu	a5,a4,8cc <_Z11place_wallsv+0x6c>
     92c:	00000013          	nop
     930:	00000013          	nop
     934:	01c12403          	lw	s0,28(sp)
     938:	02010113          	add	sp,sp,32
     93c:	00008067          	ret

00000940 <_Z11place_snackv>:
     940:	fe010113          	add	sp,sp,-32
     944:	00112e23          	sw	ra,28(sp)
     948:	00812c23          	sw	s0,24(sp)
     94c:	02010413          	add	s0,sp,32
     950:	fe042623          	sw	zero,-20(s0)
     954:	fec42703          	lw	a4,-20(s0)
     958:	06400793          	li	a5,100
     95c:	02e7f463          	bgeu	a5,a4,984 <_Z11place_snackv+0x44>
     960:	0a000593          	li	a1,160
     964:	00000513          	li	a0,0
     968:	26d000ef          	jal	13d4 <_Z22print_string_at_centerILj43EEjjRAT__Kc>
     96c:	fea42423          	sw	a0,-24(s0)
     970:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     974:	00078613          	mv	a2,a5
     978:	fe842583          	lw	a1,-24(s0)
     97c:	00000513          	li	a0,0
     980:	a59ff0ef          	jal	3d8 <_Z12print_uint32jjm>
     984:	83dff0ef          	jal	1c0 <_Z16get_random_valuev>
     988:	00050793          	mv	a5,a0
     98c:	ffe7f713          	and	a4,a5,-2
     990:	56e02a23          	sw	a4,1396(zero) # 574 <snack_coord>
     994:	fec42783          	lw	a5,-20(s0)
     998:	00178793          	add	a5,a5,1
     99c:	fef42623          	sw	a5,-20(s0)
     9a0:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     9a4:	00078593          	mv	a1,a5
     9a8:	20000513          	li	a0,512
     9ac:	680000ef          	jal	102c <_ZN5Snake17has_collided_withEj>
     9b0:	00050793          	mv	a5,a0
     9b4:	00079e63          	bnez	a5,9d0 <_Z11place_snackv+0x90>
     9b8:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     9bc:	00078593          	mv	a1,a5
     9c0:	20000513          	li	a0,512
     9c4:	614000ef          	jal	fd8 <_ZN5Snake9is_eatingEj>
     9c8:	00050793          	mv	a5,a0
     9cc:	00078663          	beqz	a5,9d8 <_Z11place_snackv+0x98>
     9d0:	00100793          	li	a5,1
     9d4:	0080006f          	j	9dc <_Z11place_snackv+0x9c>
     9d8:	00000793          	li	a5,0
     9dc:	f6079ce3          	bnez	a5,954 <_Z11place_snackv+0x14>
     9e0:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     9e4:	57402783          	lw	a5,1396(zero) # 574 <snack_coord>
     9e8:	00f707b3          	add	a5,a4,a5
     9ec:	f8600713          	li	a4,-122
     9f0:	00e78023          	sb	a4,0(a5)
     9f4:	00000013          	nop
     9f8:	01c12083          	lw	ra,28(sp)
     9fc:	01812403          	lw	s0,24(sp)
     a00:	02010113          	add	sp,sp,32
     a04:	00008067          	ret

00000a08 <_ZN5SnakeC1Ev>:
     a08:	fe010113          	add	sp,sp,-32
     a0c:	00812e23          	sw	s0,28(sp)
     a10:	02010413          	add	s0,sp,32
     a14:	fea42623          	sw	a0,-20(s0)
     a18:	00000013          	nop
     a1c:	01c12403          	lw	s0,28(sp)
     a20:	02010113          	add	sp,sp,32
     a24:	00008067          	ret

00000a28 <_ZN5Snake14turn_connectorE9directionS0_>:
     a28:	fe010113          	add	sp,sp,-32
     a2c:	00812e23          	sw	s0,28(sp)
     a30:	02010413          	add	s0,sp,32
     a34:	fea42623          	sw	a0,-20(s0)
     a38:	feb42423          	sw	a1,-24(s0)
     a3c:	fec42223          	sw	a2,-28(s0)
     a40:	fe842703          	lw	a4,-24(s0)
     a44:	05000793          	li	a5,80
     a48:	00f71863          	bne	a4,a5,a58 <_ZN5Snake14turn_connectorE9directionS0_+0x30>
     a4c:	fe442703          	lw	a4,-28(s0)
     a50:	00200793          	li	a5,2
     a54:	00f70e63          	beq	a4,a5,a70 <_ZN5Snake14turn_connectorE9directionS0_+0x48>
     a58:	fe842703          	lw	a4,-24(s0)
     a5c:	ffe00793          	li	a5,-2
     a60:	00f71c63          	bne	a4,a5,a78 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     a64:	fe442703          	lw	a4,-28(s0)
     a68:	fb000793          	li	a5,-80
     a6c:	00f71663          	bne	a4,a5,a78 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     a70:	08100793          	li	a5,129
     a74:	0b00006f          	j	b24 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a78:	fe842703          	lw	a4,-24(s0)
     a7c:	05000793          	li	a5,80
     a80:	00f71863          	bne	a4,a5,a90 <_ZN5Snake14turn_connectorE9directionS0_+0x68>
     a84:	fe442703          	lw	a4,-28(s0)
     a88:	ffe00793          	li	a5,-2
     a8c:	00f70e63          	beq	a4,a5,aa8 <_ZN5Snake14turn_connectorE9directionS0_+0x80>
     a90:	fe842703          	lw	a4,-24(s0)
     a94:	00200793          	li	a5,2
     a98:	00f71c63          	bne	a4,a5,ab0 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a9c:	fe442703          	lw	a4,-28(s0)
     aa0:	fb000793          	li	a5,-80
     aa4:	00f71663          	bne	a4,a5,ab0 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     aa8:	08200793          	li	a5,130
     aac:	0780006f          	j	b24 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     ab0:	fe842703          	lw	a4,-24(s0)
     ab4:	fb000793          	li	a5,-80
     ab8:	00f71863          	bne	a4,a5,ac8 <_ZN5Snake14turn_connectorE9directionS0_+0xa0>
     abc:	fe442703          	lw	a4,-28(s0)
     ac0:	ffe00793          	li	a5,-2
     ac4:	00f70e63          	beq	a4,a5,ae0 <_ZN5Snake14turn_connectorE9directionS0_+0xb8>
     ac8:	fe842703          	lw	a4,-24(s0)
     acc:	00200793          	li	a5,2
     ad0:	00f71c63          	bne	a4,a5,ae8 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     ad4:	fe442703          	lw	a4,-28(s0)
     ad8:	05000793          	li	a5,80
     adc:	00f71663          	bne	a4,a5,ae8 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     ae0:	08300793          	li	a5,131
     ae4:	0400006f          	j	b24 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     ae8:	fe842703          	lw	a4,-24(s0)
     aec:	fb000793          	li	a5,-80
     af0:	00f71863          	bne	a4,a5,b00 <_ZN5Snake14turn_connectorE9directionS0_+0xd8>
     af4:	fe442703          	lw	a4,-28(s0)
     af8:	00200793          	li	a5,2
     afc:	00f70e63          	beq	a4,a5,b18 <_ZN5Snake14turn_connectorE9directionS0_+0xf0>
     b00:	fe842703          	lw	a4,-24(s0)
     b04:	ffe00793          	li	a5,-2
     b08:	00f71c63          	bne	a4,a5,b20 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     b0c:	fe442703          	lw	a4,-28(s0)
     b10:	05000793          	li	a5,80
     b14:	00f71663          	bne	a4,a5,b20 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     b18:	08400793          	li	a5,132
     b1c:	0080006f          	j	b24 <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     b20:	07c00793          	li	a5,124
     b24:	00078513          	mv	a0,a5
     b28:	01c12403          	lw	s0,28(sp)
     b2c:	02010113          	add	sp,sp,32
     b30:	00008067          	ret

00000b34 <_ZN5Snake5resetEv>:
     b34:	fd010113          	add	sp,sp,-48
     b38:	02112623          	sw	ra,44(sp)
     b3c:	02812423          	sw	s0,40(sp)
     b40:	03010413          	add	s0,sp,48
     b44:	fca42e23          	sw	a0,-36(s0)
     b48:	fdc42783          	lw	a5,-36(s0)
     b4c:	0007a023          	sw	zero,0(a5)
     b50:	fdc42783          	lw	a5,-36(s0)
     b54:	0007a223          	sw	zero,4(a5)
     b58:	fdc42783          	lw	a5,-36(s0)
     b5c:	00200713          	li	a4,2
     b60:	00e7a423          	sw	a4,8(a5)
     b64:	fdc42783          	lw	a5,-36(s0)
     b68:	00200713          	li	a4,2
     b6c:	00e7a623          	sw	a4,12(a5)
     b70:	fdc42783          	lw	a5,-36(s0)
     b74:	0047a783          	lw	a5,4(a5)
     b78:	fdc42703          	lw	a4,-36(s0)
     b7c:	00878793          	add	a5,a5,8
     b80:	00179793          	sll	a5,a5,0x1
     b84:	00f707b3          	add	a5,a4,a5
     b88:	4ba00713          	li	a4,1210
     b8c:	00e79023          	sh	a4,0(a5)
     b90:	fe042623          	sw	zero,-20(s0)
     b94:	0180006f          	j	bac <_ZN5Snake5resetEv+0x78>
     b98:	fdc42503          	lw	a0,-36(s0)
     b9c:	1a4000ef          	jal	d40 <_ZN5Snake9move_headEv>
     ba0:	fec42783          	lw	a5,-20(s0)
     ba4:	00178793          	add	a5,a5,1
     ba8:	fef42623          	sw	a5,-20(s0)
     bac:	fec42703          	lw	a4,-20(s0)
     bb0:	00200793          	li	a5,2
     bb4:	fee7f2e3          	bgeu	a5,a4,b98 <_ZN5Snake5resetEv+0x64>
     bb8:	00000013          	nop
     bbc:	00000013          	nop
     bc0:	02c12083          	lw	ra,44(sp)
     bc4:	02812403          	lw	s0,40(sp)
     bc8:	03010113          	add	sp,sp,48
     bcc:	00008067          	ret

00000bd0 <_ZN5Snake9get_inputEv>:
     bd0:	fd010113          	add	sp,sp,-48
     bd4:	02112623          	sw	ra,44(sp)
     bd8:	02812423          	sw	s0,40(sp)
     bdc:	03010413          	add	s0,sp,48
     be0:	fca42e23          	sw	a0,-36(s0)
     be4:	feb40793          	add	a5,s0,-21
     be8:	00078513          	mv	a0,a5
     bec:	d8cff0ef          	jal	178 <_Z7get_keyRh>
     bf0:	00050793          	mv	a5,a0
     bf4:	0c078e63          	beqz	a5,cd0 <_ZN5Snake9get_inputEv+0x100>
     bf8:	02002703          	lw	a4,32(zero) # 20 <state>
     bfc:	00100793          	li	a5,1
     c00:	00f71c63          	bne	a4,a5,c18 <_ZN5Snake9get_inputEv+0x48>
     c04:	feb44703          	lbu	a4,-21(s0)
     c08:	05a00793          	li	a5,90
     c0c:	0cf71063          	bne	a4,a5,ccc <_ZN5Snake9get_inputEv+0xfc>
     c10:	b05ff0ef          	jal	714 <_Z15do_game_unpausev>
     c14:	0bc0006f          	j	cd0 <_ZN5Snake9get_inputEv+0x100>
     c18:	02002023          	sw	zero,32(zero) # 20 <state>
     c1c:	fdc42783          	lw	a5,-36(s0)
     c20:	0087a783          	lw	a5,8(a5)
     c24:	fef42623          	sw	a5,-20(s0)
     c28:	feb44783          	lbu	a5,-21(s0)
     c2c:	07600713          	li	a4,118
     c30:	06e78863          	beq	a5,a4,ca0 <_ZN5Snake9get_inputEv+0xd0>
     c34:	07600713          	li	a4,118
     c38:	06f74863          	blt	a4,a5,ca8 <_ZN5Snake9get_inputEv+0xd8>
     c3c:	02300713          	li	a4,35
     c40:	04e78a63          	beq	a5,a4,c94 <_ZN5Snake9get_inputEv+0xc4>
     c44:	02300713          	li	a4,35
     c48:	06f74063          	blt	a4,a5,ca8 <_ZN5Snake9get_inputEv+0xd8>
     c4c:	01d00713          	li	a4,29
     c50:	02e78063          	beq	a5,a4,c70 <_ZN5Snake9get_inputEv+0xa0>
     c54:	01d00713          	li	a4,29
     c58:	04f74863          	blt	a4,a5,ca8 <_ZN5Snake9get_inputEv+0xd8>
     c5c:	01b00713          	li	a4,27
     c60:	02e78463          	beq	a5,a4,c88 <_ZN5Snake9get_inputEv+0xb8>
     c64:	01c00713          	li	a4,28
     c68:	00e78a63          	beq	a5,a4,c7c <_ZN5Snake9get_inputEv+0xac>
     c6c:	03c0006f          	j	ca8 <_ZN5Snake9get_inputEv+0xd8>
     c70:	fb000793          	li	a5,-80
     c74:	fef42623          	sw	a5,-20(s0)
     c78:	0300006f          	j	ca8 <_ZN5Snake9get_inputEv+0xd8>
     c7c:	ffe00793          	li	a5,-2
     c80:	fef42623          	sw	a5,-20(s0)
     c84:	0240006f          	j	ca8 <_ZN5Snake9get_inputEv+0xd8>
     c88:	05000793          	li	a5,80
     c8c:	fef42623          	sw	a5,-20(s0)
     c90:	0180006f          	j	ca8 <_ZN5Snake9get_inputEv+0xd8>
     c94:	00200793          	li	a5,2
     c98:	fef42623          	sw	a5,-20(s0)
     c9c:	00c0006f          	j	ca8 <_ZN5Snake9get_inputEv+0xd8>
     ca0:	999ff0ef          	jal	638 <_Z13do_game_pausev>
     ca4:	00000013          	nop
     ca8:	fdc42783          	lw	a5,-36(s0)
     cac:	0087a783          	lw	a5,8(a5)
     cb0:	40f007b3          	neg	a5,a5
     cb4:	fec42703          	lw	a4,-20(s0)
     cb8:	00f70c63          	beq	a4,a5,cd0 <_ZN5Snake9get_inputEv+0x100>
     cbc:	fdc42783          	lw	a5,-36(s0)
     cc0:	fec42703          	lw	a4,-20(s0)
     cc4:	00e7a423          	sw	a4,8(a5)
     cc8:	0080006f          	j	cd0 <_ZN5Snake9get_inputEv+0x100>
     ccc:	00000013          	nop
     cd0:	02c12083          	lw	ra,44(sp)
     cd4:	02812403          	lw	s0,40(sp)
     cd8:	03010113          	add	sp,sp,48
     cdc:	00008067          	ret

00000ce0 <_ZN5Snake4sizeEv>:
     ce0:	fd010113          	add	sp,sp,-48
     ce4:	02812623          	sw	s0,44(sp)
     ce8:	03010413          	add	s0,sp,48
     cec:	fca42e23          	sw	a0,-36(s0)
     cf0:	10000793          	li	a5,256
     cf4:	fef42623          	sw	a5,-20(s0)
     cf8:	fdc42783          	lw	a5,-36(s0)
     cfc:	0007a703          	lw	a4,0(a5)
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	0047a783          	lw	a5,4(a5)
     d08:	40f707b3          	sub	a5,a4,a5
     d0c:	10178793          	add	a5,a5,257
     d10:	0ff7f793          	zext.b	a5,a5
     d14:	fef42423          	sw	a5,-24(s0)
     d18:	fe842783          	lw	a5,-24(s0)
     d1c:	00078863          	beqz	a5,d2c <_ZN5Snake4sizeEv+0x4c>
     d20:	fe840793          	add	a5,s0,-24
     d24:	0007a783          	lw	a5,0(a5)
     d28:	0080006f          	j	d30 <_ZN5Snake4sizeEv+0x50>
     d2c:	10000793          	li	a5,256
     d30:	00078513          	mv	a0,a5
     d34:	02c12403          	lw	s0,44(sp)
     d38:	03010113          	add	sp,sp,48
     d3c:	00008067          	ret

00000d40 <_ZN5Snake9move_headEv>:
     d40:	fd010113          	add	sp,sp,-48
     d44:	02112623          	sw	ra,44(sp)
     d48:	02812423          	sw	s0,40(sp)
     d4c:	02912223          	sw	s1,36(sp)
     d50:	03010413          	add	s0,sp,48
     d54:	fca42e23          	sw	a0,-36(s0)
     d58:	fdc42783          	lw	a5,-36(s0)
     d5c:	0007a783          	lw	a5,0(a5)
     d60:	fdc42703          	lw	a4,-36(s0)
     d64:	00878793          	add	a5,a5,8
     d68:	00179793          	sll	a5,a5,0x1
     d6c:	00f707b3          	add	a5,a4,a5
     d70:	0007d783          	lhu	a5,0(a5)
     d74:	fef42623          	sw	a5,-20(s0)
     d78:	fdc42783          	lw	a5,-36(s0)
     d7c:	0087a783          	lw	a5,8(a5)
     d80:	00078713          	mv	a4,a5
     d84:	fec42783          	lw	a5,-20(s0)
     d88:	00e787b3          	add	a5,a5,a4
     d8c:	fef42423          	sw	a5,-24(s0)
     d90:	fdc42783          	lw	a5,-36(s0)
     d94:	0087a703          	lw	a4,8(a5)
     d98:	fdc42783          	lw	a5,-36(s0)
     d9c:	00c7a783          	lw	a5,12(a5)
     da0:	04f71263          	bne	a4,a5,de4 <_stack_ptr+0x64>
     da4:	fdc42783          	lw	a5,-36(s0)
     da8:	0087a703          	lw	a4,8(a5)
     dac:	fb000793          	li	a5,-80
     db0:	00f70a63          	beq	a4,a5,dc4 <_stack_ptr+0x44>
     db4:	fdc42783          	lw	a5,-36(s0)
     db8:	0087a703          	lw	a4,8(a5)
     dbc:	05000793          	li	a5,80
     dc0:	00f71663          	bne	a4,a5,dcc <_stack_ptr+0x4c>
     dc4:	07c00793          	li	a5,124
     dc8:	0080006f          	j	dd0 <_stack_ptr+0x50>
     dcc:	02d00793          	li	a5,45
     dd0:	57002683          	lw	a3,1392(zero) # 570 <video_memory_1d>
     dd4:	fec42703          	lw	a4,-20(s0)
     dd8:	00e68733          	add	a4,a3,a4
     ddc:	00f70023          	sb	a5,0(a4)
     de0:	0340006f          	j	e14 <_stack_ptr+0x94>
     de4:	fdc42783          	lw	a5,-36(s0)
     de8:	00c7a683          	lw	a3,12(a5)
     dec:	fdc42783          	lw	a5,-36(s0)
     df0:	0087a603          	lw	a2,8(a5)
     df4:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     df8:	fec42783          	lw	a5,-20(s0)
     dfc:	00f704b3          	add	s1,a4,a5
     e00:	00068593          	mv	a1,a3
     e04:	fdc42503          	lw	a0,-36(s0)
     e08:	c21ff0ef          	jal	a28 <_ZN5Snake14turn_connectorE9directionS0_>
     e0c:	00050793          	mv	a5,a0
     e10:	00f48023          	sb	a5,0(s1)
     e14:	fdc42783          	lw	a5,-36(s0)
     e18:	0087a703          	lw	a4,8(a5)
     e1c:	00200793          	li	a5,2
     e20:	00f70a63          	beq	a4,a5,e34 <_stack_ptr+0xb4>
     e24:	fdc42783          	lw	a5,-36(s0)
     e28:	0087a703          	lw	a4,8(a5)
     e2c:	ffe00793          	li	a5,-2
     e30:	04f71063          	bne	a4,a5,e70 <_stack_ptr+0xf0>
     e34:	fdc42783          	lw	a5,-36(s0)
     e38:	0087a703          	lw	a4,8(a5)
     e3c:	00200793          	li	a5,2
     e40:	00f71863          	bne	a4,a5,e50 <_stack_ptr+0xd0>
     e44:	fec42783          	lw	a5,-20(s0)
     e48:	00178793          	add	a5,a5,1
     e4c:	00c0006f          	j	e58 <_stack_ptr+0xd8>
     e50:	fec42783          	lw	a5,-20(s0)
     e54:	fff78793          	add	a5,a5,-1
     e58:	fef42223          	sw	a5,-28(s0)
     e5c:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     e60:	fe442783          	lw	a5,-28(s0)
     e64:	00f707b3          	add	a5,a4,a5
     e68:	f8500713          	li	a4,-123
     e6c:	00e78023          	sb	a4,0(a5)
     e70:	fdc42783          	lw	a5,-36(s0)
     e74:	0087a703          	lw	a4,8(a5)
     e78:	fdc42783          	lw	a5,-36(s0)
     e7c:	00e7a623          	sw	a4,12(a5)
     e80:	fdc42783          	lw	a5,-36(s0)
     e84:	0007a783          	lw	a5,0(a5)
     e88:	00178793          	add	a5,a5,1
     e8c:	0ff7f713          	zext.b	a4,a5
     e90:	fdc42783          	lw	a5,-36(s0)
     e94:	00e7a023          	sw	a4,0(a5)
     e98:	fdc42783          	lw	a5,-36(s0)
     e9c:	0007a783          	lw	a5,0(a5)
     ea0:	fe842703          	lw	a4,-24(s0)
     ea4:	01071713          	sll	a4,a4,0x10
     ea8:	01075713          	srl	a4,a4,0x10
     eac:	fdc42683          	lw	a3,-36(s0)
     eb0:	00878793          	add	a5,a5,8
     eb4:	00179793          	sll	a5,a5,0x1
     eb8:	00f687b3          	add	a5,a3,a5
     ebc:	00e79023          	sh	a4,0(a5)
     ec0:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     ec4:	fe842783          	lw	a5,-24(s0)
     ec8:	00f707b3          	add	a5,a4,a5
     ecc:	06f00713          	li	a4,111
     ed0:	00e78023          	sb	a4,0(a5)
     ed4:	00000013          	nop
     ed8:	02c12083          	lw	ra,44(sp)
     edc:	02812403          	lw	s0,40(sp)
     ee0:	02412483          	lw	s1,36(sp)
     ee4:	03010113          	add	sp,sp,48
     ee8:	00008067          	ret

00000eec <_ZN5Snake9move_tailEv>:
     eec:	fd010113          	add	sp,sp,-48
     ef0:	02812623          	sw	s0,44(sp)
     ef4:	03010413          	add	s0,sp,48
     ef8:	fca42e23          	sw	a0,-36(s0)
     efc:	fdc42783          	lw	a5,-36(s0)
     f00:	0047a783          	lw	a5,4(a5)
     f04:	fdc42703          	lw	a4,-36(s0)
     f08:	00878793          	add	a5,a5,8
     f0c:	00179793          	sll	a5,a5,0x1
     f10:	00f707b3          	add	a5,a4,a5
     f14:	0007d783          	lhu	a5,0(a5)
     f18:	fef42623          	sw	a5,-20(s0)
     f1c:	fdc42783          	lw	a5,-36(s0)
     f20:	0047a783          	lw	a5,4(a5)
     f24:	00178793          	add	a5,a5,1
     f28:	0ff7f793          	zext.b	a5,a5
     f2c:	fef42423          	sw	a5,-24(s0)
     f30:	fdc42703          	lw	a4,-36(s0)
     f34:	fe842783          	lw	a5,-24(s0)
     f38:	00878793          	add	a5,a5,8
     f3c:	00179793          	sll	a5,a5,0x1
     f40:	00f707b3          	add	a5,a4,a5
     f44:	0007d783          	lhu	a5,0(a5)
     f48:	fef42223          	sw	a5,-28(s0)
     f4c:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     f50:	fec42783          	lw	a5,-20(s0)
     f54:	00f707b3          	add	a5,a4,a5
     f58:	02000713          	li	a4,32
     f5c:	00e78023          	sb	a4,0(a5)
     f60:	fe442703          	lw	a4,-28(s0)
     f64:	fec42783          	lw	a5,-20(s0)
     f68:	40f707b3          	sub	a5,a4,a5
     f6c:	fef42023          	sw	a5,-32(s0)
     f70:	fe042703          	lw	a4,-32(s0)
     f74:	00200793          	li	a5,2
     f78:	02f71063          	bne	a4,a5,f98 <_ZN5Snake9move_tailEv+0xac>
     f7c:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     f80:	fec42783          	lw	a5,-20(s0)
     f84:	00178793          	add	a5,a5,1
     f88:	00f707b3          	add	a5,a4,a5
     f8c:	02000713          	li	a4,32
     f90:	00e78023          	sb	a4,0(a5)
     f94:	0280006f          	j	fbc <_ZN5Snake9move_tailEv+0xd0>
     f98:	fe042703          	lw	a4,-32(s0)
     f9c:	ffe00793          	li	a5,-2
     fa0:	00f71e63          	bne	a4,a5,fbc <_ZN5Snake9move_tailEv+0xd0>
     fa4:	57002703          	lw	a4,1392(zero) # 570 <video_memory_1d>
     fa8:	fec42783          	lw	a5,-20(s0)
     fac:	fff78793          	add	a5,a5,-1
     fb0:	00f707b3          	add	a5,a4,a5
     fb4:	02000713          	li	a4,32
     fb8:	00e78023          	sb	a4,0(a5)
     fbc:	fdc42783          	lw	a5,-36(s0)
     fc0:	fe842703          	lw	a4,-24(s0)
     fc4:	00e7a223          	sw	a4,4(a5)
     fc8:	00000013          	nop
     fcc:	02c12403          	lw	s0,44(sp)
     fd0:	03010113          	add	sp,sp,48
     fd4:	00008067          	ret

00000fd8 <_ZN5Snake9is_eatingEj>:
     fd8:	fe010113          	add	sp,sp,-32
     fdc:	00812e23          	sw	s0,28(sp)
     fe0:	02010413          	add	s0,sp,32
     fe4:	fea42623          	sw	a0,-20(s0)
     fe8:	feb42423          	sw	a1,-24(s0)
     fec:	fec42783          	lw	a5,-20(s0)
     ff0:	0007a783          	lw	a5,0(a5)
     ff4:	fec42703          	lw	a4,-20(s0)
     ff8:	00878793          	add	a5,a5,8
     ffc:	00179793          	sll	a5,a5,0x1
    1000:	00f707b3          	add	a5,a4,a5
    1004:	0007d783          	lhu	a5,0(a5)
    1008:	00078713          	mv	a4,a5
    100c:	fe842783          	lw	a5,-24(s0)
    1010:	40e787b3          	sub	a5,a5,a4
    1014:	0017b793          	seqz	a5,a5
    1018:	0ff7f793          	zext.b	a5,a5
    101c:	00078513          	mv	a0,a5
    1020:	01c12403          	lw	s0,28(sp)
    1024:	02010113          	add	sp,sp,32
    1028:	00008067          	ret

0000102c <_ZN5Snake17has_collided_withEj>:
    102c:	fc010113          	add	sp,sp,-64
    1030:	02112e23          	sw	ra,60(sp)
    1034:	02812c23          	sw	s0,56(sp)
    1038:	04010413          	add	s0,sp,64
    103c:	fca42623          	sw	a0,-52(s0)
    1040:	fcb42423          	sw	a1,-56(s0)
    1044:	fc842783          	lw	a5,-56(s0)
    1048:	05000593          	li	a1,80
    104c:	00078513          	mv	a0,a5
    1050:	3d0000ef          	jal	1420 <__hidden___udivsi3>
    1054:	00050793          	mv	a5,a0
    1058:	fef42423          	sw	a5,-24(s0)
    105c:	fe842783          	lw	a5,-24(s0)
    1060:	00078863          	beqz	a5,1070 <_ZN5Snake17has_collided_withEj+0x44>
    1064:	fe842703          	lw	a4,-24(s0)
    1068:	01d00793          	li	a5,29
    106c:	00f71663          	bne	a4,a5,1078 <_ZN5Snake17has_collided_withEj+0x4c>
    1070:	00100793          	li	a5,1
    1074:	1540006f          	j	11c8 <_ZN5Snake17has_collided_withEj+0x19c>
    1078:	fc842783          	lw	a5,-56(s0)
    107c:	05000593          	li	a1,80
    1080:	00078513          	mv	a0,a5
    1084:	3e4000ef          	jal	1468 <__umodsi3>
    1088:	00050793          	mv	a5,a0
    108c:	fef42223          	sw	a5,-28(s0)
    1090:	fe442783          	lw	a5,-28(s0)
    1094:	00078863          	beqz	a5,10a4 <_ZN5Snake17has_collided_withEj+0x78>
    1098:	fe442703          	lw	a4,-28(s0)
    109c:	04f00793          	li	a5,79
    10a0:	00f71663          	bne	a4,a5,10ac <_ZN5Snake17has_collided_withEj+0x80>
    10a4:	00100793          	li	a5,1
    10a8:	1200006f          	j	11c8 <_ZN5Snake17has_collided_withEj+0x19c>
    10ac:	fcc42783          	lw	a5,-52(s0)
    10b0:	0047a783          	lw	a5,4(a5)
    10b4:	fef42623          	sw	a5,-20(s0)
    10b8:	0fc0006f          	j	11b4 <_ZN5Snake17has_collided_withEj+0x188>
    10bc:	fcc42703          	lw	a4,-52(s0)
    10c0:	fec42783          	lw	a5,-20(s0)
    10c4:	00878793          	add	a5,a5,8
    10c8:	00179793          	sll	a5,a5,0x1
    10cc:	00f707b3          	add	a5,a4,a5
    10d0:	0007d783          	lhu	a5,0(a5)
    10d4:	00078713          	mv	a4,a5
    10d8:	fc842783          	lw	a5,-56(s0)
    10dc:	00e79663          	bne	a5,a4,10e8 <_ZN5Snake17has_collided_withEj+0xbc>
    10e0:	00100793          	li	a5,1
    10e4:	0e40006f          	j	11c8 <_ZN5Snake17has_collided_withEj+0x19c>
    10e8:	fec42783          	lw	a5,-20(s0)
    10ec:	00178793          	add	a5,a5,1
    10f0:	0ff7f793          	zext.b	a5,a5
    10f4:	fef42023          	sw	a5,-32(s0)
    10f8:	fcc42703          	lw	a4,-52(s0)
    10fc:	fe042783          	lw	a5,-32(s0)
    1100:	00878793          	add	a5,a5,8
    1104:	00179793          	sll	a5,a5,0x1
    1108:	00f707b3          	add	a5,a4,a5
    110c:	0007d783          	lhu	a5,0(a5)
    1110:	00078693          	mv	a3,a5
    1114:	fcc42703          	lw	a4,-52(s0)
    1118:	fec42783          	lw	a5,-20(s0)
    111c:	00878793          	add	a5,a5,8
    1120:	00179793          	sll	a5,a5,0x1
    1124:	00f707b3          	add	a5,a4,a5
    1128:	0007d783          	lhu	a5,0(a5)
    112c:	40f687b3          	sub	a5,a3,a5
    1130:	fcf42e23          	sw	a5,-36(s0)
    1134:	fdc42703          	lw	a4,-36(s0)
    1138:	00200793          	li	a5,2
    113c:	02f71863          	bne	a4,a5,116c <_ZN5Snake17has_collided_withEj+0x140>
    1140:	fcc42703          	lw	a4,-52(s0)
    1144:	fec42783          	lw	a5,-20(s0)
    1148:	00878793          	add	a5,a5,8
    114c:	00179793          	sll	a5,a5,0x1
    1150:	00f707b3          	add	a5,a4,a5
    1154:	0007d783          	lhu	a5,0(a5)
    1158:	00178713          	add	a4,a5,1
    115c:	fc842783          	lw	a5,-56(s0)
    1160:	00f71663          	bne	a4,a5,116c <_ZN5Snake17has_collided_withEj+0x140>
    1164:	00100793          	li	a5,1
    1168:	0600006f          	j	11c8 <_ZN5Snake17has_collided_withEj+0x19c>
    116c:	fdc42703          	lw	a4,-36(s0)
    1170:	ffe00793          	li	a5,-2
    1174:	02f71863          	bne	a4,a5,11a4 <_ZN5Snake17has_collided_withEj+0x178>
    1178:	fcc42703          	lw	a4,-52(s0)
    117c:	fec42783          	lw	a5,-20(s0)
    1180:	00878793          	add	a5,a5,8
    1184:	00179793          	sll	a5,a5,0x1
    1188:	00f707b3          	add	a5,a4,a5
    118c:	0007d783          	lhu	a5,0(a5)
    1190:	fff78713          	add	a4,a5,-1
    1194:	fc842783          	lw	a5,-56(s0)
    1198:	00f71663          	bne	a4,a5,11a4 <_ZN5Snake17has_collided_withEj+0x178>
    119c:	00100793          	li	a5,1
    11a0:	0280006f          	j	11c8 <_ZN5Snake17has_collided_withEj+0x19c>
    11a4:	fec42783          	lw	a5,-20(s0)
    11a8:	00178793          	add	a5,a5,1
    11ac:	0ff7f793          	zext.b	a5,a5
    11b0:	fef42623          	sw	a5,-20(s0)
    11b4:	fcc42783          	lw	a5,-52(s0)
    11b8:	0007a783          	lw	a5,0(a5)
    11bc:	fec42703          	lw	a4,-20(s0)
    11c0:	eef71ee3          	bne	a4,a5,10bc <_ZN5Snake17has_collided_withEj+0x90>
    11c4:	00000793          	li	a5,0
    11c8:	00078513          	mv	a0,a5
    11cc:	03c12083          	lw	ra,60(sp)
    11d0:	03812403          	lw	s0,56(sp)
    11d4:	04010113          	add	sp,sp,64
    11d8:	00008067          	ret

000011dc <_ZN5Snake17has_head_accidentEv>:
    11dc:	fe010113          	add	sp,sp,-32
    11e0:	00112e23          	sw	ra,28(sp)
    11e4:	00812c23          	sw	s0,24(sp)
    11e8:	02010413          	add	s0,sp,32
    11ec:	fea42623          	sw	a0,-20(s0)
    11f0:	fec42783          	lw	a5,-20(s0)
    11f4:	0007a783          	lw	a5,0(a5)
    11f8:	fec42703          	lw	a4,-20(s0)
    11fc:	00878793          	add	a5,a5,8
    1200:	00179793          	sll	a5,a5,0x1
    1204:	00f707b3          	add	a5,a4,a5
    1208:	0007d783          	lhu	a5,0(a5)
    120c:	00078593          	mv	a1,a5
    1210:	fec42503          	lw	a0,-20(s0)
    1214:	e19ff0ef          	jal	102c <_ZN5Snake17has_collided_withEj>
    1218:	00050793          	mv	a5,a0
    121c:	00078513          	mv	a0,a5
    1220:	01c12083          	lw	ra,28(sp)
    1224:	01812403          	lw	s0,24(sp)
    1228:	02010113          	add	sp,sp,32
    122c:	00008067          	ret

00001230 <_Z41__static_initialization_and_destruction_0v>:
    1230:	ff010113          	add	sp,sp,-16
    1234:	00112623          	sw	ra,12(sp)
    1238:	00812423          	sw	s0,8(sp)
    123c:	01010413          	add	s0,sp,16
    1240:	20000513          	li	a0,512
    1244:	fc4ff0ef          	jal	a08 <_ZN5SnakeC1Ev>
    1248:	00000013          	nop
    124c:	00c12083          	lw	ra,12(sp)
    1250:	00812403          	lw	s0,8(sp)
    1254:	01010113          	add	sp,sp,16
    1258:	00008067          	ret

0000125c <_GLOBAL__sub_I_state>:
    125c:	ff010113          	add	sp,sp,-16
    1260:	00112623          	sw	ra,12(sp)
    1264:	00812423          	sw	s0,8(sp)
    1268:	01010413          	add	s0,sp,16
    126c:	fc5ff0ef          	jal	1230 <_Z41__static_initialization_and_destruction_0v>
    1270:	00c12083          	lw	ra,12(sp)
    1274:	00812403          	lw	s0,8(sp)
    1278:	01010113          	add	sp,sp,16
    127c:	00008067          	ret

00001280 <_Z22print_string_at_centerILj32EEjjRAT__Kc>:
    1280:	fe010113          	add	sp,sp,-32
    1284:	00112e23          	sw	ra,28(sp)
    1288:	00812c23          	sw	s0,24(sp)
    128c:	02010413          	add	s0,sp,32
    1290:	fea42623          	sw	a0,-20(s0)
    1294:	feb42423          	sw	a1,-24(s0)
    1298:	01f00693          	li	a3,31
    129c:	fe842603          	lw	a2,-24(s0)
    12a0:	01800593          	li	a1,24
    12a4:	fec42503          	lw	a0,-20(s0)
    12a8:	8a0ff0ef          	jal	348 <_Z12print_stringjjPKcj>
    12ac:	03700793          	li	a5,55
    12b0:	00078513          	mv	a0,a5
    12b4:	01c12083          	lw	ra,28(sp)
    12b8:	01812403          	lw	s0,24(sp)
    12bc:	02010113          	add	sp,sp,32
    12c0:	00008067          	ret

000012c4 <_Z22print_string_at_centerILj27EEjjRAT__Kc>:
    12c4:	fe010113          	add	sp,sp,-32
    12c8:	00112e23          	sw	ra,28(sp)
    12cc:	00812c23          	sw	s0,24(sp)
    12d0:	02010413          	add	s0,sp,32
    12d4:	fea42623          	sw	a0,-20(s0)
    12d8:	feb42423          	sw	a1,-24(s0)
    12dc:	01a00693          	li	a3,26
    12e0:	fe842603          	lw	a2,-24(s0)
    12e4:	01b00593          	li	a1,27
    12e8:	fec42503          	lw	a0,-20(s0)
    12ec:	85cff0ef          	jal	348 <_Z12print_stringjjPKcj>
    12f0:	03500793          	li	a5,53
    12f4:	00078513          	mv	a0,a5
    12f8:	01c12083          	lw	ra,28(sp)
    12fc:	01812403          	lw	s0,24(sp)
    1300:	02010113          	add	sp,sp,32
    1304:	00008067          	ret

00001308 <_Z22print_string_at_centerILj25EEjjRAT__Kc>:
    1308:	fe010113          	add	sp,sp,-32
    130c:	00112e23          	sw	ra,28(sp)
    1310:	00812c23          	sw	s0,24(sp)
    1314:	02010413          	add	s0,sp,32
    1318:	fea42623          	sw	a0,-20(s0)
    131c:	feb42423          	sw	a1,-24(s0)
    1320:	01800693          	li	a3,24
    1324:	fe842603          	lw	a2,-24(s0)
    1328:	01c00593          	li	a1,28
    132c:	fec42503          	lw	a0,-20(s0)
    1330:	818ff0ef          	jal	348 <_Z12print_stringjjPKcj>
    1334:	03400793          	li	a5,52
    1338:	00078513          	mv	a0,a5
    133c:	01c12083          	lw	ra,28(sp)
    1340:	01812403          	lw	s0,24(sp)
    1344:	02010113          	add	sp,sp,32
    1348:	00008067          	ret

0000134c <_Z22print_string_at_centerILj12EEjjRAT__Kc>:
    134c:	fe010113          	add	sp,sp,-32
    1350:	00112e23          	sw	ra,28(sp)
    1354:	00812c23          	sw	s0,24(sp)
    1358:	02010413          	add	s0,sp,32
    135c:	fea42623          	sw	a0,-20(s0)
    1360:	feb42423          	sw	a1,-24(s0)
    1364:	00b00693          	li	a3,11
    1368:	fe842603          	lw	a2,-24(s0)
    136c:	02200593          	li	a1,34
    1370:	fec42503          	lw	a0,-20(s0)
    1374:	fd5fe0ef          	jal	348 <_Z12print_stringjjPKcj>
    1378:	02d00793          	li	a5,45
    137c:	00078513          	mv	a0,a5
    1380:	01c12083          	lw	ra,28(sp)
    1384:	01812403          	lw	s0,24(sp)
    1388:	02010113          	add	sp,sp,32
    138c:	00008067          	ret

00001390 <_Z22print_string_at_centerILj24EEjjRAT__Kc>:
    1390:	fe010113          	add	sp,sp,-32
    1394:	00112e23          	sw	ra,28(sp)
    1398:	00812c23          	sw	s0,24(sp)
    139c:	02010413          	add	s0,sp,32
    13a0:	fea42623          	sw	a0,-20(s0)
    13a4:	feb42423          	sw	a1,-24(s0)
    13a8:	01700693          	li	a3,23
    13ac:	fe842603          	lw	a2,-24(s0)
    13b0:	01c00593          	li	a1,28
    13b4:	fec42503          	lw	a0,-20(s0)
    13b8:	f91fe0ef          	jal	348 <_Z12print_stringjjPKcj>
    13bc:	03300793          	li	a5,51
    13c0:	00078513          	mv	a0,a5
    13c4:	01c12083          	lw	ra,28(sp)
    13c8:	01812403          	lw	s0,24(sp)
    13cc:	02010113          	add	sp,sp,32
    13d0:	00008067          	ret

000013d4 <_Z22print_string_at_centerILj43EEjjRAT__Kc>:
    13d4:	fe010113          	add	sp,sp,-32
    13d8:	00112e23          	sw	ra,28(sp)
    13dc:	00812c23          	sw	s0,24(sp)
    13e0:	02010413          	add	s0,sp,32
    13e4:	fea42623          	sw	a0,-20(s0)
    13e8:	feb42423          	sw	a1,-24(s0)
    13ec:	02a00693          	li	a3,42
    13f0:	fe842603          	lw	a2,-24(s0)
    13f4:	01300593          	li	a1,19
    13f8:	fec42503          	lw	a0,-20(s0)
    13fc:	f4dfe0ef          	jal	348 <_Z12print_stringjjPKcj>
    1400:	03d00793          	li	a5,61
    1404:	00078513          	mv	a0,a5
    1408:	01c12083          	lw	ra,28(sp)
    140c:	01812403          	lw	s0,24(sp)
    1410:	02010113          	add	sp,sp,32
    1414:	00008067          	ret

00001418 <__divsi3>:
    1418:	06054063          	bltz	a0,1478 <__umodsi3+0x10>
    141c:	0605c663          	bltz	a1,1488 <__umodsi3+0x20>

00001420 <__hidden___udivsi3>:
    1420:	00058613          	mv	a2,a1
    1424:	00050593          	mv	a1,a0
    1428:	fff00513          	li	a0,-1
    142c:	02060c63          	beqz	a2,1464 <__hidden___udivsi3+0x44>
    1430:	00100693          	li	a3,1
    1434:	00b67a63          	bgeu	a2,a1,1448 <__hidden___udivsi3+0x28>
    1438:	00c05863          	blez	a2,1448 <__hidden___udivsi3+0x28>
    143c:	00161613          	sll	a2,a2,0x1
    1440:	00169693          	sll	a3,a3,0x1
    1444:	feb66ae3          	bltu	a2,a1,1438 <__hidden___udivsi3+0x18>
    1448:	00000513          	li	a0,0
    144c:	00c5e663          	bltu	a1,a2,1458 <__hidden___udivsi3+0x38>
    1450:	40c585b3          	sub	a1,a1,a2
    1454:	00d56533          	or	a0,a0,a3
    1458:	0016d693          	srl	a3,a3,0x1
    145c:	00165613          	srl	a2,a2,0x1
    1460:	fe0696e3          	bnez	a3,144c <__hidden___udivsi3+0x2c>
    1464:	00008067          	ret

00001468 <__umodsi3>:
    1468:	00008293          	mv	t0,ra
    146c:	fb5ff0ef          	jal	1420 <__hidden___udivsi3>
    1470:	00058513          	mv	a0,a1
    1474:	00028067          	jr	t0
    1478:	40a00533          	neg	a0,a0
    147c:	00b04863          	bgtz	a1,148c <__umodsi3+0x24>
    1480:	40b005b3          	neg	a1,a1
    1484:	f9dff06f          	j	1420 <__hidden___udivsi3>
    1488:	40b005b3          	neg	a1,a1
    148c:	00008293          	mv	t0,ra
    1490:	f91ff0ef          	jal	1420 <__hidden___udivsi3>
    1494:	40a00533          	neg	a0,a0
    1498:	00028067          	jr	t0

0000149c <__modsi3>:
    149c:	00008293          	mv	t0,ra
    14a0:	0005ca63          	bltz	a1,14b4 <__modsi3+0x18>
    14a4:	00054c63          	bltz	a0,14bc <__modsi3+0x20>
    14a8:	f79ff0ef          	jal	1420 <__hidden___udivsi3>
    14ac:	00058513          	mv	a0,a1
    14b0:	00028067          	jr	t0
    14b4:	40b005b3          	neg	a1,a1
    14b8:	fe0558e3          	bgez	a0,14a8 <__modsi3+0xc>
    14bc:	40a00533          	neg	a0,a0
    14c0:	f61ff0ef          	jal	1420 <__hidden___udivsi3>
    14c4:	40b00533          	neg	a0,a1
    14c8:	00028067          	jr	t0

000014cc <srand>:
    14cc:	0d802783          	lw	a5,216(zero) # d8 <_impure_ptr>
    14d0:	08a7ac23          	sw	a0,152(a5)
    14d4:	0807ae23          	sw	zero,156(a5)
    14d8:	00008067          	ret

000014dc <rand>:
    14dc:	ff010113          	add	sp,sp,-16
    14e0:	00812423          	sw	s0,8(sp)
    14e4:	fffff797          	auipc	a5,0xfffff
    14e8:	bec78793          	add	a5,a5,-1044 # d0 <_ZL10pause_str2+0x48>
    14ec:	0d802403          	lw	s0,216(zero) # d8 <_impure_ptr>
    14f0:	09842503          	lw	a0,152(s0)
    14f4:	09c42583          	lw	a1,156(s0)
    14f8:	0007a603          	lw	a2,0(a5)
    14fc:	0047a683          	lw	a3,4(a5)
    1500:	00112623          	sw	ra,12(sp)
    1504:	030000ef          	jal	1534 <__muldi3>
    1508:	00150793          	add	a5,a0,1
    150c:	00a7b533          	sltu	a0,a5,a0
    1510:	00b505b3          	add	a1,a0,a1
    1514:	00c12083          	lw	ra,12(sp)
    1518:	08f42c23          	sw	a5,152(s0)
    151c:	08b42e23          	sw	a1,156(s0)
    1520:	00812403          	lw	s0,8(sp)
    1524:	00159513          	sll	a0,a1,0x1
    1528:	00155513          	srl	a0,a0,0x1
    152c:	01010113          	add	sp,sp,16
    1530:	00008067          	ret

00001534 <__muldi3>:
    1534:	ff010113          	add	sp,sp,-16
    1538:	00812423          	sw	s0,8(sp)
    153c:	00050413          	mv	s0,a0
    1540:	00112623          	sw	ra,12(sp)
    1544:	00060513          	mv	a0,a2
    1548:	00068393          	mv	t2,a3
    154c:	00040713          	mv	a4,s0
    1550:	00060813          	mv	a6,a2
    1554:	00000793          	li	a5,0
    1558:	00000313          	li	t1,0
    155c:	00000f13          	li	t5,0
    1560:	01e708b3          	add	a7,a4,t5
    1564:	00187e93          	and	t4,a6,1
    1568:	00f30fb3          	add	t6,t1,a5
    156c:	01f75e13          	srl	t3,a4,0x1f
    1570:	00185813          	srl	a6,a6,0x1
    1574:	00e8b2b3          	sltu	t0,a7,a4
    1578:	00179793          	sll	a5,a5,0x1
    157c:	000e8663          	beqz	t4,1588 <__muldi3+0x54>
    1580:	00088f13          	mv	t5,a7
    1584:	01f28333          	add	t1,t0,t6
    1588:	00171713          	sll	a4,a4,0x1
    158c:	01c7e7b3          	or	a5,a5,t3
    1590:	fc0818e3          	bnez	a6,1560 <__muldi3+0x2c>
    1594:	00058663          	beqz	a1,15a0 <__muldi3+0x6c>
    1598:	034000ef          	jal	15cc <__mulsi3>
    159c:	00650333          	add	t1,a0,t1
    15a0:	00038a63          	beqz	t2,15b4 <__muldi3+0x80>
    15a4:	00040513          	mv	a0,s0
    15a8:	00038593          	mv	a1,t2
    15ac:	020000ef          	jal	15cc <__mulsi3>
    15b0:	00650333          	add	t1,a0,t1
    15b4:	00c12083          	lw	ra,12(sp)
    15b8:	00812403          	lw	s0,8(sp)
    15bc:	000f0513          	mv	a0,t5
    15c0:	00030593          	mv	a1,t1
    15c4:	01010113          	add	sp,sp,16
    15c8:	00008067          	ret

000015cc <__mulsi3>:
    15cc:	00050613          	mv	a2,a0
    15d0:	00000513          	li	a0,0
    15d4:	0015f693          	and	a3,a1,1
    15d8:	00068463          	beqz	a3,15e0 <__mulsi3+0x14>
    15dc:	00c50533          	add	a0,a0,a2
    15e0:	0015d593          	srl	a1,a1,0x1
    15e4:	00161613          	sll	a2,a2,0x1
    15e8:	fe0596e3          	bnez	a1,15d4 <__mulsi3+0x8>
    15ec:	00008067          	ret

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
  50:	2072756f          	jal	a0,27a56 <__mulsi3+0x2648a>
  54:	726f6373          	.insn	4, 0x726f6373
  58:	2065                	.insn	2, 0x2065
  5a:	7369                	.insn	2, 0x7369
  5c:	203a                	.insn	2, 0x203a
  5e:	0000                	.insn	2, 0x
  60:	6f59                	.insn	2, 0x6f59
  62:	2075                	.insn	2, 0x2075
  64:	2e6e6f77          	.insn	4, 0x2e6e6f77
  68:	5920                	.insn	2, 0x5920
  6a:	2072756f          	jal	a0,27a70 <__mulsi3+0x264a4>
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
  98:	69746e6f          	jal	t3,46f2e <__mulsi3+0x45962>
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
  c2:	2064726f          	jal	tp,472c8 <__mulsi3+0x45cfc>
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
  1e:	32727363          	bgeu	tp,t2,344 <_Z12clear_screenv+0x54>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

