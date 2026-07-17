
coremark.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00001197          	auipc	gp,0x1
       4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
       8:	00003117          	auipc	sp,0x3
       c:	5f810113          	add	sp,sp,1528 # 3600 <get_seed_32>
      10:	00001297          	auipc	t0,0x1
      14:	8cc28293          	add	t0,t0,-1844 # 8dc <start_time_val>
      18:	00001317          	auipc	t1,0x1
      1c:	92830313          	add	t1,t1,-1752 # 940 <_bss_end>

00000020 <_bss_init_loop>:
      20:	00534863          	blt	t1,t0,30 <_irq_config>
      24:	0002a023          	sw	zero,0(t0)
      28:	00428293          	add	t0,t0,4
      2c:	ff5ff06f          	j	20 <_bss_init_loop>

00000030 <_irq_config>:
      30:	05c00293          	li	t0,92
      34:	fff00313          	li	t1,-1
      38:	00004397          	auipc	t2,0x4
      3c:	fc838393          	add	t2,t2,-56 # 4000 <ecvtbuf>
      40:	30529073          	csrw	mtvec,t0
      44:	34039073          	csrw	mscratch,t2
      48:	30431073          	csrw	mie,t1

0000004c <_main_call>:
      4c:	00000513          	li	a0,0
      50:	00000593          	li	a1,0
      54:	208000ef          	jal	25c <main>

00000058 <_endless_loop>:
      58:	0000006f          	j	58 <_endless_loop>

0000005c <_int_handler>:
      5c:	34011173          	csrrw	sp,mscratch,sp
      60:	fb010113          	add	sp,sp,-80
      64:	00112223          	sw	ra,4(sp)
      68:	00003097          	auipc	ra,0x3
      6c:	59808093          	add	ra,ra,1432 # 3600 <get_seed_32>
      70:	fe1144e3          	blt	sp,ra,58 <_endless_loop>
      74:	00512623          	sw	t0,12(sp)
      78:	00612823          	sw	t1,16(sp)
      7c:	00712a23          	sw	t2,20(sp)
      80:	00a12c23          	sw	a0,24(sp)
      84:	00b12e23          	sw	a1,28(sp)
      88:	02c12023          	sw	a2,32(sp)
      8c:	02d12223          	sw	a3,36(sp)
      90:	02e12423          	sw	a4,40(sp)
      94:	02f12623          	sw	a5,44(sp)
      98:	03012823          	sw	a6,48(sp)
      9c:	03112a23          	sw	a7,52(sp)
      a0:	03c12c23          	sw	t3,56(sp)
      a4:	03d12e23          	sw	t4,60(sp)
      a8:	05e12023          	sw	t5,64(sp)
      ac:	05f12223          	sw	t6,68(sp)
      b0:	340022f3          	csrr	t0,mscratch
      b4:	34102373          	csrr	t1,mepc
      b8:	34202573          	csrr	a0,mcause
      bc:	00512423          	sw	t0,8(sp)
      c0:	04612423          	sw	t1,72(sp)
      c4:	04a12623          	sw	a0,76(sp)
      c8:	068000ef          	jal	130 <int_handler>
      cc:	00010513          	mv	a0,sp
      d0:	04852303          	lw	t1,72(a0)
      d4:	04c52383          	lw	t2,76(a0)
      d8:	05010113          	add	sp,sp,80
      dc:	34011073          	csrw	mscratch,sp
      e0:	34131073          	csrw	mepc,t1
      e4:	34239073          	csrw	mcause,t2
      e8:	00452083          	lw	ra,4(a0)
      ec:	00852103          	lw	sp,8(a0)
      f0:	00c52283          	lw	t0,12(a0)
      f4:	01052303          	lw	t1,16(a0)
      f8:	01452383          	lw	t2,20(a0)
      fc:	01c52583          	lw	a1,28(a0)
     100:	02052603          	lw	a2,32(a0)
     104:	02452683          	lw	a3,36(a0)
     108:	02852703          	lw	a4,40(a0)
     10c:	02c52783          	lw	a5,44(a0)
     110:	03052803          	lw	a6,48(a0)
     114:	03452883          	lw	a7,52(a0)
     118:	03852e03          	lw	t3,56(a0)
     11c:	03c52e83          	lw	t4,60(a0)
     120:	04052f03          	lw	t5,64(a0)
     124:	04452f83          	lw	t6,68(a0)
     128:	01852503          	lw	a0,24(a0)
     12c:	30200073          	mret

00000130 <int_handler>:
     130:	ff010113          	add	sp,sp,-16
     134:	00812623          	sw	s0,12(sp)
     138:	01010413          	add	s0,sp,16
     13c:	00000013          	nop
     140:	00c12403          	lw	s0,12(sp)
     144:	01010113          	add	sp,sp,16
     148:	00008067          	ret

0000014c <iterate>:
     14c:	fd010113          	add	sp,sp,-48
     150:	02112623          	sw	ra,44(sp)
     154:	02812423          	sw	s0,40(sp)
     158:	03010413          	add	s0,sp,48
     15c:	fca42e23          	sw	a0,-36(s0)
     160:	fdc42783          	lw	a5,-36(s0)
     164:	fef42423          	sw	a5,-24(s0)
     168:	fe842783          	lw	a5,-24(s0)
     16c:	01c7a783          	lw	a5,28(a5)
     170:	fef42223          	sw	a5,-28(s0)
     174:	fe842783          	lw	a5,-24(s0)
     178:	02079c23          	sh	zero,56(a5)
     17c:	fe842783          	lw	a5,-24(s0)
     180:	02079d23          	sh	zero,58(a5)
     184:	fe842783          	lw	a5,-24(s0)
     188:	02079e23          	sh	zero,60(a5)
     18c:	fe842783          	lw	a5,-24(s0)
     190:	02079f23          	sh	zero,62(a5)
     194:	fe042623          	sw	zero,-20(s0)
     198:	0a00006f          	j	238 <iterate+0xec>
     19c:	00100593          	li	a1,1
     1a0:	fe842503          	lw	a0,-24(s0)
     1a4:	428010ef          	jal	15cc <core_bench_list>
     1a8:	00050793          	mv	a5,a0
     1ac:	fef41123          	sh	a5,-30(s0)
     1b0:	fe842783          	lw	a5,-24(s0)
     1b4:	0387d703          	lhu	a4,56(a5)
     1b8:	fe245783          	lhu	a5,-30(s0)
     1bc:	00070593          	mv	a1,a4
     1c0:	00078513          	mv	a0,a5
     1c4:	5e0030ef          	jal	37a4 <crcu16>
     1c8:	00050793          	mv	a5,a0
     1cc:	00078713          	mv	a4,a5
     1d0:	fe842783          	lw	a5,-24(s0)
     1d4:	02e79c23          	sh	a4,56(a5)
     1d8:	fff00593          	li	a1,-1
     1dc:	fe842503          	lw	a0,-24(s0)
     1e0:	3ec010ef          	jal	15cc <core_bench_list>
     1e4:	00050793          	mv	a5,a0
     1e8:	fef41123          	sh	a5,-30(s0)
     1ec:	fe842783          	lw	a5,-24(s0)
     1f0:	0387d703          	lhu	a4,56(a5)
     1f4:	fe245783          	lhu	a5,-30(s0)
     1f8:	00070593          	mv	a1,a4
     1fc:	00078513          	mv	a0,a5
     200:	5a4030ef          	jal	37a4 <crcu16>
     204:	00050793          	mv	a5,a0
     208:	00078713          	mv	a4,a5
     20c:	fe842783          	lw	a5,-24(s0)
     210:	02e79c23          	sh	a4,56(a5)
     214:	fec42783          	lw	a5,-20(s0)
     218:	00079a63          	bnez	a5,22c <iterate+0xe0>
     21c:	fe842783          	lw	a5,-24(s0)
     220:	0387d703          	lhu	a4,56(a5)
     224:	fe842783          	lw	a5,-24(s0)
     228:	02e79d23          	sh	a4,58(a5)
     22c:	fec42783          	lw	a5,-20(s0)
     230:	00178793          	add	a5,a5,1
     234:	fef42623          	sw	a5,-20(s0)
     238:	fec42703          	lw	a4,-20(s0)
     23c:	fe442783          	lw	a5,-28(s0)
     240:	f4f76ee3          	bltu	a4,a5,19c <iterate+0x50>
     244:	00000793          	li	a5,0
     248:	00078513          	mv	a0,a5
     24c:	02c12083          	lw	ra,44(sp)
     250:	02812403          	lw	s0,40(sp)
     254:	03010113          	add	sp,sp,48
     258:	00008067          	ret

0000025c <main>:
     25c:	81010113          	add	sp,sp,-2032
     260:	7e112623          	sw	ra,2028(sp)
     264:	7e812423          	sw	s0,2024(sp)
     268:	7e912223          	sw	s1,2020(sp)
     26c:	7f212023          	sw	s2,2016(sp)
     270:	7d312e23          	sw	s3,2012(sp)
     274:	7f010413          	add	s0,sp,2032
     278:	f8010113          	add	sp,sp,-128
     27c:	fffff7b7          	lui	a5,0xfffff
     280:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73f0>
     284:	008787b3          	add	a5,a5,s0
     288:	7aa7ae23          	sw	a0,1980(a5)
     28c:	fffff7b7          	lui	a5,0xfffff
     290:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73f0>
     294:	008787b3          	add	a5,a5,s0
     298:	7ab7ac23          	sw	a1,1976(a5)
     29c:	fc041e23          	sh	zero,-36(s0)
     2a0:	fc041d23          	sh	zero,-38(s0)
     2a4:	fff00793          	li	a5,-1
     2a8:	fcf41c23          	sh	a5,-40(s0)
     2ac:	fc041b23          	sh	zero,-42(s0)
     2b0:	fc041123          	sh	zero,-62(s0)
     2b4:	fffff7b7          	lui	a5,0xfffff
     2b8:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73f0>
     2bc:	008787b3          	add	a5,a5,s0
     2c0:	fffff737          	lui	a4,0xfffff
     2c4:	7bc70713          	add	a4,a4,1980 # fffff7bc <__subdf3+0xffff7bcc>
     2c8:	fe070713          	add	a4,a4,-32
     2cc:	008706b3          	add	a3,a4,s0
     2d0:	f7840713          	add	a4,s0,-136
     2d4:	04270713          	add	a4,a4,66
     2d8:	7b87a603          	lw	a2,1976(a5)
     2dc:	00068593          	mv	a1,a3
     2e0:	00070513          	mv	a0,a4
     2e4:	790030ef          	jal	3a74 <portable_init>
     2e8:	00100513          	li	a0,1
     2ec:	314030ef          	jal	3600 <get_seed_32>
     2f0:	00050793          	mv	a5,a0
     2f4:	01079793          	sll	a5,a5,0x10
     2f8:	4107d793          	sra	a5,a5,0x10
     2fc:	f6f41c23          	sh	a5,-136(s0)
     300:	00200513          	li	a0,2
     304:	2fc030ef          	jal	3600 <get_seed_32>
     308:	00050793          	mv	a5,a0
     30c:	01079793          	sll	a5,a5,0x10
     310:	4107d793          	sra	a5,a5,0x10
     314:	f6f41d23          	sh	a5,-134(s0)
     318:	00300513          	li	a0,3
     31c:	2e4030ef          	jal	3600 <get_seed_32>
     320:	00050793          	mv	a5,a0
     324:	01079793          	sll	a5,a5,0x10
     328:	4107d793          	sra	a5,a5,0x10
     32c:	f6f41e23          	sh	a5,-132(s0)
     330:	00400513          	li	a0,4
     334:	2cc030ef          	jal	3600 <get_seed_32>
     338:	00050793          	mv	a5,a0
     33c:	f8f42a23          	sw	a5,-108(s0)
     340:	00500513          	li	a0,5
     344:	2bc030ef          	jal	3600 <get_seed_32>
     348:	00050793          	mv	a5,a0
     34c:	f8f42c23          	sw	a5,-104(s0)
     350:	f9842783          	lw	a5,-104(s0)
     354:	00079663          	bnez	a5,360 <main+0x104>
     358:	00700793          	li	a5,7
     35c:	f8f42c23          	sw	a5,-104(s0)
     360:	f7841783          	lh	a5,-136(s0)
     364:	02079263          	bnez	a5,388 <main+0x12c>
     368:	f7a41783          	lh	a5,-134(s0)
     36c:	00079e63          	bnez	a5,388 <main+0x12c>
     370:	f7c41783          	lh	a5,-132(s0)
     374:	00079a63          	bnez	a5,388 <main+0x12c>
     378:	f6041c23          	sh	zero,-136(s0)
     37c:	f6041d23          	sh	zero,-134(s0)
     380:	06600793          	li	a5,102
     384:	f6f41e23          	sh	a5,-132(s0)
     388:	f7841703          	lh	a4,-136(s0)
     38c:	00100793          	li	a5,1
     390:	02f71a63          	bne	a4,a5,3c4 <main+0x168>
     394:	f7a41783          	lh	a5,-134(s0)
     398:	02079663          	bnez	a5,3c4 <main+0x168>
     39c:	f7c41783          	lh	a5,-132(s0)
     3a0:	02079263          	bnez	a5,3c4 <main+0x168>
     3a4:	000037b7          	lui	a5,0x3
     3a8:	41578793          	add	a5,a5,1045 # 3415 <core_state_transition+0x1ad>
     3ac:	f6f41c23          	sh	a5,-136(s0)
     3b0:	000037b7          	lui	a5,0x3
     3b4:	41578793          	add	a5,a5,1045 # 3415 <core_state_transition+0x1ad>
     3b8:	f6f41d23          	sh	a5,-134(s0)
     3bc:	06600793          	li	a5,102
     3c0:	f6f41e23          	sh	a5,-132(s0)
     3c4:	fc041f23          	sh	zero,-34(s0)
     3c8:	1380006f          	j	500 <_stack_size>
     3cc:	fde45703          	lhu	a4,-34(s0)
     3d0:	00070793          	mv	a5,a4
     3d4:	00579793          	sll	a5,a5,0x5
     3d8:	40e787b3          	sub	a5,a5,a4
     3dc:	00279793          	sll	a5,a5,0x2
     3e0:	00e787b3          	add	a5,a5,a4
     3e4:	00479793          	sll	a5,a5,0x4
     3e8:	00078693          	mv	a3,a5
     3ec:	fde45703          	lhu	a4,-34(s0)
     3f0:	fffff7b7          	lui	a5,0xfffff
     3f4:	7c878793          	add	a5,a5,1992 # fffff7c8 <__subdf3+0xffff7bd8>
     3f8:	fe078793          	add	a5,a5,-32
     3fc:	008787b3          	add	a5,a5,s0
     400:	00d786b3          	add	a3,a5,a3
     404:	00070793          	mv	a5,a4
     408:	00479793          	sll	a5,a5,0x4
     40c:	00e787b3          	add	a5,a5,a4
     410:	00279793          	sll	a5,a5,0x2
     414:	fe078793          	add	a5,a5,-32
     418:	008787b3          	add	a5,a5,s0
     41c:	fad7a023          	sw	a3,-96(a5)
     420:	fde45703          	lhu	a4,-34(s0)
     424:	00070793          	mv	a5,a4
     428:	00479793          	sll	a5,a5,0x4
     42c:	00e787b3          	add	a5,a5,a4
     430:	00279793          	sll	a5,a5,0x2
     434:	fe078793          	add	a5,a5,-32
     438:	008787b3          	add	a5,a5,s0
     43c:	7d000713          	li	a4,2000
     440:	fae7a823          	sw	a4,-80(a5)
     444:	fde45703          	lhu	a4,-34(s0)
     448:	f7841683          	lh	a3,-136(s0)
     44c:	00070793          	mv	a5,a4
     450:	00479793          	sll	a5,a5,0x4
     454:	00e787b3          	add	a5,a5,a4
     458:	00279793          	sll	a5,a5,0x2
     45c:	fe078793          	add	a5,a5,-32
     460:	008787b3          	add	a5,a5,s0
     464:	f8d79c23          	sh	a3,-104(a5)
     468:	fde45703          	lhu	a4,-34(s0)
     46c:	f7a41683          	lh	a3,-134(s0)
     470:	00070793          	mv	a5,a4
     474:	00479793          	sll	a5,a5,0x4
     478:	00e787b3          	add	a5,a5,a4
     47c:	00279793          	sll	a5,a5,0x2
     480:	fe078793          	add	a5,a5,-32
     484:	008787b3          	add	a5,a5,s0
     488:	f8d79d23          	sh	a3,-102(a5)
     48c:	fde45703          	lhu	a4,-34(s0)
     490:	f7c41683          	lh	a3,-132(s0)
     494:	00070793          	mv	a5,a4
     498:	00479793          	sll	a5,a5,0x4
     49c:	00e787b3          	add	a5,a5,a4
     4a0:	00279793          	sll	a5,a5,0x2
     4a4:	fe078793          	add	a5,a5,-32
     4a8:	008787b3          	add	a5,a5,s0
     4ac:	f8d79e23          	sh	a3,-100(a5)
     4b0:	fde45703          	lhu	a4,-34(s0)
     4b4:	00070793          	mv	a5,a4
     4b8:	00479793          	sll	a5,a5,0x4
     4bc:	00e787b3          	add	a5,a5,a4
     4c0:	00279793          	sll	a5,a5,0x2
     4c4:	fe078793          	add	a5,a5,-32
     4c8:	008787b3          	add	a5,a5,s0
     4cc:	fc079c23          	sh	zero,-40(a5)
     4d0:	fde45703          	lhu	a4,-34(s0)
     4d4:	f9842683          	lw	a3,-104(s0)
     4d8:	00070793          	mv	a5,a4
     4dc:	00479793          	sll	a5,a5,0x4
     4e0:	00e787b3          	add	a5,a5,a4
     4e4:	00279793          	sll	a5,a5,0x2
     4e8:	fe078793          	add	a5,a5,-32
     4ec:	008787b3          	add	a5,a5,s0
     4f0:	fad7ac23          	sw	a3,-72(a5)
     4f4:	fde45783          	lhu	a5,-34(s0)
     4f8:	00178793          	add	a5,a5,1
     4fc:	fcf41f23          	sh	a5,-34(s0)
     500:	fde45783          	lhu	a5,-34(s0)
     504:	ec0784e3          	beqz	a5,3cc <main+0x170>
     508:	fc041f23          	sh	zero,-34(s0)
     50c:	0380006f          	j	544 <_stack_size+0x44>
     510:	fde45783          	lhu	a5,-34(s0)
     514:	00100713          	li	a4,1
     518:	00f717b3          	sll	a5,a4,a5
     51c:	00078713          	mv	a4,a5
     520:	f9842783          	lw	a5,-104(s0)
     524:	00f777b3          	and	a5,a4,a5
     528:	00078863          	beqz	a5,538 <_stack_size+0x38>
     52c:	fda45783          	lhu	a5,-38(s0)
     530:	00178793          	add	a5,a5,1
     534:	fcf41d23          	sh	a5,-38(s0)
     538:	fde45783          	lhu	a5,-34(s0)
     53c:	00178793          	add	a5,a5,1
     540:	fcf41f23          	sh	a5,-34(s0)
     544:	fde45703          	lhu	a4,-34(s0)
     548:	00200793          	li	a5,2
     54c:	fce7f2e3          	bgeu	a5,a4,510 <_stack_size+0x10>
     550:	fc041f23          	sh	zero,-34(s0)
     554:	0680006f          	j	5bc <_stack_size+0xbc>
     558:	fde45703          	lhu	a4,-34(s0)
     55c:	00070793          	mv	a5,a4
     560:	00479793          	sll	a5,a5,0x4
     564:	00e787b3          	add	a5,a5,a4
     568:	00279793          	sll	a5,a5,0x2
     56c:	fe078793          	add	a5,a5,-32
     570:	008787b3          	add	a5,a5,s0
     574:	fb07a783          	lw	a5,-80(a5)
     578:	fda45703          	lhu	a4,-38(s0)
     57c:	fde45483          	lhu	s1,-34(s0)
     580:	00070593          	mv	a1,a4
     584:	00078513          	mv	a0,a5
     588:	348070ef          	jal	78d0 <__hidden___udivsi3>
     58c:	00050793          	mv	a5,a0
     590:	00078713          	mv	a4,a5
     594:	00048793          	mv	a5,s1
     598:	00479793          	sll	a5,a5,0x4
     59c:	009787b3          	add	a5,a5,s1
     5a0:	00279793          	sll	a5,a5,0x2
     5a4:	fe078793          	add	a5,a5,-32
     5a8:	008787b3          	add	a5,a5,s0
     5ac:	fae7a823          	sw	a4,-80(a5)
     5b0:	fde45783          	lhu	a5,-34(s0)
     5b4:	00178793          	add	a5,a5,1
     5b8:	fcf41f23          	sh	a5,-34(s0)
     5bc:	fde45783          	lhu	a5,-34(s0)
     5c0:	f8078ce3          	beqz	a5,558 <_stack_size+0x58>
     5c4:	fc041f23          	sh	zero,-34(s0)
     5c8:	0c00006f          	j	688 <default_num_contexts+0x98>
     5cc:	fde45783          	lhu	a5,-34(s0)
     5d0:	00100713          	li	a4,1
     5d4:	00f717b3          	sll	a5,a4,a5
     5d8:	00078713          	mv	a4,a5
     5dc:	f9842783          	lw	a5,-104(s0)
     5e0:	00f777b3          	and	a5,a4,a5
     5e4:	08078c63          	beqz	a5,67c <default_num_contexts+0x8c>
     5e8:	fc042823          	sw	zero,-48(s0)
     5ec:	07c0006f          	j	668 <default_num_contexts+0x78>
     5f0:	fd042703          	lw	a4,-48(s0)
     5f4:	00070793          	mv	a5,a4
     5f8:	00479793          	sll	a5,a5,0x4
     5fc:	00e787b3          	add	a5,a5,a4
     600:	00279793          	sll	a5,a5,0x2
     604:	fe078793          	add	a5,a5,-32
     608:	008787b3          	add	a5,a5,s0
     60c:	fa07a483          	lw	s1,-96(a5)
     610:	f9042783          	lw	a5,-112(s0)
     614:	fdc45703          	lhu	a4,-36(s0)
     618:	00070593          	mv	a1,a4
     61c:	00078513          	mv	a0,a5
     620:	284070ef          	jal	78a4 <__mulsi3>
     624:	00050793          	mv	a5,a0
     628:	00078713          	mv	a4,a5
     62c:	fde45783          	lhu	a5,-34(s0)
     630:	00178613          	add	a2,a5,1
     634:	00e486b3          	add	a3,s1,a4
     638:	fd042703          	lw	a4,-48(s0)
     63c:	00070793          	mv	a5,a4
     640:	00479793          	sll	a5,a5,0x4
     644:	00e787b3          	add	a5,a5,a4
     648:	00c787b3          	add	a5,a5,a2
     64c:	00279793          	sll	a5,a5,0x2
     650:	fe078793          	add	a5,a5,-32
     654:	008787b3          	add	a5,a5,s0
     658:	fad7a023          	sw	a3,-96(a5)
     65c:	fd042783          	lw	a5,-48(s0)
     660:	00178793          	add	a5,a5,1
     664:	fcf42823          	sw	a5,-48(s0)
     668:	fd042783          	lw	a5,-48(s0)
     66c:	f80782e3          	beqz	a5,5f0 <default_num_contexts>
     670:	fdc45783          	lhu	a5,-36(s0)
     674:	00178793          	add	a5,a5,1
     678:	fcf41e23          	sh	a5,-36(s0)
     67c:	fde45783          	lhu	a5,-34(s0)
     680:	00178793          	add	a5,a5,1
     684:	fcf41f23          	sh	a5,-34(s0)
     688:	fde45703          	lhu	a4,-34(s0)
     68c:	00200793          	li	a5,2
     690:	f2e7fee3          	bgeu	a5,a4,5cc <_stack_size+0xcc>
     694:	fc041f23          	sh	zero,-34(s0)
     698:	1e80006f          	j	880 <_gbl_ptr+0x80>
     69c:	fde45703          	lhu	a4,-34(s0)
     6a0:	00070793          	mv	a5,a4
     6a4:	00479793          	sll	a5,a5,0x4
     6a8:	00e787b3          	add	a5,a5,a4
     6ac:	00279793          	sll	a5,a5,0x2
     6b0:	fe078793          	add	a5,a5,-32
     6b4:	008787b3          	add	a5,a5,s0
     6b8:	fb87a783          	lw	a5,-72(a5)
     6bc:	0017f793          	and	a5,a5,1
     6c0:	06078c63          	beqz	a5,738 <default_num_contexts+0x148>
     6c4:	f9042683          	lw	a3,-112(s0)
     6c8:	fde45703          	lhu	a4,-34(s0)
     6cc:	00070793          	mv	a5,a4
     6d0:	00479793          	sll	a5,a5,0x4
     6d4:	00e787b3          	add	a5,a5,a4
     6d8:	00279793          	sll	a5,a5,0x2
     6dc:	fe078793          	add	a5,a5,-32
     6e0:	008787b3          	add	a5,a5,s0
     6e4:	fa47a583          	lw	a1,-92(a5)
     6e8:	fde45703          	lhu	a4,-34(s0)
     6ec:	00070793          	mv	a5,a4
     6f0:	00479793          	sll	a5,a5,0x4
     6f4:	00e787b3          	add	a5,a5,a4
     6f8:	00279793          	sll	a5,a5,0x2
     6fc:	fe078793          	add	a5,a5,-32
     700:	008787b3          	add	a5,a5,s0
     704:	f9879783          	lh	a5,-104(a5)
     708:	fde45483          	lhu	s1,-34(s0)
     70c:	00078613          	mv	a2,a5
     710:	00068513          	mv	a0,a3
     714:	1e0010ef          	jal	18f4 <core_list_init>
     718:	00050713          	mv	a4,a0
     71c:	00048793          	mv	a5,s1
     720:	00479793          	sll	a5,a5,0x4
     724:	009787b3          	add	a5,a5,s1
     728:	00279793          	sll	a5,a5,0x2
     72c:	fe078793          	add	a5,a5,-32
     730:	008787b3          	add	a5,a5,s0
     734:	fae7ae23          	sw	a4,-68(a5)
     738:	fde45703          	lhu	a4,-34(s0)
     73c:	00070793          	mv	a5,a4
     740:	00479793          	sll	a5,a5,0x4
     744:	00e787b3          	add	a5,a5,a4
     748:	00279793          	sll	a5,a5,0x2
     74c:	fe078793          	add	a5,a5,-32
     750:	008787b3          	add	a5,a5,s0
     754:	fb87a783          	lw	a5,-72(a5)
     758:	0027f793          	and	a5,a5,2
     75c:	0a078063          	beqz	a5,7fc <__clz_tab+0x20>
     760:	f9042503          	lw	a0,-112(s0)
     764:	fde45703          	lhu	a4,-34(s0)
     768:	00070793          	mv	a5,a4
     76c:	00479793          	sll	a5,a5,0x4
     770:	00e787b3          	add	a5,a5,a4
     774:	00279793          	sll	a5,a5,0x2
     778:	fe078793          	add	a5,a5,-32
     77c:	008787b3          	add	a5,a5,s0
     780:	fa87a583          	lw	a1,-88(a5)
     784:	fde45703          	lhu	a4,-34(s0)
     788:	00070793          	mv	a5,a4
     78c:	00479793          	sll	a5,a5,0x4
     790:	00e787b3          	add	a5,a5,a4
     794:	00279793          	sll	a5,a5,0x2
     798:	fe078793          	add	a5,a5,-32
     79c:	008787b3          	add	a5,a5,s0
     7a0:	f9879783          	lh	a5,-104(a5)
     7a4:	00078693          	mv	a3,a5
     7a8:	fde45703          	lhu	a4,-34(s0)
     7ac:	00070793          	mv	a5,a4
     7b0:	00479793          	sll	a5,a5,0x4
     7b4:	00e787b3          	add	a5,a5,a4
     7b8:	00279793          	sll	a5,a5,0x2
     7bc:	fe078793          	add	a5,a5,-32
     7c0:	008787b3          	add	a5,a5,s0
     7c4:	f9a79783          	lh	a5,-102(a5)
     7c8:	01079793          	sll	a5,a5,0x10
     7cc:	00f6e633          	or	a2,a3,a5
     7d0:	fde45703          	lhu	a4,-34(s0)
     7d4:	f7840693          	add	a3,s0,-136
     7d8:	00070793          	mv	a5,a4
     7dc:	00479793          	sll	a5,a5,0x4
     7e0:	00e787b3          	add	a5,a5,a4
     7e4:	00279793          	sll	a5,a5,0x2
     7e8:	02078793          	add	a5,a5,32
     7ec:	00f687b3          	add	a5,a3,a5
     7f0:	00878793          	add	a5,a5,8
     7f4:	00078693          	mv	a3,a5
     7f8:	305010ef          	jal	22fc <core_init_matrix>
     7fc:	fde45703          	lhu	a4,-34(s0)
     800:	00070793          	mv	a5,a4
     804:	00479793          	sll	a5,a5,0x4
     808:	00e787b3          	add	a5,a5,a4
     80c:	00279793          	sll	a5,a5,0x2
     810:	fe078793          	add	a5,a5,-32
     814:	008787b3          	add	a5,a5,s0
     818:	fb87a783          	lw	a5,-72(a5)
     81c:	0047f793          	and	a5,a5,4
     820:	04078a63          	beqz	a5,874 <_gbl_ptr+0x74>
     824:	f9042683          	lw	a3,-112(s0)
     828:	fde45703          	lhu	a4,-34(s0)
     82c:	00070793          	mv	a5,a4
     830:	00479793          	sll	a5,a5,0x4
     834:	00e787b3          	add	a5,a5,a4
     838:	00279793          	sll	a5,a5,0x2
     83c:	fe078793          	add	a5,a5,-32
     840:	008787b3          	add	a5,a5,s0
     844:	f9879583          	lh	a1,-104(a5)
     848:	fde45703          	lhu	a4,-34(s0)
     84c:	00070793          	mv	a5,a4
     850:	00479793          	sll	a5,a5,0x4
     854:	00e787b3          	add	a5,a5,a4
     858:	00279793          	sll	a5,a5,0x2
     85c:	fe078793          	add	a5,a5,-32
     860:	008787b3          	add	a5,a5,s0
     864:	fac7a783          	lw	a5,-84(a5)
     868:	00078613          	mv	a2,a5
     86c:	00068513          	mv	a0,a3
     870:	730020ef          	jal	2fa0 <core_init_state>
     874:	fde45783          	lhu	a5,-34(s0)
     878:	00178793          	add	a5,a5,1
     87c:	fcf41f23          	sh	a5,-34(s0)
     880:	fde45783          	lhu	a5,-34(s0)
     884:	e0078ce3          	beqz	a5,69c <default_num_contexts+0xac>
     888:	f9442783          	lw	a5,-108(s0)
     88c:	0c079863          	bnez	a5,95c <_bss_end+0x1c>
     890:	00000713          	li	a4,0
     894:	00000793          	li	a5,0
     898:	fce42423          	sw	a4,-56(s0)
     89c:	fcf42623          	sw	a5,-52(s0)
     8a0:	00100793          	li	a5,1
     8a4:	f8f42a23          	sw	a5,-108(s0)
     8a8:	0480006f          	j	8f0 <CVTBUF+0xc>
     8ac:	f9442703          	lw	a4,-108(s0)
     8b0:	00070793          	mv	a5,a4
     8b4:	00279793          	sll	a5,a5,0x2
     8b8:	00e787b3          	add	a5,a5,a4
     8bc:	00179793          	sll	a5,a5,0x1
     8c0:	f8f42a23          	sw	a5,-108(s0)
     8c4:	0a8030ef          	jal	396c <start_time>
     8c8:	f7840793          	add	a5,s0,-136
     8cc:	00078513          	mv	a0,a5
     8d0:	87dff0ef          	jal	14c <iterate>
     8d4:	0cc030ef          	jal	39a0 <stop_time>
     8d8:	0fc030ef          	jal	39d4 <get_time>
     8dc:	00050793          	mv	a5,a0
     8e0:	00078513          	mv	a0,a5
     8e4:	128030ef          	jal	3a0c <time_in_secs>
     8e8:	fca42423          	sw	a0,-56(s0)
     8ec:	fcb42623          	sw	a1,-52(s0)
     8f0:	47802603          	lw	a2,1144(zero) # 478 <main+0x21c>
     8f4:	47c02683          	lw	a3,1148(zero) # 47c <main+0x220>
     8f8:	fc842503          	lw	a0,-56(s0)
     8fc:	fcc42583          	lw	a1,-52(s0)
     900:	550060ef          	jal	6e50 <__ledf2>
     904:	00050793          	mv	a5,a0
     908:	fa07c2e3          	bltz	a5,8ac <_gbl_ptr+0xac>
     90c:	fc842503          	lw	a0,-56(s0)
     910:	fcc42583          	lw	a1,-52(s0)
     914:	659060ef          	jal	776c <__fixunsdfsi>
     918:	00050793          	mv	a5,a0
     91c:	fcf42223          	sw	a5,-60(s0)
     920:	fc442783          	lw	a5,-60(s0)
     924:	00079663          	bnez	a5,930 <CVTBUF+0x4c>
     928:	00100793          	li	a5,1
     92c:	fcf42223          	sw	a5,-60(s0)
     930:	f9442483          	lw	s1,-108(s0)
     934:	fc442583          	lw	a1,-60(s0)
     938:	00a00513          	li	a0,10
     93c:	795060ef          	jal	78d0 <__hidden___udivsi3>
     940:	00050793          	mv	a5,a0
     944:	00178793          	add	a5,a5,1
     948:	00078593          	mv	a1,a5
     94c:	00048513          	mv	a0,s1
     950:	755060ef          	jal	78a4 <__mulsi3>
     954:	00050793          	mv	a5,a0
     958:	f8f42a23          	sw	a5,-108(s0)
     95c:	010030ef          	jal	396c <start_time>
     960:	f7840793          	add	a5,s0,-136
     964:	00078513          	mv	a0,a5
     968:	fe4ff0ef          	jal	14c <iterate>
     96c:	034030ef          	jal	39a0 <stop_time>
     970:	064030ef          	jal	39d4 <get_time>
     974:	faa42e23          	sw	a0,-68(s0)
     978:	f7841783          	lh	a5,-136(s0)
     97c:	fc245703          	lhu	a4,-62(s0)
     980:	00070593          	mv	a1,a4
     984:	00078513          	mv	a0,a5
     988:	725020ef          	jal	38ac <crc16>
     98c:	00050793          	mv	a5,a0
     990:	fcf41123          	sh	a5,-62(s0)
     994:	f7a41783          	lh	a5,-134(s0)
     998:	fc245703          	lhu	a4,-62(s0)
     99c:	00070593          	mv	a1,a4
     9a0:	00078513          	mv	a0,a5
     9a4:	709020ef          	jal	38ac <crc16>
     9a8:	00050793          	mv	a5,a0
     9ac:	fcf41123          	sh	a5,-62(s0)
     9b0:	f7c41783          	lh	a5,-132(s0)
     9b4:	fc245703          	lhu	a4,-62(s0)
     9b8:	00070593          	mv	a1,a4
     9bc:	00078513          	mv	a0,a5
     9c0:	6ed020ef          	jal	38ac <crc16>
     9c4:	00050793          	mv	a5,a0
     9c8:	fcf41123          	sh	a5,-62(s0)
     9cc:	f9042783          	lw	a5,-112(s0)
     9d0:	01079793          	sll	a5,a5,0x10
     9d4:	4107d793          	sra	a5,a5,0x10
     9d8:	fc245703          	lhu	a4,-62(s0)
     9dc:	00070593          	mv	a1,a4
     9e0:	00078513          	mv	a0,a5
     9e4:	6c9020ef          	jal	38ac <crc16>
     9e8:	00050793          	mv	a5,a0
     9ec:	fcf41123          	sh	a5,-62(s0)
     9f0:	fc245783          	lhu	a5,-62(s0)
     9f4:	0000f737          	lui	a4,0xf
     9f8:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x6e05>
     9fc:	08e78a63          	beq	a5,a4,a90 <_trap_stack_size+0x90>
     a00:	0000f737          	lui	a4,0xf
     a04:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x6e05>
     a08:	0af74863          	blt	a4,a5,ab8 <_trap_stack_size+0xb8>
     a0c:	00009737          	lui	a4,0x9
     a10:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0xe12>
     a14:	04e78263          	beq	a5,a4,a58 <_trap_stack_size+0x58>
     a18:	00009737          	lui	a4,0x9
     a1c:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0xe12>
     a20:	08f74c63          	blt	a4,a5,ab8 <_trap_stack_size+0xb8>
     a24:	00008737          	lui	a4,0x8
     a28:	b0570713          	add	a4,a4,-1275 # 7b05 <modf+0x10d>
     a2c:	02e78e63          	beq	a5,a4,a68 <_trap_stack_size+0x68>
     a30:	00008737          	lui	a4,0x8
     a34:	b0570713          	add	a4,a4,-1275 # 7b05 <modf+0x10d>
     a38:	08f74063          	blt	a4,a5,ab8 <_trap_stack_size+0xb8>
     a3c:	00002737          	lui	a4,0x2
     a40:	8f270713          	add	a4,a4,-1806 # 18f2 <core_bench_list+0x326>
     a44:	06e78063          	beq	a5,a4,aa4 <_trap_stack_size+0xa4>
     a48:	00005737          	lui	a4,0x5
     a4c:	eaf70713          	add	a4,a4,-337 # 4eaf <parse_float+0x43f>
     a50:	02e78663          	beq	a5,a4,a7c <_trap_stack_size+0x7c>
     a54:	0640006f          	j	ab8 <_trap_stack_size+0xb8>
     a58:	fc041c23          	sh	zero,-40(s0)
     a5c:	04800513          	li	a0,72
     a60:	03c050ef          	jal	5a9c <ee_printf>
     a64:	0600006f          	j	ac4 <_trap_stack_size+0xc4>
     a68:	00100793          	li	a5,1
     a6c:	fcf41c23          	sh	a5,-40(s0)
     a70:	07800513          	li	a0,120
     a74:	028050ef          	jal	5a9c <ee_printf>
     a78:	04c0006f          	j	ac4 <_trap_stack_size+0xc4>
     a7c:	00200793          	li	a5,2
     a80:	fcf41c23          	sh	a5,-40(s0)
     a84:	0a400513          	li	a0,164
     a88:	014050ef          	jal	5a9c <ee_printf>
     a8c:	0380006f          	j	ac4 <_trap_stack_size+0xc4>
     a90:	00300793          	li	a5,3
     a94:	fcf41c23          	sh	a5,-40(s0)
     a98:	0d800513          	li	a0,216
     a9c:	000050ef          	jal	5a9c <ee_printf>
     aa0:	0240006f          	j	ac4 <_trap_stack_size+0xc4>
     aa4:	00400793          	li	a5,4
     aa8:	fcf41c23          	sh	a5,-40(s0)
     aac:	10800513          	li	a0,264
     ab0:	7ed040ef          	jal	5a9c <ee_printf>
     ab4:	0100006f          	j	ac4 <_trap_stack_size+0xc4>
     ab8:	fff00793          	li	a5,-1
     abc:	fcf41b23          	sh	a5,-42(s0)
     ac0:	00000013          	nop
     ac4:	fd841783          	lh	a5,-40(s0)
     ac8:	3807c063          	bltz	a5,e48 <_trap_stack_size+0x448>
     acc:	fc041f23          	sh	zero,-34(s0)
     ad0:	36c0006f          	j	e3c <_trap_stack_size+0x43c>
     ad4:	fde45703          	lhu	a4,-34(s0)
     ad8:	00070793          	mv	a5,a4
     adc:	00479793          	sll	a5,a5,0x4
     ae0:	00e787b3          	add	a5,a5,a4
     ae4:	00279793          	sll	a5,a5,0x2
     ae8:	fe078793          	add	a5,a5,-32
     aec:	008787b3          	add	a5,a5,s0
     af0:	fc079c23          	sh	zero,-40(a5)
     af4:	fde45703          	lhu	a4,-34(s0)
     af8:	00070793          	mv	a5,a4
     afc:	00479793          	sll	a5,a5,0x4
     b00:	00e787b3          	add	a5,a5,a4
     b04:	00279793          	sll	a5,a5,0x2
     b08:	fe078793          	add	a5,a5,-32
     b0c:	008787b3          	add	a5,a5,s0
     b10:	fb87a783          	lw	a5,-72(a5)
     b14:	0017f793          	and	a5,a5,1
     b18:	0c078e63          	beqz	a5,bf4 <_trap_stack_size+0x1f4>
     b1c:	fde45703          	lhu	a4,-34(s0)
     b20:	00070793          	mv	a5,a4
     b24:	00479793          	sll	a5,a5,0x4
     b28:	00e787b3          	add	a5,a5,a4
     b2c:	00279793          	sll	a5,a5,0x2
     b30:	fe078793          	add	a5,a5,-32
     b34:	008787b3          	add	a5,a5,s0
     b38:	fd27d703          	lhu	a4,-46(a5)
     b3c:	fd841783          	lh	a5,-40(s0)
     b40:	00000693          	li	a3,0
     b44:	00179793          	sll	a5,a5,0x1
     b48:	00f687b3          	add	a5,a3,a5
     b4c:	0007d783          	lhu	a5,0(a5)
     b50:	0af70263          	beq	a4,a5,bf4 <_trap_stack_size+0x1f4>
     b54:	fde45583          	lhu	a1,-34(s0)
     b58:	fde45703          	lhu	a4,-34(s0)
     b5c:	00070793          	mv	a5,a4
     b60:	00479793          	sll	a5,a5,0x4
     b64:	00e787b3          	add	a5,a5,a4
     b68:	00279793          	sll	a5,a5,0x2
     b6c:	fe078793          	add	a5,a5,-32
     b70:	008787b3          	add	a5,a5,s0
     b74:	fd27d783          	lhu	a5,-46(a5)
     b78:	00078613          	mv	a2,a5
     b7c:	fd841783          	lh	a5,-40(s0)
     b80:	00000713          	li	a4,0
     b84:	00179793          	sll	a5,a5,0x1
     b88:	00f707b3          	add	a5,a4,a5
     b8c:	0007d783          	lhu	a5,0(a5)
     b90:	00078693          	mv	a3,a5
     b94:	13400513          	li	a0,308
     b98:	705040ef          	jal	5a9c <ee_printf>
     b9c:	fde45703          	lhu	a4,-34(s0)
     ba0:	00070793          	mv	a5,a4
     ba4:	00479793          	sll	a5,a5,0x4
     ba8:	00e787b3          	add	a5,a5,a4
     bac:	00279793          	sll	a5,a5,0x2
     bb0:	fe078793          	add	a5,a5,-32
     bb4:	008787b3          	add	a5,a5,s0
     bb8:	fd879783          	lh	a5,-40(a5)
     bbc:	01079793          	sll	a5,a5,0x10
     bc0:	0107d793          	srl	a5,a5,0x10
     bc4:	00178793          	add	a5,a5,1
     bc8:	01079793          	sll	a5,a5,0x10
     bcc:	0107d793          	srl	a5,a5,0x10
     bd0:	01079693          	sll	a3,a5,0x10
     bd4:	4106d693          	sra	a3,a3,0x10
     bd8:	00070793          	mv	a5,a4
     bdc:	00479793          	sll	a5,a5,0x4
     be0:	00e787b3          	add	a5,a5,a4
     be4:	00279793          	sll	a5,a5,0x2
     be8:	fe078793          	add	a5,a5,-32
     bec:	008787b3          	add	a5,a5,s0
     bf0:	fcd79c23          	sh	a3,-40(a5)
     bf4:	fde45703          	lhu	a4,-34(s0)
     bf8:	00070793          	mv	a5,a4
     bfc:	00479793          	sll	a5,a5,0x4
     c00:	00e787b3          	add	a5,a5,a4
     c04:	00279793          	sll	a5,a5,0x2
     c08:	fe078793          	add	a5,a5,-32
     c0c:	008787b3          	add	a5,a5,s0
     c10:	fb87a783          	lw	a5,-72(a5)
     c14:	0027f793          	and	a5,a5,2
     c18:	0c078e63          	beqz	a5,cf4 <_trap_stack_size+0x2f4>
     c1c:	fde45703          	lhu	a4,-34(s0)
     c20:	00070793          	mv	a5,a4
     c24:	00479793          	sll	a5,a5,0x4
     c28:	00e787b3          	add	a5,a5,a4
     c2c:	00279793          	sll	a5,a5,0x2
     c30:	fe078793          	add	a5,a5,-32
     c34:	008787b3          	add	a5,a5,s0
     c38:	fd47d703          	lhu	a4,-44(a5)
     c3c:	fd841783          	lh	a5,-40(s0)
     c40:	00c00693          	li	a3,12
     c44:	00179793          	sll	a5,a5,0x1
     c48:	00f687b3          	add	a5,a3,a5
     c4c:	0007d783          	lhu	a5,0(a5)
     c50:	0af70263          	beq	a4,a5,cf4 <_trap_stack_size+0x2f4>
     c54:	fde45583          	lhu	a1,-34(s0)
     c58:	fde45703          	lhu	a4,-34(s0)
     c5c:	00070793          	mv	a5,a4
     c60:	00479793          	sll	a5,a5,0x4
     c64:	00e787b3          	add	a5,a5,a4
     c68:	00279793          	sll	a5,a5,0x2
     c6c:	fe078793          	add	a5,a5,-32
     c70:	008787b3          	add	a5,a5,s0
     c74:	fd47d783          	lhu	a5,-44(a5)
     c78:	00078613          	mv	a2,a5
     c7c:	fd841783          	lh	a5,-40(s0)
     c80:	00c00713          	li	a4,12
     c84:	00179793          	sll	a5,a5,0x1
     c88:	00f707b3          	add	a5,a4,a5
     c8c:	0007d783          	lhu	a5,0(a5)
     c90:	00078693          	mv	a3,a5
     c94:	16400513          	li	a0,356
     c98:	605040ef          	jal	5a9c <ee_printf>
     c9c:	fde45703          	lhu	a4,-34(s0)
     ca0:	00070793          	mv	a5,a4
     ca4:	00479793          	sll	a5,a5,0x4
     ca8:	00e787b3          	add	a5,a5,a4
     cac:	00279793          	sll	a5,a5,0x2
     cb0:	fe078793          	add	a5,a5,-32
     cb4:	008787b3          	add	a5,a5,s0
     cb8:	fd879783          	lh	a5,-40(a5)
     cbc:	01079793          	sll	a5,a5,0x10
     cc0:	0107d793          	srl	a5,a5,0x10
     cc4:	00178793          	add	a5,a5,1
     cc8:	01079793          	sll	a5,a5,0x10
     ccc:	0107d793          	srl	a5,a5,0x10
     cd0:	01079693          	sll	a3,a5,0x10
     cd4:	4106d693          	sra	a3,a3,0x10
     cd8:	00070793          	mv	a5,a4
     cdc:	00479793          	sll	a5,a5,0x4
     ce0:	00e787b3          	add	a5,a5,a4
     ce4:	00279793          	sll	a5,a5,0x2
     ce8:	fe078793          	add	a5,a5,-32
     cec:	008787b3          	add	a5,a5,s0
     cf0:	fcd79c23          	sh	a3,-40(a5)
     cf4:	fde45703          	lhu	a4,-34(s0)
     cf8:	00070793          	mv	a5,a4
     cfc:	00479793          	sll	a5,a5,0x4
     d00:	00e787b3          	add	a5,a5,a4
     d04:	00279793          	sll	a5,a5,0x2
     d08:	fe078793          	add	a5,a5,-32
     d0c:	008787b3          	add	a5,a5,s0
     d10:	fb87a783          	lw	a5,-72(a5)
     d14:	0047f793          	and	a5,a5,4
     d18:	0c078e63          	beqz	a5,df4 <_trap_stack_size+0x3f4>
     d1c:	fde45703          	lhu	a4,-34(s0)
     d20:	00070793          	mv	a5,a4
     d24:	00479793          	sll	a5,a5,0x4
     d28:	00e787b3          	add	a5,a5,a4
     d2c:	00279793          	sll	a5,a5,0x2
     d30:	fe078793          	add	a5,a5,-32
     d34:	008787b3          	add	a5,a5,s0
     d38:	fd67d703          	lhu	a4,-42(a5)
     d3c:	fd841783          	lh	a5,-40(s0)
     d40:	01800693          	li	a3,24
     d44:	00179793          	sll	a5,a5,0x1
     d48:	00f687b3          	add	a5,a3,a5
     d4c:	0007d783          	lhu	a5,0(a5)
     d50:	0af70263          	beq	a4,a5,df4 <_trap_stack_size+0x3f4>
     d54:	fde45583          	lhu	a1,-34(s0)
     d58:	fde45703          	lhu	a4,-34(s0)
     d5c:	00070793          	mv	a5,a4
     d60:	00479793          	sll	a5,a5,0x4
     d64:	00e787b3          	add	a5,a5,a4
     d68:	00279793          	sll	a5,a5,0x2
     d6c:	fe078793          	add	a5,a5,-32
     d70:	008787b3          	add	a5,a5,s0
     d74:	fd67d783          	lhu	a5,-42(a5)
     d78:	00078613          	mv	a2,a5
     d7c:	fd841783          	lh	a5,-40(s0)
     d80:	01800713          	li	a4,24
     d84:	00179793          	sll	a5,a5,0x1
     d88:	00f707b3          	add	a5,a4,a5
     d8c:	0007d783          	lhu	a5,0(a5)
     d90:	00078693          	mv	a3,a5
     d94:	19800513          	li	a0,408
     d98:	505040ef          	jal	5a9c <ee_printf>
     d9c:	fde45703          	lhu	a4,-34(s0)
     da0:	00070793          	mv	a5,a4
     da4:	00479793          	sll	a5,a5,0x4
     da8:	00e787b3          	add	a5,a5,a4
     dac:	00279793          	sll	a5,a5,0x2
     db0:	fe078793          	add	a5,a5,-32
     db4:	008787b3          	add	a5,a5,s0
     db8:	fd879783          	lh	a5,-40(a5)
     dbc:	01079793          	sll	a5,a5,0x10
     dc0:	0107d793          	srl	a5,a5,0x10
     dc4:	00178793          	add	a5,a5,1
     dc8:	01079793          	sll	a5,a5,0x10
     dcc:	0107d793          	srl	a5,a5,0x10
     dd0:	01079693          	sll	a3,a5,0x10
     dd4:	4106d693          	sra	a3,a3,0x10
     dd8:	00070793          	mv	a5,a4
     ddc:	00479793          	sll	a5,a5,0x4
     de0:	00e787b3          	add	a5,a5,a4
     de4:	00279793          	sll	a5,a5,0x2
     de8:	fe078793          	add	a5,a5,-32
     dec:	008787b3          	add	a5,a5,s0
     df0:	fcd79c23          	sh	a3,-40(a5)
     df4:	fde45703          	lhu	a4,-34(s0)
     df8:	00070793          	mv	a5,a4
     dfc:	00479793          	sll	a5,a5,0x4
     e00:	00e787b3          	add	a5,a5,a4
     e04:	00279793          	sll	a5,a5,0x2
     e08:	fe078793          	add	a5,a5,-32
     e0c:	008787b3          	add	a5,a5,s0
     e10:	fd879783          	lh	a5,-40(a5)
     e14:	01079713          	sll	a4,a5,0x10
     e18:	01075713          	srl	a4,a4,0x10
     e1c:	fd645783          	lhu	a5,-42(s0)
     e20:	00f707b3          	add	a5,a4,a5
     e24:	01079793          	sll	a5,a5,0x10
     e28:	0107d793          	srl	a5,a5,0x10
     e2c:	fcf41b23          	sh	a5,-42(s0)
     e30:	fde45783          	lhu	a5,-34(s0)
     e34:	00178793          	add	a5,a5,1
     e38:	fcf41f23          	sh	a5,-34(s0)
     e3c:	fde45703          	lhu	a4,-34(s0)
     e40:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     e44:	c8f768e3          	bltu	a4,a5,ad4 <_trap_stack_size+0xd4>
     e48:	2b5020ef          	jal	38fc <check_data_types>
     e4c:	00050793          	mv	a5,a0
     e50:	00078713          	mv	a4,a5
     e54:	fd645783          	lhu	a5,-42(s0)
     e58:	00f707b3          	add	a5,a4,a5
     e5c:	01079793          	sll	a5,a5,0x10
     e60:	0107d793          	srl	a5,a5,0x10
     e64:	fcf41b23          	sh	a5,-42(s0)
     e68:	f9042783          	lw	a5,-112(s0)
     e6c:	00078593          	mv	a1,a5
     e70:	1c800513          	li	a0,456
     e74:	429040ef          	jal	5a9c <ee_printf>
     e78:	fbc42583          	lw	a1,-68(s0)
     e7c:	1e000513          	li	a0,480
     e80:	41d040ef          	jal	5a9c <ee_printf>
     e84:	fbc42503          	lw	a0,-68(s0)
     e88:	385020ef          	jal	3a0c <time_in_secs>
     e8c:	00050713          	mv	a4,a0
     e90:	00058793          	mv	a5,a1
     e94:	00070613          	mv	a2,a4
     e98:	00078693          	mv	a3,a5
     e9c:	1f800513          	li	a0,504
     ea0:	3fd040ef          	jal	5a9c <ee_printf>
     ea4:	fbc42503          	lw	a0,-68(s0)
     ea8:	365020ef          	jal	3a0c <time_in_secs>
     eac:	00050713          	mv	a4,a0
     eb0:	00058793          	mv	a5,a1
     eb4:	00000613          	li	a2,0
     eb8:	00000693          	li	a3,0
     ebc:	00070513          	mv	a0,a4
     ec0:	00078593          	mv	a1,a5
     ec4:	68d050ef          	jal	6d50 <__gedf2>
     ec8:	00050793          	mv	a5,a0
     ecc:	06f05463          	blez	a5,f34 <_trap_stack_size+0x534>
     ed0:	f9442703          	lw	a4,-108(s0)
     ed4:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     ed8:	00078593          	mv	a1,a5
     edc:	00070513          	mv	a0,a4
     ee0:	1c5060ef          	jal	78a4 <__mulsi3>
     ee4:	00050793          	mv	a5,a0
     ee8:	00078513          	mv	a0,a5
     eec:	0f5060ef          	jal	77e0 <__floatunsidf>
     ef0:	00050913          	mv	s2,a0
     ef4:	00058993          	mv	s3,a1
     ef8:	fbc42503          	lw	a0,-68(s0)
     efc:	311020ef          	jal	3a0c <time_in_secs>
     f00:	00050713          	mv	a4,a0
     f04:	00058793          	mv	a5,a1
     f08:	00070613          	mv	a2,a4
     f0c:	00078693          	mv	a3,a5
     f10:	00090513          	mv	a0,s2
     f14:	00098593          	mv	a1,s3
     f18:	504050ef          	jal	641c <__divdf3>
     f1c:	00050713          	mv	a4,a0
     f20:	00058793          	mv	a5,a1
     f24:	00070613          	mv	a2,a4
     f28:	00078693          	mv	a3,a5
     f2c:	21000513          	li	a0,528
     f30:	36d040ef          	jal	5a9c <ee_printf>
     f34:	fbc42503          	lw	a0,-68(s0)
     f38:	2d5020ef          	jal	3a0c <time_in_secs>
     f3c:	00050713          	mv	a4,a0
     f40:	00058793          	mv	a5,a1
     f44:	48002603          	lw	a2,1152(zero) # 480 <main+0x224>
     f48:	48402683          	lw	a3,1156(zero) # 484 <main+0x228>
     f4c:	00070513          	mv	a0,a4
     f50:	00078593          	mv	a1,a5
     f54:	6fd050ef          	jal	6e50 <__ledf2>
     f58:	00050793          	mv	a5,a0
     f5c:	0207d463          	bgez	a5,f84 <_trap_stack_size+0x584>
     f60:	22800513          	li	a0,552
     f64:	339040ef          	jal	5a9c <ee_printf>
     f68:	fd641783          	lh	a5,-42(s0)
     f6c:	01079793          	sll	a5,a5,0x10
     f70:	0107d793          	srl	a5,a5,0x10
     f74:	00178793          	add	a5,a5,1
     f78:	01079793          	sll	a5,a5,0x10
     f7c:	0107d793          	srl	a5,a5,0x10
     f80:	fcf41b23          	sh	a5,-42(s0)
     f84:	f9442703          	lw	a4,-108(s0)
     f88:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     f8c:	00078593          	mv	a1,a5
     f90:	00070513          	mv	a0,a4
     f94:	111060ef          	jal	78a4 <__mulsi3>
     f98:	00050793          	mv	a5,a0
     f9c:	00078593          	mv	a1,a5
     fa0:	26800513          	li	a0,616
     fa4:	2f9040ef          	jal	5a9c <ee_printf>
     fa8:	28000593          	li	a1,640
     fac:	28c00513          	li	a0,652
     fb0:	2ed040ef          	jal	5a9c <ee_printf>
     fb4:	2a400593          	li	a1,676
     fb8:	2c400513          	li	a0,708
     fbc:	2e1040ef          	jal	5a9c <ee_printf>
     fc0:	2dc00593          	li	a1,732
     fc4:	2e400513          	li	a0,740
     fc8:	2d5040ef          	jal	5a9c <ee_printf>
     fcc:	fc245783          	lhu	a5,-62(s0)
     fd0:	00078593          	mv	a1,a5
     fd4:	2fc00513          	li	a0,764
     fd8:	2c5040ef          	jal	5a9c <ee_printf>
     fdc:	f9842783          	lw	a5,-104(s0)
     fe0:	0017f793          	and	a5,a5,1
     fe4:	04078c63          	beqz	a5,103c <_trap_stack_size+0x63c>
     fe8:	fc041f23          	sh	zero,-34(s0)
     fec:	0440006f          	j	1030 <_trap_stack_size+0x630>
     ff0:	fde45683          	lhu	a3,-34(s0)
     ff4:	fde45703          	lhu	a4,-34(s0)
     ff8:	00070793          	mv	a5,a4
     ffc:	00479793          	sll	a5,a5,0x4
    1000:	00e787b3          	add	a5,a5,a4
    1004:	00279793          	sll	a5,a5,0x2
    1008:	fe078793          	add	a5,a5,-32
    100c:	008787b3          	add	a5,a5,s0
    1010:	fd27d783          	lhu	a5,-46(a5)
    1014:	00078613          	mv	a2,a5
    1018:	00068593          	mv	a1,a3
    101c:	31800513          	li	a0,792
    1020:	27d040ef          	jal	5a9c <ee_printf>
    1024:	fde45783          	lhu	a5,-34(s0)
    1028:	00178793          	add	a5,a5,1
    102c:	fcf41f23          	sh	a5,-34(s0)
    1030:	fde45703          	lhu	a4,-34(s0)
    1034:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    1038:	faf76ce3          	bltu	a4,a5,ff0 <_trap_stack_size+0x5f0>
    103c:	f9842783          	lw	a5,-104(s0)
    1040:	0027f793          	and	a5,a5,2
    1044:	04078c63          	beqz	a5,109c <_trap_stack_size+0x69c>
    1048:	fc041f23          	sh	zero,-34(s0)
    104c:	0440006f          	j	1090 <_trap_stack_size+0x690>
    1050:	fde45683          	lhu	a3,-34(s0)
    1054:	fde45703          	lhu	a4,-34(s0)
    1058:	00070793          	mv	a5,a4
    105c:	00479793          	sll	a5,a5,0x4
    1060:	00e787b3          	add	a5,a5,a4
    1064:	00279793          	sll	a5,a5,0x2
    1068:	fe078793          	add	a5,a5,-32
    106c:	008787b3          	add	a5,a5,s0
    1070:	fd47d783          	lhu	a5,-44(a5)
    1074:	00078613          	mv	a2,a5
    1078:	00068593          	mv	a1,a3
    107c:	33400513          	li	a0,820
    1080:	21d040ef          	jal	5a9c <ee_printf>
    1084:	fde45783          	lhu	a5,-34(s0)
    1088:	00178793          	add	a5,a5,1
    108c:	fcf41f23          	sh	a5,-34(s0)
    1090:	fde45703          	lhu	a4,-34(s0)
    1094:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    1098:	faf76ce3          	bltu	a4,a5,1050 <_trap_stack_size+0x650>
    109c:	f9842783          	lw	a5,-104(s0)
    10a0:	0047f793          	and	a5,a5,4
    10a4:	04078c63          	beqz	a5,10fc <_trap_stack_size+0x6fc>
    10a8:	fc041f23          	sh	zero,-34(s0)
    10ac:	0440006f          	j	10f0 <_trap_stack_size+0x6f0>
    10b0:	fde45683          	lhu	a3,-34(s0)
    10b4:	fde45703          	lhu	a4,-34(s0)
    10b8:	00070793          	mv	a5,a4
    10bc:	00479793          	sll	a5,a5,0x4
    10c0:	00e787b3          	add	a5,a5,a4
    10c4:	00279793          	sll	a5,a5,0x2
    10c8:	fe078793          	add	a5,a5,-32
    10cc:	008787b3          	add	a5,a5,s0
    10d0:	fd67d783          	lhu	a5,-42(a5)
    10d4:	00078613          	mv	a2,a5
    10d8:	00068593          	mv	a1,a3
    10dc:	35000513          	li	a0,848
    10e0:	1bd040ef          	jal	5a9c <ee_printf>
    10e4:	fde45783          	lhu	a5,-34(s0)
    10e8:	00178793          	add	a5,a5,1
    10ec:	fcf41f23          	sh	a5,-34(s0)
    10f0:	fde45703          	lhu	a4,-34(s0)
    10f4:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    10f8:	faf76ce3          	bltu	a4,a5,10b0 <_trap_stack_size+0x6b0>
    10fc:	fc041f23          	sh	zero,-34(s0)
    1100:	0440006f          	j	1144 <_trap_stack_size+0x744>
    1104:	fde45683          	lhu	a3,-34(s0)
    1108:	fde45703          	lhu	a4,-34(s0)
    110c:	00070793          	mv	a5,a4
    1110:	00479793          	sll	a5,a5,0x4
    1114:	00e787b3          	add	a5,a5,a4
    1118:	00279793          	sll	a5,a5,0x2
    111c:	fe078793          	add	a5,a5,-32
    1120:	008787b3          	add	a5,a5,s0
    1124:	fd07d783          	lhu	a5,-48(a5)
    1128:	00078613          	mv	a2,a5
    112c:	00068593          	mv	a1,a3
    1130:	36c00513          	li	a0,876
    1134:	169040ef          	jal	5a9c <ee_printf>
    1138:	fde45783          	lhu	a5,-34(s0)
    113c:	00178793          	add	a5,a5,1
    1140:	fcf41f23          	sh	a5,-34(s0)
    1144:	fde45703          	lhu	a4,-34(s0)
    1148:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    114c:	faf76ce3          	bltu	a4,a5,1104 <_trap_stack_size+0x704>
    1150:	fd641783          	lh	a5,-42(s0)
    1154:	08079c63          	bnez	a5,11ec <_trap_stack_size+0x7ec>
    1158:	38800513          	li	a0,904
    115c:	141040ef          	jal	5a9c <ee_printf>
    1160:	fd841703          	lh	a4,-40(s0)
    1164:	00300793          	li	a5,3
    1168:	08f71263          	bne	a4,a5,11ec <_trap_stack_size+0x7ec>
    116c:	f9442703          	lw	a4,-108(s0)
    1170:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    1174:	00078593          	mv	a1,a5
    1178:	00070513          	mv	a0,a4
    117c:	728060ef          	jal	78a4 <__mulsi3>
    1180:	00050793          	mv	a5,a0
    1184:	00078513          	mv	a0,a5
    1188:	658060ef          	jal	77e0 <__floatunsidf>
    118c:	00050913          	mv	s2,a0
    1190:	00058993          	mv	s3,a1
    1194:	fbc42503          	lw	a0,-68(s0)
    1198:	075020ef          	jal	3a0c <time_in_secs>
    119c:	00050713          	mv	a4,a0
    11a0:	00058793          	mv	a5,a1
    11a4:	00070613          	mv	a2,a4
    11a8:	00078693          	mv	a3,a5
    11ac:	00090513          	mv	a0,s2
    11b0:	00098593          	mv	a1,s3
    11b4:	268050ef          	jal	641c <__divdf3>
    11b8:	00050713          	mv	a4,a0
    11bc:	00058793          	mv	a5,a1
    11c0:	00070613          	mv	a2,a4
    11c4:	00078693          	mv	a3,a5
    11c8:	2a400793          	li	a5,676
    11cc:	28000713          	li	a4,640
    11d0:	3d400513          	li	a0,980
    11d4:	0c9040ef          	jal	5a9c <ee_printf>
    11d8:	2dc00593          	li	a1,732
    11dc:	3f000513          	li	a0,1008
    11e0:	0bd040ef          	jal	5a9c <ee_printf>
    11e4:	3f800513          	li	a0,1016
    11e8:	0b5040ef          	jal	5a9c <ee_printf>
    11ec:	fd641783          	lh	a5,-42(s0)
    11f0:	00f05663          	blez	a5,11fc <_trap_stack_size+0x7fc>
    11f4:	3fc00513          	li	a0,1020
    11f8:	0a5040ef          	jal	5a9c <ee_printf>
    11fc:	fd641783          	lh	a5,-42(s0)
    1200:	0007d663          	bgez	a5,120c <_trap_stack_size+0x80c>
    1204:	41000513          	li	a0,1040
    1208:	095040ef          	jal	5a9c <ee_printf>
    120c:	f7840793          	add	a5,s0,-136
    1210:	04278793          	add	a5,a5,66
    1214:	00078513          	mv	a0,a5
    1218:	0cd020ef          	jal	3ae4 <portable_fini>
    121c:	00000793          	li	a5,0
    1220:	00078513          	mv	a0,a5
    1224:	08010113          	add	sp,sp,128
    1228:	7ec12083          	lw	ra,2028(sp)
    122c:	7e812403          	lw	s0,2024(sp)
    1230:	7e412483          	lw	s1,2020(sp)
    1234:	7e012903          	lw	s2,2016(sp)
    1238:	7dc12983          	lw	s3,2012(sp)
    123c:	7f010113          	add	sp,sp,2032
    1240:	00008067          	ret

00001244 <calc_func>:
    1244:	fd010113          	add	sp,sp,-48
    1248:	02112623          	sw	ra,44(sp)
    124c:	02812423          	sw	s0,40(sp)
    1250:	03010413          	add	s0,sp,48
    1254:	fca42e23          	sw	a0,-36(s0)
    1258:	fcb42c23          	sw	a1,-40(s0)
    125c:	fdc42783          	lw	a5,-36(s0)
    1260:	0007d783          	lhu	a5,0(a5)
    1264:	fef41523          	sh	a5,-22(s0)
    1268:	fea41783          	lh	a5,-22(s0)
    126c:	4077d793          	sra	a5,a5,0x7
    1270:	01079793          	sll	a5,a5,0x10
    1274:	4107d793          	sra	a5,a5,0x10
    1278:	0ff7f793          	zext.b	a5,a5
    127c:	0017f793          	and	a5,a5,1
    1280:	fef404a3          	sb	a5,-23(s0)
    1284:	fe944783          	lbu	a5,-23(s0)
    1288:	00078c63          	beqz	a5,12a0 <calc_func+0x5c>
    128c:	fea45783          	lhu	a5,-22(s0)
    1290:	07f7f793          	and	a5,a5,127
    1294:	01079793          	sll	a5,a5,0x10
    1298:	4107d793          	sra	a5,a5,0x10
    129c:	18c0006f          	j	1428 <calc_func+0x1e4>
    12a0:	fea45783          	lhu	a5,-22(s0)
    12a4:	0077f793          	and	a5,a5,7
    12a8:	fef41323          	sh	a5,-26(s0)
    12ac:	fea41783          	lh	a5,-22(s0)
    12b0:	4037d793          	sra	a5,a5,0x3
    12b4:	01079793          	sll	a5,a5,0x10
    12b8:	4107d793          	sra	a5,a5,0x10
    12bc:	00f7f793          	and	a5,a5,15
    12c0:	fef41623          	sh	a5,-20(s0)
    12c4:	fec45783          	lhu	a5,-20(s0)
    12c8:	00479793          	sll	a5,a5,0x4
    12cc:	01079793          	sll	a5,a5,0x10
    12d0:	4107d793          	sra	a5,a5,0x10
    12d4:	fec45703          	lhu	a4,-20(s0)
    12d8:	00e7e7b3          	or	a5,a5,a4
    12dc:	fef41623          	sh	a5,-20(s0)
    12e0:	fe641783          	lh	a5,-26(s0)
    12e4:	00078863          	beqz	a5,12f4 <calc_func+0xb0>
    12e8:	00100713          	li	a4,1
    12ec:	06e78863          	beq	a5,a4,135c <calc_func+0x118>
    12f0:	0b40006f          	j	13a4 <calc_func+0x160>
    12f4:	fec41703          	lh	a4,-20(s0)
    12f8:	02100793          	li	a5,33
    12fc:	00e7c663          	blt	a5,a4,1308 <calc_func+0xc4>
    1300:	02200793          	li	a5,34
    1304:	fef41623          	sh	a5,-20(s0)
    1308:	fd842783          	lw	a5,-40(s0)
    130c:	0187a503          	lw	a0,24(a5)
    1310:	fd842783          	lw	a5,-40(s0)
    1314:	0147a583          	lw	a1,20(a5)
    1318:	fd842783          	lw	a5,-40(s0)
    131c:	00079603          	lh	a2,0(a5)
    1320:	fd842783          	lw	a5,-40(s0)
    1324:	00279683          	lh	a3,2(a5)
    1328:	fd842783          	lw	a5,-40(s0)
    132c:	0387d783          	lhu	a5,56(a5)
    1330:	fec41703          	lh	a4,-20(s0)
    1334:	1c1010ef          	jal	2cf4 <core_bench_state>
    1338:	00050793          	mv	a5,a0
    133c:	fef41723          	sh	a5,-18(s0)
    1340:	fd842783          	lw	a5,-40(s0)
    1344:	03e7d783          	lhu	a5,62(a5)
    1348:	06079463          	bnez	a5,13b0 <calc_func+0x16c>
    134c:	fee45703          	lhu	a4,-18(s0)
    1350:	fd842783          	lw	a5,-40(s0)
    1354:	02e79f23          	sh	a4,62(a5)
    1358:	0580006f          	j	13b0 <calc_func+0x16c>
    135c:	fd842783          	lw	a5,-40(s0)
    1360:	02878713          	add	a4,a5,40
    1364:	fd842783          	lw	a5,-40(s0)
    1368:	0387d683          	lhu	a3,56(a5)
    136c:	fec41783          	lh	a5,-20(s0)
    1370:	00068613          	mv	a2,a3
    1374:	00078593          	mv	a1,a5
    1378:	00070513          	mv	a0,a4
    137c:	515000ef          	jal	2090 <core_bench_matrix>
    1380:	00050793          	mv	a5,a0
    1384:	fef41723          	sh	a5,-18(s0)
    1388:	fd842783          	lw	a5,-40(s0)
    138c:	03c7d783          	lhu	a5,60(a5)
    1390:	02079463          	bnez	a5,13b8 <calc_func+0x174>
    1394:	fee45703          	lhu	a4,-18(s0)
    1398:	fd842783          	lw	a5,-40(s0)
    139c:	02e79e23          	sh	a4,60(a5)
    13a0:	0180006f          	j	13b8 <calc_func+0x174>
    13a4:	fea45783          	lhu	a5,-22(s0)
    13a8:	fef41723          	sh	a5,-18(s0)
    13ac:	0100006f          	j	13bc <calc_func+0x178>
    13b0:	00000013          	nop
    13b4:	0080006f          	j	13bc <calc_func+0x178>
    13b8:	00000013          	nop
    13bc:	fee45703          	lhu	a4,-18(s0)
    13c0:	fd842783          	lw	a5,-40(s0)
    13c4:	0387d783          	lhu	a5,56(a5)
    13c8:	00078593          	mv	a1,a5
    13cc:	00070513          	mv	a0,a4
    13d0:	3d4020ef          	jal	37a4 <crcu16>
    13d4:	00050793          	mv	a5,a0
    13d8:	00078713          	mv	a4,a5
    13dc:	fd842783          	lw	a5,-40(s0)
    13e0:	02e79c23          	sh	a4,56(a5)
    13e4:	fee45783          	lhu	a5,-18(s0)
    13e8:	07f7f793          	and	a5,a5,127
    13ec:	fef41723          	sh	a5,-18(s0)
    13f0:	fea45783          	lhu	a5,-22(s0)
    13f4:	f007f793          	and	a5,a5,-256
    13f8:	01079793          	sll	a5,a5,0x10
    13fc:	4107d793          	sra	a5,a5,0x10
    1400:	0807e793          	or	a5,a5,128
    1404:	01079793          	sll	a5,a5,0x10
    1408:	4107d793          	sra	a5,a5,0x10
    140c:	fee45703          	lhu	a4,-18(s0)
    1410:	00e7e7b3          	or	a5,a5,a4
    1414:	01079713          	sll	a4,a5,0x10
    1418:	41075713          	sra	a4,a4,0x10
    141c:	fdc42783          	lw	a5,-36(s0)
    1420:	00e79023          	sh	a4,0(a5)
    1424:	fee41783          	lh	a5,-18(s0)
    1428:	00078513          	mv	a0,a5
    142c:	02c12083          	lw	ra,44(sp)
    1430:	02812403          	lw	s0,40(sp)
    1434:	03010113          	add	sp,sp,48
    1438:	00008067          	ret

0000143c <cmp_complex>:
    143c:	fd010113          	add	sp,sp,-48
    1440:	02112623          	sw	ra,44(sp)
    1444:	02812423          	sw	s0,40(sp)
    1448:	03010413          	add	s0,sp,48
    144c:	fca42e23          	sw	a0,-36(s0)
    1450:	fcb42c23          	sw	a1,-40(s0)
    1454:	fcc42a23          	sw	a2,-44(s0)
    1458:	fdc42783          	lw	a5,-36(s0)
    145c:	fd442583          	lw	a1,-44(s0)
    1460:	00078513          	mv	a0,a5
    1464:	de1ff0ef          	jal	1244 <calc_func>
    1468:	00050793          	mv	a5,a0
    146c:	fef41723          	sh	a5,-18(s0)
    1470:	fd842783          	lw	a5,-40(s0)
    1474:	fd442583          	lw	a1,-44(s0)
    1478:	00078513          	mv	a0,a5
    147c:	dc9ff0ef          	jal	1244 <calc_func>
    1480:	00050793          	mv	a5,a0
    1484:	fef41623          	sh	a5,-20(s0)
    1488:	fee41703          	lh	a4,-18(s0)
    148c:	fec41783          	lh	a5,-20(s0)
    1490:	40f707b3          	sub	a5,a4,a5
    1494:	00078513          	mv	a0,a5
    1498:	02c12083          	lw	ra,44(sp)
    149c:	02812403          	lw	s0,40(sp)
    14a0:	03010113          	add	sp,sp,48
    14a4:	00008067          	ret

000014a8 <cmp_idx>:
    14a8:	fe010113          	add	sp,sp,-32
    14ac:	00812e23          	sw	s0,28(sp)
    14b0:	02010413          	add	s0,sp,32
    14b4:	fea42623          	sw	a0,-20(s0)
    14b8:	feb42423          	sw	a1,-24(s0)
    14bc:	fec42223          	sw	a2,-28(s0)
    14c0:	fe442783          	lw	a5,-28(s0)
    14c4:	08079e63          	bnez	a5,1560 <cmp_idx+0xb8>
    14c8:	fec42783          	lw	a5,-20(s0)
    14cc:	00079783          	lh	a5,0(a5)
    14d0:	f007f793          	and	a5,a5,-256
    14d4:	01079713          	sll	a4,a5,0x10
    14d8:	41075713          	sra	a4,a4,0x10
    14dc:	fec42783          	lw	a5,-20(s0)
    14e0:	00079783          	lh	a5,0(a5)
    14e4:	01079793          	sll	a5,a5,0x10
    14e8:	0107d793          	srl	a5,a5,0x10
    14ec:	0087d793          	srl	a5,a5,0x8
    14f0:	01079793          	sll	a5,a5,0x10
    14f4:	0107d793          	srl	a5,a5,0x10
    14f8:	01079793          	sll	a5,a5,0x10
    14fc:	4107d793          	sra	a5,a5,0x10
    1500:	00f767b3          	or	a5,a4,a5
    1504:	01079713          	sll	a4,a5,0x10
    1508:	41075713          	sra	a4,a4,0x10
    150c:	fec42783          	lw	a5,-20(s0)
    1510:	00e79023          	sh	a4,0(a5)
    1514:	fe842783          	lw	a5,-24(s0)
    1518:	00079783          	lh	a5,0(a5)
    151c:	f007f793          	and	a5,a5,-256
    1520:	01079713          	sll	a4,a5,0x10
    1524:	41075713          	sra	a4,a4,0x10
    1528:	fe842783          	lw	a5,-24(s0)
    152c:	00079783          	lh	a5,0(a5)
    1530:	01079793          	sll	a5,a5,0x10
    1534:	0107d793          	srl	a5,a5,0x10
    1538:	0087d793          	srl	a5,a5,0x8
    153c:	01079793          	sll	a5,a5,0x10
    1540:	0107d793          	srl	a5,a5,0x10
    1544:	01079793          	sll	a5,a5,0x10
    1548:	4107d793          	sra	a5,a5,0x10
    154c:	00f767b3          	or	a5,a4,a5
    1550:	01079713          	sll	a4,a5,0x10
    1554:	41075713          	sra	a4,a4,0x10
    1558:	fe842783          	lw	a5,-24(s0)
    155c:	00e79023          	sh	a4,0(a5)
    1560:	fec42783          	lw	a5,-20(s0)
    1564:	00279783          	lh	a5,2(a5)
    1568:	00078713          	mv	a4,a5
    156c:	fe842783          	lw	a5,-24(s0)
    1570:	00279783          	lh	a5,2(a5)
    1574:	40f707b3          	sub	a5,a4,a5
    1578:	00078513          	mv	a0,a5
    157c:	01c12403          	lw	s0,28(sp)
    1580:	02010113          	add	sp,sp,32
    1584:	00008067          	ret

00001588 <copy_info>:
    1588:	fe010113          	add	sp,sp,-32
    158c:	00812e23          	sw	s0,28(sp)
    1590:	02010413          	add	s0,sp,32
    1594:	fea42623          	sw	a0,-20(s0)
    1598:	feb42423          	sw	a1,-24(s0)
    159c:	fe842783          	lw	a5,-24(s0)
    15a0:	00079703          	lh	a4,0(a5)
    15a4:	fec42783          	lw	a5,-20(s0)
    15a8:	00e79023          	sh	a4,0(a5)
    15ac:	fe842783          	lw	a5,-24(s0)
    15b0:	00279703          	lh	a4,2(a5)
    15b4:	fec42783          	lw	a5,-20(s0)
    15b8:	00e79123          	sh	a4,2(a5)
    15bc:	00000013          	nop
    15c0:	01c12403          	lw	s0,28(sp)
    15c4:	02010113          	add	sp,sp,32
    15c8:	00008067          	ret

000015cc <core_bench_list>:
    15cc:	fc010113          	add	sp,sp,-64
    15d0:	02112e23          	sw	ra,60(sp)
    15d4:	02812c23          	sw	s0,56(sp)
    15d8:	04010413          	add	s0,sp,64
    15dc:	fca42623          	sw	a0,-52(s0)
    15e0:	00058793          	mv	a5,a1
    15e4:	fcf41523          	sh	a5,-54(s0)
    15e8:	fe041723          	sh	zero,-18(s0)
    15ec:	fe041623          	sh	zero,-20(s0)
    15f0:	fe041523          	sh	zero,-22(s0)
    15f4:	fcc42783          	lw	a5,-52(s0)
    15f8:	0247a783          	lw	a5,36(a5)
    15fc:	fef42223          	sw	a5,-28(s0)
    1600:	fcc42783          	lw	a5,-52(s0)
    1604:	0047d783          	lhu	a5,4(a5)
    1608:	fcf41e23          	sh	a5,-36(s0)
    160c:	fc042823          	sw	zero,-48(s0)
    1610:	fca45783          	lhu	a5,-54(s0)
    1614:	fcf41923          	sh	a5,-46(s0)
    1618:	fc041f23          	sh	zero,-34(s0)
    161c:	1780006f          	j	1794 <core_bench_list+0x1c8>
    1620:	fde45783          	lhu	a5,-34(s0)
    1624:	0ff7f793          	zext.b	a5,a5
    1628:	01079793          	sll	a5,a5,0x10
    162c:	4107d793          	sra	a5,a5,0x10
    1630:	fcf41823          	sh	a5,-48(s0)
    1634:	fd040793          	add	a5,s0,-48
    1638:	00078593          	mv	a1,a5
    163c:	fe442503          	lw	a0,-28(s0)
    1640:	748000ef          	jal	1d88 <core_list_find>
    1644:	fca42a23          	sw	a0,-44(s0)
    1648:	fe442503          	lw	a0,-28(s0)
    164c:	7e0000ef          	jal	1e2c <core_list_reverse>
    1650:	fea42223          	sw	a0,-28(s0)
    1654:	fd442783          	lw	a5,-44(s0)
    1658:	04079863          	bnez	a5,16a8 <core_bench_list+0xdc>
    165c:	fea45783          	lhu	a5,-22(s0)
    1660:	00178793          	add	a5,a5,1
    1664:	fef41523          	sh	a5,-22(s0)
    1668:	fe442783          	lw	a5,-28(s0)
    166c:	0007a783          	lw	a5,0(a5)
    1670:	0047a783          	lw	a5,4(a5)
    1674:	00079783          	lh	a5,0(a5)
    1678:	4087d793          	sra	a5,a5,0x8
    167c:	01079793          	sll	a5,a5,0x10
    1680:	4107d793          	sra	a5,a5,0x10
    1684:	01079793          	sll	a5,a5,0x10
    1688:	0107d793          	srl	a5,a5,0x10
    168c:	0017f793          	and	a5,a5,1
    1690:	01079793          	sll	a5,a5,0x10
    1694:	0107d793          	srl	a5,a5,0x10
    1698:	fee45703          	lhu	a4,-18(s0)
    169c:	00e787b3          	add	a5,a5,a4
    16a0:	fef41723          	sh	a5,-18(s0)
    16a4:	0a80006f          	j	174c <core_bench_list+0x180>
    16a8:	fec45783          	lhu	a5,-20(s0)
    16ac:	00178793          	add	a5,a5,1
    16b0:	fef41623          	sh	a5,-20(s0)
    16b4:	fd442783          	lw	a5,-44(s0)
    16b8:	0047a783          	lw	a5,4(a5)
    16bc:	00079783          	lh	a5,0(a5)
    16c0:	01079793          	sll	a5,a5,0x10
    16c4:	0107d793          	srl	a5,a5,0x10
    16c8:	0017f793          	and	a5,a5,1
    16cc:	02078e63          	beqz	a5,1708 <core_bench_list+0x13c>
    16d0:	fd442783          	lw	a5,-44(s0)
    16d4:	0047a783          	lw	a5,4(a5)
    16d8:	00079783          	lh	a5,0(a5)
    16dc:	4097d793          	sra	a5,a5,0x9
    16e0:	01079793          	sll	a5,a5,0x10
    16e4:	4107d793          	sra	a5,a5,0x10
    16e8:	01079793          	sll	a5,a5,0x10
    16ec:	0107d793          	srl	a5,a5,0x10
    16f0:	0017f793          	and	a5,a5,1
    16f4:	01079793          	sll	a5,a5,0x10
    16f8:	0107d793          	srl	a5,a5,0x10
    16fc:	fee45703          	lhu	a4,-18(s0)
    1700:	00e787b3          	add	a5,a5,a4
    1704:	fef41723          	sh	a5,-18(s0)
    1708:	fd442783          	lw	a5,-44(s0)
    170c:	0007a783          	lw	a5,0(a5)
    1710:	02078e63          	beqz	a5,174c <core_bench_list+0x180>
    1714:	fd442783          	lw	a5,-44(s0)
    1718:	0007a783          	lw	a5,0(a5)
    171c:	fef42023          	sw	a5,-32(s0)
    1720:	fe042783          	lw	a5,-32(s0)
    1724:	0007a703          	lw	a4,0(a5)
    1728:	fd442783          	lw	a5,-44(s0)
    172c:	00e7a023          	sw	a4,0(a5)
    1730:	fe442783          	lw	a5,-28(s0)
    1734:	0007a703          	lw	a4,0(a5)
    1738:	fe042783          	lw	a5,-32(s0)
    173c:	00e7a023          	sw	a4,0(a5)
    1740:	fe442783          	lw	a5,-28(s0)
    1744:	fe042703          	lw	a4,-32(s0)
    1748:	00e7a023          	sw	a4,0(a5)
    174c:	fd241783          	lh	a5,-46(s0)
    1750:	0207c463          	bltz	a5,1778 <core_bench_list+0x1ac>
    1754:	fd241783          	lh	a5,-46(s0)
    1758:	01079793          	sll	a5,a5,0x10
    175c:	0107d793          	srl	a5,a5,0x10
    1760:	00178793          	add	a5,a5,1
    1764:	01079793          	sll	a5,a5,0x10
    1768:	0107d793          	srl	a5,a5,0x10
    176c:	01079793          	sll	a5,a5,0x10
    1770:	4107d793          	sra	a5,a5,0x10
    1774:	fcf41923          	sh	a5,-46(s0)
    1778:	fde41783          	lh	a5,-34(s0)
    177c:	01079793          	sll	a5,a5,0x10
    1780:	0107d793          	srl	a5,a5,0x10
    1784:	00178793          	add	a5,a5,1
    1788:	01079793          	sll	a5,a5,0x10
    178c:	0107d793          	srl	a5,a5,0x10
    1790:	fcf41f23          	sh	a5,-34(s0)
    1794:	fde41703          	lh	a4,-34(s0)
    1798:	fdc41783          	lh	a5,-36(s0)
    179c:	e8f742e3          	blt	a4,a5,1620 <core_bench_list+0x54>
    17a0:	fec45783          	lhu	a5,-20(s0)
    17a4:	00279793          	sll	a5,a5,0x2
    17a8:	01079793          	sll	a5,a5,0x10
    17ac:	0107d793          	srl	a5,a5,0x10
    17b0:	fea45703          	lhu	a4,-22(s0)
    17b4:	40e787b3          	sub	a5,a5,a4
    17b8:	01079793          	sll	a5,a5,0x10
    17bc:	0107d793          	srl	a5,a5,0x10
    17c0:	fee45703          	lhu	a4,-18(s0)
    17c4:	00e787b3          	add	a5,a5,a4
    17c8:	fef41723          	sh	a5,-18(s0)
    17cc:	fca41783          	lh	a5,-54(s0)
    17d0:	00f05e63          	blez	a5,17ec <core_bench_list+0x220>
    17d4:	fcc42603          	lw	a2,-52(s0)
    17d8:	000017b7          	lui	a5,0x1
    17dc:	43c78593          	add	a1,a5,1084 # 143c <cmp_complex>
    17e0:	fe442503          	lw	a0,-28(s0)
    17e4:	6a4000ef          	jal	1e88 <core_list_mergesort>
    17e8:	fea42223          	sw	a0,-28(s0)
    17ec:	fe442783          	lw	a5,-28(s0)
    17f0:	0007a783          	lw	a5,0(a5)
    17f4:	00078513          	mv	a0,a5
    17f8:	4b0000ef          	jal	1ca8 <core_list_remove>
    17fc:	fca42c23          	sw	a0,-40(s0)
    1800:	fd040793          	add	a5,s0,-48
    1804:	00078593          	mv	a1,a5
    1808:	fe442503          	lw	a0,-28(s0)
    180c:	57c000ef          	jal	1d88 <core_list_find>
    1810:	fea42023          	sw	a0,-32(s0)
    1814:	fe042783          	lw	a5,-32(s0)
    1818:	04079263          	bnez	a5,185c <core_bench_list+0x290>
    181c:	fe442783          	lw	a5,-28(s0)
    1820:	0007a783          	lw	a5,0(a5)
    1824:	fef42023          	sw	a5,-32(s0)
    1828:	0340006f          	j	185c <core_bench_list+0x290>
    182c:	fe442783          	lw	a5,-28(s0)
    1830:	0047a783          	lw	a5,4(a5)
    1834:	00079783          	lh	a5,0(a5)
    1838:	fee45703          	lhu	a4,-18(s0)
    183c:	00070593          	mv	a1,a4
    1840:	00078513          	mv	a0,a5
    1844:	068020ef          	jal	38ac <crc16>
    1848:	00050793          	mv	a5,a0
    184c:	fef41723          	sh	a5,-18(s0)
    1850:	fe042783          	lw	a5,-32(s0)
    1854:	0007a783          	lw	a5,0(a5)
    1858:	fef42023          	sw	a5,-32(s0)
    185c:	fe042783          	lw	a5,-32(s0)
    1860:	fc0796e3          	bnez	a5,182c <core_bench_list+0x260>
    1864:	fe442783          	lw	a5,-28(s0)
    1868:	0007a783          	lw	a5,0(a5)
    186c:	00078593          	mv	a1,a5
    1870:	fd842503          	lw	a0,-40(s0)
    1874:	4a8000ef          	jal	1d1c <core_list_undo_remove>
    1878:	fca42c23          	sw	a0,-40(s0)
    187c:	00000613          	li	a2,0
    1880:	000017b7          	lui	a5,0x1
    1884:	4a878593          	add	a1,a5,1192 # 14a8 <cmp_idx>
    1888:	fe442503          	lw	a0,-28(s0)
    188c:	5fc000ef          	jal	1e88 <core_list_mergesort>
    1890:	fea42223          	sw	a0,-28(s0)
    1894:	fe442783          	lw	a5,-28(s0)
    1898:	0007a783          	lw	a5,0(a5)
    189c:	fef42023          	sw	a5,-32(s0)
    18a0:	0340006f          	j	18d4 <core_bench_list+0x308>
    18a4:	fe442783          	lw	a5,-28(s0)
    18a8:	0047a783          	lw	a5,4(a5)
    18ac:	00079783          	lh	a5,0(a5)
    18b0:	fee45703          	lhu	a4,-18(s0)
    18b4:	00070593          	mv	a1,a4
    18b8:	00078513          	mv	a0,a5
    18bc:	7f1010ef          	jal	38ac <crc16>
    18c0:	00050793          	mv	a5,a0
    18c4:	fef41723          	sh	a5,-18(s0)
    18c8:	fe042783          	lw	a5,-32(s0)
    18cc:	0007a783          	lw	a5,0(a5)
    18d0:	fef42023          	sw	a5,-32(s0)
    18d4:	fe042783          	lw	a5,-32(s0)
    18d8:	fc0796e3          	bnez	a5,18a4 <core_bench_list+0x2d8>
    18dc:	fee45783          	lhu	a5,-18(s0)
    18e0:	00078513          	mv	a0,a5
    18e4:	03c12083          	lw	ra,60(sp)
    18e8:	03812403          	lw	s0,56(sp)
    18ec:	04010113          	add	sp,sp,64
    18f0:	00008067          	ret

000018f4 <core_list_init>:
    18f4:	fb010113          	add	sp,sp,-80
    18f8:	04112623          	sw	ra,76(sp)
    18fc:	04812423          	sw	s0,72(sp)
    1900:	05010413          	add	s0,sp,80
    1904:	faa42e23          	sw	a0,-68(s0)
    1908:	fab42c23          	sw	a1,-72(s0)
    190c:	00060793          	mv	a5,a2
    1910:	faf41b23          	sh	a5,-74(s0)
    1914:	01400793          	li	a5,20
    1918:	fef42223          	sw	a5,-28(s0)
    191c:	fe442583          	lw	a1,-28(s0)
    1920:	fbc42503          	lw	a0,-68(s0)
    1924:	7ad050ef          	jal	78d0 <__hidden___udivsi3>
    1928:	00050793          	mv	a5,a0
    192c:	ffe78793          	add	a5,a5,-2
    1930:	fef42023          	sw	a5,-32(s0)
    1934:	fb842703          	lw	a4,-72(s0)
    1938:	fe042783          	lw	a5,-32(s0)
    193c:	00379793          	sll	a5,a5,0x3
    1940:	00f707b3          	add	a5,a4,a5
    1944:	fcf42e23          	sw	a5,-36(s0)
    1948:	fdc42783          	lw	a5,-36(s0)
    194c:	fcf42423          	sw	a5,-56(s0)
    1950:	fc842703          	lw	a4,-56(s0)
    1954:	fe042783          	lw	a5,-32(s0)
    1958:	00279793          	sll	a5,a5,0x2
    195c:	00f707b3          	add	a5,a4,a5
    1960:	fcf42c23          	sw	a5,-40(s0)
    1964:	fb842783          	lw	a5,-72(s0)
    1968:	fcf42a23          	sw	a5,-44(s0)
    196c:	fd442783          	lw	a5,-44(s0)
    1970:	0007a023          	sw	zero,0(a5)
    1974:	fc842703          	lw	a4,-56(s0)
    1978:	fd442783          	lw	a5,-44(s0)
    197c:	00e7a223          	sw	a4,4(a5)
    1980:	fd442783          	lw	a5,-44(s0)
    1984:	0047a783          	lw	a5,4(a5)
    1988:	00079123          	sh	zero,2(a5)
    198c:	fd442783          	lw	a5,-44(s0)
    1990:	0047a783          	lw	a5,4(a5)
    1994:	ffff8737          	lui	a4,0xffff8
    1998:	08070713          	add	a4,a4,128 # ffff8080 <__subdf3+0xffff0490>
    199c:	00e79023          	sh	a4,0(a5)
    19a0:	fb842783          	lw	a5,-72(s0)
    19a4:	00878793          	add	a5,a5,8
    19a8:	faf42c23          	sw	a5,-72(s0)
    19ac:	fc842783          	lw	a5,-56(s0)
    19b0:	00478793          	add	a5,a5,4
    19b4:	fcf42423          	sw	a5,-56(s0)
    19b8:	ffff87b7          	lui	a5,0xffff8
    19bc:	fff7c793          	not	a5,a5
    19c0:	fcf41323          	sh	a5,-58(s0)
    19c4:	fff00793          	li	a5,-1
    19c8:	fcf41223          	sh	a5,-60(s0)
    19cc:	fc840693          	add	a3,s0,-56
    19d0:	fb840613          	add	a2,s0,-72
    19d4:	fc440593          	add	a1,s0,-60
    19d8:	fd842783          	lw	a5,-40(s0)
    19dc:	fdc42703          	lw	a4,-36(s0)
    19e0:	fd442503          	lw	a0,-44(s0)
    19e4:	1d8000ef          	jal	1bbc <core_list_insert_new>
    19e8:	fe042623          	sw	zero,-20(s0)
    19ec:	0a40006f          	j	1a90 <core_list_init+0x19c>
    19f0:	fec42783          	lw	a5,-20(s0)
    19f4:	01079713          	sll	a4,a5,0x10
    19f8:	01075713          	srl	a4,a4,0x10
    19fc:	fb645783          	lhu	a5,-74(s0)
    1a00:	00f747b3          	xor	a5,a4,a5
    1a04:	01079793          	sll	a5,a5,0x10
    1a08:	0107d793          	srl	a5,a5,0x10
    1a0c:	00f7f793          	and	a5,a5,15
    1a10:	fcf41823          	sh	a5,-48(s0)
    1a14:	fd045783          	lhu	a5,-48(s0)
    1a18:	00379793          	sll	a5,a5,0x3
    1a1c:	01079713          	sll	a4,a5,0x10
    1a20:	01075713          	srl	a4,a4,0x10
    1a24:	fec42783          	lw	a5,-20(s0)
    1a28:	01079793          	sll	a5,a5,0x10
    1a2c:	0107d793          	srl	a5,a5,0x10
    1a30:	0077f793          	and	a5,a5,7
    1a34:	01079793          	sll	a5,a5,0x10
    1a38:	0107d793          	srl	a5,a5,0x10
    1a3c:	00f767b3          	or	a5,a4,a5
    1a40:	fcf41723          	sh	a5,-50(s0)
    1a44:	fce41783          	lh	a5,-50(s0)
    1a48:	00879793          	sll	a5,a5,0x8
    1a4c:	01079713          	sll	a4,a5,0x10
    1a50:	41075713          	sra	a4,a4,0x10
    1a54:	fce41783          	lh	a5,-50(s0)
    1a58:	00f767b3          	or	a5,a4,a5
    1a5c:	01079793          	sll	a5,a5,0x10
    1a60:	4107d793          	sra	a5,a5,0x10
    1a64:	fcf41223          	sh	a5,-60(s0)
    1a68:	fc840693          	add	a3,s0,-56
    1a6c:	fb840613          	add	a2,s0,-72
    1a70:	fc440593          	add	a1,s0,-60
    1a74:	fd842783          	lw	a5,-40(s0)
    1a78:	fdc42703          	lw	a4,-36(s0)
    1a7c:	fd442503          	lw	a0,-44(s0)
    1a80:	13c000ef          	jal	1bbc <core_list_insert_new>
    1a84:	fec42783          	lw	a5,-20(s0)
    1a88:	00178793          	add	a5,a5,1 # ffff8001 <__subdf3+0xffff0411>
    1a8c:	fef42623          	sw	a5,-20(s0)
    1a90:	fec42703          	lw	a4,-20(s0)
    1a94:	fe042783          	lw	a5,-32(s0)
    1a98:	f4f76ce3          	bltu	a4,a5,19f0 <core_list_init+0xfc>
    1a9c:	fd442783          	lw	a5,-44(s0)
    1aa0:	0007a783          	lw	a5,0(a5)
    1aa4:	fef42423          	sw	a5,-24(s0)
    1aa8:	00100793          	li	a5,1
    1aac:	fef42623          	sw	a5,-20(s0)
    1ab0:	0d00006f          	j	1b80 <core_list_init+0x28c>
    1ab4:	fe042783          	lw	a5,-32(s0)
    1ab8:	00500593          	li	a1,5
    1abc:	00078513          	mv	a0,a5
    1ac0:	611050ef          	jal	78d0 <__hidden___udivsi3>
    1ac4:	00050793          	mv	a5,a0
    1ac8:	00078713          	mv	a4,a5
    1acc:	fec42783          	lw	a5,-20(s0)
    1ad0:	02e7f463          	bgeu	a5,a4,1af8 <core_list_init+0x204>
    1ad4:	fec42783          	lw	a5,-20(s0)
    1ad8:	00178713          	add	a4,a5,1
    1adc:	fee42623          	sw	a4,-20(s0)
    1ae0:	fe842703          	lw	a4,-24(s0)
    1ae4:	00472703          	lw	a4,4(a4)
    1ae8:	01079793          	sll	a5,a5,0x10
    1aec:	4107d793          	sra	a5,a5,0x10
    1af0:	00f71123          	sh	a5,2(a4)
    1af4:	0800006f          	j	1b74 <core_list_init+0x280>
    1af8:	fec42783          	lw	a5,-20(s0)
    1afc:	00178713          	add	a4,a5,1
    1b00:	fee42623          	sw	a4,-20(s0)
    1b04:	01079713          	sll	a4,a5,0x10
    1b08:	01075713          	srl	a4,a4,0x10
    1b0c:	fb645783          	lhu	a5,-74(s0)
    1b10:	00f747b3          	xor	a5,a4,a5
    1b14:	fcf41923          	sh	a5,-46(s0)
    1b18:	fec42783          	lw	a5,-20(s0)
    1b1c:	01079793          	sll	a5,a5,0x10
    1b20:	0107d793          	srl	a5,a5,0x10
    1b24:	00879793          	sll	a5,a5,0x8
    1b28:	01079793          	sll	a5,a5,0x10
    1b2c:	0107d793          	srl	a5,a5,0x10
    1b30:	7007f793          	and	a5,a5,1792
    1b34:	01079793          	sll	a5,a5,0x10
    1b38:	0107d793          	srl	a5,a5,0x10
    1b3c:	fd245703          	lhu	a4,-46(s0)
    1b40:	00e7e7b3          	or	a5,a5,a4
    1b44:	01079793          	sll	a5,a5,0x10
    1b48:	0107d793          	srl	a5,a5,0x10
    1b4c:	01079693          	sll	a3,a5,0x10
    1b50:	4106d693          	sra	a3,a3,0x10
    1b54:	fe842783          	lw	a5,-24(s0)
    1b58:	0047a783          	lw	a5,4(a5)
    1b5c:	00004737          	lui	a4,0x4
    1b60:	fff70713          	add	a4,a4,-1 # 3fff <ecvt+0x5f>
    1b64:	00e6f733          	and	a4,a3,a4
    1b68:	01071713          	sll	a4,a4,0x10
    1b6c:	41075713          	sra	a4,a4,0x10
    1b70:	00e79123          	sh	a4,2(a5)
    1b74:	fe842783          	lw	a5,-24(s0)
    1b78:	0007a783          	lw	a5,0(a5)
    1b7c:	fef42423          	sw	a5,-24(s0)
    1b80:	fe842783          	lw	a5,-24(s0)
    1b84:	0007a783          	lw	a5,0(a5)
    1b88:	f20796e3          	bnez	a5,1ab4 <core_list_init+0x1c0>
    1b8c:	00000613          	li	a2,0
    1b90:	000017b7          	lui	a5,0x1
    1b94:	4a878593          	add	a1,a5,1192 # 14a8 <cmp_idx>
    1b98:	fd442503          	lw	a0,-44(s0)
    1b9c:	2ec000ef          	jal	1e88 <core_list_mergesort>
    1ba0:	fca42a23          	sw	a0,-44(s0)
    1ba4:	fd442783          	lw	a5,-44(s0)
    1ba8:	00078513          	mv	a0,a5
    1bac:	04c12083          	lw	ra,76(sp)
    1bb0:	04812403          	lw	s0,72(sp)
    1bb4:	05010113          	add	sp,sp,80
    1bb8:	00008067          	ret

00001bbc <core_list_insert_new>:
    1bbc:	fc010113          	add	sp,sp,-64
    1bc0:	02112e23          	sw	ra,60(sp)
    1bc4:	02812c23          	sw	s0,56(sp)
    1bc8:	04010413          	add	s0,sp,64
    1bcc:	fca42e23          	sw	a0,-36(s0)
    1bd0:	fcb42c23          	sw	a1,-40(s0)
    1bd4:	fcc42a23          	sw	a2,-44(s0)
    1bd8:	fcd42823          	sw	a3,-48(s0)
    1bdc:	fce42623          	sw	a4,-52(s0)
    1be0:	fcf42423          	sw	a5,-56(s0)
    1be4:	fd442783          	lw	a5,-44(s0)
    1be8:	0007a783          	lw	a5,0(a5)
    1bec:	00878793          	add	a5,a5,8
    1bf0:	fcc42703          	lw	a4,-52(s0)
    1bf4:	00e7e663          	bltu	a5,a4,1c00 <core_list_insert_new+0x44>
    1bf8:	00000793          	li	a5,0
    1bfc:	0980006f          	j	1c94 <core_list_insert_new+0xd8>
    1c00:	fd042783          	lw	a5,-48(s0)
    1c04:	0007a783          	lw	a5,0(a5)
    1c08:	00478793          	add	a5,a5,4
    1c0c:	fc842703          	lw	a4,-56(s0)
    1c10:	00e7e663          	bltu	a5,a4,1c1c <core_list_insert_new+0x60>
    1c14:	00000793          	li	a5,0
    1c18:	07c0006f          	j	1c94 <core_list_insert_new+0xd8>
    1c1c:	fd442783          	lw	a5,-44(s0)
    1c20:	0007a783          	lw	a5,0(a5)
    1c24:	fef42623          	sw	a5,-20(s0)
    1c28:	fd442783          	lw	a5,-44(s0)
    1c2c:	0007a783          	lw	a5,0(a5)
    1c30:	00878713          	add	a4,a5,8
    1c34:	fd442783          	lw	a5,-44(s0)
    1c38:	00e7a023          	sw	a4,0(a5)
    1c3c:	fdc42783          	lw	a5,-36(s0)
    1c40:	0007a703          	lw	a4,0(a5)
    1c44:	fec42783          	lw	a5,-20(s0)
    1c48:	00e7a023          	sw	a4,0(a5)
    1c4c:	fdc42783          	lw	a5,-36(s0)
    1c50:	fec42703          	lw	a4,-20(s0)
    1c54:	00e7a023          	sw	a4,0(a5)
    1c58:	fd042783          	lw	a5,-48(s0)
    1c5c:	0007a703          	lw	a4,0(a5)
    1c60:	fec42783          	lw	a5,-20(s0)
    1c64:	00e7a223          	sw	a4,4(a5)
    1c68:	fd042783          	lw	a5,-48(s0)
    1c6c:	0007a783          	lw	a5,0(a5)
    1c70:	00478713          	add	a4,a5,4
    1c74:	fd042783          	lw	a5,-48(s0)
    1c78:	00e7a023          	sw	a4,0(a5)
    1c7c:	fec42783          	lw	a5,-20(s0)
    1c80:	0047a783          	lw	a5,4(a5)
    1c84:	fd842583          	lw	a1,-40(s0)
    1c88:	00078513          	mv	a0,a5
    1c8c:	8fdff0ef          	jal	1588 <copy_info>
    1c90:	fec42783          	lw	a5,-20(s0)
    1c94:	00078513          	mv	a0,a5
    1c98:	03c12083          	lw	ra,60(sp)
    1c9c:	03812403          	lw	s0,56(sp)
    1ca0:	04010113          	add	sp,sp,64
    1ca4:	00008067          	ret

00001ca8 <core_list_remove>:
    1ca8:	fd010113          	add	sp,sp,-48
    1cac:	02812623          	sw	s0,44(sp)
    1cb0:	03010413          	add	s0,sp,48
    1cb4:	fca42e23          	sw	a0,-36(s0)
    1cb8:	fdc42783          	lw	a5,-36(s0)
    1cbc:	0007a783          	lw	a5,0(a5)
    1cc0:	fef42623          	sw	a5,-20(s0)
    1cc4:	fdc42783          	lw	a5,-36(s0)
    1cc8:	0047a783          	lw	a5,4(a5)
    1ccc:	fef42423          	sw	a5,-24(s0)
    1cd0:	fec42783          	lw	a5,-20(s0)
    1cd4:	0047a703          	lw	a4,4(a5)
    1cd8:	fdc42783          	lw	a5,-36(s0)
    1cdc:	00e7a223          	sw	a4,4(a5)
    1ce0:	fec42783          	lw	a5,-20(s0)
    1ce4:	fe842703          	lw	a4,-24(s0)
    1ce8:	00e7a223          	sw	a4,4(a5)
    1cec:	fdc42783          	lw	a5,-36(s0)
    1cf0:	0007a783          	lw	a5,0(a5)
    1cf4:	0007a703          	lw	a4,0(a5)
    1cf8:	fdc42783          	lw	a5,-36(s0)
    1cfc:	00e7a023          	sw	a4,0(a5)
    1d00:	fec42783          	lw	a5,-20(s0)
    1d04:	0007a023          	sw	zero,0(a5)
    1d08:	fec42783          	lw	a5,-20(s0)
    1d0c:	00078513          	mv	a0,a5
    1d10:	02c12403          	lw	s0,44(sp)
    1d14:	03010113          	add	sp,sp,48
    1d18:	00008067          	ret

00001d1c <core_list_undo_remove>:
    1d1c:	fd010113          	add	sp,sp,-48
    1d20:	02812623          	sw	s0,44(sp)
    1d24:	03010413          	add	s0,sp,48
    1d28:	fca42e23          	sw	a0,-36(s0)
    1d2c:	fcb42c23          	sw	a1,-40(s0)
    1d30:	fdc42783          	lw	a5,-36(s0)
    1d34:	0047a783          	lw	a5,4(a5)
    1d38:	fef42623          	sw	a5,-20(s0)
    1d3c:	fd842783          	lw	a5,-40(s0)
    1d40:	0047a703          	lw	a4,4(a5)
    1d44:	fdc42783          	lw	a5,-36(s0)
    1d48:	00e7a223          	sw	a4,4(a5)
    1d4c:	fd842783          	lw	a5,-40(s0)
    1d50:	fec42703          	lw	a4,-20(s0)
    1d54:	00e7a223          	sw	a4,4(a5)
    1d58:	fd842783          	lw	a5,-40(s0)
    1d5c:	0007a703          	lw	a4,0(a5)
    1d60:	fdc42783          	lw	a5,-36(s0)
    1d64:	00e7a023          	sw	a4,0(a5)
    1d68:	fd842783          	lw	a5,-40(s0)
    1d6c:	fdc42703          	lw	a4,-36(s0)
    1d70:	00e7a023          	sw	a4,0(a5)
    1d74:	fdc42783          	lw	a5,-36(s0)
    1d78:	00078513          	mv	a0,a5
    1d7c:	02c12403          	lw	s0,44(sp)
    1d80:	03010113          	add	sp,sp,48
    1d84:	00008067          	ret

00001d88 <core_list_find>:
    1d88:	fe010113          	add	sp,sp,-32
    1d8c:	00812e23          	sw	s0,28(sp)
    1d90:	02010413          	add	s0,sp,32
    1d94:	fea42623          	sw	a0,-20(s0)
    1d98:	feb42423          	sw	a1,-24(s0)
    1d9c:	fe842783          	lw	a5,-24(s0)
    1da0:	00279783          	lh	a5,2(a5)
    1da4:	0407c463          	bltz	a5,1dec <core_list_find+0x64>
    1da8:	0100006f          	j	1db8 <core_list_find+0x30>
    1dac:	fec42783          	lw	a5,-20(s0)
    1db0:	0007a783          	lw	a5,0(a5)
    1db4:	fef42623          	sw	a5,-20(s0)
    1db8:	fec42783          	lw	a5,-20(s0)
    1dbc:	00078e63          	beqz	a5,1dd8 <core_list_find+0x50>
    1dc0:	fec42783          	lw	a5,-20(s0)
    1dc4:	0047a783          	lw	a5,4(a5)
    1dc8:	00279703          	lh	a4,2(a5)
    1dcc:	fe842783          	lw	a5,-24(s0)
    1dd0:	00279783          	lh	a5,2(a5)
    1dd4:	fcf71ce3          	bne	a4,a5,1dac <core_list_find+0x24>
    1dd8:	fec42783          	lw	a5,-20(s0)
    1ddc:	0400006f          	j	1e1c <core_list_find+0x94>
    1de0:	fec42783          	lw	a5,-20(s0)
    1de4:	0007a783          	lw	a5,0(a5)
    1de8:	fef42623          	sw	a5,-20(s0)
    1dec:	fec42783          	lw	a5,-20(s0)
    1df0:	02078463          	beqz	a5,1e18 <core_list_find+0x90>
    1df4:	fec42783          	lw	a5,-20(s0)
    1df8:	0047a783          	lw	a5,4(a5)
    1dfc:	00079783          	lh	a5,0(a5)
    1e00:	01079793          	sll	a5,a5,0x10
    1e04:	0107d793          	srl	a5,a5,0x10
    1e08:	0ff7f793          	zext.b	a5,a5
    1e0c:	fe842703          	lw	a4,-24(s0)
    1e10:	00071703          	lh	a4,0(a4)
    1e14:	fce796e3          	bne	a5,a4,1de0 <core_list_find+0x58>
    1e18:	fec42783          	lw	a5,-20(s0)
    1e1c:	00078513          	mv	a0,a5
    1e20:	01c12403          	lw	s0,28(sp)
    1e24:	02010113          	add	sp,sp,32
    1e28:	00008067          	ret

00001e2c <core_list_reverse>:
    1e2c:	fd010113          	add	sp,sp,-48
    1e30:	02812623          	sw	s0,44(sp)
    1e34:	03010413          	add	s0,sp,48
    1e38:	fca42e23          	sw	a0,-36(s0)
    1e3c:	fe042623          	sw	zero,-20(s0)
    1e40:	02c0006f          	j	1e6c <core_list_reverse+0x40>
    1e44:	fdc42783          	lw	a5,-36(s0)
    1e48:	0007a783          	lw	a5,0(a5)
    1e4c:	fef42423          	sw	a5,-24(s0)
    1e50:	fdc42783          	lw	a5,-36(s0)
    1e54:	fec42703          	lw	a4,-20(s0)
    1e58:	00e7a023          	sw	a4,0(a5)
    1e5c:	fdc42783          	lw	a5,-36(s0)
    1e60:	fef42623          	sw	a5,-20(s0)
    1e64:	fe842783          	lw	a5,-24(s0)
    1e68:	fcf42e23          	sw	a5,-36(s0)
    1e6c:	fdc42783          	lw	a5,-36(s0)
    1e70:	fc079ae3          	bnez	a5,1e44 <core_list_reverse+0x18>
    1e74:	fec42783          	lw	a5,-20(s0)
    1e78:	00078513          	mv	a0,a5
    1e7c:	02c12403          	lw	s0,44(sp)
    1e80:	03010113          	add	sp,sp,48
    1e84:	00008067          	ret

00001e88 <core_list_mergesort>:
    1e88:	fb010113          	add	sp,sp,-80
    1e8c:	04112623          	sw	ra,76(sp)
    1e90:	04812423          	sw	s0,72(sp)
    1e94:	05010413          	add	s0,sp,80
    1e98:	faa42e23          	sw	a0,-68(s0)
    1e9c:	fab42c23          	sw	a1,-72(s0)
    1ea0:	fac42a23          	sw	a2,-76(s0)
    1ea4:	00100793          	li	a5,1
    1ea8:	fcf42e23          	sw	a5,-36(s0)
    1eac:	fbc42783          	lw	a5,-68(s0)
    1eb0:	fef42623          	sw	a5,-20(s0)
    1eb4:	fa042e23          	sw	zero,-68(s0)
    1eb8:	fe042023          	sw	zero,-32(s0)
    1ebc:	fc042c23          	sw	zero,-40(s0)
    1ec0:	1880006f          	j	2048 <core_list_mergesort+0x1c0>
    1ec4:	fd842783          	lw	a5,-40(s0)
    1ec8:	00178793          	add	a5,a5,1
    1ecc:	fcf42c23          	sw	a5,-40(s0)
    1ed0:	fec42783          	lw	a5,-20(s0)
    1ed4:	fef42423          	sw	a5,-24(s0)
    1ed8:	fc042a23          	sw	zero,-44(s0)
    1edc:	fc042623          	sw	zero,-52(s0)
    1ee0:	0300006f          	j	1f10 <core_list_mergesort+0x88>
    1ee4:	fd442783          	lw	a5,-44(s0)
    1ee8:	00178793          	add	a5,a5,1
    1eec:	fcf42a23          	sw	a5,-44(s0)
    1ef0:	fe842783          	lw	a5,-24(s0)
    1ef4:	0007a783          	lw	a5,0(a5)
    1ef8:	fef42423          	sw	a5,-24(s0)
    1efc:	fe842783          	lw	a5,-24(s0)
    1f00:	02078063          	beqz	a5,1f20 <core_list_mergesort+0x98>
    1f04:	fcc42783          	lw	a5,-52(s0)
    1f08:	00178793          	add	a5,a5,1
    1f0c:	fcf42623          	sw	a5,-52(s0)
    1f10:	fcc42703          	lw	a4,-52(s0)
    1f14:	fdc42783          	lw	a5,-36(s0)
    1f18:	fcf746e3          	blt	a4,a5,1ee4 <core_list_mergesort+0x5c>
    1f1c:	0080006f          	j	1f24 <core_list_mergesort+0x9c>
    1f20:	00000013          	nop
    1f24:	fdc42783          	lw	a5,-36(s0)
    1f28:	fcf42823          	sw	a5,-48(s0)
    1f2c:	0fc0006f          	j	2028 <core_list_mergesort+0x1a0>
    1f30:	fd442783          	lw	a5,-44(s0)
    1f34:	02079463          	bnez	a5,1f5c <core_list_mergesort+0xd4>
    1f38:	fe842783          	lw	a5,-24(s0)
    1f3c:	fef42223          	sw	a5,-28(s0)
    1f40:	fe842783          	lw	a5,-24(s0)
    1f44:	0007a783          	lw	a5,0(a5)
    1f48:	fef42423          	sw	a5,-24(s0)
    1f4c:	fd042783          	lw	a5,-48(s0)
    1f50:	fff78793          	add	a5,a5,-1
    1f54:	fcf42823          	sw	a5,-48(s0)
    1f58:	0a80006f          	j	2000 <core_list_mergesort+0x178>
    1f5c:	fd042783          	lw	a5,-48(s0)
    1f60:	00078663          	beqz	a5,1f6c <core_list_mergesort+0xe4>
    1f64:	fe842783          	lw	a5,-24(s0)
    1f68:	02079463          	bnez	a5,1f90 <core_list_mergesort+0x108>
    1f6c:	fec42783          	lw	a5,-20(s0)
    1f70:	fef42223          	sw	a5,-28(s0)
    1f74:	fec42783          	lw	a5,-20(s0)
    1f78:	0007a783          	lw	a5,0(a5)
    1f7c:	fef42623          	sw	a5,-20(s0)
    1f80:	fd442783          	lw	a5,-44(s0)
    1f84:	fff78793          	add	a5,a5,-1
    1f88:	fcf42a23          	sw	a5,-44(s0)
    1f8c:	0740006f          	j	2000 <core_list_mergesort+0x178>
    1f90:	fec42783          	lw	a5,-20(s0)
    1f94:	0047a703          	lw	a4,4(a5)
    1f98:	fe842783          	lw	a5,-24(s0)
    1f9c:	0047a683          	lw	a3,4(a5)
    1fa0:	fb842783          	lw	a5,-72(s0)
    1fa4:	fb442603          	lw	a2,-76(s0)
    1fa8:	00068593          	mv	a1,a3
    1fac:	00070513          	mv	a0,a4
    1fb0:	000780e7          	jalr	a5
    1fb4:	00050793          	mv	a5,a0
    1fb8:	02f04463          	bgtz	a5,1fe0 <core_list_mergesort+0x158>
    1fbc:	fec42783          	lw	a5,-20(s0)
    1fc0:	fef42223          	sw	a5,-28(s0)
    1fc4:	fec42783          	lw	a5,-20(s0)
    1fc8:	0007a783          	lw	a5,0(a5)
    1fcc:	fef42623          	sw	a5,-20(s0)
    1fd0:	fd442783          	lw	a5,-44(s0)
    1fd4:	fff78793          	add	a5,a5,-1
    1fd8:	fcf42a23          	sw	a5,-44(s0)
    1fdc:	0240006f          	j	2000 <core_list_mergesort+0x178>
    1fe0:	fe842783          	lw	a5,-24(s0)
    1fe4:	fef42223          	sw	a5,-28(s0)
    1fe8:	fe842783          	lw	a5,-24(s0)
    1fec:	0007a783          	lw	a5,0(a5)
    1ff0:	fef42423          	sw	a5,-24(s0)
    1ff4:	fd042783          	lw	a5,-48(s0)
    1ff8:	fff78793          	add	a5,a5,-1
    1ffc:	fcf42823          	sw	a5,-48(s0)
    2000:	fe042783          	lw	a5,-32(s0)
    2004:	00078a63          	beqz	a5,2018 <core_list_mergesort+0x190>
    2008:	fe042783          	lw	a5,-32(s0)
    200c:	fe442703          	lw	a4,-28(s0)
    2010:	00e7a023          	sw	a4,0(a5)
    2014:	00c0006f          	j	2020 <core_list_mergesort+0x198>
    2018:	fe442783          	lw	a5,-28(s0)
    201c:	faf42e23          	sw	a5,-68(s0)
    2020:	fe442783          	lw	a5,-28(s0)
    2024:	fef42023          	sw	a5,-32(s0)
    2028:	fd442783          	lw	a5,-44(s0)
    202c:	f0f042e3          	bgtz	a5,1f30 <core_list_mergesort+0xa8>
    2030:	fd042783          	lw	a5,-48(s0)
    2034:	00f05663          	blez	a5,2040 <core_list_mergesort+0x1b8>
    2038:	fe842783          	lw	a5,-24(s0)
    203c:	ee079ae3          	bnez	a5,1f30 <core_list_mergesort+0xa8>
    2040:	fe842783          	lw	a5,-24(s0)
    2044:	fef42623          	sw	a5,-20(s0)
    2048:	fec42783          	lw	a5,-20(s0)
    204c:	e6079ce3          	bnez	a5,1ec4 <core_list_mergesort+0x3c>
    2050:	fe042783          	lw	a5,-32(s0)
    2054:	0007a023          	sw	zero,0(a5)
    2058:	fd842703          	lw	a4,-40(s0)
    205c:	00100793          	li	a5,1
    2060:	00e7c663          	blt	a5,a4,206c <core_list_mergesort+0x1e4>
    2064:	fbc42783          	lw	a5,-68(s0)
    2068:	0140006f          	j	207c <core_list_mergesort+0x1f4>
    206c:	fdc42783          	lw	a5,-36(s0)
    2070:	00179793          	sll	a5,a5,0x1
    2074:	fcf42e23          	sw	a5,-36(s0)
    2078:	e35ff06f          	j	1eac <core_list_mergesort+0x24>
    207c:	00078513          	mv	a0,a5
    2080:	04c12083          	lw	ra,76(sp)
    2084:	04812403          	lw	s0,72(sp)
    2088:	05010113          	add	sp,sp,80
    208c:	00008067          	ret

00002090 <core_bench_matrix>:
    2090:	fc010113          	add	sp,sp,-64
    2094:	02112e23          	sw	ra,60(sp)
    2098:	02812c23          	sw	s0,56(sp)
    209c:	04010413          	add	s0,sp,64
    20a0:	fca42623          	sw	a0,-52(s0)
    20a4:	00058793          	mv	a5,a1
    20a8:	00060713          	mv	a4,a2
    20ac:	fcf41523          	sh	a5,-54(s0)
    20b0:	00070793          	mv	a5,a4
    20b4:	fcf41423          	sh	a5,-56(s0)
    20b8:	fcc42783          	lw	a5,-52(s0)
    20bc:	0007a783          	lw	a5,0(a5)
    20c0:	fef42623          	sw	a5,-20(s0)
    20c4:	fcc42783          	lw	a5,-52(s0)
    20c8:	00c7a783          	lw	a5,12(a5)
    20cc:	fef42423          	sw	a5,-24(s0)
    20d0:	fcc42783          	lw	a5,-52(s0)
    20d4:	0047a783          	lw	a5,4(a5)
    20d8:	fef42223          	sw	a5,-28(s0)
    20dc:	fcc42783          	lw	a5,-52(s0)
    20e0:	0087a783          	lw	a5,8(a5)
    20e4:	fef42023          	sw	a5,-32(s0)
    20e8:	fca45783          	lhu	a5,-54(s0)
    20ec:	fcf41f23          	sh	a5,-34(s0)
    20f0:	fde41783          	lh	a5,-34(s0)
    20f4:	00078713          	mv	a4,a5
    20f8:	fe042683          	lw	a3,-32(s0)
    20fc:	fe442603          	lw	a2,-28(s0)
    2100:	fe842583          	lw	a1,-24(s0)
    2104:	fec42503          	lw	a0,-20(s0)
    2108:	03c000ef          	jal	2144 <matrix_test>
    210c:	00050793          	mv	a5,a0
    2110:	00078713          	mv	a4,a5
    2114:	fc845783          	lhu	a5,-56(s0)
    2118:	00078593          	mv	a1,a5
    211c:	00070513          	mv	a0,a4
    2120:	78c010ef          	jal	38ac <crc16>
    2124:	00050793          	mv	a5,a0
    2128:	fcf41423          	sh	a5,-56(s0)
    212c:	fc845783          	lhu	a5,-56(s0)
    2130:	00078513          	mv	a0,a5
    2134:	03c12083          	lw	ra,60(sp)
    2138:	03812403          	lw	s0,56(sp)
    213c:	04010113          	add	sp,sp,64
    2140:	00008067          	ret

00002144 <matrix_test>:
    2144:	fc010113          	add	sp,sp,-64
    2148:	02112e23          	sw	ra,60(sp)
    214c:	02812c23          	sw	s0,56(sp)
    2150:	04010413          	add	s0,sp,64
    2154:	fca42e23          	sw	a0,-36(s0)
    2158:	fcb42c23          	sw	a1,-40(s0)
    215c:	fcc42a23          	sw	a2,-44(s0)
    2160:	fcd42823          	sw	a3,-48(s0)
    2164:	00070793          	mv	a5,a4
    2168:	fcf41723          	sh	a5,-50(s0)
    216c:	fe041723          	sh	zero,-18(s0)
    2170:	fce45783          	lhu	a5,-50(s0)
    2174:	00078713          	mv	a4,a5
    2178:	fffff7b7          	lui	a5,0xfffff
    217c:	00f767b3          	or	a5,a4,a5
    2180:	fef41623          	sh	a5,-20(s0)
    2184:	fce41783          	lh	a5,-50(s0)
    2188:	00078613          	mv	a2,a5
    218c:	fd442583          	lw	a1,-44(s0)
    2190:	fdc42503          	lw	a0,-36(s0)
    2194:	5e8000ef          	jal	277c <matrix_add_const>
    2198:	fce41783          	lh	a5,-50(s0)
    219c:	00078693          	mv	a3,a5
    21a0:	fd442603          	lw	a2,-44(s0)
    21a4:	fd842583          	lw	a1,-40(s0)
    21a8:	fdc42503          	lw	a0,-36(s0)
    21ac:	4cc000ef          	jal	2678 <matrix_mul_const>
    21b0:	fec41783          	lh	a5,-20(s0)
    21b4:	00078613          	mv	a2,a5
    21b8:	fd842583          	lw	a1,-40(s0)
    21bc:	fdc42503          	lw	a0,-36(s0)
    21c0:	398000ef          	jal	2558 <matrix_sum>
    21c4:	00050793          	mv	a5,a0
    21c8:	00078713          	mv	a4,a5
    21cc:	fee45783          	lhu	a5,-18(s0)
    21d0:	00078593          	mv	a1,a5
    21d4:	00070513          	mv	a0,a4
    21d8:	6d4010ef          	jal	38ac <crc16>
    21dc:	00050793          	mv	a5,a0
    21e0:	fef41723          	sh	a5,-18(s0)
    21e4:	fd042683          	lw	a3,-48(s0)
    21e8:	fd442603          	lw	a2,-44(s0)
    21ec:	fd842583          	lw	a1,-40(s0)
    21f0:	fdc42503          	lw	a0,-36(s0)
    21f4:	680000ef          	jal	2874 <matrix_mul_vect>
    21f8:	fec41783          	lh	a5,-20(s0)
    21fc:	00078613          	mv	a2,a5
    2200:	fd842583          	lw	a1,-40(s0)
    2204:	fdc42503          	lw	a0,-36(s0)
    2208:	350000ef          	jal	2558 <matrix_sum>
    220c:	00050793          	mv	a5,a0
    2210:	00078713          	mv	a4,a5
    2214:	fee45783          	lhu	a5,-18(s0)
    2218:	00078593          	mv	a1,a5
    221c:	00070513          	mv	a0,a4
    2220:	68c010ef          	jal	38ac <crc16>
    2224:	00050793          	mv	a5,a0
    2228:	fef41723          	sh	a5,-18(s0)
    222c:	fd042683          	lw	a3,-48(s0)
    2230:	fd442603          	lw	a2,-44(s0)
    2234:	fd842583          	lw	a1,-40(s0)
    2238:	fdc42503          	lw	a0,-36(s0)
    223c:	750000ef          	jal	298c <matrix_mul_matrix>
    2240:	fec41783          	lh	a5,-20(s0)
    2244:	00078613          	mv	a2,a5
    2248:	fd842583          	lw	a1,-40(s0)
    224c:	fdc42503          	lw	a0,-36(s0)
    2250:	308000ef          	jal	2558 <matrix_sum>
    2254:	00050793          	mv	a5,a0
    2258:	00078713          	mv	a4,a5
    225c:	fee45783          	lhu	a5,-18(s0)
    2260:	00078593          	mv	a1,a5
    2264:	00070513          	mv	a0,a4
    2268:	644010ef          	jal	38ac <crc16>
    226c:	00050793          	mv	a5,a0
    2270:	fef41723          	sh	a5,-18(s0)
    2274:	fd042683          	lw	a3,-48(s0)
    2278:	fd442603          	lw	a2,-44(s0)
    227c:	fd842583          	lw	a1,-40(s0)
    2280:	fdc42503          	lw	a0,-36(s0)
    2284:	0a9000ef          	jal	2b2c <matrix_mul_matrix_bitextract>
    2288:	fec41783          	lh	a5,-20(s0)
    228c:	00078613          	mv	a2,a5
    2290:	fd842583          	lw	a1,-40(s0)
    2294:	fdc42503          	lw	a0,-36(s0)
    2298:	2c0000ef          	jal	2558 <matrix_sum>
    229c:	00050793          	mv	a5,a0
    22a0:	00078713          	mv	a4,a5
    22a4:	fee45783          	lhu	a5,-18(s0)
    22a8:	00078593          	mv	a1,a5
    22ac:	00070513          	mv	a0,a4
    22b0:	5fc010ef          	jal	38ac <crc16>
    22b4:	00050793          	mv	a5,a0
    22b8:	fef41723          	sh	a5,-18(s0)
    22bc:	fce45783          	lhu	a5,-50(s0)
    22c0:	40f007b3          	neg	a5,a5
    22c4:	01079793          	sll	a5,a5,0x10
    22c8:	0107d793          	srl	a5,a5,0x10
    22cc:	01079793          	sll	a5,a5,0x10
    22d0:	4107d793          	sra	a5,a5,0x10
    22d4:	00078613          	mv	a2,a5
    22d8:	fd442583          	lw	a1,-44(s0)
    22dc:	fdc42503          	lw	a0,-36(s0)
    22e0:	49c000ef          	jal	277c <matrix_add_const>
    22e4:	fee41783          	lh	a5,-18(s0)
    22e8:	00078513          	mv	a0,a5
    22ec:	03c12083          	lw	ra,60(sp)
    22f0:	03812403          	lw	s0,56(sp)
    22f4:	04010113          	add	sp,sp,64
    22f8:	00008067          	ret

000022fc <core_init_matrix>:
    22fc:	fc010113          	add	sp,sp,-64
    2300:	02112e23          	sw	ra,60(sp)
    2304:	02812c23          	sw	s0,56(sp)
    2308:	04010413          	add	s0,sp,64
    230c:	fca42623          	sw	a0,-52(s0)
    2310:	fcb42423          	sw	a1,-56(s0)
    2314:	fcc42223          	sw	a2,-60(s0)
    2318:	fcd42023          	sw	a3,-64(s0)
    231c:	fe042023          	sw	zero,-32(s0)
    2320:	00100793          	li	a5,1
    2324:	fef42623          	sw	a5,-20(s0)
    2328:	fe042423          	sw	zero,-24(s0)
    232c:	fe042223          	sw	zero,-28(s0)
    2330:	fc442783          	lw	a5,-60(s0)
    2334:	02079a63          	bnez	a5,2368 <core_init_matrix+0x6c>
    2338:	00100793          	li	a5,1
    233c:	fcf42223          	sw	a5,-60(s0)
    2340:	0280006f          	j	2368 <core_init_matrix+0x6c>
    2344:	fe842783          	lw	a5,-24(s0)
    2348:	00178793          	add	a5,a5,1 # fffff001 <__subdf3+0xffff7411>
    234c:	fef42423          	sw	a5,-24(s0)
    2350:	fe842583          	lw	a1,-24(s0)
    2354:	fe842503          	lw	a0,-24(s0)
    2358:	54c050ef          	jal	78a4 <__mulsi3>
    235c:	00050793          	mv	a5,a0
    2360:	00379793          	sll	a5,a5,0x3
    2364:	fef42223          	sw	a5,-28(s0)
    2368:	fe442703          	lw	a4,-28(s0)
    236c:	fcc42783          	lw	a5,-52(s0)
    2370:	fcf76ae3          	bltu	a4,a5,2344 <core_init_matrix+0x48>
    2374:	fe842783          	lw	a5,-24(s0)
    2378:	fff78793          	add	a5,a5,-1
    237c:	fef42023          	sw	a5,-32(s0)
    2380:	fc842783          	lw	a5,-56(s0)
    2384:	fff78793          	add	a5,a5,-1
    2388:	ffc7f793          	and	a5,a5,-4
    238c:	00478793          	add	a5,a5,4
    2390:	fcf42e23          	sw	a5,-36(s0)
    2394:	fe042583          	lw	a1,-32(s0)
    2398:	fe042503          	lw	a0,-32(s0)
    239c:	508050ef          	jal	78a4 <__mulsi3>
    23a0:	00050793          	mv	a5,a0
    23a4:	00179793          	sll	a5,a5,0x1
    23a8:	fdc42703          	lw	a4,-36(s0)
    23ac:	00f707b3          	add	a5,a4,a5
    23b0:	fcf42c23          	sw	a5,-40(s0)
    23b4:	fe042423          	sw	zero,-24(s0)
    23b8:	1240006f          	j	24dc <core_init_matrix+0x1e0>
    23bc:	fe042223          	sw	zero,-28(s0)
    23c0:	1040006f          	j	24c4 <core_init_matrix+0x1c8>
    23c4:	fc442583          	lw	a1,-60(s0)
    23c8:	fec42503          	lw	a0,-20(s0)
    23cc:	4d8050ef          	jal	78a4 <__mulsi3>
    23d0:	00050793          	mv	a5,a0
    23d4:	00078713          	mv	a4,a5
    23d8:	41f75793          	sra	a5,a4,0x1f
    23dc:	0107d793          	srl	a5,a5,0x10
    23e0:	00f706b3          	add	a3,a4,a5
    23e4:	00010737          	lui	a4,0x10
    23e8:	fff70713          	add	a4,a4,-1 # ffff <__subdf3+0x840f>
    23ec:	00e6f733          	and	a4,a3,a4
    23f0:	40f707b3          	sub	a5,a4,a5
    23f4:	fcf42223          	sw	a5,-60(s0)
    23f8:	fc442783          	lw	a5,-60(s0)
    23fc:	01079713          	sll	a4,a5,0x10
    2400:	01075713          	srl	a4,a4,0x10
    2404:	fec42783          	lw	a5,-20(s0)
    2408:	01079793          	sll	a5,a5,0x10
    240c:	0107d793          	srl	a5,a5,0x10
    2410:	00f707b3          	add	a5,a4,a5
    2414:	01079793          	sll	a5,a5,0x10
    2418:	0107d793          	srl	a5,a5,0x10
    241c:	fcf41b23          	sh	a5,-42(s0)
    2420:	fe042583          	lw	a1,-32(s0)
    2424:	fe842503          	lw	a0,-24(s0)
    2428:	47c050ef          	jal	78a4 <__mulsi3>
    242c:	00050793          	mv	a5,a0
    2430:	00078713          	mv	a4,a5
    2434:	fe442783          	lw	a5,-28(s0)
    2438:	00f707b3          	add	a5,a4,a5
    243c:	00179793          	sll	a5,a5,0x1
    2440:	fd842703          	lw	a4,-40(s0)
    2444:	00f707b3          	add	a5,a4,a5
    2448:	fd645703          	lhu	a4,-42(s0)
    244c:	00e79023          	sh	a4,0(a5)
    2450:	fec42783          	lw	a5,-20(s0)
    2454:	01079713          	sll	a4,a5,0x10
    2458:	01075713          	srl	a4,a4,0x10
    245c:	fd645783          	lhu	a5,-42(s0)
    2460:	00f707b3          	add	a5,a4,a5
    2464:	01079793          	sll	a5,a5,0x10
    2468:	0107d793          	srl	a5,a5,0x10
    246c:	fcf41b23          	sh	a5,-42(s0)
    2470:	fd645783          	lhu	a5,-42(s0)
    2474:	0ff7f793          	zext.b	a5,a5
    2478:	fcf41b23          	sh	a5,-42(s0)
    247c:	fe042583          	lw	a1,-32(s0)
    2480:	fe842503          	lw	a0,-24(s0)
    2484:	420050ef          	jal	78a4 <__mulsi3>
    2488:	00050793          	mv	a5,a0
    248c:	00078713          	mv	a4,a5
    2490:	fe442783          	lw	a5,-28(s0)
    2494:	00f707b3          	add	a5,a4,a5
    2498:	00179793          	sll	a5,a5,0x1
    249c:	fdc42703          	lw	a4,-36(s0)
    24a0:	00f707b3          	add	a5,a4,a5
    24a4:	fd645703          	lhu	a4,-42(s0)
    24a8:	00e79023          	sh	a4,0(a5)
    24ac:	fec42783          	lw	a5,-20(s0)
    24b0:	00178793          	add	a5,a5,1
    24b4:	fef42623          	sw	a5,-20(s0)
    24b8:	fe442783          	lw	a5,-28(s0)
    24bc:	00178793          	add	a5,a5,1
    24c0:	fef42223          	sw	a5,-28(s0)
    24c4:	fe442703          	lw	a4,-28(s0)
    24c8:	fe042783          	lw	a5,-32(s0)
    24cc:	eef76ce3          	bltu	a4,a5,23c4 <core_init_matrix+0xc8>
    24d0:	fe842783          	lw	a5,-24(s0)
    24d4:	00178793          	add	a5,a5,1
    24d8:	fef42423          	sw	a5,-24(s0)
    24dc:	fe842703          	lw	a4,-24(s0)
    24e0:	fe042783          	lw	a5,-32(s0)
    24e4:	ecf76ce3          	bltu	a4,a5,23bc <core_init_matrix+0xc0>
    24e8:	fc042783          	lw	a5,-64(s0)
    24ec:	fdc42703          	lw	a4,-36(s0)
    24f0:	00e7a223          	sw	a4,4(a5)
    24f4:	fc042783          	lw	a5,-64(s0)
    24f8:	fd842703          	lw	a4,-40(s0)
    24fc:	00e7a423          	sw	a4,8(a5)
    2500:	fe042583          	lw	a1,-32(s0)
    2504:	fe042503          	lw	a0,-32(s0)
    2508:	39c050ef          	jal	78a4 <__mulsi3>
    250c:	00050793          	mv	a5,a0
    2510:	00179793          	sll	a5,a5,0x1
    2514:	fd842703          	lw	a4,-40(s0)
    2518:	00f707b3          	add	a5,a4,a5
    251c:	fff78793          	add	a5,a5,-1
    2520:	ffc7f793          	and	a5,a5,-4
    2524:	00478793          	add	a5,a5,4
    2528:	00078713          	mv	a4,a5
    252c:	fc042783          	lw	a5,-64(s0)
    2530:	00e7a623          	sw	a4,12(a5)
    2534:	fe042703          	lw	a4,-32(s0)
    2538:	fc042783          	lw	a5,-64(s0)
    253c:	00e7a023          	sw	a4,0(a5)
    2540:	fe042783          	lw	a5,-32(s0)
    2544:	00078513          	mv	a0,a5
    2548:	03c12083          	lw	ra,60(sp)
    254c:	03812403          	lw	s0,56(sp)
    2550:	04010113          	add	sp,sp,64
    2554:	00008067          	ret

00002558 <matrix_sum>:
    2558:	fc010113          	add	sp,sp,-64
    255c:	02112e23          	sw	ra,60(sp)
    2560:	02812c23          	sw	s0,56(sp)
    2564:	04010413          	add	s0,sp,64
    2568:	fca42623          	sw	a0,-52(s0)
    256c:	fcb42423          	sw	a1,-56(s0)
    2570:	00060793          	mv	a5,a2
    2574:	fcf41323          	sh	a5,-58(s0)
    2578:	fe042623          	sw	zero,-20(s0)
    257c:	fe042423          	sw	zero,-24(s0)
    2580:	fc042c23          	sw	zero,-40(s0)
    2584:	fe041323          	sh	zero,-26(s0)
    2588:	fe042023          	sw	zero,-32(s0)
    258c:	0c80006f          	j	2654 <matrix_sum+0xfc>
    2590:	fc042e23          	sw	zero,-36(s0)
    2594:	0a80006f          	j	263c <matrix_sum+0xe4>
    2598:	fcc42583          	lw	a1,-52(s0)
    259c:	fe042503          	lw	a0,-32(s0)
    25a0:	304050ef          	jal	78a4 <__mulsi3>
    25a4:	00050793          	mv	a5,a0
    25a8:	00078713          	mv	a4,a5
    25ac:	fdc42783          	lw	a5,-36(s0)
    25b0:	00f707b3          	add	a5,a4,a5
    25b4:	00279793          	sll	a5,a5,0x2
    25b8:	fc842703          	lw	a4,-56(s0)
    25bc:	00f707b3          	add	a5,a4,a5
    25c0:	0007a783          	lw	a5,0(a5)
    25c4:	fcf42c23          	sw	a5,-40(s0)
    25c8:	fec42703          	lw	a4,-20(s0)
    25cc:	fd842783          	lw	a5,-40(s0)
    25d0:	00f707b3          	add	a5,a4,a5
    25d4:	fef42623          	sw	a5,-20(s0)
    25d8:	fc641783          	lh	a5,-58(s0)
    25dc:	fec42703          	lw	a4,-20(s0)
    25e0:	02e7d063          	bge	a5,a4,2600 <matrix_sum+0xa8>
    25e4:	fe645783          	lhu	a5,-26(s0)
    25e8:	00a78793          	add	a5,a5,10
    25ec:	01079793          	sll	a5,a5,0x10
    25f0:	0107d793          	srl	a5,a5,0x10
    25f4:	fef41323          	sh	a5,-26(s0)
    25f8:	fe042623          	sw	zero,-20(s0)
    25fc:	02c0006f          	j	2628 <matrix_sum+0xd0>
    2600:	fd842703          	lw	a4,-40(s0)
    2604:	fe842783          	lw	a5,-24(s0)
    2608:	00e7a7b3          	slt	a5,a5,a4
    260c:	0ff7f793          	zext.b	a5,a5
    2610:	00078713          	mv	a4,a5
    2614:	fe645783          	lhu	a5,-26(s0)
    2618:	00f707b3          	add	a5,a4,a5
    261c:	01079793          	sll	a5,a5,0x10
    2620:	0107d793          	srl	a5,a5,0x10
    2624:	fef41323          	sh	a5,-26(s0)
    2628:	fd842783          	lw	a5,-40(s0)
    262c:	fef42423          	sw	a5,-24(s0)
    2630:	fdc42783          	lw	a5,-36(s0)
    2634:	00178793          	add	a5,a5,1
    2638:	fcf42e23          	sw	a5,-36(s0)
    263c:	fdc42703          	lw	a4,-36(s0)
    2640:	fcc42783          	lw	a5,-52(s0)
    2644:	f4f76ae3          	bltu	a4,a5,2598 <matrix_sum+0x40>
    2648:	fe042783          	lw	a5,-32(s0)
    264c:	00178793          	add	a5,a5,1
    2650:	fef42023          	sw	a5,-32(s0)
    2654:	fe042703          	lw	a4,-32(s0)
    2658:	fcc42783          	lw	a5,-52(s0)
    265c:	f2f76ae3          	bltu	a4,a5,2590 <matrix_sum+0x38>
    2660:	fe641783          	lh	a5,-26(s0)
    2664:	00078513          	mv	a0,a5
    2668:	03c12083          	lw	ra,60(sp)
    266c:	03812403          	lw	s0,56(sp)
    2670:	04010113          	add	sp,sp,64
    2674:	00008067          	ret

00002678 <matrix_mul_const>:
    2678:	fc010113          	add	sp,sp,-64
    267c:	02112e23          	sw	ra,60(sp)
    2680:	02812c23          	sw	s0,56(sp)
    2684:	02912a23          	sw	s1,52(sp)
    2688:	03212823          	sw	s2,48(sp)
    268c:	03312623          	sw	s3,44(sp)
    2690:	04010413          	add	s0,sp,64
    2694:	fca42623          	sw	a0,-52(s0)
    2698:	fcb42423          	sw	a1,-56(s0)
    269c:	fcc42223          	sw	a2,-60(s0)
    26a0:	00068793          	mv	a5,a3
    26a4:	fcf41123          	sh	a5,-62(s0)
    26a8:	fc042e23          	sw	zero,-36(s0)
    26ac:	0a00006f          	j	274c <matrix_mul_const+0xd4>
    26b0:	fc042c23          	sw	zero,-40(s0)
    26b4:	0800006f          	j	2734 <matrix_mul_const+0xbc>
    26b8:	fcc42583          	lw	a1,-52(s0)
    26bc:	fdc42503          	lw	a0,-36(s0)
    26c0:	1e4050ef          	jal	78a4 <__mulsi3>
    26c4:	00050793          	mv	a5,a0
    26c8:	00078713          	mv	a4,a5
    26cc:	fd842783          	lw	a5,-40(s0)
    26d0:	00f707b3          	add	a5,a4,a5
    26d4:	00179793          	sll	a5,a5,0x1
    26d8:	fc442703          	lw	a4,-60(s0)
    26dc:	00f707b3          	add	a5,a4,a5
    26e0:	00079783          	lh	a5,0(a5)
    26e4:	00078993          	mv	s3,a5
    26e8:	fc241903          	lh	s2,-62(s0)
    26ec:	fcc42583          	lw	a1,-52(s0)
    26f0:	fdc42503          	lw	a0,-36(s0)
    26f4:	1b0050ef          	jal	78a4 <__mulsi3>
    26f8:	00050793          	mv	a5,a0
    26fc:	00078713          	mv	a4,a5
    2700:	fd842783          	lw	a5,-40(s0)
    2704:	00f707b3          	add	a5,a4,a5
    2708:	00279793          	sll	a5,a5,0x2
    270c:	fc842703          	lw	a4,-56(s0)
    2710:	00f704b3          	add	s1,a4,a5
    2714:	00090593          	mv	a1,s2
    2718:	00098513          	mv	a0,s3
    271c:	188050ef          	jal	78a4 <__mulsi3>
    2720:	00050793          	mv	a5,a0
    2724:	00f4a023          	sw	a5,0(s1)
    2728:	fd842783          	lw	a5,-40(s0)
    272c:	00178793          	add	a5,a5,1
    2730:	fcf42c23          	sw	a5,-40(s0)
    2734:	fd842703          	lw	a4,-40(s0)
    2738:	fcc42783          	lw	a5,-52(s0)
    273c:	f6f76ee3          	bltu	a4,a5,26b8 <matrix_mul_const+0x40>
    2740:	fdc42783          	lw	a5,-36(s0)
    2744:	00178793          	add	a5,a5,1
    2748:	fcf42e23          	sw	a5,-36(s0)
    274c:	fdc42703          	lw	a4,-36(s0)
    2750:	fcc42783          	lw	a5,-52(s0)
    2754:	f4f76ee3          	bltu	a4,a5,26b0 <matrix_mul_const+0x38>
    2758:	00000013          	nop
    275c:	00000013          	nop
    2760:	03c12083          	lw	ra,60(sp)
    2764:	03812403          	lw	s0,56(sp)
    2768:	03412483          	lw	s1,52(sp)
    276c:	03012903          	lw	s2,48(sp)
    2770:	02c12983          	lw	s3,44(sp)
    2774:	04010113          	add	sp,sp,64
    2778:	00008067          	ret

0000277c <matrix_add_const>:
    277c:	fd010113          	add	sp,sp,-48
    2780:	02112623          	sw	ra,44(sp)
    2784:	02812423          	sw	s0,40(sp)
    2788:	02912223          	sw	s1,36(sp)
    278c:	03010413          	add	s0,sp,48
    2790:	fca42e23          	sw	a0,-36(s0)
    2794:	fcb42c23          	sw	a1,-40(s0)
    2798:	00060793          	mv	a5,a2
    279c:	fcf41b23          	sh	a5,-42(s0)
    27a0:	fe042623          	sw	zero,-20(s0)
    27a4:	0a80006f          	j	284c <matrix_add_const+0xd0>
    27a8:	fe042423          	sw	zero,-24(s0)
    27ac:	0880006f          	j	2834 <matrix_add_const+0xb8>
    27b0:	fdc42583          	lw	a1,-36(s0)
    27b4:	fec42503          	lw	a0,-20(s0)
    27b8:	0ec050ef          	jal	78a4 <__mulsi3>
    27bc:	00050793          	mv	a5,a0
    27c0:	00078713          	mv	a4,a5
    27c4:	fe842783          	lw	a5,-24(s0)
    27c8:	00f707b3          	add	a5,a4,a5
    27cc:	00179793          	sll	a5,a5,0x1
    27d0:	fd842703          	lw	a4,-40(s0)
    27d4:	00f707b3          	add	a5,a4,a5
    27d8:	00079783          	lh	a5,0(a5)
    27dc:	01079713          	sll	a4,a5,0x10
    27e0:	01075713          	srl	a4,a4,0x10
    27e4:	fd645783          	lhu	a5,-42(s0)
    27e8:	00f707b3          	add	a5,a4,a5
    27ec:	01079493          	sll	s1,a5,0x10
    27f0:	0104d493          	srl	s1,s1,0x10
    27f4:	fdc42583          	lw	a1,-36(s0)
    27f8:	fec42503          	lw	a0,-20(s0)
    27fc:	0a8050ef          	jal	78a4 <__mulsi3>
    2800:	00050793          	mv	a5,a0
    2804:	00078713          	mv	a4,a5
    2808:	fe842783          	lw	a5,-24(s0)
    280c:	00f707b3          	add	a5,a4,a5
    2810:	00179793          	sll	a5,a5,0x1
    2814:	fd842703          	lw	a4,-40(s0)
    2818:	00f707b3          	add	a5,a4,a5
    281c:	01049713          	sll	a4,s1,0x10
    2820:	41075713          	sra	a4,a4,0x10
    2824:	00e79023          	sh	a4,0(a5)
    2828:	fe842783          	lw	a5,-24(s0)
    282c:	00178793          	add	a5,a5,1
    2830:	fef42423          	sw	a5,-24(s0)
    2834:	fe842703          	lw	a4,-24(s0)
    2838:	fdc42783          	lw	a5,-36(s0)
    283c:	f6f76ae3          	bltu	a4,a5,27b0 <matrix_add_const+0x34>
    2840:	fec42783          	lw	a5,-20(s0)
    2844:	00178793          	add	a5,a5,1
    2848:	fef42623          	sw	a5,-20(s0)
    284c:	fec42703          	lw	a4,-20(s0)
    2850:	fdc42783          	lw	a5,-36(s0)
    2854:	f4f76ae3          	bltu	a4,a5,27a8 <matrix_add_const+0x2c>
    2858:	00000013          	nop
    285c:	00000013          	nop
    2860:	02c12083          	lw	ra,44(sp)
    2864:	02812403          	lw	s0,40(sp)
    2868:	02412483          	lw	s1,36(sp)
    286c:	03010113          	add	sp,sp,48
    2870:	00008067          	ret

00002874 <matrix_mul_vect>:
    2874:	fd010113          	add	sp,sp,-48
    2878:	02112623          	sw	ra,44(sp)
    287c:	02812423          	sw	s0,40(sp)
    2880:	02912223          	sw	s1,36(sp)
    2884:	03010413          	add	s0,sp,48
    2888:	fca42e23          	sw	a0,-36(s0)
    288c:	fcb42c23          	sw	a1,-40(s0)
    2890:	fcc42a23          	sw	a2,-44(s0)
    2894:	fcd42823          	sw	a3,-48(s0)
    2898:	fe042623          	sw	zero,-20(s0)
    289c:	0c80006f          	j	2964 <matrix_mul_vect+0xf0>
    28a0:	fec42783          	lw	a5,-20(s0)
    28a4:	00279793          	sll	a5,a5,0x2
    28a8:	fd842703          	lw	a4,-40(s0)
    28ac:	00f707b3          	add	a5,a4,a5
    28b0:	0007a023          	sw	zero,0(a5)
    28b4:	fe042423          	sw	zero,-24(s0)
    28b8:	0940006f          	j	294c <matrix_mul_vect+0xd8>
    28bc:	fec42783          	lw	a5,-20(s0)
    28c0:	00279793          	sll	a5,a5,0x2
    28c4:	fd842703          	lw	a4,-40(s0)
    28c8:	00f707b3          	add	a5,a4,a5
    28cc:	0007a483          	lw	s1,0(a5)
    28d0:	fdc42583          	lw	a1,-36(s0)
    28d4:	fec42503          	lw	a0,-20(s0)
    28d8:	7cd040ef          	jal	78a4 <__mulsi3>
    28dc:	00050793          	mv	a5,a0
    28e0:	00078713          	mv	a4,a5
    28e4:	fe842783          	lw	a5,-24(s0)
    28e8:	00f707b3          	add	a5,a4,a5
    28ec:	00179793          	sll	a5,a5,0x1
    28f0:	fd442703          	lw	a4,-44(s0)
    28f4:	00f707b3          	add	a5,a4,a5
    28f8:	00079783          	lh	a5,0(a5)
    28fc:	00078693          	mv	a3,a5
    2900:	fe842783          	lw	a5,-24(s0)
    2904:	00179793          	sll	a5,a5,0x1
    2908:	fd042703          	lw	a4,-48(s0)
    290c:	00f707b3          	add	a5,a4,a5
    2910:	00079783          	lh	a5,0(a5)
    2914:	00078593          	mv	a1,a5
    2918:	00068513          	mv	a0,a3
    291c:	789040ef          	jal	78a4 <__mulsi3>
    2920:	00050793          	mv	a5,a0
    2924:	00078693          	mv	a3,a5
    2928:	fec42783          	lw	a5,-20(s0)
    292c:	00279793          	sll	a5,a5,0x2
    2930:	fd842703          	lw	a4,-40(s0)
    2934:	00f707b3          	add	a5,a4,a5
    2938:	00d48733          	add	a4,s1,a3
    293c:	00e7a023          	sw	a4,0(a5)
    2940:	fe842783          	lw	a5,-24(s0)
    2944:	00178793          	add	a5,a5,1
    2948:	fef42423          	sw	a5,-24(s0)
    294c:	fe842703          	lw	a4,-24(s0)
    2950:	fdc42783          	lw	a5,-36(s0)
    2954:	f6f764e3          	bltu	a4,a5,28bc <matrix_mul_vect+0x48>
    2958:	fec42783          	lw	a5,-20(s0)
    295c:	00178793          	add	a5,a5,1
    2960:	fef42623          	sw	a5,-20(s0)
    2964:	fec42703          	lw	a4,-20(s0)
    2968:	fdc42783          	lw	a5,-36(s0)
    296c:	f2f76ae3          	bltu	a4,a5,28a0 <matrix_mul_vect+0x2c>
    2970:	00000013          	nop
    2974:	00000013          	nop
    2978:	02c12083          	lw	ra,44(sp)
    297c:	02812403          	lw	s0,40(sp)
    2980:	02412483          	lw	s1,36(sp)
    2984:	03010113          	add	sp,sp,48
    2988:	00008067          	ret

0000298c <matrix_mul_matrix>:
    298c:	fd010113          	add	sp,sp,-48
    2990:	02112623          	sw	ra,44(sp)
    2994:	02812423          	sw	s0,40(sp)
    2998:	02912223          	sw	s1,36(sp)
    299c:	03212023          	sw	s2,32(sp)
    29a0:	03010413          	add	s0,sp,48
    29a4:	fca42e23          	sw	a0,-36(s0)
    29a8:	fcb42c23          	sw	a1,-40(s0)
    29ac:	fcc42a23          	sw	a2,-44(s0)
    29b0:	fcd42823          	sw	a3,-48(s0)
    29b4:	fe042623          	sw	zero,-20(s0)
    29b8:	1480006f          	j	2b00 <matrix_mul_matrix+0x174>
    29bc:	fe042423          	sw	zero,-24(s0)
    29c0:	1280006f          	j	2ae8 <matrix_mul_matrix+0x15c>
    29c4:	fdc42583          	lw	a1,-36(s0)
    29c8:	fec42503          	lw	a0,-20(s0)
    29cc:	6d9040ef          	jal	78a4 <__mulsi3>
    29d0:	00050793          	mv	a5,a0
    29d4:	00078713          	mv	a4,a5
    29d8:	fe842783          	lw	a5,-24(s0)
    29dc:	00f707b3          	add	a5,a4,a5
    29e0:	00279793          	sll	a5,a5,0x2
    29e4:	fd842703          	lw	a4,-40(s0)
    29e8:	00f707b3          	add	a5,a4,a5
    29ec:	0007a023          	sw	zero,0(a5)
    29f0:	fe042223          	sw	zero,-28(s0)
    29f4:	0dc0006f          	j	2ad0 <matrix_mul_matrix+0x144>
    29f8:	fdc42583          	lw	a1,-36(s0)
    29fc:	fec42503          	lw	a0,-20(s0)
    2a00:	6a5040ef          	jal	78a4 <__mulsi3>
    2a04:	00050793          	mv	a5,a0
    2a08:	00078713          	mv	a4,a5
    2a0c:	fe842783          	lw	a5,-24(s0)
    2a10:	00f707b3          	add	a5,a4,a5
    2a14:	00279793          	sll	a5,a5,0x2
    2a18:	fd842703          	lw	a4,-40(s0)
    2a1c:	00f707b3          	add	a5,a4,a5
    2a20:	0007a483          	lw	s1,0(a5)
    2a24:	fdc42583          	lw	a1,-36(s0)
    2a28:	fec42503          	lw	a0,-20(s0)
    2a2c:	679040ef          	jal	78a4 <__mulsi3>
    2a30:	00050793          	mv	a5,a0
    2a34:	00078713          	mv	a4,a5
    2a38:	fe442783          	lw	a5,-28(s0)
    2a3c:	00f707b3          	add	a5,a4,a5
    2a40:	00179793          	sll	a5,a5,0x1
    2a44:	fd442703          	lw	a4,-44(s0)
    2a48:	00f707b3          	add	a5,a4,a5
    2a4c:	00079783          	lh	a5,0(a5)
    2a50:	00078913          	mv	s2,a5
    2a54:	fdc42583          	lw	a1,-36(s0)
    2a58:	fe442503          	lw	a0,-28(s0)
    2a5c:	649040ef          	jal	78a4 <__mulsi3>
    2a60:	00050793          	mv	a5,a0
    2a64:	00078713          	mv	a4,a5
    2a68:	fe842783          	lw	a5,-24(s0)
    2a6c:	00f707b3          	add	a5,a4,a5
    2a70:	00179793          	sll	a5,a5,0x1
    2a74:	fd042703          	lw	a4,-48(s0)
    2a78:	00f707b3          	add	a5,a4,a5
    2a7c:	00079783          	lh	a5,0(a5)
    2a80:	00078593          	mv	a1,a5
    2a84:	00090513          	mv	a0,s2
    2a88:	61d040ef          	jal	78a4 <__mulsi3>
    2a8c:	00050793          	mv	a5,a0
    2a90:	00078913          	mv	s2,a5
    2a94:	fdc42583          	lw	a1,-36(s0)
    2a98:	fec42503          	lw	a0,-20(s0)
    2a9c:	609040ef          	jal	78a4 <__mulsi3>
    2aa0:	00050793          	mv	a5,a0
    2aa4:	00078713          	mv	a4,a5
    2aa8:	fe842783          	lw	a5,-24(s0)
    2aac:	00f707b3          	add	a5,a4,a5
    2ab0:	00279793          	sll	a5,a5,0x2
    2ab4:	fd842703          	lw	a4,-40(s0)
    2ab8:	00f707b3          	add	a5,a4,a5
    2abc:	01248733          	add	a4,s1,s2
    2ac0:	00e7a023          	sw	a4,0(a5)
    2ac4:	fe442783          	lw	a5,-28(s0)
    2ac8:	00178793          	add	a5,a5,1
    2acc:	fef42223          	sw	a5,-28(s0)
    2ad0:	fe442703          	lw	a4,-28(s0)
    2ad4:	fdc42783          	lw	a5,-36(s0)
    2ad8:	f2f760e3          	bltu	a4,a5,29f8 <matrix_mul_matrix+0x6c>
    2adc:	fe842783          	lw	a5,-24(s0)
    2ae0:	00178793          	add	a5,a5,1
    2ae4:	fef42423          	sw	a5,-24(s0)
    2ae8:	fe842703          	lw	a4,-24(s0)
    2aec:	fdc42783          	lw	a5,-36(s0)
    2af0:	ecf76ae3          	bltu	a4,a5,29c4 <matrix_mul_matrix+0x38>
    2af4:	fec42783          	lw	a5,-20(s0)
    2af8:	00178793          	add	a5,a5,1
    2afc:	fef42623          	sw	a5,-20(s0)
    2b00:	fec42703          	lw	a4,-20(s0)
    2b04:	fdc42783          	lw	a5,-36(s0)
    2b08:	eaf76ae3          	bltu	a4,a5,29bc <matrix_mul_matrix+0x30>
    2b0c:	00000013          	nop
    2b10:	00000013          	nop
    2b14:	02c12083          	lw	ra,44(sp)
    2b18:	02812403          	lw	s0,40(sp)
    2b1c:	02412483          	lw	s1,36(sp)
    2b20:	02012903          	lw	s2,32(sp)
    2b24:	03010113          	add	sp,sp,48
    2b28:	00008067          	ret

00002b2c <matrix_mul_matrix_bitextract>:
    2b2c:	fd010113          	add	sp,sp,-48
    2b30:	02112623          	sw	ra,44(sp)
    2b34:	02812423          	sw	s0,40(sp)
    2b38:	02912223          	sw	s1,36(sp)
    2b3c:	03010413          	add	s0,sp,48
    2b40:	fca42e23          	sw	a0,-36(s0)
    2b44:	fcb42c23          	sw	a1,-40(s0)
    2b48:	fcc42a23          	sw	a2,-44(s0)
    2b4c:	fcd42823          	sw	a3,-48(s0)
    2b50:	fe042623          	sw	zero,-20(s0)
    2b54:	1780006f          	j	2ccc <matrix_mul_matrix_bitextract+0x1a0>
    2b58:	fe042423          	sw	zero,-24(s0)
    2b5c:	1580006f          	j	2cb4 <matrix_mul_matrix_bitextract+0x188>
    2b60:	fdc42583          	lw	a1,-36(s0)
    2b64:	fec42503          	lw	a0,-20(s0)
    2b68:	53d040ef          	jal	78a4 <__mulsi3>
    2b6c:	00050793          	mv	a5,a0
    2b70:	00078713          	mv	a4,a5
    2b74:	fe842783          	lw	a5,-24(s0)
    2b78:	00f707b3          	add	a5,a4,a5
    2b7c:	00279793          	sll	a5,a5,0x2
    2b80:	fd842703          	lw	a4,-40(s0)
    2b84:	00f707b3          	add	a5,a4,a5
    2b88:	0007a023          	sw	zero,0(a5)
    2b8c:	fe042223          	sw	zero,-28(s0)
    2b90:	10c0006f          	j	2c9c <matrix_mul_matrix_bitextract+0x170>
    2b94:	fdc42583          	lw	a1,-36(s0)
    2b98:	fec42503          	lw	a0,-20(s0)
    2b9c:	509040ef          	jal	78a4 <__mulsi3>
    2ba0:	00050793          	mv	a5,a0
    2ba4:	00078713          	mv	a4,a5
    2ba8:	fe442783          	lw	a5,-28(s0)
    2bac:	00f707b3          	add	a5,a4,a5
    2bb0:	00179793          	sll	a5,a5,0x1
    2bb4:	fd442703          	lw	a4,-44(s0)
    2bb8:	00f707b3          	add	a5,a4,a5
    2bbc:	00079783          	lh	a5,0(a5)
    2bc0:	00078493          	mv	s1,a5
    2bc4:	fdc42583          	lw	a1,-36(s0)
    2bc8:	fe442503          	lw	a0,-28(s0)
    2bcc:	4d9040ef          	jal	78a4 <__mulsi3>
    2bd0:	00050793          	mv	a5,a0
    2bd4:	00078713          	mv	a4,a5
    2bd8:	fe842783          	lw	a5,-24(s0)
    2bdc:	00f707b3          	add	a5,a4,a5
    2be0:	00179793          	sll	a5,a5,0x1
    2be4:	fd042703          	lw	a4,-48(s0)
    2be8:	00f707b3          	add	a5,a4,a5
    2bec:	00079783          	lh	a5,0(a5)
    2bf0:	00078593          	mv	a1,a5
    2bf4:	00048513          	mv	a0,s1
    2bf8:	4ad040ef          	jal	78a4 <__mulsi3>
    2bfc:	00050793          	mv	a5,a0
    2c00:	fef42023          	sw	a5,-32(s0)
    2c04:	fdc42583          	lw	a1,-36(s0)
    2c08:	fec42503          	lw	a0,-20(s0)
    2c0c:	499040ef          	jal	78a4 <__mulsi3>
    2c10:	00050793          	mv	a5,a0
    2c14:	00078713          	mv	a4,a5
    2c18:	fe842783          	lw	a5,-24(s0)
    2c1c:	00f707b3          	add	a5,a4,a5
    2c20:	00279793          	sll	a5,a5,0x2
    2c24:	fd842703          	lw	a4,-40(s0)
    2c28:	00f707b3          	add	a5,a4,a5
    2c2c:	0007a783          	lw	a5,0(a5)
    2c30:	00078493          	mv	s1,a5
    2c34:	fe042783          	lw	a5,-32(s0)
    2c38:	4027d793          	sra	a5,a5,0x2
    2c3c:	00f7f713          	and	a4,a5,15
    2c40:	fe042783          	lw	a5,-32(s0)
    2c44:	4057d793          	sra	a5,a5,0x5
    2c48:	07f7f793          	and	a5,a5,127
    2c4c:	00078593          	mv	a1,a5
    2c50:	00070513          	mv	a0,a4
    2c54:	451040ef          	jal	78a4 <__mulsi3>
    2c58:	00050793          	mv	a5,a0
    2c5c:	00f484b3          	add	s1,s1,a5
    2c60:	fdc42583          	lw	a1,-36(s0)
    2c64:	fec42503          	lw	a0,-20(s0)
    2c68:	43d040ef          	jal	78a4 <__mulsi3>
    2c6c:	00050793          	mv	a5,a0
    2c70:	00078713          	mv	a4,a5
    2c74:	fe842783          	lw	a5,-24(s0)
    2c78:	00f707b3          	add	a5,a4,a5
    2c7c:	00279793          	sll	a5,a5,0x2
    2c80:	fd842703          	lw	a4,-40(s0)
    2c84:	00f707b3          	add	a5,a4,a5
    2c88:	00048713          	mv	a4,s1
    2c8c:	00e7a023          	sw	a4,0(a5)
    2c90:	fe442783          	lw	a5,-28(s0)
    2c94:	00178793          	add	a5,a5,1
    2c98:	fef42223          	sw	a5,-28(s0)
    2c9c:	fe442703          	lw	a4,-28(s0)
    2ca0:	fdc42783          	lw	a5,-36(s0)
    2ca4:	eef768e3          	bltu	a4,a5,2b94 <matrix_mul_matrix_bitextract+0x68>
    2ca8:	fe842783          	lw	a5,-24(s0)
    2cac:	00178793          	add	a5,a5,1
    2cb0:	fef42423          	sw	a5,-24(s0)
    2cb4:	fe842703          	lw	a4,-24(s0)
    2cb8:	fdc42783          	lw	a5,-36(s0)
    2cbc:	eaf762e3          	bltu	a4,a5,2b60 <matrix_mul_matrix_bitextract+0x34>
    2cc0:	fec42783          	lw	a5,-20(s0)
    2cc4:	00178793          	add	a5,a5,1
    2cc8:	fef42623          	sw	a5,-20(s0)
    2ccc:	fec42703          	lw	a4,-20(s0)
    2cd0:	fdc42783          	lw	a5,-36(s0)
    2cd4:	e8f762e3          	bltu	a4,a5,2b58 <matrix_mul_matrix_bitextract+0x2c>
    2cd8:	00000013          	nop
    2cdc:	00000013          	nop
    2ce0:	02c12083          	lw	ra,44(sp)
    2ce4:	02812403          	lw	s0,40(sp)
    2ce8:	02412483          	lw	s1,36(sp)
    2cec:	03010113          	add	sp,sp,48
    2cf0:	00008067          	ret

00002cf4 <core_bench_state>:
    2cf4:	f9010113          	add	sp,sp,-112
    2cf8:	06112623          	sw	ra,108(sp)
    2cfc:	06812423          	sw	s0,104(sp)
    2d00:	07010413          	add	s0,sp,112
    2d04:	f8a42e23          	sw	a0,-100(s0)
    2d08:	f8b42c23          	sw	a1,-104(s0)
    2d0c:	00060593          	mv	a1,a2
    2d10:	00068613          	mv	a2,a3
    2d14:	00070693          	mv	a3,a4
    2d18:	00078713          	mv	a4,a5
    2d1c:	00058793          	mv	a5,a1
    2d20:	f8f41b23          	sh	a5,-106(s0)
    2d24:	00060793          	mv	a5,a2
    2d28:	f8f41a23          	sh	a5,-108(s0)
    2d2c:	00068793          	mv	a5,a3
    2d30:	f8f41923          	sh	a5,-110(s0)
    2d34:	00070793          	mv	a5,a4
    2d38:	f8f41823          	sh	a5,-112(s0)
    2d3c:	f9842783          	lw	a5,-104(s0)
    2d40:	faf42023          	sw	a5,-96(s0)
    2d44:	fe042623          	sw	zero,-20(s0)
    2d48:	04c0006f          	j	2d94 <core_bench_state+0xa0>
    2d4c:	fec42783          	lw	a5,-20(s0)
    2d50:	00279793          	sll	a5,a5,0x2
    2d54:	ff078793          	add	a5,a5,-16
    2d58:	008787b3          	add	a5,a5,s0
    2d5c:	fa07aa23          	sw	zero,-76(a5)
    2d60:	fec42783          	lw	a5,-20(s0)
    2d64:	00279793          	sll	a5,a5,0x2
    2d68:	ff078793          	add	a5,a5,-16
    2d6c:	008787b3          	add	a5,a5,s0
    2d70:	fb47a703          	lw	a4,-76(a5)
    2d74:	fec42783          	lw	a5,-20(s0)
    2d78:	00279793          	sll	a5,a5,0x2
    2d7c:	ff078793          	add	a5,a5,-16
    2d80:	008787b3          	add	a5,a5,s0
    2d84:	fce7aa23          	sw	a4,-44(a5)
    2d88:	fec42783          	lw	a5,-20(s0)
    2d8c:	00178793          	add	a5,a5,1
    2d90:	fef42623          	sw	a5,-20(s0)
    2d94:	fec42703          	lw	a4,-20(s0)
    2d98:	00700793          	li	a5,7
    2d9c:	fae7f8e3          	bgeu	a5,a4,2d4c <core_bench_state+0x58>
    2da0:	0480006f          	j	2de8 <core_bench_state+0xf4>
    2da4:	fa440713          	add	a4,s0,-92
    2da8:	fa040793          	add	a5,s0,-96
    2dac:	00070593          	mv	a1,a4
    2db0:	00078513          	mv	a0,a5
    2db4:	4b4000ef          	jal	3268 <core_state_transition>
    2db8:	fea42223          	sw	a0,-28(s0)
    2dbc:	fe442783          	lw	a5,-28(s0)
    2dc0:	00279793          	sll	a5,a5,0x2
    2dc4:	ff078793          	add	a5,a5,-16
    2dc8:	008787b3          	add	a5,a5,s0
    2dcc:	fd47a783          	lw	a5,-44(a5)
    2dd0:	00178713          	add	a4,a5,1
    2dd4:	fe442783          	lw	a5,-28(s0)
    2dd8:	00279793          	sll	a5,a5,0x2
    2ddc:	ff078793          	add	a5,a5,-16
    2de0:	008787b3          	add	a5,a5,s0
    2de4:	fce7aa23          	sw	a4,-44(a5)
    2de8:	fa042783          	lw	a5,-96(s0)
    2dec:	0007c783          	lbu	a5,0(a5)
    2df0:	fa079ae3          	bnez	a5,2da4 <core_bench_state+0xb0>
    2df4:	f9842783          	lw	a5,-104(s0)
    2df8:	faf42023          	sw	a5,-96(s0)
    2dfc:	0440006f          	j	2e40 <core_bench_state+0x14c>
    2e00:	fa042783          	lw	a5,-96(s0)
    2e04:	0007c703          	lbu	a4,0(a5)
    2e08:	02c00793          	li	a5,44
    2e0c:	02f70263          	beq	a4,a5,2e30 <core_bench_state+0x13c>
    2e10:	fa042783          	lw	a5,-96(s0)
    2e14:	0007c683          	lbu	a3,0(a5)
    2e18:	f9645783          	lhu	a5,-106(s0)
    2e1c:	0ff7f713          	zext.b	a4,a5
    2e20:	fa042783          	lw	a5,-96(s0)
    2e24:	00e6c733          	xor	a4,a3,a4
    2e28:	0ff77713          	zext.b	a4,a4
    2e2c:	00e78023          	sb	a4,0(a5)
    2e30:	fa042703          	lw	a4,-96(s0)
    2e34:	f9241783          	lh	a5,-110(s0)
    2e38:	00f707b3          	add	a5,a4,a5
    2e3c:	faf42023          	sw	a5,-96(s0)
    2e40:	f9842703          	lw	a4,-104(s0)
    2e44:	f9c42783          	lw	a5,-100(s0)
    2e48:	00f70733          	add	a4,a4,a5
    2e4c:	fa042783          	lw	a5,-96(s0)
    2e50:	fae7e8e3          	bltu	a5,a4,2e00 <core_bench_state+0x10c>
    2e54:	f9842783          	lw	a5,-104(s0)
    2e58:	faf42023          	sw	a5,-96(s0)
    2e5c:	0480006f          	j	2ea4 <core_bench_state+0x1b0>
    2e60:	fa440713          	add	a4,s0,-92
    2e64:	fa040793          	add	a5,s0,-96
    2e68:	00070593          	mv	a1,a4
    2e6c:	00078513          	mv	a0,a5
    2e70:	3f8000ef          	jal	3268 <core_state_transition>
    2e74:	fea42423          	sw	a0,-24(s0)
    2e78:	fe842783          	lw	a5,-24(s0)
    2e7c:	00279793          	sll	a5,a5,0x2
    2e80:	ff078793          	add	a5,a5,-16
    2e84:	008787b3          	add	a5,a5,s0
    2e88:	fd47a783          	lw	a5,-44(a5)
    2e8c:	00178713          	add	a4,a5,1
    2e90:	fe842783          	lw	a5,-24(s0)
    2e94:	00279793          	sll	a5,a5,0x2
    2e98:	ff078793          	add	a5,a5,-16
    2e9c:	008787b3          	add	a5,a5,s0
    2ea0:	fce7aa23          	sw	a4,-44(a5)
    2ea4:	fa042783          	lw	a5,-96(s0)
    2ea8:	0007c783          	lbu	a5,0(a5)
    2eac:	fa079ae3          	bnez	a5,2e60 <core_bench_state+0x16c>
    2eb0:	f9842783          	lw	a5,-104(s0)
    2eb4:	faf42023          	sw	a5,-96(s0)
    2eb8:	0440006f          	j	2efc <core_bench_state+0x208>
    2ebc:	fa042783          	lw	a5,-96(s0)
    2ec0:	0007c703          	lbu	a4,0(a5)
    2ec4:	02c00793          	li	a5,44
    2ec8:	02f70263          	beq	a4,a5,2eec <core_bench_state+0x1f8>
    2ecc:	fa042783          	lw	a5,-96(s0)
    2ed0:	0007c683          	lbu	a3,0(a5)
    2ed4:	f9445783          	lhu	a5,-108(s0)
    2ed8:	0ff7f713          	zext.b	a4,a5
    2edc:	fa042783          	lw	a5,-96(s0)
    2ee0:	00e6c733          	xor	a4,a3,a4
    2ee4:	0ff77713          	zext.b	a4,a4
    2ee8:	00e78023          	sb	a4,0(a5)
    2eec:	fa042703          	lw	a4,-96(s0)
    2ef0:	f9241783          	lh	a5,-110(s0)
    2ef4:	00f707b3          	add	a5,a4,a5
    2ef8:	faf42023          	sw	a5,-96(s0)
    2efc:	f9842703          	lw	a4,-104(s0)
    2f00:	f9c42783          	lw	a5,-100(s0)
    2f04:	00f70733          	add	a4,a4,a5
    2f08:	fa042783          	lw	a5,-96(s0)
    2f0c:	fae7e8e3          	bltu	a5,a4,2ebc <core_bench_state+0x1c8>
    2f10:	fe042623          	sw	zero,-20(s0)
    2f14:	0680006f          	j	2f7c <core_bench_state+0x288>
    2f18:	fec42783          	lw	a5,-20(s0)
    2f1c:	00279793          	sll	a5,a5,0x2
    2f20:	ff078793          	add	a5,a5,-16
    2f24:	008787b3          	add	a5,a5,s0
    2f28:	fd47a783          	lw	a5,-44(a5)
    2f2c:	f9045703          	lhu	a4,-112(s0)
    2f30:	00070593          	mv	a1,a4
    2f34:	00078513          	mv	a0,a5
    2f38:	0f5000ef          	jal	382c <crcu32>
    2f3c:	00050793          	mv	a5,a0
    2f40:	f8f41823          	sh	a5,-112(s0)
    2f44:	fec42783          	lw	a5,-20(s0)
    2f48:	00279793          	sll	a5,a5,0x2
    2f4c:	ff078793          	add	a5,a5,-16
    2f50:	008787b3          	add	a5,a5,s0
    2f54:	fb47a783          	lw	a5,-76(a5)
    2f58:	f9045703          	lhu	a4,-112(s0)
    2f5c:	00070593          	mv	a1,a4
    2f60:	00078513          	mv	a0,a5
    2f64:	0c9000ef          	jal	382c <crcu32>
    2f68:	00050793          	mv	a5,a0
    2f6c:	f8f41823          	sh	a5,-112(s0)
    2f70:	fec42783          	lw	a5,-20(s0)
    2f74:	00178793          	add	a5,a5,1
    2f78:	fef42623          	sw	a5,-20(s0)
    2f7c:	fec42703          	lw	a4,-20(s0)
    2f80:	00700793          	li	a5,7
    2f84:	f8e7fae3          	bgeu	a5,a4,2f18 <core_bench_state+0x224>
    2f88:	f9045783          	lhu	a5,-112(s0)
    2f8c:	00078513          	mv	a0,a5
    2f90:	06c12083          	lw	ra,108(sp)
    2f94:	06812403          	lw	s0,104(sp)
    2f98:	07010113          	add	sp,sp,112
    2f9c:	00008067          	ret

00002fa0 <core_init_state>:
    2fa0:	fd010113          	add	sp,sp,-48
    2fa4:	02812623          	sw	s0,44(sp)
    2fa8:	03010413          	add	s0,sp,48
    2fac:	fca42e23          	sw	a0,-36(s0)
    2fb0:	00058793          	mv	a5,a1
    2fb4:	fcc42a23          	sw	a2,-44(s0)
    2fb8:	fcf41d23          	sh	a5,-38(s0)
    2fbc:	fe042623          	sw	zero,-20(s0)
    2fc0:	fe042423          	sw	zero,-24(s0)
    2fc4:	fe042023          	sw	zero,-32(s0)
    2fc8:	fdc42783          	lw	a5,-36(s0)
    2fcc:	fff78793          	add	a5,a5,-1
    2fd0:	fcf42e23          	sw	a5,-36(s0)
    2fd4:	fe042423          	sw	zero,-24(s0)
    2fd8:	1dc0006f          	j	31b4 <core_init_state+0x214>
    2fdc:	fe842783          	lw	a5,-24(s0)
    2fe0:	06078e63          	beqz	a5,305c <core_init_state+0xbc>
    2fe4:	fe042223          	sw	zero,-28(s0)
    2fe8:	0380006f          	j	3020 <core_init_state+0x80>
    2fec:	fe042703          	lw	a4,-32(s0)
    2ff0:	fe442783          	lw	a5,-28(s0)
    2ff4:	00f70733          	add	a4,a4,a5
    2ff8:	fec42683          	lw	a3,-20(s0)
    2ffc:	fe442783          	lw	a5,-28(s0)
    3000:	00f687b3          	add	a5,a3,a5
    3004:	fd442683          	lw	a3,-44(s0)
    3008:	00f687b3          	add	a5,a3,a5
    300c:	00074703          	lbu	a4,0(a4)
    3010:	00e78023          	sb	a4,0(a5)
    3014:	fe442783          	lw	a5,-28(s0)
    3018:	00178793          	add	a5,a5,1
    301c:	fef42223          	sw	a5,-28(s0)
    3020:	fe442703          	lw	a4,-28(s0)
    3024:	fe842783          	lw	a5,-24(s0)
    3028:	fcf762e3          	bltu	a4,a5,2fec <core_init_state+0x4c>
    302c:	fec42703          	lw	a4,-20(s0)
    3030:	fe442783          	lw	a5,-28(s0)
    3034:	00f707b3          	add	a5,a4,a5
    3038:	fd442703          	lw	a4,-44(s0)
    303c:	00f707b3          	add	a5,a4,a5
    3040:	02c00713          	li	a4,44
    3044:	00e78023          	sb	a4,0(a5)
    3048:	fe842703          	lw	a4,-24(s0)
    304c:	fec42783          	lw	a5,-20(s0)
    3050:	00f707b3          	add	a5,a4,a5
    3054:	00178793          	add	a5,a5,1
    3058:	fef42623          	sw	a5,-20(s0)
    305c:	fda41783          	lh	a5,-38(s0)
    3060:	01079793          	sll	a5,a5,0x10
    3064:	0107d793          	srl	a5,a5,0x10
    3068:	00178793          	add	a5,a5,1
    306c:	01079793          	sll	a5,a5,0x10
    3070:	0107d793          	srl	a5,a5,0x10
    3074:	fcf41d23          	sh	a5,-38(s0)
    3078:	fda45783          	lhu	a5,-38(s0)
    307c:	0077f793          	and	a5,a5,7
    3080:	00700713          	li	a4,7
    3084:	0ee78863          	beq	a5,a4,3174 <core_init_state+0x1d4>
    3088:	00700713          	li	a4,7
    308c:	12f74263          	blt	a4,a5,31b0 <core_init_state+0x210>
    3090:	00600713          	li	a4,6
    3094:	10f74e63          	blt	a4,a5,31b0 <core_init_state+0x210>
    3098:	00500713          	li	a4,5
    309c:	08e7de63          	bge	a5,a4,3138 <core_init_state+0x198>
    30a0:	00200713          	li	a4,2
    30a4:	00f74663          	blt	a4,a5,30b0 <core_init_state+0x110>
    30a8:	0007dc63          	bgez	a5,30c0 <core_init_state+0x120>
    30ac:	1040006f          	j	31b0 <core_init_state+0x210>
    30b0:	ffd78713          	add	a4,a5,-3
    30b4:	00100793          	li	a5,1
    30b8:	0ee7ec63          	bltu	a5,a4,31b0 <core_init_state+0x210>
    30bc:	0400006f          	j	30fc <core_init_state+0x15c>
    30c0:	fda41783          	lh	a5,-38(s0)
    30c4:	4037d793          	sra	a5,a5,0x3
    30c8:	01079793          	sll	a5,a5,0x10
    30cc:	4107d793          	sra	a5,a5,0x10
    30d0:	01079793          	sll	a5,a5,0x10
    30d4:	0107d793          	srl	a5,a5,0x10
    30d8:	0037f793          	and	a5,a5,3
    30dc:	48800713          	li	a4,1160
    30e0:	00279793          	sll	a5,a5,0x2
    30e4:	00f707b3          	add	a5,a4,a5
    30e8:	0007a783          	lw	a5,0(a5)
    30ec:	fef42023          	sw	a5,-32(s0)
    30f0:	00400793          	li	a5,4
    30f4:	fef42423          	sw	a5,-24(s0)
    30f8:	0bc0006f          	j	31b4 <core_init_state+0x214>
    30fc:	fda41783          	lh	a5,-38(s0)
    3100:	4037d793          	sra	a5,a5,0x3
    3104:	01079793          	sll	a5,a5,0x10
    3108:	4107d793          	sra	a5,a5,0x10
    310c:	01079793          	sll	a5,a5,0x10
    3110:	0107d793          	srl	a5,a5,0x10
    3114:	0037f793          	and	a5,a5,3
    3118:	49800713          	li	a4,1176
    311c:	00279793          	sll	a5,a5,0x2
    3120:	00f707b3          	add	a5,a4,a5
    3124:	0007a783          	lw	a5,0(a5)
    3128:	fef42023          	sw	a5,-32(s0)
    312c:	00800793          	li	a5,8
    3130:	fef42423          	sw	a5,-24(s0)
    3134:	0800006f          	j	31b4 <core_init_state+0x214>
    3138:	fda41783          	lh	a5,-38(s0)
    313c:	4037d793          	sra	a5,a5,0x3
    3140:	01079793          	sll	a5,a5,0x10
    3144:	4107d793          	sra	a5,a5,0x10
    3148:	01079793          	sll	a5,a5,0x10
    314c:	0107d793          	srl	a5,a5,0x10
    3150:	0037f793          	and	a5,a5,3
    3154:	4a800713          	li	a4,1192
    3158:	00279793          	sll	a5,a5,0x2
    315c:	00f707b3          	add	a5,a4,a5
    3160:	0007a783          	lw	a5,0(a5)
    3164:	fef42023          	sw	a5,-32(s0)
    3168:	00800793          	li	a5,8
    316c:	fef42423          	sw	a5,-24(s0)
    3170:	0440006f          	j	31b4 <core_init_state+0x214>
    3174:	fda41783          	lh	a5,-38(s0)
    3178:	4037d793          	sra	a5,a5,0x3
    317c:	01079793          	sll	a5,a5,0x10
    3180:	4107d793          	sra	a5,a5,0x10
    3184:	01079793          	sll	a5,a5,0x10
    3188:	0107d793          	srl	a5,a5,0x10
    318c:	0037f793          	and	a5,a5,3
    3190:	4b800713          	li	a4,1208
    3194:	00279793          	sll	a5,a5,0x2
    3198:	00f707b3          	add	a5,a4,a5
    319c:	0007a783          	lw	a5,0(a5)
    31a0:	fef42023          	sw	a5,-32(s0)
    31a4:	00800793          	li	a5,8
    31a8:	fef42423          	sw	a5,-24(s0)
    31ac:	0080006f          	j	31b4 <core_init_state+0x214>
    31b0:	00000013          	nop
    31b4:	fec42703          	lw	a4,-20(s0)
    31b8:	fe842783          	lw	a5,-24(s0)
    31bc:	00f707b3          	add	a5,a4,a5
    31c0:	00178793          	add	a5,a5,1
    31c4:	fdc42703          	lw	a4,-36(s0)
    31c8:	e0e7eae3          	bltu	a5,a4,2fdc <core_init_state+0x3c>
    31cc:	fdc42783          	lw	a5,-36(s0)
    31d0:	00178793          	add	a5,a5,1
    31d4:	fcf42e23          	sw	a5,-36(s0)
    31d8:	0200006f          	j	31f8 <core_init_state+0x258>
    31dc:	fd442703          	lw	a4,-44(s0)
    31e0:	fec42783          	lw	a5,-20(s0)
    31e4:	00f707b3          	add	a5,a4,a5
    31e8:	00078023          	sb	zero,0(a5)
    31ec:	fec42783          	lw	a5,-20(s0)
    31f0:	00178793          	add	a5,a5,1
    31f4:	fef42623          	sw	a5,-20(s0)
    31f8:	fec42703          	lw	a4,-20(s0)
    31fc:	fdc42783          	lw	a5,-36(s0)
    3200:	fcf76ee3          	bltu	a4,a5,31dc <core_init_state+0x23c>
    3204:	00000013          	nop
    3208:	00000013          	nop
    320c:	02c12403          	lw	s0,44(sp)
    3210:	03010113          	add	sp,sp,48
    3214:	00008067          	ret

00003218 <ee_isdigit>:
    3218:	fd010113          	add	sp,sp,-48
    321c:	02812623          	sw	s0,44(sp)
    3220:	03010413          	add	s0,sp,48
    3224:	00050793          	mv	a5,a0
    3228:	fcf40fa3          	sb	a5,-33(s0)
    322c:	fdf44783          	lbu	a5,-33(s0)
    3230:	0307b793          	sltiu	a5,a5,48
    3234:	0017b793          	seqz	a5,a5
    3238:	0ff7f713          	zext.b	a4,a5
    323c:	fdf44783          	lbu	a5,-33(s0)
    3240:	03a7b793          	sltiu	a5,a5,58
    3244:	0ff7f793          	zext.b	a5,a5
    3248:	00f777b3          	and	a5,a4,a5
    324c:	0ff7f793          	zext.b	a5,a5
    3250:	fef407a3          	sb	a5,-17(s0)
    3254:	fef44783          	lbu	a5,-17(s0)
    3258:	00078513          	mv	a0,a5
    325c:	02c12403          	lw	s0,44(sp)
    3260:	03010113          	add	sp,sp,48
    3264:	00008067          	ret

00003268 <core_state_transition>:
    3268:	fd010113          	add	sp,sp,-48
    326c:	02112623          	sw	ra,44(sp)
    3270:	02812423          	sw	s0,40(sp)
    3274:	03010413          	add	s0,sp,48
    3278:	fca42e23          	sw	a0,-36(s0)
    327c:	fcb42c23          	sw	a1,-40(s0)
    3280:	fdc42783          	lw	a5,-36(s0)
    3284:	0007a783          	lw	a5,0(a5)
    3288:	fef42623          	sw	a5,-20(s0)
    328c:	fe042423          	sw	zero,-24(s0)
    3290:	3340006f          	j	35c4 <core_state_transition+0x35c>
    3294:	fec42783          	lw	a5,-20(s0)
    3298:	0007c783          	lbu	a5,0(a5)
    329c:	fef403a3          	sb	a5,-25(s0)
    32a0:	fe744703          	lbu	a4,-25(s0)
    32a4:	02c00793          	li	a5,44
    32a8:	00f71a63          	bne	a4,a5,32bc <core_state_transition+0x54>
    32ac:	fec42783          	lw	a5,-20(s0)
    32b0:	00178793          	add	a5,a5,1
    32b4:	fef42623          	sw	a5,-20(s0)
    32b8:	3240006f          	j	35dc <core_state_transition+0x374>
    32bc:	fe842703          	lw	a4,-24(s0)
    32c0:	00700793          	li	a5,7
    32c4:	2ce7ec63          	bltu	a5,a4,359c <core_state_transition+0x334>
    32c8:	fe842783          	lw	a5,-24(s0)
    32cc:	00279713          	sll	a4,a5,0x2
    32d0:	57800793          	li	a5,1400
    32d4:	00f707b3          	add	a5,a4,a5
    32d8:	0007a783          	lw	a5,0(a5)
    32dc:	00078067          	jr	a5
    32e0:	fe744783          	lbu	a5,-25(s0)
    32e4:	00078513          	mv	a0,a5
    32e8:	f31ff0ef          	jal	3218 <ee_isdigit>
    32ec:	00050793          	mv	a5,a0
    32f0:	00078863          	beqz	a5,3300 <core_state_transition+0x98>
    32f4:	00400793          	li	a5,4
    32f8:	fef42423          	sw	a5,-24(s0)
    32fc:	05c0006f          	j	3358 <core_state_transition+0xf0>
    3300:	fe744703          	lbu	a4,-25(s0)
    3304:	02b00793          	li	a5,43
    3308:	00f70863          	beq	a4,a5,3318 <core_state_transition+0xb0>
    330c:	fe744703          	lbu	a4,-25(s0)
    3310:	02d00793          	li	a5,45
    3314:	00f71863          	bne	a4,a5,3324 <core_state_transition+0xbc>
    3318:	00200793          	li	a5,2
    331c:	fef42423          	sw	a5,-24(s0)
    3320:	0380006f          	j	3358 <core_state_transition+0xf0>
    3324:	fe744703          	lbu	a4,-25(s0)
    3328:	02e00793          	li	a5,46
    332c:	00f71863          	bne	a4,a5,333c <core_state_transition+0xd4>
    3330:	00500793          	li	a5,5
    3334:	fef42423          	sw	a5,-24(s0)
    3338:	0200006f          	j	3358 <core_state_transition+0xf0>
    333c:	00100793          	li	a5,1
    3340:	fef42423          	sw	a5,-24(s0)
    3344:	fd842783          	lw	a5,-40(s0)
    3348:	00478793          	add	a5,a5,4
    334c:	0007a703          	lw	a4,0(a5)
    3350:	00170713          	add	a4,a4,1
    3354:	00e7a023          	sw	a4,0(a5)
    3358:	fd842783          	lw	a5,-40(s0)
    335c:	0007a783          	lw	a5,0(a5)
    3360:	00178713          	add	a4,a5,1
    3364:	fd842783          	lw	a5,-40(s0)
    3368:	00e7a023          	sw	a4,0(a5)
    336c:	24c0006f          	j	35b8 <core_state_transition+0x350>
    3370:	fe744783          	lbu	a5,-25(s0)
    3374:	00078513          	mv	a0,a5
    3378:	ea1ff0ef          	jal	3218 <ee_isdigit>
    337c:	00050793          	mv	a5,a0
    3380:	02078263          	beqz	a5,33a4 <core_state_transition+0x13c>
    3384:	00400793          	li	a5,4
    3388:	fef42423          	sw	a5,-24(s0)
    338c:	fd842783          	lw	a5,-40(s0)
    3390:	00878793          	add	a5,a5,8
    3394:	0007a703          	lw	a4,0(a5)
    3398:	00170713          	add	a4,a4,1
    339c:	00e7a023          	sw	a4,0(a5)
    33a0:	2180006f          	j	35b8 <core_state_transition+0x350>
    33a4:	fe744703          	lbu	a4,-25(s0)
    33a8:	02e00793          	li	a5,46
    33ac:	02f71263          	bne	a4,a5,33d0 <core_state_transition+0x168>
    33b0:	00500793          	li	a5,5
    33b4:	fef42423          	sw	a5,-24(s0)
    33b8:	fd842783          	lw	a5,-40(s0)
    33bc:	00878793          	add	a5,a5,8
    33c0:	0007a703          	lw	a4,0(a5)
    33c4:	00170713          	add	a4,a4,1
    33c8:	00e7a023          	sw	a4,0(a5)
    33cc:	1ec0006f          	j	35b8 <core_state_transition+0x350>
    33d0:	00100793          	li	a5,1
    33d4:	fef42423          	sw	a5,-24(s0)
    33d8:	fd842783          	lw	a5,-40(s0)
    33dc:	00878793          	add	a5,a5,8
    33e0:	0007a703          	lw	a4,0(a5)
    33e4:	00170713          	add	a4,a4,1
    33e8:	00e7a023          	sw	a4,0(a5)
    33ec:	1cc0006f          	j	35b8 <core_state_transition+0x350>
    33f0:	fe744703          	lbu	a4,-25(s0)
    33f4:	02e00793          	li	a5,46
    33f8:	02f71263          	bne	a4,a5,341c <core_state_transition+0x1b4>
    33fc:	00500793          	li	a5,5
    3400:	fef42423          	sw	a5,-24(s0)
    3404:	fd842783          	lw	a5,-40(s0)
    3408:	01078793          	add	a5,a5,16
    340c:	0007a703          	lw	a4,0(a5)
    3410:	00170713          	add	a4,a4,1
    3414:	00e7a023          	sw	a4,0(a5)
    3418:	18c0006f          	j	35a4 <core_state_transition+0x33c>
    341c:	fe744783          	lbu	a5,-25(s0)
    3420:	00078513          	mv	a0,a5
    3424:	df5ff0ef          	jal	3218 <ee_isdigit>
    3428:	00050793          	mv	a5,a0
    342c:	16079c63          	bnez	a5,35a4 <core_state_transition+0x33c>
    3430:	00100793          	li	a5,1
    3434:	fef42423          	sw	a5,-24(s0)
    3438:	fd842783          	lw	a5,-40(s0)
    343c:	01078793          	add	a5,a5,16
    3440:	0007a703          	lw	a4,0(a5)
    3444:	00170713          	add	a4,a4,1
    3448:	00e7a023          	sw	a4,0(a5)
    344c:	1580006f          	j	35a4 <core_state_transition+0x33c>
    3450:	fe744703          	lbu	a4,-25(s0)
    3454:	04500793          	li	a5,69
    3458:	00f70863          	beq	a4,a5,3468 <core_state_transition+0x200>
    345c:	fe744703          	lbu	a4,-25(s0)
    3460:	06500793          	li	a5,101
    3464:	02f71263          	bne	a4,a5,3488 <core_state_transition+0x220>
    3468:	00300793          	li	a5,3
    346c:	fef42423          	sw	a5,-24(s0)
    3470:	fd842783          	lw	a5,-40(s0)
    3474:	01478793          	add	a5,a5,20
    3478:	0007a703          	lw	a4,0(a5)
    347c:	00170713          	add	a4,a4,1
    3480:	00e7a023          	sw	a4,0(a5)
    3484:	1280006f          	j	35ac <core_state_transition+0x344>
    3488:	fe744783          	lbu	a5,-25(s0)
    348c:	00078513          	mv	a0,a5
    3490:	d89ff0ef          	jal	3218 <ee_isdigit>
    3494:	00050793          	mv	a5,a0
    3498:	10079a63          	bnez	a5,35ac <core_state_transition+0x344>
    349c:	00100793          	li	a5,1
    34a0:	fef42423          	sw	a5,-24(s0)
    34a4:	fd842783          	lw	a5,-40(s0)
    34a8:	01478793          	add	a5,a5,20
    34ac:	0007a703          	lw	a4,0(a5)
    34b0:	00170713          	add	a4,a4,1
    34b4:	00e7a023          	sw	a4,0(a5)
    34b8:	0f40006f          	j	35ac <core_state_transition+0x344>
    34bc:	fe744703          	lbu	a4,-25(s0)
    34c0:	02b00793          	li	a5,43
    34c4:	00f70863          	beq	a4,a5,34d4 <core_state_transition+0x26c>
    34c8:	fe744703          	lbu	a4,-25(s0)
    34cc:	02d00793          	li	a5,45
    34d0:	02f71263          	bne	a4,a5,34f4 <core_state_transition+0x28c>
    34d4:	00600793          	li	a5,6
    34d8:	fef42423          	sw	a5,-24(s0)
    34dc:	fd842783          	lw	a5,-40(s0)
    34e0:	00c78793          	add	a5,a5,12
    34e4:	0007a703          	lw	a4,0(a5)
    34e8:	00170713          	add	a4,a4,1
    34ec:	00e7a023          	sw	a4,0(a5)
    34f0:	0c80006f          	j	35b8 <core_state_transition+0x350>
    34f4:	00100793          	li	a5,1
    34f8:	fef42423          	sw	a5,-24(s0)
    34fc:	fd842783          	lw	a5,-40(s0)
    3500:	00c78793          	add	a5,a5,12
    3504:	0007a703          	lw	a4,0(a5)
    3508:	00170713          	add	a4,a4,1
    350c:	00e7a023          	sw	a4,0(a5)
    3510:	0a80006f          	j	35b8 <core_state_transition+0x350>
    3514:	fe744783          	lbu	a5,-25(s0)
    3518:	00078513          	mv	a0,a5
    351c:	cfdff0ef          	jal	3218 <ee_isdigit>
    3520:	00050793          	mv	a5,a0
    3524:	02078263          	beqz	a5,3548 <core_state_transition+0x2e0>
    3528:	00700793          	li	a5,7
    352c:	fef42423          	sw	a5,-24(s0)
    3530:	fd842783          	lw	a5,-40(s0)
    3534:	01878793          	add	a5,a5,24
    3538:	0007a703          	lw	a4,0(a5)
    353c:	00170713          	add	a4,a4,1
    3540:	00e7a023          	sw	a4,0(a5)
    3544:	0740006f          	j	35b8 <core_state_transition+0x350>
    3548:	00100793          	li	a5,1
    354c:	fef42423          	sw	a5,-24(s0)
    3550:	fd842783          	lw	a5,-40(s0)
    3554:	01878793          	add	a5,a5,24
    3558:	0007a703          	lw	a4,0(a5)
    355c:	00170713          	add	a4,a4,1
    3560:	00e7a023          	sw	a4,0(a5)
    3564:	0540006f          	j	35b8 <core_state_transition+0x350>
    3568:	fe744783          	lbu	a5,-25(s0)
    356c:	00078513          	mv	a0,a5
    3570:	ca9ff0ef          	jal	3218 <ee_isdigit>
    3574:	00050793          	mv	a5,a0
    3578:	02079e63          	bnez	a5,35b4 <core_state_transition+0x34c>
    357c:	00100793          	li	a5,1
    3580:	fef42423          	sw	a5,-24(s0)
    3584:	fd842783          	lw	a5,-40(s0)
    3588:	00478793          	add	a5,a5,4
    358c:	0007a703          	lw	a4,0(a5)
    3590:	00170713          	add	a4,a4,1
    3594:	00e7a023          	sw	a4,0(a5)
    3598:	01c0006f          	j	35b4 <core_state_transition+0x34c>
    359c:	00000013          	nop
    35a0:	0180006f          	j	35b8 <core_state_transition+0x350>
    35a4:	00000013          	nop
    35a8:	0100006f          	j	35b8 <core_state_transition+0x350>
    35ac:	00000013          	nop
    35b0:	0080006f          	j	35b8 <core_state_transition+0x350>
    35b4:	00000013          	nop
    35b8:	fec42783          	lw	a5,-20(s0)
    35bc:	00178793          	add	a5,a5,1
    35c0:	fef42623          	sw	a5,-20(s0)
    35c4:	fec42783          	lw	a5,-20(s0)
    35c8:	0007c783          	lbu	a5,0(a5)
    35cc:	00078863          	beqz	a5,35dc <core_state_transition+0x374>
    35d0:	fe842703          	lw	a4,-24(s0)
    35d4:	00100793          	li	a5,1
    35d8:	caf71ee3          	bne	a4,a5,3294 <core_state_transition+0x2c>
    35dc:	fdc42783          	lw	a5,-36(s0)
    35e0:	fec42703          	lw	a4,-20(s0)
    35e4:	00e7a023          	sw	a4,0(a5)
    35e8:	fe842783          	lw	a5,-24(s0)
    35ec:	00078513          	mv	a0,a5
    35f0:	02c12083          	lw	ra,44(sp)
    35f4:	02812403          	lw	s0,40(sp)
    35f8:	03010113          	add	sp,sp,48
    35fc:	00008067          	ret

00003600 <get_seed_32>:
    3600:	fd010113          	add	sp,sp,-48
    3604:	02812623          	sw	s0,44(sp)
    3608:	03010413          	add	s0,sp,48
    360c:	fca42e23          	sw	a0,-36(s0)
    3610:	fdc42703          	lw	a4,-36(s0)
    3614:	00500793          	li	a5,5
    3618:	06e7e263          	bltu	a5,a4,367c <get_seed_32+0x7c>
    361c:	fdc42783          	lw	a5,-36(s0)
    3620:	00279713          	sll	a4,a5,0x2
    3624:	59800793          	li	a5,1432
    3628:	00f707b3          	add	a5,a4,a5
    362c:	0007a783          	lw	a5,0(a5)
    3630:	00078067          	jr	a5
    3634:	000017b7          	lui	a5,0x1
    3638:	9347a783          	lw	a5,-1740(a5) # 934 <seed1_volatile>
    363c:	fef42623          	sw	a5,-20(s0)
    3640:	0440006f          	j	3684 <get_seed_32+0x84>
    3644:	000017b7          	lui	a5,0x1
    3648:	9387a783          	lw	a5,-1736(a5) # 938 <seed2_volatile>
    364c:	fef42623          	sw	a5,-20(s0)
    3650:	0340006f          	j	3684 <get_seed_32+0x84>
    3654:	5e802783          	lw	a5,1512(zero) # 5e8 <seed3_volatile>
    3658:	fef42623          	sw	a5,-20(s0)
    365c:	0280006f          	j	3684 <get_seed_32+0x84>
    3660:	5ec02783          	lw	a5,1516(zero) # 5ec <seed4_volatile>
    3664:	fef42623          	sw	a5,-20(s0)
    3668:	01c0006f          	j	3684 <get_seed_32+0x84>
    366c:	000017b7          	lui	a5,0x1
    3670:	93c7a783          	lw	a5,-1732(a5) # 93c <seed5_volatile>
    3674:	fef42623          	sw	a5,-20(s0)
    3678:	00c0006f          	j	3684 <get_seed_32+0x84>
    367c:	fe042623          	sw	zero,-20(s0)
    3680:	00000013          	nop
    3684:	fec42783          	lw	a5,-20(s0)
    3688:	00078513          	mv	a0,a5
    368c:	02c12403          	lw	s0,44(sp)
    3690:	03010113          	add	sp,sp,48
    3694:	00008067          	ret

00003698 <crcu8>:
    3698:	fd010113          	add	sp,sp,-48
    369c:	02812623          	sw	s0,44(sp)
    36a0:	03010413          	add	s0,sp,48
    36a4:	00050793          	mv	a5,a0
    36a8:	00058713          	mv	a4,a1
    36ac:	fcf40fa3          	sb	a5,-33(s0)
    36b0:	00070793          	mv	a5,a4
    36b4:	fcf41e23          	sh	a5,-36(s0)
    36b8:	fe0407a3          	sb	zero,-17(s0)
    36bc:	fe0406a3          	sb	zero,-19(s0)
    36c0:	fe040723          	sb	zero,-18(s0)
    36c4:	fe0407a3          	sb	zero,-17(s0)
    36c8:	0bc0006f          	j	3784 <crcu8+0xec>
    36cc:	fdc45783          	lhu	a5,-36(s0)
    36d0:	01879713          	sll	a4,a5,0x18
    36d4:	41875713          	sra	a4,a4,0x18
    36d8:	fdf40783          	lb	a5,-33(s0)
    36dc:	00f747b3          	xor	a5,a4,a5
    36e0:	01879793          	sll	a5,a5,0x18
    36e4:	4187d793          	sra	a5,a5,0x18
    36e8:	0ff7f793          	zext.b	a5,a5
    36ec:	0017f793          	and	a5,a5,1
    36f0:	fef406a3          	sb	a5,-19(s0)
    36f4:	fdf44783          	lbu	a5,-33(s0)
    36f8:	0017d793          	srl	a5,a5,0x1
    36fc:	fcf40fa3          	sb	a5,-33(s0)
    3700:	fed44703          	lbu	a4,-19(s0)
    3704:	00100793          	li	a5,1
    3708:	02f71463          	bne	a4,a5,3730 <crcu8+0x98>
    370c:	fdc45783          	lhu	a5,-36(s0)
    3710:	00078713          	mv	a4,a5
    3714:	000047b7          	lui	a5,0x4
    3718:	00278793          	add	a5,a5,2 # 4002 <ecvtbuf+0x2>
    371c:	00f747b3          	xor	a5,a4,a5
    3720:	fcf41e23          	sh	a5,-36(s0)
    3724:	00100793          	li	a5,1
    3728:	fef40723          	sb	a5,-18(s0)
    372c:	0080006f          	j	3734 <crcu8+0x9c>
    3730:	fe040723          	sb	zero,-18(s0)
    3734:	fdc45783          	lhu	a5,-36(s0)
    3738:	0017d793          	srl	a5,a5,0x1
    373c:	fcf41e23          	sh	a5,-36(s0)
    3740:	fee44783          	lbu	a5,-18(s0)
    3744:	00078e63          	beqz	a5,3760 <crcu8+0xc8>
    3748:	fdc45783          	lhu	a5,-36(s0)
    374c:	00078713          	mv	a4,a5
    3750:	ffff87b7          	lui	a5,0xffff8
    3754:	00f767b3          	or	a5,a4,a5
    3758:	fcf41e23          	sh	a5,-36(s0)
    375c:	01c0006f          	j	3778 <crcu8+0xe0>
    3760:	fdc45783          	lhu	a5,-36(s0)
    3764:	00078713          	mv	a4,a5
    3768:	000087b7          	lui	a5,0x8
    376c:	fff78793          	add	a5,a5,-1 # 7fff <__subdf3+0x40f>
    3770:	00f777b3          	and	a5,a4,a5
    3774:	fcf41e23          	sh	a5,-36(s0)
    3778:	fef44783          	lbu	a5,-17(s0)
    377c:	00178793          	add	a5,a5,1
    3780:	fef407a3          	sb	a5,-17(s0)
    3784:	fef44703          	lbu	a4,-17(s0)
    3788:	00700793          	li	a5,7
    378c:	f4e7f0e3          	bgeu	a5,a4,36cc <crcu8+0x34>
    3790:	fdc45783          	lhu	a5,-36(s0)
    3794:	00078513          	mv	a0,a5
    3798:	02c12403          	lw	s0,44(sp)
    379c:	03010113          	add	sp,sp,48
    37a0:	00008067          	ret

000037a4 <crcu16>:
    37a4:	fe010113          	add	sp,sp,-32
    37a8:	00112e23          	sw	ra,28(sp)
    37ac:	00812c23          	sw	s0,24(sp)
    37b0:	02010413          	add	s0,sp,32
    37b4:	00050793          	mv	a5,a0
    37b8:	00058713          	mv	a4,a1
    37bc:	fef41723          	sh	a5,-18(s0)
    37c0:	00070793          	mv	a5,a4
    37c4:	fef41623          	sh	a5,-20(s0)
    37c8:	fee45783          	lhu	a5,-18(s0)
    37cc:	0ff7f793          	zext.b	a5,a5
    37d0:	fec45703          	lhu	a4,-20(s0)
    37d4:	00070593          	mv	a1,a4
    37d8:	00078513          	mv	a0,a5
    37dc:	ebdff0ef          	jal	3698 <crcu8>
    37e0:	00050793          	mv	a5,a0
    37e4:	fef41623          	sh	a5,-20(s0)
    37e8:	fee45783          	lhu	a5,-18(s0)
    37ec:	0087d793          	srl	a5,a5,0x8
    37f0:	01079793          	sll	a5,a5,0x10
    37f4:	0107d793          	srl	a5,a5,0x10
    37f8:	0ff7f793          	zext.b	a5,a5
    37fc:	fec45703          	lhu	a4,-20(s0)
    3800:	00070593          	mv	a1,a4
    3804:	00078513          	mv	a0,a5
    3808:	e91ff0ef          	jal	3698 <crcu8>
    380c:	00050793          	mv	a5,a0
    3810:	fef41623          	sh	a5,-20(s0)
    3814:	fec45783          	lhu	a5,-20(s0)
    3818:	00078513          	mv	a0,a5
    381c:	01c12083          	lw	ra,28(sp)
    3820:	01812403          	lw	s0,24(sp)
    3824:	02010113          	add	sp,sp,32
    3828:	00008067          	ret

0000382c <crcu32>:
    382c:	fe010113          	add	sp,sp,-32
    3830:	00112e23          	sw	ra,28(sp)
    3834:	00812c23          	sw	s0,24(sp)
    3838:	02010413          	add	s0,sp,32
    383c:	fea42623          	sw	a0,-20(s0)
    3840:	00058793          	mv	a5,a1
    3844:	fef41523          	sh	a5,-22(s0)
    3848:	fec42783          	lw	a5,-20(s0)
    384c:	01079793          	sll	a5,a5,0x10
    3850:	4107d793          	sra	a5,a5,0x10
    3854:	fea45703          	lhu	a4,-22(s0)
    3858:	00070593          	mv	a1,a4
    385c:	00078513          	mv	a0,a5
    3860:	04c000ef          	jal	38ac <crc16>
    3864:	00050793          	mv	a5,a0
    3868:	fef41523          	sh	a5,-22(s0)
    386c:	fec42783          	lw	a5,-20(s0)
    3870:	0107d793          	srl	a5,a5,0x10
    3874:	01079793          	sll	a5,a5,0x10
    3878:	4107d793          	sra	a5,a5,0x10
    387c:	fea45703          	lhu	a4,-22(s0)
    3880:	00070593          	mv	a1,a4
    3884:	00078513          	mv	a0,a5
    3888:	024000ef          	jal	38ac <crc16>
    388c:	00050793          	mv	a5,a0
    3890:	fef41523          	sh	a5,-22(s0)
    3894:	fea45783          	lhu	a5,-22(s0)
    3898:	00078513          	mv	a0,a5
    389c:	01c12083          	lw	ra,28(sp)
    38a0:	01812403          	lw	s0,24(sp)
    38a4:	02010113          	add	sp,sp,32
    38a8:	00008067          	ret

000038ac <crc16>:
    38ac:	fe010113          	add	sp,sp,-32
    38b0:	00112e23          	sw	ra,28(sp)
    38b4:	00812c23          	sw	s0,24(sp)
    38b8:	02010413          	add	s0,sp,32
    38bc:	00050793          	mv	a5,a0
    38c0:	00058713          	mv	a4,a1
    38c4:	fef41723          	sh	a5,-18(s0)
    38c8:	00070793          	mv	a5,a4
    38cc:	fef41623          	sh	a5,-20(s0)
    38d0:	fee45783          	lhu	a5,-18(s0)
    38d4:	fec45703          	lhu	a4,-20(s0)
    38d8:	00070593          	mv	a1,a4
    38dc:	00078513          	mv	a0,a5
    38e0:	ec5ff0ef          	jal	37a4 <crcu16>
    38e4:	00050793          	mv	a5,a0
    38e8:	00078513          	mv	a0,a5
    38ec:	01c12083          	lw	ra,28(sp)
    38f0:	01812403          	lw	s0,24(sp)
    38f4:	02010113          	add	sp,sp,32
    38f8:	00008067          	ret

000038fc <check_data_types>:
    38fc:	fe010113          	add	sp,sp,-32
    3900:	00112e23          	sw	ra,28(sp)
    3904:	00812c23          	sw	s0,24(sp)
    3908:	02010413          	add	s0,sp,32
    390c:	fe0407a3          	sb	zero,-17(s0)
    3910:	fef44783          	lbu	a5,-17(s0)
    3914:	00078663          	beqz	a5,3920 <check_data_types+0x24>
    3918:	5b000513          	li	a0,1456
    391c:	180020ef          	jal	5a9c <ee_printf>
    3920:	fef44783          	lbu	a5,-17(s0)
    3924:	00078513          	mv	a0,a5
    3928:	01c12083          	lw	ra,28(sp)
    392c:	01812403          	lw	s0,24(sp)
    3930:	02010113          	add	sp,sp,32
    3934:	00008067          	ret

00003938 <barebones_clock>:
    3938:	fe010113          	add	sp,sp,-32
    393c:	00812e23          	sw	s0,28(sp)
    3940:	02010413          	add	s0,sp,32
    3944:	080007b7          	lui	a5,0x8000
    3948:	fef42623          	sw	a5,-20(s0)
    394c:	fec42783          	lw	a5,-20(s0)
    3950:	0007a783          	lw	a5,0(a5) # 8000000 <__subdf3+0x7ff8410>
    3954:	fef42423          	sw	a5,-24(s0)
    3958:	fe842783          	lw	a5,-24(s0)
    395c:	00078513          	mv	a0,a5
    3960:	01c12403          	lw	s0,28(sp)
    3964:	02010113          	add	sp,sp,32
    3968:	00008067          	ret

0000396c <start_time>:
    396c:	ff010113          	add	sp,sp,-16
    3970:	00112623          	sw	ra,12(sp)
    3974:	00812423          	sw	s0,8(sp)
    3978:	01010413          	add	s0,sp,16
    397c:	fbdff0ef          	jal	3938 <barebones_clock>
    3980:	00050713          	mv	a4,a0
    3984:	000017b7          	lui	a5,0x1
    3988:	8ce7ae23          	sw	a4,-1828(a5) # 8dc <start_time_val>
    398c:	00000013          	nop
    3990:	00c12083          	lw	ra,12(sp)
    3994:	00812403          	lw	s0,8(sp)
    3998:	01010113          	add	sp,sp,16
    399c:	00008067          	ret

000039a0 <stop_time>:
    39a0:	ff010113          	add	sp,sp,-16
    39a4:	00112623          	sw	ra,12(sp)
    39a8:	00812423          	sw	s0,8(sp)
    39ac:	01010413          	add	s0,sp,16
    39b0:	f89ff0ef          	jal	3938 <barebones_clock>
    39b4:	00050713          	mv	a4,a0
    39b8:	000017b7          	lui	a5,0x1
    39bc:	8ee7a023          	sw	a4,-1824(a5) # 8e0 <stop_time_val>
    39c0:	00000013          	nop
    39c4:	00c12083          	lw	ra,12(sp)
    39c8:	00812403          	lw	s0,8(sp)
    39cc:	01010113          	add	sp,sp,16
    39d0:	00008067          	ret

000039d4 <get_time>:
    39d4:	fe010113          	add	sp,sp,-32
    39d8:	00812e23          	sw	s0,28(sp)
    39dc:	02010413          	add	s0,sp,32
    39e0:	000017b7          	lui	a5,0x1
    39e4:	8e07a703          	lw	a4,-1824(a5) # 8e0 <stop_time_val>
    39e8:	000017b7          	lui	a5,0x1
    39ec:	8dc7a783          	lw	a5,-1828(a5) # 8dc <start_time_val>
    39f0:	40f707b3          	sub	a5,a4,a5
    39f4:	fef42623          	sw	a5,-20(s0)
    39f8:	fec42783          	lw	a5,-20(s0)
    39fc:	00078513          	mv	a0,a5
    3a00:	01c12403          	lw	s0,28(sp)
    3a04:	02010113          	add	sp,sp,32
    3a08:	00008067          	ret

00003a0c <time_in_secs>:
    3a0c:	fd010113          	add	sp,sp,-48
    3a10:	02112623          	sw	ra,44(sp)
    3a14:	02812423          	sw	s0,40(sp)
    3a18:	03010413          	add	s0,sp,48
    3a1c:	fca42e23          	sw	a0,-36(s0)
    3a20:	fdc42503          	lw	a0,-36(s0)
    3a24:	5bd030ef          	jal	77e0 <__floatunsidf>
    3a28:	00050713          	mv	a4,a0
    3a2c:	00058793          	mv	a5,a1
    3a30:	5f802603          	lw	a2,1528(zero) # 5f8 <default_num_contexts+0x8>
    3a34:	5fc02683          	lw	a3,1532(zero) # 5fc <default_num_contexts+0xc>
    3a38:	00070513          	mv	a0,a4
    3a3c:	00078593          	mv	a1,a5
    3a40:	1dd020ef          	jal	641c <__divdf3>
    3a44:	00050713          	mv	a4,a0
    3a48:	00058793          	mv	a5,a1
    3a4c:	fee42423          	sw	a4,-24(s0)
    3a50:	fef42623          	sw	a5,-20(s0)
    3a54:	fe842703          	lw	a4,-24(s0)
    3a58:	fec42783          	lw	a5,-20(s0)
    3a5c:	00070513          	mv	a0,a4
    3a60:	00078593          	mv	a1,a5
    3a64:	02c12083          	lw	ra,44(sp)
    3a68:	02812403          	lw	s0,40(sp)
    3a6c:	03010113          	add	sp,sp,48
    3a70:	00008067          	ret

00003a74 <portable_init>:
    3a74:	fd010113          	add	sp,sp,-48
    3a78:	02812623          	sw	s0,44(sp)
    3a7c:	03010413          	add	s0,sp,48
    3a80:	fca42e23          	sw	a0,-36(s0)
    3a84:	fcb42c23          	sw	a1,-40(s0)
    3a88:	fcc42a23          	sw	a2,-44(s0)
    3a8c:	060007b7          	lui	a5,0x6000
    3a90:	fef42623          	sw	a5,-20(s0)
    3a94:	fec42783          	lw	a5,-20(s0)
    3a98:	00c78793          	add	a5,a5,12 # 600000c <__subdf3+0x5ff841c>
    3a9c:	0001c737          	lui	a4,0x1c
    3aa0:	20070713          	add	a4,a4,512 # 1c200 <__subdf3+0x14610>
    3aa4:	00e7a023          	sw	a4,0(a5)
    3aa8:	fec42783          	lw	a5,-20(s0)
    3aac:	01078793          	add	a5,a5,16
    3ab0:	00100713          	li	a4,1
    3ab4:	00e7a023          	sw	a4,0(a5)
    3ab8:	fec42783          	lw	a5,-20(s0)
    3abc:	01478793          	add	a5,a5,20
    3ac0:	00100713          	li	a4,1
    3ac4:	00e7a023          	sw	a4,0(a5)
    3ac8:	fdc42783          	lw	a5,-36(s0)
    3acc:	00100713          	li	a4,1
    3ad0:	00e78023          	sb	a4,0(a5)
    3ad4:	00000013          	nop
    3ad8:	02c12403          	lw	s0,44(sp)
    3adc:	03010113          	add	sp,sp,48
    3ae0:	00008067          	ret

00003ae4 <portable_fini>:
    3ae4:	fe010113          	add	sp,sp,-32
    3ae8:	00812e23          	sw	s0,28(sp)
    3aec:	02010413          	add	s0,sp,32
    3af0:	fea42623          	sw	a0,-20(s0)
    3af4:	fec42783          	lw	a5,-20(s0)
    3af8:	00078023          	sb	zero,0(a5)
    3afc:	00000013          	nop
    3b00:	01c12403          	lw	s0,28(sp)
    3b04:	02010113          	add	sp,sp,32
    3b08:	00008067          	ret

00003b0c <cvt>:
    3b0c:	fb010113          	add	sp,sp,-80
    3b10:	04112623          	sw	ra,76(sp)
    3b14:	04812423          	sw	s0,72(sp)
    3b18:	05212223          	sw	s2,68(sp)
    3b1c:	05312023          	sw	s3,64(sp)
    3b20:	05010413          	add	s0,sp,80
    3b24:	fca42423          	sw	a0,-56(s0)
    3b28:	fcb42623          	sw	a1,-52(s0)
    3b2c:	fcc42223          	sw	a2,-60(s0)
    3b30:	fcd42023          	sw	a3,-64(s0)
    3b34:	fae42e23          	sw	a4,-68(s0)
    3b38:	faf42c23          	sw	a5,-72(s0)
    3b3c:	fb042a23          	sw	a6,-76(s0)
    3b40:	fc442783          	lw	a5,-60(s0)
    3b44:	0007d463          	bgez	a5,3b4c <cvt+0x40>
    3b48:	fc042223          	sw	zero,-60(s0)
    3b4c:	fc442703          	lw	a4,-60(s0)
    3b50:	04e00793          	li	a5,78
    3b54:	00e7d663          	bge	a5,a4,3b60 <cvt+0x54>
    3b58:	04e00793          	li	a5,78
    3b5c:	fcf42223          	sw	a5,-60(s0)
    3b60:	fe042623          	sw	zero,-20(s0)
    3b64:	fbc42783          	lw	a5,-68(s0)
    3b68:	0007a023          	sw	zero,0(a5)
    3b6c:	fb842783          	lw	a5,-72(s0)
    3b70:	fef42423          	sw	a5,-24(s0)
    3b74:	00000613          	li	a2,0
    3b78:	00000693          	li	a3,0
    3b7c:	fc842503          	lw	a0,-56(s0)
    3b80:	fcc42583          	lw	a1,-52(s0)
    3b84:	2cc030ef          	jal	6e50 <__ledf2>
    3b88:	00050793          	mv	a5,a0
    3b8c:	0207d463          	bgez	a5,3bb4 <cvt+0xa8>
    3b90:	fbc42783          	lw	a5,-68(s0)
    3b94:	00100713          	li	a4,1
    3b98:	00e7a023          	sw	a4,0(a5)
    3b9c:	fc842903          	lw	s2,-56(s0)
    3ba0:	fcc42703          	lw	a4,-52(s0)
    3ba4:	800007b7          	lui	a5,0x80000
    3ba8:	00f749b3          	xor	s3,a4,a5
    3bac:	fd242423          	sw	s2,-56(s0)
    3bb0:	fd342623          	sw	s3,-52(s0)
    3bb4:	fd840793          	add	a5,s0,-40
    3bb8:	00078613          	mv	a2,a5
    3bbc:	fc842503          	lw	a0,-56(s0)
    3bc0:	fcc42583          	lw	a1,-52(s0)
    3bc4:	635030ef          	jal	79f8 <modf>
    3bc8:	fca42423          	sw	a0,-56(s0)
    3bcc:	fcb42623          	sw	a1,-52(s0)
    3bd0:	fb842783          	lw	a5,-72(s0)
    3bd4:	05078793          	add	a5,a5,80 # 80000050 <__subdf3+0x7fff8460>
    3bd8:	fef42223          	sw	a5,-28(s0)
    3bdc:	fd842703          	lw	a4,-40(s0)
    3be0:	fdc42783          	lw	a5,-36(s0)
    3be4:	00000613          	li	a2,0
    3be8:	00000693          	li	a3,0
    3bec:	00070513          	mv	a0,a4
    3bf0:	00078593          	mv	a1,a5
    3bf4:	0d0030ef          	jal	6cc4 <__eqdf2>
    3bf8:	00050793          	mv	a5,a0
    3bfc:	12078a63          	beqz	a5,3d30 <cvt+0x224>
    3c00:	fb842783          	lw	a5,-72(s0)
    3c04:	05078793          	add	a5,a5,80
    3c08:	fef42223          	sw	a5,-28(s0)
    3c0c:	0c80006f          	j	3cd4 <cvt+0x1c8>
    3c10:	fd842703          	lw	a4,-40(s0)
    3c14:	fdc42783          	lw	a5,-36(s0)
    3c18:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3c1c:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3c20:	00070513          	mv	a0,a4
    3c24:	00078593          	mv	a1,a5
    3c28:	7f4020ef          	jal	641c <__divdf3>
    3c2c:	00050713          	mv	a4,a0
    3c30:	00058793          	mv	a5,a1
    3c34:	fd840693          	add	a3,s0,-40
    3c38:	00068613          	mv	a2,a3
    3c3c:	00070513          	mv	a0,a4
    3c40:	00078593          	mv	a1,a5
    3c44:	5b5030ef          	jal	79f8 <modf>
    3c48:	00050713          	mv	a4,a0
    3c4c:	00058793          	mv	a5,a1
    3c50:	fce42823          	sw	a4,-48(s0)
    3c54:	fcf42a23          	sw	a5,-44(s0)
    3c58:	fd042703          	lw	a4,-48(s0)
    3c5c:	fd442783          	lw	a5,-44(s0)
    3c60:	60802603          	lw	a2,1544(zero) # 608 <default_num_contexts+0x18>
    3c64:	60c02683          	lw	a3,1548(zero) # 60c <default_num_contexts+0x1c>
    3c68:	00070513          	mv	a0,a4
    3c6c:	00078593          	mv	a1,a5
    3c70:	6e5010ef          	jal	5b54 <__adddf3>
    3c74:	00050713          	mv	a4,a0
    3c78:	00058793          	mv	a5,a1
    3c7c:	00070513          	mv	a0,a4
    3c80:	00078593          	mv	a1,a5
    3c84:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3c88:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3c8c:	2cc030ef          	jal	6f58 <__muldf3>
    3c90:	00050713          	mv	a4,a0
    3c94:	00058793          	mv	a5,a1
    3c98:	00070513          	mv	a0,a4
    3c9c:	00078593          	mv	a1,a5
    3ca0:	249030ef          	jal	76e8 <__fixdfsi>
    3ca4:	00050793          	mv	a5,a0
    3ca8:	0ff7f793          	zext.b	a5,a5
    3cac:	fe442703          	lw	a4,-28(s0)
    3cb0:	fff70713          	add	a4,a4,-1
    3cb4:	fee42223          	sw	a4,-28(s0)
    3cb8:	03078793          	add	a5,a5,48
    3cbc:	0ff7f713          	zext.b	a4,a5
    3cc0:	fe442783          	lw	a5,-28(s0)
    3cc4:	00e78023          	sb	a4,0(a5)
    3cc8:	fec42783          	lw	a5,-20(s0)
    3ccc:	00178793          	add	a5,a5,1
    3cd0:	fef42623          	sw	a5,-20(s0)
    3cd4:	fd842703          	lw	a4,-40(s0)
    3cd8:	fdc42783          	lw	a5,-36(s0)
    3cdc:	00000613          	li	a2,0
    3ce0:	00000693          	li	a3,0
    3ce4:	00070513          	mv	a0,a4
    3ce8:	00078593          	mv	a1,a5
    3cec:	7d9020ef          	jal	6cc4 <__eqdf2>
    3cf0:	00050793          	mv	a5,a0
    3cf4:	f0079ee3          	bnez	a5,3c10 <cvt+0x104>
    3cf8:	0240006f          	j	3d1c <cvt+0x210>
    3cfc:	fe442703          	lw	a4,-28(s0)
    3d00:	00170793          	add	a5,a4,1
    3d04:	fef42223          	sw	a5,-28(s0)
    3d08:	fe842783          	lw	a5,-24(s0)
    3d0c:	00178693          	add	a3,a5,1
    3d10:	fed42423          	sw	a3,-24(s0)
    3d14:	00074703          	lbu	a4,0(a4)
    3d18:	00e78023          	sb	a4,0(a5)
    3d1c:	fb842783          	lw	a5,-72(s0)
    3d20:	05078793          	add	a5,a5,80
    3d24:	fe442703          	lw	a4,-28(s0)
    3d28:	fcf76ae3          	bltu	a4,a5,3cfc <cvt+0x1f0>
    3d2c:	0880006f          	j	3db4 <cvt+0x2a8>
    3d30:	00000613          	li	a2,0
    3d34:	00000693          	li	a3,0
    3d38:	fc842503          	lw	a0,-56(s0)
    3d3c:	fcc42583          	lw	a1,-52(s0)
    3d40:	010030ef          	jal	6d50 <__gedf2>
    3d44:	00050793          	mv	a5,a0
    3d48:	06f05663          	blez	a5,3db4 <cvt+0x2a8>
    3d4c:	0200006f          	j	3d6c <cvt+0x260>
    3d50:	fd042703          	lw	a4,-48(s0)
    3d54:	fd442783          	lw	a5,-44(s0)
    3d58:	fce42423          	sw	a4,-56(s0)
    3d5c:	fcf42623          	sw	a5,-52(s0)
    3d60:	fec42783          	lw	a5,-20(s0)
    3d64:	fff78793          	add	a5,a5,-1
    3d68:	fef42623          	sw	a5,-20(s0)
    3d6c:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3d70:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3d74:	fc842503          	lw	a0,-56(s0)
    3d78:	fcc42583          	lw	a1,-52(s0)
    3d7c:	1dc030ef          	jal	6f58 <__muldf3>
    3d80:	00050713          	mv	a4,a0
    3d84:	00058793          	mv	a5,a1
    3d88:	fce42823          	sw	a4,-48(s0)
    3d8c:	fcf42a23          	sw	a5,-44(s0)
    3d90:	fd042703          	lw	a4,-48(s0)
    3d94:	fd442783          	lw	a5,-44(s0)
    3d98:	61002603          	lw	a2,1552(zero) # 610 <default_num_contexts+0x20>
    3d9c:	61402683          	lw	a3,1556(zero) # 614 <default_num_contexts+0x24>
    3da0:	00070513          	mv	a0,a4
    3da4:	00078593          	mv	a1,a5
    3da8:	0a8030ef          	jal	6e50 <__ledf2>
    3dac:	00050793          	mv	a5,a0
    3db0:	fa07c0e3          	bltz	a5,3d50 <cvt+0x244>
    3db4:	fc442783          	lw	a5,-60(s0)
    3db8:	fb842703          	lw	a4,-72(s0)
    3dbc:	00f707b3          	add	a5,a4,a5
    3dc0:	fef42223          	sw	a5,-28(s0)
    3dc4:	fb442783          	lw	a5,-76(s0)
    3dc8:	00079a63          	bnez	a5,3ddc <cvt+0x2d0>
    3dcc:	fec42783          	lw	a5,-20(s0)
    3dd0:	fe442703          	lw	a4,-28(s0)
    3dd4:	00f707b3          	add	a5,a4,a5
    3dd8:	fef42223          	sw	a5,-28(s0)
    3ddc:	fc042783          	lw	a5,-64(s0)
    3de0:	fec42703          	lw	a4,-20(s0)
    3de4:	00e7a023          	sw	a4,0(a5)
    3de8:	fe442703          	lw	a4,-28(s0)
    3dec:	fb842783          	lw	a5,-72(s0)
    3df0:	08f77463          	bgeu	a4,a5,3e78 <cvt+0x36c>
    3df4:	fb842783          	lw	a5,-72(s0)
    3df8:	00078023          	sb	zero,0(a5)
    3dfc:	fb842783          	lw	a5,-72(s0)
    3e00:	1840006f          	j	3f84 <cvt+0x478>
    3e04:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3e08:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3e0c:	fc842503          	lw	a0,-56(s0)
    3e10:	fcc42583          	lw	a1,-52(s0)
    3e14:	144030ef          	jal	6f58 <__muldf3>
    3e18:	00050713          	mv	a4,a0
    3e1c:	00058793          	mv	a5,a1
    3e20:	fce42423          	sw	a4,-56(s0)
    3e24:	fcf42623          	sw	a5,-52(s0)
    3e28:	fd040793          	add	a5,s0,-48
    3e2c:	00078613          	mv	a2,a5
    3e30:	fc842503          	lw	a0,-56(s0)
    3e34:	fcc42583          	lw	a1,-52(s0)
    3e38:	3c1030ef          	jal	79f8 <modf>
    3e3c:	fca42423          	sw	a0,-56(s0)
    3e40:	fcb42623          	sw	a1,-52(s0)
    3e44:	fd042703          	lw	a4,-48(s0)
    3e48:	fd442783          	lw	a5,-44(s0)
    3e4c:	00070513          	mv	a0,a4
    3e50:	00078593          	mv	a1,a5
    3e54:	095030ef          	jal	76e8 <__fixdfsi>
    3e58:	00050793          	mv	a5,a0
    3e5c:	0ff7f713          	zext.b	a4,a5
    3e60:	fe842783          	lw	a5,-24(s0)
    3e64:	00178693          	add	a3,a5,1
    3e68:	fed42423          	sw	a3,-24(s0)
    3e6c:	03070713          	add	a4,a4,48
    3e70:	0ff77713          	zext.b	a4,a4
    3e74:	00e78023          	sb	a4,0(a5)
    3e78:	fe842703          	lw	a4,-24(s0)
    3e7c:	fe442783          	lw	a5,-28(s0)
    3e80:	00e7ea63          	bltu	a5,a4,3e94 <cvt+0x388>
    3e84:	fb842783          	lw	a5,-72(s0)
    3e88:	05078793          	add	a5,a5,80
    3e8c:	fe842703          	lw	a4,-24(s0)
    3e90:	f6f76ae3          	bltu	a4,a5,3e04 <cvt+0x2f8>
    3e94:	fb842783          	lw	a5,-72(s0)
    3e98:	05078793          	add	a5,a5,80
    3e9c:	fe442703          	lw	a4,-28(s0)
    3ea0:	00f76c63          	bltu	a4,a5,3eb8 <cvt+0x3ac>
    3ea4:	fb842783          	lw	a5,-72(s0)
    3ea8:	04f78793          	add	a5,a5,79
    3eac:	00078023          	sb	zero,0(a5)
    3eb0:	fb842783          	lw	a5,-72(s0)
    3eb4:	0d00006f          	j	3f84 <cvt+0x478>
    3eb8:	fe442783          	lw	a5,-28(s0)
    3ebc:	fef42423          	sw	a5,-24(s0)
    3ec0:	fe442783          	lw	a5,-28(s0)
    3ec4:	0007c783          	lbu	a5,0(a5)
    3ec8:	00578793          	add	a5,a5,5
    3ecc:	0ff7f713          	zext.b	a4,a5
    3ed0:	fe442783          	lw	a5,-28(s0)
    3ed4:	00e78023          	sb	a4,0(a5)
    3ed8:	0900006f          	j	3f68 <cvt+0x45c>
    3edc:	fe442783          	lw	a5,-28(s0)
    3ee0:	03000713          	li	a4,48
    3ee4:	00e78023          	sb	a4,0(a5)
    3ee8:	fe442703          	lw	a4,-28(s0)
    3eec:	fb842783          	lw	a5,-72(s0)
    3ef0:	02e7f663          	bgeu	a5,a4,3f1c <cvt+0x410>
    3ef4:	fe442783          	lw	a5,-28(s0)
    3ef8:	fff78793          	add	a5,a5,-1
    3efc:	fef42223          	sw	a5,-28(s0)
    3f00:	fe442783          	lw	a5,-28(s0)
    3f04:	0007c783          	lbu	a5,0(a5)
    3f08:	00178793          	add	a5,a5,1
    3f0c:	0ff7f713          	zext.b	a4,a5
    3f10:	fe442783          	lw	a5,-28(s0)
    3f14:	00e78023          	sb	a4,0(a5)
    3f18:	0500006f          	j	3f68 <cvt+0x45c>
    3f1c:	fe442783          	lw	a5,-28(s0)
    3f20:	03100713          	li	a4,49
    3f24:	00e78023          	sb	a4,0(a5)
    3f28:	fc042783          	lw	a5,-64(s0)
    3f2c:	0007a783          	lw	a5,0(a5)
    3f30:	00178713          	add	a4,a5,1
    3f34:	fc042783          	lw	a5,-64(s0)
    3f38:	00e7a023          	sw	a4,0(a5)
    3f3c:	fb442783          	lw	a5,-76(s0)
    3f40:	02079463          	bnez	a5,3f68 <cvt+0x45c>
    3f44:	fe842703          	lw	a4,-24(s0)
    3f48:	fb842783          	lw	a5,-72(s0)
    3f4c:	00e7f863          	bgeu	a5,a4,3f5c <cvt+0x450>
    3f50:	fe842783          	lw	a5,-24(s0)
    3f54:	03000713          	li	a4,48
    3f58:	00e78023          	sb	a4,0(a5)
    3f5c:	fe842783          	lw	a5,-24(s0)
    3f60:	00178793          	add	a5,a5,1
    3f64:	fef42423          	sw	a5,-24(s0)
    3f68:	fe442783          	lw	a5,-28(s0)
    3f6c:	0007c703          	lbu	a4,0(a5)
    3f70:	03900793          	li	a5,57
    3f74:	f6e7e4e3          	bltu	a5,a4,3edc <cvt+0x3d0>
    3f78:	fe842783          	lw	a5,-24(s0)
    3f7c:	00078023          	sb	zero,0(a5)
    3f80:	fb842783          	lw	a5,-72(s0)
    3f84:	00078513          	mv	a0,a5
    3f88:	04c12083          	lw	ra,76(sp)
    3f8c:	04812403          	lw	s0,72(sp)
    3f90:	04412903          	lw	s2,68(sp)
    3f94:	04012983          	lw	s3,64(sp)
    3f98:	05010113          	add	sp,sp,80
    3f9c:	00008067          	ret

00003fa0 <ecvt>:
    3fa0:	fd010113          	add	sp,sp,-48
    3fa4:	02112623          	sw	ra,44(sp)
    3fa8:	02812423          	sw	s0,40(sp)
    3fac:	03010413          	add	s0,sp,48
    3fb0:	fea42423          	sw	a0,-24(s0)
    3fb4:	feb42623          	sw	a1,-20(s0)
    3fb8:	fec42223          	sw	a2,-28(s0)
    3fbc:	fed42023          	sw	a3,-32(s0)
    3fc0:	fce42e23          	sw	a4,-36(s0)
    3fc4:	00100813          	li	a6,1
    3fc8:	000017b7          	lui	a5,0x1
    3fcc:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    3fd0:	fdc42703          	lw	a4,-36(s0)
    3fd4:	fe042683          	lw	a3,-32(s0)
    3fd8:	fe442603          	lw	a2,-28(s0)
    3fdc:	fe842503          	lw	a0,-24(s0)
    3fe0:	fec42583          	lw	a1,-20(s0)
    3fe4:	b29ff0ef          	jal	3b0c <cvt>
    3fe8:	00050793          	mv	a5,a0
    3fec:	00078513          	mv	a0,a5
    3ff0:	02c12083          	lw	ra,44(sp)
    3ff4:	02812403          	lw	s0,40(sp)
    3ff8:	03010113          	add	sp,sp,48
    3ffc:	00008067          	ret

00004000 <ecvtbuf>:
    4000:	fd010113          	add	sp,sp,-48
    4004:	02112623          	sw	ra,44(sp)
    4008:	02812423          	sw	s0,40(sp)
    400c:	03010413          	add	s0,sp,48
    4010:	fea42423          	sw	a0,-24(s0)
    4014:	feb42623          	sw	a1,-20(s0)
    4018:	fec42223          	sw	a2,-28(s0)
    401c:	fed42023          	sw	a3,-32(s0)
    4020:	fce42e23          	sw	a4,-36(s0)
    4024:	fcf42c23          	sw	a5,-40(s0)
    4028:	00100813          	li	a6,1
    402c:	fd842783          	lw	a5,-40(s0)
    4030:	fdc42703          	lw	a4,-36(s0)
    4034:	fe042683          	lw	a3,-32(s0)
    4038:	fe442603          	lw	a2,-28(s0)
    403c:	fe842503          	lw	a0,-24(s0)
    4040:	fec42583          	lw	a1,-20(s0)
    4044:	ac9ff0ef          	jal	3b0c <cvt>
    4048:	00050793          	mv	a5,a0
    404c:	00078513          	mv	a0,a5
    4050:	02c12083          	lw	ra,44(sp)
    4054:	02812403          	lw	s0,40(sp)
    4058:	03010113          	add	sp,sp,48
    405c:	00008067          	ret

00004060 <fcvt>:
    4060:	fd010113          	add	sp,sp,-48
    4064:	02112623          	sw	ra,44(sp)
    4068:	02812423          	sw	s0,40(sp)
    406c:	03010413          	add	s0,sp,48
    4070:	fea42423          	sw	a0,-24(s0)
    4074:	feb42623          	sw	a1,-20(s0)
    4078:	fec42223          	sw	a2,-28(s0)
    407c:	fed42023          	sw	a3,-32(s0)
    4080:	fce42e23          	sw	a4,-36(s0)
    4084:	00000813          	li	a6,0
    4088:	000017b7          	lui	a5,0x1
    408c:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    4090:	fdc42703          	lw	a4,-36(s0)
    4094:	fe042683          	lw	a3,-32(s0)
    4098:	fe442603          	lw	a2,-28(s0)
    409c:	fe842503          	lw	a0,-24(s0)
    40a0:	fec42583          	lw	a1,-20(s0)
    40a4:	a69ff0ef          	jal	3b0c <cvt>
    40a8:	00050793          	mv	a5,a0
    40ac:	00078513          	mv	a0,a5
    40b0:	02c12083          	lw	ra,44(sp)
    40b4:	02812403          	lw	s0,40(sp)
    40b8:	03010113          	add	sp,sp,48
    40bc:	00008067          	ret

000040c0 <fcvtbuf>:
    40c0:	fd010113          	add	sp,sp,-48
    40c4:	02112623          	sw	ra,44(sp)
    40c8:	02812423          	sw	s0,40(sp)
    40cc:	03010413          	add	s0,sp,48
    40d0:	fea42423          	sw	a0,-24(s0)
    40d4:	feb42623          	sw	a1,-20(s0)
    40d8:	fec42223          	sw	a2,-28(s0)
    40dc:	fed42023          	sw	a3,-32(s0)
    40e0:	fce42e23          	sw	a4,-36(s0)
    40e4:	fcf42c23          	sw	a5,-40(s0)
    40e8:	00000813          	li	a6,0
    40ec:	fd842783          	lw	a5,-40(s0)
    40f0:	fdc42703          	lw	a4,-36(s0)
    40f4:	fe042683          	lw	a3,-32(s0)
    40f8:	fe442603          	lw	a2,-28(s0)
    40fc:	fe842503          	lw	a0,-24(s0)
    4100:	fec42583          	lw	a1,-20(s0)
    4104:	a09ff0ef          	jal	3b0c <cvt>
    4108:	00050793          	mv	a5,a0
    410c:	00078513          	mv	a0,a5
    4110:	02c12083          	lw	ra,44(sp)
    4114:	02812403          	lw	s0,40(sp)
    4118:	03010113          	add	sp,sp,48
    411c:	00008067          	ret

00004120 <strnlen>:
    4120:	fd010113          	add	sp,sp,-48
    4124:	02812623          	sw	s0,44(sp)
    4128:	03010413          	add	s0,sp,48
    412c:	fca42e23          	sw	a0,-36(s0)
    4130:	fcb42c23          	sw	a1,-40(s0)
    4134:	fdc42783          	lw	a5,-36(s0)
    4138:	fef42623          	sw	a5,-20(s0)
    413c:	0100006f          	j	414c <strnlen+0x2c>
    4140:	fec42783          	lw	a5,-20(s0)
    4144:	00178793          	add	a5,a5,1
    4148:	fef42623          	sw	a5,-20(s0)
    414c:	fec42783          	lw	a5,-20(s0)
    4150:	0007c783          	lbu	a5,0(a5)
    4154:	00078a63          	beqz	a5,4168 <strnlen+0x48>
    4158:	fd842783          	lw	a5,-40(s0)
    415c:	fff78713          	add	a4,a5,-1
    4160:	fce42c23          	sw	a4,-40(s0)
    4164:	fc079ee3          	bnez	a5,4140 <strnlen+0x20>
    4168:	fec42703          	lw	a4,-20(s0)
    416c:	fdc42783          	lw	a5,-36(s0)
    4170:	40f707b3          	sub	a5,a4,a5
    4174:	00078513          	mv	a0,a5
    4178:	02c12403          	lw	s0,44(sp)
    417c:	03010113          	add	sp,sp,48
    4180:	00008067          	ret

00004184 <skip_atoi>:
    4184:	fd010113          	add	sp,sp,-48
    4188:	02812623          	sw	s0,44(sp)
    418c:	03010413          	add	s0,sp,48
    4190:	fca42e23          	sw	a0,-36(s0)
    4194:	fe042623          	sw	zero,-20(s0)
    4198:	0400006f          	j	41d8 <skip_atoi+0x54>
    419c:	fec42703          	lw	a4,-20(s0)
    41a0:	00070793          	mv	a5,a4
    41a4:	00279793          	sll	a5,a5,0x2
    41a8:	00e787b3          	add	a5,a5,a4
    41ac:	00179793          	sll	a5,a5,0x1
    41b0:	00078613          	mv	a2,a5
    41b4:	fdc42783          	lw	a5,-36(s0)
    41b8:	0007a783          	lw	a5,0(a5)
    41bc:	00178693          	add	a3,a5,1
    41c0:	fdc42703          	lw	a4,-36(s0)
    41c4:	00d72023          	sw	a3,0(a4)
    41c8:	0007c783          	lbu	a5,0(a5)
    41cc:	00f607b3          	add	a5,a2,a5
    41d0:	fd078793          	add	a5,a5,-48
    41d4:	fef42623          	sw	a5,-20(s0)
    41d8:	fdc42783          	lw	a5,-36(s0)
    41dc:	0007a783          	lw	a5,0(a5)
    41e0:	0007c703          	lbu	a4,0(a5)
    41e4:	02f00793          	li	a5,47
    41e8:	00e7fc63          	bgeu	a5,a4,4200 <skip_atoi+0x7c>
    41ec:	fdc42783          	lw	a5,-36(s0)
    41f0:	0007a783          	lw	a5,0(a5)
    41f4:	0007c703          	lbu	a4,0(a5)
    41f8:	03900793          	li	a5,57
    41fc:	fae7f0e3          	bgeu	a5,a4,419c <skip_atoi+0x18>
    4200:	fec42783          	lw	a5,-20(s0)
    4204:	00078513          	mv	a0,a5
    4208:	02c12403          	lw	s0,44(sp)
    420c:	03010113          	add	sp,sp,48
    4210:	00008067          	ret

00004214 <number>:
    4214:	f8010113          	add	sp,sp,-128
    4218:	06112e23          	sw	ra,124(sp)
    421c:	06812c23          	sw	s0,120(sp)
    4220:	08010413          	add	s0,sp,128
    4224:	f8a42e23          	sw	a0,-100(s0)
    4228:	f8b42c23          	sw	a1,-104(s0)
    422c:	f8c42a23          	sw	a2,-108(s0)
    4230:	f8d42823          	sw	a3,-112(s0)
    4234:	f8e42623          	sw	a4,-116(s0)
    4238:	f8f42423          	sw	a5,-120(s0)
    423c:	79402783          	lw	a5,1940(zero) # 794 <digits>
    4240:	fef42423          	sw	a5,-24(s0)
    4244:	f8842783          	lw	a5,-120(s0)
    4248:	0407f793          	and	a5,a5,64
    424c:	00078663          	beqz	a5,4258 <number+0x44>
    4250:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    4254:	fef42423          	sw	a5,-24(s0)
    4258:	f8842783          	lw	a5,-120(s0)
    425c:	0107f793          	and	a5,a5,16
    4260:	00078863          	beqz	a5,4270 <number+0x5c>
    4264:	f8842783          	lw	a5,-120(s0)
    4268:	ffe7f793          	and	a5,a5,-2
    426c:	f8f42423          	sw	a5,-120(s0)
    4270:	f9442703          	lw	a4,-108(s0)
    4274:	00100793          	li	a5,1
    4278:	00e7d863          	bge	a5,a4,4288 <number+0x74>
    427c:	f9442703          	lw	a4,-108(s0)
    4280:	02400793          	li	a5,36
    4284:	00e7d663          	bge	a5,a4,4290 <number+0x7c>
    4288:	00000793          	li	a5,0
    428c:	30c0006f          	j	4598 <number+0x384>
    4290:	f8842783          	lw	a5,-120(s0)
    4294:	0017f793          	and	a5,a5,1
    4298:	00078663          	beqz	a5,42a4 <number+0x90>
    429c:	03000793          	li	a5,48
    42a0:	0080006f          	j	42a8 <number+0x94>
    42a4:	02000793          	li	a5,32
    42a8:	fef401a3          	sb	a5,-29(s0)
    42ac:	fe0407a3          	sb	zero,-17(s0)
    42b0:	f8842783          	lw	a5,-120(s0)
    42b4:	0027f793          	and	a5,a5,2
    42b8:	06078a63          	beqz	a5,432c <number+0x118>
    42bc:	f9842783          	lw	a5,-104(s0)
    42c0:	0207d463          	bgez	a5,42e8 <number+0xd4>
    42c4:	02d00793          	li	a5,45
    42c8:	fef407a3          	sb	a5,-17(s0)
    42cc:	f9842783          	lw	a5,-104(s0)
    42d0:	40f007b3          	neg	a5,a5
    42d4:	f8f42c23          	sw	a5,-104(s0)
    42d8:	f9042783          	lw	a5,-112(s0)
    42dc:	fff78793          	add	a5,a5,-1
    42e0:	f8f42823          	sw	a5,-112(s0)
    42e4:	0480006f          	j	432c <number+0x118>
    42e8:	f8842783          	lw	a5,-120(s0)
    42ec:	0047f793          	and	a5,a5,4
    42f0:	00078e63          	beqz	a5,430c <number+0xf8>
    42f4:	02b00793          	li	a5,43
    42f8:	fef407a3          	sb	a5,-17(s0)
    42fc:	f9042783          	lw	a5,-112(s0)
    4300:	fff78793          	add	a5,a5,-1
    4304:	f8f42823          	sw	a5,-112(s0)
    4308:	0240006f          	j	432c <number+0x118>
    430c:	f8842783          	lw	a5,-120(s0)
    4310:	0087f793          	and	a5,a5,8
    4314:	00078c63          	beqz	a5,432c <number+0x118>
    4318:	02000793          	li	a5,32
    431c:	fef407a3          	sb	a5,-17(s0)
    4320:	f9042783          	lw	a5,-112(s0)
    4324:	fff78793          	add	a5,a5,-1
    4328:	f8f42823          	sw	a5,-112(s0)
    432c:	f8842783          	lw	a5,-120(s0)
    4330:	0207f793          	and	a5,a5,32
    4334:	02078c63          	beqz	a5,436c <number+0x158>
    4338:	f9442703          	lw	a4,-108(s0)
    433c:	01000793          	li	a5,16
    4340:	00f71a63          	bne	a4,a5,4354 <number+0x140>
    4344:	f9042783          	lw	a5,-112(s0)
    4348:	ffe78793          	add	a5,a5,-2
    434c:	f8f42823          	sw	a5,-112(s0)
    4350:	01c0006f          	j	436c <number+0x158>
    4354:	f9442703          	lw	a4,-108(s0)
    4358:	00800793          	li	a5,8
    435c:	00f71863          	bne	a4,a5,436c <number+0x158>
    4360:	f9042783          	lw	a5,-112(s0)
    4364:	fff78793          	add	a5,a5,-1
    4368:	f8f42823          	sw	a5,-112(s0)
    436c:	fe042223          	sw	zero,-28(s0)
    4370:	f9842783          	lw	a5,-104(s0)
    4374:	08079063          	bnez	a5,43f4 <number+0x1e0>
    4378:	fe442783          	lw	a5,-28(s0)
    437c:	00178713          	add	a4,a5,1
    4380:	fee42223          	sw	a4,-28(s0)
    4384:	ff078793          	add	a5,a5,-16
    4388:	008787b3          	add	a5,a5,s0
    438c:	03000713          	li	a4,48
    4390:	fae78823          	sb	a4,-80(a5)
    4394:	0680006f          	j	43fc <number+0x1e8>
    4398:	f9842783          	lw	a5,-104(s0)
    439c:	f9442703          	lw	a4,-108(s0)
    43a0:	00070593          	mv	a1,a4
    43a4:	00078513          	mv	a0,a5
    43a8:	570030ef          	jal	7918 <__umodsi3>
    43ac:	00050793          	mv	a5,a0
    43b0:	00078713          	mv	a4,a5
    43b4:	fe842783          	lw	a5,-24(s0)
    43b8:	00e78733          	add	a4,a5,a4
    43bc:	fe442783          	lw	a5,-28(s0)
    43c0:	00178693          	add	a3,a5,1
    43c4:	fed42223          	sw	a3,-28(s0)
    43c8:	00074703          	lbu	a4,0(a4)
    43cc:	ff078793          	add	a5,a5,-16
    43d0:	008787b3          	add	a5,a5,s0
    43d4:	fae78823          	sb	a4,-80(a5)
    43d8:	f9842783          	lw	a5,-104(s0)
    43dc:	f9442703          	lw	a4,-108(s0)
    43e0:	00070593          	mv	a1,a4
    43e4:	00078513          	mv	a0,a5
    43e8:	4e8030ef          	jal	78d0 <__hidden___udivsi3>
    43ec:	00050793          	mv	a5,a0
    43f0:	f8f42c23          	sw	a5,-104(s0)
    43f4:	f9842783          	lw	a5,-104(s0)
    43f8:	fa0790e3          	bnez	a5,4398 <number+0x184>
    43fc:	fe442703          	lw	a4,-28(s0)
    4400:	f8c42783          	lw	a5,-116(s0)
    4404:	00e7d663          	bge	a5,a4,4410 <number+0x1fc>
    4408:	fe442783          	lw	a5,-28(s0)
    440c:	f8f42623          	sw	a5,-116(s0)
    4410:	f9042703          	lw	a4,-112(s0)
    4414:	f8c42783          	lw	a5,-116(s0)
    4418:	40f707b3          	sub	a5,a4,a5
    441c:	f8f42823          	sw	a5,-112(s0)
    4420:	f8842783          	lw	a5,-120(s0)
    4424:	0117f793          	and	a5,a5,17
    4428:	02079663          	bnez	a5,4454 <number+0x240>
    442c:	0180006f          	j	4444 <number+0x230>
    4430:	f9c42783          	lw	a5,-100(s0)
    4434:	00178713          	add	a4,a5,1
    4438:	f8e42e23          	sw	a4,-100(s0)
    443c:	02000713          	li	a4,32
    4440:	00e78023          	sb	a4,0(a5)
    4444:	f9042783          	lw	a5,-112(s0)
    4448:	fff78713          	add	a4,a5,-1
    444c:	f8e42823          	sw	a4,-112(s0)
    4450:	fef040e3          	bgtz	a5,4430 <number+0x21c>
    4454:	fef44783          	lbu	a5,-17(s0)
    4458:	00078c63          	beqz	a5,4470 <number+0x25c>
    445c:	f9c42783          	lw	a5,-100(s0)
    4460:	00178713          	add	a4,a5,1
    4464:	f8e42e23          	sw	a4,-100(s0)
    4468:	fef44703          	lbu	a4,-17(s0)
    446c:	00e78023          	sb	a4,0(a5)
    4470:	f8842783          	lw	a5,-120(s0)
    4474:	0207f793          	and	a5,a5,32
    4478:	06078063          	beqz	a5,44d8 <number+0x2c4>
    447c:	f9442703          	lw	a4,-108(s0)
    4480:	00800793          	li	a5,8
    4484:	00f71e63          	bne	a4,a5,44a0 <number+0x28c>
    4488:	f9c42783          	lw	a5,-100(s0)
    448c:	00178713          	add	a4,a5,1
    4490:	f8e42e23          	sw	a4,-100(s0)
    4494:	03000713          	li	a4,48
    4498:	00e78023          	sb	a4,0(a5)
    449c:	03c0006f          	j	44d8 <number+0x2c4>
    44a0:	f9442703          	lw	a4,-108(s0)
    44a4:	01000793          	li	a5,16
    44a8:	02f71863          	bne	a4,a5,44d8 <number+0x2c4>
    44ac:	f9c42783          	lw	a5,-100(s0)
    44b0:	00178713          	add	a4,a5,1
    44b4:	f8e42e23          	sw	a4,-100(s0)
    44b8:	03000713          	li	a4,48
    44bc:	00e78023          	sb	a4,0(a5)
    44c0:	79402703          	lw	a4,1940(zero) # 794 <digits>
    44c4:	f9c42783          	lw	a5,-100(s0)
    44c8:	00178693          	add	a3,a5,1
    44cc:	f8d42e23          	sw	a3,-100(s0)
    44d0:	02174703          	lbu	a4,33(a4)
    44d4:	00e78023          	sb	a4,0(a5)
    44d8:	f8842783          	lw	a5,-120(s0)
    44dc:	0107f793          	and	a5,a5,16
    44e0:	04079263          	bnez	a5,4524 <number+0x310>
    44e4:	0180006f          	j	44fc <number+0x2e8>
    44e8:	f9c42783          	lw	a5,-100(s0)
    44ec:	00178713          	add	a4,a5,1
    44f0:	f8e42e23          	sw	a4,-100(s0)
    44f4:	fe344703          	lbu	a4,-29(s0)
    44f8:	00e78023          	sb	a4,0(a5)
    44fc:	f9042783          	lw	a5,-112(s0)
    4500:	fff78713          	add	a4,a5,-1
    4504:	f8e42823          	sw	a4,-112(s0)
    4508:	fef040e3          	bgtz	a5,44e8 <number+0x2d4>
    450c:	0180006f          	j	4524 <number+0x310>
    4510:	f9c42783          	lw	a5,-100(s0)
    4514:	00178713          	add	a4,a5,1
    4518:	f8e42e23          	sw	a4,-100(s0)
    451c:	03000713          	li	a4,48
    4520:	00e78023          	sb	a4,0(a5)
    4524:	f8c42783          	lw	a5,-116(s0)
    4528:	fff78713          	add	a4,a5,-1
    452c:	f8e42623          	sw	a4,-116(s0)
    4530:	fe442703          	lw	a4,-28(s0)
    4534:	fcf74ee3          	blt	a4,a5,4510 <number+0x2fc>
    4538:	0240006f          	j	455c <number+0x348>
    453c:	f9c42783          	lw	a5,-100(s0)
    4540:	00178713          	add	a4,a5,1
    4544:	f8e42e23          	sw	a4,-100(s0)
    4548:	fe442703          	lw	a4,-28(s0)
    454c:	ff070713          	add	a4,a4,-16
    4550:	00870733          	add	a4,a4,s0
    4554:	fb074703          	lbu	a4,-80(a4)
    4558:	00e78023          	sb	a4,0(a5)
    455c:	fe442783          	lw	a5,-28(s0)
    4560:	fff78713          	add	a4,a5,-1
    4564:	fee42223          	sw	a4,-28(s0)
    4568:	fcf04ae3          	bgtz	a5,453c <number+0x328>
    456c:	0180006f          	j	4584 <number+0x370>
    4570:	f9c42783          	lw	a5,-100(s0)
    4574:	00178713          	add	a4,a5,1
    4578:	f8e42e23          	sw	a4,-100(s0)
    457c:	02000713          	li	a4,32
    4580:	00e78023          	sb	a4,0(a5)
    4584:	f9042783          	lw	a5,-112(s0)
    4588:	fff78713          	add	a4,a5,-1
    458c:	f8e42823          	sw	a4,-112(s0)
    4590:	fef040e3          	bgtz	a5,4570 <number+0x35c>
    4594:	f9c42783          	lw	a5,-100(s0)
    4598:	00078513          	mv	a0,a5
    459c:	07c12083          	lw	ra,124(sp)
    45a0:	07812403          	lw	s0,120(sp)
    45a4:	08010113          	add	sp,sp,128
    45a8:	00008067          	ret

000045ac <eaddr>:
    45ac:	fa010113          	add	sp,sp,-96
    45b0:	04812e23          	sw	s0,92(sp)
    45b4:	06010413          	add	s0,sp,96
    45b8:	faa42e23          	sw	a0,-68(s0)
    45bc:	fab42c23          	sw	a1,-72(s0)
    45c0:	fac42a23          	sw	a2,-76(s0)
    45c4:	fad42823          	sw	a3,-80(s0)
    45c8:	fae42623          	sw	a4,-84(s0)
    45cc:	79402783          	lw	a5,1940(zero) # 794 <digits>
    45d0:	fef42623          	sw	a5,-20(s0)
    45d4:	fac42783          	lw	a5,-84(s0)
    45d8:	0407f793          	and	a5,a5,64
    45dc:	00078663          	beqz	a5,45e8 <eaddr+0x3c>
    45e0:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    45e4:	fef42623          	sw	a5,-20(s0)
    45e8:	fe042223          	sw	zero,-28(s0)
    45ec:	fe042423          	sw	zero,-24(s0)
    45f0:	0ac0006f          	j	469c <eaddr+0xf0>
    45f4:	fe842783          	lw	a5,-24(s0)
    45f8:	02078063          	beqz	a5,4618 <eaddr+0x6c>
    45fc:	fe442783          	lw	a5,-28(s0)
    4600:	00178713          	add	a4,a5,1
    4604:	fee42223          	sw	a4,-28(s0)
    4608:	ff078793          	add	a5,a5,-16
    460c:	008787b3          	add	a5,a5,s0
    4610:	03a00713          	li	a4,58
    4614:	fce78e23          	sb	a4,-36(a5)
    4618:	fe842783          	lw	a5,-24(s0)
    461c:	fb842703          	lw	a4,-72(s0)
    4620:	00f707b3          	add	a5,a4,a5
    4624:	0007c783          	lbu	a5,0(a5)
    4628:	0047d793          	srl	a5,a5,0x4
    462c:	0ff7f793          	zext.b	a5,a5
    4630:	00078713          	mv	a4,a5
    4634:	fec42783          	lw	a5,-20(s0)
    4638:	00e78733          	add	a4,a5,a4
    463c:	fe442783          	lw	a5,-28(s0)
    4640:	00178693          	add	a3,a5,1
    4644:	fed42223          	sw	a3,-28(s0)
    4648:	00074703          	lbu	a4,0(a4)
    464c:	ff078793          	add	a5,a5,-16
    4650:	008787b3          	add	a5,a5,s0
    4654:	fce78e23          	sb	a4,-36(a5)
    4658:	fe842783          	lw	a5,-24(s0)
    465c:	fb842703          	lw	a4,-72(s0)
    4660:	00f707b3          	add	a5,a4,a5
    4664:	0007c783          	lbu	a5,0(a5)
    4668:	00f7f793          	and	a5,a5,15
    466c:	fec42703          	lw	a4,-20(s0)
    4670:	00f70733          	add	a4,a4,a5
    4674:	fe442783          	lw	a5,-28(s0)
    4678:	00178693          	add	a3,a5,1
    467c:	fed42223          	sw	a3,-28(s0)
    4680:	00074703          	lbu	a4,0(a4)
    4684:	ff078793          	add	a5,a5,-16
    4688:	008787b3          	add	a5,a5,s0
    468c:	fce78e23          	sb	a4,-36(a5)
    4690:	fe842783          	lw	a5,-24(s0)
    4694:	00178793          	add	a5,a5,1
    4698:	fef42423          	sw	a5,-24(s0)
    469c:	fe842703          	lw	a4,-24(s0)
    46a0:	00500793          	li	a5,5
    46a4:	f4e7d8e3          	bge	a5,a4,45f4 <eaddr+0x48>
    46a8:	fac42783          	lw	a5,-84(s0)
    46ac:	0107f793          	and	a5,a5,16
    46b0:	02079863          	bnez	a5,46e0 <eaddr+0x134>
    46b4:	0180006f          	j	46cc <eaddr+0x120>
    46b8:	fbc42783          	lw	a5,-68(s0)
    46bc:	00178713          	add	a4,a5,1
    46c0:	fae42e23          	sw	a4,-68(s0)
    46c4:	02000713          	li	a4,32
    46c8:	00e78023          	sb	a4,0(a5)
    46cc:	fb442783          	lw	a5,-76(s0)
    46d0:	fff78713          	add	a4,a5,-1
    46d4:	fae42a23          	sw	a4,-76(s0)
    46d8:	fe442703          	lw	a4,-28(s0)
    46dc:	fcf74ee3          	blt	a4,a5,46b8 <eaddr+0x10c>
    46e0:	fe042423          	sw	zero,-24(s0)
    46e4:	0300006f          	j	4714 <eaddr+0x168>
    46e8:	fbc42783          	lw	a5,-68(s0)
    46ec:	00178713          	add	a4,a5,1
    46f0:	fae42e23          	sw	a4,-68(s0)
    46f4:	fe842703          	lw	a4,-24(s0)
    46f8:	ff070713          	add	a4,a4,-16
    46fc:	00870733          	add	a4,a4,s0
    4700:	fdc74703          	lbu	a4,-36(a4)
    4704:	00e78023          	sb	a4,0(a5)
    4708:	fe842783          	lw	a5,-24(s0)
    470c:	00178793          	add	a5,a5,1
    4710:	fef42423          	sw	a5,-24(s0)
    4714:	fe842703          	lw	a4,-24(s0)
    4718:	fe442783          	lw	a5,-28(s0)
    471c:	fcf746e3          	blt	a4,a5,46e8 <eaddr+0x13c>
    4720:	0180006f          	j	4738 <eaddr+0x18c>
    4724:	fbc42783          	lw	a5,-68(s0)
    4728:	00178713          	add	a4,a5,1
    472c:	fae42e23          	sw	a4,-68(s0)
    4730:	02000713          	li	a4,32
    4734:	00e78023          	sb	a4,0(a5)
    4738:	fb442783          	lw	a5,-76(s0)
    473c:	fff78713          	add	a4,a5,-1
    4740:	fae42a23          	sw	a4,-76(s0)
    4744:	fe442703          	lw	a4,-28(s0)
    4748:	fcf74ee3          	blt	a4,a5,4724 <eaddr+0x178>
    474c:	fbc42783          	lw	a5,-68(s0)
    4750:	00078513          	mv	a0,a5
    4754:	05c12403          	lw	s0,92(sp)
    4758:	06010113          	add	sp,sp,96
    475c:	00008067          	ret

00004760 <iaddr>:
    4760:	fa010113          	add	sp,sp,-96
    4764:	04112e23          	sw	ra,92(sp)
    4768:	04812c23          	sw	s0,88(sp)
    476c:	04912a23          	sw	s1,84(sp)
    4770:	06010413          	add	s0,sp,96
    4774:	faa42e23          	sw	a0,-68(s0)
    4778:	fab42c23          	sw	a1,-72(s0)
    477c:	fac42a23          	sw	a2,-76(s0)
    4780:	fad42823          	sw	a3,-80(s0)
    4784:	fae42623          	sw	a4,-84(s0)
    4788:	fe042223          	sw	zero,-28(s0)
    478c:	fe042623          	sw	zero,-20(s0)
    4790:	1a80006f          	j	4938 <iaddr+0x1d8>
    4794:	fec42783          	lw	a5,-20(s0)
    4798:	02078063          	beqz	a5,47b8 <iaddr+0x58>
    479c:	fe442783          	lw	a5,-28(s0)
    47a0:	00178713          	add	a4,a5,1
    47a4:	fee42223          	sw	a4,-28(s0)
    47a8:	ff078793          	add	a5,a5,-16
    47ac:	008787b3          	add	a5,a5,s0
    47b0:	02e00713          	li	a4,46
    47b4:	fce78e23          	sb	a4,-36(a5)
    47b8:	fec42783          	lw	a5,-20(s0)
    47bc:	fb842703          	lw	a4,-72(s0)
    47c0:	00f707b3          	add	a5,a4,a5
    47c4:	0007c783          	lbu	a5,0(a5)
    47c8:	fef42423          	sw	a5,-24(s0)
    47cc:	fe842783          	lw	a5,-24(s0)
    47d0:	02079463          	bnez	a5,47f8 <iaddr+0x98>
    47d4:	79402703          	lw	a4,1940(zero) # 794 <digits>
    47d8:	fe442783          	lw	a5,-28(s0)
    47dc:	00178693          	add	a3,a5,1
    47e0:	fed42223          	sw	a3,-28(s0)
    47e4:	00074703          	lbu	a4,0(a4)
    47e8:	ff078793          	add	a5,a5,-16
    47ec:	008787b3          	add	a5,a5,s0
    47f0:	fce78e23          	sb	a4,-36(a5)
    47f4:	1380006f          	j	492c <iaddr+0x1cc>
    47f8:	fe842703          	lw	a4,-24(s0)
    47fc:	06300793          	li	a5,99
    4800:	0ae7d463          	bge	a5,a4,48a8 <iaddr+0x148>
    4804:	79402483          	lw	s1,1940(zero) # 794 <digits>
    4808:	fe842783          	lw	a5,-24(s0)
    480c:	06400593          	li	a1,100
    4810:	00078513          	mv	a0,a5
    4814:	0b4030ef          	jal	78c8 <__divsi3>
    4818:	00050793          	mv	a5,a0
    481c:	00f48733          	add	a4,s1,a5
    4820:	fe442783          	lw	a5,-28(s0)
    4824:	00178693          	add	a3,a5,1
    4828:	fed42223          	sw	a3,-28(s0)
    482c:	00074703          	lbu	a4,0(a4)
    4830:	ff078793          	add	a5,a5,-16
    4834:	008787b3          	add	a5,a5,s0
    4838:	fce78e23          	sb	a4,-36(a5)
    483c:	fe842783          	lw	a5,-24(s0)
    4840:	06400593          	li	a1,100
    4844:	00078513          	mv	a0,a5
    4848:	104030ef          	jal	794c <__modsi3>
    484c:	00050793          	mv	a5,a0
    4850:	fef42423          	sw	a5,-24(s0)
    4854:	79402483          	lw	s1,1940(zero) # 794 <digits>
    4858:	fe842783          	lw	a5,-24(s0)
    485c:	00a00593          	li	a1,10
    4860:	00078513          	mv	a0,a5
    4864:	064030ef          	jal	78c8 <__divsi3>
    4868:	00050793          	mv	a5,a0
    486c:	00f48733          	add	a4,s1,a5
    4870:	fe442783          	lw	a5,-28(s0)
    4874:	00178693          	add	a3,a5,1
    4878:	fed42223          	sw	a3,-28(s0)
    487c:	00074703          	lbu	a4,0(a4)
    4880:	ff078793          	add	a5,a5,-16
    4884:	008787b3          	add	a5,a5,s0
    4888:	fce78e23          	sb	a4,-36(a5)
    488c:	fe842783          	lw	a5,-24(s0)
    4890:	00a00593          	li	a1,10
    4894:	00078513          	mv	a0,a5
    4898:	0b4030ef          	jal	794c <__modsi3>
    489c:	00050793          	mv	a5,a0
    48a0:	fef42423          	sw	a5,-24(s0)
    48a4:	0600006f          	j	4904 <iaddr+0x1a4>
    48a8:	fe842703          	lw	a4,-24(s0)
    48ac:	00900793          	li	a5,9
    48b0:	04e7da63          	bge	a5,a4,4904 <iaddr+0x1a4>
    48b4:	79402483          	lw	s1,1940(zero) # 794 <digits>
    48b8:	fe842783          	lw	a5,-24(s0)
    48bc:	00a00593          	li	a1,10
    48c0:	00078513          	mv	a0,a5
    48c4:	004030ef          	jal	78c8 <__divsi3>
    48c8:	00050793          	mv	a5,a0
    48cc:	00f48733          	add	a4,s1,a5
    48d0:	fe442783          	lw	a5,-28(s0)
    48d4:	00178693          	add	a3,a5,1
    48d8:	fed42223          	sw	a3,-28(s0)
    48dc:	00074703          	lbu	a4,0(a4)
    48e0:	ff078793          	add	a5,a5,-16
    48e4:	008787b3          	add	a5,a5,s0
    48e8:	fce78e23          	sb	a4,-36(a5)
    48ec:	fe842783          	lw	a5,-24(s0)
    48f0:	00a00593          	li	a1,10
    48f4:	00078513          	mv	a0,a5
    48f8:	054030ef          	jal	794c <__modsi3>
    48fc:	00050793          	mv	a5,a0
    4900:	fef42423          	sw	a5,-24(s0)
    4904:	79402703          	lw	a4,1940(zero) # 794 <digits>
    4908:	fe842783          	lw	a5,-24(s0)
    490c:	00f70733          	add	a4,a4,a5
    4910:	fe442783          	lw	a5,-28(s0)
    4914:	00178693          	add	a3,a5,1
    4918:	fed42223          	sw	a3,-28(s0)
    491c:	00074703          	lbu	a4,0(a4)
    4920:	ff078793          	add	a5,a5,-16
    4924:	008787b3          	add	a5,a5,s0
    4928:	fce78e23          	sb	a4,-36(a5)
    492c:	fec42783          	lw	a5,-20(s0)
    4930:	00178793          	add	a5,a5,1
    4934:	fef42623          	sw	a5,-20(s0)
    4938:	fec42703          	lw	a4,-20(s0)
    493c:	00300793          	li	a5,3
    4940:	e4e7dae3          	bge	a5,a4,4794 <iaddr+0x34>
    4944:	fac42783          	lw	a5,-84(s0)
    4948:	0107f793          	and	a5,a5,16
    494c:	02079863          	bnez	a5,497c <iaddr+0x21c>
    4950:	0180006f          	j	4968 <iaddr+0x208>
    4954:	fbc42783          	lw	a5,-68(s0)
    4958:	00178713          	add	a4,a5,1
    495c:	fae42e23          	sw	a4,-68(s0)
    4960:	02000713          	li	a4,32
    4964:	00e78023          	sb	a4,0(a5)
    4968:	fb442783          	lw	a5,-76(s0)
    496c:	fff78713          	add	a4,a5,-1
    4970:	fae42a23          	sw	a4,-76(s0)
    4974:	fe442703          	lw	a4,-28(s0)
    4978:	fcf74ee3          	blt	a4,a5,4954 <iaddr+0x1f4>
    497c:	fe042623          	sw	zero,-20(s0)
    4980:	0300006f          	j	49b0 <iaddr+0x250>
    4984:	fbc42783          	lw	a5,-68(s0)
    4988:	00178713          	add	a4,a5,1
    498c:	fae42e23          	sw	a4,-68(s0)
    4990:	fec42703          	lw	a4,-20(s0)
    4994:	ff070713          	add	a4,a4,-16
    4998:	00870733          	add	a4,a4,s0
    499c:	fdc74703          	lbu	a4,-36(a4)
    49a0:	00e78023          	sb	a4,0(a5)
    49a4:	fec42783          	lw	a5,-20(s0)
    49a8:	00178793          	add	a5,a5,1
    49ac:	fef42623          	sw	a5,-20(s0)
    49b0:	fec42703          	lw	a4,-20(s0)
    49b4:	fe442783          	lw	a5,-28(s0)
    49b8:	fcf746e3          	blt	a4,a5,4984 <iaddr+0x224>
    49bc:	0180006f          	j	49d4 <iaddr+0x274>
    49c0:	fbc42783          	lw	a5,-68(s0)
    49c4:	00178713          	add	a4,a5,1
    49c8:	fae42e23          	sw	a4,-68(s0)
    49cc:	02000713          	li	a4,32
    49d0:	00e78023          	sb	a4,0(a5)
    49d4:	fb442783          	lw	a5,-76(s0)
    49d8:	fff78713          	add	a4,a5,-1
    49dc:	fae42a23          	sw	a4,-76(s0)
    49e0:	fe442703          	lw	a4,-28(s0)
    49e4:	fcf74ee3          	blt	a4,a5,49c0 <iaddr+0x260>
    49e8:	fbc42783          	lw	a5,-68(s0)
    49ec:	00078513          	mv	a0,a5
    49f0:	05c12083          	lw	ra,92(sp)
    49f4:	05812403          	lw	s0,88(sp)
    49f8:	05412483          	lw	s1,84(sp)
    49fc:	06010113          	add	sp,sp,96
    4a00:	00008067          	ret

00004a04 <ee_bufcpy>:
    4a04:	fd010113          	add	sp,sp,-48
    4a08:	02812623          	sw	s0,44(sp)
    4a0c:	03010413          	add	s0,sp,48
    4a10:	fca42e23          	sw	a0,-36(s0)
    4a14:	fcb42c23          	sw	a1,-40(s0)
    4a18:	fcc42a23          	sw	a2,-44(s0)
    4a1c:	fd442783          	lw	a5,-44(s0)
    4a20:	fd842703          	lw	a4,-40(s0)
    4a24:	00f707b3          	add	a5,a4,a5
    4a28:	fef42623          	sw	a5,-20(s0)
    4a2c:	0240006f          	j	4a50 <ee_bufcpy+0x4c>
    4a30:	fd842703          	lw	a4,-40(s0)
    4a34:	00170793          	add	a5,a4,1
    4a38:	fcf42c23          	sw	a5,-40(s0)
    4a3c:	fdc42783          	lw	a5,-36(s0)
    4a40:	00178693          	add	a3,a5,1
    4a44:	fcd42e23          	sw	a3,-36(s0)
    4a48:	00074703          	lbu	a4,0(a4)
    4a4c:	00e78023          	sb	a4,0(a5)
    4a50:	fd842703          	lw	a4,-40(s0)
    4a54:	fec42783          	lw	a5,-20(s0)
    4a58:	fcf71ce3          	bne	a4,a5,4a30 <ee_bufcpy+0x2c>
    4a5c:	00000013          	nop
    4a60:	00000013          	nop
    4a64:	02c12403          	lw	s0,44(sp)
    4a68:	03010113          	add	sp,sp,48
    4a6c:	00008067          	ret

00004a70 <parse_float>:
    4a70:	f6010113          	add	sp,sp,-160
    4a74:	08112e23          	sw	ra,156(sp)
    4a78:	08812c23          	sw	s0,152(sp)
    4a7c:	0a010413          	add	s0,sp,160
    4a80:	f6a42c23          	sw	a0,-136(s0)
    4a84:	f6b42e23          	sw	a1,-132(s0)
    4a88:	f6c42a23          	sw	a2,-140(s0)
    4a8c:	00068793          	mv	a5,a3
    4a90:	f6e42623          	sw	a4,-148(s0)
    4a94:	f6f409a3          	sb	a5,-141(s0)
    4a98:	fe042223          	sw	zero,-28(s0)
    4a9c:	fe042023          	sw	zero,-32(s0)
    4aa0:	f7344703          	lbu	a4,-141(s0)
    4aa4:	04700793          	li	a5,71
    4aa8:	00f70863          	beq	a4,a5,4ab8 <parse_float+0x48>
    4aac:	f7344703          	lbu	a4,-141(s0)
    4ab0:	04500793          	li	a5,69
    4ab4:	00f71c63          	bne	a4,a5,4acc <parse_float+0x5c>
    4ab8:	00100793          	li	a5,1
    4abc:	fef42023          	sw	a5,-32(s0)
    4ac0:	f7344783          	lbu	a5,-141(s0)
    4ac4:	02078793          	add	a5,a5,32
    4ac8:	f6f409a3          	sb	a5,-141(s0)
    4acc:	f7344703          	lbu	a4,-141(s0)
    4ad0:	06700793          	li	a5,103
    4ad4:	06f71c63          	bne	a4,a5,4b4c <parse_float+0xdc>
    4ad8:	f8440793          	add	a5,s0,-124
    4adc:	fd440713          	add	a4,s0,-44
    4ae0:	fd840693          	add	a3,s0,-40
    4ae4:	f6c42603          	lw	a2,-148(s0)
    4ae8:	f7842503          	lw	a0,-136(s0)
    4aec:	f7c42583          	lw	a1,-132(s0)
    4af0:	d10ff0ef          	jal	4000 <ecvtbuf>
    4af4:	fea42223          	sw	a0,-28(s0)
    4af8:	fd842783          	lw	a5,-40(s0)
    4afc:	fff78793          	add	a5,a5,-1
    4b00:	fcf42e23          	sw	a5,-36(s0)
    4b04:	fdc42703          	lw	a4,-36(s0)
    4b08:	ffc00793          	li	a5,-4
    4b0c:	00f74863          	blt	a4,a5,4b1c <parse_float+0xac>
    4b10:	f6c42703          	lw	a4,-148(s0)
    4b14:	fdc42783          	lw	a5,-36(s0)
    4b18:	00e7ce63          	blt	a5,a4,4b34 <parse_float+0xc4>
    4b1c:	06500793          	li	a5,101
    4b20:	f6f409a3          	sb	a5,-141(s0)
    4b24:	f6c42783          	lw	a5,-148(s0)
    4b28:	fff78793          	add	a5,a5,-1
    4b2c:	f6f42623          	sw	a5,-148(s0)
    4b30:	01c0006f          	j	4b4c <parse_float+0xdc>
    4b34:	06600793          	li	a5,102
    4b38:	f6f409a3          	sb	a5,-141(s0)
    4b3c:	fd842783          	lw	a5,-40(s0)
    4b40:	f6c42703          	lw	a4,-148(s0)
    4b44:	40f707b3          	sub	a5,a4,a5
    4b48:	f6f42623          	sw	a5,-148(s0)
    4b4c:	f7344703          	lbu	a4,-141(s0)
    4b50:	06500793          	li	a5,101
    4b54:	20f71463          	bne	a4,a5,4d5c <parse_float+0x2ec>
    4b58:	f6c42783          	lw	a5,-148(s0)
    4b5c:	00178613          	add	a2,a5,1
    4b60:	f8440793          	add	a5,s0,-124
    4b64:	fd440713          	add	a4,s0,-44
    4b68:	fd840693          	add	a3,s0,-40
    4b6c:	f7842503          	lw	a0,-136(s0)
    4b70:	f7c42583          	lw	a1,-132(s0)
    4b74:	c8cff0ef          	jal	4000 <ecvtbuf>
    4b78:	fea42223          	sw	a0,-28(s0)
    4b7c:	fd442783          	lw	a5,-44(s0)
    4b80:	00078c63          	beqz	a5,4b98 <parse_float+0x128>
    4b84:	f7442783          	lw	a5,-140(s0)
    4b88:	00178713          	add	a4,a5,1
    4b8c:	f6e42a23          	sw	a4,-140(s0)
    4b90:	02d00713          	li	a4,45
    4b94:	00e78023          	sb	a4,0(a5)
    4b98:	f7442783          	lw	a5,-140(s0)
    4b9c:	00178713          	add	a4,a5,1
    4ba0:	f6e42a23          	sw	a4,-140(s0)
    4ba4:	fe442703          	lw	a4,-28(s0)
    4ba8:	00074703          	lbu	a4,0(a4)
    4bac:	00e78023          	sb	a4,0(a5)
    4bb0:	f6c42783          	lw	a5,-148(s0)
    4bb4:	00f05c63          	blez	a5,4bcc <parse_float+0x15c>
    4bb8:	f7442783          	lw	a5,-140(s0)
    4bbc:	00178713          	add	a4,a5,1
    4bc0:	f6e42a23          	sw	a4,-140(s0)
    4bc4:	02e00713          	li	a4,46
    4bc8:	00e78023          	sb	a4,0(a5)
    4bcc:	fe442783          	lw	a5,-28(s0)
    4bd0:	00178793          	add	a5,a5,1
    4bd4:	f6c42603          	lw	a2,-148(s0)
    4bd8:	00078593          	mv	a1,a5
    4bdc:	f7442503          	lw	a0,-140(s0)
    4be0:	e25ff0ef          	jal	4a04 <ee_bufcpy>
    4be4:	f6c42783          	lw	a5,-148(s0)
    4be8:	f7442703          	lw	a4,-140(s0)
    4bec:	00f707b3          	add	a5,a4,a5
    4bf0:	f6f42a23          	sw	a5,-140(s0)
    4bf4:	fe042783          	lw	a5,-32(s0)
    4bf8:	00078663          	beqz	a5,4c04 <parse_float+0x194>
    4bfc:	04500713          	li	a4,69
    4c00:	0080006f          	j	4c08 <parse_float+0x198>
    4c04:	06500713          	li	a4,101
    4c08:	f7442783          	lw	a5,-140(s0)
    4c0c:	00178693          	add	a3,a5,1
    4c10:	f6d42a23          	sw	a3,-140(s0)
    4c14:	00e78023          	sb	a4,0(a5)
    4c18:	fd842783          	lw	a5,-40(s0)
    4c1c:	02079a63          	bnez	a5,4c50 <parse_float+0x1e0>
    4c20:	00000613          	li	a2,0
    4c24:	00000693          	li	a3,0
    4c28:	f7842503          	lw	a0,-136(s0)
    4c2c:	f7c42583          	lw	a1,-132(s0)
    4c30:	094020ef          	jal	6cc4 <__eqdf2>
    4c34:	00050793          	mv	a5,a0
    4c38:	00079663          	bnez	a5,4c44 <parse_float+0x1d4>
    4c3c:	fe042623          	sw	zero,-20(s0)
    4c40:	01c0006f          	j	4c5c <parse_float+0x1ec>
    4c44:	fff00793          	li	a5,-1
    4c48:	fef42623          	sw	a5,-20(s0)
    4c4c:	0100006f          	j	4c5c <parse_float+0x1ec>
    4c50:	fd842783          	lw	a5,-40(s0)
    4c54:	fff78793          	add	a5,a5,-1
    4c58:	fef42623          	sw	a5,-20(s0)
    4c5c:	fec42783          	lw	a5,-20(s0)
    4c60:	0207d463          	bgez	a5,4c88 <parse_float+0x218>
    4c64:	f7442783          	lw	a5,-140(s0)
    4c68:	00178713          	add	a4,a5,1
    4c6c:	f6e42a23          	sw	a4,-140(s0)
    4c70:	02d00713          	li	a4,45
    4c74:	00e78023          	sb	a4,0(a5)
    4c78:	fec42783          	lw	a5,-20(s0)
    4c7c:	40f007b3          	neg	a5,a5
    4c80:	fef42623          	sw	a5,-20(s0)
    4c84:	0180006f          	j	4c9c <parse_float+0x22c>
    4c88:	f7442783          	lw	a5,-140(s0)
    4c8c:	00178713          	add	a4,a5,1
    4c90:	f6e42a23          	sw	a4,-140(s0)
    4c94:	02b00713          	li	a4,43
    4c98:	00e78023          	sb	a4,0(a5)
    4c9c:	fec42783          	lw	a5,-20(s0)
    4ca0:	00a00593          	li	a1,10
    4ca4:	00078513          	mv	a0,a5
    4ca8:	4a5020ef          	jal	794c <__modsi3>
    4cac:	00050793          	mv	a5,a0
    4cb0:	0ff7f713          	zext.b	a4,a5
    4cb4:	f7442783          	lw	a5,-140(s0)
    4cb8:	00278793          	add	a5,a5,2
    4cbc:	03070713          	add	a4,a4,48
    4cc0:	0ff77713          	zext.b	a4,a4
    4cc4:	00e78023          	sb	a4,0(a5)
    4cc8:	fec42783          	lw	a5,-20(s0)
    4ccc:	00a00593          	li	a1,10
    4cd0:	00078513          	mv	a0,a5
    4cd4:	3f5020ef          	jal	78c8 <__divsi3>
    4cd8:	00050793          	mv	a5,a0
    4cdc:	fef42623          	sw	a5,-20(s0)
    4ce0:	fec42783          	lw	a5,-20(s0)
    4ce4:	00a00593          	li	a1,10
    4ce8:	00078513          	mv	a0,a5
    4cec:	461020ef          	jal	794c <__modsi3>
    4cf0:	00050793          	mv	a5,a0
    4cf4:	0ff7f713          	zext.b	a4,a5
    4cf8:	f7442783          	lw	a5,-140(s0)
    4cfc:	00178793          	add	a5,a5,1
    4d00:	03070713          	add	a4,a4,48
    4d04:	0ff77713          	zext.b	a4,a4
    4d08:	00e78023          	sb	a4,0(a5)
    4d0c:	fec42783          	lw	a5,-20(s0)
    4d10:	00a00593          	li	a1,10
    4d14:	00078513          	mv	a0,a5
    4d18:	3b1020ef          	jal	78c8 <__divsi3>
    4d1c:	00050793          	mv	a5,a0
    4d20:	fef42623          	sw	a5,-20(s0)
    4d24:	fec42783          	lw	a5,-20(s0)
    4d28:	00a00593          	li	a1,10
    4d2c:	00078513          	mv	a0,a5
    4d30:	41d020ef          	jal	794c <__modsi3>
    4d34:	00050793          	mv	a5,a0
    4d38:	0ff7f793          	zext.b	a5,a5
    4d3c:	03078793          	add	a5,a5,48
    4d40:	0ff7f713          	zext.b	a4,a5
    4d44:	f7442783          	lw	a5,-140(s0)
    4d48:	00e78023          	sb	a4,0(a5)
    4d4c:	f7442783          	lw	a5,-140(s0)
    4d50:	00378793          	add	a5,a5,3
    4d54:	f6f42a23          	sw	a5,-140(s0)
    4d58:	1b80006f          	j	4f10 <parse_float+0x4a0>
    4d5c:	f7344703          	lbu	a4,-141(s0)
    4d60:	06600793          	li	a5,102
    4d64:	1af71663          	bne	a4,a5,4f10 <parse_float+0x4a0>
    4d68:	f8440793          	add	a5,s0,-124
    4d6c:	fd440713          	add	a4,s0,-44
    4d70:	fd840693          	add	a3,s0,-40
    4d74:	f6c42603          	lw	a2,-148(s0)
    4d78:	f7842503          	lw	a0,-136(s0)
    4d7c:	f7c42583          	lw	a1,-132(s0)
    4d80:	b40ff0ef          	jal	40c0 <fcvtbuf>
    4d84:	fea42223          	sw	a0,-28(s0)
    4d88:	fd442783          	lw	a5,-44(s0)
    4d8c:	00078c63          	beqz	a5,4da4 <parse_float+0x334>
    4d90:	f7442783          	lw	a5,-140(s0)
    4d94:	00178713          	add	a4,a5,1
    4d98:	f6e42a23          	sw	a4,-140(s0)
    4d9c:	02d00713          	li	a4,45
    4da0:	00e78023          	sb	a4,0(a5)
    4da4:	fe442783          	lw	a5,-28(s0)
    4da8:	0007c783          	lbu	a5,0(a5)
    4dac:	10078063          	beqz	a5,4eac <parse_float+0x43c>
    4db0:	fd842783          	lw	a5,-40(s0)
    4db4:	08f04c63          	bgtz	a5,4e4c <parse_float+0x3dc>
    4db8:	f7442783          	lw	a5,-140(s0)
    4dbc:	00178713          	add	a4,a5,1
    4dc0:	f6e42a23          	sw	a4,-140(s0)
    4dc4:	03000713          	li	a4,48
    4dc8:	00e78023          	sb	a4,0(a5)
    4dcc:	f7442783          	lw	a5,-140(s0)
    4dd0:	00178713          	add	a4,a5,1
    4dd4:	f6e42a23          	sw	a4,-140(s0)
    4dd8:	02e00713          	li	a4,46
    4ddc:	00e78023          	sb	a4,0(a5)
    4de0:	fe042423          	sw	zero,-24(s0)
    4de4:	0240006f          	j	4e08 <parse_float+0x398>
    4de8:	f7442783          	lw	a5,-140(s0)
    4dec:	00178713          	add	a4,a5,1
    4df0:	f6e42a23          	sw	a4,-140(s0)
    4df4:	03000713          	li	a4,48
    4df8:	00e78023          	sb	a4,0(a5)
    4dfc:	fe842783          	lw	a5,-24(s0)
    4e00:	00178793          	add	a5,a5,1
    4e04:	fef42423          	sw	a5,-24(s0)
    4e08:	fd842783          	lw	a5,-40(s0)
    4e0c:	40f007b3          	neg	a5,a5
    4e10:	fe842703          	lw	a4,-24(s0)
    4e14:	fcf74ae3          	blt	a4,a5,4de8 <parse_float+0x378>
    4e18:	0240006f          	j	4e3c <parse_float+0x3cc>
    4e1c:	fe442703          	lw	a4,-28(s0)
    4e20:	00170793          	add	a5,a4,1
    4e24:	fef42223          	sw	a5,-28(s0)
    4e28:	f7442783          	lw	a5,-140(s0)
    4e2c:	00178693          	add	a3,a5,1
    4e30:	f6d42a23          	sw	a3,-140(s0)
    4e34:	00074703          	lbu	a4,0(a4)
    4e38:	00e78023          	sb	a4,0(a5)
    4e3c:	fe442783          	lw	a5,-28(s0)
    4e40:	0007c783          	lbu	a5,0(a5)
    4e44:	fc079ce3          	bnez	a5,4e1c <parse_float+0x3ac>
    4e48:	0c80006f          	j	4f10 <parse_float+0x4a0>
    4e4c:	fe042423          	sw	zero,-24(s0)
    4e50:	04c0006f          	j	4e9c <parse_float+0x42c>
    4e54:	fe842783          	lw	a5,-24(s0)
    4e58:	00178713          	add	a4,a5,1
    4e5c:	fee42423          	sw	a4,-24(s0)
    4e60:	fd842703          	lw	a4,-40(s0)
    4e64:	00e79c63          	bne	a5,a4,4e7c <parse_float+0x40c>
    4e68:	f7442783          	lw	a5,-140(s0)
    4e6c:	00178713          	add	a4,a5,1
    4e70:	f6e42a23          	sw	a4,-140(s0)
    4e74:	02e00713          	li	a4,46
    4e78:	00e78023          	sb	a4,0(a5)
    4e7c:	fe442703          	lw	a4,-28(s0)
    4e80:	00170793          	add	a5,a4,1
    4e84:	fef42223          	sw	a5,-28(s0)
    4e88:	f7442783          	lw	a5,-140(s0)
    4e8c:	00178693          	add	a3,a5,1
    4e90:	f6d42a23          	sw	a3,-140(s0)
    4e94:	00074703          	lbu	a4,0(a4)
    4e98:	00e78023          	sb	a4,0(a5)
    4e9c:	fe442783          	lw	a5,-28(s0)
    4ea0:	0007c783          	lbu	a5,0(a5)
    4ea4:	fa0798e3          	bnez	a5,4e54 <parse_float+0x3e4>
    4ea8:	0680006f          	j	4f10 <parse_float+0x4a0>
    4eac:	f7442783          	lw	a5,-140(s0)
    4eb0:	00178713          	add	a4,a5,1
    4eb4:	f6e42a23          	sw	a4,-140(s0)
    4eb8:	03000713          	li	a4,48
    4ebc:	00e78023          	sb	a4,0(a5)
    4ec0:	f6c42783          	lw	a5,-148(s0)
    4ec4:	04f05663          	blez	a5,4f10 <parse_float+0x4a0>
    4ec8:	f7442783          	lw	a5,-140(s0)
    4ecc:	00178713          	add	a4,a5,1
    4ed0:	f6e42a23          	sw	a4,-140(s0)
    4ed4:	02e00713          	li	a4,46
    4ed8:	00e78023          	sb	a4,0(a5)
    4edc:	fe042423          	sw	zero,-24(s0)
    4ee0:	0240006f          	j	4f04 <parse_float+0x494>
    4ee4:	f7442783          	lw	a5,-140(s0)
    4ee8:	00178713          	add	a4,a5,1
    4eec:	f6e42a23          	sw	a4,-140(s0)
    4ef0:	03000713          	li	a4,48
    4ef4:	00e78023          	sb	a4,0(a5)
    4ef8:	fe842783          	lw	a5,-24(s0)
    4efc:	00178793          	add	a5,a5,1
    4f00:	fef42423          	sw	a5,-24(s0)
    4f04:	fe842703          	lw	a4,-24(s0)
    4f08:	f6c42783          	lw	a5,-148(s0)
    4f0c:	fcf74ce3          	blt	a4,a5,4ee4 <parse_float+0x474>
    4f10:	f7442783          	lw	a5,-140(s0)
    4f14:	00078023          	sb	zero,0(a5)
    4f18:	00000013          	nop
    4f1c:	09c12083          	lw	ra,156(sp)
    4f20:	09812403          	lw	s0,152(sp)
    4f24:	0a010113          	add	sp,sp,160
    4f28:	00008067          	ret

00004f2c <decimal_point>:
    4f2c:	fd010113          	add	sp,sp,-48
    4f30:	02112623          	sw	ra,44(sp)
    4f34:	02812423          	sw	s0,40(sp)
    4f38:	03010413          	add	s0,sp,48
    4f3c:	fca42e23          	sw	a0,-36(s0)
    4f40:	0400006f          	j	4f80 <decimal_point+0x54>
    4f44:	fdc42783          	lw	a5,-36(s0)
    4f48:	0007c703          	lbu	a4,0(a5)
    4f4c:	02e00793          	li	a5,46
    4f50:	0cf70463          	beq	a4,a5,5018 <decimal_point+0xec>
    4f54:	fdc42783          	lw	a5,-36(s0)
    4f58:	0007c703          	lbu	a4,0(a5)
    4f5c:	06500793          	li	a5,101
    4f60:	02f70663          	beq	a4,a5,4f8c <decimal_point+0x60>
    4f64:	fdc42783          	lw	a5,-36(s0)
    4f68:	0007c703          	lbu	a4,0(a5)
    4f6c:	04500793          	li	a5,69
    4f70:	00f70e63          	beq	a4,a5,4f8c <decimal_point+0x60>
    4f74:	fdc42783          	lw	a5,-36(s0)
    4f78:	00178793          	add	a5,a5,1
    4f7c:	fcf42e23          	sw	a5,-36(s0)
    4f80:	fdc42783          	lw	a5,-36(s0)
    4f84:	0007c783          	lbu	a5,0(a5)
    4f88:	fa079ee3          	bnez	a5,4f44 <decimal_point+0x18>
    4f8c:	fdc42783          	lw	a5,-36(s0)
    4f90:	0007c783          	lbu	a5,0(a5)
    4f94:	06078263          	beqz	a5,4ff8 <decimal_point+0xcc>
    4f98:	10000593          	li	a1,256
    4f9c:	fdc42503          	lw	a0,-36(s0)
    4fa0:	980ff0ef          	jal	4120 <strnlen>
    4fa4:	00050793          	mv	a5,a0
    4fa8:	fef42623          	sw	a5,-20(s0)
    4fac:	0340006f          	j	4fe0 <decimal_point+0xb4>
    4fb0:	fec42783          	lw	a5,-20(s0)
    4fb4:	fdc42703          	lw	a4,-36(s0)
    4fb8:	00f70733          	add	a4,a4,a5
    4fbc:	fec42783          	lw	a5,-20(s0)
    4fc0:	00178793          	add	a5,a5,1
    4fc4:	fdc42683          	lw	a3,-36(s0)
    4fc8:	00f687b3          	add	a5,a3,a5
    4fcc:	00074703          	lbu	a4,0(a4)
    4fd0:	00e78023          	sb	a4,0(a5)
    4fd4:	fec42783          	lw	a5,-20(s0)
    4fd8:	fff78793          	add	a5,a5,-1
    4fdc:	fef42623          	sw	a5,-20(s0)
    4fe0:	fec42783          	lw	a5,-20(s0)
    4fe4:	fcf046e3          	bgtz	a5,4fb0 <decimal_point+0x84>
    4fe8:	fdc42783          	lw	a5,-36(s0)
    4fec:	02e00713          	li	a4,46
    4ff0:	00e78023          	sb	a4,0(a5)
    4ff4:	0280006f          	j	501c <decimal_point+0xf0>
    4ff8:	fdc42783          	lw	a5,-36(s0)
    4ffc:	00178713          	add	a4,a5,1
    5000:	fce42e23          	sw	a4,-36(s0)
    5004:	02e00713          	li	a4,46
    5008:	00e78023          	sb	a4,0(a5)
    500c:	fdc42783          	lw	a5,-36(s0)
    5010:	00078023          	sb	zero,0(a5)
    5014:	0080006f          	j	501c <decimal_point+0xf0>
    5018:	00000013          	nop
    501c:	02c12083          	lw	ra,44(sp)
    5020:	02812403          	lw	s0,40(sp)
    5024:	03010113          	add	sp,sp,48
    5028:	00008067          	ret

0000502c <cropzeros>:
    502c:	fd010113          	add	sp,sp,-48
    5030:	02812623          	sw	s0,44(sp)
    5034:	03010413          	add	s0,sp,48
    5038:	fca42e23          	sw	a0,-36(s0)
    503c:	0100006f          	j	504c <cropzeros+0x20>
    5040:	fdc42783          	lw	a5,-36(s0)
    5044:	00178793          	add	a5,a5,1
    5048:	fcf42e23          	sw	a5,-36(s0)
    504c:	fdc42783          	lw	a5,-36(s0)
    5050:	0007c783          	lbu	a5,0(a5)
    5054:	00078a63          	beqz	a5,5068 <cropzeros+0x3c>
    5058:	fdc42783          	lw	a5,-36(s0)
    505c:	0007c703          	lbu	a4,0(a5)
    5060:	02e00793          	li	a5,46
    5064:	fcf71ee3          	bne	a4,a5,5040 <cropzeros+0x14>
    5068:	fdc42783          	lw	a5,-36(s0)
    506c:	00178713          	add	a4,a5,1
    5070:	fce42e23          	sw	a4,-36(s0)
    5074:	0007c783          	lbu	a5,0(a5)
    5078:	0a078863          	beqz	a5,5128 <cropzeros+0xfc>
    507c:	0100006f          	j	508c <cropzeros+0x60>
    5080:	fdc42783          	lw	a5,-36(s0)
    5084:	00178793          	add	a5,a5,1
    5088:	fcf42e23          	sw	a5,-36(s0)
    508c:	fdc42783          	lw	a5,-36(s0)
    5090:	0007c783          	lbu	a5,0(a5)
    5094:	02078263          	beqz	a5,50b8 <cropzeros+0x8c>
    5098:	fdc42783          	lw	a5,-36(s0)
    509c:	0007c703          	lbu	a4,0(a5)
    50a0:	06500793          	li	a5,101
    50a4:	00f70a63          	beq	a4,a5,50b8 <cropzeros+0x8c>
    50a8:	fdc42783          	lw	a5,-36(s0)
    50ac:	0007c703          	lbu	a4,0(a5)
    50b0:	04500793          	li	a5,69
    50b4:	fcf716e3          	bne	a4,a5,5080 <cropzeros+0x54>
    50b8:	fdc42783          	lw	a5,-36(s0)
    50bc:	fff78713          	add	a4,a5,-1
    50c0:	fce42e23          	sw	a4,-36(s0)
    50c4:	fef42623          	sw	a5,-20(s0)
    50c8:	0100006f          	j	50d8 <cropzeros+0xac>
    50cc:	fdc42783          	lw	a5,-36(s0)
    50d0:	fff78793          	add	a5,a5,-1
    50d4:	fcf42e23          	sw	a5,-36(s0)
    50d8:	fdc42783          	lw	a5,-36(s0)
    50dc:	0007c703          	lbu	a4,0(a5)
    50e0:	03000793          	li	a5,48
    50e4:	fef704e3          	beq	a4,a5,50cc <cropzeros+0xa0>
    50e8:	fdc42783          	lw	a5,-36(s0)
    50ec:	0007c703          	lbu	a4,0(a5)
    50f0:	02e00793          	li	a5,46
    50f4:	02f71463          	bne	a4,a5,511c <cropzeros+0xf0>
    50f8:	fdc42783          	lw	a5,-36(s0)
    50fc:	fff78793          	add	a5,a5,-1
    5100:	fcf42e23          	sw	a5,-36(s0)
    5104:	0180006f          	j	511c <cropzeros+0xf0>
    5108:	fdc42783          	lw	a5,-36(s0)
    510c:	00178793          	add	a5,a5,1
    5110:	fcf42e23          	sw	a5,-36(s0)
    5114:	fdc42783          	lw	a5,-36(s0)
    5118:	00078023          	sb	zero,0(a5)
    511c:	fdc42703          	lw	a4,-36(s0)
    5120:	fec42783          	lw	a5,-20(s0)
    5124:	fef712e3          	bne	a4,a5,5108 <cropzeros+0xdc>
    5128:	00000013          	nop
    512c:	02c12403          	lw	s0,44(sp)
    5130:	03010113          	add	sp,sp,48
    5134:	00008067          	ret

00005138 <flt>:
    5138:	f7010113          	add	sp,sp,-144
    513c:	08112623          	sw	ra,140(sp)
    5140:	08812423          	sw	s0,136(sp)
    5144:	09212223          	sw	s2,132(sp)
    5148:	09312023          	sw	s3,128(sp)
    514c:	09010413          	add	s0,sp,144
    5150:	f8a42623          	sw	a0,-116(s0)
    5154:	f8b42023          	sw	a1,-128(s0)
    5158:	f8c42223          	sw	a2,-124(s0)
    515c:	f8d42423          	sw	a3,-120(s0)
    5160:	f6e42e23          	sw	a4,-132(s0)
    5164:	f7042a23          	sw	a6,-140(s0)
    5168:	f6f40da3          	sb	a5,-133(s0)
    516c:	f7442783          	lw	a5,-140(s0)
    5170:	0107f793          	and	a5,a5,16
    5174:	00078863          	beqz	a5,5184 <flt+0x4c>
    5178:	f7442783          	lw	a5,-140(s0)
    517c:	ffe7f793          	and	a5,a5,-2
    5180:	f6f42a23          	sw	a5,-140(s0)
    5184:	f7442783          	lw	a5,-140(s0)
    5188:	0017f793          	and	a5,a5,1
    518c:	00078663          	beqz	a5,5198 <flt+0x60>
    5190:	03000793          	li	a5,48
    5194:	0080006f          	j	519c <flt+0x64>
    5198:	02000793          	li	a5,32
    519c:	fef403a3          	sb	a5,-25(s0)
    51a0:	fe0407a3          	sb	zero,-17(s0)
    51a4:	f7442783          	lw	a5,-140(s0)
    51a8:	0027f793          	and	a5,a5,2
    51ac:	08078a63          	beqz	a5,5240 <flt+0x108>
    51b0:	00000613          	li	a2,0
    51b4:	00000693          	li	a3,0
    51b8:	f8042503          	lw	a0,-128(s0)
    51bc:	f8442583          	lw	a1,-124(s0)
    51c0:	491010ef          	jal	6e50 <__ledf2>
    51c4:	00050793          	mv	a5,a0
    51c8:	0207da63          	bgez	a5,51fc <flt+0xc4>
    51cc:	02d00793          	li	a5,45
    51d0:	fef407a3          	sb	a5,-17(s0)
    51d4:	f8042903          	lw	s2,-128(s0)
    51d8:	f8442703          	lw	a4,-124(s0)
    51dc:	800007b7          	lui	a5,0x80000
    51e0:	00f749b3          	xor	s3,a4,a5
    51e4:	f9242023          	sw	s2,-128(s0)
    51e8:	f9342223          	sw	s3,-124(s0)
    51ec:	f8842783          	lw	a5,-120(s0)
    51f0:	fff78793          	add	a5,a5,-1 # 7fffffff <__subdf3+0x7fff840f>
    51f4:	f8f42423          	sw	a5,-120(s0)
    51f8:	0480006f          	j	5240 <flt+0x108>
    51fc:	f7442783          	lw	a5,-140(s0)
    5200:	0047f793          	and	a5,a5,4
    5204:	00078e63          	beqz	a5,5220 <flt+0xe8>
    5208:	02b00793          	li	a5,43
    520c:	fef407a3          	sb	a5,-17(s0)
    5210:	f8842783          	lw	a5,-120(s0)
    5214:	fff78793          	add	a5,a5,-1
    5218:	f8f42423          	sw	a5,-120(s0)
    521c:	0240006f          	j	5240 <flt+0x108>
    5220:	f7442783          	lw	a5,-140(s0)
    5224:	0087f793          	and	a5,a5,8
    5228:	00078c63          	beqz	a5,5240 <flt+0x108>
    522c:	02000793          	li	a5,32
    5230:	fef407a3          	sb	a5,-17(s0)
    5234:	f8842783          	lw	a5,-120(s0)
    5238:	fff78793          	add	a5,a5,-1
    523c:	f8f42423          	sw	a5,-120(s0)
    5240:	f7c42783          	lw	a5,-132(s0)
    5244:	0007d663          	bgez	a5,5250 <flt+0x118>
    5248:	00600793          	li	a5,6
    524c:	f6f42e23          	sw	a5,-132(s0)
    5250:	f7b44683          	lbu	a3,-133(s0)
    5254:	f9040793          	add	a5,s0,-112
    5258:	f7c42703          	lw	a4,-132(s0)
    525c:	00078613          	mv	a2,a5
    5260:	f8042503          	lw	a0,-128(s0)
    5264:	f8442583          	lw	a1,-124(s0)
    5268:	809ff0ef          	jal	4a70 <parse_float>
    526c:	f7442783          	lw	a5,-140(s0)
    5270:	0207f793          	and	a5,a5,32
    5274:	00078c63          	beqz	a5,528c <flt+0x154>
    5278:	f7c42783          	lw	a5,-132(s0)
    527c:	00079863          	bnez	a5,528c <flt+0x154>
    5280:	f9040793          	add	a5,s0,-112
    5284:	00078513          	mv	a0,a5
    5288:	ca5ff0ef          	jal	4f2c <decimal_point>
    528c:	f7b44703          	lbu	a4,-133(s0)
    5290:	06700793          	li	a5,103
    5294:	00f71e63          	bne	a4,a5,52b0 <flt+0x178>
    5298:	f7442783          	lw	a5,-140(s0)
    529c:	0207f793          	and	a5,a5,32
    52a0:	00079863          	bnez	a5,52b0 <flt+0x178>
    52a4:	f9040793          	add	a5,s0,-112
    52a8:	00078513          	mv	a0,a5
    52ac:	d81ff0ef          	jal	502c <cropzeros>
    52b0:	f9040793          	add	a5,s0,-112
    52b4:	10000593          	li	a1,256
    52b8:	00078513          	mv	a0,a5
    52bc:	e65fe0ef          	jal	4120 <strnlen>
    52c0:	00050793          	mv	a5,a0
    52c4:	fef42023          	sw	a5,-32(s0)
    52c8:	f8842703          	lw	a4,-120(s0)
    52cc:	fe042783          	lw	a5,-32(s0)
    52d0:	40f707b3          	sub	a5,a4,a5
    52d4:	f8f42423          	sw	a5,-120(s0)
    52d8:	f7442783          	lw	a5,-140(s0)
    52dc:	0117f793          	and	a5,a5,17
    52e0:	02079663          	bnez	a5,530c <flt+0x1d4>
    52e4:	0180006f          	j	52fc <flt+0x1c4>
    52e8:	f8c42783          	lw	a5,-116(s0)
    52ec:	00178713          	add	a4,a5,1
    52f0:	f8e42623          	sw	a4,-116(s0)
    52f4:	02000713          	li	a4,32
    52f8:	00e78023          	sb	a4,0(a5)
    52fc:	f8842783          	lw	a5,-120(s0)
    5300:	fff78713          	add	a4,a5,-1
    5304:	f8e42423          	sw	a4,-120(s0)
    5308:	fef040e3          	bgtz	a5,52e8 <flt+0x1b0>
    530c:	fef44783          	lbu	a5,-17(s0)
    5310:	00078c63          	beqz	a5,5328 <flt+0x1f0>
    5314:	f8c42783          	lw	a5,-116(s0)
    5318:	00178713          	add	a4,a5,1
    531c:	f8e42623          	sw	a4,-116(s0)
    5320:	fef44703          	lbu	a4,-17(s0)
    5324:	00e78023          	sb	a4,0(a5)
    5328:	f7442783          	lw	a5,-140(s0)
    532c:	0107f793          	and	a5,a5,16
    5330:	02079663          	bnez	a5,535c <flt+0x224>
    5334:	0180006f          	j	534c <flt+0x214>
    5338:	f8c42783          	lw	a5,-116(s0)
    533c:	00178713          	add	a4,a5,1
    5340:	f8e42623          	sw	a4,-116(s0)
    5344:	fe744703          	lbu	a4,-25(s0)
    5348:	00e78023          	sb	a4,0(a5)
    534c:	f8842783          	lw	a5,-120(s0)
    5350:	fff78713          	add	a4,a5,-1
    5354:	f8e42423          	sw	a4,-120(s0)
    5358:	fef040e3          	bgtz	a5,5338 <flt+0x200>
    535c:	fe042423          	sw	zero,-24(s0)
    5360:	0300006f          	j	5390 <flt+0x258>
    5364:	f8c42783          	lw	a5,-116(s0)
    5368:	00178713          	add	a4,a5,1
    536c:	f8e42623          	sw	a4,-116(s0)
    5370:	fe842703          	lw	a4,-24(s0)
    5374:	ff070713          	add	a4,a4,-16
    5378:	00870733          	add	a4,a4,s0
    537c:	fa074703          	lbu	a4,-96(a4)
    5380:	00e78023          	sb	a4,0(a5)
    5384:	fe842783          	lw	a5,-24(s0)
    5388:	00178793          	add	a5,a5,1
    538c:	fef42423          	sw	a5,-24(s0)
    5390:	fe842703          	lw	a4,-24(s0)
    5394:	fe042783          	lw	a5,-32(s0)
    5398:	fcf746e3          	blt	a4,a5,5364 <flt+0x22c>
    539c:	0180006f          	j	53b4 <flt+0x27c>
    53a0:	f8c42783          	lw	a5,-116(s0)
    53a4:	00178713          	add	a4,a5,1
    53a8:	f8e42623          	sw	a4,-116(s0)
    53ac:	02000713          	li	a4,32
    53b0:	00e78023          	sb	a4,0(a5)
    53b4:	f8842783          	lw	a5,-120(s0)
    53b8:	fff78713          	add	a4,a5,-1
    53bc:	f8e42423          	sw	a4,-120(s0)
    53c0:	fef040e3          	bgtz	a5,53a0 <flt+0x268>
    53c4:	f8c42783          	lw	a5,-116(s0)
    53c8:	00078513          	mv	a0,a5
    53cc:	08c12083          	lw	ra,140(sp)
    53d0:	08812403          	lw	s0,136(sp)
    53d4:	08412903          	lw	s2,132(sp)
    53d8:	08012983          	lw	s3,128(sp)
    53dc:	09010113          	add	sp,sp,144
    53e0:	00008067          	ret

000053e4 <ee_vsprintf>:
    53e4:	fb010113          	add	sp,sp,-80
    53e8:	04112623          	sw	ra,76(sp)
    53ec:	04812423          	sw	s0,72(sp)
    53f0:	05010413          	add	s0,sp,80
    53f4:	faa42e23          	sw	a0,-68(s0)
    53f8:	fab42c23          	sw	a1,-72(s0)
    53fc:	fac42a23          	sw	a2,-76(s0)
    5400:	fbc42783          	lw	a5,-68(s0)
    5404:	fef42023          	sw	a5,-32(s0)
    5408:	5f40006f          	j	59fc <ee_vsprintf+0x618>
    540c:	fb842783          	lw	a5,-72(s0)
    5410:	0007c703          	lbu	a4,0(a5)
    5414:	02500793          	li	a5,37
    5418:	02f70063          	beq	a4,a5,5438 <ee_vsprintf+0x54>
    541c:	fb842703          	lw	a4,-72(s0)
    5420:	fe042783          	lw	a5,-32(s0)
    5424:	00178693          	add	a3,a5,1
    5428:	fed42023          	sw	a3,-32(s0)
    542c:	00074703          	lbu	a4,0(a4)
    5430:	00e78023          	sb	a4,0(a5)
    5434:	5bc0006f          	j	59f0 <ee_vsprintf+0x60c>
    5438:	fc042c23          	sw	zero,-40(s0)
    543c:	fb842783          	lw	a5,-72(s0)
    5440:	00178793          	add	a5,a5,1
    5444:	faf42c23          	sw	a5,-72(s0)
    5448:	fb842783          	lw	a5,-72(s0)
    544c:	0007c783          	lbu	a5,0(a5)
    5450:	fe078793          	add	a5,a5,-32
    5454:	01000713          	li	a4,16
    5458:	06f76463          	bltu	a4,a5,54c0 <ee_vsprintf+0xdc>
    545c:	00279713          	sll	a4,a5,0x2
    5460:	67000793          	li	a5,1648
    5464:	00f707b3          	add	a5,a4,a5
    5468:	0007a783          	lw	a5,0(a5)
    546c:	00078067          	jr	a5
    5470:	fd842783          	lw	a5,-40(s0)
    5474:	0107e793          	or	a5,a5,16
    5478:	fcf42c23          	sw	a5,-40(s0)
    547c:	fc1ff06f          	j	543c <ee_vsprintf+0x58>
    5480:	fd842783          	lw	a5,-40(s0)
    5484:	0047e793          	or	a5,a5,4
    5488:	fcf42c23          	sw	a5,-40(s0)
    548c:	fb1ff06f          	j	543c <ee_vsprintf+0x58>
    5490:	fd842783          	lw	a5,-40(s0)
    5494:	0087e793          	or	a5,a5,8
    5498:	fcf42c23          	sw	a5,-40(s0)
    549c:	fa1ff06f          	j	543c <ee_vsprintf+0x58>
    54a0:	fd842783          	lw	a5,-40(s0)
    54a4:	0207e793          	or	a5,a5,32
    54a8:	fcf42c23          	sw	a5,-40(s0)
    54ac:	f91ff06f          	j	543c <ee_vsprintf+0x58>
    54b0:	fd842783          	lw	a5,-40(s0)
    54b4:	0017e793          	or	a5,a5,1
    54b8:	fcf42c23          	sw	a5,-40(s0)
    54bc:	f81ff06f          	j	543c <ee_vsprintf+0x58>
    54c0:	fff00793          	li	a5,-1
    54c4:	fcf42a23          	sw	a5,-44(s0)
    54c8:	fb842783          	lw	a5,-72(s0)
    54cc:	0007c703          	lbu	a4,0(a5)
    54d0:	02f00793          	li	a5,47
    54d4:	02e7f463          	bgeu	a5,a4,54fc <ee_vsprintf+0x118>
    54d8:	fb842783          	lw	a5,-72(s0)
    54dc:	0007c703          	lbu	a4,0(a5)
    54e0:	03900793          	li	a5,57
    54e4:	00e7ec63          	bltu	a5,a4,54fc <ee_vsprintf+0x118>
    54e8:	fb840793          	add	a5,s0,-72
    54ec:	00078513          	mv	a0,a5
    54f0:	c95fe0ef          	jal	4184 <skip_atoi>
    54f4:	fca42a23          	sw	a0,-44(s0)
    54f8:	0540006f          	j	554c <ee_vsprintf+0x168>
    54fc:	fb842783          	lw	a5,-72(s0)
    5500:	0007c703          	lbu	a4,0(a5)
    5504:	02a00793          	li	a5,42
    5508:	04f71263          	bne	a4,a5,554c <ee_vsprintf+0x168>
    550c:	fb842783          	lw	a5,-72(s0)
    5510:	00178793          	add	a5,a5,1
    5514:	faf42c23          	sw	a5,-72(s0)
    5518:	fb442783          	lw	a5,-76(s0)
    551c:	00478713          	add	a4,a5,4
    5520:	fae42a23          	sw	a4,-76(s0)
    5524:	0007a783          	lw	a5,0(a5)
    5528:	fcf42a23          	sw	a5,-44(s0)
    552c:	fd442783          	lw	a5,-44(s0)
    5530:	0007de63          	bgez	a5,554c <ee_vsprintf+0x168>
    5534:	fd442783          	lw	a5,-44(s0)
    5538:	40f007b3          	neg	a5,a5
    553c:	fcf42a23          	sw	a5,-44(s0)
    5540:	fd842783          	lw	a5,-40(s0)
    5544:	0107e793          	or	a5,a5,16
    5548:	fcf42c23          	sw	a5,-40(s0)
    554c:	fff00793          	li	a5,-1
    5550:	fcf42823          	sw	a5,-48(s0)
    5554:	fb842783          	lw	a5,-72(s0)
    5558:	0007c703          	lbu	a4,0(a5)
    555c:	02e00793          	li	a5,46
    5560:	08f71063          	bne	a4,a5,55e0 <ee_vsprintf+0x1fc>
    5564:	fb842783          	lw	a5,-72(s0)
    5568:	00178793          	add	a5,a5,1
    556c:	faf42c23          	sw	a5,-72(s0)
    5570:	fb842783          	lw	a5,-72(s0)
    5574:	0007c703          	lbu	a4,0(a5)
    5578:	02f00793          	li	a5,47
    557c:	02e7f463          	bgeu	a5,a4,55a4 <ee_vsprintf+0x1c0>
    5580:	fb842783          	lw	a5,-72(s0)
    5584:	0007c703          	lbu	a4,0(a5)
    5588:	03900793          	li	a5,57
    558c:	00e7ec63          	bltu	a5,a4,55a4 <ee_vsprintf+0x1c0>
    5590:	fb840793          	add	a5,s0,-72
    5594:	00078513          	mv	a0,a5
    5598:	bedfe0ef          	jal	4184 <skip_atoi>
    559c:	fca42823          	sw	a0,-48(s0)
    55a0:	0340006f          	j	55d4 <ee_vsprintf+0x1f0>
    55a4:	fb842783          	lw	a5,-72(s0)
    55a8:	0007c703          	lbu	a4,0(a5)
    55ac:	02a00793          	li	a5,42
    55b0:	02f71263          	bne	a4,a5,55d4 <ee_vsprintf+0x1f0>
    55b4:	fb842783          	lw	a5,-72(s0)
    55b8:	00178793          	add	a5,a5,1
    55bc:	faf42c23          	sw	a5,-72(s0)
    55c0:	fb442783          	lw	a5,-76(s0)
    55c4:	00478713          	add	a4,a5,4
    55c8:	fae42a23          	sw	a4,-76(s0)
    55cc:	0007a783          	lw	a5,0(a5)
    55d0:	fcf42823          	sw	a5,-48(s0)
    55d4:	fd042783          	lw	a5,-48(s0)
    55d8:	0007d463          	bgez	a5,55e0 <ee_vsprintf+0x1fc>
    55dc:	fc042823          	sw	zero,-48(s0)
    55e0:	fff00793          	li	a5,-1
    55e4:	fcf42623          	sw	a5,-52(s0)
    55e8:	fb842783          	lw	a5,-72(s0)
    55ec:	0007c703          	lbu	a4,0(a5)
    55f0:	06c00793          	li	a5,108
    55f4:	00f70a63          	beq	a4,a5,5608 <ee_vsprintf+0x224>
    55f8:	fb842783          	lw	a5,-72(s0)
    55fc:	0007c703          	lbu	a4,0(a5)
    5600:	04c00793          	li	a5,76
    5604:	00f71e63          	bne	a4,a5,5620 <ee_vsprintf+0x23c>
    5608:	fb842783          	lw	a5,-72(s0)
    560c:	0007c783          	lbu	a5,0(a5)
    5610:	fcf42623          	sw	a5,-52(s0)
    5614:	fb842783          	lw	a5,-72(s0)
    5618:	00178793          	add	a5,a5,1
    561c:	faf42c23          	sw	a5,-72(s0)
    5620:	00a00793          	li	a5,10
    5624:	fef42223          	sw	a5,-28(s0)
    5628:	fb842783          	lw	a5,-72(s0)
    562c:	0007c783          	lbu	a5,0(a5)
    5630:	fbf78793          	add	a5,a5,-65
    5634:	03700713          	li	a4,55
    5638:	2cf76e63          	bltu	a4,a5,5914 <ee_vsprintf+0x530>
    563c:	00279713          	sll	a4,a5,0x2
    5640:	6b400793          	li	a5,1716
    5644:	00f707b3          	add	a5,a4,a5
    5648:	0007a783          	lw	a5,0(a5)
    564c:	00078067          	jr	a5
    5650:	fd842783          	lw	a5,-40(s0)
    5654:	0107f793          	and	a5,a5,16
    5658:	02079863          	bnez	a5,5688 <ee_vsprintf+0x2a4>
    565c:	0180006f          	j	5674 <ee_vsprintf+0x290>
    5660:	fe042783          	lw	a5,-32(s0)
    5664:	00178713          	add	a4,a5,1
    5668:	fee42023          	sw	a4,-32(s0)
    566c:	02000713          	li	a4,32
    5670:	00e78023          	sb	a4,0(a5)
    5674:	fd442783          	lw	a5,-44(s0)
    5678:	fff78793          	add	a5,a5,-1
    567c:	fcf42a23          	sw	a5,-44(s0)
    5680:	fd442783          	lw	a5,-44(s0)
    5684:	fcf04ee3          	bgtz	a5,5660 <ee_vsprintf+0x27c>
    5688:	fb442783          	lw	a5,-76(s0)
    568c:	00478713          	add	a4,a5,4
    5690:	fae42a23          	sw	a4,-76(s0)
    5694:	0007a683          	lw	a3,0(a5)
    5698:	fe042783          	lw	a5,-32(s0)
    569c:	00178713          	add	a4,a5,1
    56a0:	fee42023          	sw	a4,-32(s0)
    56a4:	0ff6f713          	zext.b	a4,a3
    56a8:	00e78023          	sb	a4,0(a5)
    56ac:	0180006f          	j	56c4 <ee_vsprintf+0x2e0>
    56b0:	fe042783          	lw	a5,-32(s0)
    56b4:	00178713          	add	a4,a5,1
    56b8:	fee42023          	sw	a4,-32(s0)
    56bc:	02000713          	li	a4,32
    56c0:	00e78023          	sb	a4,0(a5)
    56c4:	fd442783          	lw	a5,-44(s0)
    56c8:	fff78793          	add	a5,a5,-1
    56cc:	fcf42a23          	sw	a5,-44(s0)
    56d0:	fd442783          	lw	a5,-44(s0)
    56d4:	fcf04ee3          	bgtz	a5,56b0 <ee_vsprintf+0x2cc>
    56d8:	3180006f          	j	59f0 <ee_vsprintf+0x60c>
    56dc:	fb442783          	lw	a5,-76(s0)
    56e0:	00478713          	add	a4,a5,4
    56e4:	fae42a23          	sw	a4,-76(s0)
    56e8:	0007a783          	lw	a5,0(a5)
    56ec:	fcf42e23          	sw	a5,-36(s0)
    56f0:	fdc42783          	lw	a5,-36(s0)
    56f4:	00079663          	bnez	a5,5700 <ee_vsprintf+0x31c>
    56f8:	66800793          	li	a5,1640
    56fc:	fcf42e23          	sw	a5,-36(s0)
    5700:	fd042783          	lw	a5,-48(s0)
    5704:	00078593          	mv	a1,a5
    5708:	fdc42503          	lw	a0,-36(s0)
    570c:	a15fe0ef          	jal	4120 <strnlen>
    5710:	00050793          	mv	a5,a0
    5714:	fcf42423          	sw	a5,-56(s0)
    5718:	fd842783          	lw	a5,-40(s0)
    571c:	0107f793          	and	a5,a5,16
    5720:	02079863          	bnez	a5,5750 <ee_vsprintf+0x36c>
    5724:	0180006f          	j	573c <ee_vsprintf+0x358>
    5728:	fe042783          	lw	a5,-32(s0)
    572c:	00178713          	add	a4,a5,1
    5730:	fee42023          	sw	a4,-32(s0)
    5734:	02000713          	li	a4,32
    5738:	00e78023          	sb	a4,0(a5)
    573c:	fd442783          	lw	a5,-44(s0)
    5740:	fff78713          	add	a4,a5,-1
    5744:	fce42a23          	sw	a4,-44(s0)
    5748:	fc842703          	lw	a4,-56(s0)
    574c:	fcf74ee3          	blt	a4,a5,5728 <ee_vsprintf+0x344>
    5750:	fe042423          	sw	zero,-24(s0)
    5754:	0300006f          	j	5784 <ee_vsprintf+0x3a0>
    5758:	fdc42703          	lw	a4,-36(s0)
    575c:	00170793          	add	a5,a4,1
    5760:	fcf42e23          	sw	a5,-36(s0)
    5764:	fe042783          	lw	a5,-32(s0)
    5768:	00178693          	add	a3,a5,1
    576c:	fed42023          	sw	a3,-32(s0)
    5770:	00074703          	lbu	a4,0(a4)
    5774:	00e78023          	sb	a4,0(a5)
    5778:	fe842783          	lw	a5,-24(s0)
    577c:	00178793          	add	a5,a5,1
    5780:	fef42423          	sw	a5,-24(s0)
    5784:	fe842703          	lw	a4,-24(s0)
    5788:	fc842783          	lw	a5,-56(s0)
    578c:	fcf746e3          	blt	a4,a5,5758 <ee_vsprintf+0x374>
    5790:	0180006f          	j	57a8 <ee_vsprintf+0x3c4>
    5794:	fe042783          	lw	a5,-32(s0)
    5798:	00178713          	add	a4,a5,1
    579c:	fee42023          	sw	a4,-32(s0)
    57a0:	02000713          	li	a4,32
    57a4:	00e78023          	sb	a4,0(a5)
    57a8:	fd442783          	lw	a5,-44(s0)
    57ac:	fff78713          	add	a4,a5,-1
    57b0:	fce42a23          	sw	a4,-44(s0)
    57b4:	fc842703          	lw	a4,-56(s0)
    57b8:	fcf74ee3          	blt	a4,a5,5794 <ee_vsprintf+0x3b0>
    57bc:	2340006f          	j	59f0 <ee_vsprintf+0x60c>
    57c0:	fd442703          	lw	a4,-44(s0)
    57c4:	fff00793          	li	a5,-1
    57c8:	00f71c63          	bne	a4,a5,57e0 <ee_vsprintf+0x3fc>
    57cc:	00800793          	li	a5,8
    57d0:	fcf42a23          	sw	a5,-44(s0)
    57d4:	fd842783          	lw	a5,-40(s0)
    57d8:	0017e793          	or	a5,a5,1
    57dc:	fcf42c23          	sw	a5,-40(s0)
    57e0:	fb442783          	lw	a5,-76(s0)
    57e4:	00478713          	add	a4,a5,4
    57e8:	fae42a23          	sw	a4,-76(s0)
    57ec:	0007a783          	lw	a5,0(a5)
    57f0:	00078593          	mv	a1,a5
    57f4:	fd842783          	lw	a5,-40(s0)
    57f8:	fd042703          	lw	a4,-48(s0)
    57fc:	fd442683          	lw	a3,-44(s0)
    5800:	01000613          	li	a2,16
    5804:	fe042503          	lw	a0,-32(s0)
    5808:	a0dfe0ef          	jal	4214 <number>
    580c:	fea42023          	sw	a0,-32(s0)
    5810:	1e00006f          	j	59f0 <ee_vsprintf+0x60c>
    5814:	fd842783          	lw	a5,-40(s0)
    5818:	0407e793          	or	a5,a5,64
    581c:	fcf42c23          	sw	a5,-40(s0)
    5820:	fcc42703          	lw	a4,-52(s0)
    5824:	06c00793          	li	a5,108
    5828:	02f71a63          	bne	a4,a5,585c <ee_vsprintf+0x478>
    582c:	fb442783          	lw	a5,-76(s0)
    5830:	00478713          	add	a4,a5,4
    5834:	fae42a23          	sw	a4,-76(s0)
    5838:	0007a783          	lw	a5,0(a5)
    583c:	fd842703          	lw	a4,-40(s0)
    5840:	fd042683          	lw	a3,-48(s0)
    5844:	fd442603          	lw	a2,-44(s0)
    5848:	00078593          	mv	a1,a5
    584c:	fe042503          	lw	a0,-32(s0)
    5850:	d5dfe0ef          	jal	45ac <eaddr>
    5854:	fea42023          	sw	a0,-32(s0)
    5858:	1980006f          	j	59f0 <ee_vsprintf+0x60c>
    585c:	fb442783          	lw	a5,-76(s0)
    5860:	00478713          	add	a4,a5,4
    5864:	fae42a23          	sw	a4,-76(s0)
    5868:	0007a783          	lw	a5,0(a5)
    586c:	fd842703          	lw	a4,-40(s0)
    5870:	fd042683          	lw	a3,-48(s0)
    5874:	fd442603          	lw	a2,-44(s0)
    5878:	00078593          	mv	a1,a5
    587c:	fe042503          	lw	a0,-32(s0)
    5880:	ee1fe0ef          	jal	4760 <iaddr>
    5884:	fea42023          	sw	a0,-32(s0)
    5888:	1680006f          	j	59f0 <ee_vsprintf+0x60c>
    588c:	00800793          	li	a5,8
    5890:	fef42223          	sw	a5,-28(s0)
    5894:	0e00006f          	j	5974 <ee_vsprintf+0x590>
    5898:	fd842783          	lw	a5,-40(s0)
    589c:	0407e793          	or	a5,a5,64
    58a0:	fcf42c23          	sw	a5,-40(s0)
    58a4:	01000793          	li	a5,16
    58a8:	fef42223          	sw	a5,-28(s0)
    58ac:	0c80006f          	j	5974 <ee_vsprintf+0x590>
    58b0:	fd842783          	lw	a5,-40(s0)
    58b4:	0027e793          	or	a5,a5,2
    58b8:	fcf42c23          	sw	a5,-40(s0)
    58bc:	0b40006f          	j	5970 <ee_vsprintf+0x58c>
    58c0:	fb442783          	lw	a5,-76(s0)
    58c4:	00778793          	add	a5,a5,7
    58c8:	ff87f793          	and	a5,a5,-8
    58cc:	00878713          	add	a4,a5,8
    58d0:	fae42a23          	sw	a4,-76(s0)
    58d4:	0007a503          	lw	a0,0(a5)
    58d8:	0047a583          	lw	a1,4(a5)
    58dc:	fb842783          	lw	a5,-72(s0)
    58e0:	0007c703          	lbu	a4,0(a5)
    58e4:	fd842783          	lw	a5,-40(s0)
    58e8:	0027e793          	or	a5,a5,2
    58ec:	00078813          	mv	a6,a5
    58f0:	00070793          	mv	a5,a4
    58f4:	fd042703          	lw	a4,-48(s0)
    58f8:	fd442683          	lw	a3,-44(s0)
    58fc:	00058613          	mv	a2,a1
    5900:	00050593          	mv	a1,a0
    5904:	fe042503          	lw	a0,-32(s0)
    5908:	831ff0ef          	jal	5138 <flt>
    590c:	fea42023          	sw	a0,-32(s0)
    5910:	0e00006f          	j	59f0 <ee_vsprintf+0x60c>
    5914:	fb842783          	lw	a5,-72(s0)
    5918:	0007c703          	lbu	a4,0(a5)
    591c:	02500793          	li	a5,37
    5920:	00f70c63          	beq	a4,a5,5938 <ee_vsprintf+0x554>
    5924:	fe042783          	lw	a5,-32(s0)
    5928:	00178713          	add	a4,a5,1
    592c:	fee42023          	sw	a4,-32(s0)
    5930:	02500713          	li	a4,37
    5934:	00e78023          	sb	a4,0(a5)
    5938:	fb842783          	lw	a5,-72(s0)
    593c:	0007c783          	lbu	a5,0(a5)
    5940:	02078063          	beqz	a5,5960 <ee_vsprintf+0x57c>
    5944:	fb842703          	lw	a4,-72(s0)
    5948:	fe042783          	lw	a5,-32(s0)
    594c:	00178693          	add	a3,a5,1
    5950:	fed42023          	sw	a3,-32(s0)
    5954:	00074703          	lbu	a4,0(a4)
    5958:	00e78023          	sb	a4,0(a5)
    595c:	0940006f          	j	59f0 <ee_vsprintf+0x60c>
    5960:	fb842783          	lw	a5,-72(s0)
    5964:	fff78793          	add	a5,a5,-1
    5968:	faf42c23          	sw	a5,-72(s0)
    596c:	0840006f          	j	59f0 <ee_vsprintf+0x60c>
    5970:	00000013          	nop
    5974:	fcc42703          	lw	a4,-52(s0)
    5978:	06c00793          	li	a5,108
    597c:	00f71e63          	bne	a4,a5,5998 <ee_vsprintf+0x5b4>
    5980:	fb442783          	lw	a5,-76(s0)
    5984:	00478713          	add	a4,a5,4
    5988:	fae42a23          	sw	a4,-76(s0)
    598c:	0007a783          	lw	a5,0(a5)
    5990:	fef42623          	sw	a5,-20(s0)
    5994:	03c0006f          	j	59d0 <ee_vsprintf+0x5ec>
    5998:	fd842783          	lw	a5,-40(s0)
    599c:	0027f793          	and	a5,a5,2
    59a0:	00078e63          	beqz	a5,59bc <ee_vsprintf+0x5d8>
    59a4:	fb442783          	lw	a5,-76(s0)
    59a8:	00478713          	add	a4,a5,4
    59ac:	fae42a23          	sw	a4,-76(s0)
    59b0:	0007a783          	lw	a5,0(a5)
    59b4:	fef42623          	sw	a5,-20(s0)
    59b8:	0180006f          	j	59d0 <ee_vsprintf+0x5ec>
    59bc:	fb442783          	lw	a5,-76(s0)
    59c0:	00478713          	add	a4,a5,4
    59c4:	fae42a23          	sw	a4,-76(s0)
    59c8:	0007a783          	lw	a5,0(a5)
    59cc:	fef42623          	sw	a5,-20(s0)
    59d0:	fec42583          	lw	a1,-20(s0)
    59d4:	fd842783          	lw	a5,-40(s0)
    59d8:	fd042703          	lw	a4,-48(s0)
    59dc:	fd442683          	lw	a3,-44(s0)
    59e0:	fe442603          	lw	a2,-28(s0)
    59e4:	fe042503          	lw	a0,-32(s0)
    59e8:	82dfe0ef          	jal	4214 <number>
    59ec:	fea42023          	sw	a0,-32(s0)
    59f0:	fb842783          	lw	a5,-72(s0)
    59f4:	00178793          	add	a5,a5,1
    59f8:	faf42c23          	sw	a5,-72(s0)
    59fc:	fb842783          	lw	a5,-72(s0)
    5a00:	0007c783          	lbu	a5,0(a5)
    5a04:	a00794e3          	bnez	a5,540c <ee_vsprintf+0x28>
    5a08:	fe042783          	lw	a5,-32(s0)
    5a0c:	00078023          	sb	zero,0(a5)
    5a10:	fe042703          	lw	a4,-32(s0)
    5a14:	fbc42783          	lw	a5,-68(s0)
    5a18:	40f707b3          	sub	a5,a4,a5
    5a1c:	00078513          	mv	a0,a5
    5a20:	04c12083          	lw	ra,76(sp)
    5a24:	04812403          	lw	s0,72(sp)
    5a28:	05010113          	add	sp,sp,80
    5a2c:	00008067          	ret

00005a30 <uart_send_char>:
    5a30:	fd010113          	add	sp,sp,-48
    5a34:	02812623          	sw	s0,44(sp)
    5a38:	03010413          	add	s0,sp,48
    5a3c:	00050793          	mv	a5,a0
    5a40:	fcf40fa3          	sb	a5,-33(s0)
    5a44:	060007b7          	lui	a5,0x6000
    5a48:	fef42623          	sw	a5,-20(s0)
    5a4c:	00000013          	nop
    5a50:	fec42783          	lw	a5,-20(s0)
    5a54:	00878793          	add	a5,a5,8 # 6000008 <__subdf3+0x5ff8418>
    5a58:	0007c783          	lbu	a5,0(a5)
    5a5c:	0ff7f793          	zext.b	a5,a5
    5a60:	fe0798e3          	bnez	a5,5a50 <uart_send_char+0x20>
    5a64:	fec42783          	lw	a5,-20(s0)
    5a68:	fdf44703          	lbu	a4,-33(s0)
    5a6c:	00e78023          	sb	a4,0(a5)
    5a70:	00000013          	nop
    5a74:	fec42783          	lw	a5,-20(s0)
    5a78:	00878793          	add	a5,a5,8
    5a7c:	0007c783          	lbu	a5,0(a5)
    5a80:	0ff7f793          	zext.b	a5,a5
    5a84:	fe0798e3          	bnez	a5,5a74 <uart_send_char+0x44>
    5a88:	00000013          	nop
    5a8c:	00000013          	nop
    5a90:	02c12403          	lw	s0,44(sp)
    5a94:	03010113          	add	sp,sp,48
    5a98:	00008067          	ret

00005a9c <ee_printf>:
    5a9c:	bb010113          	add	sp,sp,-1104
    5aa0:	42112623          	sw	ra,1068(sp)
    5aa4:	42812423          	sw	s0,1064(sp)
    5aa8:	43010413          	add	s0,sp,1072
    5aac:	bca42e23          	sw	a0,-1060(s0)
    5ab0:	00b42223          	sw	a1,4(s0)
    5ab4:	00c42423          	sw	a2,8(s0)
    5ab8:	00d42623          	sw	a3,12(s0)
    5abc:	00e42823          	sw	a4,16(s0)
    5ac0:	00f42a23          	sw	a5,20(s0)
    5ac4:	01042c23          	sw	a6,24(s0)
    5ac8:	01142e23          	sw	a7,28(s0)
    5acc:	fe042423          	sw	zero,-24(s0)
    5ad0:	02040793          	add	a5,s0,32
    5ad4:	bcf42c23          	sw	a5,-1064(s0)
    5ad8:	bd842783          	lw	a5,-1064(s0)
    5adc:	fe478793          	add	a5,a5,-28
    5ae0:	bef42223          	sw	a5,-1052(s0)
    5ae4:	be442703          	lw	a4,-1052(s0)
    5ae8:	be840793          	add	a5,s0,-1048
    5aec:	00070613          	mv	a2,a4
    5af0:	bdc42583          	lw	a1,-1060(s0)
    5af4:	00078513          	mv	a0,a5
    5af8:	8edff0ef          	jal	53e4 <ee_vsprintf>
    5afc:	be840793          	add	a5,s0,-1048
    5b00:	fef42623          	sw	a5,-20(s0)
    5b04:	02c0006f          	j	5b30 <ee_printf+0x94>
    5b08:	fec42783          	lw	a5,-20(s0)
    5b0c:	0007c783          	lbu	a5,0(a5)
    5b10:	00078513          	mv	a0,a5
    5b14:	f1dff0ef          	jal	5a30 <uart_send_char>
    5b18:	fe842783          	lw	a5,-24(s0)
    5b1c:	00178793          	add	a5,a5,1
    5b20:	fef42423          	sw	a5,-24(s0)
    5b24:	fec42783          	lw	a5,-20(s0)
    5b28:	00178793          	add	a5,a5,1
    5b2c:	fef42623          	sw	a5,-20(s0)
    5b30:	fec42783          	lw	a5,-20(s0)
    5b34:	0007c783          	lbu	a5,0(a5)
    5b38:	fc0798e3          	bnez	a5,5b08 <ee_printf+0x6c>
    5b3c:	fe842783          	lw	a5,-24(s0)
    5b40:	00078513          	mv	a0,a5
    5b44:	42c12083          	lw	ra,1068(sp)
    5b48:	42812403          	lw	s0,1064(sp)
    5b4c:	45010113          	add	sp,sp,1104
    5b50:	00008067          	ret

00005b54 <__adddf3>:
    5b54:	001007b7          	lui	a5,0x100
    5b58:	fe010113          	add	sp,sp,-32
    5b5c:	fff78e93          	add	t4,a5,-1 # fffff <__subdf3+0xf840f>
    5b60:	00bef833          	and	a6,t4,a1
    5b64:	00def7b3          	and	a5,t4,a3
    5b68:	0146d313          	srl	t1,a3,0x14
    5b6c:	01212823          	sw	s2,16(sp)
    5b70:	0145d913          	srl	s2,a1,0x14
    5b74:	00379793          	sll	a5,a5,0x3
    5b78:	00812c23          	sw	s0,24(sp)
    5b7c:	00381813          	sll	a6,a6,0x3
    5b80:	01f5d413          	srl	s0,a1,0x1f
    5b84:	01d55713          	srl	a4,a0,0x1d
    5b88:	01d65893          	srl	a7,a2,0x1d
    5b8c:	7ff97913          	and	s2,s2,2047
    5b90:	7ff37313          	and	t1,t1,2047
    5b94:	00112e23          	sw	ra,28(sp)
    5b98:	00912a23          	sw	s1,20(sp)
    5b9c:	01312623          	sw	s3,12(sp)
    5ba0:	01f6d693          	srl	a3,a3,0x1f
    5ba4:	00f8e8b3          	or	a7,a7,a5
    5ba8:	01076733          	or	a4,a4,a6
    5bac:	00351593          	sll	a1,a0,0x3
    5bb0:	00361f13          	sll	t5,a2,0x3
    5bb4:	406907b3          	sub	a5,s2,t1
    5bb8:	1ed40463          	beq	s0,a3,5da0 <__adddf3+0x24c>
    5bbc:	16f05263          	blez	a5,5d20 <__adddf3+0x1cc>
    5bc0:	28030663          	beqz	t1,5e4c <__adddf3+0x2f8>
    5bc4:	7ff00693          	li	a3,2047
    5bc8:	42d90663          	beq	s2,a3,5ff4 <__adddf3+0x4a0>
    5bcc:	03800693          	li	a3,56
    5bd0:	00100613          	li	a2,1
    5bd4:	02f6ce63          	blt	a3,a5,5c10 <__adddf3+0xbc>
    5bd8:	008006b7          	lui	a3,0x800
    5bdc:	00d8e8b3          	or	a7,a7,a3
    5be0:	01f00693          	li	a3,31
    5be4:	52f6ce63          	blt	a3,a5,6120 <__adddf3+0x5cc>
    5be8:	02000693          	li	a3,32
    5bec:	40f686b3          	sub	a3,a3,a5
    5bf0:	00d89633          	sll	a2,a7,a3
    5bf4:	00ff5533          	srl	a0,t5,a5
    5bf8:	00df16b3          	sll	a3,t5,a3
    5bfc:	00a66633          	or	a2,a2,a0
    5c00:	00d036b3          	snez	a3,a3
    5c04:	00f8d8b3          	srl	a7,a7,a5
    5c08:	00d66633          	or	a2,a2,a3
    5c0c:	41170733          	sub	a4,a4,a7
    5c10:	40c58633          	sub	a2,a1,a2
    5c14:	00c5b5b3          	sltu	a1,a1,a2
    5c18:	00060493          	mv	s1,a2
    5c1c:	40b709b3          	sub	s3,a4,a1
    5c20:	00899793          	sll	a5,s3,0x8
    5c24:	3207da63          	bgez	a5,5f58 <__adddf3+0x404>
    5c28:	008007b7          	lui	a5,0x800
    5c2c:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f840f>
    5c30:	00f9f9b3          	and	s3,s3,a5
    5c34:	2c098863          	beqz	s3,5f04 <__adddf3+0x3b0>
    5c38:	00098513          	mv	a0,s3
    5c3c:	541010ef          	jal	797c <__clzsi2>
    5c40:	ff850793          	add	a5,a0,-8
    5c44:	02000693          	li	a3,32
    5c48:	40f68733          	sub	a4,a3,a5
    5c4c:	00e4d733          	srl	a4,s1,a4
    5c50:	00f999b3          	sll	s3,s3,a5
    5c54:	01376733          	or	a4,a4,s3
    5c58:	00f494b3          	sll	s1,s1,a5
    5c5c:	4b27c863          	blt	a5,s2,610c <__adddf3+0x5b8>
    5c60:	412787b3          	sub	a5,a5,s2
    5c64:	00178793          	add	a5,a5,1
    5c68:	40f686b3          	sub	a3,a3,a5
    5c6c:	00d49633          	sll	a2,s1,a3
    5c70:	00f4d9b3          	srl	s3,s1,a5
    5c74:	00c03633          	snez	a2,a2
    5c78:	01366633          	or	a2,a2,s3
    5c7c:	00d716b3          	sll	a3,a4,a3
    5c80:	00c6e4b3          	or	s1,a3,a2
    5c84:	00f759b3          	srl	s3,a4,a5
    5c88:	00000913          	li	s2,0
    5c8c:	0074f793          	and	a5,s1,7
    5c90:	02078063          	beqz	a5,5cb0 <__adddf3+0x15c>
    5c94:	00f4f793          	and	a5,s1,15
    5c98:	00400713          	li	a4,4
    5c9c:	00e78a63          	beq	a5,a4,5cb0 <__adddf3+0x15c>
    5ca0:	00448793          	add	a5,s1,4
    5ca4:	0097b633          	sltu	a2,a5,s1
    5ca8:	00c989b3          	add	s3,s3,a2
    5cac:	00078493          	mv	s1,a5
    5cb0:	00899793          	sll	a5,s3,0x8
    5cb4:	6e07da63          	bgez	a5,63a8 <__adddf3+0x854>
    5cb8:	00190793          	add	a5,s2,1
    5cbc:	7ff00713          	li	a4,2047
    5cc0:	00040e13          	mv	t3,s0
    5cc4:	2ae78663          	beq	a5,a4,5f70 <__adddf3+0x41c>
    5cc8:	ff800737          	lui	a4,0xff800
    5ccc:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f840f>
    5cd0:	00e9f733          	and	a4,s3,a4
    5cd4:	7ff7f793          	and	a5,a5,2047
    5cd8:	01d71813          	sll	a6,a4,0x1d
    5cdc:	0034d613          	srl	a2,s1,0x3
    5ce0:	00971713          	sll	a4,a4,0x9
    5ce4:	00c86833          	or	a6,a6,a2
    5ce8:	00c75713          	srl	a4,a4,0xc
    5cec:	01c12083          	lw	ra,28(sp)
    5cf0:	01812403          	lw	s0,24(sp)
    5cf4:	01479793          	sll	a5,a5,0x14
    5cf8:	00e7e7b3          	or	a5,a5,a4
    5cfc:	01fe1713          	sll	a4,t3,0x1f
    5d00:	00e7e7b3          	or	a5,a5,a4
    5d04:	01412483          	lw	s1,20(sp)
    5d08:	01012903          	lw	s2,16(sp)
    5d0c:	00c12983          	lw	s3,12(sp)
    5d10:	00080513          	mv	a0,a6
    5d14:	00078593          	mv	a1,a5
    5d18:	02010113          	add	sp,sp,32
    5d1c:	00008067          	ret
    5d20:	14078c63          	beqz	a5,5e78 <__adddf3+0x324>
    5d24:	412307b3          	sub	a5,t1,s2
    5d28:	3c091263          	bnez	s2,60ec <__adddf3+0x598>
    5d2c:	00b76533          	or	a0,a4,a1
    5d30:	4c050463          	beqz	a0,61f8 <__adddf3+0x6a4>
    5d34:	fff78513          	add	a0,a5,-1
    5d38:	60050263          	beqz	a0,633c <__adddf3+0x7e8>
    5d3c:	7ff00813          	li	a6,2047
    5d40:	57078663          	beq	a5,a6,62ac <__adddf3+0x758>
    5d44:	03800793          	li	a5,56
    5d48:	00100613          	li	a2,1
    5d4c:	02a7cc63          	blt	a5,a0,5d84 <__adddf3+0x230>
    5d50:	00050793          	mv	a5,a0
    5d54:	01f00613          	li	a2,31
    5d58:	56f64c63          	blt	a2,a5,62d0 <__adddf3+0x77c>
    5d5c:	02000513          	li	a0,32
    5d60:	40f50533          	sub	a0,a0,a5
    5d64:	00a71633          	sll	a2,a4,a0
    5d68:	00f5d833          	srl	a6,a1,a5
    5d6c:	00a59533          	sll	a0,a1,a0
    5d70:	01066633          	or	a2,a2,a6
    5d74:	00a03533          	snez	a0,a0
    5d78:	00f75733          	srl	a4,a4,a5
    5d7c:	00a66633          	or	a2,a2,a0
    5d80:	40e888b3          	sub	a7,a7,a4
    5d84:	40cf0633          	sub	a2,t5,a2
    5d88:	00cf3733          	sltu	a4,t5,a2
    5d8c:	00060493          	mv	s1,a2
    5d90:	40e889b3          	sub	s3,a7,a4
    5d94:	00030913          	mv	s2,t1
    5d98:	00068413          	mv	s0,a3
    5d9c:	e85ff06f          	j	5c20 <__adddf3+0xcc>
    5da0:	1ef05063          	blez	a5,5f80 <__adddf3+0x42c>
    5da4:	14031063          	bnez	t1,5ee4 <__adddf3+0x390>
    5da8:	01e8e6b3          	or	a3,a7,t5
    5dac:	26068c63          	beqz	a3,6024 <__adddf3+0x4d0>
    5db0:	fff78693          	add	a3,a5,-1
    5db4:	48068063          	beqz	a3,6234 <__adddf3+0x6e0>
    5db8:	7ff00613          	li	a2,2047
    5dbc:	22c78c63          	beq	a5,a2,5ff4 <__adddf3+0x4a0>
    5dc0:	03800793          	li	a5,56
    5dc4:	00100993          	li	s3,1
    5dc8:	02d7cc63          	blt	a5,a3,5e00 <__adddf3+0x2ac>
    5dcc:	00068793          	mv	a5,a3
    5dd0:	01f00693          	li	a3,31
    5dd4:	4af6c063          	blt	a3,a5,6274 <__adddf3+0x720>
    5dd8:	02000693          	li	a3,32
    5ddc:	40f686b3          	sub	a3,a3,a5
    5de0:	00d899b3          	sll	s3,a7,a3
    5de4:	00ff5633          	srl	a2,t5,a5
    5de8:	00df16b3          	sll	a3,t5,a3
    5dec:	00c9e9b3          	or	s3,s3,a2
    5df0:	00d036b3          	snez	a3,a3
    5df4:	00f8d8b3          	srl	a7,a7,a5
    5df8:	00d9e9b3          	or	s3,s3,a3
    5dfc:	01170733          	add	a4,a4,a7
    5e00:	00b985b3          	add	a1,s3,a1
    5e04:	0135b9b3          	sltu	s3,a1,s3
    5e08:	00058493          	mv	s1,a1
    5e0c:	00e989b3          	add	s3,s3,a4
    5e10:	00899793          	sll	a5,s3,0x8
    5e14:	1407d263          	bgez	a5,5f58 <__adddf3+0x404>
    5e18:	00190913          	add	s2,s2,1
    5e1c:	7ff00793          	li	a5,2047
    5e20:	36f90c63          	beq	s2,a5,6198 <__adddf3+0x644>
    5e24:	ff8007b7          	lui	a5,0xff800
    5e28:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f840f>
    5e2c:	0014f613          	and	a2,s1,1
    5e30:	00f9f7b3          	and	a5,s3,a5
    5e34:	0014d713          	srl	a4,s1,0x1
    5e38:	00c76733          	or	a4,a4,a2
    5e3c:	01f79613          	sll	a2,a5,0x1f
    5e40:	00e664b3          	or	s1,a2,a4
    5e44:	0017d993          	srl	s3,a5,0x1
    5e48:	e45ff06f          	j	5c8c <__adddf3+0x138>
    5e4c:	01e8e6b3          	or	a3,a7,t5
    5e50:	1c068a63          	beqz	a3,6024 <__adddf3+0x4d0>
    5e54:	fff78693          	add	a3,a5,-1
    5e58:	40068063          	beqz	a3,6258 <__adddf3+0x704>
    5e5c:	7ff00613          	li	a2,2047
    5e60:	18c78a63          	beq	a5,a2,5ff4 <__adddf3+0x4a0>
    5e64:	03800793          	li	a5,56
    5e68:	00100613          	li	a2,1
    5e6c:	dad7c2e3          	blt	a5,a3,5c10 <__adddf3+0xbc>
    5e70:	00068793          	mv	a5,a3
    5e74:	d6dff06f          	j	5be0 <__adddf3+0x8c>
    5e78:	00190813          	add	a6,s2,1
    5e7c:	7fe87813          	and	a6,a6,2046
    5e80:	22081c63          	bnez	a6,60b8 <__adddf3+0x564>
    5e84:	00b76333          	or	t1,a4,a1
    5e88:	01e8e833          	or	a6,a7,t5
    5e8c:	38091063          	bnez	s2,620c <__adddf3+0x6b8>
    5e90:	46030e63          	beqz	t1,630c <__adddf3+0x7b8>
    5e94:	40080663          	beqz	a6,62a0 <__adddf3+0x74c>
    5e98:	41e589b3          	sub	s3,a1,t5
    5e9c:	0135b533          	sltu	a0,a1,s3
    5ea0:	41170633          	sub	a2,a4,a7
    5ea4:	40a60633          	sub	a2,a2,a0
    5ea8:	00861513          	sll	a0,a2,0x8
    5eac:	50055e63          	bgez	a0,63c8 <__adddf3+0x874>
    5eb0:	40bf05b3          	sub	a1,t5,a1
    5eb4:	40e88733          	sub	a4,a7,a4
    5eb8:	00bf3f33          	sltu	t5,t5,a1
    5ebc:	41e70733          	sub	a4,a4,t5
    5ec0:	00871613          	sll	a2,a4,0x8
    5ec4:	00058493          	mv	s1,a1
    5ec8:	52065e63          	bgez	a2,6404 <__adddf3+0x8b0>
    5ecc:	ff8007b7          	lui	a5,0xff800
    5ed0:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f840f>
    5ed4:	00f77733          	and	a4,a4,a5
    5ed8:	00068e13          	mv	t3,a3
    5edc:	00100793          	li	a5,1
    5ee0:	df9ff06f          	j	5cd8 <__adddf3+0x184>
    5ee4:	7ff00693          	li	a3,2047
    5ee8:	10d90663          	beq	s2,a3,5ff4 <__adddf3+0x4a0>
    5eec:	03800693          	li	a3,56
    5ef0:	00100993          	li	s3,1
    5ef4:	f0f6c6e3          	blt	a3,a5,5e00 <__adddf3+0x2ac>
    5ef8:	008006b7          	lui	a3,0x800
    5efc:	00d8e8b3          	or	a7,a7,a3
    5f00:	ed1ff06f          	j	5dd0 <__adddf3+0x27c>
    5f04:	00048513          	mv	a0,s1
    5f08:	275010ef          	jal	797c <__clzsi2>
    5f0c:	01850793          	add	a5,a0,24
    5f10:	01f00693          	li	a3,31
    5f14:	d2f6d8e3          	bge	a3,a5,5c44 <__adddf3+0xf0>
    5f18:	ff850713          	add	a4,a0,-8
    5f1c:	00e49733          	sll	a4,s1,a4
    5f20:	2327c663          	blt	a5,s2,614c <__adddf3+0x5f8>
    5f24:	41278933          	sub	s2,a5,s2
    5f28:	00190793          	add	a5,s2,1
    5f2c:	48f6d663          	bge	a3,a5,63b8 <__adddf3+0x864>
    5f30:	fe190913          	add	s2,s2,-31
    5f34:	02000693          	li	a3,32
    5f38:	012754b3          	srl	s1,a4,s2
    5f3c:	00d78c63          	beq	a5,a3,5f54 <__adddf3+0x400>
    5f40:	04000693          	li	a3,64
    5f44:	40f687b3          	sub	a5,a3,a5
    5f48:	00f71733          	sll	a4,a4,a5
    5f4c:	00e03733          	snez	a4,a4
    5f50:	00e4e4b3          	or	s1,s1,a4
    5f54:	00000913          	li	s2,0
    5f58:	0074f793          	and	a5,s1,7
    5f5c:	d2079ce3          	bnez	a5,5c94 <__adddf3+0x140>
    5f60:	00090793          	mv	a5,s2
    5f64:	0034d613          	srl	a2,s1,0x3
    5f68:	00098713          	mv	a4,s3
    5f6c:	0c00006f          	j	602c <__adddf3+0x4d8>
    5f70:	7ff00793          	li	a5,2047
    5f74:	00000713          	li	a4,0
    5f78:	00000813          	li	a6,0
    5f7c:	d71ff06f          	j	5cec <__adddf3+0x198>
    5f80:	0c078a63          	beqz	a5,6054 <__adddf3+0x500>
    5f84:	412307b3          	sub	a5,t1,s2
    5f88:	1e090263          	beqz	s2,616c <__adddf3+0x618>
    5f8c:	7ff00693          	li	a3,2047
    5f90:	32d30863          	beq	t1,a3,62c0 <__adddf3+0x76c>
    5f94:	03800693          	li	a3,56
    5f98:	00100993          	li	s3,1
    5f9c:	02f6ce63          	blt	a3,a5,5fd8 <__adddf3+0x484>
    5fa0:	008006b7          	lui	a3,0x800
    5fa4:	00d76733          	or	a4,a4,a3
    5fa8:	01f00693          	li	a3,31
    5fac:	3cf6c863          	blt	a3,a5,637c <__adddf3+0x828>
    5fb0:	02000693          	li	a3,32
    5fb4:	40f686b3          	sub	a3,a3,a5
    5fb8:	00d719b3          	sll	s3,a4,a3
    5fbc:	00f5d633          	srl	a2,a1,a5
    5fc0:	00d596b3          	sll	a3,a1,a3
    5fc4:	00c9e9b3          	or	s3,s3,a2
    5fc8:	00d036b3          	snez	a3,a3
    5fcc:	00f75733          	srl	a4,a4,a5
    5fd0:	00d9e9b3          	or	s3,s3,a3
    5fd4:	00e888b3          	add	a7,a7,a4
    5fd8:	01e98733          	add	a4,s3,t5
    5fdc:	013739b3          	sltu	s3,a4,s3
    5fe0:	00070493          	mv	s1,a4
    5fe4:	011989b3          	add	s3,s3,a7
    5fe8:	00030913          	mv	s2,t1
    5fec:	e25ff06f          	j	5e10 <__adddf3+0x2bc>
    5ff0:	02081063          	bnez	a6,6010 <__adddf3+0x4bc>
    5ff4:	00351613          	sll	a2,a0,0x3
    5ff8:	00365613          	srl	a2,a2,0x3
    5ffc:	01d71813          	sll	a6,a4,0x1d
    6000:	00c86833          	or	a6,a6,a2
    6004:	00375713          	srl	a4,a4,0x3
    6008:	01076733          	or	a4,a4,a6
    600c:	18070663          	beqz	a4,6198 <__adddf3+0x644>
    6010:	00000e13          	li	t3,0
    6014:	7ff00793          	li	a5,2047
    6018:	00080737          	lui	a4,0x80
    601c:	00000813          	li	a6,0
    6020:	ccdff06f          	j	5cec <__adddf3+0x198>
    6024:	00351613          	sll	a2,a0,0x3
    6028:	00365613          	srl	a2,a2,0x3
    602c:	01d71813          	sll	a6,a4,0x1d
    6030:	7ff00693          	li	a3,2047
    6034:	00c86833          	or	a6,a6,a2
    6038:	00375713          	srl	a4,a4,0x3
    603c:	fcd786e3          	beq	a5,a3,6008 <__adddf3+0x4b4>
    6040:	00c71713          	sll	a4,a4,0xc
    6044:	00c75713          	srl	a4,a4,0xc
    6048:	7ff7f793          	and	a5,a5,2047
    604c:	00040e13          	mv	t3,s0
    6050:	c9dff06f          	j	5cec <__adddf3+0x198>
    6054:	00190693          	add	a3,s2,1
    6058:	7fe6f813          	and	a6,a3,2046
    605c:	14081863          	bnez	a6,61ac <__adddf3+0x658>
    6060:	00b766b3          	or	a3,a4,a1
    6064:	28091c63          	bnez	s2,62fc <__adddf3+0x7a8>
    6068:	30068263          	beqz	a3,636c <__adddf3+0x818>
    606c:	01e8e6b3          	or	a3,a7,t5
    6070:	22068863          	beqz	a3,62a0 <__adddf3+0x74c>
    6074:	01e587b3          	add	a5,a1,t5
    6078:	00b7b5b3          	sltu	a1,a5,a1
    607c:	01170733          	add	a4,a4,a7
    6080:	00b70733          	add	a4,a4,a1
    6084:	0037d813          	srl	a6,a5,0x3
    6088:	00871793          	sll	a5,a4,0x8
    608c:	00040e13          	mv	t3,s0
    6090:	3407de63          	bgez	a5,63ec <__adddf3+0x898>
    6094:	ff8007b7          	lui	a5,0xff800
    6098:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f840f>
    609c:	00f77733          	and	a4,a4,a5
    60a0:	01d71793          	sll	a5,a4,0x1d
    60a4:	00375713          	srl	a4,a4,0x3
    60a8:	0107e833          	or	a6,a5,a6
    60ac:	01d77733          	and	a4,a4,t4
    60b0:	00100793          	li	a5,1
    60b4:	c39ff06f          	j	5cec <__adddf3+0x198>
    60b8:	41e58833          	sub	a6,a1,t5
    60bc:	0105b7b3          	sltu	a5,a1,a6
    60c0:	411709b3          	sub	s3,a4,a7
    60c4:	40f989b3          	sub	s3,s3,a5
    60c8:	00899793          	sll	a5,s3,0x8
    60cc:	00080493          	mv	s1,a6
    60d0:	1007c663          	bltz	a5,61dc <__adddf3+0x688>
    60d4:	01386833          	or	a6,a6,s3
    60d8:	b4081ee3          	bnez	a6,5c34 <__adddf3+0xe0>
    60dc:	00000e13          	li	t3,0
    60e0:	00000793          	li	a5,0
    60e4:	00000713          	li	a4,0
    60e8:	c05ff06f          	j	5cec <__adddf3+0x198>
    60ec:	7ff00513          	li	a0,2047
    60f0:	1aa30e63          	beq	t1,a0,62ac <__adddf3+0x758>
    60f4:	03800513          	li	a0,56
    60f8:	00100613          	li	a2,1
    60fc:	c8f544e3          	blt	a0,a5,5d84 <__adddf3+0x230>
    6100:	00800637          	lui	a2,0x800
    6104:	00c76733          	or	a4,a4,a2
    6108:	c4dff06f          	j	5d54 <__adddf3+0x200>
    610c:	ff8009b7          	lui	s3,0xff800
    6110:	fff98993          	add	s3,s3,-1 # ff7fffff <__subdf3+0xff7f840f>
    6114:	40f90933          	sub	s2,s2,a5
    6118:	013779b3          	and	s3,a4,s3
    611c:	b71ff06f          	j	5c8c <__adddf3+0x138>
    6120:	fe078693          	add	a3,a5,-32
    6124:	02000613          	li	a2,32
    6128:	00d8d6b3          	srl	a3,a7,a3
    612c:	00c78a63          	beq	a5,a2,6140 <__adddf3+0x5ec>
    6130:	04000613          	li	a2,64
    6134:	40f607b3          	sub	a5,a2,a5
    6138:	00f897b3          	sll	a5,a7,a5
    613c:	00ff6f33          	or	t5,t5,a5
    6140:	01e03633          	snez	a2,t5
    6144:	00d66633          	or	a2,a2,a3
    6148:	ac9ff06f          	j	5c10 <__adddf3+0xbc>
    614c:	ff8006b7          	lui	a3,0xff800
    6150:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f840f>
    6154:	40f907b3          	sub	a5,s2,a5
    6158:	00d77733          	and	a4,a4,a3
    615c:	01d71813          	sll	a6,a4,0x1d
    6160:	01386833          	or	a6,a6,s3
    6164:	00375713          	srl	a4,a4,0x3
    6168:	ed9ff06f          	j	6040 <__adddf3+0x4ec>
    616c:	00b766b3          	or	a3,a4,a1
    6170:	1e068663          	beqz	a3,635c <__adddf3+0x808>
    6174:	fff78693          	add	a3,a5,-1
    6178:	0a068e63          	beqz	a3,6234 <__adddf3+0x6e0>
    617c:	7ff00513          	li	a0,2047
    6180:	14a78063          	beq	a5,a0,62c0 <__adddf3+0x76c>
    6184:	03800793          	li	a5,56
    6188:	00100993          	li	s3,1
    618c:	e4d7c6e3          	blt	a5,a3,5fd8 <__adddf3+0x484>
    6190:	00068793          	mv	a5,a3
    6194:	e15ff06f          	j	5fa8 <__adddf3+0x454>
    6198:	00040e13          	mv	t3,s0
    619c:	7ff00793          	li	a5,2047
    61a0:	00000713          	li	a4,0
    61a4:	00000813          	li	a6,0
    61a8:	b45ff06f          	j	5cec <__adddf3+0x198>
    61ac:	7ff00793          	li	a5,2047
    61b0:	fef684e3          	beq	a3,a5,6198 <__adddf3+0x644>
    61b4:	01e58f33          	add	t5,a1,t5
    61b8:	00bf35b3          	sltu	a1,t5,a1
    61bc:	011707b3          	add	a5,a4,a7
    61c0:	00b787b3          	add	a5,a5,a1
    61c4:	01f79613          	sll	a2,a5,0x1f
    61c8:	001f5f13          	srl	t5,t5,0x1
    61cc:	01e664b3          	or	s1,a2,t5
    61d0:	0017d993          	srl	s3,a5,0x1
    61d4:	00068913          	mv	s2,a3
    61d8:	ab5ff06f          	j	5c8c <__adddf3+0x138>
    61dc:	40bf0633          	sub	a2,t5,a1
    61e0:	40e887b3          	sub	a5,a7,a4
    61e4:	00cf3733          	sltu	a4,t5,a2
    61e8:	00060493          	mv	s1,a2
    61ec:	40e789b3          	sub	s3,a5,a4
    61f0:	00068413          	mv	s0,a3
    61f4:	a41ff06f          	j	5c34 <__adddf3+0xe0>
    61f8:	00361613          	sll	a2,a2,0x3
    61fc:	00365613          	srl	a2,a2,0x3
    6200:	00068413          	mv	s0,a3
    6204:	00088713          	mv	a4,a7
    6208:	e25ff06f          	j	602c <__adddf3+0x4d8>
    620c:	de0312e3          	bnez	t1,5ff0 <__adddf3+0x49c>
    6210:	1c080663          	beqz	a6,63dc <__adddf3+0x888>
    6214:	0038d713          	srl	a4,a7,0x3
    6218:	00361613          	sll	a2,a2,0x3
    621c:	01d89893          	sll	a7,a7,0x1d
    6220:	01176733          	or	a4,a4,a7
    6224:	00365613          	srl	a2,a2,0x3
    6228:	00c76733          	or	a4,a4,a2
    622c:	00068413          	mv	s0,a3
    6230:	dddff06f          	j	600c <__adddf3+0x4b8>
    6234:	01e58f33          	add	t5,a1,t5
    6238:	011708b3          	add	a7,a4,a7
    623c:	00bf35b3          	sltu	a1,t5,a1
    6240:	00b889b3          	add	s3,a7,a1
    6244:	00899793          	sll	a5,s3,0x8
    6248:	000f0493          	mv	s1,t5
    624c:	0e07d463          	bgez	a5,6334 <__adddf3+0x7e0>
    6250:	00200913          	li	s2,2
    6254:	bd1ff06f          	j	5e24 <__adddf3+0x2d0>
    6258:	41e58f33          	sub	t5,a1,t5
    625c:	411708b3          	sub	a7,a4,a7
    6260:	01e5b5b3          	sltu	a1,a1,t5
    6264:	000f0493          	mv	s1,t5
    6268:	40b889b3          	sub	s3,a7,a1
    626c:	00100913          	li	s2,1
    6270:	9b1ff06f          	j	5c20 <__adddf3+0xcc>
    6274:	fe078693          	add	a3,a5,-32
    6278:	02000613          	li	a2,32
    627c:	00d8d6b3          	srl	a3,a7,a3
    6280:	00c78a63          	beq	a5,a2,6294 <__adddf3+0x740>
    6284:	04000613          	li	a2,64
    6288:	40f607b3          	sub	a5,a2,a5
    628c:	00f897b3          	sll	a5,a7,a5
    6290:	00ff6f33          	or	t5,t5,a5
    6294:	01e039b3          	snez	s3,t5
    6298:	00d9e9b3          	or	s3,s3,a3
    629c:	b65ff06f          	j	5e00 <__adddf3+0x2ac>
    62a0:	00351613          	sll	a2,a0,0x3
    62a4:	00365993          	srl	s3,a2,0x3
    62a8:	eb5ff06f          	j	615c <__adddf3+0x608>
    62ac:	00361613          	sll	a2,a2,0x3
    62b0:	00365613          	srl	a2,a2,0x3
    62b4:	00068413          	mv	s0,a3
    62b8:	00088713          	mv	a4,a7
    62bc:	d41ff06f          	j	5ffc <__adddf3+0x4a8>
    62c0:	00361613          	sll	a2,a2,0x3
    62c4:	00365613          	srl	a2,a2,0x3
    62c8:	00088713          	mv	a4,a7
    62cc:	d31ff06f          	j	5ffc <__adddf3+0x4a8>
    62d0:	fe078513          	add	a0,a5,-32
    62d4:	02000613          	li	a2,32
    62d8:	00a75533          	srl	a0,a4,a0
    62dc:	00c78a63          	beq	a5,a2,62f0 <__adddf3+0x79c>
    62e0:	04000613          	li	a2,64
    62e4:	40f607b3          	sub	a5,a2,a5
    62e8:	00f717b3          	sll	a5,a4,a5
    62ec:	00f5e5b3          	or	a1,a1,a5
    62f0:	00b03633          	snez	a2,a1
    62f4:	00a66633          	or	a2,a2,a0
    62f8:	a8dff06f          	j	5d84 <__adddf3+0x230>
    62fc:	fc0682e3          	beqz	a3,62c0 <__adddf3+0x76c>
    6300:	01e8ef33          	or	t5,a7,t5
    6304:	d00f16e3          	bnez	t5,6010 <__adddf3+0x4bc>
    6308:	cedff06f          	j	5ff4 <__adddf3+0x4a0>
    630c:	dc0808e3          	beqz	a6,60dc <__adddf3+0x588>
    6310:	00361813          	sll	a6,a2,0x3
    6314:	01d89793          	sll	a5,a7,0x1d
    6318:	00385813          	srl	a6,a6,0x3
    631c:	0038d713          	srl	a4,a7,0x3
    6320:	00f86833          	or	a6,a6,a5
    6324:	01d77733          	and	a4,a4,t4
    6328:	00068e13          	mv	t3,a3
    632c:	00000793          	li	a5,0
    6330:	9bdff06f          	j	5cec <__adddf3+0x198>
    6334:	00100793          	li	a5,1
    6338:	c2dff06f          	j	5f64 <__adddf3+0x410>
    633c:	40bf05b3          	sub	a1,t5,a1
    6340:	40e888b3          	sub	a7,a7,a4
    6344:	00bf3733          	sltu	a4,t5,a1
    6348:	00058493          	mv	s1,a1
    634c:	40e889b3          	sub	s3,a7,a4
    6350:	00068413          	mv	s0,a3
    6354:	00100913          	li	s2,1
    6358:	8c9ff06f          	j	5c20 <__adddf3+0xcc>
    635c:	00361613          	sll	a2,a2,0x3
    6360:	00365613          	srl	a2,a2,0x3
    6364:	00088713          	mv	a4,a7
    6368:	cc5ff06f          	j	602c <__adddf3+0x4d8>
    636c:	00361613          	sll	a2,a2,0x3
    6370:	00365993          	srl	s3,a2,0x3
    6374:	00088713          	mv	a4,a7
    6378:	de5ff06f          	j	615c <__adddf3+0x608>
    637c:	fe078693          	add	a3,a5,-32
    6380:	02000613          	li	a2,32
    6384:	00d756b3          	srl	a3,a4,a3
    6388:	00c78a63          	beq	a5,a2,639c <__adddf3+0x848>
    638c:	04000613          	li	a2,64
    6390:	40f607b3          	sub	a5,a2,a5
    6394:	00f717b3          	sll	a5,a4,a5
    6398:	00f5e5b3          	or	a1,a1,a5
    639c:	00b039b3          	snez	s3,a1
    63a0:	00d9e9b3          	or	s3,s3,a3
    63a4:	c35ff06f          	j	5fd8 <__adddf3+0x484>
    63a8:	0034d613          	srl	a2,s1,0x3
    63ac:	00090793          	mv	a5,s2
    63b0:	00098713          	mv	a4,s3
    63b4:	c79ff06f          	j	602c <__adddf3+0x4d8>
    63b8:	02000693          	li	a3,32
    63bc:	40f686b3          	sub	a3,a3,a5
    63c0:	00000613          	li	a2,0
    63c4:	8b5ff06f          	j	5c78 <__adddf3+0x124>
    63c8:	00c9e833          	or	a6,s3,a2
    63cc:	d00808e3          	beqz	a6,60dc <__adddf3+0x588>
    63d0:	0039d993          	srl	s3,s3,0x3
    63d4:	00060713          	mv	a4,a2
    63d8:	d85ff06f          	j	615c <__adddf3+0x608>
    63dc:	00000e13          	li	t3,0
    63e0:	7ff00793          	li	a5,2047
    63e4:	00080737          	lui	a4,0x80
    63e8:	905ff06f          	j	5cec <__adddf3+0x198>
    63ec:	01d71793          	sll	a5,a4,0x1d
    63f0:	00375713          	srl	a4,a4,0x3
    63f4:	0107e833          	or	a6,a5,a6
    63f8:	01d77733          	and	a4,a4,t4
    63fc:	00000793          	li	a5,0
    6400:	8edff06f          	j	5cec <__adddf3+0x198>
    6404:	01d71813          	sll	a6,a4,0x1d
    6408:	0035d593          	srl	a1,a1,0x3
    640c:	00b86833          	or	a6,a6,a1
    6410:	00375713          	srl	a4,a4,0x3
    6414:	00068413          	mv	s0,a3
    6418:	c29ff06f          	j	6040 <__adddf3+0x4ec>

0000641c <__divdf3>:
    641c:	fb010113          	add	sp,sp,-80
    6420:	0145d793          	srl	a5,a1,0x14
    6424:	04812423          	sw	s0,72(sp)
    6428:	04912223          	sw	s1,68(sp)
    642c:	05212023          	sw	s2,64(sp)
    6430:	03412c23          	sw	s4,56(sp)
    6434:	03512a23          	sw	s5,52(sp)
    6438:	00c59493          	sll	s1,a1,0xc
    643c:	04112623          	sw	ra,76(sp)
    6440:	03312e23          	sw	s3,60(sp)
    6444:	03612823          	sw	s6,48(sp)
    6448:	03712623          	sw	s7,44(sp)
    644c:	03812423          	sw	s8,40(sp)
    6450:	7ff7f793          	and	a5,a5,2047
    6454:	00050413          	mv	s0,a0
    6458:	00060a13          	mv	s4,a2
    645c:	00068913          	mv	s2,a3
    6460:	00c4d493          	srl	s1,s1,0xc
    6464:	01f5da93          	srl	s5,a1,0x1f
    6468:	18078a63          	beqz	a5,65fc <__divdf3+0x1e0>
    646c:	7ff00713          	li	a4,2047
    6470:	08e78863          	beq	a5,a4,6500 <__divdf3+0xe4>
    6474:	01d55b13          	srl	s6,a0,0x1d
    6478:	00349493          	sll	s1,s1,0x3
    647c:	009b64b3          	or	s1,s6,s1
    6480:	00800737          	lui	a4,0x800
    6484:	00e4eb33          	or	s6,s1,a4
    6488:	00351b93          	sll	s7,a0,0x3
    648c:	c0178993          	add	s3,a5,-1023
    6490:	00000493          	li	s1,0
    6494:	00000c13          	li	s8,0
    6498:	01495793          	srl	a5,s2,0x14
    649c:	00c91413          	sll	s0,s2,0xc
    64a0:	7ff7f793          	and	a5,a5,2047
    64a4:	00c45413          	srl	s0,s0,0xc
    64a8:	01f95913          	srl	s2,s2,0x1f
    64ac:	08078263          	beqz	a5,6530 <__divdf3+0x114>
    64b0:	7ff00713          	li	a4,2047
    64b4:	18e78a63          	beq	a5,a4,6648 <__divdf3+0x22c>
    64b8:	00341413          	sll	s0,s0,0x3
    64bc:	01da5713          	srl	a4,s4,0x1d
    64c0:	00876733          	or	a4,a4,s0
    64c4:	c0178793          	add	a5,a5,-1023
    64c8:	00800437          	lui	s0,0x800
    64cc:	40f989b3          	sub	s3,s3,a5
    64d0:	00876433          	or	s0,a4,s0
    64d4:	003a1813          	sll	a6,s4,0x3
    64d8:	00000793          	li	a5,0
    64dc:	00f00713          	li	a4,15
    64e0:	012aca33          	xor	s4,s5,s2
    64e4:	24976463          	bltu	a4,s1,672c <__divdf3+0x310>
    64e8:	79c00693          	li	a3,1948
    64ec:	00249493          	sll	s1,s1,0x2
    64f0:	00d484b3          	add	s1,s1,a3
    64f4:	0004a703          	lw	a4,0(s1)
    64f8:	00d70733          	add	a4,a4,a3
    64fc:	00070067          	jr	a4 # 800000 <__subdf3+0x7f8410>
    6500:	00a4eb33          	or	s6,s1,a0
    6504:	1c0b1e63          	bnez	s6,66e0 <__divdf3+0x2c4>
    6508:	01495793          	srl	a5,s2,0x14
    650c:	00c91413          	sll	s0,s2,0xc
    6510:	7ff7f793          	and	a5,a5,2047
    6514:	00000b93          	li	s7,0
    6518:	00800493          	li	s1,8
    651c:	7ff00993          	li	s3,2047
    6520:	00200c13          	li	s8,2
    6524:	00c45413          	srl	s0,s0,0xc
    6528:	01f95913          	srl	s2,s2,0x1f
    652c:	f80792e3          	bnez	a5,64b0 <__divdf3+0x94>
    6530:	01446833          	or	a6,s0,s4
    6534:	1c080263          	beqz	a6,66f8 <__divdf3+0x2dc>
    6538:	5c040663          	beqz	s0,6b04 <__divdf3+0x6e8>
    653c:	00040513          	mv	a0,s0
    6540:	43c010ef          	jal	797c <__clzsi2>
    6544:	00050793          	mv	a5,a0
    6548:	ff550693          	add	a3,a0,-11
    654c:	01d00713          	li	a4,29
    6550:	ff878813          	add	a6,a5,-8
    6554:	40d70733          	sub	a4,a4,a3
    6558:	01041433          	sll	s0,s0,a6
    655c:	00ea5733          	srl	a4,s4,a4
    6560:	00876433          	or	s0,a4,s0
    6564:	010a1833          	sll	a6,s4,a6
    6568:	013787b3          	add	a5,a5,s3
    656c:	3f378993          	add	s3,a5,1011
    6570:	00000793          	li	a5,0
    6574:	f69ff06f          	j	64dc <__divdf3+0xc0>
    6578:	40f70733          	sub	a4,a4,a5
    657c:	03800693          	li	a3,56
    6580:	60e6d063          	bge	a3,a4,6b80 <__divdf3+0x764>
    6584:	00000793          	li	a5,0
    6588:	00000693          	li	a3,0
    658c:	00000713          	li	a4,0
    6590:	04c12083          	lw	ra,76(sp)
    6594:	04812403          	lw	s0,72(sp)
    6598:	01479793          	sll	a5,a5,0x14
    659c:	00d7e7b3          	or	a5,a5,a3
    65a0:	01fa1693          	sll	a3,s4,0x1f
    65a4:	00d7e7b3          	or	a5,a5,a3
    65a8:	04412483          	lw	s1,68(sp)
    65ac:	04012903          	lw	s2,64(sp)
    65b0:	03c12983          	lw	s3,60(sp)
    65b4:	03812a03          	lw	s4,56(sp)
    65b8:	03412a83          	lw	s5,52(sp)
    65bc:	03012b03          	lw	s6,48(sp)
    65c0:	02c12b83          	lw	s7,44(sp)
    65c4:	02812c03          	lw	s8,40(sp)
    65c8:	00070513          	mv	a0,a4
    65cc:	00078593          	mv	a1,a5
    65d0:	05010113          	add	sp,sp,80
    65d4:	00008067          	ret
    65d8:	7ff00793          	li	a5,2047
    65dc:	00000693          	li	a3,0
    65e0:	00000713          	li	a4,0
    65e4:	fadff06f          	j	6590 <__divdf3+0x174>
    65e8:	00000a13          	li	s4,0
    65ec:	7ff00793          	li	a5,2047
    65f0:	000806b7          	lui	a3,0x80
    65f4:	00000713          	li	a4,0
    65f8:	f99ff06f          	j	6590 <__divdf3+0x174>
    65fc:	00a4eb33          	or	s6,s1,a0
    6600:	100b0c63          	beqz	s6,6718 <__divdf3+0x2fc>
    6604:	52048463          	beqz	s1,6b2c <__divdf3+0x710>
    6608:	00048513          	mv	a0,s1
    660c:	370010ef          	jal	797c <__clzsi2>
    6610:	00050713          	mv	a4,a0
    6614:	ff550793          	add	a5,a0,-11
    6618:	01d00b13          	li	s6,29
    661c:	ff870b93          	add	s7,a4,-8
    6620:	40fb0b33          	sub	s6,s6,a5
    6624:	017494b3          	sll	s1,s1,s7
    6628:	01645b33          	srl	s6,s0,s6
    662c:	009b6b33          	or	s6,s6,s1
    6630:	01741bb3          	sll	s7,s0,s7
    6634:	c0d00793          	li	a5,-1011
    6638:	40e789b3          	sub	s3,a5,a4
    663c:	00000493          	li	s1,0
    6640:	00000c13          	li	s8,0
    6644:	e55ff06f          	j	6498 <__divdf3+0x7c>
    6648:	01446833          	or	a6,s0,s4
    664c:	80198993          	add	s3,s3,-2047
    6650:	0a081c63          	bnez	a6,6708 <__divdf3+0x2ec>
    6654:	0024e493          	or	s1,s1,2
    6658:	00000413          	li	s0,0
    665c:	00200793          	li	a5,2
    6660:	e7dff06f          	j	64dc <__divdf3+0xc0>
    6664:	000a8913          	mv	s2,s5
    6668:	000b0413          	mv	s0,s6
    666c:	000b8813          	mv	a6,s7
    6670:	00200793          	li	a5,2
    6674:	60fc0863          	beq	s8,a5,6c84 <__divdf3+0x868>
    6678:	00300793          	li	a5,3
    667c:	f6fc06e3          	beq	s8,a5,65e8 <__divdf3+0x1cc>
    6680:	00100793          	li	a5,1
    6684:	00090a13          	mv	s4,s2
    6688:	eefc0ee3          	beq	s8,a5,6584 <__divdf3+0x168>
    668c:	3ff98793          	add	a5,s3,1023
    6690:	3cf05263          	blez	a5,6a54 <__divdf3+0x638>
    6694:	00787713          	and	a4,a6,7
    6698:	5c071663          	bnez	a4,6c64 <__divdf3+0x848>
    669c:	00741713          	sll	a4,s0,0x7
    66a0:	00075a63          	bgez	a4,66b4 <__divdf3+0x298>
    66a4:	ff0007b7          	lui	a5,0xff000
    66a8:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff840f>
    66ac:	00f47433          	and	s0,s0,a5
    66b0:	40098793          	add	a5,s3,1024
    66b4:	7fe00713          	li	a4,2046
    66b8:	f2f740e3          	blt	a4,a5,65d8 <__divdf3+0x1bc>
    66bc:	00385813          	srl	a6,a6,0x3
    66c0:	01d41713          	sll	a4,s0,0x1d
    66c4:	00941693          	sll	a3,s0,0x9
    66c8:	01076733          	or	a4,a4,a6
    66cc:	00c6d693          	srl	a3,a3,0xc
    66d0:	7ff7f793          	and	a5,a5,2047
    66d4:	ebdff06f          	j	6590 <__divdf3+0x174>
    66d8:	00078c13          	mv	s8,a5
    66dc:	f95ff06f          	j	6670 <__divdf3+0x254>
    66e0:	00048b13          	mv	s6,s1
    66e4:	00050b93          	mv	s7,a0
    66e8:	00c00493          	li	s1,12
    66ec:	7ff00993          	li	s3,2047
    66f0:	00300c13          	li	s8,3
    66f4:	da5ff06f          	j	6498 <__divdf3+0x7c>
    66f8:	0014e493          	or	s1,s1,1
    66fc:	00000413          	li	s0,0
    6700:	00100793          	li	a5,1
    6704:	dd9ff06f          	j	64dc <__divdf3+0xc0>
    6708:	0034e493          	or	s1,s1,3
    670c:	000a0813          	mv	a6,s4
    6710:	00300793          	li	a5,3
    6714:	dc9ff06f          	j	64dc <__divdf3+0xc0>
    6718:	00000b93          	li	s7,0
    671c:	00400493          	li	s1,4
    6720:	00000993          	li	s3,0
    6724:	00100c13          	li	s8,1
    6728:	d71ff06f          	j	6498 <__divdf3+0x7c>
    672c:	03912223          	sw	s9,36(sp)
    6730:	03a12023          	sw	s10,32(sp)
    6734:	01b12e23          	sw	s11,28(sp)
    6738:	3b646a63          	bltu	s0,s6,6aec <__divdf3+0x6d0>
    673c:	3a8b0663          	beq	s6,s0,6ae8 <__divdf3+0x6cc>
    6740:	fff98993          	add	s3,s3,-1
    6744:	000b8c13          	mv	s8,s7
    6748:	000b0493          	mv	s1,s6
    674c:	00000d13          	li	s10,0
    6750:	01885c93          	srl	s9,a6,0x18
    6754:	00841413          	sll	s0,s0,0x8
    6758:	01045913          	srl	s2,s0,0x10
    675c:	008cecb3          	or	s9,s9,s0
    6760:	00090593          	mv	a1,s2
    6764:	00048513          	mv	a0,s1
    6768:	010c9b13          	sll	s6,s9,0x10
    676c:	00881a93          	sll	s5,a6,0x8
    6770:	010b5b13          	srl	s6,s6,0x10
    6774:	15c010ef          	jal	78d0 <__hidden___udivsi3>
    6778:	00050593          	mv	a1,a0
    677c:	00050413          	mv	s0,a0
    6780:	000b0513          	mv	a0,s6
    6784:	120010ef          	jal	78a4 <__mulsi3>
    6788:	00050793          	mv	a5,a0
    678c:	00090593          	mv	a1,s2
    6790:	00048513          	mv	a0,s1
    6794:	00078493          	mv	s1,a5
    6798:	180010ef          	jal	7918 <__umodsi3>
    679c:	01051513          	sll	a0,a0,0x10
    67a0:	010c5793          	srl	a5,s8,0x10
    67a4:	00a7e7b3          	or	a5,a5,a0
    67a8:	0097fa63          	bgeu	a5,s1,67bc <__divdf3+0x3a0>
    67ac:	00fc87b3          	add	a5,s9,a5
    67b0:	fff40713          	add	a4,s0,-1 # 7fffff <__subdf3+0x7f840f>
    67b4:	3b97fe63          	bgeu	a5,s9,6b70 <__divdf3+0x754>
    67b8:	00070413          	mv	s0,a4
    67bc:	409784b3          	sub	s1,a5,s1
    67c0:	00090593          	mv	a1,s2
    67c4:	00048513          	mv	a0,s1
    67c8:	108010ef          	jal	78d0 <__hidden___udivsi3>
    67cc:	00050593          	mv	a1,a0
    67d0:	00050b93          	mv	s7,a0
    67d4:	000b0513          	mv	a0,s6
    67d8:	0cc010ef          	jal	78a4 <__mulsi3>
    67dc:	00050793          	mv	a5,a0
    67e0:	00090593          	mv	a1,s2
    67e4:	00048513          	mv	a0,s1
    67e8:	00078493          	mv	s1,a5
    67ec:	12c010ef          	jal	7918 <__umodsi3>
    67f0:	010c1793          	sll	a5,s8,0x10
    67f4:	01051513          	sll	a0,a0,0x10
    67f8:	0107d793          	srl	a5,a5,0x10
    67fc:	00a7e7b3          	or	a5,a5,a0
    6800:	0097fa63          	bgeu	a5,s1,6814 <__divdf3+0x3f8>
    6804:	00fc87b3          	add	a5,s9,a5
    6808:	fffb8713          	add	a4,s7,-1
    680c:	3597fa63          	bgeu	a5,s9,6b60 <__divdf3+0x744>
    6810:	00070b93          	mv	s7,a4
    6814:	00010337          	lui	t1,0x10
    6818:	01041413          	sll	s0,s0,0x10
    681c:	01746433          	or	s0,s0,s7
    6820:	fff30d93          	add	s11,t1,-1 # ffff <__subdf3+0x840f>
    6824:	01b478b3          	and	a7,s0,s11
    6828:	01bafdb3          	and	s11,s5,s11
    682c:	40978bb3          	sub	s7,a5,s1
    6830:	010adc13          	srl	s8,s5,0x10
    6834:	01045793          	srl	a5,s0,0x10
    6838:	00088513          	mv	a0,a7
    683c:	000d8593          	mv	a1,s11
    6840:	064010ef          	jal	78a4 <__mulsi3>
    6844:	00050813          	mv	a6,a0
    6848:	000c0593          	mv	a1,s8
    684c:	00088513          	mv	a0,a7
    6850:	054010ef          	jal	78a4 <__mulsi3>
    6854:	00050893          	mv	a7,a0
    6858:	000d8593          	mv	a1,s11
    685c:	00078513          	mv	a0,a5
    6860:	044010ef          	jal	78a4 <__mulsi3>
    6864:	00050e13          	mv	t3,a0
    6868:	000c0593          	mv	a1,s8
    686c:	00078513          	mv	a0,a5
    6870:	034010ef          	jal	78a4 <__mulsi3>
    6874:	01085793          	srl	a5,a6,0x10
    6878:	01c888b3          	add	a7,a7,t3
    687c:	011787b3          	add	a5,a5,a7
    6880:	01c7f463          	bgeu	a5,t3,6888 <__divdf3+0x46c>
    6884:	00650533          	add	a0,a0,t1
    6888:	00010637          	lui	a2,0x10
    688c:	fff60613          	add	a2,a2,-1 # ffff <__subdf3+0x840f>
    6890:	00c7f4b3          	and	s1,a5,a2
    6894:	0107d693          	srl	a3,a5,0x10
    6898:	01049493          	sll	s1,s1,0x10
    689c:	00c87833          	and	a6,a6,a2
    68a0:	00a687b3          	add	a5,a3,a0
    68a4:	010484b3          	add	s1,s1,a6
    68a8:	20fbea63          	bltu	s7,a5,6abc <__divdf3+0x6a0>
    68ac:	20fb8663          	beq	s7,a5,6ab8 <__divdf3+0x69c>
    68b0:	409d04b3          	sub	s1,s10,s1
    68b4:	40fb8bb3          	sub	s7,s7,a5
    68b8:	009d3d33          	sltu	s10,s10,s1
    68bc:	41ab8bb3          	sub	s7,s7,s10
    68c0:	377c8a63          	beq	s9,s7,6c34 <__divdf3+0x818>
    68c4:	00090593          	mv	a1,s2
    68c8:	000b8513          	mv	a0,s7
    68cc:	004010ef          	jal	78d0 <__hidden___udivsi3>
    68d0:	00050593          	mv	a1,a0
    68d4:	00a12623          	sw	a0,12(sp)
    68d8:	00050d13          	mv	s10,a0
    68dc:	000b0513          	mv	a0,s6
    68e0:	7c5000ef          	jal	78a4 <__mulsi3>
    68e4:	00050793          	mv	a5,a0
    68e8:	00090593          	mv	a1,s2
    68ec:	000b8513          	mv	a0,s7
    68f0:	00078b93          	mv	s7,a5
    68f4:	024010ef          	jal	7918 <__umodsi3>
    68f8:	01051513          	sll	a0,a0,0x10
    68fc:	0104d793          	srl	a5,s1,0x10
    6900:	00a7e7b3          	or	a5,a5,a0
    6904:	0377f063          	bgeu	a5,s7,6924 <__divdf3+0x508>
    6908:	00fc87b3          	add	a5,s9,a5
    690c:	fffd0693          	add	a3,s10,-1
    6910:	3797e263          	bltu	a5,s9,6c74 <__divdf3+0x858>
    6914:	3777f063          	bgeu	a5,s7,6c74 <__divdf3+0x858>
    6918:	ffed0713          	add	a4,s10,-2
    691c:	00e12623          	sw	a4,12(sp)
    6920:	019787b3          	add	a5,a5,s9
    6924:	41778bb3          	sub	s7,a5,s7
    6928:	00090593          	mv	a1,s2
    692c:	000b8513          	mv	a0,s7
    6930:	7a1000ef          	jal	78d0 <__hidden___udivsi3>
    6934:	00050593          	mv	a1,a0
    6938:	00050d13          	mv	s10,a0
    693c:	000b0513          	mv	a0,s6
    6940:	765000ef          	jal	78a4 <__mulsi3>
    6944:	00050793          	mv	a5,a0
    6948:	00090593          	mv	a1,s2
    694c:	000b8513          	mv	a0,s7
    6950:	00078913          	mv	s2,a5
    6954:	01049493          	sll	s1,s1,0x10
    6958:	7c1000ef          	jal	7918 <__umodsi3>
    695c:	01051513          	sll	a0,a0,0x10
    6960:	0104d493          	srl	s1,s1,0x10
    6964:	00a4e4b3          	or	s1,s1,a0
    6968:	0124fe63          	bgeu	s1,s2,6984 <__divdf3+0x568>
    696c:	009c84b3          	add	s1,s9,s1
    6970:	fffd0793          	add	a5,s10,-1
    6974:	3194e463          	bltu	s1,s9,6c7c <__divdf3+0x860>
    6978:	3124f263          	bgeu	s1,s2,6c7c <__divdf3+0x860>
    697c:	ffed0d13          	add	s10,s10,-2
    6980:	019484b3          	add	s1,s1,s9
    6984:	00c12783          	lw	a5,12(sp)
    6988:	412484b3          	sub	s1,s1,s2
    698c:	000d8593          	mv	a1,s11
    6990:	01079813          	sll	a6,a5,0x10
    6994:	01a86833          	or	a6,a6,s10
    6998:	01081313          	sll	t1,a6,0x10
    699c:	01035313          	srl	t1,t1,0x10
    69a0:	01085793          	srl	a5,a6,0x10
    69a4:	00030513          	mv	a0,t1
    69a8:	6fd000ef          	jal	78a4 <__mulsi3>
    69ac:	00050893          	mv	a7,a0
    69b0:	000c0593          	mv	a1,s8
    69b4:	00030513          	mv	a0,t1
    69b8:	6ed000ef          	jal	78a4 <__mulsi3>
    69bc:	00050313          	mv	t1,a0
    69c0:	000d8593          	mv	a1,s11
    69c4:	00078513          	mv	a0,a5
    69c8:	6dd000ef          	jal	78a4 <__mulsi3>
    69cc:	00050e13          	mv	t3,a0
    69d0:	000c0593          	mv	a1,s8
    69d4:	00078513          	mv	a0,a5
    69d8:	6cd000ef          	jal	78a4 <__mulsi3>
    69dc:	0108d793          	srl	a5,a7,0x10
    69e0:	01c30333          	add	t1,t1,t3
    69e4:	006787b3          	add	a5,a5,t1
    69e8:	01c7f663          	bgeu	a5,t3,69f4 <__divdf3+0x5d8>
    69ec:	00010737          	lui	a4,0x10
    69f0:	00e50533          	add	a0,a0,a4
    69f4:	000106b7          	lui	a3,0x10
    69f8:	fff68693          	add	a3,a3,-1 # ffff <__subdf3+0x840f>
    69fc:	0107d713          	srl	a4,a5,0x10
    6a00:	00d7f7b3          	and	a5,a5,a3
    6a04:	01079793          	sll	a5,a5,0x10
    6a08:	00d8f8b3          	and	a7,a7,a3
    6a0c:	00a70733          	add	a4,a4,a0
    6a10:	011787b3          	add	a5,a5,a7
    6a14:	02e4e063          	bltu	s1,a4,6a34 <__divdf3+0x618>
    6a18:	00e48c63          	beq	s1,a4,6a30 <__divdf3+0x614>
    6a1c:	02412c83          	lw	s9,36(sp)
    6a20:	02012d03          	lw	s10,32(sp)
    6a24:	01c12d83          	lw	s11,28(sp)
    6a28:	00186813          	or	a6,a6,1
    6a2c:	c61ff06f          	j	668c <__divdf3+0x270>
    6a30:	1c078a63          	beqz	a5,6c04 <__divdf3+0x7e8>
    6a34:	009c84b3          	add	s1,s9,s1
    6a38:	fff80613          	add	a2,a6,-1
    6a3c:	00048693          	mv	a3,s1
    6a40:	1b94ec63          	bltu	s1,s9,6bf8 <__divdf3+0x7dc>
    6a44:	24e4ea63          	bltu	s1,a4,6c98 <__divdf3+0x87c>
    6a48:	26e48863          	beq	s1,a4,6cb8 <__divdf3+0x89c>
    6a4c:	00060813          	mv	a6,a2
    6a50:	fcdff06f          	j	6a1c <__divdf3+0x600>
    6a54:	00100713          	li	a4,1
    6a58:	b20790e3          	bnez	a5,6578 <__divdf3+0x15c>
    6a5c:	41e98793          	add	a5,s3,1054
    6a60:	00f816b3          	sll	a3,a6,a5
    6a64:	00d036b3          	snez	a3,a3
    6a68:	00f417b3          	sll	a5,s0,a5
    6a6c:	00f6e7b3          	or	a5,a3,a5
    6a70:	00e85833          	srl	a6,a6,a4
    6a74:	00f86833          	or	a6,a6,a5
    6a78:	00787793          	and	a5,a6,7
    6a7c:	00e45433          	srl	s0,s0,a4
    6a80:	02078063          	beqz	a5,6aa0 <__divdf3+0x684>
    6a84:	00f87793          	and	a5,a6,15
    6a88:	00400713          	li	a4,4
    6a8c:	00e78a63          	beq	a5,a4,6aa0 <__divdf3+0x684>
    6a90:	00480793          	add	a5,a6,4
    6a94:	0107b833          	sltu	a6,a5,a6
    6a98:	01040433          	add	s0,s0,a6
    6a9c:	00078813          	mv	a6,a5
    6aa0:	00841613          	sll	a2,s0,0x8
    6aa4:	00100793          	li	a5,1
    6aa8:	00000693          	li	a3,0
    6aac:	00000713          	li	a4,0
    6ab0:	ae0640e3          	bltz	a2,6590 <__divdf3+0x174>
    6ab4:	1280006f          	j	6bdc <__divdf3+0x7c0>
    6ab8:	de9d7ce3          	bgeu	s10,s1,68b0 <__divdf3+0x494>
    6abc:	015d06b3          	add	a3,s10,s5
    6ac0:	01a6b633          	sltu	a2,a3,s10
    6ac4:	019605b3          	add	a1,a2,s9
    6ac8:	00bb8bb3          	add	s7,s7,a1
    6acc:	00068d13          	mv	s10,a3
    6ad0:	fff40593          	add	a1,s0,-1
    6ad4:	077cfe63          	bgeu	s9,s7,6b50 <__divdf3+0x734>
    6ad8:	14fbe063          	bltu	s7,a5,6c18 <__divdf3+0x7fc>
    6adc:	13778c63          	beq	a5,s7,6c14 <__divdf3+0x7f8>
    6ae0:	00058413          	mv	s0,a1
    6ae4:	dcdff06f          	j	68b0 <__divdf3+0x494>
    6ae8:	c50bece3          	bltu	s7,a6,6740 <__divdf3+0x324>
    6aec:	01fb1c13          	sll	s8,s6,0x1f
    6af0:	001bd713          	srl	a4,s7,0x1
    6af4:	001b5493          	srl	s1,s6,0x1
    6af8:	00ec6c33          	or	s8,s8,a4
    6afc:	01fb9d13          	sll	s10,s7,0x1f
    6b00:	c51ff06f          	j	6750 <__divdf3+0x334>
    6b04:	000a0513          	mv	a0,s4
    6b08:	675000ef          	jal	797c <__clzsi2>
    6b0c:	01550693          	add	a3,a0,21
    6b10:	01c00713          	li	a4,28
    6b14:	02050793          	add	a5,a0,32
    6b18:	a2d75ae3          	bge	a4,a3,654c <__divdf3+0x130>
    6b1c:	ff850513          	add	a0,a0,-8
    6b20:	00000813          	li	a6,0
    6b24:	00aa1433          	sll	s0,s4,a0
    6b28:	a41ff06f          	j	6568 <__divdf3+0x14c>
    6b2c:	651000ef          	jal	797c <__clzsi2>
    6b30:	01550793          	add	a5,a0,21
    6b34:	01c00693          	li	a3,28
    6b38:	02050713          	add	a4,a0,32
    6b3c:	acf6dee3          	bge	a3,a5,6618 <__divdf3+0x1fc>
    6b40:	ff850493          	add	s1,a0,-8
    6b44:	00941b33          	sll	s6,s0,s1
    6b48:	00000b93          	li	s7,0
    6b4c:	ae9ff06f          	j	6634 <__divdf3+0x218>
    6b50:	f97c98e3          	bne	s9,s7,6ae0 <__divdf3+0x6c4>
    6b54:	f80602e3          	beqz	a2,6ad8 <__divdf3+0x6bc>
    6b58:	00058413          	mv	s0,a1
    6b5c:	d55ff06f          	j	68b0 <__divdf3+0x494>
    6b60:	ca97f8e3          	bgeu	a5,s1,6810 <__divdf3+0x3f4>
    6b64:	ffeb8b93          	add	s7,s7,-2
    6b68:	019787b3          	add	a5,a5,s9
    6b6c:	ca9ff06f          	j	6814 <__divdf3+0x3f8>
    6b70:	c497f4e3          	bgeu	a5,s1,67b8 <__divdf3+0x39c>
    6b74:	ffe40413          	add	s0,s0,-2
    6b78:	019787b3          	add	a5,a5,s9
    6b7c:	c41ff06f          	j	67bc <__divdf3+0x3a0>
    6b80:	01f00693          	li	a3,31
    6b84:	ece6dce3          	bge	a3,a4,6a5c <__divdf3+0x640>
    6b88:	fe100693          	li	a3,-31
    6b8c:	40f686b3          	sub	a3,a3,a5
    6b90:	02000793          	li	a5,32
    6b94:	00d456b3          	srl	a3,s0,a3
    6b98:	00f70863          	beq	a4,a5,6ba8 <__divdf3+0x78c>
    6b9c:	43e98793          	add	a5,s3,1086
    6ba0:	00f417b3          	sll	a5,s0,a5
    6ba4:	00f86833          	or	a6,a6,a5
    6ba8:	01003833          	snez	a6,a6
    6bac:	00d86833          	or	a6,a6,a3
    6bb0:	00787713          	and	a4,a6,7
    6bb4:	00000693          	li	a3,0
    6bb8:	02070863          	beqz	a4,6be8 <__divdf3+0x7cc>
    6bbc:	00f87793          	and	a5,a6,15
    6bc0:	00400713          	li	a4,4
    6bc4:	00000413          	li	s0,0
    6bc8:	00e78a63          	beq	a5,a4,6bdc <__divdf3+0x7c0>
    6bcc:	00480793          	add	a5,a6,4
    6bd0:	0107b833          	sltu	a6,a5,a6
    6bd4:	01003433          	snez	s0,a6
    6bd8:	00078813          	mv	a6,a5
    6bdc:	00941693          	sll	a3,s0,0x9
    6be0:	01d41713          	sll	a4,s0,0x1d
    6be4:	00c6d693          	srl	a3,a3,0xc
    6be8:	00385813          	srl	a6,a6,0x3
    6bec:	00e86733          	or	a4,a6,a4
    6bf0:	00000793          	li	a5,0
    6bf4:	99dff06f          	j	6590 <__divdf3+0x174>
    6bf8:	00060813          	mv	a6,a2
    6bfc:	e2e690e3          	bne	a3,a4,6a1c <__divdf3+0x600>
    6c00:	e1579ee3          	bne	a5,s5,6a1c <__divdf3+0x600>
    6c04:	02412c83          	lw	s9,36(sp)
    6c08:	02012d03          	lw	s10,32(sp)
    6c0c:	01c12d83          	lw	s11,28(sp)
    6c10:	a7dff06f          	j	668c <__divdf3+0x270>
    6c14:	ec96f6e3          	bgeu	a3,s1,6ae0 <__divdf3+0x6c4>
    6c18:	00da86b3          	add	a3,s5,a3
    6c1c:	0156b633          	sltu	a2,a3,s5
    6c20:	01960633          	add	a2,a2,s9
    6c24:	ffe40413          	add	s0,s0,-2
    6c28:	00068d13          	mv	s10,a3
    6c2c:	00cb8bb3          	add	s7,s7,a2
    6c30:	c81ff06f          	j	68b0 <__divdf3+0x494>
    6c34:	c0200713          	li	a4,-1022
    6c38:	02412c83          	lw	s9,36(sp)
    6c3c:	02012d03          	lw	s10,32(sp)
    6c40:	01c12d83          	lw	s11,28(sp)
    6c44:	3ff98793          	add	a5,s3,1023
    6c48:	fff00813          	li	a6,-1
    6c4c:	e0e9c4e3          	blt	s3,a4,6a54 <__divdf3+0x638>
    6c50:	00480713          	add	a4,a6,4
    6c54:	01073833          	sltu	a6,a4,a6
    6c58:	01040433          	add	s0,s0,a6
    6c5c:	00070813          	mv	a6,a4
    6c60:	a3dff06f          	j	669c <__divdf3+0x280>
    6c64:	00f87713          	and	a4,a6,15
    6c68:	00400693          	li	a3,4
    6c6c:	a2d708e3          	beq	a4,a3,669c <__divdf3+0x280>
    6c70:	fe1ff06f          	j	6c50 <__divdf3+0x834>
    6c74:	00d12623          	sw	a3,12(sp)
    6c78:	cadff06f          	j	6924 <__divdf3+0x508>
    6c7c:	00078d13          	mv	s10,a5
    6c80:	d05ff06f          	j	6984 <__divdf3+0x568>
    6c84:	00090a13          	mv	s4,s2
    6c88:	7ff00793          	li	a5,2047
    6c8c:	00000693          	li	a3,0
    6c90:	00000713          	li	a4,0
    6c94:	8fdff06f          	j	6590 <__divdf3+0x174>
    6c98:	001a9613          	sll	a2,s5,0x1
    6c9c:	015636b3          	sltu	a3,a2,s5
    6ca0:	019686b3          	add	a3,a3,s9
    6ca4:	00d486b3          	add	a3,s1,a3
    6ca8:	ffe80813          	add	a6,a6,-2
    6cac:	00060a93          	mv	s5,a2
    6cb0:	f4e688e3          	beq	a3,a4,6c00 <__divdf3+0x7e4>
    6cb4:	d69ff06f          	j	6a1c <__divdf3+0x600>
    6cb8:	fefae0e3          	bltu	s5,a5,6c98 <__divdf3+0x87c>
    6cbc:	00060813          	mv	a6,a2
    6cc0:	f41ff06f          	j	6c00 <__divdf3+0x7e4>

00006cc4 <__eqdf2>:
    6cc4:	0145d713          	srl	a4,a1,0x14
    6cc8:	001007b7          	lui	a5,0x100
    6ccc:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf840f>
    6cd0:	0146d813          	srl	a6,a3,0x14
    6cd4:	7ff77713          	and	a4,a4,2047
    6cd8:	7ff00313          	li	t1,2047
    6cdc:	00b7fe33          	and	t3,a5,a1
    6ce0:	00050893          	mv	a7,a0
    6ce4:	00d7f7b3          	and	a5,a5,a3
    6ce8:	01f5d593          	srl	a1,a1,0x1f
    6cec:	7ff87813          	and	a6,a6,2047
    6cf0:	01f6d693          	srl	a3,a3,0x1f
    6cf4:	00100513          	li	a0,1
    6cf8:	00670c63          	beq	a4,t1,6d10 <__eqdf2+0x4c>
    6cfc:	00680863          	beq	a6,t1,6d0c <__eqdf2+0x48>
    6d00:	01071463          	bne	a4,a6,6d08 <__eqdf2+0x44>
    6d04:	02fe0663          	beq	t3,a5,6d30 <__eqdf2+0x6c>
    6d08:	00008067          	ret
    6d0c:	00008067          	ret
    6d10:	fee81ce3          	bne	a6,a4,6d08 <__eqdf2+0x44>
    6d14:	00fe67b3          	or	a5,t3,a5
    6d18:	00c7e7b3          	or	a5,a5,a2
    6d1c:	0117e7b3          	or	a5,a5,a7
    6d20:	fe0794e3          	bnez	a5,6d08 <__eqdf2+0x44>
    6d24:	40d585b3          	sub	a1,a1,a3
    6d28:	00b03533          	snez	a0,a1
    6d2c:	00008067          	ret
    6d30:	fcc89ce3          	bne	a7,a2,6d08 <__eqdf2+0x44>
    6d34:	00d58a63          	beq	a1,a3,6d48 <__eqdf2+0x84>
    6d38:	fc0718e3          	bnez	a4,6d08 <__eqdf2+0x44>
    6d3c:	011e6e33          	or	t3,t3,a7
    6d40:	01c03533          	snez	a0,t3
    6d44:	00008067          	ret
    6d48:	00000513          	li	a0,0
    6d4c:	00008067          	ret

00006d50 <__gedf2>:
    6d50:	0145d893          	srl	a7,a1,0x14
    6d54:	001007b7          	lui	a5,0x100
    6d58:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf840f>
    6d5c:	0146d713          	srl	a4,a3,0x14
    6d60:	7ff8f893          	and	a7,a7,2047
    6d64:	7ff00e13          	li	t3,2047
    6d68:	00b7f333          	and	t1,a5,a1
    6d6c:	00050813          	mv	a6,a0
    6d70:	00050e93          	mv	t4,a0
    6d74:	00d7f7b3          	and	a5,a5,a3
    6d78:	01f5d593          	srl	a1,a1,0x1f
    6d7c:	00060f13          	mv	t5,a2
    6d80:	7ff77513          	and	a0,a4,2047
    6d84:	01f6d693          	srl	a3,a3,0x1f
    6d88:	05c88863          	beq	a7,t3,6dd8 <__gedf2+0x88>
    6d8c:	03c50463          	beq	a0,t3,6db4 <__gedf2+0x64>
    6d90:	06089a63          	bnez	a7,6e04 <__gedf2+0xb4>
    6d94:	01036833          	or	a6,t1,a6
    6d98:	06051063          	bnez	a0,6df8 <__gedf2+0xa8>
    6d9c:	00c7e633          	or	a2,a5,a2
    6da0:	08060c63          	beqz	a2,6e38 <__gedf2+0xe8>
    6da4:	0a081263          	bnez	a6,6e48 <__gedf2+0xf8>
    6da8:	00100513          	li	a0,1
    6dac:	08068263          	beqz	a3,6e30 <__gedf2+0xe0>
    6db0:	00008067          	ret
    6db4:	00c7e633          	or	a2,a5,a2
    6db8:	08061463          	bnez	a2,6e40 <__gedf2+0xf0>
    6dbc:	00089663          	bnez	a7,6dc8 <__gedf2+0x78>
    6dc0:	01036333          	or	t1,t1,a6
    6dc4:	fe0302e3          	beqz	t1,6da8 <__gedf2+0x58>
    6dc8:	06d58063          	beq	a1,a3,6e28 <__gedf2+0xd8>
    6dcc:	06059263          	bnez	a1,6e30 <__gedf2+0xe0>
    6dd0:	00100513          	li	a0,1
    6dd4:	00008067          	ret
    6dd8:	01036333          	or	t1,t1,a6
    6ddc:	06031263          	bnez	t1,6e40 <__gedf2+0xf0>
    6de0:	ff1516e3          	bne	a0,a7,6dcc <__gedf2+0x7c>
    6de4:	00c7e7b3          	or	a5,a5,a2
    6de8:	04079c63          	bnez	a5,6e40 <__gedf2+0xf0>
    6dec:	fed590e3          	bne	a1,a3,6dcc <__gedf2+0x7c>
    6df0:	00000513          	li	a0,0
    6df4:	00008067          	ret
    6df8:	fa0808e3          	beqz	a6,6da8 <__gedf2+0x58>
    6dfc:	fcd598e3          	bne	a1,a3,6dcc <__gedf2+0x7c>
    6e00:	0280006f          	j	6e28 <__gedf2+0xd8>
    6e04:	fc0504e3          	beqz	a0,6dcc <__gedf2+0x7c>
    6e08:	fcd592e3          	bne	a1,a3,6dcc <__gedf2+0x7c>
    6e0c:	fd1540e3          	blt	a0,a7,6dcc <__gedf2+0x7c>
    6e10:	00a8cc63          	blt	a7,a0,6e28 <__gedf2+0xd8>
    6e14:	fa67ece3          	bltu	a5,t1,6dcc <__gedf2+0x7c>
    6e18:	00f31863          	bne	t1,a5,6e28 <__gedf2+0xd8>
    6e1c:	fbdf68e3          	bltu	t5,t4,6dcc <__gedf2+0x7c>
    6e20:	00000513          	li	a0,0
    6e24:	f9eef6e3          	bgeu	t4,t5,6db0 <__gedf2+0x60>
    6e28:	00100513          	li	a0,1
    6e2c:	f80592e3          	bnez	a1,6db0 <__gedf2+0x60>
    6e30:	fff00513          	li	a0,-1
    6e34:	00008067          	ret
    6e38:	f8081ae3          	bnez	a6,6dcc <__gedf2+0x7c>
    6e3c:	00008067          	ret
    6e40:	ffe00513          	li	a0,-2
    6e44:	00008067          	ret
    6e48:	fcd586e3          	beq	a1,a3,6e14 <__gedf2+0xc4>
    6e4c:	f81ff06f          	j	6dcc <__gedf2+0x7c>

00006e50 <__ledf2>:
    6e50:	0145d893          	srl	a7,a1,0x14
    6e54:	001007b7          	lui	a5,0x100
    6e58:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf840f>
    6e5c:	0146d713          	srl	a4,a3,0x14
    6e60:	7ff8f893          	and	a7,a7,2047
    6e64:	7ff00313          	li	t1,2047
    6e68:	00b7fe33          	and	t3,a5,a1
    6e6c:	00050813          	mv	a6,a0
    6e70:	00050e93          	mv	t4,a0
    6e74:	00d7f7b3          	and	a5,a5,a3
    6e78:	01f5d593          	srl	a1,a1,0x1f
    6e7c:	00060f13          	mv	t5,a2
    6e80:	7ff77513          	and	a0,a4,2047
    6e84:	01f6d693          	srl	a3,a3,0x1f
    6e88:	04688a63          	beq	a7,t1,6edc <__ledf2+0x8c>
    6e8c:	02650463          	beq	a0,t1,6eb4 <__ledf2+0x64>
    6e90:	06089863          	bnez	a7,6f00 <__ledf2+0xb0>
    6e94:	010e6833          	or	a6,t3,a6
    6e98:	08051e63          	bnez	a0,6f34 <__ledf2+0xe4>
    6e9c:	00c7e633          	or	a2,a5,a2
    6ea0:	0a060463          	beqz	a2,6f48 <__ledf2+0xf8>
    6ea4:	0a081663          	bnez	a6,6f50 <__ledf2+0x100>
    6ea8:	00100513          	li	a0,1
    6eac:	08068063          	beqz	a3,6f2c <__ledf2+0xdc>
    6eb0:	00008067          	ret
    6eb4:	00c7e633          	or	a2,a5,a2
    6eb8:	00200513          	li	a0,2
    6ebc:	fe061ae3          	bnez	a2,6eb0 <__ledf2+0x60>
    6ec0:	00089663          	bnez	a7,6ecc <__ledf2+0x7c>
    6ec4:	010e6e33          	or	t3,t3,a6
    6ec8:	fe0e00e3          	beqz	t3,6ea8 <__ledf2+0x58>
    6ecc:	04d58c63          	beq	a1,a3,6f24 <__ledf2+0xd4>
    6ed0:	04059e63          	bnez	a1,6f2c <__ledf2+0xdc>
    6ed4:	00100513          	li	a0,1
    6ed8:	00008067          	ret
    6edc:	010e6e33          	or	t3,t3,a6
    6ee0:	060e1063          	bnez	t3,6f40 <__ledf2+0xf0>
    6ee4:	ff1516e3          	bne	a0,a7,6ed0 <__ledf2+0x80>
    6ee8:	00c7e7b3          	or	a5,a5,a2
    6eec:	00200513          	li	a0,2
    6ef0:	fc0790e3          	bnez	a5,6eb0 <__ledf2+0x60>
    6ef4:	fcd59ee3          	bne	a1,a3,6ed0 <__ledf2+0x80>
    6ef8:	00000513          	li	a0,0
    6efc:	00008067          	ret
    6f00:	fc0508e3          	beqz	a0,6ed0 <__ledf2+0x80>
    6f04:	fcd596e3          	bne	a1,a3,6ed0 <__ledf2+0x80>
    6f08:	fd1544e3          	blt	a0,a7,6ed0 <__ledf2+0x80>
    6f0c:	00a8cc63          	blt	a7,a0,6f24 <__ledf2+0xd4>
    6f10:	fdc7e0e3          	bltu	a5,t3,6ed0 <__ledf2+0x80>
    6f14:	00fe1863          	bne	t3,a5,6f24 <__ledf2+0xd4>
    6f18:	fbdf6ce3          	bltu	t5,t4,6ed0 <__ledf2+0x80>
    6f1c:	00000513          	li	a0,0
    6f20:	f9eef8e3          	bgeu	t4,t5,6eb0 <__ledf2+0x60>
    6f24:	00100513          	li	a0,1
    6f28:	f80594e3          	bnez	a1,6eb0 <__ledf2+0x60>
    6f2c:	fff00513          	li	a0,-1
    6f30:	00008067          	ret
    6f34:	f6080ae3          	beqz	a6,6ea8 <__ledf2+0x58>
    6f38:	f8d59ce3          	bne	a1,a3,6ed0 <__ledf2+0x80>
    6f3c:	fe9ff06f          	j	6f24 <__ledf2+0xd4>
    6f40:	00200513          	li	a0,2
    6f44:	00008067          	ret
    6f48:	f80814e3          	bnez	a6,6ed0 <__ledf2+0x80>
    6f4c:	00008067          	ret
    6f50:	fcd580e3          	beq	a1,a3,6f10 <__ledf2+0xc0>
    6f54:	f7dff06f          	j	6ed0 <__ledf2+0x80>

00006f58 <__muldf3>:
    6f58:	fd010113          	add	sp,sp,-48
    6f5c:	0145d793          	srl	a5,a1,0x14
    6f60:	02812423          	sw	s0,40(sp)
    6f64:	02912223          	sw	s1,36(sp)
    6f68:	03212023          	sw	s2,32(sp)
    6f6c:	01312e23          	sw	s3,28(sp)
    6f70:	01512a23          	sw	s5,20(sp)
    6f74:	00c59493          	sll	s1,a1,0xc
    6f78:	02112623          	sw	ra,44(sp)
    6f7c:	01412c23          	sw	s4,24(sp)
    6f80:	01612823          	sw	s6,16(sp)
    6f84:	01712623          	sw	s7,12(sp)
    6f88:	01812423          	sw	s8,8(sp)
    6f8c:	7ff7f793          	and	a5,a5,2047
    6f90:	00050413          	mv	s0,a0
    6f94:	00060a93          	mv	s5,a2
    6f98:	00068993          	mv	s3,a3
    6f9c:	00c4d493          	srl	s1,s1,0xc
    6fa0:	01f5d913          	srl	s2,a1,0x1f
    6fa4:	4e078063          	beqz	a5,7484 <__muldf3+0x52c>
    6fa8:	7ff00713          	li	a4,2047
    6fac:	0ae78663          	beq	a5,a4,7058 <__muldf3+0x100>
    6fb0:	00349693          	sll	a3,s1,0x3
    6fb4:	01d55713          	srl	a4,a0,0x1d
    6fb8:	00d76733          	or	a4,a4,a3
    6fbc:	008006b7          	lui	a3,0x800
    6fc0:	00d764b3          	or	s1,a4,a3
    6fc4:	00351a13          	sll	s4,a0,0x3
    6fc8:	c0178c13          	add	s8,a5,-1023
    6fcc:	00000b13          	li	s6,0
    6fd0:	00000b93          	li	s7,0
    6fd4:	0149d793          	srl	a5,s3,0x14
    6fd8:	00c99713          	sll	a4,s3,0xc
    6fdc:	7ff7f793          	and	a5,a5,2047
    6fe0:	000a8e13          	mv	t3,s5
    6fe4:	00c75413          	srl	s0,a4,0xc
    6fe8:	01f9d993          	srl	s3,s3,0x1f
    6fec:	0a078063          	beqz	a5,708c <__muldf3+0x134>
    6ff0:	7ff00713          	li	a4,2047
    6ff4:	14e78e63          	beq	a5,a4,7150 <__muldf3+0x1f8>
    6ff8:	00341713          	sll	a4,s0,0x3
    6ffc:	01dad693          	srl	a3,s5,0x1d
    7000:	00e6e6b3          	or	a3,a3,a4
    7004:	c0178793          	add	a5,a5,-1023
    7008:	00800737          	lui	a4,0x800
    700c:	00e6e433          	or	s0,a3,a4
    7010:	003a9e13          	sll	t3,s5,0x3
    7014:	01878333          	add	t1,a5,s8
    7018:	00000693          	li	a3,0
    701c:	00a00793          	li	a5,10
    7020:	00130893          	add	a7,t1,1
    7024:	0b67cc63          	blt	a5,s6,70dc <__muldf3+0x184>
    7028:	013945b3          	xor	a1,s2,s3
    702c:	00200793          	li	a5,2
    7030:	00058813          	mv	a6,a1
    7034:	1567c663          	blt	a5,s6,7180 <__muldf3+0x228>
    7038:	fffb0b13          	add	s6,s6,-1
    703c:	00100713          	li	a4,1
    7040:	17676063          	bltu	a4,s6,71a0 <__muldf3+0x248>
    7044:	48f68663          	beq	a3,a5,74d0 <__muldf3+0x578>
    7048:	00040493          	mv	s1,s0
    704c:	000e0a13          	mv	s4,t3
    7050:	00068b93          	mv	s7,a3
    7054:	09c0006f          	j	70f0 <__muldf3+0x198>
    7058:	00a4ea33          	or	s4,s1,a0
    705c:	480a1463          	bnez	s4,74e4 <__muldf3+0x58c>
    7060:	0149d793          	srl	a5,s3,0x14
    7064:	00c99713          	sll	a4,s3,0xc
    7068:	7ff7f793          	and	a5,a5,2047
    706c:	00000493          	li	s1,0
    7070:	00800b13          	li	s6,8
    7074:	7ff00c13          	li	s8,2047
    7078:	00200b93          	li	s7,2
    707c:	000a8e13          	mv	t3,s5
    7080:	00c75413          	srl	s0,a4,0xc
    7084:	01f9d993          	srl	s3,s3,0x1f
    7088:	f60794e3          	bnez	a5,6ff0 <__muldf3+0x98>
    708c:	015467b3          	or	a5,s0,s5
    7090:	46078e63          	beqz	a5,750c <__muldf3+0x5b4>
    7094:	54040c63          	beqz	s0,75ec <__muldf3+0x694>
    7098:	00040513          	mv	a0,s0
    709c:	0e1000ef          	jal	797c <__clzsi2>
    70a0:	00050313          	mv	t1,a0
    70a4:	ff550713          	add	a4,a0,-11
    70a8:	01d00793          	li	a5,29
    70ac:	ff830e13          	add	t3,t1,-8
    70b0:	40e787b3          	sub	a5,a5,a4
    70b4:	00fad7b3          	srl	a5,s5,a5
    70b8:	01c41733          	sll	a4,s0,t3
    70bc:	00e7e433          	or	s0,a5,a4
    70c0:	01ca9e33          	sll	t3,s5,t3
    70c4:	406c0333          	sub	t1,s8,t1
    70c8:	c0d30313          	add	t1,t1,-1011
    70cc:	00a00793          	li	a5,10
    70d0:	00000693          	li	a3,0
    70d4:	00130893          	add	a7,t1,1
    70d8:	f567d8e3          	bge	a5,s6,7028 <__muldf3+0xd0>
    70dc:	00090593          	mv	a1,s2
    70e0:	00200793          	li	a5,2
    70e4:	3efb8663          	beq	s7,a5,74d0 <__muldf3+0x578>
    70e8:	00300793          	li	a5,3
    70ec:	54fb8863          	beq	s7,a5,763c <__muldf3+0x6e4>
    70f0:	00100793          	li	a5,1
    70f4:	00058813          	mv	a6,a1
    70f8:	52fb9663          	bne	s7,a5,7624 <__muldf3+0x6cc>
    70fc:	00000793          	li	a5,0
    7100:	00000693          	li	a3,0
    7104:	00000713          	li	a4,0
    7108:	02c12083          	lw	ra,44(sp)
    710c:	02812403          	lw	s0,40(sp)
    7110:	01479793          	sll	a5,a5,0x14
    7114:	00d7e7b3          	or	a5,a5,a3
    7118:	01f81813          	sll	a6,a6,0x1f
    711c:	0107e7b3          	or	a5,a5,a6
    7120:	02412483          	lw	s1,36(sp)
    7124:	02012903          	lw	s2,32(sp)
    7128:	01c12983          	lw	s3,28(sp)
    712c:	01812a03          	lw	s4,24(sp)
    7130:	01412a83          	lw	s5,20(sp)
    7134:	01012b03          	lw	s6,16(sp)
    7138:	00c12b83          	lw	s7,12(sp)
    713c:	00812c03          	lw	s8,8(sp)
    7140:	00070513          	mv	a0,a4
    7144:	00078593          	mv	a1,a5
    7148:	03010113          	add	sp,sp,48
    714c:	00008067          	ret
    7150:	01546733          	or	a4,s0,s5
    7154:	7ffc0313          	add	t1,s8,2047
    7158:	3c070663          	beqz	a4,7524 <__muldf3+0x5cc>
    715c:	00001737          	lui	a4,0x1
    7160:	01394833          	xor	a6,s2,s3
    7164:	80070713          	add	a4,a4,-2048 # 800 <_gbl_ptr>
    7168:	003b6b13          	or	s6,s6,3
    716c:	00a00693          	li	a3,10
    7170:	00080593          	mv	a1,a6
    7174:	00ec08b3          	add	a7,s8,a4
    7178:	4366cc63          	blt	a3,s6,75b0 <__muldf3+0x658>
    717c:	00300693          	li	a3,3
    7180:	00100613          	li	a2,1
    7184:	01661633          	sll	a2,a2,s6
    7188:	53067713          	and	a4,a2,1328
    718c:	f4071ae3          	bnez	a4,70e0 <__muldf3+0x188>
    7190:	24067793          	and	a5,a2,576
    7194:	48079063          	bnez	a5,7614 <__muldf3+0x6bc>
    7198:	08867613          	and	a2,a2,136
    719c:	38061e63          	bnez	a2,7538 <__muldf3+0x5e0>
    71a0:	00010fb7          	lui	t6,0x10
    71a4:	ffff8293          	add	t0,t6,-1 # ffff <__subdf3+0x840f>
    71a8:	005a7f33          	and	t5,s4,t0
    71ac:	005e72b3          	and	t0,t3,t0
    71b0:	010a5a13          	srl	s4,s4,0x10
    71b4:	010e5e13          	srl	t3,t3,0x10
    71b8:	000f0513          	mv	a0,t5
    71bc:	00028593          	mv	a1,t0
    71c0:	6e4000ef          	jal	78a4 <__mulsi3>
    71c4:	00050713          	mv	a4,a0
    71c8:	000e0593          	mv	a1,t3
    71cc:	000f0513          	mv	a0,t5
    71d0:	6d4000ef          	jal	78a4 <__mulsi3>
    71d4:	00050793          	mv	a5,a0
    71d8:	00028593          	mv	a1,t0
    71dc:	000a0513          	mv	a0,s4
    71e0:	6c4000ef          	jal	78a4 <__mulsi3>
    71e4:	00050e93          	mv	t4,a0
    71e8:	000e0593          	mv	a1,t3
    71ec:	000a0513          	mv	a0,s4
    71f0:	6b4000ef          	jal	78a4 <__mulsi3>
    71f4:	01d786b3          	add	a3,a5,t4
    71f8:	01075393          	srl	t2,a4,0x10
    71fc:	00d383b3          	add	t2,t2,a3
    7200:	00050793          	mv	a5,a0
    7204:	01d3f463          	bgeu	t2,t4,720c <__muldf3+0x2b4>
    7208:	01f507b3          	add	a5,a0,t6
    720c:	000109b7          	lui	s3,0x10
    7210:	fff98913          	add	s2,s3,-1 # ffff <__subdf3+0x840f>
    7214:	0123feb3          	and	t4,t2,s2
    7218:	01277733          	and	a4,a4,s2
    721c:	010e9e93          	sll	t4,t4,0x10
    7220:	01247933          	and	s2,s0,s2
    7224:	0103d393          	srl	t2,t2,0x10
    7228:	00ee8eb3          	add	t4,t4,a4
    722c:	01045413          	srl	s0,s0,0x10
    7230:	000f0513          	mv	a0,t5
    7234:	00090593          	mv	a1,s2
    7238:	66c000ef          	jal	78a4 <__mulsi3>
    723c:	00050f93          	mv	t6,a0
    7240:	00040593          	mv	a1,s0
    7244:	000f0513          	mv	a0,t5
    7248:	65c000ef          	jal	78a4 <__mulsi3>
    724c:	00050713          	mv	a4,a0
    7250:	00090593          	mv	a1,s2
    7254:	000a0513          	mv	a0,s4
    7258:	64c000ef          	jal	78a4 <__mulsi3>
    725c:	00050f13          	mv	t5,a0
    7260:	00040593          	mv	a1,s0
    7264:	000a0513          	mv	a0,s4
    7268:	63c000ef          	jal	78a4 <__mulsi3>
    726c:	010fd693          	srl	a3,t6,0x10
    7270:	01e70733          	add	a4,a4,t5
    7274:	00e686b3          	add	a3,a3,a4
    7278:	01e6f463          	bgeu	a3,t5,7280 <__muldf3+0x328>
    727c:	01350533          	add	a0,a0,s3
    7280:	00010a37          	lui	s4,0x10
    7284:	fffa0f13          	add	t5,s4,-1 # ffff <__subdf3+0x840f>
    7288:	01e6f733          	and	a4,a3,t5
    728c:	01efffb3          	and	t6,t6,t5
    7290:	01071713          	sll	a4,a4,0x10
    7294:	01f70733          	add	a4,a4,t6
    7298:	01e4ff33          	and	t5,s1,t5
    729c:	0106d693          	srl	a3,a3,0x10
    72a0:	00a68fb3          	add	t6,a3,a0
    72a4:	00e383b3          	add	t2,t2,a4
    72a8:	0104d493          	srl	s1,s1,0x10
    72ac:	000f0513          	mv	a0,t5
    72b0:	00028593          	mv	a1,t0
    72b4:	5f0000ef          	jal	78a4 <__mulsi3>
    72b8:	00050a93          	mv	s5,a0
    72bc:	000e0593          	mv	a1,t3
    72c0:	000f0513          	mv	a0,t5
    72c4:	5e0000ef          	jal	78a4 <__mulsi3>
    72c8:	00050993          	mv	s3,a0
    72cc:	00028593          	mv	a1,t0
    72d0:	00048513          	mv	a0,s1
    72d4:	5d0000ef          	jal	78a4 <__mulsi3>
    72d8:	00050293          	mv	t0,a0
    72dc:	000e0593          	mv	a1,t3
    72e0:	00048513          	mv	a0,s1
    72e4:	5c0000ef          	jal	78a4 <__mulsi3>
    72e8:	010ad613          	srl	a2,s5,0x10
    72ec:	005989b3          	add	s3,s3,t0
    72f0:	01360633          	add	a2,a2,s3
    72f4:	00567463          	bgeu	a2,t0,72fc <__muldf3+0x3a4>
    72f8:	01450533          	add	a0,a0,s4
    72fc:	00010a37          	lui	s4,0x10
    7300:	fffa0693          	add	a3,s4,-1 # ffff <__subdf3+0x840f>
    7304:	00d672b3          	and	t0,a2,a3
    7308:	00dafab3          	and	s5,s5,a3
    730c:	01065613          	srl	a2,a2,0x10
    7310:	01029293          	sll	t0,t0,0x10
    7314:	00a60e33          	add	t3,a2,a0
    7318:	015282b3          	add	t0,t0,s5
    731c:	000f0513          	mv	a0,t5
    7320:	00090593          	mv	a1,s2
    7324:	580000ef          	jal	78a4 <__mulsi3>
    7328:	00050993          	mv	s3,a0
    732c:	00040593          	mv	a1,s0
    7330:	000f0513          	mv	a0,t5
    7334:	570000ef          	jal	78a4 <__mulsi3>
    7338:	00050f13          	mv	t5,a0
    733c:	00090593          	mv	a1,s2
    7340:	00048513          	mv	a0,s1
    7344:	560000ef          	jal	78a4 <__mulsi3>
    7348:	00050913          	mv	s2,a0
    734c:	00040593          	mv	a1,s0
    7350:	00048513          	mv	a0,s1
    7354:	550000ef          	jal	78a4 <__mulsi3>
    7358:	012f06b3          	add	a3,t5,s2
    735c:	0109d593          	srl	a1,s3,0x10
    7360:	00d58433          	add	s0,a1,a3
    7364:	00050f13          	mv	t5,a0
    7368:	01247463          	bgeu	s0,s2,7370 <__muldf3+0x418>
    736c:	01450f33          	add	t5,a0,s4
    7370:	00010637          	lui	a2,0x10
    7374:	fff60613          	add	a2,a2,-1 # ffff <__subdf3+0x840f>
    7378:	00c476b3          	and	a3,s0,a2
    737c:	00c9f9b3          	and	s3,s3,a2
    7380:	01069693          	sll	a3,a3,0x10
    7384:	007787b3          	add	a5,a5,t2
    7388:	013686b3          	add	a3,a3,s3
    738c:	01f685b3          	add	a1,a3,t6
    7390:	00e7b733          	sltu	a4,a5,a4
    7394:	00e58733          	add	a4,a1,a4
    7398:	005782b3          	add	t0,a5,t0
    739c:	01c70633          	add	a2,a4,t3
    73a0:	00f2b7b3          	sltu	a5,t0,a5
    73a4:	00f607b3          	add	a5,a2,a5
    73a8:	00d5b6b3          	sltu	a3,a1,a3
    73ac:	00b735b3          	sltu	a1,a4,a1
    73b0:	00b6e6b3          	or	a3,a3,a1
    73b4:	00e63733          	sltu	a4,a2,a4
    73b8:	01045593          	srl	a1,s0,0x10
    73bc:	00c7b633          	sltu	a2,a5,a2
    73c0:	00b686b3          	add	a3,a3,a1
    73c4:	00929a13          	sll	s4,t0,0x9
    73c8:	00c76733          	or	a4,a4,a2
    73cc:	00d70733          	add	a4,a4,a3
    73d0:	01da6a33          	or	s4,s4,t4
    73d4:	01e70733          	add	a4,a4,t5
    73d8:	01403a33          	snez	s4,s4
    73dc:	0172d293          	srl	t0,t0,0x17
    73e0:	00971713          	sll	a4,a4,0x9
    73e4:	0177d693          	srl	a3,a5,0x17
    73e8:	005a6a33          	or	s4,s4,t0
    73ec:	00979793          	sll	a5,a5,0x9
    73f0:	00fa6a33          	or	s4,s4,a5
    73f4:	00771793          	sll	a5,a4,0x7
    73f8:	00d764b3          	or	s1,a4,a3
    73fc:	0207d063          	bgez	a5,741c <__muldf3+0x4c4>
    7400:	001a5793          	srl	a5,s4,0x1
    7404:	001a7a13          	and	s4,s4,1
    7408:	01f49713          	sll	a4,s1,0x1f
    740c:	0147e7b3          	or	a5,a5,s4
    7410:	00e7ea33          	or	s4,a5,a4
    7414:	0014d493          	srl	s1,s1,0x1
    7418:	00088313          	mv	t1,a7
    741c:	3ff30793          	add	a5,t1,1023
    7420:	12f05663          	blez	a5,754c <__muldf3+0x5f4>
    7424:	007a7713          	and	a4,s4,7
    7428:	02070063          	beqz	a4,7448 <__muldf3+0x4f0>
    742c:	00fa7713          	and	a4,s4,15
    7430:	00400693          	li	a3,4
    7434:	00d70a63          	beq	a4,a3,7448 <__muldf3+0x4f0>
    7438:	004a0713          	add	a4,s4,4
    743c:	01473a33          	sltu	s4,a4,s4
    7440:	014484b3          	add	s1,s1,s4
    7444:	00070a13          	mv	s4,a4
    7448:	00749713          	sll	a4,s1,0x7
    744c:	00075a63          	bgez	a4,7460 <__muldf3+0x508>
    7450:	ff0007b7          	lui	a5,0xff000
    7454:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff840f>
    7458:	00f4f4b3          	and	s1,s1,a5
    745c:	40030793          	add	a5,t1,1024
    7460:	7fe00713          	li	a4,2046
    7464:	1cf74463          	blt	a4,a5,762c <__muldf3+0x6d4>
    7468:	003a5a13          	srl	s4,s4,0x3
    746c:	01d49713          	sll	a4,s1,0x1d
    7470:	00949693          	sll	a3,s1,0x9
    7474:	01476733          	or	a4,a4,s4
    7478:	00c6d693          	srl	a3,a3,0xc
    747c:	7ff7f793          	and	a5,a5,2047
    7480:	c89ff06f          	j	7108 <__muldf3+0x1b0>
    7484:	00a4ea33          	or	s4,s1,a0
    7488:	060a0863          	beqz	s4,74f8 <__muldf3+0x5a0>
    748c:	12048e63          	beqz	s1,75c8 <__muldf3+0x670>
    7490:	00048513          	mv	a0,s1
    7494:	4e8000ef          	jal	797c <__clzsi2>
    7498:	00050713          	mv	a4,a0
    749c:	ff550693          	add	a3,a0,-11
    74a0:	01d00793          	li	a5,29
    74a4:	ff870a13          	add	s4,a4,-8
    74a8:	40d787b3          	sub	a5,a5,a3
    74ac:	00f457b3          	srl	a5,s0,a5
    74b0:	014496b3          	sll	a3,s1,s4
    74b4:	00d7e4b3          	or	s1,a5,a3
    74b8:	01441a33          	sll	s4,s0,s4
    74bc:	c0d00793          	li	a5,-1011
    74c0:	40e78c33          	sub	s8,a5,a4
    74c4:	00000b13          	li	s6,0
    74c8:	00000b93          	li	s7,0
    74cc:	b09ff06f          	j	6fd4 <__muldf3+0x7c>
    74d0:	00058813          	mv	a6,a1
    74d4:	7ff00793          	li	a5,2047
    74d8:	00000693          	li	a3,0
    74dc:	00000713          	li	a4,0
    74e0:	c29ff06f          	j	7108 <__muldf3+0x1b0>
    74e4:	00050a13          	mv	s4,a0
    74e8:	00c00b13          	li	s6,12
    74ec:	7ff00c13          	li	s8,2047
    74f0:	00300b93          	li	s7,3
    74f4:	ae1ff06f          	j	6fd4 <__muldf3+0x7c>
    74f8:	00000493          	li	s1,0
    74fc:	00400b13          	li	s6,4
    7500:	00000c13          	li	s8,0
    7504:	00100b93          	li	s7,1
    7508:	acdff06f          	j	6fd4 <__muldf3+0x7c>
    750c:	001b6b13          	or	s6,s6,1
    7510:	000c0313          	mv	t1,s8
    7514:	00000413          	li	s0,0
    7518:	00000e13          	li	t3,0
    751c:	00100693          	li	a3,1
    7520:	afdff06f          	j	701c <__muldf3+0xc4>
    7524:	002b6b13          	or	s6,s6,2
    7528:	00000413          	li	s0,0
    752c:	00000e13          	li	t3,0
    7530:	00200693          	li	a3,2
    7534:	ae9ff06f          	j	701c <__muldf3+0xc4>
    7538:	00040493          	mv	s1,s0
    753c:	000e0a13          	mv	s4,t3
    7540:	00068b93          	mv	s7,a3
    7544:	00098593          	mv	a1,s3
    7548:	b99ff06f          	j	70e0 <__muldf3+0x188>
    754c:	00100713          	li	a4,1
    7550:	10079063          	bnez	a5,7650 <__muldf3+0x6f8>
    7554:	41e30313          	add	t1,t1,1054
    7558:	006a1633          	sll	a2,s4,t1
    755c:	00c03633          	snez	a2,a2
    7560:	00649333          	sll	t1,s1,t1
    7564:	00ea5a33          	srl	s4,s4,a4
    7568:	00666633          	or	a2,a2,t1
    756c:	01466633          	or	a2,a2,s4
    7570:	00767793          	and	a5,a2,7
    7574:	00e4d5b3          	srl	a1,s1,a4
    7578:	02078063          	beqz	a5,7598 <__muldf3+0x640>
    757c:	00f67793          	and	a5,a2,15
    7580:	00400713          	li	a4,4
    7584:	00e78a63          	beq	a5,a4,7598 <__muldf3+0x640>
    7588:	00460793          	add	a5,a2,4
    758c:	00c7b633          	sltu	a2,a5,a2
    7590:	00c585b3          	add	a1,a1,a2
    7594:	00078613          	mv	a2,a5
    7598:	00859513          	sll	a0,a1,0x8
    759c:	00100793          	li	a5,1
    75a0:	00000693          	li	a3,0
    75a4:	00000713          	li	a4,0
    75a8:	b60540e3          	bltz	a0,7108 <__muldf3+0x1b0>
    75ac:	10c0006f          	j	76b8 <__muldf3+0x760>
    75b0:	00f00713          	li	a4,15
    75b4:	12eb1063          	bne	s6,a4,76d4 <__muldf3+0x77c>
    75b8:	00000813          	li	a6,0
    75bc:	000806b7          	lui	a3,0x80
    75c0:	00000713          	li	a4,0
    75c4:	b45ff06f          	j	7108 <__muldf3+0x1b0>
    75c8:	3b4000ef          	jal	797c <__clzsi2>
    75cc:	01550693          	add	a3,a0,21
    75d0:	01c00793          	li	a5,28
    75d4:	02050713          	add	a4,a0,32
    75d8:	ecd7d4e3          	bge	a5,a3,74a0 <__muldf3+0x548>
    75dc:	ff850513          	add	a0,a0,-8
    75e0:	00000a13          	li	s4,0
    75e4:	00a414b3          	sll	s1,s0,a0
    75e8:	ed5ff06f          	j	74bc <__muldf3+0x564>
    75ec:	000a8513          	mv	a0,s5
    75f0:	38c000ef          	jal	797c <__clzsi2>
    75f4:	01550713          	add	a4,a0,21
    75f8:	01c00793          	li	a5,28
    75fc:	02050313          	add	t1,a0,32
    7600:	aae7d4e3          	bge	a5,a4,70a8 <__muldf3+0x150>
    7604:	ff850513          	add	a0,a0,-8
    7608:	00000e13          	li	t3,0
    760c:	00aa9433          	sll	s0,s5,a0
    7610:	ab5ff06f          	j	70c4 <__muldf3+0x16c>
    7614:	00000813          	li	a6,0
    7618:	7ff00793          	li	a5,2047
    761c:	000806b7          	lui	a3,0x80
    7620:	ae9ff06f          	j	7108 <__muldf3+0x1b0>
    7624:	00088313          	mv	t1,a7
    7628:	df5ff06f          	j	741c <__muldf3+0x4c4>
    762c:	7ff00793          	li	a5,2047
    7630:	00000693          	li	a3,0
    7634:	00000713          	li	a4,0
    7638:	ad1ff06f          	j	7108 <__muldf3+0x1b0>
    763c:	00000813          	li	a6,0
    7640:	7ff00793          	li	a5,2047
    7644:	000806b7          	lui	a3,0x80
    7648:	00000713          	li	a4,0
    764c:	abdff06f          	j	7108 <__muldf3+0x1b0>
    7650:	40f70733          	sub	a4,a4,a5
    7654:	03800693          	li	a3,56
    7658:	aae6c2e3          	blt	a3,a4,70fc <__muldf3+0x1a4>
    765c:	01f00693          	li	a3,31
    7660:	eee6dae3          	bge	a3,a4,7554 <__muldf3+0x5fc>
    7664:	fe100693          	li	a3,-31
    7668:	40f687b3          	sub	a5,a3,a5
    766c:	02000693          	li	a3,32
    7670:	00f4d7b3          	srl	a5,s1,a5
    7674:	00d70863          	beq	a4,a3,7684 <__muldf3+0x72c>
    7678:	43e30313          	add	t1,t1,1086
    767c:	00649333          	sll	t1,s1,t1
    7680:	006a6a33          	or	s4,s4,t1
    7684:	01403633          	snez	a2,s4
    7688:	00f66633          	or	a2,a2,a5
    768c:	00767713          	and	a4,a2,7
    7690:	00000693          	li	a3,0
    7694:	02070863          	beqz	a4,76c4 <__muldf3+0x76c>
    7698:	00f67793          	and	a5,a2,15
    769c:	00400713          	li	a4,4
    76a0:	00000593          	li	a1,0
    76a4:	00e78a63          	beq	a5,a4,76b8 <__muldf3+0x760>
    76a8:	00460793          	add	a5,a2,4
    76ac:	00c7b633          	sltu	a2,a5,a2
    76b0:	00c035b3          	snez	a1,a2
    76b4:	00078613          	mv	a2,a5
    76b8:	00959693          	sll	a3,a1,0x9
    76bc:	01d59713          	sll	a4,a1,0x1d
    76c0:	00c6d693          	srl	a3,a3,0xc
    76c4:	00365613          	srl	a2,a2,0x3
    76c8:	00e66733          	or	a4,a2,a4
    76cc:	00000793          	li	a5,0
    76d0:	a39ff06f          	j	7108 <__muldf3+0x1b0>
    76d4:	00040493          	mv	s1,s0
    76d8:	000a8a13          	mv	s4,s5
    76dc:	00300b93          	li	s7,3
    76e0:	00098593          	mv	a1,s3
    76e4:	9fdff06f          	j	70e0 <__muldf3+0x188>

000076e8 <__fixdfsi>:
    76e8:	0145d793          	srl	a5,a1,0x14
    76ec:	001006b7          	lui	a3,0x100
    76f0:	fff68713          	add	a4,a3,-1 # fffff <__subdf3+0xf840f>
    76f4:	7ff7f793          	and	a5,a5,2047
    76f8:	3fe00613          	li	a2,1022
    76fc:	00b77733          	and	a4,a4,a1
    7700:	01f5d593          	srl	a1,a1,0x1f
    7704:	00f65e63          	bge	a2,a5,7720 <__fixdfsi+0x38>
    7708:	41d00613          	li	a2,1053
    770c:	00f65e63          	bge	a2,a5,7728 <__fixdfsi+0x40>
    7710:	80000537          	lui	a0,0x80000
    7714:	fff50513          	add	a0,a0,-1 # 7fffffff <__subdf3+0x7fff840f>
    7718:	00a58533          	add	a0,a1,a0
    771c:	00008067          	ret
    7720:	00000513          	li	a0,0
    7724:	00008067          	ret
    7728:	43300613          	li	a2,1075
    772c:	40f60633          	sub	a2,a2,a5
    7730:	01f00813          	li	a6,31
    7734:	00d76733          	or	a4,a4,a3
    7738:	02c85063          	bge	a6,a2,7758 <__fixdfsi+0x70>
    773c:	41300693          	li	a3,1043
    7740:	40f687b3          	sub	a5,a3,a5
    7744:	00f75733          	srl	a4,a4,a5
    7748:	40e00533          	neg	a0,a4
    774c:	fc059ce3          	bnez	a1,7724 <__fixdfsi+0x3c>
    7750:	00070513          	mv	a0,a4
    7754:	00008067          	ret
    7758:	bed78793          	add	a5,a5,-1043
    775c:	00f71733          	sll	a4,a4,a5
    7760:	00c55533          	srl	a0,a0,a2
    7764:	00a76733          	or	a4,a4,a0
    7768:	fe1ff06f          	j	7748 <__fixdfsi+0x60>

0000776c <__fixunsdfsi>:
    776c:	0145d793          	srl	a5,a1,0x14
    7770:	00100637          	lui	a2,0x100
    7774:	fff60713          	add	a4,a2,-1 # fffff <__subdf3+0xf840f>
    7778:	7ff7f793          	and	a5,a5,2047
    777c:	3fe00813          	li	a6,1022
    7780:	00050693          	mv	a3,a0
    7784:	00b77733          	and	a4,a4,a1
    7788:	00000513          	li	a0,0
    778c:	01f5d593          	srl	a1,a1,0x1f
    7790:	00f85463          	bge	a6,a5,7798 <__fixunsdfsi+0x2c>
    7794:	00058463          	beqz	a1,779c <__fixunsdfsi+0x30>
    7798:	00008067          	ret
    779c:	41e00593          	li	a1,1054
    77a0:	fff00513          	li	a0,-1
    77a4:	fef5cae3          	blt	a1,a5,7798 <__fixunsdfsi+0x2c>
    77a8:	43300593          	li	a1,1075
    77ac:	40f585b3          	sub	a1,a1,a5
    77b0:	01f00513          	li	a0,31
    77b4:	00c76733          	or	a4,a4,a2
    77b8:	00b54c63          	blt	a0,a1,77d0 <__fixunsdfsi+0x64>
    77bc:	bed78793          	add	a5,a5,-1043
    77c0:	00f71733          	sll	a4,a4,a5
    77c4:	00b6d533          	srl	a0,a3,a1
    77c8:	00a76533          	or	a0,a4,a0
    77cc:	00008067          	ret
    77d0:	41300513          	li	a0,1043
    77d4:	40f50533          	sub	a0,a0,a5
    77d8:	00a75533          	srl	a0,a4,a0
    77dc:	00008067          	ret

000077e0 <__floatunsidf>:
    77e0:	ff010113          	add	sp,sp,-16
    77e4:	00812423          	sw	s0,8(sp)
    77e8:	00112623          	sw	ra,12(sp)
    77ec:	00050413          	mv	s0,a0
    77f0:	04050c63          	beqz	a0,7848 <__floatunsidf+0x68>
    77f4:	188000ef          	jal	797c <__clzsi2>
    77f8:	41e00793          	li	a5,1054
    77fc:	40a787b3          	sub	a5,a5,a0
    7800:	00a00713          	li	a4,10
    7804:	7ff7f793          	and	a5,a5,2047
    7808:	06a74463          	blt	a4,a0,7870 <__floatunsidf+0x90>
    780c:	00b00713          	li	a4,11
    7810:	40a70733          	sub	a4,a4,a0
    7814:	01550513          	add	a0,a0,21
    7818:	00e45733          	srl	a4,s0,a4
    781c:	00a41433          	sll	s0,s0,a0
    7820:	00c12083          	lw	ra,12(sp)
    7824:	00040513          	mv	a0,s0
    7828:	00c71713          	sll	a4,a4,0xc
    782c:	00812403          	lw	s0,8(sp)
    7830:	00c75713          	srl	a4,a4,0xc
    7834:	01479793          	sll	a5,a5,0x14
    7838:	00e7e7b3          	or	a5,a5,a4
    783c:	00078593          	mv	a1,a5
    7840:	01010113          	add	sp,sp,16
    7844:	00008067          	ret
    7848:	00c12083          	lw	ra,12(sp)
    784c:	00040513          	mv	a0,s0
    7850:	00000793          	li	a5,0
    7854:	00812403          	lw	s0,8(sp)
    7858:	00000713          	li	a4,0
    785c:	01479793          	sll	a5,a5,0x14
    7860:	00e7e7b3          	or	a5,a5,a4
    7864:	00078593          	mv	a1,a5
    7868:	01010113          	add	sp,sp,16
    786c:	00008067          	ret
    7870:	ff550513          	add	a0,a0,-11
    7874:	00a41733          	sll	a4,s0,a0
    7878:	00000413          	li	s0,0
    787c:	00c12083          	lw	ra,12(sp)
    7880:	00040513          	mv	a0,s0
    7884:	00c71713          	sll	a4,a4,0xc
    7888:	00812403          	lw	s0,8(sp)
    788c:	00c75713          	srl	a4,a4,0xc
    7890:	01479793          	sll	a5,a5,0x14
    7894:	00e7e7b3          	or	a5,a5,a4
    7898:	00078593          	mv	a1,a5
    789c:	01010113          	add	sp,sp,16
    78a0:	00008067          	ret

000078a4 <__mulsi3>:
    78a4:	00050613          	mv	a2,a0
    78a8:	00000513          	li	a0,0
    78ac:	0015f693          	and	a3,a1,1
    78b0:	00068463          	beqz	a3,78b8 <__mulsi3+0x14>
    78b4:	00c50533          	add	a0,a0,a2
    78b8:	0015d593          	srl	a1,a1,0x1
    78bc:	00161613          	sll	a2,a2,0x1
    78c0:	fe0596e3          	bnez	a1,78ac <__mulsi3+0x8>
    78c4:	00008067          	ret

000078c8 <__divsi3>:
    78c8:	06054063          	bltz	a0,7928 <__umodsi3+0x10>
    78cc:	0605c663          	bltz	a1,7938 <__umodsi3+0x20>

000078d0 <__hidden___udivsi3>:
    78d0:	00058613          	mv	a2,a1
    78d4:	00050593          	mv	a1,a0
    78d8:	fff00513          	li	a0,-1
    78dc:	02060c63          	beqz	a2,7914 <__hidden___udivsi3+0x44>
    78e0:	00100693          	li	a3,1
    78e4:	00b67a63          	bgeu	a2,a1,78f8 <__hidden___udivsi3+0x28>
    78e8:	00c05863          	blez	a2,78f8 <__hidden___udivsi3+0x28>
    78ec:	00161613          	sll	a2,a2,0x1
    78f0:	00169693          	sll	a3,a3,0x1
    78f4:	feb66ae3          	bltu	a2,a1,78e8 <__hidden___udivsi3+0x18>
    78f8:	00000513          	li	a0,0
    78fc:	00c5e663          	bltu	a1,a2,7908 <__hidden___udivsi3+0x38>
    7900:	40c585b3          	sub	a1,a1,a2
    7904:	00d56533          	or	a0,a0,a3
    7908:	0016d693          	srl	a3,a3,0x1
    790c:	00165613          	srl	a2,a2,0x1
    7910:	fe0696e3          	bnez	a3,78fc <__hidden___udivsi3+0x2c>
    7914:	00008067          	ret

00007918 <__umodsi3>:
    7918:	00008293          	mv	t0,ra
    791c:	fb5ff0ef          	jal	78d0 <__hidden___udivsi3>
    7920:	00058513          	mv	a0,a1
    7924:	00028067          	jr	t0
    7928:	40a00533          	neg	a0,a0
    792c:	00b04863          	bgtz	a1,793c <__umodsi3+0x24>
    7930:	40b005b3          	neg	a1,a1
    7934:	f9dff06f          	j	78d0 <__hidden___udivsi3>
    7938:	40b005b3          	neg	a1,a1
    793c:	00008293          	mv	t0,ra
    7940:	f91ff0ef          	jal	78d0 <__hidden___udivsi3>
    7944:	40a00533          	neg	a0,a0
    7948:	00028067          	jr	t0

0000794c <__modsi3>:
    794c:	00008293          	mv	t0,ra
    7950:	0005ca63          	bltz	a1,7964 <__modsi3+0x18>
    7954:	00054c63          	bltz	a0,796c <__modsi3+0x20>
    7958:	f79ff0ef          	jal	78d0 <__hidden___udivsi3>
    795c:	00058513          	mv	a0,a1
    7960:	00028067          	jr	t0
    7964:	40b005b3          	neg	a1,a1
    7968:	fe0558e3          	bgez	a0,7958 <__modsi3+0xc>
    796c:	40a00533          	neg	a0,a0
    7970:	f61ff0ef          	jal	78d0 <__hidden___udivsi3>
    7974:	40b00533          	neg	a0,a1
    7978:	00028067          	jr	t0

0000797c <__clzsi2>:
    797c:	000107b7          	lui	a5,0x10
    7980:	02f57863          	bgeu	a0,a5,79b0 <__clzsi2+0x34>
    7984:	10053793          	sltiu	a5,a0,256
    7988:	0017b793          	seqz	a5,a5
    798c:	00379793          	sll	a5,a5,0x3
    7990:	02000713          	li	a4,32
    7994:	40f70733          	sub	a4,a4,a5
    7998:	00f55533          	srl	a0,a0,a5
    799c:	7dc00793          	li	a5,2012
    79a0:	00a787b3          	add	a5,a5,a0
    79a4:	0007c503          	lbu	a0,0(a5) # 10000 <__subdf3+0x8410>
    79a8:	40a70533          	sub	a0,a4,a0
    79ac:	00008067          	ret
    79b0:	010007b7          	lui	a5,0x1000
    79b4:	02f57263          	bgeu	a0,a5,79d8 <__clzsi2+0x5c>
    79b8:	01000793          	li	a5,16
    79bc:	00f55533          	srl	a0,a0,a5
    79c0:	7dc00793          	li	a5,2012
    79c4:	00a787b3          	add	a5,a5,a0
    79c8:	0007c503          	lbu	a0,0(a5) # 1000000 <__subdf3+0xff8410>
    79cc:	01000713          	li	a4,16
    79d0:	40a70533          	sub	a0,a4,a0
    79d4:	00008067          	ret
    79d8:	01800793          	li	a5,24
    79dc:	00f55533          	srl	a0,a0,a5
    79e0:	7dc00793          	li	a5,2012
    79e4:	00a787b3          	add	a5,a5,a0
    79e8:	0007c503          	lbu	a0,0(a5)
    79ec:	00800713          	li	a4,8
    79f0:	40a70533          	sub	a0,a4,a0
    79f4:	00008067          	ret

000079f8 <modf>:
    79f8:	4145d793          	sra	a5,a1,0x14
    79fc:	ff010113          	add	sp,sp,-16
    7a00:	7ff7f793          	and	a5,a5,2047
    7a04:	00812423          	sw	s0,8(sp)
    7a08:	00912223          	sw	s1,4(sp)
    7a0c:	01212023          	sw	s2,0(sp)
    7a10:	00112623          	sw	ra,12(sp)
    7a14:	c0178713          	add	a4,a5,-1023
    7a18:	01300693          	li	a3,19
    7a1c:	00058413          	mv	s0,a1
    7a20:	00050493          	mv	s1,a0
    7a24:	00060913          	mv	s2,a2
    7a28:	04e6cc63          	blt	a3,a4,7a80 <modf+0x88>
    7a2c:	10074a63          	bltz	a4,7b40 <modf+0x148>
    7a30:	001007b7          	lui	a5,0x100
    7a34:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf840f>
    7a38:	40e7d7b3          	sra	a5,a5,a4
    7a3c:	00b7f733          	and	a4,a5,a1
    7a40:	00a76733          	or	a4,a4,a0
    7a44:	06071a63          	bnez	a4,7ab8 <modf+0xc0>
    7a48:	00040793          	mv	a5,s0
    7a4c:	800006b7          	lui	a3,0x80000
    7a50:	00992023          	sw	s1,0(s2)
    7a54:	0086f433          	and	s0,a3,s0
    7a58:	00f92223          	sw	a5,4(s2)
    7a5c:	00000493          	li	s1,0
    7a60:	00c12083          	lw	ra,12(sp)
    7a64:	00040593          	mv	a1,s0
    7a68:	00812403          	lw	s0,8(sp)
    7a6c:	00012903          	lw	s2,0(sp)
    7a70:	00048513          	mv	a0,s1
    7a74:	00412483          	lw	s1,4(sp)
    7a78:	01010113          	add	sp,sp,16
    7a7c:	00008067          	ret
    7a80:	03300693          	li	a3,51
    7a84:	08e6c263          	blt	a3,a4,7b08 <modf+0x110>
    7a88:	fff00713          	li	a4,-1
    7a8c:	bed78793          	add	a5,a5,-1043
    7a90:	00f757b3          	srl	a5,a4,a5
    7a94:	00a7f733          	and	a4,a5,a0
    7a98:	fa0708e3          	beqz	a4,7a48 <modf+0x50>
    7a9c:	fff7c793          	not	a5,a5
    7aa0:	00a7f7b3          	and	a5,a5,a0
    7aa4:	00078813          	mv	a6,a5
    7aa8:	00078613          	mv	a2,a5
    7aac:	00058893          	mv	a7,a1
    7ab0:	00058693          	mv	a3,a1
    7ab4:	0200006f          	j	7ad4 <modf+0xdc>
    7ab8:	fff7c793          	not	a5,a5
    7abc:	00000713          	li	a4,0
    7ac0:	00b7f7b3          	and	a5,a5,a1
    7ac4:	00070813          	mv	a6,a4
    7ac8:	00070613          	mv	a2,a4
    7acc:	00078893          	mv	a7,a5
    7ad0:	00078693          	mv	a3,a5
    7ad4:	01092023          	sw	a6,0(s2)
    7ad8:	01192223          	sw	a7,4(s2)
    7adc:	114000ef          	jal	7bf0 <__subdf3>
    7ae0:	00058413          	mv	s0,a1
    7ae4:	00c12083          	lw	ra,12(sp)
    7ae8:	00040593          	mv	a1,s0
    7aec:	00812403          	lw	s0,8(sp)
    7af0:	00050493          	mv	s1,a0
    7af4:	00012903          	lw	s2,0(sp)
    7af8:	00048513          	mv	a0,s1
    7afc:	00412483          	lw	s1,4(sp)
    7b00:	01010113          	add	sp,sp,16
    7b04:	00008067          	ret
    7b08:	00a92023          	sw	a0,0(s2)
    7b0c:	00b92223          	sw	a1,4(s2)
    7b10:	070000ef          	jal	7b80 <__fpclassifyd>
    7b14:	04051e63          	bnez	a0,7b70 <modf+0x178>
    7b18:	00048613          	mv	a2,s1
    7b1c:	00048513          	mv	a0,s1
    7b20:	00040693          	mv	a3,s0
    7b24:	00040593          	mv	a1,s0
    7b28:	82cfe0ef          	jal	5b54 <__adddf3>
    7b2c:	00050493          	mv	s1,a0
    7b30:	00058413          	mv	s0,a1
    7b34:	00a92023          	sw	a0,0(s2)
    7b38:	00b92223          	sw	a1,4(s2)
    7b3c:	f25ff06f          	j	7a60 <modf+0x68>
    7b40:	800007b7          	lui	a5,0x80000
    7b44:	00c12083          	lw	ra,12(sp)
    7b48:	00b7f7b3          	and	a5,a5,a1
    7b4c:	00040593          	mv	a1,s0
    7b50:	00812403          	lw	s0,8(sp)
    7b54:	00062023          	sw	zero,0(a2)
    7b58:	00f62223          	sw	a5,4(a2)
    7b5c:	00012903          	lw	s2,0(sp)
    7b60:	00048513          	mv	a0,s1
    7b64:	00412483          	lw	s1,4(sp)
    7b68:	01010113          	add	sp,sp,16
    7b6c:	00008067          	ret
    7b70:	800007b7          	lui	a5,0x80000
    7b74:	0087f433          	and	s0,a5,s0
    7b78:	00000493          	li	s1,0
    7b7c:	ee5ff06f          	j	7a60 <modf+0x68>

00007b80 <__fpclassifyd>:
    7b80:	00b56733          	or	a4,a0,a1
    7b84:	00050793          	mv	a5,a0
    7b88:	04070c63          	beqz	a4,7be0 <__fpclassifyd+0x60>
    7b8c:	80000737          	lui	a4,0x80000
    7b90:	04e58263          	beq	a1,a4,7bd4 <__fpclassifyd+0x54>
    7b94:	fff70693          	add	a3,a4,-1 # 7fffffff <__subdf3+0x7fff840f>
    7b98:	00b6f6b3          	and	a3,a3,a1
    7b9c:	fff00837          	lui	a6,0xfff00
    7ba0:	01068833          	add	a6,a3,a6
    7ba4:	7fe008b7          	lui	a7,0x7fe00
    7ba8:	00400513          	li	a0,4
    7bac:	03186263          	bltu	a6,a7,7bd0 <__fpclassifyd+0x50>
    7bb0:	00100837          	lui	a6,0x100
    7bb4:	00300513          	li	a0,3
    7bb8:	0105ec63          	bltu	a1,a6,7bd0 <__fpclassifyd+0x50>
    7bbc:	00b70733          	add	a4,a4,a1
    7bc0:	01076863          	bltu	a4,a6,7bd0 <__fpclassifyd+0x50>
    7bc4:	7ff00737          	lui	a4,0x7ff00
    7bc8:	00000513          	li	a0,0
    7bcc:	00e68e63          	beq	a3,a4,7be8 <__fpclassifyd+0x68>
    7bd0:	00008067          	ret
    7bd4:	00a03533          	snez	a0,a0
    7bd8:	00250513          	add	a0,a0,2
    7bdc:	00008067          	ret
    7be0:	00200513          	li	a0,2
    7be4:	00008067          	ret
    7be8:	0017b513          	seqz	a0,a5
    7bec:	00008067          	ret

00007bf0 <__subdf3>:
    7bf0:	001007b7          	lui	a5,0x100
    7bf4:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf840f>
    7bf8:	fe010113          	add	sp,sp,-32
    7bfc:	00b7f8b3          	and	a7,a5,a1
    7c00:	00d7f833          	and	a6,a5,a3
    7c04:	0146d793          	srl	a5,a3,0x14
    7c08:	00389893          	sll	a7,a7,0x3
    7c0c:	00812c23          	sw	s0,24(sp)
    7c10:	01312623          	sw	s3,12(sp)
    7c14:	01f5d413          	srl	s0,a1,0x1f
    7c18:	0145d993          	srl	s3,a1,0x14
    7c1c:	01d55713          	srl	a4,a0,0x1d
    7c20:	00381813          	sll	a6,a6,0x3
    7c24:	01d65593          	srl	a1,a2,0x1d
    7c28:	00112e23          	sw	ra,28(sp)
    7c2c:	00912a23          	sw	s1,20(sp)
    7c30:	01212823          	sw	s2,16(sp)
    7c34:	7ff7ff13          	and	t5,a5,2047
    7c38:	7ff00313          	li	t1,2047
    7c3c:	01176733          	or	a4,a4,a7
    7c40:	7ff9f993          	and	s3,s3,2047
    7c44:	00040e13          	mv	t3,s0
    7c48:	00351893          	sll	a7,a0,0x3
    7c4c:	01f6d693          	srl	a3,a3,0x1f
    7c50:	0105e5b3          	or	a1,a1,a6
    7c54:	00361e93          	sll	t4,a2,0x3
    7c58:	206f0c63          	beq	t5,t1,7e70 <__subdf3+0x280>
    7c5c:	0016c693          	xor	a3,a3,1
    7c60:	41e987b3          	sub	a5,s3,t5
    7c64:	16d40263          	beq	s0,a3,7dc8 <__subdf3+0x1d8>
    7c68:	00f05ae3          	blez	a5,847c <__subdf3+0x88c>
    7c6c:	240f0a63          	beqz	t5,7ec0 <__subdf3+0x2d0>
    7c70:	3c698463          	beq	s3,t1,8038 <__subdf3+0x448>
    7c74:	03800693          	li	a3,56
    7c78:	00100513          	li	a0,1
    7c7c:	02f6ce63          	blt	a3,a5,7cb8 <__subdf3+0xc8>
    7c80:	008006b7          	lui	a3,0x800
    7c84:	00d5e5b3          	or	a1,a1,a3
    7c88:	01f00693          	li	a3,31
    7c8c:	4ef6c463          	blt	a3,a5,8174 <__subdf3+0x584>
    7c90:	02000693          	li	a3,32
    7c94:	40f686b3          	sub	a3,a3,a5
    7c98:	00d59533          	sll	a0,a1,a3
    7c9c:	00fed633          	srl	a2,t4,a5
    7ca0:	00de96b3          	sll	a3,t4,a3
    7ca4:	00c56533          	or	a0,a0,a2
    7ca8:	00d036b3          	snez	a3,a3
    7cac:	00f5d7b3          	srl	a5,a1,a5
    7cb0:	00d56533          	or	a0,a0,a3
    7cb4:	40f70733          	sub	a4,a4,a5
    7cb8:	40a88533          	sub	a0,a7,a0
    7cbc:	00a8b633          	sltu	a2,a7,a0
    7cc0:	00050493          	mv	s1,a0
    7cc4:	40c70933          	sub	s2,a4,a2
    7cc8:	00891793          	sll	a5,s2,0x8
    7ccc:	3407d863          	bgez	a5,801c <__subdf3+0x42c>
    7cd0:	008007b7          	lui	a5,0x800
    7cd4:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f840f>
    7cd8:	00f97933          	and	s2,s2,a5
    7cdc:	2e090663          	beqz	s2,7fc8 <__subdf3+0x3d8>
    7ce0:	00090513          	mv	a0,s2
    7ce4:	c99ff0ef          	jal	797c <__clzsi2>
    7ce8:	ff850793          	add	a5,a0,-8
    7cec:	02000693          	li	a3,32
    7cf0:	40f68733          	sub	a4,a3,a5
    7cf4:	00e4d733          	srl	a4,s1,a4
    7cf8:	00f91933          	sll	s2,s2,a5
    7cfc:	01276733          	or	a4,a4,s2
    7d00:	00f494b3          	sll	s1,s1,a5
    7d04:	3f37c463          	blt	a5,s3,80ec <__subdf3+0x4fc>
    7d08:	413787b3          	sub	a5,a5,s3
    7d0c:	00178793          	add	a5,a5,1
    7d10:	40f686b3          	sub	a3,a3,a5
    7d14:	00d49633          	sll	a2,s1,a3
    7d18:	00f4d933          	srl	s2,s1,a5
    7d1c:	00c03633          	snez	a2,a2
    7d20:	00c96633          	or	a2,s2,a2
    7d24:	00d716b3          	sll	a3,a4,a3
    7d28:	00c6e4b3          	or	s1,a3,a2
    7d2c:	00f75933          	srl	s2,a4,a5
    7d30:	00000993          	li	s3,0
    7d34:	0074f793          	and	a5,s1,7
    7d38:	02078063          	beqz	a5,7d58 <__subdf3+0x168>
    7d3c:	00f4f793          	and	a5,s1,15
    7d40:	00400713          	li	a4,4
    7d44:	00e78a63          	beq	a5,a4,7d58 <__subdf3+0x168>
    7d48:	00448793          	add	a5,s1,4
    7d4c:	0097b533          	sltu	a0,a5,s1
    7d50:	00a90933          	add	s2,s2,a0
    7d54:	00078493          	mv	s1,a5
    7d58:	00891793          	sll	a5,s2,0x8
    7d5c:	6c07d063          	bgez	a5,841c <__subdf3+0x82c>
    7d60:	00198793          	add	a5,s3,1
    7d64:	7ff00713          	li	a4,2047
    7d68:	24e78663          	beq	a5,a4,7fb4 <__subdf3+0x3c4>
    7d6c:	ff800737          	lui	a4,0xff800
    7d70:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f840f>
    7d74:	00e97733          	and	a4,s2,a4
    7d78:	7ff7f793          	and	a5,a5,2047
    7d7c:	01d71813          	sll	a6,a4,0x1d
    7d80:	0034d513          	srl	a0,s1,0x3
    7d84:	00971713          	sll	a4,a4,0x9
    7d88:	00a86833          	or	a6,a6,a0
    7d8c:	00c75713          	srl	a4,a4,0xc
    7d90:	00147e13          	and	t3,s0,1
    7d94:	01c12083          	lw	ra,28(sp)
    7d98:	01812403          	lw	s0,24(sp)
    7d9c:	01479793          	sll	a5,a5,0x14
    7da0:	00e7e7b3          	or	a5,a5,a4
    7da4:	01fe1713          	sll	a4,t3,0x1f
    7da8:	00e7e7b3          	or	a5,a5,a4
    7dac:	01412483          	lw	s1,20(sp)
    7db0:	01012903          	lw	s2,16(sp)
    7db4:	00c12983          	lw	s3,12(sp)
    7db8:	00080513          	mv	a0,a6
    7dbc:	00078593          	mv	a1,a5
    7dc0:	02010113          	add	sp,sp,32
    7dc4:	00008067          	ret
    7dc8:	70f05263          	blez	a5,84cc <__subdf3+0x8dc>
    7dcc:	1c0f1663          	bnez	t5,7f98 <__subdf3+0x3a8>
    7dd0:	01d5e6b3          	or	a3,a1,t4
    7dd4:	26068e63          	beqz	a3,8050 <__subdf3+0x460>
    7dd8:	fff78693          	add	a3,a5,-1
    7ddc:	46068863          	beqz	a3,824c <__subdf3+0x65c>
    7de0:	24678c63          	beq	a5,t1,8038 <__subdf3+0x448>
    7de4:	03800793          	li	a5,56
    7de8:	00100913          	li	s2,1
    7dec:	02d7cc63          	blt	a5,a3,7e24 <__subdf3+0x234>
    7df0:	00068793          	mv	a5,a3
    7df4:	01f00693          	li	a3,31
    7df8:	48f6ca63          	blt	a3,a5,828c <__subdf3+0x69c>
    7dfc:	02000693          	li	a3,32
    7e00:	40f686b3          	sub	a3,a3,a5
    7e04:	00d59933          	sll	s2,a1,a3
    7e08:	00fed633          	srl	a2,t4,a5
    7e0c:	00de96b3          	sll	a3,t4,a3
    7e10:	00c96933          	or	s2,s2,a2
    7e14:	00d036b3          	snez	a3,a3
    7e18:	00f5d7b3          	srl	a5,a1,a5
    7e1c:	00d96933          	or	s2,s2,a3
    7e20:	00f70733          	add	a4,a4,a5
    7e24:	01190633          	add	a2,s2,a7
    7e28:	01263933          	sltu	s2,a2,s2
    7e2c:	00060493          	mv	s1,a2
    7e30:	00e90933          	add	s2,s2,a4
    7e34:	00891793          	sll	a5,s2,0x8
    7e38:	1e07d263          	bgez	a5,801c <__subdf3+0x42c>
    7e3c:	00198993          	add	s3,s3,1
    7e40:	7ff00793          	li	a5,2047
    7e44:	16f98863          	beq	s3,a5,7fb4 <__subdf3+0x3c4>
    7e48:	ff8007b7          	lui	a5,0xff800
    7e4c:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f840f>
    7e50:	0014f513          	and	a0,s1,1
    7e54:	00f977b3          	and	a5,s2,a5
    7e58:	0014d713          	srl	a4,s1,0x1
    7e5c:	00a76733          	or	a4,a4,a0
    7e60:	01f79513          	sll	a0,a5,0x1f
    7e64:	00e564b3          	or	s1,a0,a4
    7e68:	0017d913          	srl	s2,a5,0x1
    7e6c:	ec9ff06f          	j	7d34 <__subdf3+0x144>
    7e70:	01d5e833          	or	a6,a1,t4
    7e74:	80198313          	add	t1,s3,-2047
    7e78:	06080863          	beqz	a6,7ee8 <__subdf3+0x2f8>
    7e7c:	06d40a63          	beq	s0,a3,7ef0 <__subdf3+0x300>
    7e80:	0e030463          	beqz	t1,7f68 <__subdf3+0x378>
    7e84:	26098e63          	beqz	s3,8100 <__subdf3+0x510>
    7e88:	00361513          	sll	a0,a2,0x3
    7e8c:	00355513          	srl	a0,a0,0x3
    7e90:	00068413          	mv	s0,a3
    7e94:	00058713          	mv	a4,a1
    7e98:	01d71813          	sll	a6,a4,0x1d
    7e9c:	00a86833          	or	a6,a6,a0
    7ea0:	00375713          	srl	a4,a4,0x3
    7ea4:	01076733          	or	a4,a4,a6
    7ea8:	10070663          	beqz	a4,7fb4 <__subdf3+0x3c4>
    7eac:	00000e13          	li	t3,0
    7eb0:	7ff00793          	li	a5,2047
    7eb4:	00080737          	lui	a4,0x80
    7eb8:	00000813          	li	a6,0
    7ebc:	ed9ff06f          	j	7d94 <__subdf3+0x1a4>
    7ec0:	01d5e6b3          	or	a3,a1,t4
    7ec4:	18068663          	beqz	a3,8050 <__subdf3+0x460>
    7ec8:	fff78693          	add	a3,a5,-1
    7ecc:	3a068263          	beqz	a3,8270 <__subdf3+0x680>
    7ed0:	16678463          	beq	a5,t1,8038 <__subdf3+0x448>
    7ed4:	03800793          	li	a5,56
    7ed8:	00100513          	li	a0,1
    7edc:	dcd7cee3          	blt	a5,a3,7cb8 <__subdf3+0xc8>
    7ee0:	00068793          	mv	a5,a3
    7ee4:	da5ff06f          	j	7c88 <__subdf3+0x98>
    7ee8:	0016c693          	xor	a3,a3,1
    7eec:	f8d41ae3          	bne	s0,a3,7e80 <__subdf3+0x290>
    7ef0:	18030863          	beqz	t1,8080 <__subdf3+0x490>
    7ef4:	2c099063          	bnez	s3,81b4 <__subdf3+0x5c4>
    7ef8:	7ff00793          	li	a5,2047
    7efc:	011766b3          	or	a3,a4,a7
    7f00:	48068863          	beqz	a3,8390 <__subdf3+0x7a0>
    7f04:	fff78693          	add	a3,a5,-1
    7f08:	34068263          	beqz	a3,824c <__subdf3+0x65c>
    7f0c:	7ff00513          	li	a0,2047
    7f10:	2aa78263          	beq	a5,a0,81b4 <__subdf3+0x5c4>
    7f14:	03800793          	li	a5,56
    7f18:	00100913          	li	s2,1
    7f1c:	02d7ca63          	blt	a5,a3,7f50 <__subdf3+0x360>
    7f20:	01f00793          	li	a5,31
    7f24:	4cd7c663          	blt	a5,a3,83f0 <__subdf3+0x800>
    7f28:	02000793          	li	a5,32
    7f2c:	40d787b3          	sub	a5,a5,a3
    7f30:	00f71933          	sll	s2,a4,a5
    7f34:	00d8d633          	srl	a2,a7,a3
    7f38:	00f897b3          	sll	a5,a7,a5
    7f3c:	00c96933          	or	s2,s2,a2
    7f40:	00f037b3          	snez	a5,a5
    7f44:	00d756b3          	srl	a3,a4,a3
    7f48:	00f96933          	or	s2,s2,a5
    7f4c:	00d585b3          	add	a1,a1,a3
    7f50:	01d90733          	add	a4,s2,t4
    7f54:	01273933          	sltu	s2,a4,s2
    7f58:	00070493          	mv	s1,a4
    7f5c:	00b90933          	add	s2,s2,a1
    7f60:	000f0993          	mv	s3,t5
    7f64:	ed1ff06f          	j	7e34 <__subdf3+0x244>
    7f68:	00198793          	add	a5,s3,1
    7f6c:	7fe7f793          	and	a5,a5,2046
    7f70:	14079463          	bnez	a5,80b8 <__subdf3+0x4c8>
    7f74:	01d5e833          	or	a6,a1,t4
    7f78:	011767b3          	or	a5,a4,a7
    7f7c:	2a099463          	bnez	s3,8224 <__subdf3+0x634>
    7f80:	38078e63          	beqz	a5,831c <__subdf3+0x72c>
    7f84:	3c081063          	bnez	a6,8344 <__subdf3+0x754>
    7f88:	00351513          	sll	a0,a0,0x3
    7f8c:	00355913          	srl	s2,a0,0x3
    7f90:	00000793          	li	a5,0
    7f94:	1140006f          	j	80a8 <__subdf3+0x4b8>
    7f98:	0a698063          	beq	s3,t1,8038 <__subdf3+0x448>
    7f9c:	03800693          	li	a3,56
    7fa0:	00100913          	li	s2,1
    7fa4:	e8f6c0e3          	blt	a3,a5,7e24 <__subdf3+0x234>
    7fa8:	008006b7          	lui	a3,0x800
    7fac:	00d5e5b3          	or	a1,a1,a3
    7fb0:	e45ff06f          	j	7df4 <__subdf3+0x204>
    7fb4:	00147e13          	and	t3,s0,1
    7fb8:	7ff00793          	li	a5,2047
    7fbc:	00000713          	li	a4,0
    7fc0:	00000813          	li	a6,0
    7fc4:	dd1ff06f          	j	7d94 <__subdf3+0x1a4>
    7fc8:	00048513          	mv	a0,s1
    7fcc:	9b1ff0ef          	jal	797c <__clzsi2>
    7fd0:	01850793          	add	a5,a0,24
    7fd4:	01f00693          	li	a3,31
    7fd8:	d0f6dae3          	bge	a3,a5,7cec <__subdf3+0xfc>
    7fdc:	ff850713          	add	a4,a0,-8
    7fe0:	00e49733          	sll	a4,s1,a4
    7fe4:	1b37ce63          	blt	a5,s3,81a0 <__subdf3+0x5b0>
    7fe8:	413789b3          	sub	s3,a5,s3
    7fec:	00198793          	add	a5,s3,1
    7ff0:	42f6de63          	bge	a3,a5,842c <__subdf3+0x83c>
    7ff4:	fe198993          	add	s3,s3,-31
    7ff8:	02000693          	li	a3,32
    7ffc:	013754b3          	srl	s1,a4,s3
    8000:	00d78c63          	beq	a5,a3,8018 <__subdf3+0x428>
    8004:	04000693          	li	a3,64
    8008:	40f687b3          	sub	a5,a3,a5
    800c:	00f71733          	sll	a4,a4,a5
    8010:	00e03733          	snez	a4,a4
    8014:	00e4e4b3          	or	s1,s1,a4
    8018:	00000993          	li	s3,0
    801c:	0074f793          	and	a5,s1,7
    8020:	d0079ee3          	bnez	a5,7d3c <__subdf3+0x14c>
    8024:	00098793          	mv	a5,s3
    8028:	0034d513          	srl	a0,s1,0x3
    802c:	00090713          	mv	a4,s2
    8030:	0280006f          	j	8058 <__subdf3+0x468>
    8034:	e6081ce3          	bnez	a6,7eac <__subdf3+0x2bc>
    8038:	00351513          	sll	a0,a0,0x3
    803c:	01d71813          	sll	a6,a4,0x1d
    8040:	00355513          	srl	a0,a0,0x3
    8044:	00a86833          	or	a6,a6,a0
    8048:	00375713          	srl	a4,a4,0x3
    804c:	e59ff06f          	j	7ea4 <__subdf3+0x2b4>
    8050:	00351513          	sll	a0,a0,0x3
    8054:	00355513          	srl	a0,a0,0x3
    8058:	01d71813          	sll	a6,a4,0x1d
    805c:	7ff00693          	li	a3,2047
    8060:	00a86833          	or	a6,a6,a0
    8064:	00375713          	srl	a4,a4,0x3
    8068:	e2d78ee3          	beq	a5,a3,7ea4 <__subdf3+0x2b4>
    806c:	00c71713          	sll	a4,a4,0xc
    8070:	00c75713          	srl	a4,a4,0xc
    8074:	7ff7f793          	and	a5,a5,2047
    8078:	00147e13          	and	t3,s0,1
    807c:	d19ff06f          	j	7d94 <__subdf3+0x1a4>
    8080:	00198693          	add	a3,s3,1
    8084:	7fe6f793          	and	a5,a3,2046
    8088:	12079e63          	bnez	a5,81c4 <__subdf3+0x5d4>
    808c:	011767b3          	or	a5,a4,a7
    8090:	24099a63          	bnez	s3,82e4 <__subdf3+0x6f4>
    8094:	30078663          	beqz	a5,83a0 <__subdf3+0x7b0>
    8098:	01d5e7b3          	or	a5,a1,t4
    809c:	30079a63          	bnez	a5,83b0 <__subdf3+0x7c0>
    80a0:	00351513          	sll	a0,a0,0x3
    80a4:	00355913          	srl	s2,a0,0x3
    80a8:	01d71813          	sll	a6,a4,0x1d
    80ac:	01286833          	or	a6,a6,s2
    80b0:	00375713          	srl	a4,a4,0x3
    80b4:	fb9ff06f          	j	806c <__subdf3+0x47c>
    80b8:	41d88833          	sub	a6,a7,t4
    80bc:	0108b7b3          	sltu	a5,a7,a6
    80c0:	40b70933          	sub	s2,a4,a1
    80c4:	40f90933          	sub	s2,s2,a5
    80c8:	00891793          	sll	a5,s2,0x8
    80cc:	00080493          	mv	s1,a6
    80d0:	1207c263          	bltz	a5,81f4 <__subdf3+0x604>
    80d4:	01286833          	or	a6,a6,s2
    80d8:	c00812e3          	bnez	a6,7cdc <__subdf3+0xec>
    80dc:	00000e13          	li	t3,0
    80e0:	00000793          	li	a5,0
    80e4:	00000713          	li	a4,0
    80e8:	cadff06f          	j	7d94 <__subdf3+0x1a4>
    80ec:	ff800937          	lui	s2,0xff800
    80f0:	fff90913          	add	s2,s2,-1 # ff7fffff <__subdf3+0xff7f840f>
    80f4:	40f989b3          	sub	s3,s3,a5
    80f8:	01277933          	and	s2,a4,s2
    80fc:	c39ff06f          	j	7d34 <__subdf3+0x144>
    8100:	7ff00793          	li	a5,2047
    8104:	01176533          	or	a0,a4,a7
    8108:	10050463          	beqz	a0,8210 <__subdf3+0x620>
    810c:	fff78813          	add	a6,a5,-1
    8110:	1e080263          	beqz	a6,82f4 <__subdf3+0x704>
    8114:	7ff00513          	li	a0,2047
    8118:	d6a788e3          	beq	a5,a0,7e88 <__subdf3+0x298>
    811c:	03800793          	li	a5,56
    8120:	00068413          	mv	s0,a3
    8124:	00100513          	li	a0,1
    8128:	0307ca63          	blt	a5,a6,815c <__subdf3+0x56c>
    812c:	01f00793          	li	a5,31
    8130:	1907c463          	blt	a5,a6,82b8 <__subdf3+0x6c8>
    8134:	02000793          	li	a5,32
    8138:	410787b3          	sub	a5,a5,a6
    813c:	00f71533          	sll	a0,a4,a5
    8140:	0108d6b3          	srl	a3,a7,a6
    8144:	00f897b3          	sll	a5,a7,a5
    8148:	00d56533          	or	a0,a0,a3
    814c:	00f037b3          	snez	a5,a5
    8150:	01075833          	srl	a6,a4,a6
    8154:	00f56533          	or	a0,a0,a5
    8158:	410585b3          	sub	a1,a1,a6
    815c:	40ae8533          	sub	a0,t4,a0
    8160:	00aeb733          	sltu	a4,t4,a0
    8164:	00050493          	mv	s1,a0
    8168:	40e58933          	sub	s2,a1,a4
    816c:	000f0993          	mv	s3,t5
    8170:	b59ff06f          	j	7cc8 <__subdf3+0xd8>
    8174:	fe078693          	add	a3,a5,-32
    8178:	02000613          	li	a2,32
    817c:	00d5d6b3          	srl	a3,a1,a3
    8180:	00c78a63          	beq	a5,a2,8194 <__subdf3+0x5a4>
    8184:	04000613          	li	a2,64
    8188:	40f607b3          	sub	a5,a2,a5
    818c:	00f597b3          	sll	a5,a1,a5
    8190:	00feeeb3          	or	t4,t4,a5
    8194:	01d03533          	snez	a0,t4
    8198:	00d56533          	or	a0,a0,a3
    819c:	b1dff06f          	j	7cb8 <__subdf3+0xc8>
    81a0:	ff8006b7          	lui	a3,0xff800
    81a4:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f840f>
    81a8:	40f987b3          	sub	a5,s3,a5
    81ac:	00d77733          	and	a4,a4,a3
    81b0:	ef9ff06f          	j	80a8 <__subdf3+0x4b8>
    81b4:	00361513          	sll	a0,a2,0x3
    81b8:	00355513          	srl	a0,a0,0x3
    81bc:	00058713          	mv	a4,a1
    81c0:	cd9ff06f          	j	7e98 <__subdf3+0x2a8>
    81c4:	7ff00793          	li	a5,2047
    81c8:	def686e3          	beq	a3,a5,7fb4 <__subdf3+0x3c4>
    81cc:	01d88eb3          	add	t4,a7,t4
    81d0:	011eb633          	sltu	a2,t4,a7
    81d4:	00b707b3          	add	a5,a4,a1
    81d8:	00c787b3          	add	a5,a5,a2
    81dc:	01f79513          	sll	a0,a5,0x1f
    81e0:	001ede93          	srl	t4,t4,0x1
    81e4:	01d564b3          	or	s1,a0,t4
    81e8:	0017d913          	srl	s2,a5,0x1
    81ec:	00068993          	mv	s3,a3
    81f0:	b45ff06f          	j	7d34 <__subdf3+0x144>
    81f4:	411e8633          	sub	a2,t4,a7
    81f8:	40e587b3          	sub	a5,a1,a4
    81fc:	00ceb733          	sltu	a4,t4,a2
    8200:	00060493          	mv	s1,a2
    8204:	40e78933          	sub	s2,a5,a4
    8208:	00068413          	mv	s0,a3
    820c:	ad1ff06f          	j	7cdc <__subdf3+0xec>
    8210:	00361613          	sll	a2,a2,0x3
    8214:	00365513          	srl	a0,a2,0x3
    8218:	00068413          	mv	s0,a3
    821c:	00058713          	mv	a4,a1
    8220:	e39ff06f          	j	8058 <__subdf3+0x468>
    8224:	e00798e3          	bnez	a5,8034 <__subdf3+0x444>
    8228:	22080663          	beqz	a6,8454 <__subdf3+0x864>
    822c:	0035d713          	srl	a4,a1,0x3
    8230:	00361613          	sll	a2,a2,0x3
    8234:	01d59593          	sll	a1,a1,0x1d
    8238:	00b76733          	or	a4,a4,a1
    823c:	00365613          	srl	a2,a2,0x3
    8240:	00c76733          	or	a4,a4,a2
    8244:	00068413          	mv	s0,a3
    8248:	c61ff06f          	j	7ea8 <__subdf3+0x2b8>
    824c:	01d88eb3          	add	t4,a7,t4
    8250:	00b705b3          	add	a1,a4,a1
    8254:	011eb633          	sltu	a2,t4,a7
    8258:	00c58933          	add	s2,a1,a2
    825c:	00891793          	sll	a5,s2,0x8
    8260:	000e8493          	mv	s1,t4
    8264:	0a07d863          	bgez	a5,8314 <__subdf3+0x724>
    8268:	00200993          	li	s3,2
    826c:	bddff06f          	j	7e48 <__subdf3+0x258>
    8270:	41d88eb3          	sub	t4,a7,t4
    8274:	40b705b3          	sub	a1,a4,a1
    8278:	01d8b633          	sltu	a2,a7,t4
    827c:	000e8493          	mv	s1,t4
    8280:	40c58933          	sub	s2,a1,a2
    8284:	00100993          	li	s3,1
    8288:	a41ff06f          	j	7cc8 <__subdf3+0xd8>
    828c:	fe078693          	add	a3,a5,-32
    8290:	02000613          	li	a2,32
    8294:	00d5d6b3          	srl	a3,a1,a3
    8298:	00c78a63          	beq	a5,a2,82ac <__subdf3+0x6bc>
    829c:	04000613          	li	a2,64
    82a0:	40f607b3          	sub	a5,a2,a5
    82a4:	00f597b3          	sll	a5,a1,a5
    82a8:	00feeeb3          	or	t4,t4,a5
    82ac:	01d03933          	snez	s2,t4
    82b0:	00d96933          	or	s2,s2,a3
    82b4:	b71ff06f          	j	7e24 <__subdf3+0x234>
    82b8:	fe080793          	add	a5,a6,-32 # fffe0 <__subdf3+0xf83f0>
    82bc:	02000693          	li	a3,32
    82c0:	00f757b3          	srl	a5,a4,a5
    82c4:	00d80a63          	beq	a6,a3,82d8 <__subdf3+0x6e8>
    82c8:	04000693          	li	a3,64
    82cc:	410686b3          	sub	a3,a3,a6
    82d0:	00d71733          	sll	a4,a4,a3
    82d4:	00e8e8b3          	or	a7,a7,a4
    82d8:	01103533          	snez	a0,a7
    82dc:	00f56533          	or	a0,a0,a5
    82e0:	e7dff06f          	j	815c <__subdf3+0x56c>
    82e4:	ec0788e3          	beqz	a5,81b4 <__subdf3+0x5c4>
    82e8:	01d5eeb3          	or	t4,a1,t4
    82ec:	bc0e90e3          	bnez	t4,7eac <__subdf3+0x2bc>
    82f0:	d49ff06f          	j	8038 <__subdf3+0x448>
    82f4:	411e8633          	sub	a2,t4,a7
    82f8:	40e585b3          	sub	a1,a1,a4
    82fc:	00ceb733          	sltu	a4,t4,a2
    8300:	00060493          	mv	s1,a2
    8304:	40e58933          	sub	s2,a1,a4
    8308:	00068413          	mv	s0,a3
    830c:	00100993          	li	s3,1
    8310:	9b9ff06f          	j	7cc8 <__subdf3+0xd8>
    8314:	00100793          	li	a5,1
    8318:	d11ff06f          	j	8028 <__subdf3+0x438>
    831c:	dc0800e3          	beqz	a6,80dc <__subdf3+0x4ec>
    8320:	00361613          	sll	a2,a2,0x3
    8324:	00365793          	srl	a5,a2,0x3
    8328:	01d59813          	sll	a6,a1,0x1d
    832c:	00959713          	sll	a4,a1,0x9
    8330:	00f86833          	or	a6,a6,a5
    8334:	00c75713          	srl	a4,a4,0xc
    8338:	00068e13          	mv	t3,a3
    833c:	00000793          	li	a5,0
    8340:	a55ff06f          	j	7d94 <__subdf3+0x1a4>
    8344:	41d88933          	sub	s2,a7,t4
    8348:	0128b7b3          	sltu	a5,a7,s2
    834c:	40b70633          	sub	a2,a4,a1
    8350:	40f60633          	sub	a2,a2,a5
    8354:	00861793          	sll	a5,a2,0x8
    8358:	0e07d263          	bgez	a5,843c <__subdf3+0x84c>
    835c:	411e8633          	sub	a2,t4,a7
    8360:	40e58733          	sub	a4,a1,a4
    8364:	00cebeb3          	sltu	t4,t4,a2
    8368:	41d70733          	sub	a4,a4,t4
    836c:	00871793          	sll	a5,a4,0x8
    8370:	00060493          	mv	s1,a2
    8374:	1207de63          	bgez	a5,84b0 <__subdf3+0x8c0>
    8378:	ff8007b7          	lui	a5,0xff800
    837c:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f840f>
    8380:	00f77733          	and	a4,a4,a5
    8384:	00068413          	mv	s0,a3
    8388:	00100793          	li	a5,1
    838c:	9f1ff06f          	j	7d7c <__subdf3+0x18c>
    8390:	00361613          	sll	a2,a2,0x3
    8394:	00365513          	srl	a0,a2,0x3
    8398:	00058713          	mv	a4,a1
    839c:	cbdff06f          	j	8058 <__subdf3+0x468>
    83a0:	00361613          	sll	a2,a2,0x3
    83a4:	00365913          	srl	s2,a2,0x3
    83a8:	00058713          	mv	a4,a1
    83ac:	cfdff06f          	j	80a8 <__subdf3+0x4b8>
    83b0:	01d886b3          	add	a3,a7,t4
    83b4:	00b707b3          	add	a5,a4,a1
    83b8:	0116b633          	sltu	a2,a3,a7
    83bc:	00c787b3          	add	a5,a5,a2
    83c0:	00879713          	sll	a4,a5,0x8
    83c4:	0036d813          	srl	a6,a3,0x3
    83c8:	08075e63          	bgez	a4,8464 <__subdf3+0x874>
    83cc:	ff800737          	lui	a4,0xff800
    83d0:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f840f>
    83d4:	00e7f7b3          	and	a5,a5,a4
    83d8:	01d79713          	sll	a4,a5,0x1d
    83dc:	00979793          	sll	a5,a5,0x9
    83e0:	01076833          	or	a6,a4,a6
    83e4:	00c7d713          	srl	a4,a5,0xc
    83e8:	00100793          	li	a5,1
    83ec:	9a9ff06f          	j	7d94 <__subdf3+0x1a4>
    83f0:	fe068793          	add	a5,a3,-32
    83f4:	02000613          	li	a2,32
    83f8:	00f757b3          	srl	a5,a4,a5
    83fc:	00c68a63          	beq	a3,a2,8410 <__subdf3+0x820>
    8400:	04000613          	li	a2,64
    8404:	40d606b3          	sub	a3,a2,a3
    8408:	00d71733          	sll	a4,a4,a3
    840c:	00e8e8b3          	or	a7,a7,a4
    8410:	01103933          	snez	s2,a7
    8414:	00f96933          	or	s2,s2,a5
    8418:	b39ff06f          	j	7f50 <__subdf3+0x360>
    841c:	0034d513          	srl	a0,s1,0x3
    8420:	00098793          	mv	a5,s3
    8424:	00090713          	mv	a4,s2
    8428:	c31ff06f          	j	8058 <__subdf3+0x468>
    842c:	02000693          	li	a3,32
    8430:	40f686b3          	sub	a3,a3,a5
    8434:	00000613          	li	a2,0
    8438:	8e9ff06f          	j	7d20 <__subdf3+0x130>
    843c:	00c96833          	or	a6,s2,a2
    8440:	c8080ee3          	beqz	a6,80dc <__subdf3+0x4ec>
    8444:	00395913          	srl	s2,s2,0x3
    8448:	00000793          	li	a5,0
    844c:	00060713          	mv	a4,a2
    8450:	c59ff06f          	j	80a8 <__subdf3+0x4b8>
    8454:	00000e13          	li	t3,0
    8458:	7ff00793          	li	a5,2047
    845c:	00080737          	lui	a4,0x80
    8460:	935ff06f          	j	7d94 <__subdf3+0x1a4>
    8464:	01d79713          	sll	a4,a5,0x1d
    8468:	00979793          	sll	a5,a5,0x9
    846c:	01076833          	or	a6,a4,a6
    8470:	00c7d713          	srl	a4,a5,0xc
    8474:	00000793          	li	a5,0
    8478:	91dff06f          	j	7d94 <__subdf3+0x1a4>
    847c:	ae0786e3          	beqz	a5,7f68 <__subdf3+0x378>
    8480:	413f0833          	sub	a6,t5,s3
    8484:	00080793          	mv	a5,a6
    8488:	c6098ee3          	beqz	s3,8104 <__subdf3+0x514>
    848c:	03800793          	li	a5,56
    8490:	0107ca63          	blt	a5,a6,84a4 <__subdf3+0x8b4>
    8494:	008007b7          	lui	a5,0x800
    8498:	00f76733          	or	a4,a4,a5
    849c:	00068413          	mv	s0,a3
    84a0:	c8dff06f          	j	812c <__subdf3+0x53c>
    84a4:	00068413          	mv	s0,a3
    84a8:	00100513          	li	a0,1
    84ac:	cb1ff06f          	j	815c <__subdf3+0x56c>
    84b0:	01d71813          	sll	a6,a4,0x1d
    84b4:	00365613          	srl	a2,a2,0x3
    84b8:	00c86833          	or	a6,a6,a2
    84bc:	00375713          	srl	a4,a4,0x3
    84c0:	00000793          	li	a5,0
    84c4:	00068413          	mv	s0,a3
    84c8:	ba5ff06f          	j	806c <__subdf3+0x47c>
    84cc:	ba078ae3          	beqz	a5,8080 <__subdf3+0x490>
    84d0:	413f06b3          	sub	a3,t5,s3
    84d4:	00099663          	bnez	s3,84e0 <__subdf3+0x8f0>
    84d8:	00068793          	mv	a5,a3
    84dc:	a21ff06f          	j	7efc <__subdf3+0x30c>
    84e0:	03800793          	li	a5,56
    84e4:	00100913          	li	s2,1
    84e8:	a6d7c4e3          	blt	a5,a3,7f50 <__subdf3+0x360>
    84ec:	008007b7          	lui	a5,0x800
    84f0:	00f76733          	or	a4,a4,a5
    84f4:	a2dff06f          	j	7f20 <__subdf3+0x330>

Disassembly of section .data:

00000000 <list_known_crc>:
   0:	d4b0                	.insn	2, 0xd4b0
   2:	3340                	.insn	2, 0x3340
   4:	6a79                	.insn	2, 0x6a79
   6:	e714                	.insn	2, 0xe714
   8:	e3c1                	.insn	2, 0xe3c1
	...

0000000c <matrix_known_crc>:
   c:	be52                	.insn	2, 0xbe52
   e:	1199                	.insn	2, 0x1199
  10:	5608                	.insn	2, 0x5608
  12:	07471fd7          	.insn	4, 0x07471fd7
	...

00000018 <state_known_crc>:
  18:	39bf5e47          	.insn	4, 0x39bf5e47
  1c:	e5a4                	.insn	2, 0xe5a4
  1e:	8e3a                	.insn	2, 0x8e3a
  20:	8d84                	.insn	2, 0x8d84
	...

00000024 <mem_name>:
  24:	0030                	.insn	2, 0x0030
  26:	0000                	.insn	2, 0x
  28:	0038                	.insn	2, 0x0038
  2a:	0000                	.insn	2, 0x
  2c:	0040                	.insn	2, 0x0040
  2e:	0000                	.insn	2, 0x
  30:	74617453          	.insn	4, 0x74617453
  34:	6369                	.insn	2, 0x6369
  36:	0000                	.insn	2, 0x
  38:	6548                	.insn	2, 0x6548
  3a:	7061                	.insn	2, 0x7061
  3c:	0000                	.insn	2, 0x
  3e:	0000                	.insn	2, 0x
  40:	63617453          	.insn	4, 0x63617453
  44:	0000006b          	.insn	4, 0x006b
  48:	6b36                	.insn	2, 0x6b36
  4a:	7020                	.insn	2, 0x7020
  4c:	7265                	.insn	2, 0x7265
  4e:	6f66                	.insn	2, 0x6f66
  50:	6d72                	.insn	2, 0x6d72
  52:	6e61                	.insn	2, 0x6e61
  54:	72206563          	bltu	zero,sp,77e <default_num_contexts+0x18e>
  58:	6e75                	.insn	2, 0x6e75
  5a:	7020                	.insn	2, 0x7020
  5c:	7261                	.insn	2, 0x7261
  5e:	6d61                	.insn	2, 0x6d61
  60:	7465                	.insn	2, 0x7465
  62:	7265                	.insn	2, 0x7265
  64:	6f662073          	.insn	4, 0x6f662073
  68:	2072                	.insn	2, 0x2072
  6a:	65726f63          	bltu	tp,s7,6c8 <default_num_contexts+0xd8>
  6e:	616d                	.insn	2, 0x616d
  70:	6b72                	.insn	2, 0x6b72
  72:	0a2e                	.insn	2, 0x0a2e
  74:	0000                	.insn	2, 0x
  76:	0000                	.insn	2, 0x
  78:	6b36                	.insn	2, 0x6b36
  7a:	7620                	.insn	2, 0x7620
  7c:	6c61                	.insn	2, 0x6c61
  7e:	6469                	.insn	2, 0x6469
  80:	7461                	.insn	2, 0x7461
  82:	6f69                	.insn	2, 0x6f69
  84:	206e                	.insn	2, 0x206e
  86:	7572                	.insn	2, 0x7572
  88:	206e                	.insn	2, 0x206e
  8a:	6170                	.insn	2, 0x6170
  8c:	6172                	.insn	2, 0x6172
  8e:	656d                	.insn	2, 0x656d
  90:	6574                	.insn	2, 0x6574
  92:	7372                	.insn	2, 0x7372
  94:	6620                	.insn	2, 0x6620
  96:	6320726f          	jal	tp,76c8 <__muldf3+0x770>
  9a:	6d65726f          	jal	tp,57770 <__subdf3+0x4fb80>
  9e:	7261                	.insn	2, 0x7261
  a0:	000a2e6b          	.insn	4, 0x000a2e6b
  a4:	7250                	.insn	2, 0x7250
  a6:	6c69666f          	jal	a2,9676c <__subdf3+0x8eb7c>
  aa:	2065                	.insn	2, 0x2065
  ac:	656e6567          	.insn	4, 0x656e6567
  b0:	6172                	.insn	2, 0x6172
  b2:	6974                	.insn	2, 0x6974
  b4:	72206e6f          	jal	t3,67d6 <__divdf3+0x3ba>
  b8:	6e75                	.insn	2, 0x6e75
  ba:	7020                	.insn	2, 0x7020
  bc:	7261                	.insn	2, 0x7261
  be:	6d61                	.insn	2, 0x6d61
  c0:	7465                	.insn	2, 0x7465
  c2:	7265                	.insn	2, 0x7265
  c4:	6f662073          	.insn	4, 0x6f662073
  c8:	2072                	.insn	2, 0x2072
  ca:	65726f63          	bltu	tp,s7,728 <default_num_contexts+0x138>
  ce:	616d                	.insn	2, 0x616d
  d0:	6b72                	.insn	2, 0x6b72
  d2:	0a2e                	.insn	2, 0x0a2e
  d4:	0000                	.insn	2, 0x
  d6:	0000                	.insn	2, 0x
  d8:	4b32                	.insn	2, 0x4b32
  da:	7020                	.insn	2, 0x7020
  dc:	7265                	.insn	2, 0x7265
  de:	6f66                	.insn	2, 0x6f66
  e0:	6d72                	.insn	2, 0x6d72
  e2:	6e61                	.insn	2, 0x6e61
  e4:	72206563          	bltu	zero,sp,80e <_gbl_ptr+0xe>
  e8:	6e75                	.insn	2, 0x6e75
  ea:	7020                	.insn	2, 0x7020
  ec:	7261                	.insn	2, 0x7261
  ee:	6d61                	.insn	2, 0x6d61
  f0:	7465                	.insn	2, 0x7465
  f2:	7265                	.insn	2, 0x7265
  f4:	6f662073          	.insn	4, 0x6f662073
  f8:	2072                	.insn	2, 0x2072
  fa:	65726f63          	bltu	tp,s7,758 <default_num_contexts+0x168>
  fe:	616d                	.insn	2, 0x616d
 100:	6b72                	.insn	2, 0x6b72
 102:	0a2e                	.insn	2, 0x0a2e
 104:	0000                	.insn	2, 0x
 106:	0000                	.insn	2, 0x
 108:	4b32                	.insn	2, 0x4b32
 10a:	7620                	.insn	2, 0x7620
 10c:	6c61                	.insn	2, 0x6c61
 10e:	6469                	.insn	2, 0x6469
 110:	7461                	.insn	2, 0x7461
 112:	6f69                	.insn	2, 0x6f69
 114:	206e                	.insn	2, 0x206e
 116:	7572                	.insn	2, 0x7572
 118:	206e                	.insn	2, 0x206e
 11a:	6170                	.insn	2, 0x6170
 11c:	6172                	.insn	2, 0x6172
 11e:	656d                	.insn	2, 0x656d
 120:	6574                	.insn	2, 0x6574
 122:	7372                	.insn	2, 0x7372
 124:	6620                	.insn	2, 0x6620
 126:	6320726f          	jal	tp,7758 <__fixdfsi+0x70>
 12a:	6d65726f          	jal	tp,57800 <__subdf3+0x4fc10>
 12e:	7261                	.insn	2, 0x7261
 130:	000a2e6b          	.insn	4, 0x000a2e6b
 134:	5d75255b          	.insn	4, 0x5d75255b
 138:	5245                	.insn	2, 0x5245
 13a:	4f52                	.insn	2, 0x4f52
 13c:	2152                	.insn	2, 0x2152
 13e:	6c20                	.insn	2, 0x6c20
 140:	7369                	.insn	2, 0x7369
 142:	2074                	.insn	2, 0x2074
 144:	20637263          	bgeu	t1,t1,348 <main+0xec>
 148:	7830                	.insn	2, 0x7830
 14a:	3025                	.insn	2, 0x3025
 14c:	7834                	.insn	2, 0x7834
 14e:	2d20                	.insn	2, 0x2d20
 150:	7320                	.insn	2, 0x7320
 152:	6f68                	.insn	2, 0x6f68
 154:	6c75                	.insn	2, 0x6c75
 156:	2064                	.insn	2, 0x2064
 158:	6562                	.insn	2, 0x6562
 15a:	3020                	.insn	2, 0x3020
 15c:	2578                	.insn	2, 0x2578
 15e:	3430                	.insn	2, 0x3430
 160:	0a78                	.insn	2, 0x0a78
 162:	0000                	.insn	2, 0x
 164:	5d75255b          	.insn	4, 0x5d75255b
 168:	5245                	.insn	2, 0x5245
 16a:	4f52                	.insn	2, 0x4f52
 16c:	2152                	.insn	2, 0x2152
 16e:	6d20                	.insn	2, 0x6d20
 170:	7461                	.insn	2, 0x7461
 172:	6972                	.insn	2, 0x6972
 174:	2078                	.insn	2, 0x2078
 176:	20637263          	bgeu	t1,t1,37a <main+0x11e>
 17a:	7830                	.insn	2, 0x7830
 17c:	3025                	.insn	2, 0x3025
 17e:	7834                	.insn	2, 0x7834
 180:	2d20                	.insn	2, 0x2d20
 182:	7320                	.insn	2, 0x7320
 184:	6f68                	.insn	2, 0x6f68
 186:	6c75                	.insn	2, 0x6c75
 188:	2064                	.insn	2, 0x2064
 18a:	6562                	.insn	2, 0x6562
 18c:	3020                	.insn	2, 0x3020
 18e:	2578                	.insn	2, 0x2578
 190:	3430                	.insn	2, 0x3430
 192:	0a78                	.insn	2, 0x0a78
 194:	0000                	.insn	2, 0x
 196:	0000                	.insn	2, 0x
 198:	5d75255b          	.insn	4, 0x5d75255b
 19c:	5245                	.insn	2, 0x5245
 19e:	4f52                	.insn	2, 0x4f52
 1a0:	2152                	.insn	2, 0x2152
 1a2:	7320                	.insn	2, 0x7320
 1a4:	6174                	.insn	2, 0x6174
 1a6:	6574                	.insn	2, 0x6574
 1a8:	6320                	.insn	2, 0x6320
 1aa:	6372                	.insn	2, 0x6372
 1ac:	3020                	.insn	2, 0x3020
 1ae:	2578                	.insn	2, 0x2578
 1b0:	3430                	.insn	2, 0x3430
 1b2:	2078                	.insn	2, 0x2078
 1b4:	202d                	.insn	2, 0x202d
 1b6:	756f6873          	.insn	4, 0x756f6873
 1ba:	646c                	.insn	2, 0x646c
 1bc:	6220                	.insn	2, 0x6220
 1be:	2065                	.insn	2, 0x2065
 1c0:	7830                	.insn	2, 0x7830
 1c2:	3025                	.insn	2, 0x3025
 1c4:	7834                	.insn	2, 0x7834
 1c6:	000a                	.insn	2, 0x000a
 1c8:	65726f43          	.insn	4, 0x65726f43
 1cc:	614d                	.insn	2, 0x614d
 1ce:	6b72                	.insn	2, 0x6b72
 1d0:	5320                	.insn	2, 0x5320
 1d2:	7a69                	.insn	2, 0x7a69
 1d4:	2065                	.insn	2, 0x2065
 1d6:	2020                	.insn	2, 0x2020
 1d8:	3a20                	.insn	2, 0x3a20
 1da:	2520                	.insn	2, 0x2520
 1dc:	756c                	.insn	2, 0x756c
 1de:	000a                	.insn	2, 0x000a
 1e0:	6f54                	.insn	2, 0x6f54
 1e2:	6174                	.insn	2, 0x6174
 1e4:	206c                	.insn	2, 0x206c
 1e6:	6974                	.insn	2, 0x6974
 1e8:	20736b63          	bltu	t1,t2,3fe <main+0x1a2>
 1ec:	2020                	.insn	2, 0x2020
 1ee:	2020                	.insn	2, 0x2020
 1f0:	3a20                	.insn	2, 0x3a20
 1f2:	2520                	.insn	2, 0x2520
 1f4:	756c                	.insn	2, 0x756c
 1f6:	000a                	.insn	2, 0x000a
 1f8:	6f54                	.insn	2, 0x6f54
 1fa:	6174                	.insn	2, 0x6174
 1fc:	206c                	.insn	2, 0x206c
 1fe:	6974                	.insn	2, 0x6974
 200:	656d                	.insn	2, 0x656d
 202:	2820                	.insn	2, 0x2820
 204:	73636573          	.insn	4, 0x73636573
 208:	3a29                	.insn	2, 0x3a29
 20a:	2520                	.insn	2, 0x2520
 20c:	0a66                	.insn	2, 0x0a66
 20e:	0000                	.insn	2, 0x
 210:	7449                	.insn	2, 0x7449
 212:	7265                	.insn	2, 0x7265
 214:	7461                	.insn	2, 0x7461
 216:	6f69                	.insn	2, 0x6f69
 218:	736e                	.insn	2, 0x736e
 21a:	6365532f          	.insn	4, 0x6365532f
 21e:	2020                	.insn	2, 0x2020
 220:	3a20                	.insn	2, 0x3a20
 222:	2520                	.insn	2, 0x2520
 224:	0a66                	.insn	2, 0x0a66
 226:	0000                	.insn	2, 0x
 228:	5245                	.insn	2, 0x5245
 22a:	4f52                	.insn	2, 0x4f52
 22c:	2152                	.insn	2, 0x2152
 22e:	4d20                	.insn	2, 0x4d20
 230:	7375                	.insn	2, 0x7375
 232:	2074                	.insn	2, 0x2074
 234:	7865                	.insn	2, 0x7865
 236:	6365                	.insn	2, 0x6365
 238:	7475                	.insn	2, 0x7475
 23a:	2065                	.insn	2, 0x2065
 23c:	6f66                	.insn	2, 0x6f66
 23e:	2072                	.insn	2, 0x2072
 240:	7461                	.insn	2, 0x7461
 242:	6c20                	.insn	2, 0x6c20
 244:	6165                	.insn	2, 0x6165
 246:	31207473          	.insn	4, 0x31207473
 24a:	2030                	.insn	2, 0x2030
 24c:	73636573          	.insn	4, 0x73636573
 250:	6620                	.insn	2, 0x6620
 252:	6120726f          	jal	tp,7864 <__floatunsidf+0x84>
 256:	7620                	.insn	2, 0x7620
 258:	6c61                	.insn	2, 0x6c61
 25a:	6469                	.insn	2, 0x6469
 25c:	7220                	.insn	2, 0x7220
 25e:	7365                	.insn	2, 0x7365
 260:	6c75                	.insn	2, 0x6c75
 262:	2174                	.insn	2, 0x2174
 264:	000a                	.insn	2, 0x000a
 266:	0000                	.insn	2, 0x
 268:	7449                	.insn	2, 0x7449
 26a:	7265                	.insn	2, 0x7265
 26c:	7461                	.insn	2, 0x7461
 26e:	6f69                	.insn	2, 0x6f69
 270:	736e                	.insn	2, 0x736e
 272:	2020                	.insn	2, 0x2020
 274:	2020                	.insn	2, 0x2020
 276:	2020                	.insn	2, 0x2020
 278:	3a20                	.insn	2, 0x3a20
 27a:	2520                	.insn	2, 0x2520
 27c:	756c                	.insn	2, 0x756c
 27e:	000a                	.insn	2, 0x000a
 280:	31434347          	.insn	4, 0x31434347
 284:	2e322e33          	.insn	4, 0x2e322e33
 288:	0030                	.insn	2, 0x0030
 28a:	0000                	.insn	2, 0x
 28c:	706d6f43          	.insn	4, 0x706d6f43
 290:	6c69                	.insn	2, 0x6c69
 292:	7265                	.insn	2, 0x7265
 294:	7620                	.insn	2, 0x7620
 296:	7265                	.insn	2, 0x7265
 298:	6e6f6973          	.insn	4, 0x6e6f6973
 29c:	3a20                	.insn	2, 0x3a20
 29e:	2520                	.insn	2, 0x2520
 2a0:	00000a73          	.insn	4, 0x0a73
 2a4:	6d2d                	.insn	2, 0x6d2d
 2a6:	7261                	.insn	2, 0x7261
 2a8:	723d6863          	bltu	s10,gp,9d8 <_bss_end+0x98>
 2ac:	3376                	.insn	2, 0x3376
 2ae:	6932                	.insn	2, 0x6932
 2b0:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
 2b6:	2d20                	.insn	2, 0x2d20
 2b8:	616d                	.insn	2, 0x616d
 2ba:	6962                	.insn	2, 0x6962
 2bc:	693d                	.insn	2, 0x693d
 2be:	706c                	.insn	2, 0x706c
 2c0:	00003233          	snez	tp,zero
 2c4:	706d6f43          	.insn	4, 0x706d6f43
 2c8:	6c69                	.insn	2, 0x6c69
 2ca:	7265                	.insn	2, 0x7265
 2cc:	6620                	.insn	2, 0x6620
 2ce:	616c                	.insn	2, 0x616c
 2d0:	20207367          	.insn	4, 0x20207367
 2d4:	3a20                	.insn	2, 0x3a20
 2d6:	2520                	.insn	2, 0x2520
 2d8:	00000a73          	.insn	4, 0x0a73
 2dc:	43415453          	.insn	4, 0x43415453
 2e0:	0000004b          	.insn	4, 0x004b
 2e4:	654d                	.insn	2, 0x654d
 2e6:	6f6d                	.insn	2, 0x6f6d
 2e8:	7972                	.insn	2, 0x7972
 2ea:	6c20                	.insn	2, 0x6c20
 2ec:	7461636f          	jal	t1,16a32 <__subdf3+0xee42>
 2f0:	6f69                	.insn	2, 0x6f69
 2f2:	206e                	.insn	2, 0x206e
 2f4:	3a20                	.insn	2, 0x3a20
 2f6:	2520                	.insn	2, 0x2520
 2f8:	00000a73          	.insn	4, 0x0a73
 2fc:	64656573          	.insn	4, 0x64656573
 300:	20637263          	bgeu	t1,t1,504 <_stack_size+0x4>
 304:	2020                	.insn	2, 0x2020
 306:	2020                	.insn	2, 0x2020
 308:	2020                	.insn	2, 0x2020
 30a:	2020                	.insn	2, 0x2020
 30c:	3a20                	.insn	2, 0x3a20
 30e:	3020                	.insn	2, 0x3020
 310:	2578                	.insn	2, 0x2578
 312:	3430                	.insn	2, 0x3430
 314:	0a78                	.insn	2, 0x0a78
 316:	0000                	.insn	2, 0x
 318:	5d64255b          	.insn	4, 0x5d64255b
 31c:	6c637263          	bgeu	t1,t1,9e0 <_bss_end+0xa0>
 320:	7369                	.insn	2, 0x7369
 322:	2074                	.insn	2, 0x2074
 324:	2020                	.insn	2, 0x2020
 326:	2020                	.insn	2, 0x2020
 328:	2020                	.insn	2, 0x2020
 32a:	203a                	.insn	2, 0x203a
 32c:	7830                	.insn	2, 0x7830
 32e:	3025                	.insn	2, 0x3025
 330:	7834                	.insn	2, 0x7834
 332:	000a                	.insn	2, 0x000a
 334:	5d64255b          	.insn	4, 0x5d64255b
 338:	6d637263          	bgeu	t1,s6,9fc <_bss_end+0xbc>
 33c:	7461                	.insn	2, 0x7461
 33e:	6972                	.insn	2, 0x6972
 340:	2078                	.insn	2, 0x2078
 342:	2020                	.insn	2, 0x2020
 344:	2020                	.insn	2, 0x2020
 346:	203a                	.insn	2, 0x203a
 348:	7830                	.insn	2, 0x7830
 34a:	3025                	.insn	2, 0x3025
 34c:	7834                	.insn	2, 0x7834
 34e:	000a                	.insn	2, 0x000a
 350:	5d64255b          	.insn	4, 0x5d64255b
 354:	73637263          	bgeu	t1,s6,a78 <_trap_stack_size+0x78>
 358:	6174                	.insn	2, 0x6174
 35a:	6574                	.insn	2, 0x6574
 35c:	2020                	.insn	2, 0x2020
 35e:	2020                	.insn	2, 0x2020
 360:	2020                	.insn	2, 0x2020
 362:	203a                	.insn	2, 0x203a
 364:	7830                	.insn	2, 0x7830
 366:	3025                	.insn	2, 0x3025
 368:	7834                	.insn	2, 0x7834
 36a:	000a                	.insn	2, 0x000a
 36c:	5d64255b          	.insn	4, 0x5d64255b
 370:	66637263          	bgeu	t1,t1,9d4 <_bss_end+0x94>
 374:	6e69                	.insn	2, 0x6e69
 376:	6c61                	.insn	2, 0x6c61
 378:	2020                	.insn	2, 0x2020
 37a:	2020                	.insn	2, 0x2020
 37c:	2020                	.insn	2, 0x2020
 37e:	203a                	.insn	2, 0x203a
 380:	7830                	.insn	2, 0x7830
 382:	3025                	.insn	2, 0x3025
 384:	7834                	.insn	2, 0x7834
 386:	000a                	.insn	2, 0x000a
 388:	72726f43          	.insn	4, 0x72726f43
 38c:	6365                	.insn	2, 0x6365
 38e:	2074                	.insn	2, 0x2074
 390:	7265706f          	j	57ab6 <__subdf3+0x4fec6>
 394:	7461                	.insn	2, 0x7461
 396:	6f69                	.insn	2, 0x6f69
 398:	206e                	.insn	2, 0x206e
 39a:	6176                	.insn	2, 0x6176
 39c:	696c                	.insn	2, 0x696c
 39e:	6164                	.insn	2, 0x6164
 3a0:	6574                	.insn	2, 0x6574
 3a2:	2e64                	.insn	2, 0x2e64
 3a4:	5320                	.insn	2, 0x5320
 3a6:	6565                	.insn	2, 0x6565
 3a8:	5220                	.insn	2, 0x5220
 3aa:	4145                	.insn	2, 0x4145
 3ac:	4d44                	.insn	2, 0x4d44
 3ae:	2e45                	.insn	2, 0x2e45
 3b0:	646d                	.insn	2, 0x646d
 3b2:	6620                	.insn	2, 0x6620
 3b4:	7220726f          	jal	tp,7ad6 <modf+0xde>
 3b8:	6e75                	.insn	2, 0x6e75
 3ba:	6120                	.insn	2, 0x6120
 3bc:	646e                	.insn	2, 0x646e
 3be:	7220                	.insn	2, 0x7220
 3c0:	7065                	.insn	2, 0x7065
 3c2:	6974726f          	jal	tp,48258 <__subdf3+0x40668>
 3c6:	676e                	.insn	2, 0x676e
 3c8:	7220                	.insn	2, 0x7220
 3ca:	6c75                	.insn	2, 0x6c75
 3cc:	7365                	.insn	2, 0x7365
 3ce:	0a2e                	.insn	2, 0x0a2e
 3d0:	0000                	.insn	2, 0x
 3d2:	0000                	.insn	2, 0x
 3d4:	65726f43          	.insn	4, 0x65726f43
 3d8:	614d                	.insn	2, 0x614d
 3da:	6b72                	.insn	2, 0x6b72
 3dc:	3120                	.insn	2, 0x3120
 3de:	302e                	.insn	2, 0x302e
 3e0:	3a20                	.insn	2, 0x3a20
 3e2:	2520                	.insn	2, 0x2520
 3e4:	2066                	.insn	2, 0x2066
 3e6:	7325202f          	.insn	4, 0x7325202f
 3ea:	2520                	.insn	2, 0x2520
 3ec:	00000073          	ecall
 3f0:	2f20                	.insn	2, 0x2f20
 3f2:	2520                	.insn	2, 0x2520
 3f4:	00000073          	ecall
 3f8:	000a                	.insn	2, 0x000a
 3fa:	0000                	.insn	2, 0x
 3fc:	7245                	.insn	2, 0x7245
 3fe:	6f72                	.insn	2, 0x6f72
 400:	7372                	.insn	2, 0x7372
 402:	6420                	.insn	2, 0x6420
 404:	7465                	.insn	2, 0x7465
 406:	6365                	.insn	2, 0x6365
 408:	6574                	.insn	2, 0x6574
 40a:	0a64                	.insn	2, 0x0a64
 40c:	0000                	.insn	2, 0x
 40e:	0000                	.insn	2, 0x
 410:	6e6e6143          	.insn	4, 0x6e6e6143
 414:	7620746f          	jal	s0,7b76 <modf+0x17e>
 418:	6c61                	.insn	2, 0x6c61
 41a:	6469                	.insn	2, 0x6469
 41c:	7461                	.insn	2, 0x7461
 41e:	2065                	.insn	2, 0x2065
 420:	7265706f          	j	57b46 <__subdf3+0x4ff56>
 424:	7461                	.insn	2, 0x7461
 426:	6f69                	.insn	2, 0x6f69
 428:	206e                	.insn	2, 0x206e
 42a:	6f66                	.insn	2, 0x6f66
 42c:	2072                	.insn	2, 0x2072
 42e:	6874                	.insn	2, 0x6874
 430:	7365                	.insn	2, 0x7365
 432:	2065                	.insn	2, 0x2065
 434:	64656573          	.insn	4, 0x64656573
 438:	7620                	.insn	2, 0x7620
 43a:	6c61                	.insn	2, 0x6c61
 43c:	6575                	.insn	2, 0x6575
 43e:	70202c73          	.insn	4, 0x70202c73
 442:	656c                	.insn	2, 0x656c
 444:	7361                	.insn	2, 0x7361
 446:	2065                	.insn	2, 0x2065
 448:	706d6f63          	bltu	s10,t1,b66 <_trap_stack_size+0x166>
 44c:	7261                	.insn	2, 0x7261
 44e:	2065                	.insn	2, 0x2065
 450:	68746977          	.insn	4, 0x68746977
 454:	7220                	.insn	2, 0x7220
 456:	7365                	.insn	2, 0x7365
 458:	6c75                	.insn	2, 0x6c75
 45a:	7374                	.insn	2, 0x7374
 45c:	6f20                	.insn	2, 0x6f20
 45e:	206e                	.insn	2, 0x206e
 460:	2061                	.insn	2, 0x2061
 462:	776f6e6b          	.insn	4, 0x776f6e6b
 466:	206e                	.insn	2, 0x206e
 468:	6c70                	.insn	2, 0x6c70
 46a:	7461                	.insn	2, 0x7461
 46c:	6f66                	.insn	2, 0x6f66
 46e:	6d72                	.insn	2, 0x6d72
 470:	0a2e                	.insn	2, 0x0a2e
	...
 47e:	3ff0                	.insn	2, 0x3ff0
 480:	0000                	.insn	2, 0x
 482:	0000                	.insn	2, 0x
 484:	0000                	.insn	2, 0x
 486:	4024                	.insn	2, 0x4024

00000488 <intpat>:
 488:	04c8                	.insn	2, 0x04c8
 48a:	0000                	.insn	2, 0x
 48c:	04d0                	.insn	2, 0x04d0
 48e:	0000                	.insn	2, 0x
 490:	04d8                	.insn	2, 0x04d8
 492:	0000                	.insn	2, 0x
 494:	04e0                	.insn	2, 0x04e0
	...

00000498 <floatpat>:
 498:	04e8                	.insn	2, 0x04e8
 49a:	0000                	.insn	2, 0x
 49c:	04f4                	.insn	2, 0x04f4
 49e:	0000                	.insn	2, 0x
 4a0:	0500                	.insn	2, 0x0500
 4a2:	0000                	.insn	2, 0x
 4a4:	050c                	.insn	2, 0x050c
	...

000004a8 <scipat>:
 4a8:	0518                	.insn	2, 0x0518
 4aa:	0000                	.insn	2, 0x
 4ac:	0524                	.insn	2, 0x0524
 4ae:	0000                	.insn	2, 0x
 4b0:	0530                	.insn	2, 0x0530
 4b2:	0000                	.insn	2, 0x
 4b4:	053c                	.insn	2, 0x053c
	...

000004b8 <errpat>:
 4b8:	0548                	.insn	2, 0x0548
 4ba:	0000                	.insn	2, 0x
 4bc:	0554                	.insn	2, 0x0554
 4be:	0000                	.insn	2, 0x
 4c0:	0560                	.insn	2, 0x0560
 4c2:	0000                	.insn	2, 0x
 4c4:	056c                	.insn	2, 0x056c
 4c6:	0000                	.insn	2, 0x
 4c8:	3035                	.insn	2, 0x3035
 4ca:	3231                	.insn	2, 0x3231
 4cc:	0000                	.insn	2, 0x
 4ce:	0000                	.insn	2, 0x
 4d0:	3231                	.insn	2, 0x3231
 4d2:	00003433          	snez	s0,zero
 4d6:	0000                	.insn	2, 0x
 4d8:	382d                	.insn	2, 0x382d
 4da:	00003437          	lui	s0,0x3
 4de:	0000                	.insn	2, 0x
 4e0:	3232312b          	.insn	4, 0x3232312b
 4e4:	0000                	.insn	2, 0x
 4e6:	0000                	.insn	2, 0x
 4e8:	352e3533          	.insn	4, 0x352e3533
 4ec:	3434                	.insn	2, 0x3434
 4ee:	3030                	.insn	2, 0x3030
 4f0:	0000                	.insn	2, 0x
 4f2:	0000                	.insn	2, 0x
 4f4:	312e                	.insn	2, 0x312e
 4f6:	3332                	.insn	2, 0x3332
 4f8:	3534                	.insn	2, 0x3534
 4fa:	3030                	.insn	2, 0x3030
 4fc:	0000                	.insn	2, 0x
 4fe:	0000                	.insn	2, 0x
 500:	312d                	.insn	2, 0x312d
 502:	3031                	.insn	2, 0x3031
 504:	372e                	.insn	2, 0x372e
 506:	3030                	.insn	2, 0x3030
 508:	0000                	.insn	2, 0x
 50a:	0000                	.insn	2, 0x
 50c:	362e302b          	.insn	4, 0x362e302b
 510:	3434                	.insn	2, 0x3434
 512:	3030                	.insn	2, 0x3030
 514:	0000                	.insn	2, 0x
 516:	0000                	.insn	2, 0x
 518:	2e35                	.insn	2, 0x2e35
 51a:	3035                	.insn	2, 0x3035
 51c:	6530                	.insn	2, 0x6530
 51e:	0000332b          	.insn	4, 0x332b
 522:	0000                	.insn	2, 0x
 524:	2e2d                	.insn	2, 0x2e2d
 526:	3231                	.insn	2, 0x3231
 528:	322d6533          	.insn	4, 0x322d6533
 52c:	0000                	.insn	2, 0x
 52e:	0000                	.insn	2, 0x
 530:	382d                	.insn	2, 0x382d
 532:	382b6537          	lui	a0,0x382b6
 536:	00003233          	snez	tp,zero
 53a:	0000                	.insn	2, 0x
 53c:	362e302b          	.insn	4, 0x362e302b
 540:	2d65                	.insn	2, 0x2d65
 542:	3231                	.insn	2, 0x3231
 544:	0000                	.insn	2, 0x
 546:	0000                	.insn	2, 0x
 548:	3054                	.insn	2, 0x3054
 54a:	332e                	.insn	2, 0x332e
 54c:	2d65                	.insn	2, 0x2d65
 54e:	4631                	.insn	2, 0x4631
 550:	0000                	.insn	2, 0x
 552:	0000                	.insn	2, 0x
 554:	542d                	.insn	2, 0x542d
 556:	542e                	.insn	2, 0x542e
 558:	71542b2b          	.insn	4, 0x71542b2b
 55c:	0000                	.insn	2, 0x
 55e:	0000                	.insn	2, 0x
 560:	5431                	.insn	2, 0x5431
 562:	65342e33          	.insn	4, 0x65342e33
 566:	7a34                	.insn	2, 0x7a34
 568:	0000                	.insn	2, 0x
 56a:	0000                	.insn	2, 0x
 56c:	302e3433          	.insn	4, 0x302e3433
 570:	2d65                	.insn	2, 0x2d65
 572:	5e54                	.insn	2, 0x5e54
 574:	0000                	.insn	2, 0x
 576:	0000                	.insn	2, 0x
 578:	32e0                	.insn	2, 0x32e0
 57a:	0000                	.insn	2, 0x
 57c:	359c                	.insn	2, 0x359c
 57e:	0000                	.insn	2, 0x
 580:	3370                	.insn	2, 0x3370
 582:	0000                	.insn	2, 0x
 584:	34bc                	.insn	2, 0x34bc
 586:	0000                	.insn	2, 0x
 588:	33f0                	.insn	2, 0x33f0
 58a:	0000                	.insn	2, 0x
 58c:	3450                	.insn	2, 0x3450
 58e:	0000                	.insn	2, 0x
 590:	3514                	.insn	2, 0x3514
 592:	0000                	.insn	2, 0x
 594:	3568                	.insn	2, 0x3568
 596:	0000                	.insn	2, 0x
 598:	367c                	.insn	2, 0x367c
 59a:	0000                	.insn	2, 0x
 59c:	3634                	.insn	2, 0x3634
 59e:	0000                	.insn	2, 0x
 5a0:	3644                	.insn	2, 0x3644
 5a2:	0000                	.insn	2, 0x
 5a4:	3654                	.insn	2, 0x3654
 5a6:	0000                	.insn	2, 0x
 5a8:	3660                	.insn	2, 0x3660
 5aa:	0000                	.insn	2, 0x
 5ac:	366c                	.insn	2, 0x366c
 5ae:	0000                	.insn	2, 0x
 5b0:	5245                	.insn	2, 0x5245
 5b2:	4f52                	.insn	2, 0x4f52
 5b4:	3a52                	.insn	2, 0x3a52
 5b6:	5020                	.insn	2, 0x5020
 5b8:	656c                	.insn	2, 0x656c
 5ba:	7361                	.insn	2, 0x7361
 5bc:	2065                	.insn	2, 0x2065
 5be:	6f6d                	.insn	2, 0x6f6d
 5c0:	6964                	.insn	2, 0x6964
 5c2:	7966                	.insn	2, 0x7966
 5c4:	7420                	.insn	2, 0x7420
 5c6:	6568                	.insn	2, 0x6568
 5c8:	6420                	.insn	2, 0x6420
 5ca:	7461                	.insn	2, 0x7461
 5cc:	7461                	.insn	2, 0x7461
 5ce:	7079                	.insn	2, 0x7079
 5d0:	7365                	.insn	2, 0x7365
 5d2:	6920                	.insn	2, 0x6920
 5d4:	206e                	.insn	2, 0x206e
 5d6:	65726f63          	bltu	tp,s7,c34 <_trap_stack_size+0x234>
 5da:	705f 726f 6d74      	.insn	6, 0x6d74726f705f
 5e0:	2e65                	.insn	2, 0x2e65
 5e2:	2168                	.insn	2, 0x2168
 5e4:	000a                	.insn	2, 0x000a
	...

000005e8 <seed3_volatile>:
 5e8:	0066                	.insn	2, 0x0066
	...

000005ec <seed4_volatile>:
 5ec:	0001                	.insn	2, 0x0001
	...

000005f0 <default_num_contexts>:
 5f0:	0001                	.insn	2, 0x0001
	...
 5fa:	0000                	.insn	2, 0x
 5fc:	12d0                	.insn	2, 0x12d0
 5fe:	00004163          	bltz	zero,600 <default_num_contexts+0x10>
 602:	0000                	.insn	2, 0x
 604:	0000                	.insn	2, 0x
 606:	4024                	.insn	2, 0x4024
 608:	1eb8                	.insn	2, 0x1eb8
 60a:	eb85                	.insn	2, 0xeb85
 60c:	b851                	.insn	2, 0xb851
 60e:	3f9e                	.insn	2, 0x3f9e
 610:	0000                	.insn	2, 0x
 612:	0000                	.insn	2, 0x
 614:	0000                	.insn	2, 0x
 616:	3ff0                	.insn	2, 0x3ff0
 618:	3130                	.insn	2, 0x3130
 61a:	3332                	.insn	2, 0x3332
 61c:	3534                	.insn	2, 0x3534
 61e:	3736                	.insn	2, 0x3736
 620:	3938                	.insn	2, 0x3938
 622:	6261                	.insn	2, 0x6261
 624:	66656463          	bltu	a0,t1,c8c <_trap_stack_size+0x28c>
 628:	6a696867          	.insn	4, 0x6a696867
 62c:	6e6d6c6b          	.insn	4, 0x6e6d6c6b
 630:	7271706f          	j	18556 <__subdf3+0x10966>
 634:	76757473          	.insn	4, 0x76757473
 638:	7a797877          	.insn	4, 0x7a797877
 63c:	0000                	.insn	2, 0x
 63e:	0000                	.insn	2, 0x
 640:	3130                	.insn	2, 0x3130
 642:	3332                	.insn	2, 0x3332
 644:	3534                	.insn	2, 0x3534
 646:	3736                	.insn	2, 0x3736
 648:	3938                	.insn	2, 0x3938
 64a:	4241                	.insn	2, 0x4241
 64c:	46454443          	.insn	4, 0x46454443
 650:	4a494847          	.insn	4, 0x4a494847
 654:	4e4d4c4b          	.insn	4, 0x4e4d4c4b
 658:	5251504f          	.insn	4, 0x5251504f
 65c:	56555453          	.insn	4, 0x56555453
 660:	5a595857          	.insn	4, 0x5a595857
 664:	0000                	.insn	2, 0x
 666:	0000                	.insn	2, 0x
 668:	4e3c                	.insn	2, 0x4e3c
 66a:	4c55                	.insn	2, 0x4c55
 66c:	3e4c                	.insn	2, 0x3e4c
 66e:	0000                	.insn	2, 0x
 670:	5490                	.insn	2, 0x5490
 672:	0000                	.insn	2, 0x
 674:	54c0                	.insn	2, 0x54c0
 676:	0000                	.insn	2, 0x
 678:	54c0                	.insn	2, 0x54c0
 67a:	0000                	.insn	2, 0x
 67c:	54a0                	.insn	2, 0x54a0
 67e:	0000                	.insn	2, 0x
 680:	54c0                	.insn	2, 0x54c0
 682:	0000                	.insn	2, 0x
 684:	54c0                	.insn	2, 0x54c0
 686:	0000                	.insn	2, 0x
 688:	54c0                	.insn	2, 0x54c0
 68a:	0000                	.insn	2, 0x
 68c:	54c0                	.insn	2, 0x54c0
 68e:	0000                	.insn	2, 0x
 690:	54c0                	.insn	2, 0x54c0
 692:	0000                	.insn	2, 0x
 694:	54c0                	.insn	2, 0x54c0
 696:	0000                	.insn	2, 0x
 698:	54c0                	.insn	2, 0x54c0
 69a:	0000                	.insn	2, 0x
 69c:	5480                	.insn	2, 0x5480
 69e:	0000                	.insn	2, 0x
 6a0:	54c0                	.insn	2, 0x54c0
 6a2:	0000                	.insn	2, 0x
 6a4:	5470                	.insn	2, 0x5470
 6a6:	0000                	.insn	2, 0x
 6a8:	54c0                	.insn	2, 0x54c0
 6aa:	0000                	.insn	2, 0x
 6ac:	54c0                	.insn	2, 0x54c0
 6ae:	0000                	.insn	2, 0x
 6b0:	54b0                	.insn	2, 0x54b0
 6b2:	0000                	.insn	2, 0x
 6b4:	5814                	.insn	2, 0x5814
 6b6:	0000                	.insn	2, 0x
 6b8:	5914                	.insn	2, 0x5914
 6ba:	0000                	.insn	2, 0x
 6bc:	5914                	.insn	2, 0x5914
 6be:	0000                	.insn	2, 0x
 6c0:	5914                	.insn	2, 0x5914
 6c2:	0000                	.insn	2, 0x
 6c4:	5914                	.insn	2, 0x5914
 6c6:	0000                	.insn	2, 0x
 6c8:	5914                	.insn	2, 0x5914
 6ca:	0000                	.insn	2, 0x
 6cc:	5914                	.insn	2, 0x5914
 6ce:	0000                	.insn	2, 0x
 6d0:	5914                	.insn	2, 0x5914
 6d2:	0000                	.insn	2, 0x
 6d4:	5914                	.insn	2, 0x5914
 6d6:	0000                	.insn	2, 0x
 6d8:	5914                	.insn	2, 0x5914
 6da:	0000                	.insn	2, 0x
 6dc:	5914                	.insn	2, 0x5914
 6de:	0000                	.insn	2, 0x
 6e0:	5914                	.insn	2, 0x5914
 6e2:	0000                	.insn	2, 0x
 6e4:	5914                	.insn	2, 0x5914
 6e6:	0000                	.insn	2, 0x
 6e8:	5914                	.insn	2, 0x5914
 6ea:	0000                	.insn	2, 0x
 6ec:	5914                	.insn	2, 0x5914
 6ee:	0000                	.insn	2, 0x
 6f0:	5914                	.insn	2, 0x5914
 6f2:	0000                	.insn	2, 0x
 6f4:	5914                	.insn	2, 0x5914
 6f6:	0000                	.insn	2, 0x
 6f8:	5914                	.insn	2, 0x5914
 6fa:	0000                	.insn	2, 0x
 6fc:	5914                	.insn	2, 0x5914
 6fe:	0000                	.insn	2, 0x
 700:	5914                	.insn	2, 0x5914
 702:	0000                	.insn	2, 0x
 704:	5914                	.insn	2, 0x5914
 706:	0000                	.insn	2, 0x
 708:	5914                	.insn	2, 0x5914
 70a:	0000                	.insn	2, 0x
 70c:	5914                	.insn	2, 0x5914
 70e:	0000                	.insn	2, 0x
 710:	5898                	.insn	2, 0x5898
 712:	0000                	.insn	2, 0x
 714:	5914                	.insn	2, 0x5914
 716:	0000                	.insn	2, 0x
 718:	5914                	.insn	2, 0x5914
 71a:	0000                	.insn	2, 0x
 71c:	5914                	.insn	2, 0x5914
 71e:	0000                	.insn	2, 0x
 720:	5914                	.insn	2, 0x5914
 722:	0000                	.insn	2, 0x
 724:	5914                	.insn	2, 0x5914
 726:	0000                	.insn	2, 0x
 728:	5914                	.insn	2, 0x5914
 72a:	0000                	.insn	2, 0x
 72c:	5914                	.insn	2, 0x5914
 72e:	0000                	.insn	2, 0x
 730:	5914                	.insn	2, 0x5914
 732:	0000                	.insn	2, 0x
 734:	5820                	.insn	2, 0x5820
 736:	0000                	.insn	2, 0x
 738:	5914                	.insn	2, 0x5914
 73a:	0000                	.insn	2, 0x
 73c:	5650                	.insn	2, 0x5650
 73e:	0000                	.insn	2, 0x
 740:	58b0                	.insn	2, 0x58b0
 742:	0000                	.insn	2, 0x
 744:	5914                	.insn	2, 0x5914
 746:	0000                	.insn	2, 0x
 748:	58c0                	.insn	2, 0x58c0
 74a:	0000                	.insn	2, 0x
 74c:	5914                	.insn	2, 0x5914
 74e:	0000                	.insn	2, 0x
 750:	5914                	.insn	2, 0x5914
 752:	0000                	.insn	2, 0x
 754:	58b0                	.insn	2, 0x58b0
 756:	0000                	.insn	2, 0x
 758:	5914                	.insn	2, 0x5914
 75a:	0000                	.insn	2, 0x
 75c:	5914                	.insn	2, 0x5914
 75e:	0000                	.insn	2, 0x
 760:	5914                	.insn	2, 0x5914
 762:	0000                	.insn	2, 0x
 764:	5914                	.insn	2, 0x5914
 766:	0000                	.insn	2, 0x
 768:	5914                	.insn	2, 0x5914
 76a:	0000                	.insn	2, 0x
 76c:	588c                	.insn	2, 0x588c
 76e:	0000                	.insn	2, 0x
 770:	57c0                	.insn	2, 0x57c0
 772:	0000                	.insn	2, 0x
 774:	5914                	.insn	2, 0x5914
 776:	0000                	.insn	2, 0x
 778:	5914                	.insn	2, 0x5914
 77a:	0000                	.insn	2, 0x
 77c:	56dc                	.insn	2, 0x56dc
 77e:	0000                	.insn	2, 0x
 780:	5914                	.insn	2, 0x5914
 782:	0000                	.insn	2, 0x
 784:	5970                	.insn	2, 0x5970
 786:	0000                	.insn	2, 0x
 788:	5914                	.insn	2, 0x5914
 78a:	0000                	.insn	2, 0x
 78c:	5914                	.insn	2, 0x5914
 78e:	0000                	.insn	2, 0x
 790:	58a4                	.insn	2, 0x58a4
	...

00000794 <digits>:
 794:	0618                	.insn	2, 0x0618
	...

00000798 <upper_digits>:
 798:	0640                	.insn	2, 0x0640
 79a:	0000                	.insn	2, 0x
 79c:	5f90                	.insn	2, 0x5f90
 79e:	0000                	.insn	2, 0x
 7a0:	5e3c                	.insn	2, 0x5e3c
 7a2:	0000                	.insn	2, 0x
 7a4:	5de8                	.insn	2, 0x5de8
 7a6:	0000                	.insn	2, 0x
 7a8:	5f3c                	.insn	2, 0x5f3c
 7aa:	0000                	.insn	2, 0x
 7ac:	5de8                	.insn	2, 0x5de8
 7ae:	0000                	.insn	2, 0x
 7b0:	5e4c                	.insn	2, 0x5e4c
 7b2:	0000                	.insn	2, 0x
 7b4:	5de8                	.insn	2, 0x5de8
 7b6:	0000                	.insn	2, 0x
 7b8:	5f3c                	.insn	2, 0x5f3c
 7ba:	0000                	.insn	2, 0x
 7bc:	5e3c                	.insn	2, 0x5e3c
 7be:	0000                	.insn	2, 0x
 7c0:	5e3c                	.insn	2, 0x5e3c
 7c2:	0000                	.insn	2, 0x
 7c4:	5e4c                	.insn	2, 0x5e4c
 7c6:	0000                	.insn	2, 0x
 7c8:	5f3c                	.insn	2, 0x5f3c
 7ca:	0000                	.insn	2, 0x
 7cc:	5ec8                	.insn	2, 0x5ec8
 7ce:	0000                	.insn	2, 0x
 7d0:	5ec8                	.insn	2, 0x5ec8
 7d2:	0000                	.insn	2, 0x
 7d4:	5ec8                	.insn	2, 0x5ec8
 7d6:	0000                	.insn	2, 0x
 7d8:	5e4c                	.insn	2, 0x5e4c
	...

000007dc <__clz_tab>:
 7dc:	0100                	.insn	2, 0x0100
 7de:	0202                	.insn	2, 0x0202
 7e0:	03030303          	lb	t1,48(t1)
 7e4:	0404                	.insn	2, 0x0404
 7e6:	0404                	.insn	2, 0x0404
 7e8:	0404                	.insn	2, 0x0404
 7ea:	0404                	.insn	2, 0x0404
 7ec:	0505                	.insn	2, 0x0505
 7ee:	0505                	.insn	2, 0x0505
 7f0:	0505                	.insn	2, 0x0505
 7f2:	0505                	.insn	2, 0x0505
 7f4:	0505                	.insn	2, 0x0505
 7f6:	0505                	.insn	2, 0x0505
 7f8:	0505                	.insn	2, 0x0505
 7fa:	0505                	.insn	2, 0x0505
 7fc:	0606                	.insn	2, 0x0606
 7fe:	0606                	.insn	2, 0x0606

00000800 <_gbl_ptr>:
 800:	0606                	.insn	2, 0x0606
 802:	0606                	.insn	2, 0x0606
 804:	0606                	.insn	2, 0x0606
 806:	0606                	.insn	2, 0x0606
 808:	0606                	.insn	2, 0x0606
 80a:	0606                	.insn	2, 0x0606
 80c:	0606                	.insn	2, 0x0606
 80e:	0606                	.insn	2, 0x0606
 810:	0606                	.insn	2, 0x0606
 812:	0606                	.insn	2, 0x0606
 814:	0606                	.insn	2, 0x0606
 816:	0606                	.insn	2, 0x0606
 818:	0606                	.insn	2, 0x0606
 81a:	0606                	.insn	2, 0x0606
 81c:	07070707          	.insn	4, 0x07070707
 820:	07070707          	.insn	4, 0x07070707
 824:	07070707          	.insn	4, 0x07070707
 828:	07070707          	.insn	4, 0x07070707
 82c:	07070707          	.insn	4, 0x07070707
 830:	07070707          	.insn	4, 0x07070707
 834:	07070707          	.insn	4, 0x07070707
 838:	07070707          	.insn	4, 0x07070707
 83c:	07070707          	.insn	4, 0x07070707
 840:	07070707          	.insn	4, 0x07070707
 844:	07070707          	.insn	4, 0x07070707
 848:	07070707          	.insn	4, 0x07070707
 84c:	07070707          	.insn	4, 0x07070707
 850:	07070707          	.insn	4, 0x07070707
 854:	07070707          	.insn	4, 0x07070707
 858:	07070707          	.insn	4, 0x07070707
 85c:	0808                	.insn	2, 0x0808
 85e:	0808                	.insn	2, 0x0808
 860:	0808                	.insn	2, 0x0808
 862:	0808                	.insn	2, 0x0808
 864:	0808                	.insn	2, 0x0808
 866:	0808                	.insn	2, 0x0808
 868:	0808                	.insn	2, 0x0808
 86a:	0808                	.insn	2, 0x0808
 86c:	0808                	.insn	2, 0x0808
 86e:	0808                	.insn	2, 0x0808
 870:	0808                	.insn	2, 0x0808
 872:	0808                	.insn	2, 0x0808
 874:	0808                	.insn	2, 0x0808
 876:	0808                	.insn	2, 0x0808
 878:	0808                	.insn	2, 0x0808
 87a:	0808                	.insn	2, 0x0808
 87c:	0808                	.insn	2, 0x0808
 87e:	0808                	.insn	2, 0x0808
 880:	0808                	.insn	2, 0x0808
 882:	0808                	.insn	2, 0x0808
 884:	0808                	.insn	2, 0x0808
 886:	0808                	.insn	2, 0x0808
 888:	0808                	.insn	2, 0x0808
 88a:	0808                	.insn	2, 0x0808
 88c:	0808                	.insn	2, 0x0808
 88e:	0808                	.insn	2, 0x0808
 890:	0808                	.insn	2, 0x0808
 892:	0808                	.insn	2, 0x0808
 894:	0808                	.insn	2, 0x0808
 896:	0808                	.insn	2, 0x0808
 898:	0808                	.insn	2, 0x0808
 89a:	0808                	.insn	2, 0x0808
 89c:	0808                	.insn	2, 0x0808
 89e:	0808                	.insn	2, 0x0808
 8a0:	0808                	.insn	2, 0x0808
 8a2:	0808                	.insn	2, 0x0808
 8a4:	0808                	.insn	2, 0x0808
 8a6:	0808                	.insn	2, 0x0808
 8a8:	0808                	.insn	2, 0x0808
 8aa:	0808                	.insn	2, 0x0808
 8ac:	0808                	.insn	2, 0x0808
 8ae:	0808                	.insn	2, 0x0808
 8b0:	0808                	.insn	2, 0x0808
 8b2:	0808                	.insn	2, 0x0808
 8b4:	0808                	.insn	2, 0x0808
 8b6:	0808                	.insn	2, 0x0808
 8b8:	0808                	.insn	2, 0x0808
 8ba:	0808                	.insn	2, 0x0808
 8bc:	0808                	.insn	2, 0x0808
 8be:	0808                	.insn	2, 0x0808
 8c0:	0808                	.insn	2, 0x0808
 8c2:	0808                	.insn	2, 0x0808
 8c4:	0808                	.insn	2, 0x0808
 8c6:	0808                	.insn	2, 0x0808
 8c8:	0808                	.insn	2, 0x0808
 8ca:	0808                	.insn	2, 0x0808
 8cc:	0808                	.insn	2, 0x0808
 8ce:	0808                	.insn	2, 0x0808
 8d0:	0808                	.insn	2, 0x0808
 8d2:	0808                	.insn	2, 0x0808
 8d4:	0808                	.insn	2, 0x0808
 8d6:	0808                	.insn	2, 0x0808
 8d8:	0808                	.insn	2, 0x0808
 8da:	0808                	.insn	2, 0x0808

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
   8:	01007663          	bgeu	zero,a6,14 <matrix_known_crc+0x8>
   c:	001e                	.insn	2, 0x001e
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	697a                	.insn	2, 0x697a
  1e:	32727363          	bgeu	tp,t2,344 <main+0xe8>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

