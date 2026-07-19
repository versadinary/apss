
game.elf:     file format elf32-littleriscv


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
      4c:	1ec000ef          	jal	238 <main>

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
      c0:	150000ef          	jal	210 <int_handler>
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
     13c:	30e02223          	sw	a4,772(zero) # 304 <video_memory_1d>
     140:	00000793          	li	a5,0
     144:	0007a703          	lw	a4,0(a5)
     148:	30e02023          	sw	a4,768(zero) # 300 <video_memory_2d>
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
     1c4:	00812e23          	sw	s0,28(sp)
     1c8:	02010413          	add	s0,sp,32
     1cc:	080007b7          	lui	a5,0x8000
     1d0:	0007a783          	lw	a5,0(a5) # 8000000 <_trap_stack_ptr+0x7ffe000>
     1d4:	0047d793          	srl	a5,a5,0x4
     1d8:	fef42623          	sw	a5,-20(s0)
     1dc:	fec42783          	lw	a5,-20(s0)
     1e0:	00078513          	mv	a0,a5
     1e4:	01c12403          	lw	s0,28(sp)
     1e8:	02010113          	add	sp,sp,32
     1ec:	00008067          	ret

000001f0 <_Z8seed_rngj>:
     1f0:	fe010113          	add	sp,sp,-32
     1f4:	00812e23          	sw	s0,28(sp)
     1f8:	02010413          	add	s0,sp,32
     1fc:	fea42623          	sw	a0,-20(s0)
     200:	00000013          	nop
     204:	01c12403          	lw	s0,28(sp)
     208:	02010113          	add	sp,sp,32
     20c:	00008067          	ret

00000210 <int_handler>:
     210:	ff010113          	add	sp,sp,-16
     214:	00112623          	sw	ra,12(sp)
     218:	00812423          	sw	s0,8(sp)
     21c:	01010413          	add	s0,sp,16
     220:	52c000ef          	jal	74c <_Z10game_cyclev>
     224:	00000013          	nop
     228:	00c12083          	lw	ra,12(sp)
     22c:	00812403          	lw	s0,8(sp)
     230:	01010113          	add	sp,sp,16
     234:	00008067          	ret

00000238 <main>:
     238:	ff010113          	add	sp,sp,-16
     23c:	00112623          	sw	ra,12(sp)
     240:	00812423          	sw	s0,8(sp)
     244:	01010413          	add	s0,sp,16
     248:	ee1ff0ef          	jal	128 <_Z13config_periphv>
     24c:	02c000ef          	jal	278 <_Z12clear_screenv>
     250:	238000ef          	jal	488 <_Z11do_new_gamev>
     254:	00000013          	nop
     258:	02002783          	lw	a5,32(zero) # 20 <state>
     25c:	fe079ee3          	bnez	a5,258 <main+0x20>
     260:	268000ef          	jal	4c8 <_Z12prepare_gamev>
     264:	00000013          	nop
     268:	02002703          	lw	a4,32(zero) # 20 <state>
     26c:	00200793          	li	a5,2
     270:	fef71ce3          	bne	a4,a5,268 <main+0x30>
     274:	fddff06f          	j	250 <main+0x18>

00000278 <_Z12clear_screenv>:
     278:	fe010113          	add	sp,sp,-32
     27c:	00812e23          	sw	s0,28(sp)
     280:	02010413          	add	s0,sp,32
     284:	fe042623          	sw	zero,-20(s0)
     288:	0240006f          	j	2ac <_stack_size+0x2c>
     28c:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     290:	fec42783          	lw	a5,-20(s0)
     294:	00f707b3          	add	a5,a4,a5
     298:	02000713          	li	a4,32
     29c:	00e78023          	sb	a4,0(a5)
     2a0:	fec42783          	lw	a5,-20(s0)
     2a4:	00178793          	add	a5,a5,1
     2a8:	fef42623          	sw	a5,-20(s0)
     2ac:	fec42703          	lw	a4,-20(s0)
     2b0:	000017b7          	lui	a5,0x1
     2b4:	95f78793          	add	a5,a5,-1697 # 95f <_Z11place_snackv+0x97>
     2b8:	fce7fae3          	bgeu	a5,a4,28c <_stack_size+0xc>
     2bc:	00000013          	nop
     2c0:	00000013          	nop
     2c4:	01c12403          	lw	s0,28(sp)
     2c8:	02010113          	add	sp,sp,32
     2cc:	00008067          	ret

000002d0 <_Z12print_stringjjPKcj>:
     2d0:	fd010113          	add	sp,sp,-48
     2d4:	02812623          	sw	s0,44(sp)
     2d8:	03010413          	add	s0,sp,48
     2dc:	fca42e23          	sw	a0,-36(s0)
     2e0:	fcb42c23          	sw	a1,-40(s0)
     2e4:	fcc42a23          	sw	a2,-44(s0)
     2e8:	fcd42823          	sw	a3,-48(s0)
     2ec:	fe042623          	sw	zero,-20(s0)
     2f0:	0500006f          	j	340 <_bss_end+0x34>
     2f4:	fd442703          	lw	a4,-44(s0)
     2f8:	fec42783          	lw	a5,-20(s0)
     2fc:	00f70633          	add	a2,a4,a5
     300:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     304:	fdc42703          	lw	a4,-36(s0)
     308:	00070793          	mv	a5,a4
     30c:	00279793          	sll	a5,a5,0x2
     310:	00e787b3          	add	a5,a5,a4
     314:	00479793          	sll	a5,a5,0x4
     318:	00f686b3          	add	a3,a3,a5
     31c:	fd842703          	lw	a4,-40(s0)
     320:	fec42783          	lw	a5,-20(s0)
     324:	00f707b3          	add	a5,a4,a5
     328:	00064703          	lbu	a4,0(a2)
     32c:	00f687b3          	add	a5,a3,a5
     330:	00e78023          	sb	a4,0(a5)
     334:	fec42783          	lw	a5,-20(s0)
     338:	00178793          	add	a5,a5,1
     33c:	fef42623          	sw	a5,-20(s0)
     340:	fec42703          	lw	a4,-20(s0)
     344:	fd042783          	lw	a5,-48(s0)
     348:	faf766e3          	bltu	a4,a5,2f4 <backup_array2+0xc>
     34c:	00000013          	nop
     350:	00000013          	nop
     354:	02c12403          	lw	s0,44(sp)
     358:	03010113          	add	sp,sp,48
     35c:	00008067          	ret

00000360 <_Z12print_uint32jjm>:
     360:	fd010113          	add	sp,sp,-48
     364:	02812623          	sw	s0,44(sp)
     368:	03010413          	add	s0,sp,48
     36c:	fca42e23          	sw	a0,-36(s0)
     370:	fcb42c23          	sw	a1,-40(s0)
     374:	fcc42a23          	sw	a2,-44(s0)
     378:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     37c:	fdc42703          	lw	a4,-36(s0)
     380:	00070793          	mv	a5,a4
     384:	00279793          	sll	a5,a5,0x2
     388:	00e787b3          	add	a5,a5,a4
     38c:	00479793          	sll	a5,a5,0x4
     390:	00f68733          	add	a4,a3,a5
     394:	fd842783          	lw	a5,-40(s0)
     398:	00f707b3          	add	a5,a4,a5
     39c:	03000713          	li	a4,48
     3a0:	00e78023          	sb	a4,0(a5)
     3a4:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     3a8:	fdc42703          	lw	a4,-36(s0)
     3ac:	00070793          	mv	a5,a4
     3b0:	00279793          	sll	a5,a5,0x2
     3b4:	00e787b3          	add	a5,a5,a4
     3b8:	00479793          	sll	a5,a5,0x4
     3bc:	00f68733          	add	a4,a3,a5
     3c0:	fd842783          	lw	a5,-40(s0)
     3c4:	00178793          	add	a5,a5,1
     3c8:	00f707b3          	add	a5,a4,a5
     3cc:	07800713          	li	a4,120
     3d0:	00e78023          	sb	a4,0(a5)
     3d4:	fe042623          	sw	zero,-20(s0)
     3d8:	0900006f          	j	468 <_Z12print_uint32jjm+0x108>
     3dc:	fec42783          	lw	a5,-20(s0)
     3e0:	00279793          	sll	a5,a5,0x2
     3e4:	fd442703          	lw	a4,-44(s0)
     3e8:	00f757b3          	srl	a5,a4,a5
     3ec:	0ff7f793          	zext.b	a5,a5
     3f0:	00f7f793          	and	a5,a5,15
     3f4:	fef405a3          	sb	a5,-21(s0)
     3f8:	feb44703          	lbu	a4,-21(s0)
     3fc:	00900793          	li	a5,9
     400:	00e7ea63          	bltu	a5,a4,414 <_Z12print_uint32jjm+0xb4>
     404:	feb44783          	lbu	a5,-21(s0)
     408:	03078793          	add	a5,a5,48
     40c:	0ff7f793          	zext.b	a5,a5
     410:	0100006f          	j	420 <_Z12print_uint32jjm+0xc0>
     414:	feb44783          	lbu	a5,-21(s0)
     418:	05778793          	add	a5,a5,87
     41c:	0ff7f793          	zext.b	a5,a5
     420:	fef40523          	sb	a5,-22(s0)
     424:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     428:	fdc42703          	lw	a4,-36(s0)
     42c:	00070793          	mv	a5,a4
     430:	00279793          	sll	a5,a5,0x2
     434:	00e787b3          	add	a5,a5,a4
     438:	00479793          	sll	a5,a5,0x4
     43c:	00f68733          	add	a4,a3,a5
     440:	fd842683          	lw	a3,-40(s0)
     444:	fec42783          	lw	a5,-20(s0)
     448:	40f687b3          	sub	a5,a3,a5
     44c:	00978793          	add	a5,a5,9
     450:	00f707b3          	add	a5,a4,a5
     454:	fea44703          	lbu	a4,-22(s0)
     458:	00e78023          	sb	a4,0(a5)
     45c:	fec42783          	lw	a5,-20(s0)
     460:	00178793          	add	a5,a5,1
     464:	fef42623          	sw	a5,-20(s0)
     468:	fec42703          	lw	a4,-20(s0)
     46c:	00700793          	li	a5,7
     470:	f6e7f6e3          	bgeu	a5,a4,3dc <_Z12print_uint32jjm+0x7c>
     474:	00000013          	nop
     478:	00000013          	nop
     47c:	02c12403          	lw	s0,44(sp)
     480:	03010113          	add	sp,sp,48
     484:	00008067          	ret

00000488 <_Z11do_new_gamev>:
     488:	ff010113          	add	sp,sp,-16
     48c:	00112623          	sw	ra,12(sp)
     490:	00812423          	sw	s0,8(sp)
     494:	01010413          	add	s0,sp,16
     498:	00200713          	li	a4,2
     49c:	02e02023          	sw	a4,32(zero) # 20 <state>
     4a0:	0cc00513          	li	a0,204
     4a4:	618000ef          	jal	abc <_ZN5Snake5resetEv>
     4a8:	02400593          	li	a1,36
     4ac:	00f00513          	li	a0,15
     4b0:	559000ef          	jal	1208 <_Z22print_string_at_centerILj32EEjjRAT__Kc>
     4b4:	00000013          	nop
     4b8:	00c12083          	lw	ra,12(sp)
     4bc:	00812403          	lw	s0,8(sp)
     4c0:	01010113          	add	sp,sp,16
     4c4:	00008067          	ret

000004c8 <_Z12prepare_gamev>:
     4c8:	ff010113          	add	sp,sp,-16
     4cc:	00112623          	sw	ra,12(sp)
     4d0:	00812423          	sw	s0,8(sp)
     4d4:	01010413          	add	s0,sp,16
     4d8:	00000513          	li	a0,0
     4dc:	d15ff0ef          	jal	1f0 <_Z8seed_rngj>
     4e0:	d99ff0ef          	jal	278 <_Z12clear_screenv>
     4e4:	304000ef          	jal	7e8 <_Z11place_wallsv>
     4e8:	3e0000ef          	jal	8c8 <_Z11place_snackv>
     4ec:	0cc00513          	li	a0,204
     4f0:	5cc000ef          	jal	abc <_ZN5Snake5resetEv>
     4f4:	00000013          	nop
     4f8:	00c12083          	lw	ra,12(sp)
     4fc:	00812403          	lw	s0,8(sp)
     500:	01010113          	add	sp,sp,16
     504:	00008067          	ret

00000508 <_Z12do_game_overv>:
     508:	fe010113          	add	sp,sp,-32
     50c:	00112e23          	sw	ra,28(sp)
     510:	00812c23          	sw	s0,24(sp)
     514:	02010413          	add	s0,sp,32
     518:	00200713          	li	a4,2
     51c:	02e02023          	sw	a4,32(zero) # 20 <state>
     520:	04400593          	li	a1,68
     524:	00e00513          	li	a0,14
     528:	525000ef          	jal	124c <_Z22print_string_at_centerILj27EEjjRAT__Kc>
     52c:	fea42623          	sw	a0,-20(s0)
     530:	0cc00513          	li	a0,204
     534:	734000ef          	jal	c68 <_ZN5Snake4sizeEv>
     538:	00050793          	mv	a5,a0
     53c:	ffc78793          	add	a5,a5,-4
     540:	00078613          	mv	a2,a5
     544:	fec42583          	lw	a1,-20(s0)
     548:	00e00513          	li	a0,14
     54c:	e15ff0ef          	jal	360 <_Z12print_uint32jjm>
     550:	00000013          	nop
     554:	01c12083          	lw	ra,28(sp)
     558:	01812403          	lw	s0,24(sp)
     55c:	02010113          	add	sp,sp,32
     560:	00008067          	ret

00000564 <_Z14do_game_finishv>:
     564:	fe010113          	add	sp,sp,-32
     568:	00112e23          	sw	ra,28(sp)
     56c:	00812c23          	sw	s0,24(sp)
     570:	02010413          	add	s0,sp,32
     574:	00200713          	li	a4,2
     578:	02e02023          	sw	a4,32(zero) # 20 <state>
     57c:	06000593          	li	a1,96
     580:	00e00513          	li	a0,14
     584:	50d000ef          	jal	1290 <_Z22print_string_at_centerILj25EEjjRAT__Kc>
     588:	fea42623          	sw	a0,-20(s0)
     58c:	0cc00513          	li	a0,204
     590:	6d8000ef          	jal	c68 <_ZN5Snake4sizeEv>
     594:	00050793          	mv	a5,a0
     598:	ffc78793          	add	a5,a5,-4
     59c:	00078613          	mv	a2,a5
     5a0:	fec42583          	lw	a1,-20(s0)
     5a4:	00e00513          	li	a0,14
     5a8:	db9ff0ef          	jal	360 <_Z12print_uint32jjm>
     5ac:	00000013          	nop
     5b0:	01c12083          	lw	ra,28(sp)
     5b4:	01812403          	lw	s0,24(sp)
     5b8:	02010113          	add	sp,sp,32
     5bc:	00008067          	ret

000005c0 <_Z13do_game_pausev>:
     5c0:	fe010113          	add	sp,sp,-32
     5c4:	00112e23          	sw	ra,28(sp)
     5c8:	00812c23          	sw	s0,24(sp)
     5cc:	02010413          	add	s0,sp,32
     5d0:	fe042623          	sw	zero,-20(s0)
     5d4:	03c0006f          	j	610 <_Z13do_game_pausev+0x50>
     5d8:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     5dc:	46078713          	add	a4,a5,1120
     5e0:	fec42783          	lw	a5,-20(s0)
     5e4:	02278793          	add	a5,a5,34
     5e8:	00f707b3          	add	a5,a4,a5
     5ec:	0007c783          	lbu	a5,0(a5)
     5f0:	0ff7f713          	zext.b	a4,a5
     5f4:	2dc00693          	li	a3,732
     5f8:	fec42783          	lw	a5,-20(s0)
     5fc:	00f687b3          	add	a5,a3,a5
     600:	00e78023          	sb	a4,0(a5)
     604:	fec42783          	lw	a5,-20(s0)
     608:	00178793          	add	a5,a5,1
     60c:	fef42623          	sw	a5,-20(s0)
     610:	fec42703          	lw	a4,-20(s0)
     614:	00b00793          	li	a5,11
     618:	fce7f0e3          	bgeu	a5,a4,5d8 <_Z13do_game_pausev+0x18>
     61c:	fe042423          	sw	zero,-24(s0)
     620:	03c0006f          	j	65c <_Z13do_game_pausev+0x9c>
     624:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     628:	4b078713          	add	a4,a5,1200
     62c:	fe842783          	lw	a5,-24(s0)
     630:	01c78793          	add	a5,a5,28
     634:	00f707b3          	add	a5,a4,a5
     638:	0007c783          	lbu	a5,0(a5)
     63c:	0ff7f713          	zext.b	a4,a5
     640:	2e800693          	li	a3,744
     644:	fe842783          	lw	a5,-24(s0)
     648:	00f687b3          	add	a5,a3,a5
     64c:	00e78023          	sb	a4,0(a5)
     650:	fe842783          	lw	a5,-24(s0)
     654:	00178793          	add	a5,a5,1
     658:	fef42423          	sw	a5,-24(s0)
     65c:	fe842703          	lw	a4,-24(s0)
     660:	01700793          	li	a5,23
     664:	fce7f0e3          	bgeu	a5,a4,624 <_Z13do_game_pausev+0x64>
     668:	07c00593          	li	a1,124
     66c:	00e00513          	li	a0,14
     670:	465000ef          	jal	12d4 <_Z22print_string_at_centerILj12EEjjRAT__Kc>
     674:	08800593          	li	a1,136
     678:	00f00513          	li	a0,15
     67c:	49d000ef          	jal	1318 <_Z22print_string_at_centerILj24EEjjRAT__Kc>
     680:	00100713          	li	a4,1
     684:	02e02023          	sw	a4,32(zero) # 20 <state>
     688:	00000013          	nop
     68c:	01c12083          	lw	ra,28(sp)
     690:	01812403          	lw	s0,24(sp)
     694:	02010113          	add	sp,sp,32
     698:	00008067          	ret

0000069c <_Z15do_game_unpausev>:
     69c:	fe010113          	add	sp,sp,-32
     6a0:	00812e23          	sw	s0,28(sp)
     6a4:	02010413          	add	s0,sp,32
     6a8:	fe042623          	sw	zero,-20(s0)
     6ac:	0380006f          	j	6e4 <_Z15do_game_unpausev+0x48>
     6b0:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     6b4:	46078693          	add	a3,a5,1120
     6b8:	fec42783          	lw	a5,-20(s0)
     6bc:	02278793          	add	a5,a5,34
     6c0:	2dc00613          	li	a2,732
     6c4:	fec42703          	lw	a4,-20(s0)
     6c8:	00e60733          	add	a4,a2,a4
     6cc:	00074703          	lbu	a4,0(a4)
     6d0:	00f687b3          	add	a5,a3,a5
     6d4:	00e78023          	sb	a4,0(a5)
     6d8:	fec42783          	lw	a5,-20(s0)
     6dc:	00178793          	add	a5,a5,1
     6e0:	fef42623          	sw	a5,-20(s0)
     6e4:	fec42703          	lw	a4,-20(s0)
     6e8:	00b00793          	li	a5,11
     6ec:	fce7f2e3          	bgeu	a5,a4,6b0 <_Z15do_game_unpausev+0x14>
     6f0:	fe042423          	sw	zero,-24(s0)
     6f4:	0380006f          	j	72c <_Z15do_game_unpausev+0x90>
     6f8:	30002783          	lw	a5,768(zero) # 300 <video_memory_2d>
     6fc:	4b078693          	add	a3,a5,1200
     700:	fe842783          	lw	a5,-24(s0)
     704:	01c78793          	add	a5,a5,28
     708:	2e800613          	li	a2,744
     70c:	fe842703          	lw	a4,-24(s0)
     710:	00e60733          	add	a4,a2,a4
     714:	00074703          	lbu	a4,0(a4)
     718:	00f687b3          	add	a5,a3,a5
     71c:	00e78023          	sb	a4,0(a5)
     720:	fe842783          	lw	a5,-24(s0)
     724:	00178793          	add	a5,a5,1
     728:	fef42423          	sw	a5,-24(s0)
     72c:	fe842703          	lw	a4,-24(s0)
     730:	01700793          	li	a5,23
     734:	fce7f2e3          	bgeu	a5,a4,6f8 <_Z15do_game_unpausev+0x5c>
     738:	02002023          	sw	zero,32(zero) # 20 <state>
     73c:	00000013          	nop
     740:	01c12403          	lw	s0,28(sp)
     744:	02010113          	add	sp,sp,32
     748:	00008067          	ret

0000074c <_Z10game_cyclev>:
     74c:	ff010113          	add	sp,sp,-16
     750:	00112623          	sw	ra,12(sp)
     754:	00812423          	sw	s0,8(sp)
     758:	01010413          	add	s0,sp,16
     75c:	0cc00513          	li	a0,204
     760:	3f8000ef          	jal	b58 <_ZN5Snake9get_inputEv>
     764:	02002783          	lw	a5,32(zero) # 20 <state>
     768:	06079663          	bnez	a5,7d4 <_Z10game_cyclev+0x88>
     76c:	0cc00513          	li	a0,204
     770:	558000ef          	jal	cc8 <_ZN5Snake9move_headEv>
     774:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     778:	00078593          	mv	a1,a5
     77c:	0cc00513          	li	a0,204
     780:	7e0000ef          	jal	f60 <_ZN5Snake9is_eatingEj>
     784:	00050793          	mv	a5,a0
     788:	02078863          	beqz	a5,7b8 <_Z10game_cyclev+0x6c>
     78c:	0cc00513          	li	a0,204
     790:	4d8000ef          	jal	c68 <_ZN5Snake4sizeEv>
     794:	00050793          	mv	a5,a0
     798:	f0078793          	add	a5,a5,-256
     79c:	0017b793          	seqz	a5,a5
     7a0:	0ff7f793          	zext.b	a5,a5
     7a4:	00078663          	beqz	a5,7b0 <_Z10game_cyclev+0x64>
     7a8:	dbdff0ef          	jal	564 <_Z14do_game_finishv>
     7ac:	0280006f          	j	7d4 <_Z10game_cyclev+0x88>
     7b0:	118000ef          	jal	8c8 <_Z11place_snackv>
     7b4:	0200006f          	j	7d4 <_Z10game_cyclev+0x88>
     7b8:	0cc00513          	li	a0,204
     7bc:	6b8000ef          	jal	e74 <_ZN5Snake9move_tailEv>
     7c0:	0cc00513          	li	a0,204
     7c4:	1a1000ef          	jal	1164 <_ZN5Snake17has_head_accidentEv>
     7c8:	00050793          	mv	a5,a0
     7cc:	00078463          	beqz	a5,7d4 <_Z10game_cyclev+0x88>
     7d0:	d39ff0ef          	jal	508 <_Z12do_game_overv>
     7d4:	00000013          	nop
     7d8:	00c12083          	lw	ra,12(sp)
     7dc:	00812403          	lw	s0,8(sp)
     7e0:	01010113          	add	sp,sp,16
     7e4:	00008067          	ret

000007e8 <_Z11place_wallsv>:
     7e8:	fe010113          	add	sp,sp,-32
     7ec:	00812e23          	sw	s0,28(sp)
     7f0:	02010413          	add	s0,sp,32
     7f4:	fe042623          	sw	zero,-20(s0)
     7f8:	0440006f          	j	83c <_gbl_ptr+0x3c>
     7fc:	30002703          	lw	a4,768(zero) # 300 <video_memory_2d>
     800:	fec42783          	lw	a5,-20(s0)
     804:	00f707b3          	add	a5,a4,a5
     808:	f8700713          	li	a4,-121
     80c:	00e78023          	sb	a4,0(a5)
     810:	30002703          	lw	a4,768(zero) # 300 <video_memory_2d>
     814:	000017b7          	lui	a5,0x1
     818:	91078793          	add	a5,a5,-1776 # 910 <_Z11place_snackv+0x48>
     81c:	00f70733          	add	a4,a4,a5
     820:	fec42783          	lw	a5,-20(s0)
     824:	00f707b3          	add	a5,a4,a5
     828:	f8700713          	li	a4,-121
     82c:	00e78023          	sb	a4,0(a5)
     830:	fec42783          	lw	a5,-20(s0)
     834:	00178793          	add	a5,a5,1
     838:	fef42623          	sw	a5,-20(s0)
     83c:	fec42703          	lw	a4,-20(s0)
     840:	04f00793          	li	a5,79
     844:	fae7fce3          	bgeu	a5,a4,7fc <_Z11place_wallsv+0x14>
     848:	00100793          	li	a5,1
     84c:	fef42423          	sw	a5,-24(s0)
     850:	0580006f          	j	8a8 <_gbl_ptr+0xa8>
     854:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     858:	fe842703          	lw	a4,-24(s0)
     85c:	00070793          	mv	a5,a4
     860:	00279793          	sll	a5,a5,0x2
     864:	00e787b3          	add	a5,a5,a4
     868:	00479793          	sll	a5,a5,0x4
     86c:	00f687b3          	add	a5,a3,a5
     870:	f8700713          	li	a4,-121
     874:	00e78023          	sb	a4,0(a5)
     878:	30002683          	lw	a3,768(zero) # 300 <video_memory_2d>
     87c:	fe842703          	lw	a4,-24(s0)
     880:	00070793          	mv	a5,a4
     884:	00279793          	sll	a5,a5,0x2
     888:	00e787b3          	add	a5,a5,a4
     88c:	00479793          	sll	a5,a5,0x4
     890:	00f687b3          	add	a5,a3,a5
     894:	f8700713          	li	a4,-121
     898:	04e787a3          	sb	a4,79(a5)
     89c:	fe842783          	lw	a5,-24(s0)
     8a0:	00178793          	add	a5,a5,1
     8a4:	fef42423          	sw	a5,-24(s0)
     8a8:	fe842703          	lw	a4,-24(s0)
     8ac:	01c00793          	li	a5,28
     8b0:	fae7f2e3          	bgeu	a5,a4,854 <_gbl_ptr+0x54>
     8b4:	00000013          	nop
     8b8:	00000013          	nop
     8bc:	01c12403          	lw	s0,28(sp)
     8c0:	02010113          	add	sp,sp,32
     8c4:	00008067          	ret

000008c8 <_Z11place_snackv>:
     8c8:	fe010113          	add	sp,sp,-32
     8cc:	00112e23          	sw	ra,28(sp)
     8d0:	00812c23          	sw	s0,24(sp)
     8d4:	02010413          	add	s0,sp,32
     8d8:	fe042623          	sw	zero,-20(s0)
     8dc:	fec42703          	lw	a4,-20(s0)
     8e0:	06400793          	li	a5,100
     8e4:	02e7f463          	bgeu	a5,a4,90c <_Z11place_snackv+0x44>
     8e8:	0a000593          	li	a1,160
     8ec:	00000513          	li	a0,0
     8f0:	26d000ef          	jal	135c <_Z22print_string_at_centerILj43EEjjRAT__Kc>
     8f4:	fea42423          	sw	a0,-24(s0)
     8f8:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     8fc:	00078613          	mv	a2,a5
     900:	fe842583          	lw	a1,-24(s0)
     904:	00000513          	li	a0,0
     908:	a59ff0ef          	jal	360 <_Z12print_uint32jjm>
     90c:	8b5ff0ef          	jal	1c0 <_Z16get_random_valuev>
     910:	00050793          	mv	a5,a0
     914:	ffe7f713          	and	a4,a5,-2
     918:	30e02423          	sw	a4,776(zero) # 308 <snack_coord>
     91c:	fec42783          	lw	a5,-20(s0)
     920:	00178793          	add	a5,a5,1
     924:	fef42623          	sw	a5,-20(s0)
     928:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     92c:	00078593          	mv	a1,a5
     930:	0cc00513          	li	a0,204
     934:	680000ef          	jal	fb4 <_ZN5Snake17has_collided_withEj>
     938:	00050793          	mv	a5,a0
     93c:	00079e63          	bnez	a5,958 <_Z11place_snackv+0x90>
     940:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     944:	00078593          	mv	a1,a5
     948:	0cc00513          	li	a0,204
     94c:	614000ef          	jal	f60 <_ZN5Snake9is_eatingEj>
     950:	00050793          	mv	a5,a0
     954:	00078663          	beqz	a5,960 <_Z11place_snackv+0x98>
     958:	00100793          	li	a5,1
     95c:	0080006f          	j	964 <_Z11place_snackv+0x9c>
     960:	00000793          	li	a5,0
     964:	f6079ce3          	bnez	a5,8dc <_Z11place_snackv+0x14>
     968:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     96c:	30802783          	lw	a5,776(zero) # 308 <snack_coord>
     970:	00f707b3          	add	a5,a4,a5
     974:	f8600713          	li	a4,-122
     978:	00e78023          	sb	a4,0(a5)
     97c:	00000013          	nop
     980:	01c12083          	lw	ra,28(sp)
     984:	01812403          	lw	s0,24(sp)
     988:	02010113          	add	sp,sp,32
     98c:	00008067          	ret

00000990 <_ZN5SnakeC1Ev>:
     990:	fe010113          	add	sp,sp,-32
     994:	00812e23          	sw	s0,28(sp)
     998:	02010413          	add	s0,sp,32
     99c:	fea42623          	sw	a0,-20(s0)
     9a0:	00000013          	nop
     9a4:	01c12403          	lw	s0,28(sp)
     9a8:	02010113          	add	sp,sp,32
     9ac:	00008067          	ret

000009b0 <_ZN5Snake14turn_connectorE9directionS0_>:
     9b0:	fe010113          	add	sp,sp,-32
     9b4:	00812e23          	sw	s0,28(sp)
     9b8:	02010413          	add	s0,sp,32
     9bc:	fea42623          	sw	a0,-20(s0)
     9c0:	feb42423          	sw	a1,-24(s0)
     9c4:	fec42223          	sw	a2,-28(s0)
     9c8:	fe842703          	lw	a4,-24(s0)
     9cc:	05000793          	li	a5,80
     9d0:	00f71863          	bne	a4,a5,9e0 <_ZN5Snake14turn_connectorE9directionS0_+0x30>
     9d4:	fe442703          	lw	a4,-28(s0)
     9d8:	00200793          	li	a5,2
     9dc:	00f70e63          	beq	a4,a5,9f8 <_ZN5Snake14turn_connectorE9directionS0_+0x48>
     9e0:	fe842703          	lw	a4,-24(s0)
     9e4:	ffe00793          	li	a5,-2
     9e8:	00f71c63          	bne	a4,a5,a00 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     9ec:	fe442703          	lw	a4,-28(s0)
     9f0:	fb000793          	li	a5,-80
     9f4:	00f71663          	bne	a4,a5,a00 <_ZN5Snake14turn_connectorE9directionS0_+0x50>
     9f8:	08100793          	li	a5,129
     9fc:	0b00006f          	j	aac <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a00:	fe842703          	lw	a4,-24(s0)
     a04:	05000793          	li	a5,80
     a08:	00f71863          	bne	a4,a5,a18 <_ZN5Snake14turn_connectorE9directionS0_+0x68>
     a0c:	fe442703          	lw	a4,-28(s0)
     a10:	ffe00793          	li	a5,-2
     a14:	00f70e63          	beq	a4,a5,a30 <_ZN5Snake14turn_connectorE9directionS0_+0x80>
     a18:	fe842703          	lw	a4,-24(s0)
     a1c:	00200793          	li	a5,2
     a20:	00f71c63          	bne	a4,a5,a38 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a24:	fe442703          	lw	a4,-28(s0)
     a28:	fb000793          	li	a5,-80
     a2c:	00f71663          	bne	a4,a5,a38 <_ZN5Snake14turn_connectorE9directionS0_+0x88>
     a30:	08200793          	li	a5,130
     a34:	0780006f          	j	aac <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a38:	fe842703          	lw	a4,-24(s0)
     a3c:	fb000793          	li	a5,-80
     a40:	00f71863          	bne	a4,a5,a50 <_ZN5Snake14turn_connectorE9directionS0_+0xa0>
     a44:	fe442703          	lw	a4,-28(s0)
     a48:	ffe00793          	li	a5,-2
     a4c:	00f70e63          	beq	a4,a5,a68 <_ZN5Snake14turn_connectorE9directionS0_+0xb8>
     a50:	fe842703          	lw	a4,-24(s0)
     a54:	00200793          	li	a5,2
     a58:	00f71c63          	bne	a4,a5,a70 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a5c:	fe442703          	lw	a4,-28(s0)
     a60:	05000793          	li	a5,80
     a64:	00f71663          	bne	a4,a5,a70 <_ZN5Snake14turn_connectorE9directionS0_+0xc0>
     a68:	08300793          	li	a5,131
     a6c:	0400006f          	j	aac <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     a70:	fe842703          	lw	a4,-24(s0)
     a74:	fb000793          	li	a5,-80
     a78:	00f71863          	bne	a4,a5,a88 <_ZN5Snake14turn_connectorE9directionS0_+0xd8>
     a7c:	fe442703          	lw	a4,-28(s0)
     a80:	00200793          	li	a5,2
     a84:	00f70e63          	beq	a4,a5,aa0 <_ZN5Snake14turn_connectorE9directionS0_+0xf0>
     a88:	fe842703          	lw	a4,-24(s0)
     a8c:	ffe00793          	li	a5,-2
     a90:	00f71c63          	bne	a4,a5,aa8 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     a94:	fe442703          	lw	a4,-28(s0)
     a98:	05000793          	li	a5,80
     a9c:	00f71663          	bne	a4,a5,aa8 <_ZN5Snake14turn_connectorE9directionS0_+0xf8>
     aa0:	08400793          	li	a5,132
     aa4:	0080006f          	j	aac <_ZN5Snake14turn_connectorE9directionS0_+0xfc>
     aa8:	07c00793          	li	a5,124
     aac:	00078513          	mv	a0,a5
     ab0:	01c12403          	lw	s0,28(sp)
     ab4:	02010113          	add	sp,sp,32
     ab8:	00008067          	ret

00000abc <_ZN5Snake5resetEv>:
     abc:	fd010113          	add	sp,sp,-48
     ac0:	02112623          	sw	ra,44(sp)
     ac4:	02812423          	sw	s0,40(sp)
     ac8:	03010413          	add	s0,sp,48
     acc:	fca42e23          	sw	a0,-36(s0)
     ad0:	fdc42783          	lw	a5,-36(s0)
     ad4:	0007a023          	sw	zero,0(a5)
     ad8:	fdc42783          	lw	a5,-36(s0)
     adc:	0007a223          	sw	zero,4(a5)
     ae0:	fdc42783          	lw	a5,-36(s0)
     ae4:	00200713          	li	a4,2
     ae8:	00e7a423          	sw	a4,8(a5)
     aec:	fdc42783          	lw	a5,-36(s0)
     af0:	00200713          	li	a4,2
     af4:	00e7a623          	sw	a4,12(a5)
     af8:	fdc42783          	lw	a5,-36(s0)
     afc:	0047a783          	lw	a5,4(a5)
     b00:	fdc42703          	lw	a4,-36(s0)
     b04:	00878793          	add	a5,a5,8
     b08:	00179793          	sll	a5,a5,0x1
     b0c:	00f707b3          	add	a5,a4,a5
     b10:	4ba00713          	li	a4,1210
     b14:	00e79023          	sh	a4,0(a5)
     b18:	fe042623          	sw	zero,-20(s0)
     b1c:	0180006f          	j	b34 <_ZN5Snake5resetEv+0x78>
     b20:	fdc42503          	lw	a0,-36(s0)
     b24:	1a4000ef          	jal	cc8 <_ZN5Snake9move_headEv>
     b28:	fec42783          	lw	a5,-20(s0)
     b2c:	00178793          	add	a5,a5,1
     b30:	fef42623          	sw	a5,-20(s0)
     b34:	fec42703          	lw	a4,-20(s0)
     b38:	00200793          	li	a5,2
     b3c:	fee7f2e3          	bgeu	a5,a4,b20 <_ZN5Snake5resetEv+0x64>
     b40:	00000013          	nop
     b44:	00000013          	nop
     b48:	02c12083          	lw	ra,44(sp)
     b4c:	02812403          	lw	s0,40(sp)
     b50:	03010113          	add	sp,sp,48
     b54:	00008067          	ret

00000b58 <_ZN5Snake9get_inputEv>:
     b58:	fd010113          	add	sp,sp,-48
     b5c:	02112623          	sw	ra,44(sp)
     b60:	02812423          	sw	s0,40(sp)
     b64:	03010413          	add	s0,sp,48
     b68:	fca42e23          	sw	a0,-36(s0)
     b6c:	feb40793          	add	a5,s0,-21
     b70:	00078513          	mv	a0,a5
     b74:	e04ff0ef          	jal	178 <_Z7get_keyRh>
     b78:	00050793          	mv	a5,a0
     b7c:	0c078e63          	beqz	a5,c58 <_ZN5Snake9get_inputEv+0x100>
     b80:	02002703          	lw	a4,32(zero) # 20 <state>
     b84:	00100793          	li	a5,1
     b88:	00f71c63          	bne	a4,a5,ba0 <_ZN5Snake9get_inputEv+0x48>
     b8c:	feb44703          	lbu	a4,-21(s0)
     b90:	05a00793          	li	a5,90
     b94:	0cf71063          	bne	a4,a5,c54 <_ZN5Snake9get_inputEv+0xfc>
     b98:	b05ff0ef          	jal	69c <_Z15do_game_unpausev>
     b9c:	0bc0006f          	j	c58 <_ZN5Snake9get_inputEv+0x100>
     ba0:	02002023          	sw	zero,32(zero) # 20 <state>
     ba4:	fdc42783          	lw	a5,-36(s0)
     ba8:	0087a783          	lw	a5,8(a5)
     bac:	fef42623          	sw	a5,-20(s0)
     bb0:	feb44783          	lbu	a5,-21(s0)
     bb4:	07600713          	li	a4,118
     bb8:	06e78863          	beq	a5,a4,c28 <_ZN5Snake9get_inputEv+0xd0>
     bbc:	07600713          	li	a4,118
     bc0:	06f74863          	blt	a4,a5,c30 <_ZN5Snake9get_inputEv+0xd8>
     bc4:	02300713          	li	a4,35
     bc8:	04e78a63          	beq	a5,a4,c1c <_ZN5Snake9get_inputEv+0xc4>
     bcc:	02300713          	li	a4,35
     bd0:	06f74063          	blt	a4,a5,c30 <_ZN5Snake9get_inputEv+0xd8>
     bd4:	01d00713          	li	a4,29
     bd8:	02e78063          	beq	a5,a4,bf8 <_ZN5Snake9get_inputEv+0xa0>
     bdc:	01d00713          	li	a4,29
     be0:	04f74863          	blt	a4,a5,c30 <_ZN5Snake9get_inputEv+0xd8>
     be4:	01b00713          	li	a4,27
     be8:	02e78463          	beq	a5,a4,c10 <_ZN5Snake9get_inputEv+0xb8>
     bec:	01c00713          	li	a4,28
     bf0:	00e78a63          	beq	a5,a4,c04 <_ZN5Snake9get_inputEv+0xac>
     bf4:	03c0006f          	j	c30 <_ZN5Snake9get_inputEv+0xd8>
     bf8:	fb000793          	li	a5,-80
     bfc:	fef42623          	sw	a5,-20(s0)
     c00:	0300006f          	j	c30 <_ZN5Snake9get_inputEv+0xd8>
     c04:	ffe00793          	li	a5,-2
     c08:	fef42623          	sw	a5,-20(s0)
     c0c:	0240006f          	j	c30 <_ZN5Snake9get_inputEv+0xd8>
     c10:	05000793          	li	a5,80
     c14:	fef42623          	sw	a5,-20(s0)
     c18:	0180006f          	j	c30 <_ZN5Snake9get_inputEv+0xd8>
     c1c:	00200793          	li	a5,2
     c20:	fef42623          	sw	a5,-20(s0)
     c24:	00c0006f          	j	c30 <_ZN5Snake9get_inputEv+0xd8>
     c28:	999ff0ef          	jal	5c0 <_Z13do_game_pausev>
     c2c:	00000013          	nop
     c30:	fdc42783          	lw	a5,-36(s0)
     c34:	0087a783          	lw	a5,8(a5)
     c38:	40f007b3          	neg	a5,a5
     c3c:	fec42703          	lw	a4,-20(s0)
     c40:	00f70c63          	beq	a4,a5,c58 <_ZN5Snake9get_inputEv+0x100>
     c44:	fdc42783          	lw	a5,-36(s0)
     c48:	fec42703          	lw	a4,-20(s0)
     c4c:	00e7a423          	sw	a4,8(a5)
     c50:	0080006f          	j	c58 <_ZN5Snake9get_inputEv+0x100>
     c54:	00000013          	nop
     c58:	02c12083          	lw	ra,44(sp)
     c5c:	02812403          	lw	s0,40(sp)
     c60:	03010113          	add	sp,sp,48
     c64:	00008067          	ret

00000c68 <_ZN5Snake4sizeEv>:
     c68:	fd010113          	add	sp,sp,-48
     c6c:	02812623          	sw	s0,44(sp)
     c70:	03010413          	add	s0,sp,48
     c74:	fca42e23          	sw	a0,-36(s0)
     c78:	10000793          	li	a5,256
     c7c:	fef42623          	sw	a5,-20(s0)
     c80:	fdc42783          	lw	a5,-36(s0)
     c84:	0007a703          	lw	a4,0(a5)
     c88:	fdc42783          	lw	a5,-36(s0)
     c8c:	0047a783          	lw	a5,4(a5)
     c90:	40f707b3          	sub	a5,a4,a5
     c94:	10178793          	add	a5,a5,257
     c98:	0ff7f793          	zext.b	a5,a5
     c9c:	fef42423          	sw	a5,-24(s0)
     ca0:	fe842783          	lw	a5,-24(s0)
     ca4:	00078863          	beqz	a5,cb4 <_ZN5Snake4sizeEv+0x4c>
     ca8:	fe840793          	add	a5,s0,-24
     cac:	0007a783          	lw	a5,0(a5)
     cb0:	0080006f          	j	cb8 <_ZN5Snake4sizeEv+0x50>
     cb4:	10000793          	li	a5,256
     cb8:	00078513          	mv	a0,a5
     cbc:	02c12403          	lw	s0,44(sp)
     cc0:	03010113          	add	sp,sp,48
     cc4:	00008067          	ret

00000cc8 <_ZN5Snake9move_headEv>:
     cc8:	fd010113          	add	sp,sp,-48
     ccc:	02112623          	sw	ra,44(sp)
     cd0:	02812423          	sw	s0,40(sp)
     cd4:	02912223          	sw	s1,36(sp)
     cd8:	03010413          	add	s0,sp,48
     cdc:	fca42e23          	sw	a0,-36(s0)
     ce0:	fdc42783          	lw	a5,-36(s0)
     ce4:	0007a783          	lw	a5,0(a5)
     ce8:	fdc42703          	lw	a4,-36(s0)
     cec:	00878793          	add	a5,a5,8
     cf0:	00179793          	sll	a5,a5,0x1
     cf4:	00f707b3          	add	a5,a4,a5
     cf8:	0007d783          	lhu	a5,0(a5)
     cfc:	fef42623          	sw	a5,-20(s0)
     d00:	fdc42783          	lw	a5,-36(s0)
     d04:	0087a783          	lw	a5,8(a5)
     d08:	00078713          	mv	a4,a5
     d0c:	fec42783          	lw	a5,-20(s0)
     d10:	00e787b3          	add	a5,a5,a4
     d14:	fef42423          	sw	a5,-24(s0)
     d18:	fdc42783          	lw	a5,-36(s0)
     d1c:	0087a703          	lw	a4,8(a5)
     d20:	fdc42783          	lw	a5,-36(s0)
     d24:	00c7a783          	lw	a5,12(a5)
     d28:	04f71263          	bne	a4,a5,d6c <_ZN5Snake9move_headEv+0xa4>
     d2c:	fdc42783          	lw	a5,-36(s0)
     d30:	0087a703          	lw	a4,8(a5)
     d34:	fb000793          	li	a5,-80
     d38:	00f70a63          	beq	a4,a5,d4c <_ZN5Snake9move_headEv+0x84>
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	0087a703          	lw	a4,8(a5)
     d44:	05000793          	li	a5,80
     d48:	00f71663          	bne	a4,a5,d54 <_ZN5Snake9move_headEv+0x8c>
     d4c:	07c00793          	li	a5,124
     d50:	0080006f          	j	d58 <_ZN5Snake9move_headEv+0x90>
     d54:	02d00793          	li	a5,45
     d58:	30402683          	lw	a3,772(zero) # 304 <video_memory_1d>
     d5c:	fec42703          	lw	a4,-20(s0)
     d60:	00e68733          	add	a4,a3,a4
     d64:	00f70023          	sb	a5,0(a4)
     d68:	0340006f          	j	d9c <_ZN5Snake9move_headEv+0xd4>
     d6c:	fdc42783          	lw	a5,-36(s0)
     d70:	00c7a683          	lw	a3,12(a5)
     d74:	fdc42783          	lw	a5,-36(s0)
     d78:	0087a603          	lw	a2,8(a5)
     d7c:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     d80:	fec42783          	lw	a5,-20(s0)
     d84:	00f704b3          	add	s1,a4,a5
     d88:	00068593          	mv	a1,a3
     d8c:	fdc42503          	lw	a0,-36(s0)
     d90:	c21ff0ef          	jal	9b0 <_ZN5Snake14turn_connectorE9directionS0_>
     d94:	00050793          	mv	a5,a0
     d98:	00f48023          	sb	a5,0(s1)
     d9c:	fdc42783          	lw	a5,-36(s0)
     da0:	0087a703          	lw	a4,8(a5)
     da4:	00200793          	li	a5,2
     da8:	00f70a63          	beq	a4,a5,dbc <_ZN5Snake9move_headEv+0xf4>
     dac:	fdc42783          	lw	a5,-36(s0)
     db0:	0087a703          	lw	a4,8(a5)
     db4:	ffe00793          	li	a5,-2
     db8:	04f71063          	bne	a4,a5,df8 <_ZN5Snake9move_headEv+0x130>
     dbc:	fdc42783          	lw	a5,-36(s0)
     dc0:	0087a703          	lw	a4,8(a5)
     dc4:	00200793          	li	a5,2
     dc8:	00f71863          	bne	a4,a5,dd8 <_ZN5Snake9move_headEv+0x110>
     dcc:	fec42783          	lw	a5,-20(s0)
     dd0:	00178793          	add	a5,a5,1
     dd4:	00c0006f          	j	de0 <_ZN5Snake9move_headEv+0x118>
     dd8:	fec42783          	lw	a5,-20(s0)
     ddc:	fff78793          	add	a5,a5,-1
     de0:	fef42223          	sw	a5,-28(s0)
     de4:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     de8:	fe442783          	lw	a5,-28(s0)
     dec:	00f707b3          	add	a5,a4,a5
     df0:	f8500713          	li	a4,-123
     df4:	00e78023          	sb	a4,0(a5)
     df8:	fdc42783          	lw	a5,-36(s0)
     dfc:	0087a703          	lw	a4,8(a5)
     e00:	fdc42783          	lw	a5,-36(s0)
     e04:	00e7a623          	sw	a4,12(a5)
     e08:	fdc42783          	lw	a5,-36(s0)
     e0c:	0007a783          	lw	a5,0(a5)
     e10:	00178793          	add	a5,a5,1
     e14:	0ff7f713          	zext.b	a4,a5
     e18:	fdc42783          	lw	a5,-36(s0)
     e1c:	00e7a023          	sw	a4,0(a5)
     e20:	fdc42783          	lw	a5,-36(s0)
     e24:	0007a783          	lw	a5,0(a5)
     e28:	fe842703          	lw	a4,-24(s0)
     e2c:	01071713          	sll	a4,a4,0x10
     e30:	01075713          	srl	a4,a4,0x10
     e34:	fdc42683          	lw	a3,-36(s0)
     e38:	00878793          	add	a5,a5,8
     e3c:	00179793          	sll	a5,a5,0x1
     e40:	00f687b3          	add	a5,a3,a5
     e44:	00e79023          	sh	a4,0(a5)
     e48:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     e4c:	fe842783          	lw	a5,-24(s0)
     e50:	00f707b3          	add	a5,a4,a5
     e54:	06f00713          	li	a4,111
     e58:	00e78023          	sb	a4,0(a5)
     e5c:	00000013          	nop
     e60:	02c12083          	lw	ra,44(sp)
     e64:	02812403          	lw	s0,40(sp)
     e68:	02412483          	lw	s1,36(sp)
     e6c:	03010113          	add	sp,sp,48
     e70:	00008067          	ret

00000e74 <_ZN5Snake9move_tailEv>:
     e74:	fd010113          	add	sp,sp,-48
     e78:	02812623          	sw	s0,44(sp)
     e7c:	03010413          	add	s0,sp,48
     e80:	fca42e23          	sw	a0,-36(s0)
     e84:	fdc42783          	lw	a5,-36(s0)
     e88:	0047a783          	lw	a5,4(a5)
     e8c:	fdc42703          	lw	a4,-36(s0)
     e90:	00878793          	add	a5,a5,8
     e94:	00179793          	sll	a5,a5,0x1
     e98:	00f707b3          	add	a5,a4,a5
     e9c:	0007d783          	lhu	a5,0(a5)
     ea0:	fef42623          	sw	a5,-20(s0)
     ea4:	fdc42783          	lw	a5,-36(s0)
     ea8:	0047a783          	lw	a5,4(a5)
     eac:	00178793          	add	a5,a5,1
     eb0:	0ff7f793          	zext.b	a5,a5
     eb4:	fef42423          	sw	a5,-24(s0)
     eb8:	fdc42703          	lw	a4,-36(s0)
     ebc:	fe842783          	lw	a5,-24(s0)
     ec0:	00878793          	add	a5,a5,8
     ec4:	00179793          	sll	a5,a5,0x1
     ec8:	00f707b3          	add	a5,a4,a5
     ecc:	0007d783          	lhu	a5,0(a5)
     ed0:	fef42223          	sw	a5,-28(s0)
     ed4:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     ed8:	fec42783          	lw	a5,-20(s0)
     edc:	00f707b3          	add	a5,a4,a5
     ee0:	02000713          	li	a4,32
     ee4:	00e78023          	sb	a4,0(a5)
     ee8:	fe442703          	lw	a4,-28(s0)
     eec:	fec42783          	lw	a5,-20(s0)
     ef0:	40f707b3          	sub	a5,a4,a5
     ef4:	fef42023          	sw	a5,-32(s0)
     ef8:	fe042703          	lw	a4,-32(s0)
     efc:	00200793          	li	a5,2
     f00:	02f71063          	bne	a4,a5,f20 <_ZN5Snake9move_tailEv+0xac>
     f04:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     f08:	fec42783          	lw	a5,-20(s0)
     f0c:	00178793          	add	a5,a5,1
     f10:	00f707b3          	add	a5,a4,a5
     f14:	02000713          	li	a4,32
     f18:	00e78023          	sb	a4,0(a5)
     f1c:	0280006f          	j	f44 <_ZN5Snake9move_tailEv+0xd0>
     f20:	fe042703          	lw	a4,-32(s0)
     f24:	ffe00793          	li	a5,-2
     f28:	00f71e63          	bne	a4,a5,f44 <_ZN5Snake9move_tailEv+0xd0>
     f2c:	30402703          	lw	a4,772(zero) # 304 <video_memory_1d>
     f30:	fec42783          	lw	a5,-20(s0)
     f34:	fff78793          	add	a5,a5,-1
     f38:	00f707b3          	add	a5,a4,a5
     f3c:	02000713          	li	a4,32
     f40:	00e78023          	sb	a4,0(a5)
     f44:	fdc42783          	lw	a5,-36(s0)
     f48:	fe842703          	lw	a4,-24(s0)
     f4c:	00e7a223          	sw	a4,4(a5)
     f50:	00000013          	nop
     f54:	02c12403          	lw	s0,44(sp)
     f58:	03010113          	add	sp,sp,48
     f5c:	00008067          	ret

00000f60 <_ZN5Snake9is_eatingEj>:
     f60:	fe010113          	add	sp,sp,-32
     f64:	00812e23          	sw	s0,28(sp)
     f68:	02010413          	add	s0,sp,32
     f6c:	fea42623          	sw	a0,-20(s0)
     f70:	feb42423          	sw	a1,-24(s0)
     f74:	fec42783          	lw	a5,-20(s0)
     f78:	0007a783          	lw	a5,0(a5)
     f7c:	fec42703          	lw	a4,-20(s0)
     f80:	00878793          	add	a5,a5,8
     f84:	00179793          	sll	a5,a5,0x1
     f88:	00f707b3          	add	a5,a4,a5
     f8c:	0007d783          	lhu	a5,0(a5)
     f90:	00078713          	mv	a4,a5
     f94:	fe842783          	lw	a5,-24(s0)
     f98:	40e787b3          	sub	a5,a5,a4
     f9c:	0017b793          	seqz	a5,a5
     fa0:	0ff7f793          	zext.b	a5,a5
     fa4:	00078513          	mv	a0,a5
     fa8:	01c12403          	lw	s0,28(sp)
     fac:	02010113          	add	sp,sp,32
     fb0:	00008067          	ret

00000fb4 <_ZN5Snake17has_collided_withEj>:
     fb4:	fc010113          	add	sp,sp,-64
     fb8:	02112e23          	sw	ra,60(sp)
     fbc:	02812c23          	sw	s0,56(sp)
     fc0:	04010413          	add	s0,sp,64
     fc4:	fca42623          	sw	a0,-52(s0)
     fc8:	fcb42423          	sw	a1,-56(s0)
     fcc:	fc842783          	lw	a5,-56(s0)
     fd0:	05000593          	li	a1,80
     fd4:	00078513          	mv	a0,a5
     fd8:	3d0000ef          	jal	13a8 <__hidden___udivsi3>
     fdc:	00050793          	mv	a5,a0
     fe0:	fef42423          	sw	a5,-24(s0)
     fe4:	fe842783          	lw	a5,-24(s0)
     fe8:	00078863          	beqz	a5,ff8 <_ZN5Snake17has_collided_withEj+0x44>
     fec:	fe842703          	lw	a4,-24(s0)
     ff0:	01d00793          	li	a5,29
     ff4:	00f71663          	bne	a4,a5,1000 <_ZN5Snake17has_collided_withEj+0x4c>
     ff8:	00100793          	li	a5,1
     ffc:	1540006f          	j	1150 <_ZN5Snake17has_collided_withEj+0x19c>
    1000:	fc842783          	lw	a5,-56(s0)
    1004:	05000593          	li	a1,80
    1008:	00078513          	mv	a0,a5
    100c:	3e4000ef          	jal	13f0 <__umodsi3>
    1010:	00050793          	mv	a5,a0
    1014:	fef42223          	sw	a5,-28(s0)
    1018:	fe442783          	lw	a5,-28(s0)
    101c:	00078863          	beqz	a5,102c <_ZN5Snake17has_collided_withEj+0x78>
    1020:	fe442703          	lw	a4,-28(s0)
    1024:	04f00793          	li	a5,79
    1028:	00f71663          	bne	a4,a5,1034 <_ZN5Snake17has_collided_withEj+0x80>
    102c:	00100793          	li	a5,1
    1030:	1200006f          	j	1150 <_ZN5Snake17has_collided_withEj+0x19c>
    1034:	fcc42783          	lw	a5,-52(s0)
    1038:	0047a783          	lw	a5,4(a5)
    103c:	fef42623          	sw	a5,-20(s0)
    1040:	0fc0006f          	j	113c <_ZN5Snake17has_collided_withEj+0x188>
    1044:	fcc42703          	lw	a4,-52(s0)
    1048:	fec42783          	lw	a5,-20(s0)
    104c:	00878793          	add	a5,a5,8
    1050:	00179793          	sll	a5,a5,0x1
    1054:	00f707b3          	add	a5,a4,a5
    1058:	0007d783          	lhu	a5,0(a5)
    105c:	00078713          	mv	a4,a5
    1060:	fc842783          	lw	a5,-56(s0)
    1064:	00e79663          	bne	a5,a4,1070 <_ZN5Snake17has_collided_withEj+0xbc>
    1068:	00100793          	li	a5,1
    106c:	0e40006f          	j	1150 <_ZN5Snake17has_collided_withEj+0x19c>
    1070:	fec42783          	lw	a5,-20(s0)
    1074:	00178793          	add	a5,a5,1
    1078:	0ff7f793          	zext.b	a5,a5
    107c:	fef42023          	sw	a5,-32(s0)
    1080:	fcc42703          	lw	a4,-52(s0)
    1084:	fe042783          	lw	a5,-32(s0)
    1088:	00878793          	add	a5,a5,8
    108c:	00179793          	sll	a5,a5,0x1
    1090:	00f707b3          	add	a5,a4,a5
    1094:	0007d783          	lhu	a5,0(a5)
    1098:	00078693          	mv	a3,a5
    109c:	fcc42703          	lw	a4,-52(s0)
    10a0:	fec42783          	lw	a5,-20(s0)
    10a4:	00878793          	add	a5,a5,8
    10a8:	00179793          	sll	a5,a5,0x1
    10ac:	00f707b3          	add	a5,a4,a5
    10b0:	0007d783          	lhu	a5,0(a5)
    10b4:	40f687b3          	sub	a5,a3,a5
    10b8:	fcf42e23          	sw	a5,-36(s0)
    10bc:	fdc42703          	lw	a4,-36(s0)
    10c0:	00200793          	li	a5,2
    10c4:	02f71863          	bne	a4,a5,10f4 <_ZN5Snake17has_collided_withEj+0x140>
    10c8:	fcc42703          	lw	a4,-52(s0)
    10cc:	fec42783          	lw	a5,-20(s0)
    10d0:	00878793          	add	a5,a5,8
    10d4:	00179793          	sll	a5,a5,0x1
    10d8:	00f707b3          	add	a5,a4,a5
    10dc:	0007d783          	lhu	a5,0(a5)
    10e0:	00178713          	add	a4,a5,1
    10e4:	fc842783          	lw	a5,-56(s0)
    10e8:	00f71663          	bne	a4,a5,10f4 <_ZN5Snake17has_collided_withEj+0x140>
    10ec:	00100793          	li	a5,1
    10f0:	0600006f          	j	1150 <_ZN5Snake17has_collided_withEj+0x19c>
    10f4:	fdc42703          	lw	a4,-36(s0)
    10f8:	ffe00793          	li	a5,-2
    10fc:	02f71863          	bne	a4,a5,112c <_ZN5Snake17has_collided_withEj+0x178>
    1100:	fcc42703          	lw	a4,-52(s0)
    1104:	fec42783          	lw	a5,-20(s0)
    1108:	00878793          	add	a5,a5,8
    110c:	00179793          	sll	a5,a5,0x1
    1110:	00f707b3          	add	a5,a4,a5
    1114:	0007d783          	lhu	a5,0(a5)
    1118:	fff78713          	add	a4,a5,-1
    111c:	fc842783          	lw	a5,-56(s0)
    1120:	00f71663          	bne	a4,a5,112c <_ZN5Snake17has_collided_withEj+0x178>
    1124:	00100793          	li	a5,1
    1128:	0280006f          	j	1150 <_ZN5Snake17has_collided_withEj+0x19c>
    112c:	fec42783          	lw	a5,-20(s0)
    1130:	00178793          	add	a5,a5,1
    1134:	0ff7f793          	zext.b	a5,a5
    1138:	fef42623          	sw	a5,-20(s0)
    113c:	fcc42783          	lw	a5,-52(s0)
    1140:	0007a783          	lw	a5,0(a5)
    1144:	fec42703          	lw	a4,-20(s0)
    1148:	eef71ee3          	bne	a4,a5,1044 <_ZN5Snake17has_collided_withEj+0x90>
    114c:	00000793          	li	a5,0
    1150:	00078513          	mv	a0,a5
    1154:	03c12083          	lw	ra,60(sp)
    1158:	03812403          	lw	s0,56(sp)
    115c:	04010113          	add	sp,sp,64
    1160:	00008067          	ret

00001164 <_ZN5Snake17has_head_accidentEv>:
    1164:	fe010113          	add	sp,sp,-32
    1168:	00112e23          	sw	ra,28(sp)
    116c:	00812c23          	sw	s0,24(sp)
    1170:	02010413          	add	s0,sp,32
    1174:	fea42623          	sw	a0,-20(s0)
    1178:	fec42783          	lw	a5,-20(s0)
    117c:	0007a783          	lw	a5,0(a5)
    1180:	fec42703          	lw	a4,-20(s0)
    1184:	00878793          	add	a5,a5,8
    1188:	00179793          	sll	a5,a5,0x1
    118c:	00f707b3          	add	a5,a4,a5
    1190:	0007d783          	lhu	a5,0(a5)
    1194:	00078593          	mv	a1,a5
    1198:	fec42503          	lw	a0,-20(s0)
    119c:	e19ff0ef          	jal	fb4 <_ZN5Snake17has_collided_withEj>
    11a0:	00050793          	mv	a5,a0
    11a4:	00078513          	mv	a0,a5
    11a8:	01c12083          	lw	ra,28(sp)
    11ac:	01812403          	lw	s0,24(sp)
    11b0:	02010113          	add	sp,sp,32
    11b4:	00008067          	ret

000011b8 <_Z41__static_initialization_and_destruction_0v>:
    11b8:	ff010113          	add	sp,sp,-16
    11bc:	00112623          	sw	ra,12(sp)
    11c0:	00812423          	sw	s0,8(sp)
    11c4:	01010413          	add	s0,sp,16
    11c8:	0cc00513          	li	a0,204
    11cc:	fc4ff0ef          	jal	990 <_ZN5SnakeC1Ev>
    11d0:	00000013          	nop
    11d4:	00c12083          	lw	ra,12(sp)
    11d8:	00812403          	lw	s0,8(sp)
    11dc:	01010113          	add	sp,sp,16
    11e0:	00008067          	ret

000011e4 <_GLOBAL__sub_I_state>:
    11e4:	ff010113          	add	sp,sp,-16
    11e8:	00112623          	sw	ra,12(sp)
    11ec:	00812423          	sw	s0,8(sp)
    11f0:	01010413          	add	s0,sp,16
    11f4:	fc5ff0ef          	jal	11b8 <_Z41__static_initialization_and_destruction_0v>
    11f8:	00c12083          	lw	ra,12(sp)
    11fc:	00812403          	lw	s0,8(sp)
    1200:	01010113          	add	sp,sp,16
    1204:	00008067          	ret

00001208 <_Z22print_string_at_centerILj32EEjjRAT__Kc>:
    1208:	fe010113          	add	sp,sp,-32
    120c:	00112e23          	sw	ra,28(sp)
    1210:	00812c23          	sw	s0,24(sp)
    1214:	02010413          	add	s0,sp,32
    1218:	fea42623          	sw	a0,-20(s0)
    121c:	feb42423          	sw	a1,-24(s0)
    1220:	01f00693          	li	a3,31
    1224:	fe842603          	lw	a2,-24(s0)
    1228:	01800593          	li	a1,24
    122c:	fec42503          	lw	a0,-20(s0)
    1230:	8a0ff0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    1234:	03700793          	li	a5,55
    1238:	00078513          	mv	a0,a5
    123c:	01c12083          	lw	ra,28(sp)
    1240:	01812403          	lw	s0,24(sp)
    1244:	02010113          	add	sp,sp,32
    1248:	00008067          	ret

0000124c <_Z22print_string_at_centerILj27EEjjRAT__Kc>:
    124c:	fe010113          	add	sp,sp,-32
    1250:	00112e23          	sw	ra,28(sp)
    1254:	00812c23          	sw	s0,24(sp)
    1258:	02010413          	add	s0,sp,32
    125c:	fea42623          	sw	a0,-20(s0)
    1260:	feb42423          	sw	a1,-24(s0)
    1264:	01a00693          	li	a3,26
    1268:	fe842603          	lw	a2,-24(s0)
    126c:	01b00593          	li	a1,27
    1270:	fec42503          	lw	a0,-20(s0)
    1274:	85cff0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    1278:	03500793          	li	a5,53
    127c:	00078513          	mv	a0,a5
    1280:	01c12083          	lw	ra,28(sp)
    1284:	01812403          	lw	s0,24(sp)
    1288:	02010113          	add	sp,sp,32
    128c:	00008067          	ret

00001290 <_Z22print_string_at_centerILj25EEjjRAT__Kc>:
    1290:	fe010113          	add	sp,sp,-32
    1294:	00112e23          	sw	ra,28(sp)
    1298:	00812c23          	sw	s0,24(sp)
    129c:	02010413          	add	s0,sp,32
    12a0:	fea42623          	sw	a0,-20(s0)
    12a4:	feb42423          	sw	a1,-24(s0)
    12a8:	01800693          	li	a3,24
    12ac:	fe842603          	lw	a2,-24(s0)
    12b0:	01c00593          	li	a1,28
    12b4:	fec42503          	lw	a0,-20(s0)
    12b8:	818ff0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    12bc:	03400793          	li	a5,52
    12c0:	00078513          	mv	a0,a5
    12c4:	01c12083          	lw	ra,28(sp)
    12c8:	01812403          	lw	s0,24(sp)
    12cc:	02010113          	add	sp,sp,32
    12d0:	00008067          	ret

000012d4 <_Z22print_string_at_centerILj12EEjjRAT__Kc>:
    12d4:	fe010113          	add	sp,sp,-32
    12d8:	00112e23          	sw	ra,28(sp)
    12dc:	00812c23          	sw	s0,24(sp)
    12e0:	02010413          	add	s0,sp,32
    12e4:	fea42623          	sw	a0,-20(s0)
    12e8:	feb42423          	sw	a1,-24(s0)
    12ec:	00b00693          	li	a3,11
    12f0:	fe842603          	lw	a2,-24(s0)
    12f4:	02200593          	li	a1,34
    12f8:	fec42503          	lw	a0,-20(s0)
    12fc:	fd5fe0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    1300:	02d00793          	li	a5,45
    1304:	00078513          	mv	a0,a5
    1308:	01c12083          	lw	ra,28(sp)
    130c:	01812403          	lw	s0,24(sp)
    1310:	02010113          	add	sp,sp,32
    1314:	00008067          	ret

00001318 <_Z22print_string_at_centerILj24EEjjRAT__Kc>:
    1318:	fe010113          	add	sp,sp,-32
    131c:	00112e23          	sw	ra,28(sp)
    1320:	00812c23          	sw	s0,24(sp)
    1324:	02010413          	add	s0,sp,32
    1328:	fea42623          	sw	a0,-20(s0)
    132c:	feb42423          	sw	a1,-24(s0)
    1330:	01700693          	li	a3,23
    1334:	fe842603          	lw	a2,-24(s0)
    1338:	01c00593          	li	a1,28
    133c:	fec42503          	lw	a0,-20(s0)
    1340:	f91fe0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    1344:	03300793          	li	a5,51
    1348:	00078513          	mv	a0,a5
    134c:	01c12083          	lw	ra,28(sp)
    1350:	01812403          	lw	s0,24(sp)
    1354:	02010113          	add	sp,sp,32
    1358:	00008067          	ret

0000135c <_Z22print_string_at_centerILj43EEjjRAT__Kc>:
    135c:	fe010113          	add	sp,sp,-32
    1360:	00112e23          	sw	ra,28(sp)
    1364:	00812c23          	sw	s0,24(sp)
    1368:	02010413          	add	s0,sp,32
    136c:	fea42623          	sw	a0,-20(s0)
    1370:	feb42423          	sw	a1,-24(s0)
    1374:	02a00693          	li	a3,42
    1378:	fe842603          	lw	a2,-24(s0)
    137c:	01300593          	li	a1,19
    1380:	fec42503          	lw	a0,-20(s0)
    1384:	f4dfe0ef          	jal	2d0 <_Z12print_stringjjPKcj>
    1388:	03d00793          	li	a5,61
    138c:	00078513          	mv	a0,a5
    1390:	01c12083          	lw	ra,28(sp)
    1394:	01812403          	lw	s0,24(sp)
    1398:	02010113          	add	sp,sp,32
    139c:	00008067          	ret

000013a0 <__divsi3>:
    13a0:	06054063          	bltz	a0,1400 <__umodsi3+0x10>
    13a4:	0605c663          	bltz	a1,1410 <__umodsi3+0x20>

000013a8 <__hidden___udivsi3>:
    13a8:	00058613          	mv	a2,a1
    13ac:	00050593          	mv	a1,a0
    13b0:	fff00513          	li	a0,-1
    13b4:	02060c63          	beqz	a2,13ec <__hidden___udivsi3+0x44>
    13b8:	00100693          	li	a3,1
    13bc:	00b67a63          	bgeu	a2,a1,13d0 <__hidden___udivsi3+0x28>
    13c0:	00c05863          	blez	a2,13d0 <__hidden___udivsi3+0x28>
    13c4:	00161613          	sll	a2,a2,0x1
    13c8:	00169693          	sll	a3,a3,0x1
    13cc:	feb66ae3          	bltu	a2,a1,13c0 <__hidden___udivsi3+0x18>
    13d0:	00000513          	li	a0,0
    13d4:	00c5e663          	bltu	a1,a2,13e0 <__hidden___udivsi3+0x38>
    13d8:	40c585b3          	sub	a1,a1,a2
    13dc:	00d56533          	or	a0,a0,a3
    13e0:	0016d693          	srl	a3,a3,0x1
    13e4:	00165613          	srl	a2,a2,0x1
    13e8:	fe0696e3          	bnez	a3,13d4 <__hidden___udivsi3+0x2c>
    13ec:	00008067          	ret

000013f0 <__umodsi3>:
    13f0:	00008293          	mv	t0,ra
    13f4:	fb5ff0ef          	jal	13a8 <__hidden___udivsi3>
    13f8:	00058513          	mv	a0,a1
    13fc:	00028067          	jr	t0
    1400:	40a00533          	neg	a0,a0
    1404:	00b04863          	bgtz	a1,1414 <__umodsi3+0x24>
    1408:	40b005b3          	neg	a1,a1
    140c:	f9dff06f          	j	13a8 <__hidden___udivsi3>
    1410:	40b005b3          	neg	a1,a1
    1414:	00008293          	mv	t0,ra
    1418:	f91ff0ef          	jal	13a8 <__hidden___udivsi3>
    141c:	40a00533          	neg	a0,a0
    1420:	00028067          	jr	t0

00001424 <__modsi3>:
    1424:	00008293          	mv	t0,ra
    1428:	0005ca63          	bltz	a1,143c <__modsi3+0x18>
    142c:	00054c63          	bltz	a0,1444 <__modsi3+0x20>
    1430:	f79ff0ef          	jal	13a8 <__hidden___udivsi3>
    1434:	00058513          	mv	a0,a1
    1438:	00028067          	jr	t0
    143c:	40b005b3          	neg	a1,a1
    1440:	fe0558e3          	bgez	a0,1430 <__modsi3+0xc>
    1444:	40a00533          	neg	a0,a0
    1448:	f61ff0ef          	jal	13a8 <__hidden___udivsi3>
    144c:	40b00533          	neg	a0,a1
    1450:	00028067          	jr	t0

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

