
coremark.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00001197          	auipc	gp,0x1
       4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
       8:	00003117          	auipc	sp,0x3
       c:	5f810113          	add	sp,sp,1528 # 3600 <_stack_ptr>
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
      3c:	fc838393          	add	t2,t2,-56 # 4000 <_trap_stack_ptr>
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
      6c:	59808093          	add	ra,ra,1432 # 3600 <_stack_ptr>
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
     1a4:	3c4010ef          	jal	1568 <core_bench_list>
     1a8:	00050793          	mv	a5,a0
     1ac:	fef41123          	sh	a5,-30(s0)
     1b0:	fe842783          	lw	a5,-24(s0)
     1b4:	0387d703          	lhu	a4,56(a5)
     1b8:	fe245783          	lhu	a5,-30(s0)
     1bc:	00070593          	mv	a1,a4
     1c0:	00078513          	mv	a0,a5
     1c4:	400030ef          	jal	35c4 <crcu16>
     1c8:	00050793          	mv	a5,a0
     1cc:	00078713          	mv	a4,a5
     1d0:	fe842783          	lw	a5,-24(s0)
     1d4:	02e79c23          	sh	a4,56(a5)
     1d8:	fff00593          	li	a1,-1
     1dc:	fe842503          	lw	a0,-24(s0)
     1e0:	388010ef          	jal	1568 <core_bench_list>
     1e4:	00050793          	mv	a5,a0
     1e8:	fef41123          	sh	a5,-30(s0)
     1ec:	fe842783          	lw	a5,-24(s0)
     1f0:	0387d703          	lhu	a4,56(a5)
     1f4:	fe245783          	lhu	a5,-30(s0)
     1f8:	00070593          	mv	a1,a4
     1fc:	00078513          	mv	a0,a5
     200:	3c4030ef          	jal	35c4 <crcu16>
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
     280:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff7908>
     284:	008787b3          	add	a5,a5,s0
     288:	7aa7ae23          	sw	a0,1980(a5)
     28c:	fffff7b7          	lui	a5,0xfffff
     290:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff7908>
     294:	008787b3          	add	a5,a5,s0
     298:	7ab7ac23          	sw	a1,1976(a5)
     29c:	fc041e23          	sh	zero,-36(s0)
     2a0:	fc041d23          	sh	zero,-38(s0)
     2a4:	fff00793          	li	a5,-1
     2a8:	fcf41c23          	sh	a5,-40(s0)
     2ac:	fc041b23          	sh	zero,-42(s0)
     2b0:	fc041123          	sh	zero,-62(s0)
     2b4:	fffff7b7          	lui	a5,0xfffff
     2b8:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff7908>
     2bc:	008787b3          	add	a5,a5,s0
     2c0:	fffff737          	lui	a4,0xfffff
     2c4:	7bc70713          	add	a4,a4,1980 # fffff7bc <__subdf3+0xffff80e4>
     2c8:	fe070713          	add	a4,a4,-32
     2cc:	008706b3          	add	a3,a4,s0
     2d0:	f7840713          	add	a4,s0,-136
     2d4:	04270713          	add	a4,a4,66
     2d8:	7b87a603          	lw	a2,1976(a5)
     2dc:	00068593          	mv	a1,a3
     2e0:	00070513          	mv	a0,a4
     2e4:	5b0030ef          	jal	3894 <portable_init>
     2e8:	00100513          	li	a0,1
     2ec:	134030ef          	jal	3420 <get_seed_32>
     2f0:	00050793          	mv	a5,a0
     2f4:	01079793          	sll	a5,a5,0x10
     2f8:	4107d793          	sra	a5,a5,0x10
     2fc:	f6f41c23          	sh	a5,-136(s0)
     300:	00200513          	li	a0,2
     304:	11c030ef          	jal	3420 <get_seed_32>
     308:	00050793          	mv	a5,a0
     30c:	01079793          	sll	a5,a5,0x10
     310:	4107d793          	sra	a5,a5,0x10
     314:	f6f41d23          	sh	a5,-134(s0)
     318:	00300513          	li	a0,3
     31c:	104030ef          	jal	3420 <get_seed_32>
     320:	00050793          	mv	a5,a0
     324:	01079793          	sll	a5,a5,0x10
     328:	4107d793          	sra	a5,a5,0x10
     32c:	f6f41e23          	sh	a5,-132(s0)
     330:	00400513          	li	a0,4
     334:	0ec030ef          	jal	3420 <get_seed_32>
     338:	00050793          	mv	a5,a0
     33c:	f8f42a23          	sw	a5,-108(s0)
     340:	00500513          	li	a0,5
     344:	0dc030ef          	jal	3420 <get_seed_32>
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
     3a8:	41578793          	add	a5,a5,1045 # 3415 <core_state_transition+0x38d>
     3ac:	f6f41c23          	sh	a5,-136(s0)
     3b0:	000037b7          	lui	a5,0x3
     3b4:	41578793          	add	a5,a5,1045 # 3415 <core_state_transition+0x38d>
     3b8:	f6f41d23          	sh	a5,-134(s0)
     3bc:	06600793          	li	a5,102
     3c0:	f6f41e23          	sh	a5,-132(s0)
     3c4:	fc041f23          	sh	zero,-34(s0)
     3c8:	1280006f          	j	4f0 <errpat+0x38>
     3cc:	fde45703          	lhu	a4,-34(s0)
     3d0:	7d000793          	li	a5,2000
     3d4:	02f707b3          	mul	a5,a4,a5
     3d8:	00078693          	mv	a3,a5
     3dc:	fde45703          	lhu	a4,-34(s0)
     3e0:	fffff7b7          	lui	a5,0xfffff
     3e4:	7c878793          	add	a5,a5,1992 # fffff7c8 <__subdf3+0xffff80f0>
     3e8:	fe078793          	add	a5,a5,-32
     3ec:	008787b3          	add	a5,a5,s0
     3f0:	00d786b3          	add	a3,a5,a3
     3f4:	00070793          	mv	a5,a4
     3f8:	00479793          	sll	a5,a5,0x4
     3fc:	00e787b3          	add	a5,a5,a4
     400:	00279793          	sll	a5,a5,0x2
     404:	fe078793          	add	a5,a5,-32
     408:	008787b3          	add	a5,a5,s0
     40c:	fad7a023          	sw	a3,-96(a5)
     410:	fde45703          	lhu	a4,-34(s0)
     414:	00070793          	mv	a5,a4
     418:	00479793          	sll	a5,a5,0x4
     41c:	00e787b3          	add	a5,a5,a4
     420:	00279793          	sll	a5,a5,0x2
     424:	fe078793          	add	a5,a5,-32
     428:	008787b3          	add	a5,a5,s0
     42c:	7d000713          	li	a4,2000
     430:	fae7a823          	sw	a4,-80(a5)
     434:	fde45703          	lhu	a4,-34(s0)
     438:	f7841683          	lh	a3,-136(s0)
     43c:	00070793          	mv	a5,a4
     440:	00479793          	sll	a5,a5,0x4
     444:	00e787b3          	add	a5,a5,a4
     448:	00279793          	sll	a5,a5,0x2
     44c:	fe078793          	add	a5,a5,-32
     450:	008787b3          	add	a5,a5,s0
     454:	f8d79c23          	sh	a3,-104(a5)
     458:	fde45703          	lhu	a4,-34(s0)
     45c:	f7a41683          	lh	a3,-134(s0)
     460:	00070793          	mv	a5,a4
     464:	00479793          	sll	a5,a5,0x4
     468:	00e787b3          	add	a5,a5,a4
     46c:	00279793          	sll	a5,a5,0x2
     470:	fe078793          	add	a5,a5,-32
     474:	008787b3          	add	a5,a5,s0
     478:	f8d79d23          	sh	a3,-102(a5)
     47c:	fde45703          	lhu	a4,-34(s0)
     480:	f7c41683          	lh	a3,-132(s0)
     484:	00070793          	mv	a5,a4
     488:	00479793          	sll	a5,a5,0x4
     48c:	00e787b3          	add	a5,a5,a4
     490:	00279793          	sll	a5,a5,0x2
     494:	fe078793          	add	a5,a5,-32
     498:	008787b3          	add	a5,a5,s0
     49c:	f8d79e23          	sh	a3,-100(a5)
     4a0:	fde45703          	lhu	a4,-34(s0)
     4a4:	00070793          	mv	a5,a4
     4a8:	00479793          	sll	a5,a5,0x4
     4ac:	00e787b3          	add	a5,a5,a4
     4b0:	00279793          	sll	a5,a5,0x2
     4b4:	fe078793          	add	a5,a5,-32
     4b8:	008787b3          	add	a5,a5,s0
     4bc:	fc079c23          	sh	zero,-40(a5)
     4c0:	fde45703          	lhu	a4,-34(s0)
     4c4:	f9842683          	lw	a3,-104(s0)
     4c8:	00070793          	mv	a5,a4
     4cc:	00479793          	sll	a5,a5,0x4
     4d0:	00e787b3          	add	a5,a5,a4
     4d4:	00279793          	sll	a5,a5,0x2
     4d8:	fe078793          	add	a5,a5,-32
     4dc:	008787b3          	add	a5,a5,s0
     4e0:	fad7ac23          	sw	a3,-72(a5)
     4e4:	fde45783          	lhu	a5,-34(s0)
     4e8:	00178793          	add	a5,a5,1
     4ec:	fcf41f23          	sh	a5,-34(s0)
     4f0:	fde45783          	lhu	a5,-34(s0)
     4f4:	ec078ce3          	beqz	a5,3cc <main+0x170>
     4f8:	fc041f23          	sh	zero,-34(s0)
     4fc:	0380006f          	j	534 <_stack_size+0x34>
     500:	fde45783          	lhu	a5,-34(s0)
     504:	00100713          	li	a4,1
     508:	00f717b3          	sll	a5,a4,a5
     50c:	00078713          	mv	a4,a5
     510:	f9842783          	lw	a5,-104(s0)
     514:	00f777b3          	and	a5,a4,a5
     518:	00078863          	beqz	a5,528 <_stack_size+0x28>
     51c:	fda45783          	lhu	a5,-38(s0)
     520:	00178793          	add	a5,a5,1
     524:	fcf41d23          	sh	a5,-38(s0)
     528:	fde45783          	lhu	a5,-34(s0)
     52c:	00178793          	add	a5,a5,1
     530:	fcf41f23          	sh	a5,-34(s0)
     534:	fde45703          	lhu	a4,-34(s0)
     538:	00200793          	li	a5,2
     53c:	fce7f2e3          	bgeu	a5,a4,500 <_stack_size>
     540:	fc041f23          	sh	zero,-34(s0)
     544:	0580006f          	j	59c <_stack_size+0x9c>
     548:	fde45703          	lhu	a4,-34(s0)
     54c:	00070793          	mv	a5,a4
     550:	00479793          	sll	a5,a5,0x4
     554:	00e787b3          	add	a5,a5,a4
     558:	00279793          	sll	a5,a5,0x2
     55c:	fe078793          	add	a5,a5,-32
     560:	008787b3          	add	a5,a5,s0
     564:	fb07a683          	lw	a3,-80(a5)
     568:	fda45783          	lhu	a5,-38(s0)
     56c:	fde45703          	lhu	a4,-34(s0)
     570:	02f6d6b3          	divu	a3,a3,a5
     574:	00070793          	mv	a5,a4
     578:	00479793          	sll	a5,a5,0x4
     57c:	00e787b3          	add	a5,a5,a4
     580:	00279793          	sll	a5,a5,0x2
     584:	fe078793          	add	a5,a5,-32
     588:	008787b3          	add	a5,a5,s0
     58c:	fad7a823          	sw	a3,-80(a5)
     590:	fde45783          	lhu	a5,-34(s0)
     594:	00178793          	add	a5,a5,1
     598:	fcf41f23          	sh	a5,-34(s0)
     59c:	fde45783          	lhu	a5,-34(s0)
     5a0:	fa0784e3          	beqz	a5,548 <_stack_size+0x48>
     5a4:	fc041f23          	sh	zero,-34(s0)
     5a8:	0b00006f          	j	658 <default_num_contexts+0x68>
     5ac:	fde45783          	lhu	a5,-34(s0)
     5b0:	00100713          	li	a4,1
     5b4:	00f717b3          	sll	a5,a4,a5
     5b8:	00078713          	mv	a4,a5
     5bc:	f9842783          	lw	a5,-104(s0)
     5c0:	00f777b3          	and	a5,a4,a5
     5c4:	08078463          	beqz	a5,64c <default_num_contexts+0x5c>
     5c8:	fc042823          	sw	zero,-48(s0)
     5cc:	06c0006f          	j	638 <default_num_contexts+0x48>
     5d0:	fd042703          	lw	a4,-48(s0)
     5d4:	00070793          	mv	a5,a4
     5d8:	00479793          	sll	a5,a5,0x4
     5dc:	00e787b3          	add	a5,a5,a4
     5e0:	00279793          	sll	a5,a5,0x2
     5e4:	fe078793          	add	a5,a5,-32
     5e8:	008787b3          	add	a5,a5,s0
     5ec:	fa07a703          	lw	a4,-96(a5)
     5f0:	f9042683          	lw	a3,-112(s0)
     5f4:	fdc45783          	lhu	a5,-36(s0)
     5f8:	02f687b3          	mul	a5,a3,a5
     5fc:	fde45683          	lhu	a3,-34(s0)
     600:	00168613          	add	a2,a3,1
     604:	00f706b3          	add	a3,a4,a5
     608:	fd042703          	lw	a4,-48(s0)
     60c:	00070793          	mv	a5,a4
     610:	00479793          	sll	a5,a5,0x4
     614:	00e787b3          	add	a5,a5,a4
     618:	00c787b3          	add	a5,a5,a2
     61c:	00279793          	sll	a5,a5,0x2
     620:	fe078793          	add	a5,a5,-32
     624:	008787b3          	add	a5,a5,s0
     628:	fad7a023          	sw	a3,-96(a5)
     62c:	fd042783          	lw	a5,-48(s0)
     630:	00178793          	add	a5,a5,1
     634:	fcf42823          	sw	a5,-48(s0)
     638:	fd042783          	lw	a5,-48(s0)
     63c:	f8078ae3          	beqz	a5,5d0 <_stack_size+0xd0>
     640:	fdc45783          	lhu	a5,-36(s0)
     644:	00178793          	add	a5,a5,1
     648:	fcf41e23          	sh	a5,-36(s0)
     64c:	fde45783          	lhu	a5,-34(s0)
     650:	00178793          	add	a5,a5,1
     654:	fcf41f23          	sh	a5,-34(s0)
     658:	fde45703          	lhu	a4,-34(s0)
     65c:	00200793          	li	a5,2
     660:	f4e7f6e3          	bgeu	a5,a4,5ac <_stack_size+0xac>
     664:	fc041f23          	sh	zero,-34(s0)
     668:	1e80006f          	j	850 <_gbl_ptr+0x50>
     66c:	fde45703          	lhu	a4,-34(s0)
     670:	00070793          	mv	a5,a4
     674:	00479793          	sll	a5,a5,0x4
     678:	00e787b3          	add	a5,a5,a4
     67c:	00279793          	sll	a5,a5,0x2
     680:	fe078793          	add	a5,a5,-32
     684:	008787b3          	add	a5,a5,s0
     688:	fb87a783          	lw	a5,-72(a5)
     68c:	0017f793          	and	a5,a5,1
     690:	06078c63          	beqz	a5,708 <default_num_contexts+0x118>
     694:	f9042683          	lw	a3,-112(s0)
     698:	fde45703          	lhu	a4,-34(s0)
     69c:	00070793          	mv	a5,a4
     6a0:	00479793          	sll	a5,a5,0x4
     6a4:	00e787b3          	add	a5,a5,a4
     6a8:	00279793          	sll	a5,a5,0x2
     6ac:	fe078793          	add	a5,a5,-32
     6b0:	008787b3          	add	a5,a5,s0
     6b4:	fa47a583          	lw	a1,-92(a5)
     6b8:	fde45703          	lhu	a4,-34(s0)
     6bc:	00070793          	mv	a5,a4
     6c0:	00479793          	sll	a5,a5,0x4
     6c4:	00e787b3          	add	a5,a5,a4
     6c8:	00279793          	sll	a5,a5,0x2
     6cc:	fe078793          	add	a5,a5,-32
     6d0:	008787b3          	add	a5,a5,s0
     6d4:	f9879783          	lh	a5,-104(a5)
     6d8:	fde45483          	lhu	s1,-34(s0)
     6dc:	00078613          	mv	a2,a5
     6e0:	00068513          	mv	a0,a3
     6e4:	1ac010ef          	jal	1890 <core_list_init>
     6e8:	00050713          	mv	a4,a0
     6ec:	00048793          	mv	a5,s1
     6f0:	00479793          	sll	a5,a5,0x4
     6f4:	009787b3          	add	a5,a5,s1
     6f8:	00279793          	sll	a5,a5,0x2
     6fc:	fe078793          	add	a5,a5,-32
     700:	008787b3          	add	a5,a5,s0
     704:	fae7ae23          	sw	a4,-68(a5)
     708:	fde45703          	lhu	a4,-34(s0)
     70c:	00070793          	mv	a5,a4
     710:	00479793          	sll	a5,a5,0x4
     714:	00e787b3          	add	a5,a5,a4
     718:	00279793          	sll	a5,a5,0x2
     71c:	fe078793          	add	a5,a5,-32
     720:	008787b3          	add	a5,a5,s0
     724:	fb87a783          	lw	a5,-72(a5)
     728:	0027f793          	and	a5,a5,2
     72c:	0a078063          	beqz	a5,7cc <upper_digits+0x34>
     730:	f9042503          	lw	a0,-112(s0)
     734:	fde45703          	lhu	a4,-34(s0)
     738:	00070793          	mv	a5,a4
     73c:	00479793          	sll	a5,a5,0x4
     740:	00e787b3          	add	a5,a5,a4
     744:	00279793          	sll	a5,a5,0x2
     748:	fe078793          	add	a5,a5,-32
     74c:	008787b3          	add	a5,a5,s0
     750:	fa87a583          	lw	a1,-88(a5)
     754:	fde45703          	lhu	a4,-34(s0)
     758:	00070793          	mv	a5,a4
     75c:	00479793          	sll	a5,a5,0x4
     760:	00e787b3          	add	a5,a5,a4
     764:	00279793          	sll	a5,a5,0x2
     768:	fe078793          	add	a5,a5,-32
     76c:	008787b3          	add	a5,a5,s0
     770:	f9879783          	lh	a5,-104(a5)
     774:	00078693          	mv	a3,a5
     778:	fde45703          	lhu	a4,-34(s0)
     77c:	00070793          	mv	a5,a4
     780:	00479793          	sll	a5,a5,0x4
     784:	00e787b3          	add	a5,a5,a4
     788:	00279793          	sll	a5,a5,0x2
     78c:	fe078793          	add	a5,a5,-32
     790:	008787b3          	add	a5,a5,s0
     794:	f9a79783          	lh	a5,-102(a5)
     798:	01079793          	sll	a5,a5,0x10
     79c:	00f6e633          	or	a2,a3,a5
     7a0:	fde45703          	lhu	a4,-34(s0)
     7a4:	f7840693          	add	a3,s0,-136
     7a8:	00070793          	mv	a5,a4
     7ac:	00479793          	sll	a5,a5,0x4
     7b0:	00e787b3          	add	a5,a5,a4
     7b4:	00279793          	sll	a5,a5,0x2
     7b8:	02078793          	add	a5,a5,32
     7bc:	00f687b3          	add	a5,a3,a5
     7c0:	00878793          	add	a5,a5,8
     7c4:	00078693          	mv	a3,a5
     7c8:	2c1010ef          	jal	2288 <core_init_matrix>
     7cc:	fde45703          	lhu	a4,-34(s0)
     7d0:	00070793          	mv	a5,a4
     7d4:	00479793          	sll	a5,a5,0x4
     7d8:	00e787b3          	add	a5,a5,a4
     7dc:	00279793          	sll	a5,a5,0x2
     7e0:	fe078793          	add	a5,a5,-32
     7e4:	008787b3          	add	a5,a5,s0
     7e8:	fb87a783          	lw	a5,-72(a5)
     7ec:	0047f793          	and	a5,a5,4
     7f0:	04078a63          	beqz	a5,844 <_gbl_ptr+0x44>
     7f4:	f9042683          	lw	a3,-112(s0)
     7f8:	fde45703          	lhu	a4,-34(s0)
     7fc:	00070793          	mv	a5,a4
     800:	00479793          	sll	a5,a5,0x4
     804:	00e787b3          	add	a5,a5,a4
     808:	00279793          	sll	a5,a5,0x2
     80c:	fe078793          	add	a5,a5,-32
     810:	008787b3          	add	a5,a5,s0
     814:	f9879583          	lh	a1,-104(a5)
     818:	fde45703          	lhu	a4,-34(s0)
     81c:	00070793          	mv	a5,a4
     820:	00479793          	sll	a5,a5,0x4
     824:	00e787b3          	add	a5,a5,a4
     828:	00279793          	sll	a5,a5,0x2
     82c:	fe078793          	add	a5,a5,-32
     830:	008787b3          	add	a5,a5,s0
     834:	fac7a783          	lw	a5,-84(a5)
     838:	00078613          	mv	a2,a5
     83c:	00068513          	mv	a0,a3
     840:	580020ef          	jal	2dc0 <core_init_state>
     844:	fde45783          	lhu	a5,-34(s0)
     848:	00178793          	add	a5,a5,1
     84c:	fcf41f23          	sh	a5,-34(s0)
     850:	fde45783          	lhu	a5,-34(s0)
     854:	e0078ce3          	beqz	a5,66c <default_num_contexts+0x7c>
     858:	f9442783          	lw	a5,-108(s0)
     85c:	0c079063          	bnez	a5,91c <CVTBUF+0x38>
     860:	00000713          	li	a4,0
     864:	00000793          	li	a5,0
     868:	fce42423          	sw	a4,-56(s0)
     86c:	fcf42623          	sw	a5,-52(s0)
     870:	00100793          	li	a5,1
     874:	f8f42a23          	sw	a5,-108(s0)
     878:	0480006f          	j	8c0 <_gbl_ptr+0xc0>
     87c:	f9442703          	lw	a4,-108(s0)
     880:	00070793          	mv	a5,a4
     884:	00279793          	sll	a5,a5,0x2
     888:	00e787b3          	add	a5,a5,a4
     88c:	00179793          	sll	a5,a5,0x1
     890:	f8f42a23          	sw	a5,-108(s0)
     894:	6f9020ef          	jal	378c <start_time>
     898:	f7840793          	add	a5,s0,-136
     89c:	00078513          	mv	a0,a5
     8a0:	8adff0ef          	jal	14c <iterate>
     8a4:	71d020ef          	jal	37c0 <stop_time>
     8a8:	74d020ef          	jal	37f4 <get_time>
     8ac:	00050793          	mv	a5,a0
     8b0:	00078513          	mv	a0,a5
     8b4:	779020ef          	jal	382c <time_in_secs>
     8b8:	fca42423          	sw	a0,-56(s0)
     8bc:	fcb42623          	sw	a1,-52(s0)
     8c0:	47802603          	lw	a2,1144(zero) # 478 <main+0x21c>
     8c4:	47c02683          	lw	a3,1148(zero) # 47c <main+0x220>
     8c8:	fc842503          	lw	a0,-56(s0)
     8cc:	fcc42583          	lw	a1,-52(s0)
     8d0:	1f8060ef          	jal	6ac8 <__ledf2>
     8d4:	00050793          	mv	a5,a0
     8d8:	fa07c2e3          	bltz	a5,87c <_gbl_ptr+0x7c>
     8dc:	fc842503          	lw	a0,-56(s0)
     8e0:	fcc42583          	lw	a1,-52(s0)
     8e4:	249060ef          	jal	732c <__fixunsdfsi>
     8e8:	00050793          	mv	a5,a0
     8ec:	fcf42223          	sw	a5,-60(s0)
     8f0:	fc442783          	lw	a5,-60(s0)
     8f4:	00079663          	bnez	a5,900 <CVTBUF+0x1c>
     8f8:	00100793          	li	a5,1
     8fc:	fcf42223          	sw	a5,-60(s0)
     900:	f9442703          	lw	a4,-108(s0)
     904:	00a00693          	li	a3,10
     908:	fc442783          	lw	a5,-60(s0)
     90c:	02f6d7b3          	divu	a5,a3,a5
     910:	00178793          	add	a5,a5,1
     914:	02f707b3          	mul	a5,a4,a5
     918:	f8f42a23          	sw	a5,-108(s0)
     91c:	671020ef          	jal	378c <start_time>
     920:	f7840793          	add	a5,s0,-136
     924:	00078513          	mv	a0,a5
     928:	825ff0ef          	jal	14c <iterate>
     92c:	695020ef          	jal	37c0 <stop_time>
     930:	6c5020ef          	jal	37f4 <get_time>
     934:	faa42e23          	sw	a0,-68(s0)
     938:	f7841783          	lh	a5,-136(s0)
     93c:	fc245703          	lhu	a4,-62(s0)
     940:	00070593          	mv	a1,a4
     944:	00078513          	mv	a0,a5
     948:	585020ef          	jal	36cc <crc16>
     94c:	00050793          	mv	a5,a0
     950:	fcf41123          	sh	a5,-62(s0)
     954:	f7a41783          	lh	a5,-134(s0)
     958:	fc245703          	lhu	a4,-62(s0)
     95c:	00070593          	mv	a1,a4
     960:	00078513          	mv	a0,a5
     964:	569020ef          	jal	36cc <crc16>
     968:	00050793          	mv	a5,a0
     96c:	fcf41123          	sh	a5,-62(s0)
     970:	f7c41783          	lh	a5,-132(s0)
     974:	fc245703          	lhu	a4,-62(s0)
     978:	00070593          	mv	a1,a4
     97c:	00078513          	mv	a0,a5
     980:	54d020ef          	jal	36cc <crc16>
     984:	00050793          	mv	a5,a0
     988:	fcf41123          	sh	a5,-62(s0)
     98c:	f9042783          	lw	a5,-112(s0)
     990:	01079793          	sll	a5,a5,0x10
     994:	4107d793          	sra	a5,a5,0x10
     998:	fc245703          	lhu	a4,-62(s0)
     99c:	00070593          	mv	a1,a4
     9a0:	00078513          	mv	a0,a5
     9a4:	529020ef          	jal	36cc <crc16>
     9a8:	00050793          	mv	a5,a0
     9ac:	fcf41123          	sh	a5,-62(s0)
     9b0:	fc245783          	lhu	a5,-62(s0)
     9b4:	0000f737          	lui	a4,0xf
     9b8:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x731d>
     9bc:	08e78a63          	beq	a5,a4,a50 <_trap_stack_size+0x50>
     9c0:	0000f737          	lui	a4,0xf
     9c4:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x731d>
     9c8:	0af74863          	blt	a4,a5,a78 <_trap_stack_size+0x78>
     9cc:	00009737          	lui	a4,0x9
     9d0:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0x132a>
     9d4:	04e78263          	beq	a5,a4,a18 <_trap_stack_size+0x18>
     9d8:	00009737          	lui	a4,0x9
     9dc:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0x132a>
     9e0:	08f74c63          	blt	a4,a5,a78 <_trap_stack_size+0x78>
     9e4:	00008737          	lui	a4,0x8
     9e8:	b0570713          	add	a4,a4,-1275 # 7b05 <__subdf3+0x42d>
     9ec:	02e78e63          	beq	a5,a4,a28 <_trap_stack_size+0x28>
     9f0:	00008737          	lui	a4,0x8
     9f4:	b0570713          	add	a4,a4,-1275 # 7b05 <__subdf3+0x42d>
     9f8:	08f74063          	blt	a4,a5,a78 <_trap_stack_size+0x78>
     9fc:	00002737          	lui	a4,0x2
     a00:	8f270713          	add	a4,a4,-1806 # 18f2 <core_list_init+0x62>
     a04:	06e78063          	beq	a5,a4,a64 <_trap_stack_size+0x64>
     a08:	00005737          	lui	a4,0x5
     a0c:	eaf70713          	add	a4,a4,-337 # 4eaf <cropzeros+0xef>
     a10:	02e78663          	beq	a5,a4,a3c <_trap_stack_size+0x3c>
     a14:	0640006f          	j	a78 <_trap_stack_size+0x78>
     a18:	fc041c23          	sh	zero,-40(s0)
     a1c:	04800513          	li	a0,72
     a20:	611040ef          	jal	5830 <ee_printf>
     a24:	0600006f          	j	a84 <_trap_stack_size+0x84>
     a28:	00100793          	li	a5,1
     a2c:	fcf41c23          	sh	a5,-40(s0)
     a30:	07800513          	li	a0,120
     a34:	5fd040ef          	jal	5830 <ee_printf>
     a38:	04c0006f          	j	a84 <_trap_stack_size+0x84>
     a3c:	00200793          	li	a5,2
     a40:	fcf41c23          	sh	a5,-40(s0)
     a44:	0a400513          	li	a0,164
     a48:	5e9040ef          	jal	5830 <ee_printf>
     a4c:	0380006f          	j	a84 <_trap_stack_size+0x84>
     a50:	00300793          	li	a5,3
     a54:	fcf41c23          	sh	a5,-40(s0)
     a58:	0d800513          	li	a0,216
     a5c:	5d5040ef          	jal	5830 <ee_printf>
     a60:	0240006f          	j	a84 <_trap_stack_size+0x84>
     a64:	00400793          	li	a5,4
     a68:	fcf41c23          	sh	a5,-40(s0)
     a6c:	10800513          	li	a0,264
     a70:	5c1040ef          	jal	5830 <ee_printf>
     a74:	0100006f          	j	a84 <_trap_stack_size+0x84>
     a78:	fff00793          	li	a5,-1
     a7c:	fcf41b23          	sh	a5,-42(s0)
     a80:	00000013          	nop
     a84:	fd841783          	lh	a5,-40(s0)
     a88:	3807c063          	bltz	a5,e08 <_trap_stack_size+0x408>
     a8c:	fc041f23          	sh	zero,-34(s0)
     a90:	36c0006f          	j	dfc <_trap_stack_size+0x3fc>
     a94:	fde45703          	lhu	a4,-34(s0)
     a98:	00070793          	mv	a5,a4
     a9c:	00479793          	sll	a5,a5,0x4
     aa0:	00e787b3          	add	a5,a5,a4
     aa4:	00279793          	sll	a5,a5,0x2
     aa8:	fe078793          	add	a5,a5,-32
     aac:	008787b3          	add	a5,a5,s0
     ab0:	fc079c23          	sh	zero,-40(a5)
     ab4:	fde45703          	lhu	a4,-34(s0)
     ab8:	00070793          	mv	a5,a4
     abc:	00479793          	sll	a5,a5,0x4
     ac0:	00e787b3          	add	a5,a5,a4
     ac4:	00279793          	sll	a5,a5,0x2
     ac8:	fe078793          	add	a5,a5,-32
     acc:	008787b3          	add	a5,a5,s0
     ad0:	fb87a783          	lw	a5,-72(a5)
     ad4:	0017f793          	and	a5,a5,1
     ad8:	0c078e63          	beqz	a5,bb4 <_trap_stack_size+0x1b4>
     adc:	fde45703          	lhu	a4,-34(s0)
     ae0:	00070793          	mv	a5,a4
     ae4:	00479793          	sll	a5,a5,0x4
     ae8:	00e787b3          	add	a5,a5,a4
     aec:	00279793          	sll	a5,a5,0x2
     af0:	fe078793          	add	a5,a5,-32
     af4:	008787b3          	add	a5,a5,s0
     af8:	fd27d703          	lhu	a4,-46(a5)
     afc:	fd841783          	lh	a5,-40(s0)
     b00:	00000693          	li	a3,0
     b04:	00179793          	sll	a5,a5,0x1
     b08:	00f687b3          	add	a5,a3,a5
     b0c:	0007d783          	lhu	a5,0(a5)
     b10:	0af70263          	beq	a4,a5,bb4 <_trap_stack_size+0x1b4>
     b14:	fde45583          	lhu	a1,-34(s0)
     b18:	fde45703          	lhu	a4,-34(s0)
     b1c:	00070793          	mv	a5,a4
     b20:	00479793          	sll	a5,a5,0x4
     b24:	00e787b3          	add	a5,a5,a4
     b28:	00279793          	sll	a5,a5,0x2
     b2c:	fe078793          	add	a5,a5,-32
     b30:	008787b3          	add	a5,a5,s0
     b34:	fd27d783          	lhu	a5,-46(a5)
     b38:	00078613          	mv	a2,a5
     b3c:	fd841783          	lh	a5,-40(s0)
     b40:	00000713          	li	a4,0
     b44:	00179793          	sll	a5,a5,0x1
     b48:	00f707b3          	add	a5,a4,a5
     b4c:	0007d783          	lhu	a5,0(a5)
     b50:	00078693          	mv	a3,a5
     b54:	13400513          	li	a0,308
     b58:	4d9040ef          	jal	5830 <ee_printf>
     b5c:	fde45703          	lhu	a4,-34(s0)
     b60:	00070793          	mv	a5,a4
     b64:	00479793          	sll	a5,a5,0x4
     b68:	00e787b3          	add	a5,a5,a4
     b6c:	00279793          	sll	a5,a5,0x2
     b70:	fe078793          	add	a5,a5,-32
     b74:	008787b3          	add	a5,a5,s0
     b78:	fd879783          	lh	a5,-40(a5)
     b7c:	01079793          	sll	a5,a5,0x10
     b80:	0107d793          	srl	a5,a5,0x10
     b84:	00178793          	add	a5,a5,1
     b88:	01079793          	sll	a5,a5,0x10
     b8c:	0107d793          	srl	a5,a5,0x10
     b90:	01079693          	sll	a3,a5,0x10
     b94:	4106d693          	sra	a3,a3,0x10
     b98:	00070793          	mv	a5,a4
     b9c:	00479793          	sll	a5,a5,0x4
     ba0:	00e787b3          	add	a5,a5,a4
     ba4:	00279793          	sll	a5,a5,0x2
     ba8:	fe078793          	add	a5,a5,-32
     bac:	008787b3          	add	a5,a5,s0
     bb0:	fcd79c23          	sh	a3,-40(a5)
     bb4:	fde45703          	lhu	a4,-34(s0)
     bb8:	00070793          	mv	a5,a4
     bbc:	00479793          	sll	a5,a5,0x4
     bc0:	00e787b3          	add	a5,a5,a4
     bc4:	00279793          	sll	a5,a5,0x2
     bc8:	fe078793          	add	a5,a5,-32
     bcc:	008787b3          	add	a5,a5,s0
     bd0:	fb87a783          	lw	a5,-72(a5)
     bd4:	0027f793          	and	a5,a5,2
     bd8:	0c078e63          	beqz	a5,cb4 <_trap_stack_size+0x2b4>
     bdc:	fde45703          	lhu	a4,-34(s0)
     be0:	00070793          	mv	a5,a4
     be4:	00479793          	sll	a5,a5,0x4
     be8:	00e787b3          	add	a5,a5,a4
     bec:	00279793          	sll	a5,a5,0x2
     bf0:	fe078793          	add	a5,a5,-32
     bf4:	008787b3          	add	a5,a5,s0
     bf8:	fd47d703          	lhu	a4,-44(a5)
     bfc:	fd841783          	lh	a5,-40(s0)
     c00:	00c00693          	li	a3,12
     c04:	00179793          	sll	a5,a5,0x1
     c08:	00f687b3          	add	a5,a3,a5
     c0c:	0007d783          	lhu	a5,0(a5)
     c10:	0af70263          	beq	a4,a5,cb4 <_trap_stack_size+0x2b4>
     c14:	fde45583          	lhu	a1,-34(s0)
     c18:	fde45703          	lhu	a4,-34(s0)
     c1c:	00070793          	mv	a5,a4
     c20:	00479793          	sll	a5,a5,0x4
     c24:	00e787b3          	add	a5,a5,a4
     c28:	00279793          	sll	a5,a5,0x2
     c2c:	fe078793          	add	a5,a5,-32
     c30:	008787b3          	add	a5,a5,s0
     c34:	fd47d783          	lhu	a5,-44(a5)
     c38:	00078613          	mv	a2,a5
     c3c:	fd841783          	lh	a5,-40(s0)
     c40:	00c00713          	li	a4,12
     c44:	00179793          	sll	a5,a5,0x1
     c48:	00f707b3          	add	a5,a4,a5
     c4c:	0007d783          	lhu	a5,0(a5)
     c50:	00078693          	mv	a3,a5
     c54:	16400513          	li	a0,356
     c58:	3d9040ef          	jal	5830 <ee_printf>
     c5c:	fde45703          	lhu	a4,-34(s0)
     c60:	00070793          	mv	a5,a4
     c64:	00479793          	sll	a5,a5,0x4
     c68:	00e787b3          	add	a5,a5,a4
     c6c:	00279793          	sll	a5,a5,0x2
     c70:	fe078793          	add	a5,a5,-32
     c74:	008787b3          	add	a5,a5,s0
     c78:	fd879783          	lh	a5,-40(a5)
     c7c:	01079793          	sll	a5,a5,0x10
     c80:	0107d793          	srl	a5,a5,0x10
     c84:	00178793          	add	a5,a5,1
     c88:	01079793          	sll	a5,a5,0x10
     c8c:	0107d793          	srl	a5,a5,0x10
     c90:	01079693          	sll	a3,a5,0x10
     c94:	4106d693          	sra	a3,a3,0x10
     c98:	00070793          	mv	a5,a4
     c9c:	00479793          	sll	a5,a5,0x4
     ca0:	00e787b3          	add	a5,a5,a4
     ca4:	00279793          	sll	a5,a5,0x2
     ca8:	fe078793          	add	a5,a5,-32
     cac:	008787b3          	add	a5,a5,s0
     cb0:	fcd79c23          	sh	a3,-40(a5)
     cb4:	fde45703          	lhu	a4,-34(s0)
     cb8:	00070793          	mv	a5,a4
     cbc:	00479793          	sll	a5,a5,0x4
     cc0:	00e787b3          	add	a5,a5,a4
     cc4:	00279793          	sll	a5,a5,0x2
     cc8:	fe078793          	add	a5,a5,-32
     ccc:	008787b3          	add	a5,a5,s0
     cd0:	fb87a783          	lw	a5,-72(a5)
     cd4:	0047f793          	and	a5,a5,4
     cd8:	0c078e63          	beqz	a5,db4 <_trap_stack_size+0x3b4>
     cdc:	fde45703          	lhu	a4,-34(s0)
     ce0:	00070793          	mv	a5,a4
     ce4:	00479793          	sll	a5,a5,0x4
     ce8:	00e787b3          	add	a5,a5,a4
     cec:	00279793          	sll	a5,a5,0x2
     cf0:	fe078793          	add	a5,a5,-32
     cf4:	008787b3          	add	a5,a5,s0
     cf8:	fd67d703          	lhu	a4,-42(a5)
     cfc:	fd841783          	lh	a5,-40(s0)
     d00:	01800693          	li	a3,24
     d04:	00179793          	sll	a5,a5,0x1
     d08:	00f687b3          	add	a5,a3,a5
     d0c:	0007d783          	lhu	a5,0(a5)
     d10:	0af70263          	beq	a4,a5,db4 <_trap_stack_size+0x3b4>
     d14:	fde45583          	lhu	a1,-34(s0)
     d18:	fde45703          	lhu	a4,-34(s0)
     d1c:	00070793          	mv	a5,a4
     d20:	00479793          	sll	a5,a5,0x4
     d24:	00e787b3          	add	a5,a5,a4
     d28:	00279793          	sll	a5,a5,0x2
     d2c:	fe078793          	add	a5,a5,-32
     d30:	008787b3          	add	a5,a5,s0
     d34:	fd67d783          	lhu	a5,-42(a5)
     d38:	00078613          	mv	a2,a5
     d3c:	fd841783          	lh	a5,-40(s0)
     d40:	01800713          	li	a4,24
     d44:	00179793          	sll	a5,a5,0x1
     d48:	00f707b3          	add	a5,a4,a5
     d4c:	0007d783          	lhu	a5,0(a5)
     d50:	00078693          	mv	a3,a5
     d54:	19800513          	li	a0,408
     d58:	2d9040ef          	jal	5830 <ee_printf>
     d5c:	fde45703          	lhu	a4,-34(s0)
     d60:	00070793          	mv	a5,a4
     d64:	00479793          	sll	a5,a5,0x4
     d68:	00e787b3          	add	a5,a5,a4
     d6c:	00279793          	sll	a5,a5,0x2
     d70:	fe078793          	add	a5,a5,-32
     d74:	008787b3          	add	a5,a5,s0
     d78:	fd879783          	lh	a5,-40(a5)
     d7c:	01079793          	sll	a5,a5,0x10
     d80:	0107d793          	srl	a5,a5,0x10
     d84:	00178793          	add	a5,a5,1
     d88:	01079793          	sll	a5,a5,0x10
     d8c:	0107d793          	srl	a5,a5,0x10
     d90:	01079693          	sll	a3,a5,0x10
     d94:	4106d693          	sra	a3,a3,0x10
     d98:	00070793          	mv	a5,a4
     d9c:	00479793          	sll	a5,a5,0x4
     da0:	00e787b3          	add	a5,a5,a4
     da4:	00279793          	sll	a5,a5,0x2
     da8:	fe078793          	add	a5,a5,-32
     dac:	008787b3          	add	a5,a5,s0
     db0:	fcd79c23          	sh	a3,-40(a5)
     db4:	fde45703          	lhu	a4,-34(s0)
     db8:	00070793          	mv	a5,a4
     dbc:	00479793          	sll	a5,a5,0x4
     dc0:	00e787b3          	add	a5,a5,a4
     dc4:	00279793          	sll	a5,a5,0x2
     dc8:	fe078793          	add	a5,a5,-32
     dcc:	008787b3          	add	a5,a5,s0
     dd0:	fd879783          	lh	a5,-40(a5)
     dd4:	01079713          	sll	a4,a5,0x10
     dd8:	01075713          	srl	a4,a4,0x10
     ddc:	fd645783          	lhu	a5,-42(s0)
     de0:	00f707b3          	add	a5,a4,a5
     de4:	01079793          	sll	a5,a5,0x10
     de8:	0107d793          	srl	a5,a5,0x10
     dec:	fcf41b23          	sh	a5,-42(s0)
     df0:	fde45783          	lhu	a5,-34(s0)
     df4:	00178793          	add	a5,a5,1
     df8:	fcf41f23          	sh	a5,-34(s0)
     dfc:	fde45703          	lhu	a4,-34(s0)
     e00:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     e04:	c8f768e3          	bltu	a4,a5,a94 <_trap_stack_size+0x94>
     e08:	115020ef          	jal	371c <check_data_types>
     e0c:	00050793          	mv	a5,a0
     e10:	00078713          	mv	a4,a5
     e14:	fd645783          	lhu	a5,-42(s0)
     e18:	00f707b3          	add	a5,a4,a5
     e1c:	01079793          	sll	a5,a5,0x10
     e20:	0107d793          	srl	a5,a5,0x10
     e24:	fcf41b23          	sh	a5,-42(s0)
     e28:	f9042783          	lw	a5,-112(s0)
     e2c:	00078593          	mv	a1,a5
     e30:	1c800513          	li	a0,456
     e34:	1fd040ef          	jal	5830 <ee_printf>
     e38:	fbc42583          	lw	a1,-68(s0)
     e3c:	1e000513          	li	a0,480
     e40:	1f1040ef          	jal	5830 <ee_printf>
     e44:	fbc42503          	lw	a0,-68(s0)
     e48:	1e5020ef          	jal	382c <time_in_secs>
     e4c:	00050713          	mv	a4,a0
     e50:	00058793          	mv	a5,a1
     e54:	00070613          	mv	a2,a4
     e58:	00078693          	mv	a3,a5
     e5c:	1f800513          	li	a0,504
     e60:	1d1040ef          	jal	5830 <ee_printf>
     e64:	fbc42503          	lw	a0,-68(s0)
     e68:	1c5020ef          	jal	382c <time_in_secs>
     e6c:	00050713          	mv	a4,a0
     e70:	00058793          	mv	a5,a1
     e74:	00000613          	li	a2,0
     e78:	00000693          	li	a3,0
     e7c:	00070513          	mv	a0,a4
     e80:	00078593          	mv	a1,a5
     e84:	345050ef          	jal	69c8 <__gedf2>
     e88:	00050793          	mv	a5,a0
     e8c:	04f05e63          	blez	a5,ee8 <_trap_stack_size+0x4e8>
     e90:	f9442703          	lw	a4,-108(s0)
     e94:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     e98:	02f707b3          	mul	a5,a4,a5
     e9c:	00078513          	mv	a0,a5
     ea0:	500060ef          	jal	73a0 <__floatunsidf>
     ea4:	00050913          	mv	s2,a0
     ea8:	00058993          	mv	s3,a1
     eac:	fbc42503          	lw	a0,-68(s0)
     eb0:	17d020ef          	jal	382c <time_in_secs>
     eb4:	00050713          	mv	a4,a0
     eb8:	00058793          	mv	a5,a1
     ebc:	00070613          	mv	a2,a4
     ec0:	00078693          	mv	a3,a5
     ec4:	00090513          	mv	a0,s2
     ec8:	00098593          	mv	a1,s3
     ecc:	2e4050ef          	jal	61b0 <__divdf3>
     ed0:	00050713          	mv	a4,a0
     ed4:	00058793          	mv	a5,a1
     ed8:	00070613          	mv	a2,a4
     edc:	00078693          	mv	a3,a5
     ee0:	21000513          	li	a0,528
     ee4:	14d040ef          	jal	5830 <ee_printf>
     ee8:	fbc42503          	lw	a0,-68(s0)
     eec:	141020ef          	jal	382c <time_in_secs>
     ef0:	00050713          	mv	a4,a0
     ef4:	00058793          	mv	a5,a1
     ef8:	48002603          	lw	a2,1152(zero) # 480 <main+0x224>
     efc:	48402683          	lw	a3,1156(zero) # 484 <main+0x228>
     f00:	00070513          	mv	a0,a4
     f04:	00078593          	mv	a1,a5
     f08:	3c1050ef          	jal	6ac8 <__ledf2>
     f0c:	00050793          	mv	a5,a0
     f10:	0207d463          	bgez	a5,f38 <_trap_stack_size+0x538>
     f14:	22800513          	li	a0,552
     f18:	119040ef          	jal	5830 <ee_printf>
     f1c:	fd641783          	lh	a5,-42(s0)
     f20:	01079793          	sll	a5,a5,0x10
     f24:	0107d793          	srl	a5,a5,0x10
     f28:	00178793          	add	a5,a5,1
     f2c:	01079793          	sll	a5,a5,0x10
     f30:	0107d793          	srl	a5,a5,0x10
     f34:	fcf41b23          	sh	a5,-42(s0)
     f38:	f9442703          	lw	a4,-108(s0)
     f3c:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     f40:	02f707b3          	mul	a5,a4,a5
     f44:	00078593          	mv	a1,a5
     f48:	26800513          	li	a0,616
     f4c:	0e5040ef          	jal	5830 <ee_printf>
     f50:	28000593          	li	a1,640
     f54:	28c00513          	li	a0,652
     f58:	0d9040ef          	jal	5830 <ee_printf>
     f5c:	2a400593          	li	a1,676
     f60:	2c400513          	li	a0,708
     f64:	0cd040ef          	jal	5830 <ee_printf>
     f68:	2dc00593          	li	a1,732
     f6c:	2e400513          	li	a0,740
     f70:	0c1040ef          	jal	5830 <ee_printf>
     f74:	fc245783          	lhu	a5,-62(s0)
     f78:	00078593          	mv	a1,a5
     f7c:	2fc00513          	li	a0,764
     f80:	0b1040ef          	jal	5830 <ee_printf>
     f84:	f9842783          	lw	a5,-104(s0)
     f88:	0017f793          	and	a5,a5,1
     f8c:	04078c63          	beqz	a5,fe4 <_trap_stack_size+0x5e4>
     f90:	fc041f23          	sh	zero,-34(s0)
     f94:	0440006f          	j	fd8 <_trap_stack_size+0x5d8>
     f98:	fde45683          	lhu	a3,-34(s0)
     f9c:	fde45703          	lhu	a4,-34(s0)
     fa0:	00070793          	mv	a5,a4
     fa4:	00479793          	sll	a5,a5,0x4
     fa8:	00e787b3          	add	a5,a5,a4
     fac:	00279793          	sll	a5,a5,0x2
     fb0:	fe078793          	add	a5,a5,-32
     fb4:	008787b3          	add	a5,a5,s0
     fb8:	fd27d783          	lhu	a5,-46(a5)
     fbc:	00078613          	mv	a2,a5
     fc0:	00068593          	mv	a1,a3
     fc4:	31800513          	li	a0,792
     fc8:	069040ef          	jal	5830 <ee_printf>
     fcc:	fde45783          	lhu	a5,-34(s0)
     fd0:	00178793          	add	a5,a5,1
     fd4:	fcf41f23          	sh	a5,-34(s0)
     fd8:	fde45703          	lhu	a4,-34(s0)
     fdc:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
     fe0:	faf76ce3          	bltu	a4,a5,f98 <_trap_stack_size+0x598>
     fe4:	f9842783          	lw	a5,-104(s0)
     fe8:	0027f793          	and	a5,a5,2
     fec:	04078c63          	beqz	a5,1044 <_trap_stack_size+0x644>
     ff0:	fc041f23          	sh	zero,-34(s0)
     ff4:	0440006f          	j	1038 <_trap_stack_size+0x638>
     ff8:	fde45683          	lhu	a3,-34(s0)
     ffc:	fde45703          	lhu	a4,-34(s0)
    1000:	00070793          	mv	a5,a4
    1004:	00479793          	sll	a5,a5,0x4
    1008:	00e787b3          	add	a5,a5,a4
    100c:	00279793          	sll	a5,a5,0x2
    1010:	fe078793          	add	a5,a5,-32
    1014:	008787b3          	add	a5,a5,s0
    1018:	fd47d783          	lhu	a5,-44(a5)
    101c:	00078613          	mv	a2,a5
    1020:	00068593          	mv	a1,a3
    1024:	33400513          	li	a0,820
    1028:	009040ef          	jal	5830 <ee_printf>
    102c:	fde45783          	lhu	a5,-34(s0)
    1030:	00178793          	add	a5,a5,1
    1034:	fcf41f23          	sh	a5,-34(s0)
    1038:	fde45703          	lhu	a4,-34(s0)
    103c:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    1040:	faf76ce3          	bltu	a4,a5,ff8 <_trap_stack_size+0x5f8>
    1044:	f9842783          	lw	a5,-104(s0)
    1048:	0047f793          	and	a5,a5,4
    104c:	04078c63          	beqz	a5,10a4 <_trap_stack_size+0x6a4>
    1050:	fc041f23          	sh	zero,-34(s0)
    1054:	0440006f          	j	1098 <_trap_stack_size+0x698>
    1058:	fde45683          	lhu	a3,-34(s0)
    105c:	fde45703          	lhu	a4,-34(s0)
    1060:	00070793          	mv	a5,a4
    1064:	00479793          	sll	a5,a5,0x4
    1068:	00e787b3          	add	a5,a5,a4
    106c:	00279793          	sll	a5,a5,0x2
    1070:	fe078793          	add	a5,a5,-32
    1074:	008787b3          	add	a5,a5,s0
    1078:	fd67d783          	lhu	a5,-42(a5)
    107c:	00078613          	mv	a2,a5
    1080:	00068593          	mv	a1,a3
    1084:	35000513          	li	a0,848
    1088:	7a8040ef          	jal	5830 <ee_printf>
    108c:	fde45783          	lhu	a5,-34(s0)
    1090:	00178793          	add	a5,a5,1
    1094:	fcf41f23          	sh	a5,-34(s0)
    1098:	fde45703          	lhu	a4,-34(s0)
    109c:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    10a0:	faf76ce3          	bltu	a4,a5,1058 <_trap_stack_size+0x658>
    10a4:	fc041f23          	sh	zero,-34(s0)
    10a8:	0440006f          	j	10ec <_trap_stack_size+0x6ec>
    10ac:	fde45683          	lhu	a3,-34(s0)
    10b0:	fde45703          	lhu	a4,-34(s0)
    10b4:	00070793          	mv	a5,a4
    10b8:	00479793          	sll	a5,a5,0x4
    10bc:	00e787b3          	add	a5,a5,a4
    10c0:	00279793          	sll	a5,a5,0x2
    10c4:	fe078793          	add	a5,a5,-32
    10c8:	008787b3          	add	a5,a5,s0
    10cc:	fd07d783          	lhu	a5,-48(a5)
    10d0:	00078613          	mv	a2,a5
    10d4:	00068593          	mv	a1,a3
    10d8:	36c00513          	li	a0,876
    10dc:	754040ef          	jal	5830 <ee_printf>
    10e0:	fde45783          	lhu	a5,-34(s0)
    10e4:	00178793          	add	a5,a5,1
    10e8:	fcf41f23          	sh	a5,-34(s0)
    10ec:	fde45703          	lhu	a4,-34(s0)
    10f0:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    10f4:	faf76ce3          	bltu	a4,a5,10ac <_trap_stack_size+0x6ac>
    10f8:	fd641783          	lh	a5,-42(s0)
    10fc:	08079663          	bnez	a5,1188 <_trap_stack_size+0x788>
    1100:	38800513          	li	a0,904
    1104:	72c040ef          	jal	5830 <ee_printf>
    1108:	fd841703          	lh	a4,-40(s0)
    110c:	00300793          	li	a5,3
    1110:	06f71c63          	bne	a4,a5,1188 <_trap_stack_size+0x788>
    1114:	f9442703          	lw	a4,-108(s0)
    1118:	5f002783          	lw	a5,1520(zero) # 5f0 <default_num_contexts>
    111c:	02f707b3          	mul	a5,a4,a5
    1120:	00078513          	mv	a0,a5
    1124:	27c060ef          	jal	73a0 <__floatunsidf>
    1128:	00050913          	mv	s2,a0
    112c:	00058993          	mv	s3,a1
    1130:	fbc42503          	lw	a0,-68(s0)
    1134:	6f8020ef          	jal	382c <time_in_secs>
    1138:	00050713          	mv	a4,a0
    113c:	00058793          	mv	a5,a1
    1140:	00070613          	mv	a2,a4
    1144:	00078693          	mv	a3,a5
    1148:	00090513          	mv	a0,s2
    114c:	00098593          	mv	a1,s3
    1150:	060050ef          	jal	61b0 <__divdf3>
    1154:	00050713          	mv	a4,a0
    1158:	00058793          	mv	a5,a1
    115c:	00070613          	mv	a2,a4
    1160:	00078693          	mv	a3,a5
    1164:	2a400793          	li	a5,676
    1168:	28000713          	li	a4,640
    116c:	3d400513          	li	a0,980
    1170:	6c0040ef          	jal	5830 <ee_printf>
    1174:	2dc00593          	li	a1,732
    1178:	3f000513          	li	a0,1008
    117c:	6b4040ef          	jal	5830 <ee_printf>
    1180:	3f800513          	li	a0,1016
    1184:	6ac040ef          	jal	5830 <ee_printf>
    1188:	fd641783          	lh	a5,-42(s0)
    118c:	00f05663          	blez	a5,1198 <_trap_stack_size+0x798>
    1190:	3fc00513          	li	a0,1020
    1194:	69c040ef          	jal	5830 <ee_printf>
    1198:	fd641783          	lh	a5,-42(s0)
    119c:	0007d663          	bgez	a5,11a8 <_trap_stack_size+0x7a8>
    11a0:	41000513          	li	a0,1040
    11a4:	68c040ef          	jal	5830 <ee_printf>
    11a8:	f7840793          	add	a5,s0,-136
    11ac:	04278793          	add	a5,a5,66
    11b0:	00078513          	mv	a0,a5
    11b4:	750020ef          	jal	3904 <portable_fini>
    11b8:	00000793          	li	a5,0
    11bc:	00078513          	mv	a0,a5
    11c0:	08010113          	add	sp,sp,128
    11c4:	7ec12083          	lw	ra,2028(sp)
    11c8:	7e812403          	lw	s0,2024(sp)
    11cc:	7e412483          	lw	s1,2020(sp)
    11d0:	7e012903          	lw	s2,2016(sp)
    11d4:	7dc12983          	lw	s3,2012(sp)
    11d8:	7f010113          	add	sp,sp,2032
    11dc:	00008067          	ret

000011e0 <calc_func>:
    11e0:	fd010113          	add	sp,sp,-48
    11e4:	02112623          	sw	ra,44(sp)
    11e8:	02812423          	sw	s0,40(sp)
    11ec:	03010413          	add	s0,sp,48
    11f0:	fca42e23          	sw	a0,-36(s0)
    11f4:	fcb42c23          	sw	a1,-40(s0)
    11f8:	fdc42783          	lw	a5,-36(s0)
    11fc:	0007d783          	lhu	a5,0(a5)
    1200:	fef41523          	sh	a5,-22(s0)
    1204:	fea41783          	lh	a5,-22(s0)
    1208:	4077d793          	sra	a5,a5,0x7
    120c:	01079793          	sll	a5,a5,0x10
    1210:	4107d793          	sra	a5,a5,0x10
    1214:	0ff7f793          	zext.b	a5,a5
    1218:	0017f793          	and	a5,a5,1
    121c:	fef404a3          	sb	a5,-23(s0)
    1220:	fe944783          	lbu	a5,-23(s0)
    1224:	00078c63          	beqz	a5,123c <calc_func+0x5c>
    1228:	fea45783          	lhu	a5,-22(s0)
    122c:	07f7f793          	and	a5,a5,127
    1230:	01079793          	sll	a5,a5,0x10
    1234:	4107d793          	sra	a5,a5,0x10
    1238:	18c0006f          	j	13c4 <calc_func+0x1e4>
    123c:	fea45783          	lhu	a5,-22(s0)
    1240:	0077f793          	and	a5,a5,7
    1244:	fef41323          	sh	a5,-26(s0)
    1248:	fea41783          	lh	a5,-22(s0)
    124c:	4037d793          	sra	a5,a5,0x3
    1250:	01079793          	sll	a5,a5,0x10
    1254:	4107d793          	sra	a5,a5,0x10
    1258:	00f7f793          	and	a5,a5,15
    125c:	fef41623          	sh	a5,-20(s0)
    1260:	fec45783          	lhu	a5,-20(s0)
    1264:	00479793          	sll	a5,a5,0x4
    1268:	01079793          	sll	a5,a5,0x10
    126c:	4107d793          	sra	a5,a5,0x10
    1270:	fec45703          	lhu	a4,-20(s0)
    1274:	00e7e7b3          	or	a5,a5,a4
    1278:	fef41623          	sh	a5,-20(s0)
    127c:	fe641783          	lh	a5,-26(s0)
    1280:	00078863          	beqz	a5,1290 <calc_func+0xb0>
    1284:	00100713          	li	a4,1
    1288:	06e78863          	beq	a5,a4,12f8 <calc_func+0x118>
    128c:	0b40006f          	j	1340 <calc_func+0x160>
    1290:	fec41703          	lh	a4,-20(s0)
    1294:	02100793          	li	a5,33
    1298:	00e7c663          	blt	a5,a4,12a4 <calc_func+0xc4>
    129c:	02200793          	li	a5,34
    12a0:	fef41623          	sh	a5,-20(s0)
    12a4:	fd842783          	lw	a5,-40(s0)
    12a8:	0187a503          	lw	a0,24(a5)
    12ac:	fd842783          	lw	a5,-40(s0)
    12b0:	0147a583          	lw	a1,20(a5)
    12b4:	fd842783          	lw	a5,-40(s0)
    12b8:	00079603          	lh	a2,0(a5)
    12bc:	fd842783          	lw	a5,-40(s0)
    12c0:	00279683          	lh	a3,2(a5)
    12c4:	fd842783          	lw	a5,-40(s0)
    12c8:	0387d783          	lhu	a5,56(a5)
    12cc:	fec41703          	lh	a4,-20(s0)
    12d0:	045010ef          	jal	2b14 <core_bench_state>
    12d4:	00050793          	mv	a5,a0
    12d8:	fef41723          	sh	a5,-18(s0)
    12dc:	fd842783          	lw	a5,-40(s0)
    12e0:	03e7d783          	lhu	a5,62(a5)
    12e4:	06079463          	bnez	a5,134c <calc_func+0x16c>
    12e8:	fee45703          	lhu	a4,-18(s0)
    12ec:	fd842783          	lw	a5,-40(s0)
    12f0:	02e79f23          	sh	a4,62(a5)
    12f4:	0580006f          	j	134c <calc_func+0x16c>
    12f8:	fd842783          	lw	a5,-40(s0)
    12fc:	02878713          	add	a4,a5,40
    1300:	fd842783          	lw	a5,-40(s0)
    1304:	0387d683          	lhu	a3,56(a5)
    1308:	fec41783          	lh	a5,-20(s0)
    130c:	00068613          	mv	a2,a3
    1310:	00078593          	mv	a1,a5
    1314:	00070513          	mv	a0,a4
    1318:	505000ef          	jal	201c <core_bench_matrix>
    131c:	00050793          	mv	a5,a0
    1320:	fef41723          	sh	a5,-18(s0)
    1324:	fd842783          	lw	a5,-40(s0)
    1328:	03c7d783          	lhu	a5,60(a5)
    132c:	02079463          	bnez	a5,1354 <calc_func+0x174>
    1330:	fee45703          	lhu	a4,-18(s0)
    1334:	fd842783          	lw	a5,-40(s0)
    1338:	02e79e23          	sh	a4,60(a5)
    133c:	0180006f          	j	1354 <calc_func+0x174>
    1340:	fea45783          	lhu	a5,-22(s0)
    1344:	fef41723          	sh	a5,-18(s0)
    1348:	0100006f          	j	1358 <calc_func+0x178>
    134c:	00000013          	nop
    1350:	0080006f          	j	1358 <calc_func+0x178>
    1354:	00000013          	nop
    1358:	fee45703          	lhu	a4,-18(s0)
    135c:	fd842783          	lw	a5,-40(s0)
    1360:	0387d783          	lhu	a5,56(a5)
    1364:	00078593          	mv	a1,a5
    1368:	00070513          	mv	a0,a4
    136c:	258020ef          	jal	35c4 <crcu16>
    1370:	00050793          	mv	a5,a0
    1374:	00078713          	mv	a4,a5
    1378:	fd842783          	lw	a5,-40(s0)
    137c:	02e79c23          	sh	a4,56(a5)
    1380:	fee45783          	lhu	a5,-18(s0)
    1384:	07f7f793          	and	a5,a5,127
    1388:	fef41723          	sh	a5,-18(s0)
    138c:	fea45783          	lhu	a5,-22(s0)
    1390:	f007f793          	and	a5,a5,-256
    1394:	01079793          	sll	a5,a5,0x10
    1398:	4107d793          	sra	a5,a5,0x10
    139c:	0807e793          	or	a5,a5,128
    13a0:	01079793          	sll	a5,a5,0x10
    13a4:	4107d793          	sra	a5,a5,0x10
    13a8:	fee45703          	lhu	a4,-18(s0)
    13ac:	00e7e7b3          	or	a5,a5,a4
    13b0:	01079713          	sll	a4,a5,0x10
    13b4:	41075713          	sra	a4,a4,0x10
    13b8:	fdc42783          	lw	a5,-36(s0)
    13bc:	00e79023          	sh	a4,0(a5)
    13c0:	fee41783          	lh	a5,-18(s0)
    13c4:	00078513          	mv	a0,a5
    13c8:	02c12083          	lw	ra,44(sp)
    13cc:	02812403          	lw	s0,40(sp)
    13d0:	03010113          	add	sp,sp,48
    13d4:	00008067          	ret

000013d8 <cmp_complex>:
    13d8:	fd010113          	add	sp,sp,-48
    13dc:	02112623          	sw	ra,44(sp)
    13e0:	02812423          	sw	s0,40(sp)
    13e4:	03010413          	add	s0,sp,48
    13e8:	fca42e23          	sw	a0,-36(s0)
    13ec:	fcb42c23          	sw	a1,-40(s0)
    13f0:	fcc42a23          	sw	a2,-44(s0)
    13f4:	fdc42783          	lw	a5,-36(s0)
    13f8:	fd442583          	lw	a1,-44(s0)
    13fc:	00078513          	mv	a0,a5
    1400:	de1ff0ef          	jal	11e0 <calc_func>
    1404:	00050793          	mv	a5,a0
    1408:	fef41723          	sh	a5,-18(s0)
    140c:	fd842783          	lw	a5,-40(s0)
    1410:	fd442583          	lw	a1,-44(s0)
    1414:	00078513          	mv	a0,a5
    1418:	dc9ff0ef          	jal	11e0 <calc_func>
    141c:	00050793          	mv	a5,a0
    1420:	fef41623          	sh	a5,-20(s0)
    1424:	fee41703          	lh	a4,-18(s0)
    1428:	fec41783          	lh	a5,-20(s0)
    142c:	40f707b3          	sub	a5,a4,a5
    1430:	00078513          	mv	a0,a5
    1434:	02c12083          	lw	ra,44(sp)
    1438:	02812403          	lw	s0,40(sp)
    143c:	03010113          	add	sp,sp,48
    1440:	00008067          	ret

00001444 <cmp_idx>:
    1444:	fe010113          	add	sp,sp,-32
    1448:	00812e23          	sw	s0,28(sp)
    144c:	02010413          	add	s0,sp,32
    1450:	fea42623          	sw	a0,-20(s0)
    1454:	feb42423          	sw	a1,-24(s0)
    1458:	fec42223          	sw	a2,-28(s0)
    145c:	fe442783          	lw	a5,-28(s0)
    1460:	08079e63          	bnez	a5,14fc <cmp_idx+0xb8>
    1464:	fec42783          	lw	a5,-20(s0)
    1468:	00079783          	lh	a5,0(a5)
    146c:	f007f793          	and	a5,a5,-256
    1470:	01079713          	sll	a4,a5,0x10
    1474:	41075713          	sra	a4,a4,0x10
    1478:	fec42783          	lw	a5,-20(s0)
    147c:	00079783          	lh	a5,0(a5)
    1480:	01079793          	sll	a5,a5,0x10
    1484:	0107d793          	srl	a5,a5,0x10
    1488:	0087d793          	srl	a5,a5,0x8
    148c:	01079793          	sll	a5,a5,0x10
    1490:	0107d793          	srl	a5,a5,0x10
    1494:	01079793          	sll	a5,a5,0x10
    1498:	4107d793          	sra	a5,a5,0x10
    149c:	00f767b3          	or	a5,a4,a5
    14a0:	01079713          	sll	a4,a5,0x10
    14a4:	41075713          	sra	a4,a4,0x10
    14a8:	fec42783          	lw	a5,-20(s0)
    14ac:	00e79023          	sh	a4,0(a5)
    14b0:	fe842783          	lw	a5,-24(s0)
    14b4:	00079783          	lh	a5,0(a5)
    14b8:	f007f793          	and	a5,a5,-256
    14bc:	01079713          	sll	a4,a5,0x10
    14c0:	41075713          	sra	a4,a4,0x10
    14c4:	fe842783          	lw	a5,-24(s0)
    14c8:	00079783          	lh	a5,0(a5)
    14cc:	01079793          	sll	a5,a5,0x10
    14d0:	0107d793          	srl	a5,a5,0x10
    14d4:	0087d793          	srl	a5,a5,0x8
    14d8:	01079793          	sll	a5,a5,0x10
    14dc:	0107d793          	srl	a5,a5,0x10
    14e0:	01079793          	sll	a5,a5,0x10
    14e4:	4107d793          	sra	a5,a5,0x10
    14e8:	00f767b3          	or	a5,a4,a5
    14ec:	01079713          	sll	a4,a5,0x10
    14f0:	41075713          	sra	a4,a4,0x10
    14f4:	fe842783          	lw	a5,-24(s0)
    14f8:	00e79023          	sh	a4,0(a5)
    14fc:	fec42783          	lw	a5,-20(s0)
    1500:	00279783          	lh	a5,2(a5)
    1504:	00078713          	mv	a4,a5
    1508:	fe842783          	lw	a5,-24(s0)
    150c:	00279783          	lh	a5,2(a5)
    1510:	40f707b3          	sub	a5,a4,a5
    1514:	00078513          	mv	a0,a5
    1518:	01c12403          	lw	s0,28(sp)
    151c:	02010113          	add	sp,sp,32
    1520:	00008067          	ret

00001524 <copy_info>:
    1524:	fe010113          	add	sp,sp,-32
    1528:	00812e23          	sw	s0,28(sp)
    152c:	02010413          	add	s0,sp,32
    1530:	fea42623          	sw	a0,-20(s0)
    1534:	feb42423          	sw	a1,-24(s0)
    1538:	fe842783          	lw	a5,-24(s0)
    153c:	00079703          	lh	a4,0(a5)
    1540:	fec42783          	lw	a5,-20(s0)
    1544:	00e79023          	sh	a4,0(a5)
    1548:	fe842783          	lw	a5,-24(s0)
    154c:	00279703          	lh	a4,2(a5)
    1550:	fec42783          	lw	a5,-20(s0)
    1554:	00e79123          	sh	a4,2(a5)
    1558:	00000013          	nop
    155c:	01c12403          	lw	s0,28(sp)
    1560:	02010113          	add	sp,sp,32
    1564:	00008067          	ret

00001568 <core_bench_list>:
    1568:	fc010113          	add	sp,sp,-64
    156c:	02112e23          	sw	ra,60(sp)
    1570:	02812c23          	sw	s0,56(sp)
    1574:	04010413          	add	s0,sp,64
    1578:	fca42623          	sw	a0,-52(s0)
    157c:	00058793          	mv	a5,a1
    1580:	fcf41523          	sh	a5,-54(s0)
    1584:	fe041723          	sh	zero,-18(s0)
    1588:	fe041623          	sh	zero,-20(s0)
    158c:	fe041523          	sh	zero,-22(s0)
    1590:	fcc42783          	lw	a5,-52(s0)
    1594:	0247a783          	lw	a5,36(a5)
    1598:	fef42223          	sw	a5,-28(s0)
    159c:	fcc42783          	lw	a5,-52(s0)
    15a0:	0047d783          	lhu	a5,4(a5)
    15a4:	fcf41e23          	sh	a5,-36(s0)
    15a8:	fc042823          	sw	zero,-48(s0)
    15ac:	fca45783          	lhu	a5,-54(s0)
    15b0:	fcf41923          	sh	a5,-46(s0)
    15b4:	fc041f23          	sh	zero,-34(s0)
    15b8:	1780006f          	j	1730 <core_bench_list+0x1c8>
    15bc:	fde45783          	lhu	a5,-34(s0)
    15c0:	0ff7f793          	zext.b	a5,a5
    15c4:	01079793          	sll	a5,a5,0x10
    15c8:	4107d793          	sra	a5,a5,0x10
    15cc:	fcf41823          	sh	a5,-48(s0)
    15d0:	fd040793          	add	a5,s0,-48
    15d4:	00078593          	mv	a1,a5
    15d8:	fe442503          	lw	a0,-28(s0)
    15dc:	738000ef          	jal	1d14 <core_list_find>
    15e0:	fca42a23          	sw	a0,-44(s0)
    15e4:	fe442503          	lw	a0,-28(s0)
    15e8:	7d0000ef          	jal	1db8 <core_list_reverse>
    15ec:	fea42223          	sw	a0,-28(s0)
    15f0:	fd442783          	lw	a5,-44(s0)
    15f4:	04079863          	bnez	a5,1644 <core_bench_list+0xdc>
    15f8:	fea45783          	lhu	a5,-22(s0)
    15fc:	00178793          	add	a5,a5,1
    1600:	fef41523          	sh	a5,-22(s0)
    1604:	fe442783          	lw	a5,-28(s0)
    1608:	0007a783          	lw	a5,0(a5)
    160c:	0047a783          	lw	a5,4(a5)
    1610:	00079783          	lh	a5,0(a5)
    1614:	4087d793          	sra	a5,a5,0x8
    1618:	01079793          	sll	a5,a5,0x10
    161c:	4107d793          	sra	a5,a5,0x10
    1620:	01079793          	sll	a5,a5,0x10
    1624:	0107d793          	srl	a5,a5,0x10
    1628:	0017f793          	and	a5,a5,1
    162c:	01079793          	sll	a5,a5,0x10
    1630:	0107d793          	srl	a5,a5,0x10
    1634:	fee45703          	lhu	a4,-18(s0)
    1638:	00e787b3          	add	a5,a5,a4
    163c:	fef41723          	sh	a5,-18(s0)
    1640:	0a80006f          	j	16e8 <core_bench_list+0x180>
    1644:	fec45783          	lhu	a5,-20(s0)
    1648:	00178793          	add	a5,a5,1
    164c:	fef41623          	sh	a5,-20(s0)
    1650:	fd442783          	lw	a5,-44(s0)
    1654:	0047a783          	lw	a5,4(a5)
    1658:	00079783          	lh	a5,0(a5)
    165c:	01079793          	sll	a5,a5,0x10
    1660:	0107d793          	srl	a5,a5,0x10
    1664:	0017f793          	and	a5,a5,1
    1668:	02078e63          	beqz	a5,16a4 <core_bench_list+0x13c>
    166c:	fd442783          	lw	a5,-44(s0)
    1670:	0047a783          	lw	a5,4(a5)
    1674:	00079783          	lh	a5,0(a5)
    1678:	4097d793          	sra	a5,a5,0x9
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
    16a4:	fd442783          	lw	a5,-44(s0)
    16a8:	0007a783          	lw	a5,0(a5)
    16ac:	02078e63          	beqz	a5,16e8 <core_bench_list+0x180>
    16b0:	fd442783          	lw	a5,-44(s0)
    16b4:	0007a783          	lw	a5,0(a5)
    16b8:	fef42023          	sw	a5,-32(s0)
    16bc:	fe042783          	lw	a5,-32(s0)
    16c0:	0007a703          	lw	a4,0(a5)
    16c4:	fd442783          	lw	a5,-44(s0)
    16c8:	00e7a023          	sw	a4,0(a5)
    16cc:	fe442783          	lw	a5,-28(s0)
    16d0:	0007a703          	lw	a4,0(a5)
    16d4:	fe042783          	lw	a5,-32(s0)
    16d8:	00e7a023          	sw	a4,0(a5)
    16dc:	fe442783          	lw	a5,-28(s0)
    16e0:	fe042703          	lw	a4,-32(s0)
    16e4:	00e7a023          	sw	a4,0(a5)
    16e8:	fd241783          	lh	a5,-46(s0)
    16ec:	0207c463          	bltz	a5,1714 <core_bench_list+0x1ac>
    16f0:	fd241783          	lh	a5,-46(s0)
    16f4:	01079793          	sll	a5,a5,0x10
    16f8:	0107d793          	srl	a5,a5,0x10
    16fc:	00178793          	add	a5,a5,1
    1700:	01079793          	sll	a5,a5,0x10
    1704:	0107d793          	srl	a5,a5,0x10
    1708:	01079793          	sll	a5,a5,0x10
    170c:	4107d793          	sra	a5,a5,0x10
    1710:	fcf41923          	sh	a5,-46(s0)
    1714:	fde41783          	lh	a5,-34(s0)
    1718:	01079793          	sll	a5,a5,0x10
    171c:	0107d793          	srl	a5,a5,0x10
    1720:	00178793          	add	a5,a5,1
    1724:	01079793          	sll	a5,a5,0x10
    1728:	0107d793          	srl	a5,a5,0x10
    172c:	fcf41f23          	sh	a5,-34(s0)
    1730:	fde41703          	lh	a4,-34(s0)
    1734:	fdc41783          	lh	a5,-36(s0)
    1738:	e8f742e3          	blt	a4,a5,15bc <core_bench_list+0x54>
    173c:	fec45783          	lhu	a5,-20(s0)
    1740:	00279793          	sll	a5,a5,0x2
    1744:	01079793          	sll	a5,a5,0x10
    1748:	0107d793          	srl	a5,a5,0x10
    174c:	fea45703          	lhu	a4,-22(s0)
    1750:	40e787b3          	sub	a5,a5,a4
    1754:	01079793          	sll	a5,a5,0x10
    1758:	0107d793          	srl	a5,a5,0x10
    175c:	fee45703          	lhu	a4,-18(s0)
    1760:	00e787b3          	add	a5,a5,a4
    1764:	fef41723          	sh	a5,-18(s0)
    1768:	fca41783          	lh	a5,-54(s0)
    176c:	00f05e63          	blez	a5,1788 <core_bench_list+0x220>
    1770:	fcc42603          	lw	a2,-52(s0)
    1774:	000017b7          	lui	a5,0x1
    1778:	3d878593          	add	a1,a5,984 # 13d8 <cmp_complex>
    177c:	fe442503          	lw	a0,-28(s0)
    1780:	694000ef          	jal	1e14 <core_list_mergesort>
    1784:	fea42223          	sw	a0,-28(s0)
    1788:	fe442783          	lw	a5,-28(s0)
    178c:	0007a783          	lw	a5,0(a5)
    1790:	00078513          	mv	a0,a5
    1794:	4a0000ef          	jal	1c34 <core_list_remove>
    1798:	fca42c23          	sw	a0,-40(s0)
    179c:	fd040793          	add	a5,s0,-48
    17a0:	00078593          	mv	a1,a5
    17a4:	fe442503          	lw	a0,-28(s0)
    17a8:	56c000ef          	jal	1d14 <core_list_find>
    17ac:	fea42023          	sw	a0,-32(s0)
    17b0:	fe042783          	lw	a5,-32(s0)
    17b4:	04079263          	bnez	a5,17f8 <core_bench_list+0x290>
    17b8:	fe442783          	lw	a5,-28(s0)
    17bc:	0007a783          	lw	a5,0(a5)
    17c0:	fef42023          	sw	a5,-32(s0)
    17c4:	0340006f          	j	17f8 <core_bench_list+0x290>
    17c8:	fe442783          	lw	a5,-28(s0)
    17cc:	0047a783          	lw	a5,4(a5)
    17d0:	00079783          	lh	a5,0(a5)
    17d4:	fee45703          	lhu	a4,-18(s0)
    17d8:	00070593          	mv	a1,a4
    17dc:	00078513          	mv	a0,a5
    17e0:	6ed010ef          	jal	36cc <crc16>
    17e4:	00050793          	mv	a5,a0
    17e8:	fef41723          	sh	a5,-18(s0)
    17ec:	fe042783          	lw	a5,-32(s0)
    17f0:	0007a783          	lw	a5,0(a5)
    17f4:	fef42023          	sw	a5,-32(s0)
    17f8:	fe042783          	lw	a5,-32(s0)
    17fc:	fc0796e3          	bnez	a5,17c8 <core_bench_list+0x260>
    1800:	fe442783          	lw	a5,-28(s0)
    1804:	0007a783          	lw	a5,0(a5)
    1808:	00078593          	mv	a1,a5
    180c:	fd842503          	lw	a0,-40(s0)
    1810:	498000ef          	jal	1ca8 <core_list_undo_remove>
    1814:	fca42c23          	sw	a0,-40(s0)
    1818:	00000613          	li	a2,0
    181c:	000017b7          	lui	a5,0x1
    1820:	44478593          	add	a1,a5,1092 # 1444 <cmp_idx>
    1824:	fe442503          	lw	a0,-28(s0)
    1828:	5ec000ef          	jal	1e14 <core_list_mergesort>
    182c:	fea42223          	sw	a0,-28(s0)
    1830:	fe442783          	lw	a5,-28(s0)
    1834:	0007a783          	lw	a5,0(a5)
    1838:	fef42023          	sw	a5,-32(s0)
    183c:	0340006f          	j	1870 <core_bench_list+0x308>
    1840:	fe442783          	lw	a5,-28(s0)
    1844:	0047a783          	lw	a5,4(a5)
    1848:	00079783          	lh	a5,0(a5)
    184c:	fee45703          	lhu	a4,-18(s0)
    1850:	00070593          	mv	a1,a4
    1854:	00078513          	mv	a0,a5
    1858:	675010ef          	jal	36cc <crc16>
    185c:	00050793          	mv	a5,a0
    1860:	fef41723          	sh	a5,-18(s0)
    1864:	fe042783          	lw	a5,-32(s0)
    1868:	0007a783          	lw	a5,0(a5)
    186c:	fef42023          	sw	a5,-32(s0)
    1870:	fe042783          	lw	a5,-32(s0)
    1874:	fc0796e3          	bnez	a5,1840 <core_bench_list+0x2d8>
    1878:	fee45783          	lhu	a5,-18(s0)
    187c:	00078513          	mv	a0,a5
    1880:	03c12083          	lw	ra,60(sp)
    1884:	03812403          	lw	s0,56(sp)
    1888:	04010113          	add	sp,sp,64
    188c:	00008067          	ret

00001890 <core_list_init>:
    1890:	fb010113          	add	sp,sp,-80
    1894:	04112623          	sw	ra,76(sp)
    1898:	04812423          	sw	s0,72(sp)
    189c:	05010413          	add	s0,sp,80
    18a0:	faa42e23          	sw	a0,-68(s0)
    18a4:	fab42c23          	sw	a1,-72(s0)
    18a8:	00060793          	mv	a5,a2
    18ac:	faf41b23          	sh	a5,-74(s0)
    18b0:	01400793          	li	a5,20
    18b4:	fef42223          	sw	a5,-28(s0)
    18b8:	fbc42703          	lw	a4,-68(s0)
    18bc:	fe442783          	lw	a5,-28(s0)
    18c0:	02f757b3          	divu	a5,a4,a5
    18c4:	ffe78793          	add	a5,a5,-2
    18c8:	fef42023          	sw	a5,-32(s0)
    18cc:	fb842703          	lw	a4,-72(s0)
    18d0:	fe042783          	lw	a5,-32(s0)
    18d4:	00379793          	sll	a5,a5,0x3
    18d8:	00f707b3          	add	a5,a4,a5
    18dc:	fcf42e23          	sw	a5,-36(s0)
    18e0:	fdc42783          	lw	a5,-36(s0)
    18e4:	fcf42423          	sw	a5,-56(s0)
    18e8:	fc842703          	lw	a4,-56(s0)
    18ec:	fe042783          	lw	a5,-32(s0)
    18f0:	00279793          	sll	a5,a5,0x2
    18f4:	00f707b3          	add	a5,a4,a5
    18f8:	fcf42c23          	sw	a5,-40(s0)
    18fc:	fb842783          	lw	a5,-72(s0)
    1900:	fcf42a23          	sw	a5,-44(s0)
    1904:	fd442783          	lw	a5,-44(s0)
    1908:	0007a023          	sw	zero,0(a5)
    190c:	fc842703          	lw	a4,-56(s0)
    1910:	fd442783          	lw	a5,-44(s0)
    1914:	00e7a223          	sw	a4,4(a5)
    1918:	fd442783          	lw	a5,-44(s0)
    191c:	0047a783          	lw	a5,4(a5)
    1920:	00079123          	sh	zero,2(a5)
    1924:	fd442783          	lw	a5,-44(s0)
    1928:	0047a783          	lw	a5,4(a5)
    192c:	ffff8737          	lui	a4,0xffff8
    1930:	08070713          	add	a4,a4,128 # ffff8080 <__subdf3+0xffff09a8>
    1934:	00e79023          	sh	a4,0(a5)
    1938:	fb842783          	lw	a5,-72(s0)
    193c:	00878793          	add	a5,a5,8
    1940:	faf42c23          	sw	a5,-72(s0)
    1944:	fc842783          	lw	a5,-56(s0)
    1948:	00478793          	add	a5,a5,4
    194c:	fcf42423          	sw	a5,-56(s0)
    1950:	ffff87b7          	lui	a5,0xffff8
    1954:	fff7c793          	not	a5,a5
    1958:	fcf41323          	sh	a5,-58(s0)
    195c:	fff00793          	li	a5,-1
    1960:	fcf41223          	sh	a5,-60(s0)
    1964:	fc840693          	add	a3,s0,-56
    1968:	fb840613          	add	a2,s0,-72
    196c:	fc440593          	add	a1,s0,-60
    1970:	fd842783          	lw	a5,-40(s0)
    1974:	fdc42703          	lw	a4,-36(s0)
    1978:	fd442503          	lw	a0,-44(s0)
    197c:	1cc000ef          	jal	1b48 <core_list_insert_new>
    1980:	fe042623          	sw	zero,-20(s0)
    1984:	0a40006f          	j	1a28 <core_list_init+0x198>
    1988:	fec42783          	lw	a5,-20(s0)
    198c:	01079713          	sll	a4,a5,0x10
    1990:	01075713          	srl	a4,a4,0x10
    1994:	fb645783          	lhu	a5,-74(s0)
    1998:	00f747b3          	xor	a5,a4,a5
    199c:	01079793          	sll	a5,a5,0x10
    19a0:	0107d793          	srl	a5,a5,0x10
    19a4:	00f7f793          	and	a5,a5,15
    19a8:	fcf41823          	sh	a5,-48(s0)
    19ac:	fd045783          	lhu	a5,-48(s0)
    19b0:	00379793          	sll	a5,a5,0x3
    19b4:	01079713          	sll	a4,a5,0x10
    19b8:	01075713          	srl	a4,a4,0x10
    19bc:	fec42783          	lw	a5,-20(s0)
    19c0:	01079793          	sll	a5,a5,0x10
    19c4:	0107d793          	srl	a5,a5,0x10
    19c8:	0077f793          	and	a5,a5,7
    19cc:	01079793          	sll	a5,a5,0x10
    19d0:	0107d793          	srl	a5,a5,0x10
    19d4:	00f767b3          	or	a5,a4,a5
    19d8:	fcf41723          	sh	a5,-50(s0)
    19dc:	fce41783          	lh	a5,-50(s0)
    19e0:	00879793          	sll	a5,a5,0x8
    19e4:	01079713          	sll	a4,a5,0x10
    19e8:	41075713          	sra	a4,a4,0x10
    19ec:	fce41783          	lh	a5,-50(s0)
    19f0:	00f767b3          	or	a5,a4,a5
    19f4:	01079793          	sll	a5,a5,0x10
    19f8:	4107d793          	sra	a5,a5,0x10
    19fc:	fcf41223          	sh	a5,-60(s0)
    1a00:	fc840693          	add	a3,s0,-56
    1a04:	fb840613          	add	a2,s0,-72
    1a08:	fc440593          	add	a1,s0,-60
    1a0c:	fd842783          	lw	a5,-40(s0)
    1a10:	fdc42703          	lw	a4,-36(s0)
    1a14:	fd442503          	lw	a0,-44(s0)
    1a18:	130000ef          	jal	1b48 <core_list_insert_new>
    1a1c:	fec42783          	lw	a5,-20(s0)
    1a20:	00178793          	add	a5,a5,1 # ffff8001 <__subdf3+0xffff0929>
    1a24:	fef42623          	sw	a5,-20(s0)
    1a28:	fec42703          	lw	a4,-20(s0)
    1a2c:	fe042783          	lw	a5,-32(s0)
    1a30:	f4f76ce3          	bltu	a4,a5,1988 <core_list_init+0xf8>
    1a34:	fd442783          	lw	a5,-44(s0)
    1a38:	0007a783          	lw	a5,0(a5)
    1a3c:	fef42423          	sw	a5,-24(s0)
    1a40:	00100793          	li	a5,1
    1a44:	fef42623          	sw	a5,-20(s0)
    1a48:	0c40006f          	j	1b0c <core_list_init+0x27c>
    1a4c:	fe042703          	lw	a4,-32(s0)
    1a50:	00500793          	li	a5,5
    1a54:	02f757b3          	divu	a5,a4,a5
    1a58:	fec42703          	lw	a4,-20(s0)
    1a5c:	02f77463          	bgeu	a4,a5,1a84 <core_list_init+0x1f4>
    1a60:	fec42783          	lw	a5,-20(s0)
    1a64:	00178713          	add	a4,a5,1
    1a68:	fee42623          	sw	a4,-20(s0)
    1a6c:	fe842703          	lw	a4,-24(s0)
    1a70:	00472703          	lw	a4,4(a4)
    1a74:	01079793          	sll	a5,a5,0x10
    1a78:	4107d793          	sra	a5,a5,0x10
    1a7c:	00f71123          	sh	a5,2(a4)
    1a80:	0800006f          	j	1b00 <core_list_init+0x270>
    1a84:	fec42783          	lw	a5,-20(s0)
    1a88:	00178713          	add	a4,a5,1
    1a8c:	fee42623          	sw	a4,-20(s0)
    1a90:	01079713          	sll	a4,a5,0x10
    1a94:	01075713          	srl	a4,a4,0x10
    1a98:	fb645783          	lhu	a5,-74(s0)
    1a9c:	00f747b3          	xor	a5,a4,a5
    1aa0:	fcf41923          	sh	a5,-46(s0)
    1aa4:	fec42783          	lw	a5,-20(s0)
    1aa8:	01079793          	sll	a5,a5,0x10
    1aac:	0107d793          	srl	a5,a5,0x10
    1ab0:	00879793          	sll	a5,a5,0x8
    1ab4:	01079793          	sll	a5,a5,0x10
    1ab8:	0107d793          	srl	a5,a5,0x10
    1abc:	7007f793          	and	a5,a5,1792
    1ac0:	01079793          	sll	a5,a5,0x10
    1ac4:	0107d793          	srl	a5,a5,0x10
    1ac8:	fd245703          	lhu	a4,-46(s0)
    1acc:	00e7e7b3          	or	a5,a5,a4
    1ad0:	01079793          	sll	a5,a5,0x10
    1ad4:	0107d793          	srl	a5,a5,0x10
    1ad8:	01079693          	sll	a3,a5,0x10
    1adc:	4106d693          	sra	a3,a3,0x10
    1ae0:	fe842783          	lw	a5,-24(s0)
    1ae4:	0047a783          	lw	a5,4(a5)
    1ae8:	00004737          	lui	a4,0x4
    1aec:	fff70713          	add	a4,a4,-1 # 3fff <skip_atoi+0x5b>
    1af0:	00e6f733          	and	a4,a3,a4
    1af4:	01071713          	sll	a4,a4,0x10
    1af8:	41075713          	sra	a4,a4,0x10
    1afc:	00e79123          	sh	a4,2(a5)
    1b00:	fe842783          	lw	a5,-24(s0)
    1b04:	0007a783          	lw	a5,0(a5)
    1b08:	fef42423          	sw	a5,-24(s0)
    1b0c:	fe842783          	lw	a5,-24(s0)
    1b10:	0007a783          	lw	a5,0(a5)
    1b14:	f2079ce3          	bnez	a5,1a4c <core_list_init+0x1bc>
    1b18:	00000613          	li	a2,0
    1b1c:	000017b7          	lui	a5,0x1
    1b20:	44478593          	add	a1,a5,1092 # 1444 <cmp_idx>
    1b24:	fd442503          	lw	a0,-44(s0)
    1b28:	2ec000ef          	jal	1e14 <core_list_mergesort>
    1b2c:	fca42a23          	sw	a0,-44(s0)
    1b30:	fd442783          	lw	a5,-44(s0)
    1b34:	00078513          	mv	a0,a5
    1b38:	04c12083          	lw	ra,76(sp)
    1b3c:	04812403          	lw	s0,72(sp)
    1b40:	05010113          	add	sp,sp,80
    1b44:	00008067          	ret

00001b48 <core_list_insert_new>:
    1b48:	fc010113          	add	sp,sp,-64
    1b4c:	02112e23          	sw	ra,60(sp)
    1b50:	02812c23          	sw	s0,56(sp)
    1b54:	04010413          	add	s0,sp,64
    1b58:	fca42e23          	sw	a0,-36(s0)
    1b5c:	fcb42c23          	sw	a1,-40(s0)
    1b60:	fcc42a23          	sw	a2,-44(s0)
    1b64:	fcd42823          	sw	a3,-48(s0)
    1b68:	fce42623          	sw	a4,-52(s0)
    1b6c:	fcf42423          	sw	a5,-56(s0)
    1b70:	fd442783          	lw	a5,-44(s0)
    1b74:	0007a783          	lw	a5,0(a5)
    1b78:	00878793          	add	a5,a5,8
    1b7c:	fcc42703          	lw	a4,-52(s0)
    1b80:	00e7e663          	bltu	a5,a4,1b8c <core_list_insert_new+0x44>
    1b84:	00000793          	li	a5,0
    1b88:	0980006f          	j	1c20 <core_list_insert_new+0xd8>
    1b8c:	fd042783          	lw	a5,-48(s0)
    1b90:	0007a783          	lw	a5,0(a5)
    1b94:	00478793          	add	a5,a5,4
    1b98:	fc842703          	lw	a4,-56(s0)
    1b9c:	00e7e663          	bltu	a5,a4,1ba8 <core_list_insert_new+0x60>
    1ba0:	00000793          	li	a5,0
    1ba4:	07c0006f          	j	1c20 <core_list_insert_new+0xd8>
    1ba8:	fd442783          	lw	a5,-44(s0)
    1bac:	0007a783          	lw	a5,0(a5)
    1bb0:	fef42623          	sw	a5,-20(s0)
    1bb4:	fd442783          	lw	a5,-44(s0)
    1bb8:	0007a783          	lw	a5,0(a5)
    1bbc:	00878713          	add	a4,a5,8
    1bc0:	fd442783          	lw	a5,-44(s0)
    1bc4:	00e7a023          	sw	a4,0(a5)
    1bc8:	fdc42783          	lw	a5,-36(s0)
    1bcc:	0007a703          	lw	a4,0(a5)
    1bd0:	fec42783          	lw	a5,-20(s0)
    1bd4:	00e7a023          	sw	a4,0(a5)
    1bd8:	fdc42783          	lw	a5,-36(s0)
    1bdc:	fec42703          	lw	a4,-20(s0)
    1be0:	00e7a023          	sw	a4,0(a5)
    1be4:	fd042783          	lw	a5,-48(s0)
    1be8:	0007a703          	lw	a4,0(a5)
    1bec:	fec42783          	lw	a5,-20(s0)
    1bf0:	00e7a223          	sw	a4,4(a5)
    1bf4:	fd042783          	lw	a5,-48(s0)
    1bf8:	0007a783          	lw	a5,0(a5)
    1bfc:	00478713          	add	a4,a5,4
    1c00:	fd042783          	lw	a5,-48(s0)
    1c04:	00e7a023          	sw	a4,0(a5)
    1c08:	fec42783          	lw	a5,-20(s0)
    1c0c:	0047a783          	lw	a5,4(a5)
    1c10:	fd842583          	lw	a1,-40(s0)
    1c14:	00078513          	mv	a0,a5
    1c18:	90dff0ef          	jal	1524 <copy_info>
    1c1c:	fec42783          	lw	a5,-20(s0)
    1c20:	00078513          	mv	a0,a5
    1c24:	03c12083          	lw	ra,60(sp)
    1c28:	03812403          	lw	s0,56(sp)
    1c2c:	04010113          	add	sp,sp,64
    1c30:	00008067          	ret

00001c34 <core_list_remove>:
    1c34:	fd010113          	add	sp,sp,-48
    1c38:	02812623          	sw	s0,44(sp)
    1c3c:	03010413          	add	s0,sp,48
    1c40:	fca42e23          	sw	a0,-36(s0)
    1c44:	fdc42783          	lw	a5,-36(s0)
    1c48:	0007a783          	lw	a5,0(a5)
    1c4c:	fef42623          	sw	a5,-20(s0)
    1c50:	fdc42783          	lw	a5,-36(s0)
    1c54:	0047a783          	lw	a5,4(a5)
    1c58:	fef42423          	sw	a5,-24(s0)
    1c5c:	fec42783          	lw	a5,-20(s0)
    1c60:	0047a703          	lw	a4,4(a5)
    1c64:	fdc42783          	lw	a5,-36(s0)
    1c68:	00e7a223          	sw	a4,4(a5)
    1c6c:	fec42783          	lw	a5,-20(s0)
    1c70:	fe842703          	lw	a4,-24(s0)
    1c74:	00e7a223          	sw	a4,4(a5)
    1c78:	fdc42783          	lw	a5,-36(s0)
    1c7c:	0007a783          	lw	a5,0(a5)
    1c80:	0007a703          	lw	a4,0(a5)
    1c84:	fdc42783          	lw	a5,-36(s0)
    1c88:	00e7a023          	sw	a4,0(a5)
    1c8c:	fec42783          	lw	a5,-20(s0)
    1c90:	0007a023          	sw	zero,0(a5)
    1c94:	fec42783          	lw	a5,-20(s0)
    1c98:	00078513          	mv	a0,a5
    1c9c:	02c12403          	lw	s0,44(sp)
    1ca0:	03010113          	add	sp,sp,48
    1ca4:	00008067          	ret

00001ca8 <core_list_undo_remove>:
    1ca8:	fd010113          	add	sp,sp,-48
    1cac:	02812623          	sw	s0,44(sp)
    1cb0:	03010413          	add	s0,sp,48
    1cb4:	fca42e23          	sw	a0,-36(s0)
    1cb8:	fcb42c23          	sw	a1,-40(s0)
    1cbc:	fdc42783          	lw	a5,-36(s0)
    1cc0:	0047a783          	lw	a5,4(a5)
    1cc4:	fef42623          	sw	a5,-20(s0)
    1cc8:	fd842783          	lw	a5,-40(s0)
    1ccc:	0047a703          	lw	a4,4(a5)
    1cd0:	fdc42783          	lw	a5,-36(s0)
    1cd4:	00e7a223          	sw	a4,4(a5)
    1cd8:	fd842783          	lw	a5,-40(s0)
    1cdc:	fec42703          	lw	a4,-20(s0)
    1ce0:	00e7a223          	sw	a4,4(a5)
    1ce4:	fd842783          	lw	a5,-40(s0)
    1ce8:	0007a703          	lw	a4,0(a5)
    1cec:	fdc42783          	lw	a5,-36(s0)
    1cf0:	00e7a023          	sw	a4,0(a5)
    1cf4:	fd842783          	lw	a5,-40(s0)
    1cf8:	fdc42703          	lw	a4,-36(s0)
    1cfc:	00e7a023          	sw	a4,0(a5)
    1d00:	fdc42783          	lw	a5,-36(s0)
    1d04:	00078513          	mv	a0,a5
    1d08:	02c12403          	lw	s0,44(sp)
    1d0c:	03010113          	add	sp,sp,48
    1d10:	00008067          	ret

00001d14 <core_list_find>:
    1d14:	fe010113          	add	sp,sp,-32
    1d18:	00812e23          	sw	s0,28(sp)
    1d1c:	02010413          	add	s0,sp,32
    1d20:	fea42623          	sw	a0,-20(s0)
    1d24:	feb42423          	sw	a1,-24(s0)
    1d28:	fe842783          	lw	a5,-24(s0)
    1d2c:	00279783          	lh	a5,2(a5)
    1d30:	0407c463          	bltz	a5,1d78 <core_list_find+0x64>
    1d34:	0100006f          	j	1d44 <core_list_find+0x30>
    1d38:	fec42783          	lw	a5,-20(s0)
    1d3c:	0007a783          	lw	a5,0(a5)
    1d40:	fef42623          	sw	a5,-20(s0)
    1d44:	fec42783          	lw	a5,-20(s0)
    1d48:	00078e63          	beqz	a5,1d64 <core_list_find+0x50>
    1d4c:	fec42783          	lw	a5,-20(s0)
    1d50:	0047a783          	lw	a5,4(a5)
    1d54:	00279703          	lh	a4,2(a5)
    1d58:	fe842783          	lw	a5,-24(s0)
    1d5c:	00279783          	lh	a5,2(a5)
    1d60:	fcf71ce3          	bne	a4,a5,1d38 <core_list_find+0x24>
    1d64:	fec42783          	lw	a5,-20(s0)
    1d68:	0400006f          	j	1da8 <core_list_find+0x94>
    1d6c:	fec42783          	lw	a5,-20(s0)
    1d70:	0007a783          	lw	a5,0(a5)
    1d74:	fef42623          	sw	a5,-20(s0)
    1d78:	fec42783          	lw	a5,-20(s0)
    1d7c:	02078463          	beqz	a5,1da4 <core_list_find+0x90>
    1d80:	fec42783          	lw	a5,-20(s0)
    1d84:	0047a783          	lw	a5,4(a5)
    1d88:	00079783          	lh	a5,0(a5)
    1d8c:	01079793          	sll	a5,a5,0x10
    1d90:	0107d793          	srl	a5,a5,0x10
    1d94:	0ff7f793          	zext.b	a5,a5
    1d98:	fe842703          	lw	a4,-24(s0)
    1d9c:	00071703          	lh	a4,0(a4)
    1da0:	fce796e3          	bne	a5,a4,1d6c <core_list_find+0x58>
    1da4:	fec42783          	lw	a5,-20(s0)
    1da8:	00078513          	mv	a0,a5
    1dac:	01c12403          	lw	s0,28(sp)
    1db0:	02010113          	add	sp,sp,32
    1db4:	00008067          	ret

00001db8 <core_list_reverse>:
    1db8:	fd010113          	add	sp,sp,-48
    1dbc:	02812623          	sw	s0,44(sp)
    1dc0:	03010413          	add	s0,sp,48
    1dc4:	fca42e23          	sw	a0,-36(s0)
    1dc8:	fe042623          	sw	zero,-20(s0)
    1dcc:	02c0006f          	j	1df8 <core_list_reverse+0x40>
    1dd0:	fdc42783          	lw	a5,-36(s0)
    1dd4:	0007a783          	lw	a5,0(a5)
    1dd8:	fef42423          	sw	a5,-24(s0)
    1ddc:	fdc42783          	lw	a5,-36(s0)
    1de0:	fec42703          	lw	a4,-20(s0)
    1de4:	00e7a023          	sw	a4,0(a5)
    1de8:	fdc42783          	lw	a5,-36(s0)
    1dec:	fef42623          	sw	a5,-20(s0)
    1df0:	fe842783          	lw	a5,-24(s0)
    1df4:	fcf42e23          	sw	a5,-36(s0)
    1df8:	fdc42783          	lw	a5,-36(s0)
    1dfc:	fc079ae3          	bnez	a5,1dd0 <core_list_reverse+0x18>
    1e00:	fec42783          	lw	a5,-20(s0)
    1e04:	00078513          	mv	a0,a5
    1e08:	02c12403          	lw	s0,44(sp)
    1e0c:	03010113          	add	sp,sp,48
    1e10:	00008067          	ret

00001e14 <core_list_mergesort>:
    1e14:	fb010113          	add	sp,sp,-80
    1e18:	04112623          	sw	ra,76(sp)
    1e1c:	04812423          	sw	s0,72(sp)
    1e20:	05010413          	add	s0,sp,80
    1e24:	faa42e23          	sw	a0,-68(s0)
    1e28:	fab42c23          	sw	a1,-72(s0)
    1e2c:	fac42a23          	sw	a2,-76(s0)
    1e30:	00100793          	li	a5,1
    1e34:	fcf42e23          	sw	a5,-36(s0)
    1e38:	fbc42783          	lw	a5,-68(s0)
    1e3c:	fef42623          	sw	a5,-20(s0)
    1e40:	fa042e23          	sw	zero,-68(s0)
    1e44:	fe042023          	sw	zero,-32(s0)
    1e48:	fc042c23          	sw	zero,-40(s0)
    1e4c:	1880006f          	j	1fd4 <core_list_mergesort+0x1c0>
    1e50:	fd842783          	lw	a5,-40(s0)
    1e54:	00178793          	add	a5,a5,1
    1e58:	fcf42c23          	sw	a5,-40(s0)
    1e5c:	fec42783          	lw	a5,-20(s0)
    1e60:	fef42423          	sw	a5,-24(s0)
    1e64:	fc042a23          	sw	zero,-44(s0)
    1e68:	fc042623          	sw	zero,-52(s0)
    1e6c:	0300006f          	j	1e9c <core_list_mergesort+0x88>
    1e70:	fd442783          	lw	a5,-44(s0)
    1e74:	00178793          	add	a5,a5,1
    1e78:	fcf42a23          	sw	a5,-44(s0)
    1e7c:	fe842783          	lw	a5,-24(s0)
    1e80:	0007a783          	lw	a5,0(a5)
    1e84:	fef42423          	sw	a5,-24(s0)
    1e88:	fe842783          	lw	a5,-24(s0)
    1e8c:	02078063          	beqz	a5,1eac <core_list_mergesort+0x98>
    1e90:	fcc42783          	lw	a5,-52(s0)
    1e94:	00178793          	add	a5,a5,1
    1e98:	fcf42623          	sw	a5,-52(s0)
    1e9c:	fcc42703          	lw	a4,-52(s0)
    1ea0:	fdc42783          	lw	a5,-36(s0)
    1ea4:	fcf746e3          	blt	a4,a5,1e70 <core_list_mergesort+0x5c>
    1ea8:	0080006f          	j	1eb0 <core_list_mergesort+0x9c>
    1eac:	00000013          	nop
    1eb0:	fdc42783          	lw	a5,-36(s0)
    1eb4:	fcf42823          	sw	a5,-48(s0)
    1eb8:	0fc0006f          	j	1fb4 <core_list_mergesort+0x1a0>
    1ebc:	fd442783          	lw	a5,-44(s0)
    1ec0:	02079463          	bnez	a5,1ee8 <core_list_mergesort+0xd4>
    1ec4:	fe842783          	lw	a5,-24(s0)
    1ec8:	fef42223          	sw	a5,-28(s0)
    1ecc:	fe842783          	lw	a5,-24(s0)
    1ed0:	0007a783          	lw	a5,0(a5)
    1ed4:	fef42423          	sw	a5,-24(s0)
    1ed8:	fd042783          	lw	a5,-48(s0)
    1edc:	fff78793          	add	a5,a5,-1
    1ee0:	fcf42823          	sw	a5,-48(s0)
    1ee4:	0a80006f          	j	1f8c <core_list_mergesort+0x178>
    1ee8:	fd042783          	lw	a5,-48(s0)
    1eec:	00078663          	beqz	a5,1ef8 <core_list_mergesort+0xe4>
    1ef0:	fe842783          	lw	a5,-24(s0)
    1ef4:	02079463          	bnez	a5,1f1c <core_list_mergesort+0x108>
    1ef8:	fec42783          	lw	a5,-20(s0)
    1efc:	fef42223          	sw	a5,-28(s0)
    1f00:	fec42783          	lw	a5,-20(s0)
    1f04:	0007a783          	lw	a5,0(a5)
    1f08:	fef42623          	sw	a5,-20(s0)
    1f0c:	fd442783          	lw	a5,-44(s0)
    1f10:	fff78793          	add	a5,a5,-1
    1f14:	fcf42a23          	sw	a5,-44(s0)
    1f18:	0740006f          	j	1f8c <core_list_mergesort+0x178>
    1f1c:	fec42783          	lw	a5,-20(s0)
    1f20:	0047a703          	lw	a4,4(a5)
    1f24:	fe842783          	lw	a5,-24(s0)
    1f28:	0047a683          	lw	a3,4(a5)
    1f2c:	fb842783          	lw	a5,-72(s0)
    1f30:	fb442603          	lw	a2,-76(s0)
    1f34:	00068593          	mv	a1,a3
    1f38:	00070513          	mv	a0,a4
    1f3c:	000780e7          	jalr	a5
    1f40:	00050793          	mv	a5,a0
    1f44:	02f04463          	bgtz	a5,1f6c <core_list_mergesort+0x158>
    1f48:	fec42783          	lw	a5,-20(s0)
    1f4c:	fef42223          	sw	a5,-28(s0)
    1f50:	fec42783          	lw	a5,-20(s0)
    1f54:	0007a783          	lw	a5,0(a5)
    1f58:	fef42623          	sw	a5,-20(s0)
    1f5c:	fd442783          	lw	a5,-44(s0)
    1f60:	fff78793          	add	a5,a5,-1
    1f64:	fcf42a23          	sw	a5,-44(s0)
    1f68:	0240006f          	j	1f8c <core_list_mergesort+0x178>
    1f6c:	fe842783          	lw	a5,-24(s0)
    1f70:	fef42223          	sw	a5,-28(s0)
    1f74:	fe842783          	lw	a5,-24(s0)
    1f78:	0007a783          	lw	a5,0(a5)
    1f7c:	fef42423          	sw	a5,-24(s0)
    1f80:	fd042783          	lw	a5,-48(s0)
    1f84:	fff78793          	add	a5,a5,-1
    1f88:	fcf42823          	sw	a5,-48(s0)
    1f8c:	fe042783          	lw	a5,-32(s0)
    1f90:	00078a63          	beqz	a5,1fa4 <core_list_mergesort+0x190>
    1f94:	fe042783          	lw	a5,-32(s0)
    1f98:	fe442703          	lw	a4,-28(s0)
    1f9c:	00e7a023          	sw	a4,0(a5)
    1fa0:	00c0006f          	j	1fac <core_list_mergesort+0x198>
    1fa4:	fe442783          	lw	a5,-28(s0)
    1fa8:	faf42e23          	sw	a5,-68(s0)
    1fac:	fe442783          	lw	a5,-28(s0)
    1fb0:	fef42023          	sw	a5,-32(s0)
    1fb4:	fd442783          	lw	a5,-44(s0)
    1fb8:	f0f042e3          	bgtz	a5,1ebc <core_list_mergesort+0xa8>
    1fbc:	fd042783          	lw	a5,-48(s0)
    1fc0:	00f05663          	blez	a5,1fcc <core_list_mergesort+0x1b8>
    1fc4:	fe842783          	lw	a5,-24(s0)
    1fc8:	ee079ae3          	bnez	a5,1ebc <core_list_mergesort+0xa8>
    1fcc:	fe842783          	lw	a5,-24(s0)
    1fd0:	fef42623          	sw	a5,-20(s0)
    1fd4:	fec42783          	lw	a5,-20(s0)
    1fd8:	e6079ce3          	bnez	a5,1e50 <core_list_mergesort+0x3c>
    1fdc:	fe042783          	lw	a5,-32(s0)
    1fe0:	0007a023          	sw	zero,0(a5)
    1fe4:	fd842703          	lw	a4,-40(s0)
    1fe8:	00100793          	li	a5,1
    1fec:	00e7c663          	blt	a5,a4,1ff8 <core_list_mergesort+0x1e4>
    1ff0:	fbc42783          	lw	a5,-68(s0)
    1ff4:	0140006f          	j	2008 <core_list_mergesort+0x1f4>
    1ff8:	fdc42783          	lw	a5,-36(s0)
    1ffc:	00179793          	sll	a5,a5,0x1
    2000:	fcf42e23          	sw	a5,-36(s0)
    2004:	e35ff06f          	j	1e38 <core_list_mergesort+0x24>
    2008:	00078513          	mv	a0,a5
    200c:	04c12083          	lw	ra,76(sp)
    2010:	04812403          	lw	s0,72(sp)
    2014:	05010113          	add	sp,sp,80
    2018:	00008067          	ret

0000201c <core_bench_matrix>:
    201c:	fc010113          	add	sp,sp,-64
    2020:	02112e23          	sw	ra,60(sp)
    2024:	02812c23          	sw	s0,56(sp)
    2028:	04010413          	add	s0,sp,64
    202c:	fca42623          	sw	a0,-52(s0)
    2030:	00058793          	mv	a5,a1
    2034:	00060713          	mv	a4,a2
    2038:	fcf41523          	sh	a5,-54(s0)
    203c:	00070793          	mv	a5,a4
    2040:	fcf41423          	sh	a5,-56(s0)
    2044:	fcc42783          	lw	a5,-52(s0)
    2048:	0007a783          	lw	a5,0(a5)
    204c:	fef42623          	sw	a5,-20(s0)
    2050:	fcc42783          	lw	a5,-52(s0)
    2054:	00c7a783          	lw	a5,12(a5)
    2058:	fef42423          	sw	a5,-24(s0)
    205c:	fcc42783          	lw	a5,-52(s0)
    2060:	0047a783          	lw	a5,4(a5)
    2064:	fef42223          	sw	a5,-28(s0)
    2068:	fcc42783          	lw	a5,-52(s0)
    206c:	0087a783          	lw	a5,8(a5)
    2070:	fef42023          	sw	a5,-32(s0)
    2074:	fca45783          	lhu	a5,-54(s0)
    2078:	fcf41f23          	sh	a5,-34(s0)
    207c:	fde41783          	lh	a5,-34(s0)
    2080:	00078713          	mv	a4,a5
    2084:	fe042683          	lw	a3,-32(s0)
    2088:	fe442603          	lw	a2,-28(s0)
    208c:	fe842583          	lw	a1,-24(s0)
    2090:	fec42503          	lw	a0,-20(s0)
    2094:	03c000ef          	jal	20d0 <matrix_test>
    2098:	00050793          	mv	a5,a0
    209c:	00078713          	mv	a4,a5
    20a0:	fc845783          	lhu	a5,-56(s0)
    20a4:	00078593          	mv	a1,a5
    20a8:	00070513          	mv	a0,a4
    20ac:	620010ef          	jal	36cc <crc16>
    20b0:	00050793          	mv	a5,a0
    20b4:	fcf41423          	sh	a5,-56(s0)
    20b8:	fc845783          	lhu	a5,-56(s0)
    20bc:	00078513          	mv	a0,a5
    20c0:	03c12083          	lw	ra,60(sp)
    20c4:	03812403          	lw	s0,56(sp)
    20c8:	04010113          	add	sp,sp,64
    20cc:	00008067          	ret

000020d0 <matrix_test>:
    20d0:	fc010113          	add	sp,sp,-64
    20d4:	02112e23          	sw	ra,60(sp)
    20d8:	02812c23          	sw	s0,56(sp)
    20dc:	04010413          	add	s0,sp,64
    20e0:	fca42e23          	sw	a0,-36(s0)
    20e4:	fcb42c23          	sw	a1,-40(s0)
    20e8:	fcc42a23          	sw	a2,-44(s0)
    20ec:	fcd42823          	sw	a3,-48(s0)
    20f0:	00070793          	mv	a5,a4
    20f4:	fcf41723          	sh	a5,-50(s0)
    20f8:	fe041723          	sh	zero,-18(s0)
    20fc:	fce45783          	lhu	a5,-50(s0)
    2100:	00078713          	mv	a4,a5
    2104:	fffff7b7          	lui	a5,0xfffff
    2108:	00f767b3          	or	a5,a4,a5
    210c:	fef41623          	sh	a5,-20(s0)
    2110:	fce41783          	lh	a5,-50(s0)
    2114:	00078613          	mv	a2,a5
    2118:	fd442583          	lw	a1,-44(s0)
    211c:	fdc42503          	lw	a0,-36(s0)
    2120:	564000ef          	jal	2684 <matrix_add_const>
    2124:	fce41783          	lh	a5,-50(s0)
    2128:	00078693          	mv	a3,a5
    212c:	fd442603          	lw	a2,-44(s0)
    2130:	fd842583          	lw	a1,-40(s0)
    2134:	fdc42503          	lw	a0,-36(s0)
    2138:	484000ef          	jal	25bc <matrix_mul_const>
    213c:	fec41783          	lh	a5,-20(s0)
    2140:	00078613          	mv	a2,a5
    2144:	fd842583          	lw	a1,-40(s0)
    2148:	fdc42503          	lw	a0,-36(s0)
    214c:	360000ef          	jal	24ac <matrix_sum>
    2150:	00050793          	mv	a5,a0
    2154:	00078713          	mv	a4,a5
    2158:	fee45783          	lhu	a5,-18(s0)
    215c:	00078593          	mv	a1,a5
    2160:	00070513          	mv	a0,a4
    2164:	568010ef          	jal	36cc <crc16>
    2168:	00050793          	mv	a5,a0
    216c:	fef41723          	sh	a5,-18(s0)
    2170:	fd042683          	lw	a3,-48(s0)
    2174:	fd442603          	lw	a2,-44(s0)
    2178:	fd842583          	lw	a1,-40(s0)
    217c:	fdc42503          	lw	a0,-36(s0)
    2180:	5dc000ef          	jal	275c <matrix_mul_vect>
    2184:	fec41783          	lh	a5,-20(s0)
    2188:	00078613          	mv	a2,a5
    218c:	fd842583          	lw	a1,-40(s0)
    2190:	fdc42503          	lw	a0,-36(s0)
    2194:	318000ef          	jal	24ac <matrix_sum>
    2198:	00050793          	mv	a5,a0
    219c:	00078713          	mv	a4,a5
    21a0:	fee45783          	lhu	a5,-18(s0)
    21a4:	00078593          	mv	a1,a5
    21a8:	00070513          	mv	a0,a4
    21ac:	520010ef          	jal	36cc <crc16>
    21b0:	00050793          	mv	a5,a0
    21b4:	fef41723          	sh	a5,-18(s0)
    21b8:	fd042683          	lw	a3,-48(s0)
    21bc:	fd442603          	lw	a2,-44(s0)
    21c0:	fd842583          	lw	a1,-40(s0)
    21c4:	fdc42503          	lw	a0,-36(s0)
    21c8:	684000ef          	jal	284c <matrix_mul_matrix>
    21cc:	fec41783          	lh	a5,-20(s0)
    21d0:	00078613          	mv	a2,a5
    21d4:	fd842583          	lw	a1,-40(s0)
    21d8:	fdc42503          	lw	a0,-36(s0)
    21dc:	2d0000ef          	jal	24ac <matrix_sum>
    21e0:	00050793          	mv	a5,a0
    21e4:	00078713          	mv	a4,a5
    21e8:	fee45783          	lhu	a5,-18(s0)
    21ec:	00078593          	mv	a1,a5
    21f0:	00070513          	mv	a0,a4
    21f4:	4d8010ef          	jal	36cc <crc16>
    21f8:	00050793          	mv	a5,a0
    21fc:	fef41723          	sh	a5,-18(s0)
    2200:	fd042683          	lw	a3,-48(s0)
    2204:	fd442603          	lw	a2,-44(s0)
    2208:	fd842583          	lw	a1,-40(s0)
    220c:	fdc42503          	lw	a0,-36(s0)
    2210:	78c000ef          	jal	299c <matrix_mul_matrix_bitextract>
    2214:	fec41783          	lh	a5,-20(s0)
    2218:	00078613          	mv	a2,a5
    221c:	fd842583          	lw	a1,-40(s0)
    2220:	fdc42503          	lw	a0,-36(s0)
    2224:	288000ef          	jal	24ac <matrix_sum>
    2228:	00050793          	mv	a5,a0
    222c:	00078713          	mv	a4,a5
    2230:	fee45783          	lhu	a5,-18(s0)
    2234:	00078593          	mv	a1,a5
    2238:	00070513          	mv	a0,a4
    223c:	490010ef          	jal	36cc <crc16>
    2240:	00050793          	mv	a5,a0
    2244:	fef41723          	sh	a5,-18(s0)
    2248:	fce45783          	lhu	a5,-50(s0)
    224c:	40f007b3          	neg	a5,a5
    2250:	01079793          	sll	a5,a5,0x10
    2254:	0107d793          	srl	a5,a5,0x10
    2258:	01079793          	sll	a5,a5,0x10
    225c:	4107d793          	sra	a5,a5,0x10
    2260:	00078613          	mv	a2,a5
    2264:	fd442583          	lw	a1,-44(s0)
    2268:	fdc42503          	lw	a0,-36(s0)
    226c:	418000ef          	jal	2684 <matrix_add_const>
    2270:	fee41783          	lh	a5,-18(s0)
    2274:	00078513          	mv	a0,a5
    2278:	03c12083          	lw	ra,60(sp)
    227c:	03812403          	lw	s0,56(sp)
    2280:	04010113          	add	sp,sp,64
    2284:	00008067          	ret

00002288 <core_init_matrix>:
    2288:	fc010113          	add	sp,sp,-64
    228c:	02812e23          	sw	s0,60(sp)
    2290:	04010413          	add	s0,sp,64
    2294:	fca42623          	sw	a0,-52(s0)
    2298:	fcb42423          	sw	a1,-56(s0)
    229c:	fcc42223          	sw	a2,-60(s0)
    22a0:	fcd42023          	sw	a3,-64(s0)
    22a4:	fe042023          	sw	zero,-32(s0)
    22a8:	00100793          	li	a5,1
    22ac:	fef42623          	sw	a5,-20(s0)
    22b0:	fe042423          	sw	zero,-24(s0)
    22b4:	fe042223          	sw	zero,-28(s0)
    22b8:	fc442783          	lw	a5,-60(s0)
    22bc:	02079663          	bnez	a5,22e8 <core_init_matrix+0x60>
    22c0:	00100793          	li	a5,1
    22c4:	fcf42223          	sw	a5,-60(s0)
    22c8:	0200006f          	j	22e8 <core_init_matrix+0x60>
    22cc:	fe842783          	lw	a5,-24(s0)
    22d0:	00178793          	add	a5,a5,1 # fffff001 <__subdf3+0xffff7929>
    22d4:	fef42423          	sw	a5,-24(s0)
    22d8:	fe842783          	lw	a5,-24(s0)
    22dc:	02f787b3          	mul	a5,a5,a5
    22e0:	00379793          	sll	a5,a5,0x3
    22e4:	fef42223          	sw	a5,-28(s0)
    22e8:	fe442703          	lw	a4,-28(s0)
    22ec:	fcc42783          	lw	a5,-52(s0)
    22f0:	fcf76ee3          	bltu	a4,a5,22cc <core_init_matrix+0x44>
    22f4:	fe842783          	lw	a5,-24(s0)
    22f8:	fff78793          	add	a5,a5,-1
    22fc:	fef42023          	sw	a5,-32(s0)
    2300:	fc842783          	lw	a5,-56(s0)
    2304:	fff78793          	add	a5,a5,-1
    2308:	ffc7f793          	and	a5,a5,-4
    230c:	00478793          	add	a5,a5,4
    2310:	fcf42e23          	sw	a5,-36(s0)
    2314:	fe042783          	lw	a5,-32(s0)
    2318:	02f787b3          	mul	a5,a5,a5
    231c:	00179793          	sll	a5,a5,0x1
    2320:	fdc42703          	lw	a4,-36(s0)
    2324:	00f707b3          	add	a5,a4,a5
    2328:	fcf42c23          	sw	a5,-40(s0)
    232c:	fe042423          	sw	zero,-24(s0)
    2330:	10c0006f          	j	243c <core_init_matrix+0x1b4>
    2334:	fe042223          	sw	zero,-28(s0)
    2338:	0ec0006f          	j	2424 <core_init_matrix+0x19c>
    233c:	fec42703          	lw	a4,-20(s0)
    2340:	fc442783          	lw	a5,-60(s0)
    2344:	02f70733          	mul	a4,a4,a5
    2348:	41f75793          	sra	a5,a4,0x1f
    234c:	0107d793          	srl	a5,a5,0x10
    2350:	00f706b3          	add	a3,a4,a5
    2354:	00010737          	lui	a4,0x10
    2358:	fff70713          	add	a4,a4,-1 # ffff <__subdf3+0x8927>
    235c:	00e6f733          	and	a4,a3,a4
    2360:	40f707b3          	sub	a5,a4,a5
    2364:	fcf42223          	sw	a5,-60(s0)
    2368:	fc442783          	lw	a5,-60(s0)
    236c:	01079713          	sll	a4,a5,0x10
    2370:	01075713          	srl	a4,a4,0x10
    2374:	fec42783          	lw	a5,-20(s0)
    2378:	01079793          	sll	a5,a5,0x10
    237c:	0107d793          	srl	a5,a5,0x10
    2380:	00f707b3          	add	a5,a4,a5
    2384:	01079793          	sll	a5,a5,0x10
    2388:	0107d793          	srl	a5,a5,0x10
    238c:	fcf41b23          	sh	a5,-42(s0)
    2390:	fe842703          	lw	a4,-24(s0)
    2394:	fe042783          	lw	a5,-32(s0)
    2398:	02f70733          	mul	a4,a4,a5
    239c:	fe442783          	lw	a5,-28(s0)
    23a0:	00f707b3          	add	a5,a4,a5
    23a4:	00179793          	sll	a5,a5,0x1
    23a8:	fd842703          	lw	a4,-40(s0)
    23ac:	00f707b3          	add	a5,a4,a5
    23b0:	fd645703          	lhu	a4,-42(s0)
    23b4:	00e79023          	sh	a4,0(a5)
    23b8:	fec42783          	lw	a5,-20(s0)
    23bc:	01079713          	sll	a4,a5,0x10
    23c0:	01075713          	srl	a4,a4,0x10
    23c4:	fd645783          	lhu	a5,-42(s0)
    23c8:	00f707b3          	add	a5,a4,a5
    23cc:	01079793          	sll	a5,a5,0x10
    23d0:	0107d793          	srl	a5,a5,0x10
    23d4:	fcf41b23          	sh	a5,-42(s0)
    23d8:	fd645783          	lhu	a5,-42(s0)
    23dc:	0ff7f793          	zext.b	a5,a5
    23e0:	fcf41b23          	sh	a5,-42(s0)
    23e4:	fe842703          	lw	a4,-24(s0)
    23e8:	fe042783          	lw	a5,-32(s0)
    23ec:	02f70733          	mul	a4,a4,a5
    23f0:	fe442783          	lw	a5,-28(s0)
    23f4:	00f707b3          	add	a5,a4,a5
    23f8:	00179793          	sll	a5,a5,0x1
    23fc:	fdc42703          	lw	a4,-36(s0)
    2400:	00f707b3          	add	a5,a4,a5
    2404:	fd645703          	lhu	a4,-42(s0)
    2408:	00e79023          	sh	a4,0(a5)
    240c:	fec42783          	lw	a5,-20(s0)
    2410:	00178793          	add	a5,a5,1
    2414:	fef42623          	sw	a5,-20(s0)
    2418:	fe442783          	lw	a5,-28(s0)
    241c:	00178793          	add	a5,a5,1
    2420:	fef42223          	sw	a5,-28(s0)
    2424:	fe442703          	lw	a4,-28(s0)
    2428:	fe042783          	lw	a5,-32(s0)
    242c:	f0f768e3          	bltu	a4,a5,233c <core_init_matrix+0xb4>
    2430:	fe842783          	lw	a5,-24(s0)
    2434:	00178793          	add	a5,a5,1
    2438:	fef42423          	sw	a5,-24(s0)
    243c:	fe842703          	lw	a4,-24(s0)
    2440:	fe042783          	lw	a5,-32(s0)
    2444:	eef768e3          	bltu	a4,a5,2334 <core_init_matrix+0xac>
    2448:	fc042783          	lw	a5,-64(s0)
    244c:	fdc42703          	lw	a4,-36(s0)
    2450:	00e7a223          	sw	a4,4(a5)
    2454:	fc042783          	lw	a5,-64(s0)
    2458:	fd842703          	lw	a4,-40(s0)
    245c:	00e7a423          	sw	a4,8(a5)
    2460:	fe042783          	lw	a5,-32(s0)
    2464:	02f787b3          	mul	a5,a5,a5
    2468:	00179793          	sll	a5,a5,0x1
    246c:	fd842703          	lw	a4,-40(s0)
    2470:	00f707b3          	add	a5,a4,a5
    2474:	fff78793          	add	a5,a5,-1
    2478:	ffc7f793          	and	a5,a5,-4
    247c:	00478793          	add	a5,a5,4
    2480:	00078713          	mv	a4,a5
    2484:	fc042783          	lw	a5,-64(s0)
    2488:	00e7a623          	sw	a4,12(a5)
    248c:	fe042703          	lw	a4,-32(s0)
    2490:	fc042783          	lw	a5,-64(s0)
    2494:	00e7a023          	sw	a4,0(a5)
    2498:	fe042783          	lw	a5,-32(s0)
    249c:	00078513          	mv	a0,a5
    24a0:	03c12403          	lw	s0,60(sp)
    24a4:	04010113          	add	sp,sp,64
    24a8:	00008067          	ret

000024ac <matrix_sum>:
    24ac:	fc010113          	add	sp,sp,-64
    24b0:	02812e23          	sw	s0,60(sp)
    24b4:	04010413          	add	s0,sp,64
    24b8:	fca42623          	sw	a0,-52(s0)
    24bc:	fcb42423          	sw	a1,-56(s0)
    24c0:	00060793          	mv	a5,a2
    24c4:	fcf41323          	sh	a5,-58(s0)
    24c8:	fe042623          	sw	zero,-20(s0)
    24cc:	fe042423          	sw	zero,-24(s0)
    24d0:	fc042c23          	sw	zero,-40(s0)
    24d4:	fe041323          	sh	zero,-26(s0)
    24d8:	fe042023          	sw	zero,-32(s0)
    24dc:	0c00006f          	j	259c <matrix_sum+0xf0>
    24e0:	fc042e23          	sw	zero,-36(s0)
    24e4:	0a00006f          	j	2584 <matrix_sum+0xd8>
    24e8:	fe042703          	lw	a4,-32(s0)
    24ec:	fcc42783          	lw	a5,-52(s0)
    24f0:	02f70733          	mul	a4,a4,a5
    24f4:	fdc42783          	lw	a5,-36(s0)
    24f8:	00f707b3          	add	a5,a4,a5
    24fc:	00279793          	sll	a5,a5,0x2
    2500:	fc842703          	lw	a4,-56(s0)
    2504:	00f707b3          	add	a5,a4,a5
    2508:	0007a783          	lw	a5,0(a5)
    250c:	fcf42c23          	sw	a5,-40(s0)
    2510:	fec42703          	lw	a4,-20(s0)
    2514:	fd842783          	lw	a5,-40(s0)
    2518:	00f707b3          	add	a5,a4,a5
    251c:	fef42623          	sw	a5,-20(s0)
    2520:	fc641783          	lh	a5,-58(s0)
    2524:	fec42703          	lw	a4,-20(s0)
    2528:	02e7d063          	bge	a5,a4,2548 <matrix_sum+0x9c>
    252c:	fe645783          	lhu	a5,-26(s0)
    2530:	00a78793          	add	a5,a5,10
    2534:	01079793          	sll	a5,a5,0x10
    2538:	0107d793          	srl	a5,a5,0x10
    253c:	fef41323          	sh	a5,-26(s0)
    2540:	fe042623          	sw	zero,-20(s0)
    2544:	02c0006f          	j	2570 <matrix_sum+0xc4>
    2548:	fd842703          	lw	a4,-40(s0)
    254c:	fe842783          	lw	a5,-24(s0)
    2550:	00e7a7b3          	slt	a5,a5,a4
    2554:	0ff7f793          	zext.b	a5,a5
    2558:	00078713          	mv	a4,a5
    255c:	fe645783          	lhu	a5,-26(s0)
    2560:	00f707b3          	add	a5,a4,a5
    2564:	01079793          	sll	a5,a5,0x10
    2568:	0107d793          	srl	a5,a5,0x10
    256c:	fef41323          	sh	a5,-26(s0)
    2570:	fd842783          	lw	a5,-40(s0)
    2574:	fef42423          	sw	a5,-24(s0)
    2578:	fdc42783          	lw	a5,-36(s0)
    257c:	00178793          	add	a5,a5,1
    2580:	fcf42e23          	sw	a5,-36(s0)
    2584:	fdc42703          	lw	a4,-36(s0)
    2588:	fcc42783          	lw	a5,-52(s0)
    258c:	f4f76ee3          	bltu	a4,a5,24e8 <matrix_sum+0x3c>
    2590:	fe042783          	lw	a5,-32(s0)
    2594:	00178793          	add	a5,a5,1
    2598:	fef42023          	sw	a5,-32(s0)
    259c:	fe042703          	lw	a4,-32(s0)
    25a0:	fcc42783          	lw	a5,-52(s0)
    25a4:	f2f76ee3          	bltu	a4,a5,24e0 <matrix_sum+0x34>
    25a8:	fe641783          	lh	a5,-26(s0)
    25ac:	00078513          	mv	a0,a5
    25b0:	03c12403          	lw	s0,60(sp)
    25b4:	04010113          	add	sp,sp,64
    25b8:	00008067          	ret

000025bc <matrix_mul_const>:
    25bc:	fd010113          	add	sp,sp,-48
    25c0:	02812623          	sw	s0,44(sp)
    25c4:	03010413          	add	s0,sp,48
    25c8:	fca42e23          	sw	a0,-36(s0)
    25cc:	fcb42c23          	sw	a1,-40(s0)
    25d0:	fcc42a23          	sw	a2,-44(s0)
    25d4:	00068793          	mv	a5,a3
    25d8:	fcf41923          	sh	a5,-46(s0)
    25dc:	fe042623          	sw	zero,-20(s0)
    25e0:	0840006f          	j	2664 <matrix_mul_const+0xa8>
    25e4:	fe042423          	sw	zero,-24(s0)
    25e8:	0640006f          	j	264c <matrix_mul_const+0x90>
    25ec:	fec42703          	lw	a4,-20(s0)
    25f0:	fdc42783          	lw	a5,-36(s0)
    25f4:	02f70733          	mul	a4,a4,a5
    25f8:	fe842783          	lw	a5,-24(s0)
    25fc:	00f707b3          	add	a5,a4,a5
    2600:	00179793          	sll	a5,a5,0x1
    2604:	fd442703          	lw	a4,-44(s0)
    2608:	00f707b3          	add	a5,a4,a5
    260c:	00079783          	lh	a5,0(a5)
    2610:	00078613          	mv	a2,a5
    2614:	fd241703          	lh	a4,-46(s0)
    2618:	fec42683          	lw	a3,-20(s0)
    261c:	fdc42783          	lw	a5,-36(s0)
    2620:	02f686b3          	mul	a3,a3,a5
    2624:	fe842783          	lw	a5,-24(s0)
    2628:	00f687b3          	add	a5,a3,a5
    262c:	00279793          	sll	a5,a5,0x2
    2630:	fd842683          	lw	a3,-40(s0)
    2634:	00f687b3          	add	a5,a3,a5
    2638:	02e60733          	mul	a4,a2,a4
    263c:	00e7a023          	sw	a4,0(a5)
    2640:	fe842783          	lw	a5,-24(s0)
    2644:	00178793          	add	a5,a5,1
    2648:	fef42423          	sw	a5,-24(s0)
    264c:	fe842703          	lw	a4,-24(s0)
    2650:	fdc42783          	lw	a5,-36(s0)
    2654:	f8f76ce3          	bltu	a4,a5,25ec <matrix_mul_const+0x30>
    2658:	fec42783          	lw	a5,-20(s0)
    265c:	00178793          	add	a5,a5,1
    2660:	fef42623          	sw	a5,-20(s0)
    2664:	fec42703          	lw	a4,-20(s0)
    2668:	fdc42783          	lw	a5,-36(s0)
    266c:	f6f76ce3          	bltu	a4,a5,25e4 <matrix_mul_const+0x28>
    2670:	00000013          	nop
    2674:	00000013          	nop
    2678:	02c12403          	lw	s0,44(sp)
    267c:	03010113          	add	sp,sp,48
    2680:	00008067          	ret

00002684 <matrix_add_const>:
    2684:	fd010113          	add	sp,sp,-48
    2688:	02812623          	sw	s0,44(sp)
    268c:	03010413          	add	s0,sp,48
    2690:	fca42e23          	sw	a0,-36(s0)
    2694:	fcb42c23          	sw	a1,-40(s0)
    2698:	00060793          	mv	a5,a2
    269c:	fcf41b23          	sh	a5,-42(s0)
    26a0:	fe042623          	sw	zero,-20(s0)
    26a4:	0980006f          	j	273c <matrix_add_const+0xb8>
    26a8:	fe042423          	sw	zero,-24(s0)
    26ac:	0780006f          	j	2724 <matrix_add_const+0xa0>
    26b0:	fec42703          	lw	a4,-20(s0)
    26b4:	fdc42783          	lw	a5,-36(s0)
    26b8:	02f70733          	mul	a4,a4,a5
    26bc:	fe842783          	lw	a5,-24(s0)
    26c0:	00f707b3          	add	a5,a4,a5
    26c4:	00179793          	sll	a5,a5,0x1
    26c8:	fd842703          	lw	a4,-40(s0)
    26cc:	00f707b3          	add	a5,a4,a5
    26d0:	00079783          	lh	a5,0(a5)
    26d4:	01079713          	sll	a4,a5,0x10
    26d8:	01075713          	srl	a4,a4,0x10
    26dc:	fd645783          	lhu	a5,-42(s0)
    26e0:	00f707b3          	add	a5,a4,a5
    26e4:	01079693          	sll	a3,a5,0x10
    26e8:	0106d693          	srl	a3,a3,0x10
    26ec:	fec42703          	lw	a4,-20(s0)
    26f0:	fdc42783          	lw	a5,-36(s0)
    26f4:	02f70733          	mul	a4,a4,a5
    26f8:	fe842783          	lw	a5,-24(s0)
    26fc:	00f707b3          	add	a5,a4,a5
    2700:	00179793          	sll	a5,a5,0x1
    2704:	fd842703          	lw	a4,-40(s0)
    2708:	00f707b3          	add	a5,a4,a5
    270c:	01069713          	sll	a4,a3,0x10
    2710:	41075713          	sra	a4,a4,0x10
    2714:	00e79023          	sh	a4,0(a5)
    2718:	fe842783          	lw	a5,-24(s0)
    271c:	00178793          	add	a5,a5,1
    2720:	fef42423          	sw	a5,-24(s0)
    2724:	fe842703          	lw	a4,-24(s0)
    2728:	fdc42783          	lw	a5,-36(s0)
    272c:	f8f762e3          	bltu	a4,a5,26b0 <matrix_add_const+0x2c>
    2730:	fec42783          	lw	a5,-20(s0)
    2734:	00178793          	add	a5,a5,1
    2738:	fef42623          	sw	a5,-20(s0)
    273c:	fec42703          	lw	a4,-20(s0)
    2740:	fdc42783          	lw	a5,-36(s0)
    2744:	f6f762e3          	bltu	a4,a5,26a8 <matrix_add_const+0x24>
    2748:	00000013          	nop
    274c:	00000013          	nop
    2750:	02c12403          	lw	s0,44(sp)
    2754:	03010113          	add	sp,sp,48
    2758:	00008067          	ret

0000275c <matrix_mul_vect>:
    275c:	fd010113          	add	sp,sp,-48
    2760:	02812623          	sw	s0,44(sp)
    2764:	03010413          	add	s0,sp,48
    2768:	fca42e23          	sw	a0,-36(s0)
    276c:	fcb42c23          	sw	a1,-40(s0)
    2770:	fcc42a23          	sw	a2,-44(s0)
    2774:	fcd42823          	sw	a3,-48(s0)
    2778:	fe042623          	sw	zero,-20(s0)
    277c:	0b00006f          	j	282c <matrix_mul_vect+0xd0>
    2780:	fec42783          	lw	a5,-20(s0)
    2784:	00279793          	sll	a5,a5,0x2
    2788:	fd842703          	lw	a4,-40(s0)
    278c:	00f707b3          	add	a5,a4,a5
    2790:	0007a023          	sw	zero,0(a5)
    2794:	fe042423          	sw	zero,-24(s0)
    2798:	07c0006f          	j	2814 <matrix_mul_vect+0xb8>
    279c:	fec42783          	lw	a5,-20(s0)
    27a0:	00279793          	sll	a5,a5,0x2
    27a4:	fd842703          	lw	a4,-40(s0)
    27a8:	00f707b3          	add	a5,a4,a5
    27ac:	0007a683          	lw	a3,0(a5)
    27b0:	fec42703          	lw	a4,-20(s0)
    27b4:	fdc42783          	lw	a5,-36(s0)
    27b8:	02f70733          	mul	a4,a4,a5
    27bc:	fe842783          	lw	a5,-24(s0)
    27c0:	00f707b3          	add	a5,a4,a5
    27c4:	00179793          	sll	a5,a5,0x1
    27c8:	fd442703          	lw	a4,-44(s0)
    27cc:	00f707b3          	add	a5,a4,a5
    27d0:	00079783          	lh	a5,0(a5)
    27d4:	00078613          	mv	a2,a5
    27d8:	fe842783          	lw	a5,-24(s0)
    27dc:	00179793          	sll	a5,a5,0x1
    27e0:	fd042703          	lw	a4,-48(s0)
    27e4:	00f707b3          	add	a5,a4,a5
    27e8:	00079783          	lh	a5,0(a5)
    27ec:	02f60733          	mul	a4,a2,a5
    27f0:	fec42783          	lw	a5,-20(s0)
    27f4:	00279793          	sll	a5,a5,0x2
    27f8:	fd842603          	lw	a2,-40(s0)
    27fc:	00f607b3          	add	a5,a2,a5
    2800:	00e68733          	add	a4,a3,a4
    2804:	00e7a023          	sw	a4,0(a5)
    2808:	fe842783          	lw	a5,-24(s0)
    280c:	00178793          	add	a5,a5,1
    2810:	fef42423          	sw	a5,-24(s0)
    2814:	fe842703          	lw	a4,-24(s0)
    2818:	fdc42783          	lw	a5,-36(s0)
    281c:	f8f760e3          	bltu	a4,a5,279c <matrix_mul_vect+0x40>
    2820:	fec42783          	lw	a5,-20(s0)
    2824:	00178793          	add	a5,a5,1
    2828:	fef42623          	sw	a5,-20(s0)
    282c:	fec42703          	lw	a4,-20(s0)
    2830:	fdc42783          	lw	a5,-36(s0)
    2834:	f4f766e3          	bltu	a4,a5,2780 <matrix_mul_vect+0x24>
    2838:	00000013          	nop
    283c:	00000013          	nop
    2840:	02c12403          	lw	s0,44(sp)
    2844:	03010113          	add	sp,sp,48
    2848:	00008067          	ret

0000284c <matrix_mul_matrix>:
    284c:	fd010113          	add	sp,sp,-48
    2850:	02812623          	sw	s0,44(sp)
    2854:	03010413          	add	s0,sp,48
    2858:	fca42e23          	sw	a0,-36(s0)
    285c:	fcb42c23          	sw	a1,-40(s0)
    2860:	fcc42a23          	sw	a2,-44(s0)
    2864:	fcd42823          	sw	a3,-48(s0)
    2868:	fe042623          	sw	zero,-20(s0)
    286c:	1100006f          	j	297c <matrix_mul_matrix+0x130>
    2870:	fe042423          	sw	zero,-24(s0)
    2874:	0f00006f          	j	2964 <matrix_mul_matrix+0x118>
    2878:	fec42703          	lw	a4,-20(s0)
    287c:	fdc42783          	lw	a5,-36(s0)
    2880:	02f70733          	mul	a4,a4,a5
    2884:	fe842783          	lw	a5,-24(s0)
    2888:	00f707b3          	add	a5,a4,a5
    288c:	00279793          	sll	a5,a5,0x2
    2890:	fd842703          	lw	a4,-40(s0)
    2894:	00f707b3          	add	a5,a4,a5
    2898:	0007a023          	sw	zero,0(a5)
    289c:	fe042223          	sw	zero,-28(s0)
    28a0:	0ac0006f          	j	294c <matrix_mul_matrix+0x100>
    28a4:	fec42703          	lw	a4,-20(s0)
    28a8:	fdc42783          	lw	a5,-36(s0)
    28ac:	02f70733          	mul	a4,a4,a5
    28b0:	fe842783          	lw	a5,-24(s0)
    28b4:	00f707b3          	add	a5,a4,a5
    28b8:	00279793          	sll	a5,a5,0x2
    28bc:	fd842703          	lw	a4,-40(s0)
    28c0:	00f707b3          	add	a5,a4,a5
    28c4:	0007a683          	lw	a3,0(a5)
    28c8:	fec42703          	lw	a4,-20(s0)
    28cc:	fdc42783          	lw	a5,-36(s0)
    28d0:	02f70733          	mul	a4,a4,a5
    28d4:	fe442783          	lw	a5,-28(s0)
    28d8:	00f707b3          	add	a5,a4,a5
    28dc:	00179793          	sll	a5,a5,0x1
    28e0:	fd442703          	lw	a4,-44(s0)
    28e4:	00f707b3          	add	a5,a4,a5
    28e8:	00079783          	lh	a5,0(a5)
    28ec:	00078613          	mv	a2,a5
    28f0:	fe442703          	lw	a4,-28(s0)
    28f4:	fdc42783          	lw	a5,-36(s0)
    28f8:	02f70733          	mul	a4,a4,a5
    28fc:	fe842783          	lw	a5,-24(s0)
    2900:	00f707b3          	add	a5,a4,a5
    2904:	00179793          	sll	a5,a5,0x1
    2908:	fd042703          	lw	a4,-48(s0)
    290c:	00f707b3          	add	a5,a4,a5
    2910:	00079783          	lh	a5,0(a5)
    2914:	02f60733          	mul	a4,a2,a5
    2918:	fec42603          	lw	a2,-20(s0)
    291c:	fdc42783          	lw	a5,-36(s0)
    2920:	02f60633          	mul	a2,a2,a5
    2924:	fe842783          	lw	a5,-24(s0)
    2928:	00f607b3          	add	a5,a2,a5
    292c:	00279793          	sll	a5,a5,0x2
    2930:	fd842603          	lw	a2,-40(s0)
    2934:	00f607b3          	add	a5,a2,a5
    2938:	00e68733          	add	a4,a3,a4
    293c:	00e7a023          	sw	a4,0(a5)
    2940:	fe442783          	lw	a5,-28(s0)
    2944:	00178793          	add	a5,a5,1
    2948:	fef42223          	sw	a5,-28(s0)
    294c:	fe442703          	lw	a4,-28(s0)
    2950:	fdc42783          	lw	a5,-36(s0)
    2954:	f4f768e3          	bltu	a4,a5,28a4 <matrix_mul_matrix+0x58>
    2958:	fe842783          	lw	a5,-24(s0)
    295c:	00178793          	add	a5,a5,1
    2960:	fef42423          	sw	a5,-24(s0)
    2964:	fe842703          	lw	a4,-24(s0)
    2968:	fdc42783          	lw	a5,-36(s0)
    296c:	f0f766e3          	bltu	a4,a5,2878 <matrix_mul_matrix+0x2c>
    2970:	fec42783          	lw	a5,-20(s0)
    2974:	00178793          	add	a5,a5,1
    2978:	fef42623          	sw	a5,-20(s0)
    297c:	fec42703          	lw	a4,-20(s0)
    2980:	fdc42783          	lw	a5,-36(s0)
    2984:	eef766e3          	bltu	a4,a5,2870 <matrix_mul_matrix+0x24>
    2988:	00000013          	nop
    298c:	00000013          	nop
    2990:	02c12403          	lw	s0,44(sp)
    2994:	03010113          	add	sp,sp,48
    2998:	00008067          	ret

0000299c <matrix_mul_matrix_bitextract>:
    299c:	fd010113          	add	sp,sp,-48
    29a0:	02812623          	sw	s0,44(sp)
    29a4:	03010413          	add	s0,sp,48
    29a8:	fca42e23          	sw	a0,-36(s0)
    29ac:	fcb42c23          	sw	a1,-40(s0)
    29b0:	fcc42a23          	sw	a2,-44(s0)
    29b4:	fcd42823          	sw	a3,-48(s0)
    29b8:	fe042623          	sw	zero,-20(s0)
    29bc:	1380006f          	j	2af4 <matrix_mul_matrix_bitextract+0x158>
    29c0:	fe042423          	sw	zero,-24(s0)
    29c4:	1180006f          	j	2adc <matrix_mul_matrix_bitextract+0x140>
    29c8:	fec42703          	lw	a4,-20(s0)
    29cc:	fdc42783          	lw	a5,-36(s0)
    29d0:	02f70733          	mul	a4,a4,a5
    29d4:	fe842783          	lw	a5,-24(s0)
    29d8:	00f707b3          	add	a5,a4,a5
    29dc:	00279793          	sll	a5,a5,0x2
    29e0:	fd842703          	lw	a4,-40(s0)
    29e4:	00f707b3          	add	a5,a4,a5
    29e8:	0007a023          	sw	zero,0(a5)
    29ec:	fe042223          	sw	zero,-28(s0)
    29f0:	0d40006f          	j	2ac4 <matrix_mul_matrix_bitextract+0x128>
    29f4:	fec42703          	lw	a4,-20(s0)
    29f8:	fdc42783          	lw	a5,-36(s0)
    29fc:	02f70733          	mul	a4,a4,a5
    2a00:	fe442783          	lw	a5,-28(s0)
    2a04:	00f707b3          	add	a5,a4,a5
    2a08:	00179793          	sll	a5,a5,0x1
    2a0c:	fd442703          	lw	a4,-44(s0)
    2a10:	00f707b3          	add	a5,a4,a5
    2a14:	00079783          	lh	a5,0(a5)
    2a18:	00078693          	mv	a3,a5
    2a1c:	fe442703          	lw	a4,-28(s0)
    2a20:	fdc42783          	lw	a5,-36(s0)
    2a24:	02f70733          	mul	a4,a4,a5
    2a28:	fe842783          	lw	a5,-24(s0)
    2a2c:	00f707b3          	add	a5,a4,a5
    2a30:	00179793          	sll	a5,a5,0x1
    2a34:	fd042703          	lw	a4,-48(s0)
    2a38:	00f707b3          	add	a5,a4,a5
    2a3c:	00079783          	lh	a5,0(a5)
    2a40:	02f687b3          	mul	a5,a3,a5
    2a44:	fef42023          	sw	a5,-32(s0)
    2a48:	fec42703          	lw	a4,-20(s0)
    2a4c:	fdc42783          	lw	a5,-36(s0)
    2a50:	02f70733          	mul	a4,a4,a5
    2a54:	fe842783          	lw	a5,-24(s0)
    2a58:	00f707b3          	add	a5,a4,a5
    2a5c:	00279793          	sll	a5,a5,0x2
    2a60:	fd842703          	lw	a4,-40(s0)
    2a64:	00f707b3          	add	a5,a4,a5
    2a68:	0007a783          	lw	a5,0(a5)
    2a6c:	00078693          	mv	a3,a5
    2a70:	fe042783          	lw	a5,-32(s0)
    2a74:	4027d793          	sra	a5,a5,0x2
    2a78:	00f7f713          	and	a4,a5,15
    2a7c:	fe042783          	lw	a5,-32(s0)
    2a80:	4057d793          	sra	a5,a5,0x5
    2a84:	07f7f793          	and	a5,a5,127
    2a88:	02f707b3          	mul	a5,a4,a5
    2a8c:	00f686b3          	add	a3,a3,a5
    2a90:	fec42703          	lw	a4,-20(s0)
    2a94:	fdc42783          	lw	a5,-36(s0)
    2a98:	02f70733          	mul	a4,a4,a5
    2a9c:	fe842783          	lw	a5,-24(s0)
    2aa0:	00f707b3          	add	a5,a4,a5
    2aa4:	00279793          	sll	a5,a5,0x2
    2aa8:	fd842703          	lw	a4,-40(s0)
    2aac:	00f707b3          	add	a5,a4,a5
    2ab0:	00068713          	mv	a4,a3
    2ab4:	00e7a023          	sw	a4,0(a5)
    2ab8:	fe442783          	lw	a5,-28(s0)
    2abc:	00178793          	add	a5,a5,1
    2ac0:	fef42223          	sw	a5,-28(s0)
    2ac4:	fe442703          	lw	a4,-28(s0)
    2ac8:	fdc42783          	lw	a5,-36(s0)
    2acc:	f2f764e3          	bltu	a4,a5,29f4 <matrix_mul_matrix_bitextract+0x58>
    2ad0:	fe842783          	lw	a5,-24(s0)
    2ad4:	00178793          	add	a5,a5,1
    2ad8:	fef42423          	sw	a5,-24(s0)
    2adc:	fe842703          	lw	a4,-24(s0)
    2ae0:	fdc42783          	lw	a5,-36(s0)
    2ae4:	eef762e3          	bltu	a4,a5,29c8 <matrix_mul_matrix_bitextract+0x2c>
    2ae8:	fec42783          	lw	a5,-20(s0)
    2aec:	00178793          	add	a5,a5,1
    2af0:	fef42623          	sw	a5,-20(s0)
    2af4:	fec42703          	lw	a4,-20(s0)
    2af8:	fdc42783          	lw	a5,-36(s0)
    2afc:	ecf762e3          	bltu	a4,a5,29c0 <matrix_mul_matrix_bitextract+0x24>
    2b00:	00000013          	nop
    2b04:	00000013          	nop
    2b08:	02c12403          	lw	s0,44(sp)
    2b0c:	03010113          	add	sp,sp,48
    2b10:	00008067          	ret

00002b14 <core_bench_state>:
    2b14:	f9010113          	add	sp,sp,-112
    2b18:	06112623          	sw	ra,108(sp)
    2b1c:	06812423          	sw	s0,104(sp)
    2b20:	07010413          	add	s0,sp,112
    2b24:	f8a42e23          	sw	a0,-100(s0)
    2b28:	f8b42c23          	sw	a1,-104(s0)
    2b2c:	00060593          	mv	a1,a2
    2b30:	00068613          	mv	a2,a3
    2b34:	00070693          	mv	a3,a4
    2b38:	00078713          	mv	a4,a5
    2b3c:	00058793          	mv	a5,a1
    2b40:	f8f41b23          	sh	a5,-106(s0)
    2b44:	00060793          	mv	a5,a2
    2b48:	f8f41a23          	sh	a5,-108(s0)
    2b4c:	00068793          	mv	a5,a3
    2b50:	f8f41923          	sh	a5,-110(s0)
    2b54:	00070793          	mv	a5,a4
    2b58:	f8f41823          	sh	a5,-112(s0)
    2b5c:	f9842783          	lw	a5,-104(s0)
    2b60:	faf42023          	sw	a5,-96(s0)
    2b64:	fe042623          	sw	zero,-20(s0)
    2b68:	04c0006f          	j	2bb4 <core_bench_state+0xa0>
    2b6c:	fec42783          	lw	a5,-20(s0)
    2b70:	00279793          	sll	a5,a5,0x2
    2b74:	ff078793          	add	a5,a5,-16
    2b78:	008787b3          	add	a5,a5,s0
    2b7c:	fa07aa23          	sw	zero,-76(a5)
    2b80:	fec42783          	lw	a5,-20(s0)
    2b84:	00279793          	sll	a5,a5,0x2
    2b88:	ff078793          	add	a5,a5,-16
    2b8c:	008787b3          	add	a5,a5,s0
    2b90:	fb47a703          	lw	a4,-76(a5)
    2b94:	fec42783          	lw	a5,-20(s0)
    2b98:	00279793          	sll	a5,a5,0x2
    2b9c:	ff078793          	add	a5,a5,-16
    2ba0:	008787b3          	add	a5,a5,s0
    2ba4:	fce7aa23          	sw	a4,-44(a5)
    2ba8:	fec42783          	lw	a5,-20(s0)
    2bac:	00178793          	add	a5,a5,1
    2bb0:	fef42623          	sw	a5,-20(s0)
    2bb4:	fec42703          	lw	a4,-20(s0)
    2bb8:	00700793          	li	a5,7
    2bbc:	fae7f8e3          	bgeu	a5,a4,2b6c <core_bench_state+0x58>
    2bc0:	0480006f          	j	2c08 <core_bench_state+0xf4>
    2bc4:	fa440713          	add	a4,s0,-92
    2bc8:	fa040793          	add	a5,s0,-96
    2bcc:	00070593          	mv	a1,a4
    2bd0:	00078513          	mv	a0,a5
    2bd4:	4b4000ef          	jal	3088 <core_state_transition>
    2bd8:	fea42223          	sw	a0,-28(s0)
    2bdc:	fe442783          	lw	a5,-28(s0)
    2be0:	00279793          	sll	a5,a5,0x2
    2be4:	ff078793          	add	a5,a5,-16
    2be8:	008787b3          	add	a5,a5,s0
    2bec:	fd47a783          	lw	a5,-44(a5)
    2bf0:	00178713          	add	a4,a5,1
    2bf4:	fe442783          	lw	a5,-28(s0)
    2bf8:	00279793          	sll	a5,a5,0x2
    2bfc:	ff078793          	add	a5,a5,-16
    2c00:	008787b3          	add	a5,a5,s0
    2c04:	fce7aa23          	sw	a4,-44(a5)
    2c08:	fa042783          	lw	a5,-96(s0)
    2c0c:	0007c783          	lbu	a5,0(a5)
    2c10:	fa079ae3          	bnez	a5,2bc4 <core_bench_state+0xb0>
    2c14:	f9842783          	lw	a5,-104(s0)
    2c18:	faf42023          	sw	a5,-96(s0)
    2c1c:	0440006f          	j	2c60 <core_bench_state+0x14c>
    2c20:	fa042783          	lw	a5,-96(s0)
    2c24:	0007c703          	lbu	a4,0(a5)
    2c28:	02c00793          	li	a5,44
    2c2c:	02f70263          	beq	a4,a5,2c50 <core_bench_state+0x13c>
    2c30:	fa042783          	lw	a5,-96(s0)
    2c34:	0007c683          	lbu	a3,0(a5)
    2c38:	f9645783          	lhu	a5,-106(s0)
    2c3c:	0ff7f713          	zext.b	a4,a5
    2c40:	fa042783          	lw	a5,-96(s0)
    2c44:	00e6c733          	xor	a4,a3,a4
    2c48:	0ff77713          	zext.b	a4,a4
    2c4c:	00e78023          	sb	a4,0(a5)
    2c50:	fa042703          	lw	a4,-96(s0)
    2c54:	f9241783          	lh	a5,-110(s0)
    2c58:	00f707b3          	add	a5,a4,a5
    2c5c:	faf42023          	sw	a5,-96(s0)
    2c60:	f9842703          	lw	a4,-104(s0)
    2c64:	f9c42783          	lw	a5,-100(s0)
    2c68:	00f70733          	add	a4,a4,a5
    2c6c:	fa042783          	lw	a5,-96(s0)
    2c70:	fae7e8e3          	bltu	a5,a4,2c20 <core_bench_state+0x10c>
    2c74:	f9842783          	lw	a5,-104(s0)
    2c78:	faf42023          	sw	a5,-96(s0)
    2c7c:	0480006f          	j	2cc4 <core_bench_state+0x1b0>
    2c80:	fa440713          	add	a4,s0,-92
    2c84:	fa040793          	add	a5,s0,-96
    2c88:	00070593          	mv	a1,a4
    2c8c:	00078513          	mv	a0,a5
    2c90:	3f8000ef          	jal	3088 <core_state_transition>
    2c94:	fea42423          	sw	a0,-24(s0)
    2c98:	fe842783          	lw	a5,-24(s0)
    2c9c:	00279793          	sll	a5,a5,0x2
    2ca0:	ff078793          	add	a5,a5,-16
    2ca4:	008787b3          	add	a5,a5,s0
    2ca8:	fd47a783          	lw	a5,-44(a5)
    2cac:	00178713          	add	a4,a5,1
    2cb0:	fe842783          	lw	a5,-24(s0)
    2cb4:	00279793          	sll	a5,a5,0x2
    2cb8:	ff078793          	add	a5,a5,-16
    2cbc:	008787b3          	add	a5,a5,s0
    2cc0:	fce7aa23          	sw	a4,-44(a5)
    2cc4:	fa042783          	lw	a5,-96(s0)
    2cc8:	0007c783          	lbu	a5,0(a5)
    2ccc:	fa079ae3          	bnez	a5,2c80 <core_bench_state+0x16c>
    2cd0:	f9842783          	lw	a5,-104(s0)
    2cd4:	faf42023          	sw	a5,-96(s0)
    2cd8:	0440006f          	j	2d1c <core_bench_state+0x208>
    2cdc:	fa042783          	lw	a5,-96(s0)
    2ce0:	0007c703          	lbu	a4,0(a5)
    2ce4:	02c00793          	li	a5,44
    2ce8:	02f70263          	beq	a4,a5,2d0c <core_bench_state+0x1f8>
    2cec:	fa042783          	lw	a5,-96(s0)
    2cf0:	0007c683          	lbu	a3,0(a5)
    2cf4:	f9445783          	lhu	a5,-108(s0)
    2cf8:	0ff7f713          	zext.b	a4,a5
    2cfc:	fa042783          	lw	a5,-96(s0)
    2d00:	00e6c733          	xor	a4,a3,a4
    2d04:	0ff77713          	zext.b	a4,a4
    2d08:	00e78023          	sb	a4,0(a5)
    2d0c:	fa042703          	lw	a4,-96(s0)
    2d10:	f9241783          	lh	a5,-110(s0)
    2d14:	00f707b3          	add	a5,a4,a5
    2d18:	faf42023          	sw	a5,-96(s0)
    2d1c:	f9842703          	lw	a4,-104(s0)
    2d20:	f9c42783          	lw	a5,-100(s0)
    2d24:	00f70733          	add	a4,a4,a5
    2d28:	fa042783          	lw	a5,-96(s0)
    2d2c:	fae7e8e3          	bltu	a5,a4,2cdc <core_bench_state+0x1c8>
    2d30:	fe042623          	sw	zero,-20(s0)
    2d34:	0680006f          	j	2d9c <core_bench_state+0x288>
    2d38:	fec42783          	lw	a5,-20(s0)
    2d3c:	00279793          	sll	a5,a5,0x2
    2d40:	ff078793          	add	a5,a5,-16
    2d44:	008787b3          	add	a5,a5,s0
    2d48:	fd47a783          	lw	a5,-44(a5)
    2d4c:	f9045703          	lhu	a4,-112(s0)
    2d50:	00070593          	mv	a1,a4
    2d54:	00078513          	mv	a0,a5
    2d58:	0f5000ef          	jal	364c <crcu32>
    2d5c:	00050793          	mv	a5,a0
    2d60:	f8f41823          	sh	a5,-112(s0)
    2d64:	fec42783          	lw	a5,-20(s0)
    2d68:	00279793          	sll	a5,a5,0x2
    2d6c:	ff078793          	add	a5,a5,-16
    2d70:	008787b3          	add	a5,a5,s0
    2d74:	fb47a783          	lw	a5,-76(a5)
    2d78:	f9045703          	lhu	a4,-112(s0)
    2d7c:	00070593          	mv	a1,a4
    2d80:	00078513          	mv	a0,a5
    2d84:	0c9000ef          	jal	364c <crcu32>
    2d88:	00050793          	mv	a5,a0
    2d8c:	f8f41823          	sh	a5,-112(s0)
    2d90:	fec42783          	lw	a5,-20(s0)
    2d94:	00178793          	add	a5,a5,1
    2d98:	fef42623          	sw	a5,-20(s0)
    2d9c:	fec42703          	lw	a4,-20(s0)
    2da0:	00700793          	li	a5,7
    2da4:	f8e7fae3          	bgeu	a5,a4,2d38 <core_bench_state+0x224>
    2da8:	f9045783          	lhu	a5,-112(s0)
    2dac:	00078513          	mv	a0,a5
    2db0:	06c12083          	lw	ra,108(sp)
    2db4:	06812403          	lw	s0,104(sp)
    2db8:	07010113          	add	sp,sp,112
    2dbc:	00008067          	ret

00002dc0 <core_init_state>:
    2dc0:	fd010113          	add	sp,sp,-48
    2dc4:	02812623          	sw	s0,44(sp)
    2dc8:	03010413          	add	s0,sp,48
    2dcc:	fca42e23          	sw	a0,-36(s0)
    2dd0:	00058793          	mv	a5,a1
    2dd4:	fcc42a23          	sw	a2,-44(s0)
    2dd8:	fcf41d23          	sh	a5,-38(s0)
    2ddc:	fe042623          	sw	zero,-20(s0)
    2de0:	fe042423          	sw	zero,-24(s0)
    2de4:	fe042023          	sw	zero,-32(s0)
    2de8:	fdc42783          	lw	a5,-36(s0)
    2dec:	fff78793          	add	a5,a5,-1
    2df0:	fcf42e23          	sw	a5,-36(s0)
    2df4:	fe042423          	sw	zero,-24(s0)
    2df8:	1dc0006f          	j	2fd4 <core_init_state+0x214>
    2dfc:	fe842783          	lw	a5,-24(s0)
    2e00:	06078e63          	beqz	a5,2e7c <core_init_state+0xbc>
    2e04:	fe042223          	sw	zero,-28(s0)
    2e08:	0380006f          	j	2e40 <core_init_state+0x80>
    2e0c:	fe042703          	lw	a4,-32(s0)
    2e10:	fe442783          	lw	a5,-28(s0)
    2e14:	00f70733          	add	a4,a4,a5
    2e18:	fec42683          	lw	a3,-20(s0)
    2e1c:	fe442783          	lw	a5,-28(s0)
    2e20:	00f687b3          	add	a5,a3,a5
    2e24:	fd442683          	lw	a3,-44(s0)
    2e28:	00f687b3          	add	a5,a3,a5
    2e2c:	00074703          	lbu	a4,0(a4)
    2e30:	00e78023          	sb	a4,0(a5)
    2e34:	fe442783          	lw	a5,-28(s0)
    2e38:	00178793          	add	a5,a5,1
    2e3c:	fef42223          	sw	a5,-28(s0)
    2e40:	fe442703          	lw	a4,-28(s0)
    2e44:	fe842783          	lw	a5,-24(s0)
    2e48:	fcf762e3          	bltu	a4,a5,2e0c <core_init_state+0x4c>
    2e4c:	fec42703          	lw	a4,-20(s0)
    2e50:	fe442783          	lw	a5,-28(s0)
    2e54:	00f707b3          	add	a5,a4,a5
    2e58:	fd442703          	lw	a4,-44(s0)
    2e5c:	00f707b3          	add	a5,a4,a5
    2e60:	02c00713          	li	a4,44
    2e64:	00e78023          	sb	a4,0(a5)
    2e68:	fe842703          	lw	a4,-24(s0)
    2e6c:	fec42783          	lw	a5,-20(s0)
    2e70:	00f707b3          	add	a5,a4,a5
    2e74:	00178793          	add	a5,a5,1
    2e78:	fef42623          	sw	a5,-20(s0)
    2e7c:	fda41783          	lh	a5,-38(s0)
    2e80:	01079793          	sll	a5,a5,0x10
    2e84:	0107d793          	srl	a5,a5,0x10
    2e88:	00178793          	add	a5,a5,1
    2e8c:	01079793          	sll	a5,a5,0x10
    2e90:	0107d793          	srl	a5,a5,0x10
    2e94:	fcf41d23          	sh	a5,-38(s0)
    2e98:	fda45783          	lhu	a5,-38(s0)
    2e9c:	0077f793          	and	a5,a5,7
    2ea0:	00700713          	li	a4,7
    2ea4:	0ee78863          	beq	a5,a4,2f94 <core_init_state+0x1d4>
    2ea8:	00700713          	li	a4,7
    2eac:	12f74263          	blt	a4,a5,2fd0 <core_init_state+0x210>
    2eb0:	00600713          	li	a4,6
    2eb4:	10f74e63          	blt	a4,a5,2fd0 <core_init_state+0x210>
    2eb8:	00500713          	li	a4,5
    2ebc:	08e7de63          	bge	a5,a4,2f58 <core_init_state+0x198>
    2ec0:	00200713          	li	a4,2
    2ec4:	00f74663          	blt	a4,a5,2ed0 <core_init_state+0x110>
    2ec8:	0007dc63          	bgez	a5,2ee0 <core_init_state+0x120>
    2ecc:	1040006f          	j	2fd0 <core_init_state+0x210>
    2ed0:	ffd78713          	add	a4,a5,-3
    2ed4:	00100793          	li	a5,1
    2ed8:	0ee7ec63          	bltu	a5,a4,2fd0 <core_init_state+0x210>
    2edc:	0400006f          	j	2f1c <core_init_state+0x15c>
    2ee0:	fda41783          	lh	a5,-38(s0)
    2ee4:	4037d793          	sra	a5,a5,0x3
    2ee8:	01079793          	sll	a5,a5,0x10
    2eec:	4107d793          	sra	a5,a5,0x10
    2ef0:	01079793          	sll	a5,a5,0x10
    2ef4:	0107d793          	srl	a5,a5,0x10
    2ef8:	0037f793          	and	a5,a5,3
    2efc:	48800713          	li	a4,1160
    2f00:	00279793          	sll	a5,a5,0x2
    2f04:	00f707b3          	add	a5,a4,a5
    2f08:	0007a783          	lw	a5,0(a5)
    2f0c:	fef42023          	sw	a5,-32(s0)
    2f10:	00400793          	li	a5,4
    2f14:	fef42423          	sw	a5,-24(s0)
    2f18:	0bc0006f          	j	2fd4 <core_init_state+0x214>
    2f1c:	fda41783          	lh	a5,-38(s0)
    2f20:	4037d793          	sra	a5,a5,0x3
    2f24:	01079793          	sll	a5,a5,0x10
    2f28:	4107d793          	sra	a5,a5,0x10
    2f2c:	01079793          	sll	a5,a5,0x10
    2f30:	0107d793          	srl	a5,a5,0x10
    2f34:	0037f793          	and	a5,a5,3
    2f38:	49800713          	li	a4,1176
    2f3c:	00279793          	sll	a5,a5,0x2
    2f40:	00f707b3          	add	a5,a4,a5
    2f44:	0007a783          	lw	a5,0(a5)
    2f48:	fef42023          	sw	a5,-32(s0)
    2f4c:	00800793          	li	a5,8
    2f50:	fef42423          	sw	a5,-24(s0)
    2f54:	0800006f          	j	2fd4 <core_init_state+0x214>
    2f58:	fda41783          	lh	a5,-38(s0)
    2f5c:	4037d793          	sra	a5,a5,0x3
    2f60:	01079793          	sll	a5,a5,0x10
    2f64:	4107d793          	sra	a5,a5,0x10
    2f68:	01079793          	sll	a5,a5,0x10
    2f6c:	0107d793          	srl	a5,a5,0x10
    2f70:	0037f793          	and	a5,a5,3
    2f74:	4a800713          	li	a4,1192
    2f78:	00279793          	sll	a5,a5,0x2
    2f7c:	00f707b3          	add	a5,a4,a5
    2f80:	0007a783          	lw	a5,0(a5)
    2f84:	fef42023          	sw	a5,-32(s0)
    2f88:	00800793          	li	a5,8
    2f8c:	fef42423          	sw	a5,-24(s0)
    2f90:	0440006f          	j	2fd4 <core_init_state+0x214>
    2f94:	fda41783          	lh	a5,-38(s0)
    2f98:	4037d793          	sra	a5,a5,0x3
    2f9c:	01079793          	sll	a5,a5,0x10
    2fa0:	4107d793          	sra	a5,a5,0x10
    2fa4:	01079793          	sll	a5,a5,0x10
    2fa8:	0107d793          	srl	a5,a5,0x10
    2fac:	0037f793          	and	a5,a5,3
    2fb0:	4b800713          	li	a4,1208
    2fb4:	00279793          	sll	a5,a5,0x2
    2fb8:	00f707b3          	add	a5,a4,a5
    2fbc:	0007a783          	lw	a5,0(a5)
    2fc0:	fef42023          	sw	a5,-32(s0)
    2fc4:	00800793          	li	a5,8
    2fc8:	fef42423          	sw	a5,-24(s0)
    2fcc:	0080006f          	j	2fd4 <core_init_state+0x214>
    2fd0:	00000013          	nop
    2fd4:	fec42703          	lw	a4,-20(s0)
    2fd8:	fe842783          	lw	a5,-24(s0)
    2fdc:	00f707b3          	add	a5,a4,a5
    2fe0:	00178793          	add	a5,a5,1
    2fe4:	fdc42703          	lw	a4,-36(s0)
    2fe8:	e0e7eae3          	bltu	a5,a4,2dfc <core_init_state+0x3c>
    2fec:	fdc42783          	lw	a5,-36(s0)
    2ff0:	00178793          	add	a5,a5,1
    2ff4:	fcf42e23          	sw	a5,-36(s0)
    2ff8:	0200006f          	j	3018 <core_init_state+0x258>
    2ffc:	fd442703          	lw	a4,-44(s0)
    3000:	fec42783          	lw	a5,-20(s0)
    3004:	00f707b3          	add	a5,a4,a5
    3008:	00078023          	sb	zero,0(a5)
    300c:	fec42783          	lw	a5,-20(s0)
    3010:	00178793          	add	a5,a5,1
    3014:	fef42623          	sw	a5,-20(s0)
    3018:	fec42703          	lw	a4,-20(s0)
    301c:	fdc42783          	lw	a5,-36(s0)
    3020:	fcf76ee3          	bltu	a4,a5,2ffc <core_init_state+0x23c>
    3024:	00000013          	nop
    3028:	00000013          	nop
    302c:	02c12403          	lw	s0,44(sp)
    3030:	03010113          	add	sp,sp,48
    3034:	00008067          	ret

00003038 <ee_isdigit>:
    3038:	fd010113          	add	sp,sp,-48
    303c:	02812623          	sw	s0,44(sp)
    3040:	03010413          	add	s0,sp,48
    3044:	00050793          	mv	a5,a0
    3048:	fcf40fa3          	sb	a5,-33(s0)
    304c:	fdf44783          	lbu	a5,-33(s0)
    3050:	0307b793          	sltiu	a5,a5,48
    3054:	0017b793          	seqz	a5,a5
    3058:	0ff7f713          	zext.b	a4,a5
    305c:	fdf44783          	lbu	a5,-33(s0)
    3060:	03a7b793          	sltiu	a5,a5,58
    3064:	0ff7f793          	zext.b	a5,a5
    3068:	00f777b3          	and	a5,a4,a5
    306c:	0ff7f793          	zext.b	a5,a5
    3070:	fef407a3          	sb	a5,-17(s0)
    3074:	fef44783          	lbu	a5,-17(s0)
    3078:	00078513          	mv	a0,a5
    307c:	02c12403          	lw	s0,44(sp)
    3080:	03010113          	add	sp,sp,48
    3084:	00008067          	ret

00003088 <core_state_transition>:
    3088:	fd010113          	add	sp,sp,-48
    308c:	02112623          	sw	ra,44(sp)
    3090:	02812423          	sw	s0,40(sp)
    3094:	03010413          	add	s0,sp,48
    3098:	fca42e23          	sw	a0,-36(s0)
    309c:	fcb42c23          	sw	a1,-40(s0)
    30a0:	fdc42783          	lw	a5,-36(s0)
    30a4:	0007a783          	lw	a5,0(a5)
    30a8:	fef42623          	sw	a5,-20(s0)
    30ac:	fe042423          	sw	zero,-24(s0)
    30b0:	3340006f          	j	33e4 <core_state_transition+0x35c>
    30b4:	fec42783          	lw	a5,-20(s0)
    30b8:	0007c783          	lbu	a5,0(a5)
    30bc:	fef403a3          	sb	a5,-25(s0)
    30c0:	fe744703          	lbu	a4,-25(s0)
    30c4:	02c00793          	li	a5,44
    30c8:	00f71a63          	bne	a4,a5,30dc <core_state_transition+0x54>
    30cc:	fec42783          	lw	a5,-20(s0)
    30d0:	00178793          	add	a5,a5,1
    30d4:	fef42623          	sw	a5,-20(s0)
    30d8:	3240006f          	j	33fc <core_state_transition+0x374>
    30dc:	fe842703          	lw	a4,-24(s0)
    30e0:	00700793          	li	a5,7
    30e4:	2ce7ec63          	bltu	a5,a4,33bc <core_state_transition+0x334>
    30e8:	fe842783          	lw	a5,-24(s0)
    30ec:	00279713          	sll	a4,a5,0x2
    30f0:	57800793          	li	a5,1400
    30f4:	00f707b3          	add	a5,a4,a5
    30f8:	0007a783          	lw	a5,0(a5)
    30fc:	00078067          	jr	a5
    3100:	fe744783          	lbu	a5,-25(s0)
    3104:	00078513          	mv	a0,a5
    3108:	f31ff0ef          	jal	3038 <ee_isdigit>
    310c:	00050793          	mv	a5,a0
    3110:	00078863          	beqz	a5,3120 <core_state_transition+0x98>
    3114:	00400793          	li	a5,4
    3118:	fef42423          	sw	a5,-24(s0)
    311c:	05c0006f          	j	3178 <core_state_transition+0xf0>
    3120:	fe744703          	lbu	a4,-25(s0)
    3124:	02b00793          	li	a5,43
    3128:	00f70863          	beq	a4,a5,3138 <core_state_transition+0xb0>
    312c:	fe744703          	lbu	a4,-25(s0)
    3130:	02d00793          	li	a5,45
    3134:	00f71863          	bne	a4,a5,3144 <core_state_transition+0xbc>
    3138:	00200793          	li	a5,2
    313c:	fef42423          	sw	a5,-24(s0)
    3140:	0380006f          	j	3178 <core_state_transition+0xf0>
    3144:	fe744703          	lbu	a4,-25(s0)
    3148:	02e00793          	li	a5,46
    314c:	00f71863          	bne	a4,a5,315c <core_state_transition+0xd4>
    3150:	00500793          	li	a5,5
    3154:	fef42423          	sw	a5,-24(s0)
    3158:	0200006f          	j	3178 <core_state_transition+0xf0>
    315c:	00100793          	li	a5,1
    3160:	fef42423          	sw	a5,-24(s0)
    3164:	fd842783          	lw	a5,-40(s0)
    3168:	00478793          	add	a5,a5,4
    316c:	0007a703          	lw	a4,0(a5)
    3170:	00170713          	add	a4,a4,1
    3174:	00e7a023          	sw	a4,0(a5)
    3178:	fd842783          	lw	a5,-40(s0)
    317c:	0007a783          	lw	a5,0(a5)
    3180:	00178713          	add	a4,a5,1
    3184:	fd842783          	lw	a5,-40(s0)
    3188:	00e7a023          	sw	a4,0(a5)
    318c:	24c0006f          	j	33d8 <core_state_transition+0x350>
    3190:	fe744783          	lbu	a5,-25(s0)
    3194:	00078513          	mv	a0,a5
    3198:	ea1ff0ef          	jal	3038 <ee_isdigit>
    319c:	00050793          	mv	a5,a0
    31a0:	02078263          	beqz	a5,31c4 <core_state_transition+0x13c>
    31a4:	00400793          	li	a5,4
    31a8:	fef42423          	sw	a5,-24(s0)
    31ac:	fd842783          	lw	a5,-40(s0)
    31b0:	00878793          	add	a5,a5,8
    31b4:	0007a703          	lw	a4,0(a5)
    31b8:	00170713          	add	a4,a4,1
    31bc:	00e7a023          	sw	a4,0(a5)
    31c0:	2180006f          	j	33d8 <core_state_transition+0x350>
    31c4:	fe744703          	lbu	a4,-25(s0)
    31c8:	02e00793          	li	a5,46
    31cc:	02f71263          	bne	a4,a5,31f0 <core_state_transition+0x168>
    31d0:	00500793          	li	a5,5
    31d4:	fef42423          	sw	a5,-24(s0)
    31d8:	fd842783          	lw	a5,-40(s0)
    31dc:	00878793          	add	a5,a5,8
    31e0:	0007a703          	lw	a4,0(a5)
    31e4:	00170713          	add	a4,a4,1
    31e8:	00e7a023          	sw	a4,0(a5)
    31ec:	1ec0006f          	j	33d8 <core_state_transition+0x350>
    31f0:	00100793          	li	a5,1
    31f4:	fef42423          	sw	a5,-24(s0)
    31f8:	fd842783          	lw	a5,-40(s0)
    31fc:	00878793          	add	a5,a5,8
    3200:	0007a703          	lw	a4,0(a5)
    3204:	00170713          	add	a4,a4,1
    3208:	00e7a023          	sw	a4,0(a5)
    320c:	1cc0006f          	j	33d8 <core_state_transition+0x350>
    3210:	fe744703          	lbu	a4,-25(s0)
    3214:	02e00793          	li	a5,46
    3218:	02f71263          	bne	a4,a5,323c <core_state_transition+0x1b4>
    321c:	00500793          	li	a5,5
    3220:	fef42423          	sw	a5,-24(s0)
    3224:	fd842783          	lw	a5,-40(s0)
    3228:	01078793          	add	a5,a5,16
    322c:	0007a703          	lw	a4,0(a5)
    3230:	00170713          	add	a4,a4,1
    3234:	00e7a023          	sw	a4,0(a5)
    3238:	18c0006f          	j	33c4 <core_state_transition+0x33c>
    323c:	fe744783          	lbu	a5,-25(s0)
    3240:	00078513          	mv	a0,a5
    3244:	df5ff0ef          	jal	3038 <ee_isdigit>
    3248:	00050793          	mv	a5,a0
    324c:	16079c63          	bnez	a5,33c4 <core_state_transition+0x33c>
    3250:	00100793          	li	a5,1
    3254:	fef42423          	sw	a5,-24(s0)
    3258:	fd842783          	lw	a5,-40(s0)
    325c:	01078793          	add	a5,a5,16
    3260:	0007a703          	lw	a4,0(a5)
    3264:	00170713          	add	a4,a4,1
    3268:	00e7a023          	sw	a4,0(a5)
    326c:	1580006f          	j	33c4 <core_state_transition+0x33c>
    3270:	fe744703          	lbu	a4,-25(s0)
    3274:	04500793          	li	a5,69
    3278:	00f70863          	beq	a4,a5,3288 <core_state_transition+0x200>
    327c:	fe744703          	lbu	a4,-25(s0)
    3280:	06500793          	li	a5,101
    3284:	02f71263          	bne	a4,a5,32a8 <core_state_transition+0x220>
    3288:	00300793          	li	a5,3
    328c:	fef42423          	sw	a5,-24(s0)
    3290:	fd842783          	lw	a5,-40(s0)
    3294:	01478793          	add	a5,a5,20
    3298:	0007a703          	lw	a4,0(a5)
    329c:	00170713          	add	a4,a4,1
    32a0:	00e7a023          	sw	a4,0(a5)
    32a4:	1280006f          	j	33cc <core_state_transition+0x344>
    32a8:	fe744783          	lbu	a5,-25(s0)
    32ac:	00078513          	mv	a0,a5
    32b0:	d89ff0ef          	jal	3038 <ee_isdigit>
    32b4:	00050793          	mv	a5,a0
    32b8:	10079a63          	bnez	a5,33cc <core_state_transition+0x344>
    32bc:	00100793          	li	a5,1
    32c0:	fef42423          	sw	a5,-24(s0)
    32c4:	fd842783          	lw	a5,-40(s0)
    32c8:	01478793          	add	a5,a5,20
    32cc:	0007a703          	lw	a4,0(a5)
    32d0:	00170713          	add	a4,a4,1
    32d4:	00e7a023          	sw	a4,0(a5)
    32d8:	0f40006f          	j	33cc <core_state_transition+0x344>
    32dc:	fe744703          	lbu	a4,-25(s0)
    32e0:	02b00793          	li	a5,43
    32e4:	00f70863          	beq	a4,a5,32f4 <core_state_transition+0x26c>
    32e8:	fe744703          	lbu	a4,-25(s0)
    32ec:	02d00793          	li	a5,45
    32f0:	02f71263          	bne	a4,a5,3314 <core_state_transition+0x28c>
    32f4:	00600793          	li	a5,6
    32f8:	fef42423          	sw	a5,-24(s0)
    32fc:	fd842783          	lw	a5,-40(s0)
    3300:	00c78793          	add	a5,a5,12
    3304:	0007a703          	lw	a4,0(a5)
    3308:	00170713          	add	a4,a4,1
    330c:	00e7a023          	sw	a4,0(a5)
    3310:	0c80006f          	j	33d8 <core_state_transition+0x350>
    3314:	00100793          	li	a5,1
    3318:	fef42423          	sw	a5,-24(s0)
    331c:	fd842783          	lw	a5,-40(s0)
    3320:	00c78793          	add	a5,a5,12
    3324:	0007a703          	lw	a4,0(a5)
    3328:	00170713          	add	a4,a4,1
    332c:	00e7a023          	sw	a4,0(a5)
    3330:	0a80006f          	j	33d8 <core_state_transition+0x350>
    3334:	fe744783          	lbu	a5,-25(s0)
    3338:	00078513          	mv	a0,a5
    333c:	cfdff0ef          	jal	3038 <ee_isdigit>
    3340:	00050793          	mv	a5,a0
    3344:	02078263          	beqz	a5,3368 <core_state_transition+0x2e0>
    3348:	00700793          	li	a5,7
    334c:	fef42423          	sw	a5,-24(s0)
    3350:	fd842783          	lw	a5,-40(s0)
    3354:	01878793          	add	a5,a5,24
    3358:	0007a703          	lw	a4,0(a5)
    335c:	00170713          	add	a4,a4,1
    3360:	00e7a023          	sw	a4,0(a5)
    3364:	0740006f          	j	33d8 <core_state_transition+0x350>
    3368:	00100793          	li	a5,1
    336c:	fef42423          	sw	a5,-24(s0)
    3370:	fd842783          	lw	a5,-40(s0)
    3374:	01878793          	add	a5,a5,24
    3378:	0007a703          	lw	a4,0(a5)
    337c:	00170713          	add	a4,a4,1
    3380:	00e7a023          	sw	a4,0(a5)
    3384:	0540006f          	j	33d8 <core_state_transition+0x350>
    3388:	fe744783          	lbu	a5,-25(s0)
    338c:	00078513          	mv	a0,a5
    3390:	ca9ff0ef          	jal	3038 <ee_isdigit>
    3394:	00050793          	mv	a5,a0
    3398:	02079e63          	bnez	a5,33d4 <core_state_transition+0x34c>
    339c:	00100793          	li	a5,1
    33a0:	fef42423          	sw	a5,-24(s0)
    33a4:	fd842783          	lw	a5,-40(s0)
    33a8:	00478793          	add	a5,a5,4
    33ac:	0007a703          	lw	a4,0(a5)
    33b0:	00170713          	add	a4,a4,1
    33b4:	00e7a023          	sw	a4,0(a5)
    33b8:	01c0006f          	j	33d4 <core_state_transition+0x34c>
    33bc:	00000013          	nop
    33c0:	0180006f          	j	33d8 <core_state_transition+0x350>
    33c4:	00000013          	nop
    33c8:	0100006f          	j	33d8 <core_state_transition+0x350>
    33cc:	00000013          	nop
    33d0:	0080006f          	j	33d8 <core_state_transition+0x350>
    33d4:	00000013          	nop
    33d8:	fec42783          	lw	a5,-20(s0)
    33dc:	00178793          	add	a5,a5,1
    33e0:	fef42623          	sw	a5,-20(s0)
    33e4:	fec42783          	lw	a5,-20(s0)
    33e8:	0007c783          	lbu	a5,0(a5)
    33ec:	00078863          	beqz	a5,33fc <core_state_transition+0x374>
    33f0:	fe842703          	lw	a4,-24(s0)
    33f4:	00100793          	li	a5,1
    33f8:	caf71ee3          	bne	a4,a5,30b4 <core_state_transition+0x2c>
    33fc:	fdc42783          	lw	a5,-36(s0)
    3400:	fec42703          	lw	a4,-20(s0)
    3404:	00e7a023          	sw	a4,0(a5)
    3408:	fe842783          	lw	a5,-24(s0)
    340c:	00078513          	mv	a0,a5
    3410:	02c12083          	lw	ra,44(sp)
    3414:	02812403          	lw	s0,40(sp)
    3418:	03010113          	add	sp,sp,48
    341c:	00008067          	ret

00003420 <get_seed_32>:
    3420:	fd010113          	add	sp,sp,-48
    3424:	02812623          	sw	s0,44(sp)
    3428:	03010413          	add	s0,sp,48
    342c:	fca42e23          	sw	a0,-36(s0)
    3430:	fdc42703          	lw	a4,-36(s0)
    3434:	00500793          	li	a5,5
    3438:	06e7e263          	bltu	a5,a4,349c <get_seed_32+0x7c>
    343c:	fdc42783          	lw	a5,-36(s0)
    3440:	00279713          	sll	a4,a5,0x2
    3444:	59800793          	li	a5,1432
    3448:	00f707b3          	add	a5,a4,a5
    344c:	0007a783          	lw	a5,0(a5)
    3450:	00078067          	jr	a5
    3454:	000017b7          	lui	a5,0x1
    3458:	9347a783          	lw	a5,-1740(a5) # 934 <seed1_volatile>
    345c:	fef42623          	sw	a5,-20(s0)
    3460:	0440006f          	j	34a4 <get_seed_32+0x84>
    3464:	000017b7          	lui	a5,0x1
    3468:	9387a783          	lw	a5,-1736(a5) # 938 <seed2_volatile>
    346c:	fef42623          	sw	a5,-20(s0)
    3470:	0340006f          	j	34a4 <get_seed_32+0x84>
    3474:	5e802783          	lw	a5,1512(zero) # 5e8 <seed3_volatile>
    3478:	fef42623          	sw	a5,-20(s0)
    347c:	0280006f          	j	34a4 <get_seed_32+0x84>
    3480:	5ec02783          	lw	a5,1516(zero) # 5ec <seed4_volatile>
    3484:	fef42623          	sw	a5,-20(s0)
    3488:	01c0006f          	j	34a4 <get_seed_32+0x84>
    348c:	000017b7          	lui	a5,0x1
    3490:	93c7a783          	lw	a5,-1732(a5) # 93c <seed5_volatile>
    3494:	fef42623          	sw	a5,-20(s0)
    3498:	00c0006f          	j	34a4 <get_seed_32+0x84>
    349c:	fe042623          	sw	zero,-20(s0)
    34a0:	00000013          	nop
    34a4:	fec42783          	lw	a5,-20(s0)
    34a8:	00078513          	mv	a0,a5
    34ac:	02c12403          	lw	s0,44(sp)
    34b0:	03010113          	add	sp,sp,48
    34b4:	00008067          	ret

000034b8 <crcu8>:
    34b8:	fd010113          	add	sp,sp,-48
    34bc:	02812623          	sw	s0,44(sp)
    34c0:	03010413          	add	s0,sp,48
    34c4:	00050793          	mv	a5,a0
    34c8:	00058713          	mv	a4,a1
    34cc:	fcf40fa3          	sb	a5,-33(s0)
    34d0:	00070793          	mv	a5,a4
    34d4:	fcf41e23          	sh	a5,-36(s0)
    34d8:	fe0407a3          	sb	zero,-17(s0)
    34dc:	fe0406a3          	sb	zero,-19(s0)
    34e0:	fe040723          	sb	zero,-18(s0)
    34e4:	fe0407a3          	sb	zero,-17(s0)
    34e8:	0bc0006f          	j	35a4 <crcu8+0xec>
    34ec:	fdc45783          	lhu	a5,-36(s0)
    34f0:	01879713          	sll	a4,a5,0x18
    34f4:	41875713          	sra	a4,a4,0x18
    34f8:	fdf40783          	lb	a5,-33(s0)
    34fc:	00f747b3          	xor	a5,a4,a5
    3500:	01879793          	sll	a5,a5,0x18
    3504:	4187d793          	sra	a5,a5,0x18
    3508:	0ff7f793          	zext.b	a5,a5
    350c:	0017f793          	and	a5,a5,1
    3510:	fef406a3          	sb	a5,-19(s0)
    3514:	fdf44783          	lbu	a5,-33(s0)
    3518:	0017d793          	srl	a5,a5,0x1
    351c:	fcf40fa3          	sb	a5,-33(s0)
    3520:	fed44703          	lbu	a4,-19(s0)
    3524:	00100793          	li	a5,1
    3528:	02f71463          	bne	a4,a5,3550 <crcu8+0x98>
    352c:	fdc45783          	lhu	a5,-36(s0)
    3530:	00078713          	mv	a4,a5
    3534:	000047b7          	lui	a5,0x4
    3538:	00278793          	add	a5,a5,2 # 4002 <_trap_stack_ptr+0x2>
    353c:	00f747b3          	xor	a5,a4,a5
    3540:	fcf41e23          	sh	a5,-36(s0)
    3544:	00100793          	li	a5,1
    3548:	fef40723          	sb	a5,-18(s0)
    354c:	0080006f          	j	3554 <crcu8+0x9c>
    3550:	fe040723          	sb	zero,-18(s0)
    3554:	fdc45783          	lhu	a5,-36(s0)
    3558:	0017d793          	srl	a5,a5,0x1
    355c:	fcf41e23          	sh	a5,-36(s0)
    3560:	fee44783          	lbu	a5,-18(s0)
    3564:	00078e63          	beqz	a5,3580 <crcu8+0xc8>
    3568:	fdc45783          	lhu	a5,-36(s0)
    356c:	00078713          	mv	a4,a5
    3570:	ffff87b7          	lui	a5,0xffff8
    3574:	00f767b3          	or	a5,a4,a5
    3578:	fcf41e23          	sh	a5,-36(s0)
    357c:	01c0006f          	j	3598 <crcu8+0xe0>
    3580:	fdc45783          	lhu	a5,-36(s0)
    3584:	00078713          	mv	a4,a5
    3588:	000087b7          	lui	a5,0x8
    358c:	fff78793          	add	a5,a5,-1 # 7fff <__subdf3+0x927>
    3590:	00f777b3          	and	a5,a4,a5
    3594:	fcf41e23          	sh	a5,-36(s0)
    3598:	fef44783          	lbu	a5,-17(s0)
    359c:	00178793          	add	a5,a5,1
    35a0:	fef407a3          	sb	a5,-17(s0)
    35a4:	fef44703          	lbu	a4,-17(s0)
    35a8:	00700793          	li	a5,7
    35ac:	f4e7f0e3          	bgeu	a5,a4,34ec <crcu8+0x34>
    35b0:	fdc45783          	lhu	a5,-36(s0)
    35b4:	00078513          	mv	a0,a5
    35b8:	02c12403          	lw	s0,44(sp)
    35bc:	03010113          	add	sp,sp,48
    35c0:	00008067          	ret

000035c4 <crcu16>:
    35c4:	fe010113          	add	sp,sp,-32
    35c8:	00112e23          	sw	ra,28(sp)
    35cc:	00812c23          	sw	s0,24(sp)
    35d0:	02010413          	add	s0,sp,32
    35d4:	00050793          	mv	a5,a0
    35d8:	00058713          	mv	a4,a1
    35dc:	fef41723          	sh	a5,-18(s0)
    35e0:	00070793          	mv	a5,a4
    35e4:	fef41623          	sh	a5,-20(s0)
    35e8:	fee45783          	lhu	a5,-18(s0)
    35ec:	0ff7f793          	zext.b	a5,a5
    35f0:	fec45703          	lhu	a4,-20(s0)
    35f4:	00070593          	mv	a1,a4
    35f8:	00078513          	mv	a0,a5
    35fc:	ebdff0ef          	jal	34b8 <crcu8>
    3600:	00050793          	mv	a5,a0
    3604:	fef41623          	sh	a5,-20(s0)
    3608:	fee45783          	lhu	a5,-18(s0)
    360c:	0087d793          	srl	a5,a5,0x8
    3610:	01079793          	sll	a5,a5,0x10
    3614:	0107d793          	srl	a5,a5,0x10
    3618:	0ff7f793          	zext.b	a5,a5
    361c:	fec45703          	lhu	a4,-20(s0)
    3620:	00070593          	mv	a1,a4
    3624:	00078513          	mv	a0,a5
    3628:	e91ff0ef          	jal	34b8 <crcu8>
    362c:	00050793          	mv	a5,a0
    3630:	fef41623          	sh	a5,-20(s0)
    3634:	fec45783          	lhu	a5,-20(s0)
    3638:	00078513          	mv	a0,a5
    363c:	01c12083          	lw	ra,28(sp)
    3640:	01812403          	lw	s0,24(sp)
    3644:	02010113          	add	sp,sp,32
    3648:	00008067          	ret

0000364c <crcu32>:
    364c:	fe010113          	add	sp,sp,-32
    3650:	00112e23          	sw	ra,28(sp)
    3654:	00812c23          	sw	s0,24(sp)
    3658:	02010413          	add	s0,sp,32
    365c:	fea42623          	sw	a0,-20(s0)
    3660:	00058793          	mv	a5,a1
    3664:	fef41523          	sh	a5,-22(s0)
    3668:	fec42783          	lw	a5,-20(s0)
    366c:	01079793          	sll	a5,a5,0x10
    3670:	4107d793          	sra	a5,a5,0x10
    3674:	fea45703          	lhu	a4,-22(s0)
    3678:	00070593          	mv	a1,a4
    367c:	00078513          	mv	a0,a5
    3680:	04c000ef          	jal	36cc <crc16>
    3684:	00050793          	mv	a5,a0
    3688:	fef41523          	sh	a5,-22(s0)
    368c:	fec42783          	lw	a5,-20(s0)
    3690:	0107d793          	srl	a5,a5,0x10
    3694:	01079793          	sll	a5,a5,0x10
    3698:	4107d793          	sra	a5,a5,0x10
    369c:	fea45703          	lhu	a4,-22(s0)
    36a0:	00070593          	mv	a1,a4
    36a4:	00078513          	mv	a0,a5
    36a8:	024000ef          	jal	36cc <crc16>
    36ac:	00050793          	mv	a5,a0
    36b0:	fef41523          	sh	a5,-22(s0)
    36b4:	fea45783          	lhu	a5,-22(s0)
    36b8:	00078513          	mv	a0,a5
    36bc:	01c12083          	lw	ra,28(sp)
    36c0:	01812403          	lw	s0,24(sp)
    36c4:	02010113          	add	sp,sp,32
    36c8:	00008067          	ret

000036cc <crc16>:
    36cc:	fe010113          	add	sp,sp,-32
    36d0:	00112e23          	sw	ra,28(sp)
    36d4:	00812c23          	sw	s0,24(sp)
    36d8:	02010413          	add	s0,sp,32
    36dc:	00050793          	mv	a5,a0
    36e0:	00058713          	mv	a4,a1
    36e4:	fef41723          	sh	a5,-18(s0)
    36e8:	00070793          	mv	a5,a4
    36ec:	fef41623          	sh	a5,-20(s0)
    36f0:	fee45783          	lhu	a5,-18(s0)
    36f4:	fec45703          	lhu	a4,-20(s0)
    36f8:	00070593          	mv	a1,a4
    36fc:	00078513          	mv	a0,a5
    3700:	ec5ff0ef          	jal	35c4 <crcu16>
    3704:	00050793          	mv	a5,a0
    3708:	00078513          	mv	a0,a5
    370c:	01c12083          	lw	ra,28(sp)
    3710:	01812403          	lw	s0,24(sp)
    3714:	02010113          	add	sp,sp,32
    3718:	00008067          	ret

0000371c <check_data_types>:
    371c:	fe010113          	add	sp,sp,-32
    3720:	00112e23          	sw	ra,28(sp)
    3724:	00812c23          	sw	s0,24(sp)
    3728:	02010413          	add	s0,sp,32
    372c:	fe0407a3          	sb	zero,-17(s0)
    3730:	fef44783          	lbu	a5,-17(s0)
    3734:	00078663          	beqz	a5,3740 <check_data_types+0x24>
    3738:	5b000513          	li	a0,1456
    373c:	0f4020ef          	jal	5830 <ee_printf>
    3740:	fef44783          	lbu	a5,-17(s0)
    3744:	00078513          	mv	a0,a5
    3748:	01c12083          	lw	ra,28(sp)
    374c:	01812403          	lw	s0,24(sp)
    3750:	02010113          	add	sp,sp,32
    3754:	00008067          	ret

00003758 <barebones_clock>:
    3758:	fe010113          	add	sp,sp,-32
    375c:	00812e23          	sw	s0,28(sp)
    3760:	02010413          	add	s0,sp,32
    3764:	080007b7          	lui	a5,0x8000
    3768:	fef42623          	sw	a5,-20(s0)
    376c:	fec42783          	lw	a5,-20(s0)
    3770:	0007a783          	lw	a5,0(a5) # 8000000 <__subdf3+0x7ff8928>
    3774:	fef42423          	sw	a5,-24(s0)
    3778:	fe842783          	lw	a5,-24(s0)
    377c:	00078513          	mv	a0,a5
    3780:	01c12403          	lw	s0,28(sp)
    3784:	02010113          	add	sp,sp,32
    3788:	00008067          	ret

0000378c <start_time>:
    378c:	ff010113          	add	sp,sp,-16
    3790:	00112623          	sw	ra,12(sp)
    3794:	00812423          	sw	s0,8(sp)
    3798:	01010413          	add	s0,sp,16
    379c:	fbdff0ef          	jal	3758 <barebones_clock>
    37a0:	00050713          	mv	a4,a0
    37a4:	000017b7          	lui	a5,0x1
    37a8:	8ce7ae23          	sw	a4,-1828(a5) # 8dc <start_time_val>
    37ac:	00000013          	nop
    37b0:	00c12083          	lw	ra,12(sp)
    37b4:	00812403          	lw	s0,8(sp)
    37b8:	01010113          	add	sp,sp,16
    37bc:	00008067          	ret

000037c0 <stop_time>:
    37c0:	ff010113          	add	sp,sp,-16
    37c4:	00112623          	sw	ra,12(sp)
    37c8:	00812423          	sw	s0,8(sp)
    37cc:	01010413          	add	s0,sp,16
    37d0:	f89ff0ef          	jal	3758 <barebones_clock>
    37d4:	00050713          	mv	a4,a0
    37d8:	000017b7          	lui	a5,0x1
    37dc:	8ee7a023          	sw	a4,-1824(a5) # 8e0 <stop_time_val>
    37e0:	00000013          	nop
    37e4:	00c12083          	lw	ra,12(sp)
    37e8:	00812403          	lw	s0,8(sp)
    37ec:	01010113          	add	sp,sp,16
    37f0:	00008067          	ret

000037f4 <get_time>:
    37f4:	fe010113          	add	sp,sp,-32
    37f8:	00812e23          	sw	s0,28(sp)
    37fc:	02010413          	add	s0,sp,32
    3800:	000017b7          	lui	a5,0x1
    3804:	8e07a703          	lw	a4,-1824(a5) # 8e0 <stop_time_val>
    3808:	000017b7          	lui	a5,0x1
    380c:	8dc7a783          	lw	a5,-1828(a5) # 8dc <start_time_val>
    3810:	40f707b3          	sub	a5,a4,a5
    3814:	fef42623          	sw	a5,-20(s0)
    3818:	fec42783          	lw	a5,-20(s0)
    381c:	00078513          	mv	a0,a5
    3820:	01c12403          	lw	s0,28(sp)
    3824:	02010113          	add	sp,sp,32
    3828:	00008067          	ret

0000382c <time_in_secs>:
    382c:	fd010113          	add	sp,sp,-48
    3830:	02112623          	sw	ra,44(sp)
    3834:	02812423          	sw	s0,40(sp)
    3838:	03010413          	add	s0,sp,48
    383c:	fca42e23          	sw	a0,-36(s0)
    3840:	fdc42503          	lw	a0,-36(s0)
    3844:	35d030ef          	jal	73a0 <__floatunsidf>
    3848:	00050713          	mv	a4,a0
    384c:	00058793          	mv	a5,a1
    3850:	5f802603          	lw	a2,1528(zero) # 5f8 <default_num_contexts+0x8>
    3854:	5fc02683          	lw	a3,1532(zero) # 5fc <default_num_contexts+0xc>
    3858:	00070513          	mv	a0,a4
    385c:	00078593          	mv	a1,a5
    3860:	151020ef          	jal	61b0 <__divdf3>
    3864:	00050713          	mv	a4,a0
    3868:	00058793          	mv	a5,a1
    386c:	fee42423          	sw	a4,-24(s0)
    3870:	fef42623          	sw	a5,-20(s0)
    3874:	fe842703          	lw	a4,-24(s0)
    3878:	fec42783          	lw	a5,-20(s0)
    387c:	00070513          	mv	a0,a4
    3880:	00078593          	mv	a1,a5
    3884:	02c12083          	lw	ra,44(sp)
    3888:	02812403          	lw	s0,40(sp)
    388c:	03010113          	add	sp,sp,48
    3890:	00008067          	ret

00003894 <portable_init>:
    3894:	fd010113          	add	sp,sp,-48
    3898:	02812623          	sw	s0,44(sp)
    389c:	03010413          	add	s0,sp,48
    38a0:	fca42e23          	sw	a0,-36(s0)
    38a4:	fcb42c23          	sw	a1,-40(s0)
    38a8:	fcc42a23          	sw	a2,-44(s0)
    38ac:	060007b7          	lui	a5,0x6000
    38b0:	fef42623          	sw	a5,-20(s0)
    38b4:	fec42783          	lw	a5,-20(s0)
    38b8:	00c78793          	add	a5,a5,12 # 600000c <__subdf3+0x5ff8934>
    38bc:	0001c737          	lui	a4,0x1c
    38c0:	20070713          	add	a4,a4,512 # 1c200 <__subdf3+0x14b28>
    38c4:	00e7a023          	sw	a4,0(a5)
    38c8:	fec42783          	lw	a5,-20(s0)
    38cc:	01078793          	add	a5,a5,16
    38d0:	00100713          	li	a4,1
    38d4:	00e7a023          	sw	a4,0(a5)
    38d8:	fec42783          	lw	a5,-20(s0)
    38dc:	01478793          	add	a5,a5,20
    38e0:	00100713          	li	a4,1
    38e4:	00e7a023          	sw	a4,0(a5)
    38e8:	fdc42783          	lw	a5,-36(s0)
    38ec:	00100713          	li	a4,1
    38f0:	00e78023          	sb	a4,0(a5)
    38f4:	00000013          	nop
    38f8:	02c12403          	lw	s0,44(sp)
    38fc:	03010113          	add	sp,sp,48
    3900:	00008067          	ret

00003904 <portable_fini>:
    3904:	fe010113          	add	sp,sp,-32
    3908:	00812e23          	sw	s0,28(sp)
    390c:	02010413          	add	s0,sp,32
    3910:	fea42623          	sw	a0,-20(s0)
    3914:	fec42783          	lw	a5,-20(s0)
    3918:	00078023          	sb	zero,0(a5)
    391c:	00000013          	nop
    3920:	01c12403          	lw	s0,28(sp)
    3924:	02010113          	add	sp,sp,32
    3928:	00008067          	ret

0000392c <cvt>:
    392c:	fb010113          	add	sp,sp,-80
    3930:	04112623          	sw	ra,76(sp)
    3934:	04812423          	sw	s0,72(sp)
    3938:	05212223          	sw	s2,68(sp)
    393c:	05312023          	sw	s3,64(sp)
    3940:	05010413          	add	s0,sp,80
    3944:	fca42423          	sw	a0,-56(s0)
    3948:	fcb42623          	sw	a1,-52(s0)
    394c:	fcc42223          	sw	a2,-60(s0)
    3950:	fcd42023          	sw	a3,-64(s0)
    3954:	fae42e23          	sw	a4,-68(s0)
    3958:	faf42c23          	sw	a5,-72(s0)
    395c:	fb042a23          	sw	a6,-76(s0)
    3960:	fc442783          	lw	a5,-60(s0)
    3964:	0007d463          	bgez	a5,396c <cvt+0x40>
    3968:	fc042223          	sw	zero,-60(s0)
    396c:	fc442703          	lw	a4,-60(s0)
    3970:	04e00793          	li	a5,78
    3974:	00e7d663          	bge	a5,a4,3980 <cvt+0x54>
    3978:	04e00793          	li	a5,78
    397c:	fcf42223          	sw	a5,-60(s0)
    3980:	fe042623          	sw	zero,-20(s0)
    3984:	fbc42783          	lw	a5,-68(s0)
    3988:	0007a023          	sw	zero,0(a5)
    398c:	fb842783          	lw	a5,-72(s0)
    3990:	fef42423          	sw	a5,-24(s0)
    3994:	00000613          	li	a2,0
    3998:	00000693          	li	a3,0
    399c:	fc842503          	lw	a0,-56(s0)
    39a0:	fcc42583          	lw	a1,-52(s0)
    39a4:	124030ef          	jal	6ac8 <__ledf2>
    39a8:	00050793          	mv	a5,a0
    39ac:	0207d463          	bgez	a5,39d4 <cvt+0xa8>
    39b0:	fbc42783          	lw	a5,-68(s0)
    39b4:	00100713          	li	a4,1
    39b8:	00e7a023          	sw	a4,0(a5)
    39bc:	fc842903          	lw	s2,-56(s0)
    39c0:	fcc42703          	lw	a4,-52(s0)
    39c4:	800007b7          	lui	a5,0x80000
    39c8:	00f749b3          	xor	s3,a4,a5
    39cc:	fd242423          	sw	s2,-56(s0)
    39d0:	fd342623          	sw	s3,-52(s0)
    39d4:	fd840793          	add	a5,s0,-40
    39d8:	00078613          	mv	a2,a5
    39dc:	fc842503          	lw	a0,-56(s0)
    39e0:	fcc42583          	lw	a1,-52(s0)
    39e4:	2fd030ef          	jal	74e0 <modf>
    39e8:	fca42423          	sw	a0,-56(s0)
    39ec:	fcb42623          	sw	a1,-52(s0)
    39f0:	fb842783          	lw	a5,-72(s0)
    39f4:	05078793          	add	a5,a5,80 # 80000050 <__subdf3+0x7fff8978>
    39f8:	fef42223          	sw	a5,-28(s0)
    39fc:	fd842703          	lw	a4,-40(s0)
    3a00:	fdc42783          	lw	a5,-36(s0)
    3a04:	00000613          	li	a2,0
    3a08:	00000693          	li	a3,0
    3a0c:	00070513          	mv	a0,a4
    3a10:	00078593          	mv	a1,a5
    3a14:	729020ef          	jal	693c <__eqdf2>
    3a18:	00050793          	mv	a5,a0
    3a1c:	12078a63          	beqz	a5,3b50 <cvt+0x224>
    3a20:	fb842783          	lw	a5,-72(s0)
    3a24:	05078793          	add	a5,a5,80
    3a28:	fef42223          	sw	a5,-28(s0)
    3a2c:	0c80006f          	j	3af4 <cvt+0x1c8>
    3a30:	fd842703          	lw	a4,-40(s0)
    3a34:	fdc42783          	lw	a5,-36(s0)
    3a38:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3a3c:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3a40:	00070513          	mv	a0,a4
    3a44:	00078593          	mv	a1,a5
    3a48:	768020ef          	jal	61b0 <__divdf3>
    3a4c:	00050713          	mv	a4,a0
    3a50:	00058793          	mv	a5,a1
    3a54:	fd840693          	add	a3,s0,-40
    3a58:	00068613          	mv	a2,a3
    3a5c:	00070513          	mv	a0,a4
    3a60:	00078593          	mv	a1,a5
    3a64:	27d030ef          	jal	74e0 <modf>
    3a68:	00050713          	mv	a4,a0
    3a6c:	00058793          	mv	a5,a1
    3a70:	fce42823          	sw	a4,-48(s0)
    3a74:	fcf42a23          	sw	a5,-44(s0)
    3a78:	fd042703          	lw	a4,-48(s0)
    3a7c:	fd442783          	lw	a5,-44(s0)
    3a80:	60802603          	lw	a2,1544(zero) # 608 <default_num_contexts+0x18>
    3a84:	60c02683          	lw	a3,1548(zero) # 60c <default_num_contexts+0x1c>
    3a88:	00070513          	mv	a0,a4
    3a8c:	00078593          	mv	a1,a5
    3a90:	659010ef          	jal	58e8 <__adddf3>
    3a94:	00050713          	mv	a4,a0
    3a98:	00058793          	mv	a5,a1
    3a9c:	00070513          	mv	a0,a4
    3aa0:	00078593          	mv	a1,a5
    3aa4:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3aa8:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3aac:	124030ef          	jal	6bd0 <__muldf3>
    3ab0:	00050713          	mv	a4,a0
    3ab4:	00058793          	mv	a5,a1
    3ab8:	00070513          	mv	a0,a4
    3abc:	00078593          	mv	a1,a5
    3ac0:	7e8030ef          	jal	72a8 <__fixdfsi>
    3ac4:	00050793          	mv	a5,a0
    3ac8:	0ff7f793          	zext.b	a5,a5
    3acc:	fe442703          	lw	a4,-28(s0)
    3ad0:	fff70713          	add	a4,a4,-1
    3ad4:	fee42223          	sw	a4,-28(s0)
    3ad8:	03078793          	add	a5,a5,48
    3adc:	0ff7f713          	zext.b	a4,a5
    3ae0:	fe442783          	lw	a5,-28(s0)
    3ae4:	00e78023          	sb	a4,0(a5)
    3ae8:	fec42783          	lw	a5,-20(s0)
    3aec:	00178793          	add	a5,a5,1
    3af0:	fef42623          	sw	a5,-20(s0)
    3af4:	fd842703          	lw	a4,-40(s0)
    3af8:	fdc42783          	lw	a5,-36(s0)
    3afc:	00000613          	li	a2,0
    3b00:	00000693          	li	a3,0
    3b04:	00070513          	mv	a0,a4
    3b08:	00078593          	mv	a1,a5
    3b0c:	631020ef          	jal	693c <__eqdf2>
    3b10:	00050793          	mv	a5,a0
    3b14:	f0079ee3          	bnez	a5,3a30 <cvt+0x104>
    3b18:	0240006f          	j	3b3c <cvt+0x210>
    3b1c:	fe442703          	lw	a4,-28(s0)
    3b20:	00170793          	add	a5,a4,1
    3b24:	fef42223          	sw	a5,-28(s0)
    3b28:	fe842783          	lw	a5,-24(s0)
    3b2c:	00178693          	add	a3,a5,1
    3b30:	fed42423          	sw	a3,-24(s0)
    3b34:	00074703          	lbu	a4,0(a4)
    3b38:	00e78023          	sb	a4,0(a5)
    3b3c:	fb842783          	lw	a5,-72(s0)
    3b40:	05078793          	add	a5,a5,80
    3b44:	fe442703          	lw	a4,-28(s0)
    3b48:	fcf76ae3          	bltu	a4,a5,3b1c <cvt+0x1f0>
    3b4c:	0880006f          	j	3bd4 <cvt+0x2a8>
    3b50:	00000613          	li	a2,0
    3b54:	00000693          	li	a3,0
    3b58:	fc842503          	lw	a0,-56(s0)
    3b5c:	fcc42583          	lw	a1,-52(s0)
    3b60:	669020ef          	jal	69c8 <__gedf2>
    3b64:	00050793          	mv	a5,a0
    3b68:	06f05663          	blez	a5,3bd4 <cvt+0x2a8>
    3b6c:	0200006f          	j	3b8c <cvt+0x260>
    3b70:	fd042703          	lw	a4,-48(s0)
    3b74:	fd442783          	lw	a5,-44(s0)
    3b78:	fce42423          	sw	a4,-56(s0)
    3b7c:	fcf42623          	sw	a5,-52(s0)
    3b80:	fec42783          	lw	a5,-20(s0)
    3b84:	fff78793          	add	a5,a5,-1
    3b88:	fef42623          	sw	a5,-20(s0)
    3b8c:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3b90:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3b94:	fc842503          	lw	a0,-56(s0)
    3b98:	fcc42583          	lw	a1,-52(s0)
    3b9c:	034030ef          	jal	6bd0 <__muldf3>
    3ba0:	00050713          	mv	a4,a0
    3ba4:	00058793          	mv	a5,a1
    3ba8:	fce42823          	sw	a4,-48(s0)
    3bac:	fcf42a23          	sw	a5,-44(s0)
    3bb0:	fd042703          	lw	a4,-48(s0)
    3bb4:	fd442783          	lw	a5,-44(s0)
    3bb8:	61002603          	lw	a2,1552(zero) # 610 <default_num_contexts+0x20>
    3bbc:	61402683          	lw	a3,1556(zero) # 614 <default_num_contexts+0x24>
    3bc0:	00070513          	mv	a0,a4
    3bc4:	00078593          	mv	a1,a5
    3bc8:	701020ef          	jal	6ac8 <__ledf2>
    3bcc:	00050793          	mv	a5,a0
    3bd0:	fa07c0e3          	bltz	a5,3b70 <cvt+0x244>
    3bd4:	fc442783          	lw	a5,-60(s0)
    3bd8:	fb842703          	lw	a4,-72(s0)
    3bdc:	00f707b3          	add	a5,a4,a5
    3be0:	fef42223          	sw	a5,-28(s0)
    3be4:	fb442783          	lw	a5,-76(s0)
    3be8:	00079a63          	bnez	a5,3bfc <cvt+0x2d0>
    3bec:	fec42783          	lw	a5,-20(s0)
    3bf0:	fe442703          	lw	a4,-28(s0)
    3bf4:	00f707b3          	add	a5,a4,a5
    3bf8:	fef42223          	sw	a5,-28(s0)
    3bfc:	fc042783          	lw	a5,-64(s0)
    3c00:	fec42703          	lw	a4,-20(s0)
    3c04:	00e7a023          	sw	a4,0(a5)
    3c08:	fe442703          	lw	a4,-28(s0)
    3c0c:	fb842783          	lw	a5,-72(s0)
    3c10:	08f77463          	bgeu	a4,a5,3c98 <cvt+0x36c>
    3c14:	fb842783          	lw	a5,-72(s0)
    3c18:	00078023          	sb	zero,0(a5)
    3c1c:	fb842783          	lw	a5,-72(s0)
    3c20:	1840006f          	j	3da4 <cvt+0x478>
    3c24:	60002603          	lw	a2,1536(zero) # 600 <default_num_contexts+0x10>
    3c28:	60402683          	lw	a3,1540(zero) # 604 <default_num_contexts+0x14>
    3c2c:	fc842503          	lw	a0,-56(s0)
    3c30:	fcc42583          	lw	a1,-52(s0)
    3c34:	79d020ef          	jal	6bd0 <__muldf3>
    3c38:	00050713          	mv	a4,a0
    3c3c:	00058793          	mv	a5,a1
    3c40:	fce42423          	sw	a4,-56(s0)
    3c44:	fcf42623          	sw	a5,-52(s0)
    3c48:	fd040793          	add	a5,s0,-48
    3c4c:	00078613          	mv	a2,a5
    3c50:	fc842503          	lw	a0,-56(s0)
    3c54:	fcc42583          	lw	a1,-52(s0)
    3c58:	089030ef          	jal	74e0 <modf>
    3c5c:	fca42423          	sw	a0,-56(s0)
    3c60:	fcb42623          	sw	a1,-52(s0)
    3c64:	fd042703          	lw	a4,-48(s0)
    3c68:	fd442783          	lw	a5,-44(s0)
    3c6c:	00070513          	mv	a0,a4
    3c70:	00078593          	mv	a1,a5
    3c74:	634030ef          	jal	72a8 <__fixdfsi>
    3c78:	00050793          	mv	a5,a0
    3c7c:	0ff7f713          	zext.b	a4,a5
    3c80:	fe842783          	lw	a5,-24(s0)
    3c84:	00178693          	add	a3,a5,1
    3c88:	fed42423          	sw	a3,-24(s0)
    3c8c:	03070713          	add	a4,a4,48
    3c90:	0ff77713          	zext.b	a4,a4
    3c94:	00e78023          	sb	a4,0(a5)
    3c98:	fe842703          	lw	a4,-24(s0)
    3c9c:	fe442783          	lw	a5,-28(s0)
    3ca0:	00e7ea63          	bltu	a5,a4,3cb4 <cvt+0x388>
    3ca4:	fb842783          	lw	a5,-72(s0)
    3ca8:	05078793          	add	a5,a5,80
    3cac:	fe842703          	lw	a4,-24(s0)
    3cb0:	f6f76ae3          	bltu	a4,a5,3c24 <cvt+0x2f8>
    3cb4:	fb842783          	lw	a5,-72(s0)
    3cb8:	05078793          	add	a5,a5,80
    3cbc:	fe442703          	lw	a4,-28(s0)
    3cc0:	00f76c63          	bltu	a4,a5,3cd8 <cvt+0x3ac>
    3cc4:	fb842783          	lw	a5,-72(s0)
    3cc8:	04f78793          	add	a5,a5,79
    3ccc:	00078023          	sb	zero,0(a5)
    3cd0:	fb842783          	lw	a5,-72(s0)
    3cd4:	0d00006f          	j	3da4 <cvt+0x478>
    3cd8:	fe442783          	lw	a5,-28(s0)
    3cdc:	fef42423          	sw	a5,-24(s0)
    3ce0:	fe442783          	lw	a5,-28(s0)
    3ce4:	0007c783          	lbu	a5,0(a5)
    3ce8:	00578793          	add	a5,a5,5
    3cec:	0ff7f713          	zext.b	a4,a5
    3cf0:	fe442783          	lw	a5,-28(s0)
    3cf4:	00e78023          	sb	a4,0(a5)
    3cf8:	0900006f          	j	3d88 <cvt+0x45c>
    3cfc:	fe442783          	lw	a5,-28(s0)
    3d00:	03000713          	li	a4,48
    3d04:	00e78023          	sb	a4,0(a5)
    3d08:	fe442703          	lw	a4,-28(s0)
    3d0c:	fb842783          	lw	a5,-72(s0)
    3d10:	02e7f663          	bgeu	a5,a4,3d3c <cvt+0x410>
    3d14:	fe442783          	lw	a5,-28(s0)
    3d18:	fff78793          	add	a5,a5,-1
    3d1c:	fef42223          	sw	a5,-28(s0)
    3d20:	fe442783          	lw	a5,-28(s0)
    3d24:	0007c783          	lbu	a5,0(a5)
    3d28:	00178793          	add	a5,a5,1
    3d2c:	0ff7f713          	zext.b	a4,a5
    3d30:	fe442783          	lw	a5,-28(s0)
    3d34:	00e78023          	sb	a4,0(a5)
    3d38:	0500006f          	j	3d88 <cvt+0x45c>
    3d3c:	fe442783          	lw	a5,-28(s0)
    3d40:	03100713          	li	a4,49
    3d44:	00e78023          	sb	a4,0(a5)
    3d48:	fc042783          	lw	a5,-64(s0)
    3d4c:	0007a783          	lw	a5,0(a5)
    3d50:	00178713          	add	a4,a5,1
    3d54:	fc042783          	lw	a5,-64(s0)
    3d58:	00e7a023          	sw	a4,0(a5)
    3d5c:	fb442783          	lw	a5,-76(s0)
    3d60:	02079463          	bnez	a5,3d88 <cvt+0x45c>
    3d64:	fe842703          	lw	a4,-24(s0)
    3d68:	fb842783          	lw	a5,-72(s0)
    3d6c:	00e7f863          	bgeu	a5,a4,3d7c <cvt+0x450>
    3d70:	fe842783          	lw	a5,-24(s0)
    3d74:	03000713          	li	a4,48
    3d78:	00e78023          	sb	a4,0(a5)
    3d7c:	fe842783          	lw	a5,-24(s0)
    3d80:	00178793          	add	a5,a5,1
    3d84:	fef42423          	sw	a5,-24(s0)
    3d88:	fe442783          	lw	a5,-28(s0)
    3d8c:	0007c703          	lbu	a4,0(a5)
    3d90:	03900793          	li	a5,57
    3d94:	f6e7e4e3          	bltu	a5,a4,3cfc <cvt+0x3d0>
    3d98:	fe842783          	lw	a5,-24(s0)
    3d9c:	00078023          	sb	zero,0(a5)
    3da0:	fb842783          	lw	a5,-72(s0)
    3da4:	00078513          	mv	a0,a5
    3da8:	04c12083          	lw	ra,76(sp)
    3dac:	04812403          	lw	s0,72(sp)
    3db0:	04412903          	lw	s2,68(sp)
    3db4:	04012983          	lw	s3,64(sp)
    3db8:	05010113          	add	sp,sp,80
    3dbc:	00008067          	ret

00003dc0 <ecvt>:
    3dc0:	fd010113          	add	sp,sp,-48
    3dc4:	02112623          	sw	ra,44(sp)
    3dc8:	02812423          	sw	s0,40(sp)
    3dcc:	03010413          	add	s0,sp,48
    3dd0:	fea42423          	sw	a0,-24(s0)
    3dd4:	feb42623          	sw	a1,-20(s0)
    3dd8:	fec42223          	sw	a2,-28(s0)
    3ddc:	fed42023          	sw	a3,-32(s0)
    3de0:	fce42e23          	sw	a4,-36(s0)
    3de4:	00100813          	li	a6,1
    3de8:	000017b7          	lui	a5,0x1
    3dec:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    3df0:	fdc42703          	lw	a4,-36(s0)
    3df4:	fe042683          	lw	a3,-32(s0)
    3df8:	fe442603          	lw	a2,-28(s0)
    3dfc:	fe842503          	lw	a0,-24(s0)
    3e00:	fec42583          	lw	a1,-20(s0)
    3e04:	b29ff0ef          	jal	392c <cvt>
    3e08:	00050793          	mv	a5,a0
    3e0c:	00078513          	mv	a0,a5
    3e10:	02c12083          	lw	ra,44(sp)
    3e14:	02812403          	lw	s0,40(sp)
    3e18:	03010113          	add	sp,sp,48
    3e1c:	00008067          	ret

00003e20 <ecvtbuf>:
    3e20:	fd010113          	add	sp,sp,-48
    3e24:	02112623          	sw	ra,44(sp)
    3e28:	02812423          	sw	s0,40(sp)
    3e2c:	03010413          	add	s0,sp,48
    3e30:	fea42423          	sw	a0,-24(s0)
    3e34:	feb42623          	sw	a1,-20(s0)
    3e38:	fec42223          	sw	a2,-28(s0)
    3e3c:	fed42023          	sw	a3,-32(s0)
    3e40:	fce42e23          	sw	a4,-36(s0)
    3e44:	fcf42c23          	sw	a5,-40(s0)
    3e48:	00100813          	li	a6,1
    3e4c:	fd842783          	lw	a5,-40(s0)
    3e50:	fdc42703          	lw	a4,-36(s0)
    3e54:	fe042683          	lw	a3,-32(s0)
    3e58:	fe442603          	lw	a2,-28(s0)
    3e5c:	fe842503          	lw	a0,-24(s0)
    3e60:	fec42583          	lw	a1,-20(s0)
    3e64:	ac9ff0ef          	jal	392c <cvt>
    3e68:	00050793          	mv	a5,a0
    3e6c:	00078513          	mv	a0,a5
    3e70:	02c12083          	lw	ra,44(sp)
    3e74:	02812403          	lw	s0,40(sp)
    3e78:	03010113          	add	sp,sp,48
    3e7c:	00008067          	ret

00003e80 <fcvt>:
    3e80:	fd010113          	add	sp,sp,-48
    3e84:	02112623          	sw	ra,44(sp)
    3e88:	02812423          	sw	s0,40(sp)
    3e8c:	03010413          	add	s0,sp,48
    3e90:	fea42423          	sw	a0,-24(s0)
    3e94:	feb42623          	sw	a1,-20(s0)
    3e98:	fec42223          	sw	a2,-28(s0)
    3e9c:	fed42023          	sw	a3,-32(s0)
    3ea0:	fce42e23          	sw	a4,-36(s0)
    3ea4:	00000813          	li	a6,0
    3ea8:	000017b7          	lui	a5,0x1
    3eac:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    3eb0:	fdc42703          	lw	a4,-36(s0)
    3eb4:	fe042683          	lw	a3,-32(s0)
    3eb8:	fe442603          	lw	a2,-28(s0)
    3ebc:	fe842503          	lw	a0,-24(s0)
    3ec0:	fec42583          	lw	a1,-20(s0)
    3ec4:	a69ff0ef          	jal	392c <cvt>
    3ec8:	00050793          	mv	a5,a0
    3ecc:	00078513          	mv	a0,a5
    3ed0:	02c12083          	lw	ra,44(sp)
    3ed4:	02812403          	lw	s0,40(sp)
    3ed8:	03010113          	add	sp,sp,48
    3edc:	00008067          	ret

00003ee0 <fcvtbuf>:
    3ee0:	fd010113          	add	sp,sp,-48
    3ee4:	02112623          	sw	ra,44(sp)
    3ee8:	02812423          	sw	s0,40(sp)
    3eec:	03010413          	add	s0,sp,48
    3ef0:	fea42423          	sw	a0,-24(s0)
    3ef4:	feb42623          	sw	a1,-20(s0)
    3ef8:	fec42223          	sw	a2,-28(s0)
    3efc:	fed42023          	sw	a3,-32(s0)
    3f00:	fce42e23          	sw	a4,-36(s0)
    3f04:	fcf42c23          	sw	a5,-40(s0)
    3f08:	00000813          	li	a6,0
    3f0c:	fd842783          	lw	a5,-40(s0)
    3f10:	fdc42703          	lw	a4,-36(s0)
    3f14:	fe042683          	lw	a3,-32(s0)
    3f18:	fe442603          	lw	a2,-28(s0)
    3f1c:	fe842503          	lw	a0,-24(s0)
    3f20:	fec42583          	lw	a1,-20(s0)
    3f24:	a09ff0ef          	jal	392c <cvt>
    3f28:	00050793          	mv	a5,a0
    3f2c:	00078513          	mv	a0,a5
    3f30:	02c12083          	lw	ra,44(sp)
    3f34:	02812403          	lw	s0,40(sp)
    3f38:	03010113          	add	sp,sp,48
    3f3c:	00008067          	ret

00003f40 <strnlen>:
    3f40:	fd010113          	add	sp,sp,-48
    3f44:	02812623          	sw	s0,44(sp)
    3f48:	03010413          	add	s0,sp,48
    3f4c:	fca42e23          	sw	a0,-36(s0)
    3f50:	fcb42c23          	sw	a1,-40(s0)
    3f54:	fdc42783          	lw	a5,-36(s0)
    3f58:	fef42623          	sw	a5,-20(s0)
    3f5c:	0100006f          	j	3f6c <strnlen+0x2c>
    3f60:	fec42783          	lw	a5,-20(s0)
    3f64:	00178793          	add	a5,a5,1
    3f68:	fef42623          	sw	a5,-20(s0)
    3f6c:	fec42783          	lw	a5,-20(s0)
    3f70:	0007c783          	lbu	a5,0(a5)
    3f74:	00078a63          	beqz	a5,3f88 <strnlen+0x48>
    3f78:	fd842783          	lw	a5,-40(s0)
    3f7c:	fff78713          	add	a4,a5,-1
    3f80:	fce42c23          	sw	a4,-40(s0)
    3f84:	fc079ee3          	bnez	a5,3f60 <strnlen+0x20>
    3f88:	fec42703          	lw	a4,-20(s0)
    3f8c:	fdc42783          	lw	a5,-36(s0)
    3f90:	40f707b3          	sub	a5,a4,a5
    3f94:	00078513          	mv	a0,a5
    3f98:	02c12403          	lw	s0,44(sp)
    3f9c:	03010113          	add	sp,sp,48
    3fa0:	00008067          	ret

00003fa4 <skip_atoi>:
    3fa4:	fd010113          	add	sp,sp,-48
    3fa8:	02812623          	sw	s0,44(sp)
    3fac:	03010413          	add	s0,sp,48
    3fb0:	fca42e23          	sw	a0,-36(s0)
    3fb4:	fe042623          	sw	zero,-20(s0)
    3fb8:	0400006f          	j	3ff8 <skip_atoi+0x54>
    3fbc:	fec42703          	lw	a4,-20(s0)
    3fc0:	00070793          	mv	a5,a4
    3fc4:	00279793          	sll	a5,a5,0x2
    3fc8:	00e787b3          	add	a5,a5,a4
    3fcc:	00179793          	sll	a5,a5,0x1
    3fd0:	00078613          	mv	a2,a5
    3fd4:	fdc42783          	lw	a5,-36(s0)
    3fd8:	0007a783          	lw	a5,0(a5)
    3fdc:	00178693          	add	a3,a5,1
    3fe0:	fdc42703          	lw	a4,-36(s0)
    3fe4:	00d72023          	sw	a3,0(a4)
    3fe8:	0007c783          	lbu	a5,0(a5)
    3fec:	00f607b3          	add	a5,a2,a5
    3ff0:	fd078793          	add	a5,a5,-48
    3ff4:	fef42623          	sw	a5,-20(s0)
    3ff8:	fdc42783          	lw	a5,-36(s0)
    3ffc:	0007a783          	lw	a5,0(a5)
    4000:	0007c703          	lbu	a4,0(a5)
    4004:	02f00793          	li	a5,47
    4008:	00e7fc63          	bgeu	a5,a4,4020 <_trap_stack_ptr+0x20>
    400c:	fdc42783          	lw	a5,-36(s0)
    4010:	0007a783          	lw	a5,0(a5)
    4014:	0007c703          	lbu	a4,0(a5)
    4018:	03900793          	li	a5,57
    401c:	fae7f0e3          	bgeu	a5,a4,3fbc <skip_atoi+0x18>
    4020:	fec42783          	lw	a5,-20(s0)
    4024:	00078513          	mv	a0,a5
    4028:	02c12403          	lw	s0,44(sp)
    402c:	03010113          	add	sp,sp,48
    4030:	00008067          	ret

00004034 <number>:
    4034:	f8010113          	add	sp,sp,-128
    4038:	06812e23          	sw	s0,124(sp)
    403c:	08010413          	add	s0,sp,128
    4040:	f8a42e23          	sw	a0,-100(s0)
    4044:	f8b42c23          	sw	a1,-104(s0)
    4048:	f8c42a23          	sw	a2,-108(s0)
    404c:	f8d42823          	sw	a3,-112(s0)
    4050:	f8e42623          	sw	a4,-116(s0)
    4054:	f8f42423          	sw	a5,-120(s0)
    4058:	79402783          	lw	a5,1940(zero) # 794 <digits>
    405c:	fef42423          	sw	a5,-24(s0)
    4060:	f8842783          	lw	a5,-120(s0)
    4064:	0407f793          	and	a5,a5,64
    4068:	00078663          	beqz	a5,4074 <number+0x40>
    406c:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    4070:	fef42423          	sw	a5,-24(s0)
    4074:	f8842783          	lw	a5,-120(s0)
    4078:	0107f793          	and	a5,a5,16
    407c:	00078863          	beqz	a5,408c <number+0x58>
    4080:	f8842783          	lw	a5,-120(s0)
    4084:	ffe7f793          	and	a5,a5,-2
    4088:	f8f42423          	sw	a5,-120(s0)
    408c:	f9442703          	lw	a4,-108(s0)
    4090:	00100793          	li	a5,1
    4094:	00e7d863          	bge	a5,a4,40a4 <number+0x70>
    4098:	f9442703          	lw	a4,-108(s0)
    409c:	02400793          	li	a5,36
    40a0:	00e7d663          	bge	a5,a4,40ac <number+0x78>
    40a4:	00000793          	li	a5,0
    40a8:	2f00006f          	j	4398 <number+0x364>
    40ac:	f8842783          	lw	a5,-120(s0)
    40b0:	0017f793          	and	a5,a5,1
    40b4:	00078663          	beqz	a5,40c0 <number+0x8c>
    40b8:	03000793          	li	a5,48
    40bc:	0080006f          	j	40c4 <number+0x90>
    40c0:	02000793          	li	a5,32
    40c4:	fef401a3          	sb	a5,-29(s0)
    40c8:	fe0407a3          	sb	zero,-17(s0)
    40cc:	f8842783          	lw	a5,-120(s0)
    40d0:	0027f793          	and	a5,a5,2
    40d4:	06078a63          	beqz	a5,4148 <number+0x114>
    40d8:	f9842783          	lw	a5,-104(s0)
    40dc:	0207d463          	bgez	a5,4104 <number+0xd0>
    40e0:	02d00793          	li	a5,45
    40e4:	fef407a3          	sb	a5,-17(s0)
    40e8:	f9842783          	lw	a5,-104(s0)
    40ec:	40f007b3          	neg	a5,a5
    40f0:	f8f42c23          	sw	a5,-104(s0)
    40f4:	f9042783          	lw	a5,-112(s0)
    40f8:	fff78793          	add	a5,a5,-1
    40fc:	f8f42823          	sw	a5,-112(s0)
    4100:	0480006f          	j	4148 <number+0x114>
    4104:	f8842783          	lw	a5,-120(s0)
    4108:	0047f793          	and	a5,a5,4
    410c:	00078e63          	beqz	a5,4128 <number+0xf4>
    4110:	02b00793          	li	a5,43
    4114:	fef407a3          	sb	a5,-17(s0)
    4118:	f9042783          	lw	a5,-112(s0)
    411c:	fff78793          	add	a5,a5,-1
    4120:	f8f42823          	sw	a5,-112(s0)
    4124:	0240006f          	j	4148 <number+0x114>
    4128:	f8842783          	lw	a5,-120(s0)
    412c:	0087f793          	and	a5,a5,8
    4130:	00078c63          	beqz	a5,4148 <number+0x114>
    4134:	02000793          	li	a5,32
    4138:	fef407a3          	sb	a5,-17(s0)
    413c:	f9042783          	lw	a5,-112(s0)
    4140:	fff78793          	add	a5,a5,-1
    4144:	f8f42823          	sw	a5,-112(s0)
    4148:	f8842783          	lw	a5,-120(s0)
    414c:	0207f793          	and	a5,a5,32
    4150:	02078c63          	beqz	a5,4188 <number+0x154>
    4154:	f9442703          	lw	a4,-108(s0)
    4158:	01000793          	li	a5,16
    415c:	00f71a63          	bne	a4,a5,4170 <number+0x13c>
    4160:	f9042783          	lw	a5,-112(s0)
    4164:	ffe78793          	add	a5,a5,-2
    4168:	f8f42823          	sw	a5,-112(s0)
    416c:	01c0006f          	j	4188 <number+0x154>
    4170:	f9442703          	lw	a4,-108(s0)
    4174:	00800793          	li	a5,8
    4178:	00f71863          	bne	a4,a5,4188 <number+0x154>
    417c:	f9042783          	lw	a5,-112(s0)
    4180:	fff78793          	add	a5,a5,-1
    4184:	f8f42823          	sw	a5,-112(s0)
    4188:	fe042223          	sw	zero,-28(s0)
    418c:	f9842783          	lw	a5,-104(s0)
    4190:	06079263          	bnez	a5,41f4 <number+0x1c0>
    4194:	fe442783          	lw	a5,-28(s0)
    4198:	00178713          	add	a4,a5,1
    419c:	fee42223          	sw	a4,-28(s0)
    41a0:	ff078793          	add	a5,a5,-16
    41a4:	008787b3          	add	a5,a5,s0
    41a8:	03000713          	li	a4,48
    41ac:	fae78823          	sb	a4,-80(a5)
    41b0:	04c0006f          	j	41fc <number+0x1c8>
    41b4:	f9842703          	lw	a4,-104(s0)
    41b8:	f9442783          	lw	a5,-108(s0)
    41bc:	02f777b3          	remu	a5,a4,a5
    41c0:	fe842703          	lw	a4,-24(s0)
    41c4:	00f70733          	add	a4,a4,a5
    41c8:	fe442783          	lw	a5,-28(s0)
    41cc:	00178693          	add	a3,a5,1
    41d0:	fed42223          	sw	a3,-28(s0)
    41d4:	00074703          	lbu	a4,0(a4)
    41d8:	ff078793          	add	a5,a5,-16
    41dc:	008787b3          	add	a5,a5,s0
    41e0:	fae78823          	sb	a4,-80(a5)
    41e4:	f9842703          	lw	a4,-104(s0)
    41e8:	f9442783          	lw	a5,-108(s0)
    41ec:	02f757b3          	divu	a5,a4,a5
    41f0:	f8f42c23          	sw	a5,-104(s0)
    41f4:	f9842783          	lw	a5,-104(s0)
    41f8:	fa079ee3          	bnez	a5,41b4 <number+0x180>
    41fc:	fe442703          	lw	a4,-28(s0)
    4200:	f8c42783          	lw	a5,-116(s0)
    4204:	00e7d663          	bge	a5,a4,4210 <number+0x1dc>
    4208:	fe442783          	lw	a5,-28(s0)
    420c:	f8f42623          	sw	a5,-116(s0)
    4210:	f9042703          	lw	a4,-112(s0)
    4214:	f8c42783          	lw	a5,-116(s0)
    4218:	40f707b3          	sub	a5,a4,a5
    421c:	f8f42823          	sw	a5,-112(s0)
    4220:	f8842783          	lw	a5,-120(s0)
    4224:	0117f793          	and	a5,a5,17
    4228:	02079663          	bnez	a5,4254 <number+0x220>
    422c:	0180006f          	j	4244 <number+0x210>
    4230:	f9c42783          	lw	a5,-100(s0)
    4234:	00178713          	add	a4,a5,1
    4238:	f8e42e23          	sw	a4,-100(s0)
    423c:	02000713          	li	a4,32
    4240:	00e78023          	sb	a4,0(a5)
    4244:	f9042783          	lw	a5,-112(s0)
    4248:	fff78713          	add	a4,a5,-1
    424c:	f8e42823          	sw	a4,-112(s0)
    4250:	fef040e3          	bgtz	a5,4230 <number+0x1fc>
    4254:	fef44783          	lbu	a5,-17(s0)
    4258:	00078c63          	beqz	a5,4270 <number+0x23c>
    425c:	f9c42783          	lw	a5,-100(s0)
    4260:	00178713          	add	a4,a5,1
    4264:	f8e42e23          	sw	a4,-100(s0)
    4268:	fef44703          	lbu	a4,-17(s0)
    426c:	00e78023          	sb	a4,0(a5)
    4270:	f8842783          	lw	a5,-120(s0)
    4274:	0207f793          	and	a5,a5,32
    4278:	06078063          	beqz	a5,42d8 <number+0x2a4>
    427c:	f9442703          	lw	a4,-108(s0)
    4280:	00800793          	li	a5,8
    4284:	00f71e63          	bne	a4,a5,42a0 <number+0x26c>
    4288:	f9c42783          	lw	a5,-100(s0)
    428c:	00178713          	add	a4,a5,1
    4290:	f8e42e23          	sw	a4,-100(s0)
    4294:	03000713          	li	a4,48
    4298:	00e78023          	sb	a4,0(a5)
    429c:	03c0006f          	j	42d8 <number+0x2a4>
    42a0:	f9442703          	lw	a4,-108(s0)
    42a4:	01000793          	li	a5,16
    42a8:	02f71863          	bne	a4,a5,42d8 <number+0x2a4>
    42ac:	f9c42783          	lw	a5,-100(s0)
    42b0:	00178713          	add	a4,a5,1
    42b4:	f8e42e23          	sw	a4,-100(s0)
    42b8:	03000713          	li	a4,48
    42bc:	00e78023          	sb	a4,0(a5)
    42c0:	79402703          	lw	a4,1940(zero) # 794 <digits>
    42c4:	f9c42783          	lw	a5,-100(s0)
    42c8:	00178693          	add	a3,a5,1
    42cc:	f8d42e23          	sw	a3,-100(s0)
    42d0:	02174703          	lbu	a4,33(a4)
    42d4:	00e78023          	sb	a4,0(a5)
    42d8:	f8842783          	lw	a5,-120(s0)
    42dc:	0107f793          	and	a5,a5,16
    42e0:	04079263          	bnez	a5,4324 <number+0x2f0>
    42e4:	0180006f          	j	42fc <number+0x2c8>
    42e8:	f9c42783          	lw	a5,-100(s0)
    42ec:	00178713          	add	a4,a5,1
    42f0:	f8e42e23          	sw	a4,-100(s0)
    42f4:	fe344703          	lbu	a4,-29(s0)
    42f8:	00e78023          	sb	a4,0(a5)
    42fc:	f9042783          	lw	a5,-112(s0)
    4300:	fff78713          	add	a4,a5,-1
    4304:	f8e42823          	sw	a4,-112(s0)
    4308:	fef040e3          	bgtz	a5,42e8 <number+0x2b4>
    430c:	0180006f          	j	4324 <number+0x2f0>
    4310:	f9c42783          	lw	a5,-100(s0)
    4314:	00178713          	add	a4,a5,1
    4318:	f8e42e23          	sw	a4,-100(s0)
    431c:	03000713          	li	a4,48
    4320:	00e78023          	sb	a4,0(a5)
    4324:	f8c42783          	lw	a5,-116(s0)
    4328:	fff78713          	add	a4,a5,-1
    432c:	f8e42623          	sw	a4,-116(s0)
    4330:	fe442703          	lw	a4,-28(s0)
    4334:	fcf74ee3          	blt	a4,a5,4310 <number+0x2dc>
    4338:	0240006f          	j	435c <number+0x328>
    433c:	f9c42783          	lw	a5,-100(s0)
    4340:	00178713          	add	a4,a5,1
    4344:	f8e42e23          	sw	a4,-100(s0)
    4348:	fe442703          	lw	a4,-28(s0)
    434c:	ff070713          	add	a4,a4,-16
    4350:	00870733          	add	a4,a4,s0
    4354:	fb074703          	lbu	a4,-80(a4)
    4358:	00e78023          	sb	a4,0(a5)
    435c:	fe442783          	lw	a5,-28(s0)
    4360:	fff78713          	add	a4,a5,-1
    4364:	fee42223          	sw	a4,-28(s0)
    4368:	fcf04ae3          	bgtz	a5,433c <number+0x308>
    436c:	0180006f          	j	4384 <number+0x350>
    4370:	f9c42783          	lw	a5,-100(s0)
    4374:	00178713          	add	a4,a5,1
    4378:	f8e42e23          	sw	a4,-100(s0)
    437c:	02000713          	li	a4,32
    4380:	00e78023          	sb	a4,0(a5)
    4384:	f9042783          	lw	a5,-112(s0)
    4388:	fff78713          	add	a4,a5,-1
    438c:	f8e42823          	sw	a4,-112(s0)
    4390:	fef040e3          	bgtz	a5,4370 <number+0x33c>
    4394:	f9c42783          	lw	a5,-100(s0)
    4398:	00078513          	mv	a0,a5
    439c:	07c12403          	lw	s0,124(sp)
    43a0:	08010113          	add	sp,sp,128
    43a4:	00008067          	ret

000043a8 <eaddr>:
    43a8:	fa010113          	add	sp,sp,-96
    43ac:	04812e23          	sw	s0,92(sp)
    43b0:	06010413          	add	s0,sp,96
    43b4:	faa42e23          	sw	a0,-68(s0)
    43b8:	fab42c23          	sw	a1,-72(s0)
    43bc:	fac42a23          	sw	a2,-76(s0)
    43c0:	fad42823          	sw	a3,-80(s0)
    43c4:	fae42623          	sw	a4,-84(s0)
    43c8:	79402783          	lw	a5,1940(zero) # 794 <digits>
    43cc:	fef42623          	sw	a5,-20(s0)
    43d0:	fac42783          	lw	a5,-84(s0)
    43d4:	0407f793          	and	a5,a5,64
    43d8:	00078663          	beqz	a5,43e4 <eaddr+0x3c>
    43dc:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    43e0:	fef42623          	sw	a5,-20(s0)
    43e4:	fe042223          	sw	zero,-28(s0)
    43e8:	fe042423          	sw	zero,-24(s0)
    43ec:	0ac0006f          	j	4498 <eaddr+0xf0>
    43f0:	fe842783          	lw	a5,-24(s0)
    43f4:	02078063          	beqz	a5,4414 <eaddr+0x6c>
    43f8:	fe442783          	lw	a5,-28(s0)
    43fc:	00178713          	add	a4,a5,1
    4400:	fee42223          	sw	a4,-28(s0)
    4404:	ff078793          	add	a5,a5,-16
    4408:	008787b3          	add	a5,a5,s0
    440c:	03a00713          	li	a4,58
    4410:	fce78e23          	sb	a4,-36(a5)
    4414:	fe842783          	lw	a5,-24(s0)
    4418:	fb842703          	lw	a4,-72(s0)
    441c:	00f707b3          	add	a5,a4,a5
    4420:	0007c783          	lbu	a5,0(a5)
    4424:	0047d793          	srl	a5,a5,0x4
    4428:	0ff7f793          	zext.b	a5,a5
    442c:	00078713          	mv	a4,a5
    4430:	fec42783          	lw	a5,-20(s0)
    4434:	00e78733          	add	a4,a5,a4
    4438:	fe442783          	lw	a5,-28(s0)
    443c:	00178693          	add	a3,a5,1
    4440:	fed42223          	sw	a3,-28(s0)
    4444:	00074703          	lbu	a4,0(a4)
    4448:	ff078793          	add	a5,a5,-16
    444c:	008787b3          	add	a5,a5,s0
    4450:	fce78e23          	sb	a4,-36(a5)
    4454:	fe842783          	lw	a5,-24(s0)
    4458:	fb842703          	lw	a4,-72(s0)
    445c:	00f707b3          	add	a5,a4,a5
    4460:	0007c783          	lbu	a5,0(a5)
    4464:	00f7f793          	and	a5,a5,15
    4468:	fec42703          	lw	a4,-20(s0)
    446c:	00f70733          	add	a4,a4,a5
    4470:	fe442783          	lw	a5,-28(s0)
    4474:	00178693          	add	a3,a5,1
    4478:	fed42223          	sw	a3,-28(s0)
    447c:	00074703          	lbu	a4,0(a4)
    4480:	ff078793          	add	a5,a5,-16
    4484:	008787b3          	add	a5,a5,s0
    4488:	fce78e23          	sb	a4,-36(a5)
    448c:	fe842783          	lw	a5,-24(s0)
    4490:	00178793          	add	a5,a5,1
    4494:	fef42423          	sw	a5,-24(s0)
    4498:	fe842703          	lw	a4,-24(s0)
    449c:	00500793          	li	a5,5
    44a0:	f4e7d8e3          	bge	a5,a4,43f0 <eaddr+0x48>
    44a4:	fac42783          	lw	a5,-84(s0)
    44a8:	0107f793          	and	a5,a5,16
    44ac:	02079863          	bnez	a5,44dc <eaddr+0x134>
    44b0:	0180006f          	j	44c8 <eaddr+0x120>
    44b4:	fbc42783          	lw	a5,-68(s0)
    44b8:	00178713          	add	a4,a5,1
    44bc:	fae42e23          	sw	a4,-68(s0)
    44c0:	02000713          	li	a4,32
    44c4:	00e78023          	sb	a4,0(a5)
    44c8:	fb442783          	lw	a5,-76(s0)
    44cc:	fff78713          	add	a4,a5,-1
    44d0:	fae42a23          	sw	a4,-76(s0)
    44d4:	fe442703          	lw	a4,-28(s0)
    44d8:	fcf74ee3          	blt	a4,a5,44b4 <eaddr+0x10c>
    44dc:	fe042423          	sw	zero,-24(s0)
    44e0:	0300006f          	j	4510 <eaddr+0x168>
    44e4:	fbc42783          	lw	a5,-68(s0)
    44e8:	00178713          	add	a4,a5,1
    44ec:	fae42e23          	sw	a4,-68(s0)
    44f0:	fe842703          	lw	a4,-24(s0)
    44f4:	ff070713          	add	a4,a4,-16
    44f8:	00870733          	add	a4,a4,s0
    44fc:	fdc74703          	lbu	a4,-36(a4)
    4500:	00e78023          	sb	a4,0(a5)
    4504:	fe842783          	lw	a5,-24(s0)
    4508:	00178793          	add	a5,a5,1
    450c:	fef42423          	sw	a5,-24(s0)
    4510:	fe842703          	lw	a4,-24(s0)
    4514:	fe442783          	lw	a5,-28(s0)
    4518:	fcf746e3          	blt	a4,a5,44e4 <eaddr+0x13c>
    451c:	0180006f          	j	4534 <eaddr+0x18c>
    4520:	fbc42783          	lw	a5,-68(s0)
    4524:	00178713          	add	a4,a5,1
    4528:	fae42e23          	sw	a4,-68(s0)
    452c:	02000713          	li	a4,32
    4530:	00e78023          	sb	a4,0(a5)
    4534:	fb442783          	lw	a5,-76(s0)
    4538:	fff78713          	add	a4,a5,-1
    453c:	fae42a23          	sw	a4,-76(s0)
    4540:	fe442703          	lw	a4,-28(s0)
    4544:	fcf74ee3          	blt	a4,a5,4520 <eaddr+0x178>
    4548:	fbc42783          	lw	a5,-68(s0)
    454c:	00078513          	mv	a0,a5
    4550:	05c12403          	lw	s0,92(sp)
    4554:	06010113          	add	sp,sp,96
    4558:	00008067          	ret

0000455c <iaddr>:
    455c:	fa010113          	add	sp,sp,-96
    4560:	04812e23          	sw	s0,92(sp)
    4564:	06010413          	add	s0,sp,96
    4568:	faa42e23          	sw	a0,-68(s0)
    456c:	fab42c23          	sw	a1,-72(s0)
    4570:	fac42a23          	sw	a2,-76(s0)
    4574:	fad42823          	sw	a3,-80(s0)
    4578:	fae42623          	sw	a4,-84(s0)
    457c:	fe042223          	sw	zero,-28(s0)
    4580:	fe042623          	sw	zero,-20(s0)
    4584:	1780006f          	j	46fc <iaddr+0x1a0>
    4588:	fec42783          	lw	a5,-20(s0)
    458c:	02078063          	beqz	a5,45ac <iaddr+0x50>
    4590:	fe442783          	lw	a5,-28(s0)
    4594:	00178713          	add	a4,a5,1
    4598:	fee42223          	sw	a4,-28(s0)
    459c:	ff078793          	add	a5,a5,-16
    45a0:	008787b3          	add	a5,a5,s0
    45a4:	02e00713          	li	a4,46
    45a8:	fce78e23          	sb	a4,-36(a5)
    45ac:	fec42783          	lw	a5,-20(s0)
    45b0:	fb842703          	lw	a4,-72(s0)
    45b4:	00f707b3          	add	a5,a4,a5
    45b8:	0007c783          	lbu	a5,0(a5)
    45bc:	fef42423          	sw	a5,-24(s0)
    45c0:	fe842783          	lw	a5,-24(s0)
    45c4:	02079463          	bnez	a5,45ec <iaddr+0x90>
    45c8:	79402703          	lw	a4,1940(zero) # 794 <digits>
    45cc:	fe442783          	lw	a5,-28(s0)
    45d0:	00178693          	add	a3,a5,1
    45d4:	fed42223          	sw	a3,-28(s0)
    45d8:	00074703          	lbu	a4,0(a4)
    45dc:	ff078793          	add	a5,a5,-16
    45e0:	008787b3          	add	a5,a5,s0
    45e4:	fce78e23          	sb	a4,-36(a5)
    45e8:	1080006f          	j	46f0 <iaddr+0x194>
    45ec:	fe842703          	lw	a4,-24(s0)
    45f0:	06300793          	li	a5,99
    45f4:	08e7d463          	bge	a5,a4,467c <iaddr+0x120>
    45f8:	79402783          	lw	a5,1940(zero) # 794 <digits>
    45fc:	fe842683          	lw	a3,-24(s0)
    4600:	06400713          	li	a4,100
    4604:	02e6c733          	div	a4,a3,a4
    4608:	00e78733          	add	a4,a5,a4
    460c:	fe442783          	lw	a5,-28(s0)
    4610:	00178693          	add	a3,a5,1
    4614:	fed42223          	sw	a3,-28(s0)
    4618:	00074703          	lbu	a4,0(a4)
    461c:	ff078793          	add	a5,a5,-16
    4620:	008787b3          	add	a5,a5,s0
    4624:	fce78e23          	sb	a4,-36(a5)
    4628:	fe842703          	lw	a4,-24(s0)
    462c:	06400793          	li	a5,100
    4630:	02f767b3          	rem	a5,a4,a5
    4634:	fef42423          	sw	a5,-24(s0)
    4638:	79402783          	lw	a5,1940(zero) # 794 <digits>
    463c:	fe842683          	lw	a3,-24(s0)
    4640:	00a00713          	li	a4,10
    4644:	02e6c733          	div	a4,a3,a4
    4648:	00e78733          	add	a4,a5,a4
    464c:	fe442783          	lw	a5,-28(s0)
    4650:	00178693          	add	a3,a5,1
    4654:	fed42223          	sw	a3,-28(s0)
    4658:	00074703          	lbu	a4,0(a4)
    465c:	ff078793          	add	a5,a5,-16
    4660:	008787b3          	add	a5,a5,s0
    4664:	fce78e23          	sb	a4,-36(a5)
    4668:	fe842703          	lw	a4,-24(s0)
    466c:	00a00793          	li	a5,10
    4670:	02f767b3          	rem	a5,a4,a5
    4674:	fef42423          	sw	a5,-24(s0)
    4678:	0500006f          	j	46c8 <iaddr+0x16c>
    467c:	fe842703          	lw	a4,-24(s0)
    4680:	00900793          	li	a5,9
    4684:	04e7d263          	bge	a5,a4,46c8 <iaddr+0x16c>
    4688:	79402783          	lw	a5,1940(zero) # 794 <digits>
    468c:	fe842683          	lw	a3,-24(s0)
    4690:	00a00713          	li	a4,10
    4694:	02e6c733          	div	a4,a3,a4
    4698:	00e78733          	add	a4,a5,a4
    469c:	fe442783          	lw	a5,-28(s0)
    46a0:	00178693          	add	a3,a5,1
    46a4:	fed42223          	sw	a3,-28(s0)
    46a8:	00074703          	lbu	a4,0(a4)
    46ac:	ff078793          	add	a5,a5,-16
    46b0:	008787b3          	add	a5,a5,s0
    46b4:	fce78e23          	sb	a4,-36(a5)
    46b8:	fe842703          	lw	a4,-24(s0)
    46bc:	00a00793          	li	a5,10
    46c0:	02f767b3          	rem	a5,a4,a5
    46c4:	fef42423          	sw	a5,-24(s0)
    46c8:	79402703          	lw	a4,1940(zero) # 794 <digits>
    46cc:	fe842783          	lw	a5,-24(s0)
    46d0:	00f70733          	add	a4,a4,a5
    46d4:	fe442783          	lw	a5,-28(s0)
    46d8:	00178693          	add	a3,a5,1
    46dc:	fed42223          	sw	a3,-28(s0)
    46e0:	00074703          	lbu	a4,0(a4)
    46e4:	ff078793          	add	a5,a5,-16
    46e8:	008787b3          	add	a5,a5,s0
    46ec:	fce78e23          	sb	a4,-36(a5)
    46f0:	fec42783          	lw	a5,-20(s0)
    46f4:	00178793          	add	a5,a5,1
    46f8:	fef42623          	sw	a5,-20(s0)
    46fc:	fec42703          	lw	a4,-20(s0)
    4700:	00300793          	li	a5,3
    4704:	e8e7d2e3          	bge	a5,a4,4588 <iaddr+0x2c>
    4708:	fac42783          	lw	a5,-84(s0)
    470c:	0107f793          	and	a5,a5,16
    4710:	02079863          	bnez	a5,4740 <iaddr+0x1e4>
    4714:	0180006f          	j	472c <iaddr+0x1d0>
    4718:	fbc42783          	lw	a5,-68(s0)
    471c:	00178713          	add	a4,a5,1
    4720:	fae42e23          	sw	a4,-68(s0)
    4724:	02000713          	li	a4,32
    4728:	00e78023          	sb	a4,0(a5)
    472c:	fb442783          	lw	a5,-76(s0)
    4730:	fff78713          	add	a4,a5,-1
    4734:	fae42a23          	sw	a4,-76(s0)
    4738:	fe442703          	lw	a4,-28(s0)
    473c:	fcf74ee3          	blt	a4,a5,4718 <iaddr+0x1bc>
    4740:	fe042623          	sw	zero,-20(s0)
    4744:	0300006f          	j	4774 <iaddr+0x218>
    4748:	fbc42783          	lw	a5,-68(s0)
    474c:	00178713          	add	a4,a5,1
    4750:	fae42e23          	sw	a4,-68(s0)
    4754:	fec42703          	lw	a4,-20(s0)
    4758:	ff070713          	add	a4,a4,-16
    475c:	00870733          	add	a4,a4,s0
    4760:	fdc74703          	lbu	a4,-36(a4)
    4764:	00e78023          	sb	a4,0(a5)
    4768:	fec42783          	lw	a5,-20(s0)
    476c:	00178793          	add	a5,a5,1
    4770:	fef42623          	sw	a5,-20(s0)
    4774:	fec42703          	lw	a4,-20(s0)
    4778:	fe442783          	lw	a5,-28(s0)
    477c:	fcf746e3          	blt	a4,a5,4748 <iaddr+0x1ec>
    4780:	0180006f          	j	4798 <iaddr+0x23c>
    4784:	fbc42783          	lw	a5,-68(s0)
    4788:	00178713          	add	a4,a5,1
    478c:	fae42e23          	sw	a4,-68(s0)
    4790:	02000713          	li	a4,32
    4794:	00e78023          	sb	a4,0(a5)
    4798:	fb442783          	lw	a5,-76(s0)
    479c:	fff78713          	add	a4,a5,-1
    47a0:	fae42a23          	sw	a4,-76(s0)
    47a4:	fe442703          	lw	a4,-28(s0)
    47a8:	fcf74ee3          	blt	a4,a5,4784 <iaddr+0x228>
    47ac:	fbc42783          	lw	a5,-68(s0)
    47b0:	00078513          	mv	a0,a5
    47b4:	05c12403          	lw	s0,92(sp)
    47b8:	06010113          	add	sp,sp,96
    47bc:	00008067          	ret

000047c0 <ee_bufcpy>:
    47c0:	fd010113          	add	sp,sp,-48
    47c4:	02812623          	sw	s0,44(sp)
    47c8:	03010413          	add	s0,sp,48
    47cc:	fca42e23          	sw	a0,-36(s0)
    47d0:	fcb42c23          	sw	a1,-40(s0)
    47d4:	fcc42a23          	sw	a2,-44(s0)
    47d8:	fd442783          	lw	a5,-44(s0)
    47dc:	fd842703          	lw	a4,-40(s0)
    47e0:	00f707b3          	add	a5,a4,a5
    47e4:	fef42623          	sw	a5,-20(s0)
    47e8:	0240006f          	j	480c <ee_bufcpy+0x4c>
    47ec:	fd842703          	lw	a4,-40(s0)
    47f0:	00170793          	add	a5,a4,1
    47f4:	fcf42c23          	sw	a5,-40(s0)
    47f8:	fdc42783          	lw	a5,-36(s0)
    47fc:	00178693          	add	a3,a5,1
    4800:	fcd42e23          	sw	a3,-36(s0)
    4804:	00074703          	lbu	a4,0(a4)
    4808:	00e78023          	sb	a4,0(a5)
    480c:	fd842703          	lw	a4,-40(s0)
    4810:	fec42783          	lw	a5,-20(s0)
    4814:	fcf71ce3          	bne	a4,a5,47ec <ee_bufcpy+0x2c>
    4818:	00000013          	nop
    481c:	00000013          	nop
    4820:	02c12403          	lw	s0,44(sp)
    4824:	03010113          	add	sp,sp,48
    4828:	00008067          	ret

0000482c <parse_float>:
    482c:	f6010113          	add	sp,sp,-160
    4830:	08112e23          	sw	ra,156(sp)
    4834:	08812c23          	sw	s0,152(sp)
    4838:	0a010413          	add	s0,sp,160
    483c:	f6a42c23          	sw	a0,-136(s0)
    4840:	f6b42e23          	sw	a1,-132(s0)
    4844:	f6c42a23          	sw	a2,-140(s0)
    4848:	00068793          	mv	a5,a3
    484c:	f6e42623          	sw	a4,-148(s0)
    4850:	f6f409a3          	sb	a5,-141(s0)
    4854:	fe042223          	sw	zero,-28(s0)
    4858:	fe042023          	sw	zero,-32(s0)
    485c:	f7344703          	lbu	a4,-141(s0)
    4860:	04700793          	li	a5,71
    4864:	00f70863          	beq	a4,a5,4874 <parse_float+0x48>
    4868:	f7344703          	lbu	a4,-141(s0)
    486c:	04500793          	li	a5,69
    4870:	00f71c63          	bne	a4,a5,4888 <parse_float+0x5c>
    4874:	00100793          	li	a5,1
    4878:	fef42023          	sw	a5,-32(s0)
    487c:	f7344783          	lbu	a5,-141(s0)
    4880:	02078793          	add	a5,a5,32
    4884:	f6f409a3          	sb	a5,-141(s0)
    4888:	f7344703          	lbu	a4,-141(s0)
    488c:	06700793          	li	a5,103
    4890:	06f71c63          	bne	a4,a5,4908 <parse_float+0xdc>
    4894:	f8440793          	add	a5,s0,-124
    4898:	fd440713          	add	a4,s0,-44
    489c:	fd840693          	add	a3,s0,-40
    48a0:	f6c42603          	lw	a2,-148(s0)
    48a4:	f7842503          	lw	a0,-136(s0)
    48a8:	f7c42583          	lw	a1,-132(s0)
    48ac:	d74ff0ef          	jal	3e20 <ecvtbuf>
    48b0:	fea42223          	sw	a0,-28(s0)
    48b4:	fd842783          	lw	a5,-40(s0)
    48b8:	fff78793          	add	a5,a5,-1
    48bc:	fcf42e23          	sw	a5,-36(s0)
    48c0:	fdc42703          	lw	a4,-36(s0)
    48c4:	ffc00793          	li	a5,-4
    48c8:	00f74863          	blt	a4,a5,48d8 <parse_float+0xac>
    48cc:	f6c42703          	lw	a4,-148(s0)
    48d0:	fdc42783          	lw	a5,-36(s0)
    48d4:	00e7ce63          	blt	a5,a4,48f0 <parse_float+0xc4>
    48d8:	06500793          	li	a5,101
    48dc:	f6f409a3          	sb	a5,-141(s0)
    48e0:	f6c42783          	lw	a5,-148(s0)
    48e4:	fff78793          	add	a5,a5,-1
    48e8:	f6f42623          	sw	a5,-148(s0)
    48ec:	01c0006f          	j	4908 <parse_float+0xdc>
    48f0:	06600793          	li	a5,102
    48f4:	f6f409a3          	sb	a5,-141(s0)
    48f8:	fd842783          	lw	a5,-40(s0)
    48fc:	f6c42703          	lw	a4,-148(s0)
    4900:	40f707b3          	sub	a5,a4,a5
    4904:	f6f42623          	sw	a5,-148(s0)
    4908:	f7344703          	lbu	a4,-141(s0)
    490c:	06500793          	li	a5,101
    4910:	1ef71063          	bne	a4,a5,4af0 <parse_float+0x2c4>
    4914:	f6c42783          	lw	a5,-148(s0)
    4918:	00178613          	add	a2,a5,1
    491c:	f8440793          	add	a5,s0,-124
    4920:	fd440713          	add	a4,s0,-44
    4924:	fd840693          	add	a3,s0,-40
    4928:	f7842503          	lw	a0,-136(s0)
    492c:	f7c42583          	lw	a1,-132(s0)
    4930:	cf0ff0ef          	jal	3e20 <ecvtbuf>
    4934:	fea42223          	sw	a0,-28(s0)
    4938:	fd442783          	lw	a5,-44(s0)
    493c:	00078c63          	beqz	a5,4954 <parse_float+0x128>
    4940:	f7442783          	lw	a5,-140(s0)
    4944:	00178713          	add	a4,a5,1
    4948:	f6e42a23          	sw	a4,-140(s0)
    494c:	02d00713          	li	a4,45
    4950:	00e78023          	sb	a4,0(a5)
    4954:	f7442783          	lw	a5,-140(s0)
    4958:	00178713          	add	a4,a5,1
    495c:	f6e42a23          	sw	a4,-140(s0)
    4960:	fe442703          	lw	a4,-28(s0)
    4964:	00074703          	lbu	a4,0(a4)
    4968:	00e78023          	sb	a4,0(a5)
    496c:	f6c42783          	lw	a5,-148(s0)
    4970:	00f05c63          	blez	a5,4988 <parse_float+0x15c>
    4974:	f7442783          	lw	a5,-140(s0)
    4978:	00178713          	add	a4,a5,1
    497c:	f6e42a23          	sw	a4,-140(s0)
    4980:	02e00713          	li	a4,46
    4984:	00e78023          	sb	a4,0(a5)
    4988:	fe442783          	lw	a5,-28(s0)
    498c:	00178793          	add	a5,a5,1
    4990:	f6c42603          	lw	a2,-148(s0)
    4994:	00078593          	mv	a1,a5
    4998:	f7442503          	lw	a0,-140(s0)
    499c:	e25ff0ef          	jal	47c0 <ee_bufcpy>
    49a0:	f6c42783          	lw	a5,-148(s0)
    49a4:	f7442703          	lw	a4,-140(s0)
    49a8:	00f707b3          	add	a5,a4,a5
    49ac:	f6f42a23          	sw	a5,-140(s0)
    49b0:	fe042783          	lw	a5,-32(s0)
    49b4:	00078663          	beqz	a5,49c0 <parse_float+0x194>
    49b8:	04500713          	li	a4,69
    49bc:	0080006f          	j	49c4 <parse_float+0x198>
    49c0:	06500713          	li	a4,101
    49c4:	f7442783          	lw	a5,-140(s0)
    49c8:	00178693          	add	a3,a5,1
    49cc:	f6d42a23          	sw	a3,-140(s0)
    49d0:	00e78023          	sb	a4,0(a5)
    49d4:	fd842783          	lw	a5,-40(s0)
    49d8:	02079a63          	bnez	a5,4a0c <parse_float+0x1e0>
    49dc:	00000613          	li	a2,0
    49e0:	00000693          	li	a3,0
    49e4:	f7842503          	lw	a0,-136(s0)
    49e8:	f7c42583          	lw	a1,-132(s0)
    49ec:	751010ef          	jal	693c <__eqdf2>
    49f0:	00050793          	mv	a5,a0
    49f4:	00079663          	bnez	a5,4a00 <parse_float+0x1d4>
    49f8:	fe042623          	sw	zero,-20(s0)
    49fc:	01c0006f          	j	4a18 <parse_float+0x1ec>
    4a00:	fff00793          	li	a5,-1
    4a04:	fef42623          	sw	a5,-20(s0)
    4a08:	0100006f          	j	4a18 <parse_float+0x1ec>
    4a0c:	fd842783          	lw	a5,-40(s0)
    4a10:	fff78793          	add	a5,a5,-1
    4a14:	fef42623          	sw	a5,-20(s0)
    4a18:	fec42783          	lw	a5,-20(s0)
    4a1c:	0207d463          	bgez	a5,4a44 <parse_float+0x218>
    4a20:	f7442783          	lw	a5,-140(s0)
    4a24:	00178713          	add	a4,a5,1
    4a28:	f6e42a23          	sw	a4,-140(s0)
    4a2c:	02d00713          	li	a4,45
    4a30:	00e78023          	sb	a4,0(a5)
    4a34:	fec42783          	lw	a5,-20(s0)
    4a38:	40f007b3          	neg	a5,a5
    4a3c:	fef42623          	sw	a5,-20(s0)
    4a40:	0180006f          	j	4a58 <parse_float+0x22c>
    4a44:	f7442783          	lw	a5,-140(s0)
    4a48:	00178713          	add	a4,a5,1
    4a4c:	f6e42a23          	sw	a4,-140(s0)
    4a50:	02b00713          	li	a4,43
    4a54:	00e78023          	sb	a4,0(a5)
    4a58:	fec42703          	lw	a4,-20(s0)
    4a5c:	00a00793          	li	a5,10
    4a60:	02f767b3          	rem	a5,a4,a5
    4a64:	0ff7f713          	zext.b	a4,a5
    4a68:	f7442783          	lw	a5,-140(s0)
    4a6c:	00278793          	add	a5,a5,2
    4a70:	03070713          	add	a4,a4,48
    4a74:	0ff77713          	zext.b	a4,a4
    4a78:	00e78023          	sb	a4,0(a5)
    4a7c:	fec42703          	lw	a4,-20(s0)
    4a80:	00a00793          	li	a5,10
    4a84:	02f747b3          	div	a5,a4,a5
    4a88:	fef42623          	sw	a5,-20(s0)
    4a8c:	fec42703          	lw	a4,-20(s0)
    4a90:	00a00793          	li	a5,10
    4a94:	02f767b3          	rem	a5,a4,a5
    4a98:	0ff7f713          	zext.b	a4,a5
    4a9c:	f7442783          	lw	a5,-140(s0)
    4aa0:	00178793          	add	a5,a5,1
    4aa4:	03070713          	add	a4,a4,48
    4aa8:	0ff77713          	zext.b	a4,a4
    4aac:	00e78023          	sb	a4,0(a5)
    4ab0:	fec42703          	lw	a4,-20(s0)
    4ab4:	00a00793          	li	a5,10
    4ab8:	02f747b3          	div	a5,a4,a5
    4abc:	fef42623          	sw	a5,-20(s0)
    4ac0:	fec42703          	lw	a4,-20(s0)
    4ac4:	00a00793          	li	a5,10
    4ac8:	02f767b3          	rem	a5,a4,a5
    4acc:	0ff7f793          	zext.b	a5,a5
    4ad0:	03078793          	add	a5,a5,48
    4ad4:	0ff7f713          	zext.b	a4,a5
    4ad8:	f7442783          	lw	a5,-140(s0)
    4adc:	00e78023          	sb	a4,0(a5)
    4ae0:	f7442783          	lw	a5,-140(s0)
    4ae4:	00378793          	add	a5,a5,3
    4ae8:	f6f42a23          	sw	a5,-140(s0)
    4aec:	1b80006f          	j	4ca4 <parse_float+0x478>
    4af0:	f7344703          	lbu	a4,-141(s0)
    4af4:	06600793          	li	a5,102
    4af8:	1af71663          	bne	a4,a5,4ca4 <parse_float+0x478>
    4afc:	f8440793          	add	a5,s0,-124
    4b00:	fd440713          	add	a4,s0,-44
    4b04:	fd840693          	add	a3,s0,-40
    4b08:	f6c42603          	lw	a2,-148(s0)
    4b0c:	f7842503          	lw	a0,-136(s0)
    4b10:	f7c42583          	lw	a1,-132(s0)
    4b14:	bccff0ef          	jal	3ee0 <fcvtbuf>
    4b18:	fea42223          	sw	a0,-28(s0)
    4b1c:	fd442783          	lw	a5,-44(s0)
    4b20:	00078c63          	beqz	a5,4b38 <parse_float+0x30c>
    4b24:	f7442783          	lw	a5,-140(s0)
    4b28:	00178713          	add	a4,a5,1
    4b2c:	f6e42a23          	sw	a4,-140(s0)
    4b30:	02d00713          	li	a4,45
    4b34:	00e78023          	sb	a4,0(a5)
    4b38:	fe442783          	lw	a5,-28(s0)
    4b3c:	0007c783          	lbu	a5,0(a5)
    4b40:	10078063          	beqz	a5,4c40 <parse_float+0x414>
    4b44:	fd842783          	lw	a5,-40(s0)
    4b48:	08f04c63          	bgtz	a5,4be0 <parse_float+0x3b4>
    4b4c:	f7442783          	lw	a5,-140(s0)
    4b50:	00178713          	add	a4,a5,1
    4b54:	f6e42a23          	sw	a4,-140(s0)
    4b58:	03000713          	li	a4,48
    4b5c:	00e78023          	sb	a4,0(a5)
    4b60:	f7442783          	lw	a5,-140(s0)
    4b64:	00178713          	add	a4,a5,1
    4b68:	f6e42a23          	sw	a4,-140(s0)
    4b6c:	02e00713          	li	a4,46
    4b70:	00e78023          	sb	a4,0(a5)
    4b74:	fe042423          	sw	zero,-24(s0)
    4b78:	0240006f          	j	4b9c <parse_float+0x370>
    4b7c:	f7442783          	lw	a5,-140(s0)
    4b80:	00178713          	add	a4,a5,1
    4b84:	f6e42a23          	sw	a4,-140(s0)
    4b88:	03000713          	li	a4,48
    4b8c:	00e78023          	sb	a4,0(a5)
    4b90:	fe842783          	lw	a5,-24(s0)
    4b94:	00178793          	add	a5,a5,1
    4b98:	fef42423          	sw	a5,-24(s0)
    4b9c:	fd842783          	lw	a5,-40(s0)
    4ba0:	40f007b3          	neg	a5,a5
    4ba4:	fe842703          	lw	a4,-24(s0)
    4ba8:	fcf74ae3          	blt	a4,a5,4b7c <parse_float+0x350>
    4bac:	0240006f          	j	4bd0 <parse_float+0x3a4>
    4bb0:	fe442703          	lw	a4,-28(s0)
    4bb4:	00170793          	add	a5,a4,1
    4bb8:	fef42223          	sw	a5,-28(s0)
    4bbc:	f7442783          	lw	a5,-140(s0)
    4bc0:	00178693          	add	a3,a5,1
    4bc4:	f6d42a23          	sw	a3,-140(s0)
    4bc8:	00074703          	lbu	a4,0(a4)
    4bcc:	00e78023          	sb	a4,0(a5)
    4bd0:	fe442783          	lw	a5,-28(s0)
    4bd4:	0007c783          	lbu	a5,0(a5)
    4bd8:	fc079ce3          	bnez	a5,4bb0 <parse_float+0x384>
    4bdc:	0c80006f          	j	4ca4 <parse_float+0x478>
    4be0:	fe042423          	sw	zero,-24(s0)
    4be4:	04c0006f          	j	4c30 <parse_float+0x404>
    4be8:	fe842783          	lw	a5,-24(s0)
    4bec:	00178713          	add	a4,a5,1
    4bf0:	fee42423          	sw	a4,-24(s0)
    4bf4:	fd842703          	lw	a4,-40(s0)
    4bf8:	00e79c63          	bne	a5,a4,4c10 <parse_float+0x3e4>
    4bfc:	f7442783          	lw	a5,-140(s0)
    4c00:	00178713          	add	a4,a5,1
    4c04:	f6e42a23          	sw	a4,-140(s0)
    4c08:	02e00713          	li	a4,46
    4c0c:	00e78023          	sb	a4,0(a5)
    4c10:	fe442703          	lw	a4,-28(s0)
    4c14:	00170793          	add	a5,a4,1
    4c18:	fef42223          	sw	a5,-28(s0)
    4c1c:	f7442783          	lw	a5,-140(s0)
    4c20:	00178693          	add	a3,a5,1
    4c24:	f6d42a23          	sw	a3,-140(s0)
    4c28:	00074703          	lbu	a4,0(a4)
    4c2c:	00e78023          	sb	a4,0(a5)
    4c30:	fe442783          	lw	a5,-28(s0)
    4c34:	0007c783          	lbu	a5,0(a5)
    4c38:	fa0798e3          	bnez	a5,4be8 <parse_float+0x3bc>
    4c3c:	0680006f          	j	4ca4 <parse_float+0x478>
    4c40:	f7442783          	lw	a5,-140(s0)
    4c44:	00178713          	add	a4,a5,1
    4c48:	f6e42a23          	sw	a4,-140(s0)
    4c4c:	03000713          	li	a4,48
    4c50:	00e78023          	sb	a4,0(a5)
    4c54:	f6c42783          	lw	a5,-148(s0)
    4c58:	04f05663          	blez	a5,4ca4 <parse_float+0x478>
    4c5c:	f7442783          	lw	a5,-140(s0)
    4c60:	00178713          	add	a4,a5,1
    4c64:	f6e42a23          	sw	a4,-140(s0)
    4c68:	02e00713          	li	a4,46
    4c6c:	00e78023          	sb	a4,0(a5)
    4c70:	fe042423          	sw	zero,-24(s0)
    4c74:	0240006f          	j	4c98 <parse_float+0x46c>
    4c78:	f7442783          	lw	a5,-140(s0)
    4c7c:	00178713          	add	a4,a5,1
    4c80:	f6e42a23          	sw	a4,-140(s0)
    4c84:	03000713          	li	a4,48
    4c88:	00e78023          	sb	a4,0(a5)
    4c8c:	fe842783          	lw	a5,-24(s0)
    4c90:	00178793          	add	a5,a5,1
    4c94:	fef42423          	sw	a5,-24(s0)
    4c98:	fe842703          	lw	a4,-24(s0)
    4c9c:	f6c42783          	lw	a5,-148(s0)
    4ca0:	fcf74ce3          	blt	a4,a5,4c78 <parse_float+0x44c>
    4ca4:	f7442783          	lw	a5,-140(s0)
    4ca8:	00078023          	sb	zero,0(a5)
    4cac:	00000013          	nop
    4cb0:	09c12083          	lw	ra,156(sp)
    4cb4:	09812403          	lw	s0,152(sp)
    4cb8:	0a010113          	add	sp,sp,160
    4cbc:	00008067          	ret

00004cc0 <decimal_point>:
    4cc0:	fd010113          	add	sp,sp,-48
    4cc4:	02112623          	sw	ra,44(sp)
    4cc8:	02812423          	sw	s0,40(sp)
    4ccc:	03010413          	add	s0,sp,48
    4cd0:	fca42e23          	sw	a0,-36(s0)
    4cd4:	0400006f          	j	4d14 <decimal_point+0x54>
    4cd8:	fdc42783          	lw	a5,-36(s0)
    4cdc:	0007c703          	lbu	a4,0(a5)
    4ce0:	02e00793          	li	a5,46
    4ce4:	0cf70463          	beq	a4,a5,4dac <decimal_point+0xec>
    4ce8:	fdc42783          	lw	a5,-36(s0)
    4cec:	0007c703          	lbu	a4,0(a5)
    4cf0:	06500793          	li	a5,101
    4cf4:	02f70663          	beq	a4,a5,4d20 <decimal_point+0x60>
    4cf8:	fdc42783          	lw	a5,-36(s0)
    4cfc:	0007c703          	lbu	a4,0(a5)
    4d00:	04500793          	li	a5,69
    4d04:	00f70e63          	beq	a4,a5,4d20 <decimal_point+0x60>
    4d08:	fdc42783          	lw	a5,-36(s0)
    4d0c:	00178793          	add	a5,a5,1
    4d10:	fcf42e23          	sw	a5,-36(s0)
    4d14:	fdc42783          	lw	a5,-36(s0)
    4d18:	0007c783          	lbu	a5,0(a5)
    4d1c:	fa079ee3          	bnez	a5,4cd8 <decimal_point+0x18>
    4d20:	fdc42783          	lw	a5,-36(s0)
    4d24:	0007c783          	lbu	a5,0(a5)
    4d28:	06078263          	beqz	a5,4d8c <decimal_point+0xcc>
    4d2c:	10000593          	li	a1,256
    4d30:	fdc42503          	lw	a0,-36(s0)
    4d34:	a0cff0ef          	jal	3f40 <strnlen>
    4d38:	00050793          	mv	a5,a0
    4d3c:	fef42623          	sw	a5,-20(s0)
    4d40:	0340006f          	j	4d74 <decimal_point+0xb4>
    4d44:	fec42783          	lw	a5,-20(s0)
    4d48:	fdc42703          	lw	a4,-36(s0)
    4d4c:	00f70733          	add	a4,a4,a5
    4d50:	fec42783          	lw	a5,-20(s0)
    4d54:	00178793          	add	a5,a5,1
    4d58:	fdc42683          	lw	a3,-36(s0)
    4d5c:	00f687b3          	add	a5,a3,a5
    4d60:	00074703          	lbu	a4,0(a4)
    4d64:	00e78023          	sb	a4,0(a5)
    4d68:	fec42783          	lw	a5,-20(s0)
    4d6c:	fff78793          	add	a5,a5,-1
    4d70:	fef42623          	sw	a5,-20(s0)
    4d74:	fec42783          	lw	a5,-20(s0)
    4d78:	fcf046e3          	bgtz	a5,4d44 <decimal_point+0x84>
    4d7c:	fdc42783          	lw	a5,-36(s0)
    4d80:	02e00713          	li	a4,46
    4d84:	00e78023          	sb	a4,0(a5)
    4d88:	0280006f          	j	4db0 <decimal_point+0xf0>
    4d8c:	fdc42783          	lw	a5,-36(s0)
    4d90:	00178713          	add	a4,a5,1
    4d94:	fce42e23          	sw	a4,-36(s0)
    4d98:	02e00713          	li	a4,46
    4d9c:	00e78023          	sb	a4,0(a5)
    4da0:	fdc42783          	lw	a5,-36(s0)
    4da4:	00078023          	sb	zero,0(a5)
    4da8:	0080006f          	j	4db0 <decimal_point+0xf0>
    4dac:	00000013          	nop
    4db0:	02c12083          	lw	ra,44(sp)
    4db4:	02812403          	lw	s0,40(sp)
    4db8:	03010113          	add	sp,sp,48
    4dbc:	00008067          	ret

00004dc0 <cropzeros>:
    4dc0:	fd010113          	add	sp,sp,-48
    4dc4:	02812623          	sw	s0,44(sp)
    4dc8:	03010413          	add	s0,sp,48
    4dcc:	fca42e23          	sw	a0,-36(s0)
    4dd0:	0100006f          	j	4de0 <cropzeros+0x20>
    4dd4:	fdc42783          	lw	a5,-36(s0)
    4dd8:	00178793          	add	a5,a5,1
    4ddc:	fcf42e23          	sw	a5,-36(s0)
    4de0:	fdc42783          	lw	a5,-36(s0)
    4de4:	0007c783          	lbu	a5,0(a5)
    4de8:	00078a63          	beqz	a5,4dfc <cropzeros+0x3c>
    4dec:	fdc42783          	lw	a5,-36(s0)
    4df0:	0007c703          	lbu	a4,0(a5)
    4df4:	02e00793          	li	a5,46
    4df8:	fcf71ee3          	bne	a4,a5,4dd4 <cropzeros+0x14>
    4dfc:	fdc42783          	lw	a5,-36(s0)
    4e00:	00178713          	add	a4,a5,1
    4e04:	fce42e23          	sw	a4,-36(s0)
    4e08:	0007c783          	lbu	a5,0(a5)
    4e0c:	0a078863          	beqz	a5,4ebc <cropzeros+0xfc>
    4e10:	0100006f          	j	4e20 <cropzeros+0x60>
    4e14:	fdc42783          	lw	a5,-36(s0)
    4e18:	00178793          	add	a5,a5,1
    4e1c:	fcf42e23          	sw	a5,-36(s0)
    4e20:	fdc42783          	lw	a5,-36(s0)
    4e24:	0007c783          	lbu	a5,0(a5)
    4e28:	02078263          	beqz	a5,4e4c <cropzeros+0x8c>
    4e2c:	fdc42783          	lw	a5,-36(s0)
    4e30:	0007c703          	lbu	a4,0(a5)
    4e34:	06500793          	li	a5,101
    4e38:	00f70a63          	beq	a4,a5,4e4c <cropzeros+0x8c>
    4e3c:	fdc42783          	lw	a5,-36(s0)
    4e40:	0007c703          	lbu	a4,0(a5)
    4e44:	04500793          	li	a5,69
    4e48:	fcf716e3          	bne	a4,a5,4e14 <cropzeros+0x54>
    4e4c:	fdc42783          	lw	a5,-36(s0)
    4e50:	fff78713          	add	a4,a5,-1
    4e54:	fce42e23          	sw	a4,-36(s0)
    4e58:	fef42623          	sw	a5,-20(s0)
    4e5c:	0100006f          	j	4e6c <cropzeros+0xac>
    4e60:	fdc42783          	lw	a5,-36(s0)
    4e64:	fff78793          	add	a5,a5,-1
    4e68:	fcf42e23          	sw	a5,-36(s0)
    4e6c:	fdc42783          	lw	a5,-36(s0)
    4e70:	0007c703          	lbu	a4,0(a5)
    4e74:	03000793          	li	a5,48
    4e78:	fef704e3          	beq	a4,a5,4e60 <cropzeros+0xa0>
    4e7c:	fdc42783          	lw	a5,-36(s0)
    4e80:	0007c703          	lbu	a4,0(a5)
    4e84:	02e00793          	li	a5,46
    4e88:	02f71463          	bne	a4,a5,4eb0 <cropzeros+0xf0>
    4e8c:	fdc42783          	lw	a5,-36(s0)
    4e90:	fff78793          	add	a5,a5,-1
    4e94:	fcf42e23          	sw	a5,-36(s0)
    4e98:	0180006f          	j	4eb0 <cropzeros+0xf0>
    4e9c:	fdc42783          	lw	a5,-36(s0)
    4ea0:	00178793          	add	a5,a5,1
    4ea4:	fcf42e23          	sw	a5,-36(s0)
    4ea8:	fdc42783          	lw	a5,-36(s0)
    4eac:	00078023          	sb	zero,0(a5)
    4eb0:	fdc42703          	lw	a4,-36(s0)
    4eb4:	fec42783          	lw	a5,-20(s0)
    4eb8:	fef712e3          	bne	a4,a5,4e9c <cropzeros+0xdc>
    4ebc:	00000013          	nop
    4ec0:	02c12403          	lw	s0,44(sp)
    4ec4:	03010113          	add	sp,sp,48
    4ec8:	00008067          	ret

00004ecc <flt>:
    4ecc:	f7010113          	add	sp,sp,-144
    4ed0:	08112623          	sw	ra,140(sp)
    4ed4:	08812423          	sw	s0,136(sp)
    4ed8:	09212223          	sw	s2,132(sp)
    4edc:	09312023          	sw	s3,128(sp)
    4ee0:	09010413          	add	s0,sp,144
    4ee4:	f8a42623          	sw	a0,-116(s0)
    4ee8:	f8b42023          	sw	a1,-128(s0)
    4eec:	f8c42223          	sw	a2,-124(s0)
    4ef0:	f8d42423          	sw	a3,-120(s0)
    4ef4:	f6e42e23          	sw	a4,-132(s0)
    4ef8:	f7042a23          	sw	a6,-140(s0)
    4efc:	f6f40da3          	sb	a5,-133(s0)
    4f00:	f7442783          	lw	a5,-140(s0)
    4f04:	0107f793          	and	a5,a5,16
    4f08:	00078863          	beqz	a5,4f18 <flt+0x4c>
    4f0c:	f7442783          	lw	a5,-140(s0)
    4f10:	ffe7f793          	and	a5,a5,-2
    4f14:	f6f42a23          	sw	a5,-140(s0)
    4f18:	f7442783          	lw	a5,-140(s0)
    4f1c:	0017f793          	and	a5,a5,1
    4f20:	00078663          	beqz	a5,4f2c <flt+0x60>
    4f24:	03000793          	li	a5,48
    4f28:	0080006f          	j	4f30 <flt+0x64>
    4f2c:	02000793          	li	a5,32
    4f30:	fef403a3          	sb	a5,-25(s0)
    4f34:	fe0407a3          	sb	zero,-17(s0)
    4f38:	f7442783          	lw	a5,-140(s0)
    4f3c:	0027f793          	and	a5,a5,2
    4f40:	08078a63          	beqz	a5,4fd4 <flt+0x108>
    4f44:	00000613          	li	a2,0
    4f48:	00000693          	li	a3,0
    4f4c:	f8042503          	lw	a0,-128(s0)
    4f50:	f8442583          	lw	a1,-124(s0)
    4f54:	375010ef          	jal	6ac8 <__ledf2>
    4f58:	00050793          	mv	a5,a0
    4f5c:	0207da63          	bgez	a5,4f90 <flt+0xc4>
    4f60:	02d00793          	li	a5,45
    4f64:	fef407a3          	sb	a5,-17(s0)
    4f68:	f8042903          	lw	s2,-128(s0)
    4f6c:	f8442703          	lw	a4,-124(s0)
    4f70:	800007b7          	lui	a5,0x80000
    4f74:	00f749b3          	xor	s3,a4,a5
    4f78:	f9242023          	sw	s2,-128(s0)
    4f7c:	f9342223          	sw	s3,-124(s0)
    4f80:	f8842783          	lw	a5,-120(s0)
    4f84:	fff78793          	add	a5,a5,-1 # 7fffffff <__subdf3+0x7fff8927>
    4f88:	f8f42423          	sw	a5,-120(s0)
    4f8c:	0480006f          	j	4fd4 <flt+0x108>
    4f90:	f7442783          	lw	a5,-140(s0)
    4f94:	0047f793          	and	a5,a5,4
    4f98:	00078e63          	beqz	a5,4fb4 <flt+0xe8>
    4f9c:	02b00793          	li	a5,43
    4fa0:	fef407a3          	sb	a5,-17(s0)
    4fa4:	f8842783          	lw	a5,-120(s0)
    4fa8:	fff78793          	add	a5,a5,-1
    4fac:	f8f42423          	sw	a5,-120(s0)
    4fb0:	0240006f          	j	4fd4 <flt+0x108>
    4fb4:	f7442783          	lw	a5,-140(s0)
    4fb8:	0087f793          	and	a5,a5,8
    4fbc:	00078c63          	beqz	a5,4fd4 <flt+0x108>
    4fc0:	02000793          	li	a5,32
    4fc4:	fef407a3          	sb	a5,-17(s0)
    4fc8:	f8842783          	lw	a5,-120(s0)
    4fcc:	fff78793          	add	a5,a5,-1
    4fd0:	f8f42423          	sw	a5,-120(s0)
    4fd4:	f7c42783          	lw	a5,-132(s0)
    4fd8:	0007d663          	bgez	a5,4fe4 <flt+0x118>
    4fdc:	00600793          	li	a5,6
    4fe0:	f6f42e23          	sw	a5,-132(s0)
    4fe4:	f7b44683          	lbu	a3,-133(s0)
    4fe8:	f9040793          	add	a5,s0,-112
    4fec:	f7c42703          	lw	a4,-132(s0)
    4ff0:	00078613          	mv	a2,a5
    4ff4:	f8042503          	lw	a0,-128(s0)
    4ff8:	f8442583          	lw	a1,-124(s0)
    4ffc:	831ff0ef          	jal	482c <parse_float>
    5000:	f7442783          	lw	a5,-140(s0)
    5004:	0207f793          	and	a5,a5,32
    5008:	00078c63          	beqz	a5,5020 <flt+0x154>
    500c:	f7c42783          	lw	a5,-132(s0)
    5010:	00079863          	bnez	a5,5020 <flt+0x154>
    5014:	f9040793          	add	a5,s0,-112
    5018:	00078513          	mv	a0,a5
    501c:	ca5ff0ef          	jal	4cc0 <decimal_point>
    5020:	f7b44703          	lbu	a4,-133(s0)
    5024:	06700793          	li	a5,103
    5028:	00f71e63          	bne	a4,a5,5044 <flt+0x178>
    502c:	f7442783          	lw	a5,-140(s0)
    5030:	0207f793          	and	a5,a5,32
    5034:	00079863          	bnez	a5,5044 <flt+0x178>
    5038:	f9040793          	add	a5,s0,-112
    503c:	00078513          	mv	a0,a5
    5040:	d81ff0ef          	jal	4dc0 <cropzeros>
    5044:	f9040793          	add	a5,s0,-112
    5048:	10000593          	li	a1,256
    504c:	00078513          	mv	a0,a5
    5050:	ef1fe0ef          	jal	3f40 <strnlen>
    5054:	00050793          	mv	a5,a0
    5058:	fef42023          	sw	a5,-32(s0)
    505c:	f8842703          	lw	a4,-120(s0)
    5060:	fe042783          	lw	a5,-32(s0)
    5064:	40f707b3          	sub	a5,a4,a5
    5068:	f8f42423          	sw	a5,-120(s0)
    506c:	f7442783          	lw	a5,-140(s0)
    5070:	0117f793          	and	a5,a5,17
    5074:	02079663          	bnez	a5,50a0 <flt+0x1d4>
    5078:	0180006f          	j	5090 <flt+0x1c4>
    507c:	f8c42783          	lw	a5,-116(s0)
    5080:	00178713          	add	a4,a5,1
    5084:	f8e42623          	sw	a4,-116(s0)
    5088:	02000713          	li	a4,32
    508c:	00e78023          	sb	a4,0(a5)
    5090:	f8842783          	lw	a5,-120(s0)
    5094:	fff78713          	add	a4,a5,-1
    5098:	f8e42423          	sw	a4,-120(s0)
    509c:	fef040e3          	bgtz	a5,507c <flt+0x1b0>
    50a0:	fef44783          	lbu	a5,-17(s0)
    50a4:	00078c63          	beqz	a5,50bc <flt+0x1f0>
    50a8:	f8c42783          	lw	a5,-116(s0)
    50ac:	00178713          	add	a4,a5,1
    50b0:	f8e42623          	sw	a4,-116(s0)
    50b4:	fef44703          	lbu	a4,-17(s0)
    50b8:	00e78023          	sb	a4,0(a5)
    50bc:	f7442783          	lw	a5,-140(s0)
    50c0:	0107f793          	and	a5,a5,16
    50c4:	02079663          	bnez	a5,50f0 <flt+0x224>
    50c8:	0180006f          	j	50e0 <flt+0x214>
    50cc:	f8c42783          	lw	a5,-116(s0)
    50d0:	00178713          	add	a4,a5,1
    50d4:	f8e42623          	sw	a4,-116(s0)
    50d8:	fe744703          	lbu	a4,-25(s0)
    50dc:	00e78023          	sb	a4,0(a5)
    50e0:	f8842783          	lw	a5,-120(s0)
    50e4:	fff78713          	add	a4,a5,-1
    50e8:	f8e42423          	sw	a4,-120(s0)
    50ec:	fef040e3          	bgtz	a5,50cc <flt+0x200>
    50f0:	fe042423          	sw	zero,-24(s0)
    50f4:	0300006f          	j	5124 <flt+0x258>
    50f8:	f8c42783          	lw	a5,-116(s0)
    50fc:	00178713          	add	a4,a5,1
    5100:	f8e42623          	sw	a4,-116(s0)
    5104:	fe842703          	lw	a4,-24(s0)
    5108:	ff070713          	add	a4,a4,-16
    510c:	00870733          	add	a4,a4,s0
    5110:	fa074703          	lbu	a4,-96(a4)
    5114:	00e78023          	sb	a4,0(a5)
    5118:	fe842783          	lw	a5,-24(s0)
    511c:	00178793          	add	a5,a5,1
    5120:	fef42423          	sw	a5,-24(s0)
    5124:	fe842703          	lw	a4,-24(s0)
    5128:	fe042783          	lw	a5,-32(s0)
    512c:	fcf746e3          	blt	a4,a5,50f8 <flt+0x22c>
    5130:	0180006f          	j	5148 <flt+0x27c>
    5134:	f8c42783          	lw	a5,-116(s0)
    5138:	00178713          	add	a4,a5,1
    513c:	f8e42623          	sw	a4,-116(s0)
    5140:	02000713          	li	a4,32
    5144:	00e78023          	sb	a4,0(a5)
    5148:	f8842783          	lw	a5,-120(s0)
    514c:	fff78713          	add	a4,a5,-1
    5150:	f8e42423          	sw	a4,-120(s0)
    5154:	fef040e3          	bgtz	a5,5134 <flt+0x268>
    5158:	f8c42783          	lw	a5,-116(s0)
    515c:	00078513          	mv	a0,a5
    5160:	08c12083          	lw	ra,140(sp)
    5164:	08812403          	lw	s0,136(sp)
    5168:	08412903          	lw	s2,132(sp)
    516c:	08012983          	lw	s3,128(sp)
    5170:	09010113          	add	sp,sp,144
    5174:	00008067          	ret

00005178 <ee_vsprintf>:
    5178:	fb010113          	add	sp,sp,-80
    517c:	04112623          	sw	ra,76(sp)
    5180:	04812423          	sw	s0,72(sp)
    5184:	05010413          	add	s0,sp,80
    5188:	faa42e23          	sw	a0,-68(s0)
    518c:	fab42c23          	sw	a1,-72(s0)
    5190:	fac42a23          	sw	a2,-76(s0)
    5194:	fbc42783          	lw	a5,-68(s0)
    5198:	fef42023          	sw	a5,-32(s0)
    519c:	5f40006f          	j	5790 <ee_vsprintf+0x618>
    51a0:	fb842783          	lw	a5,-72(s0)
    51a4:	0007c703          	lbu	a4,0(a5)
    51a8:	02500793          	li	a5,37
    51ac:	02f70063          	beq	a4,a5,51cc <ee_vsprintf+0x54>
    51b0:	fb842703          	lw	a4,-72(s0)
    51b4:	fe042783          	lw	a5,-32(s0)
    51b8:	00178693          	add	a3,a5,1
    51bc:	fed42023          	sw	a3,-32(s0)
    51c0:	00074703          	lbu	a4,0(a4)
    51c4:	00e78023          	sb	a4,0(a5)
    51c8:	5bc0006f          	j	5784 <ee_vsprintf+0x60c>
    51cc:	fc042c23          	sw	zero,-40(s0)
    51d0:	fb842783          	lw	a5,-72(s0)
    51d4:	00178793          	add	a5,a5,1
    51d8:	faf42c23          	sw	a5,-72(s0)
    51dc:	fb842783          	lw	a5,-72(s0)
    51e0:	0007c783          	lbu	a5,0(a5)
    51e4:	fe078793          	add	a5,a5,-32
    51e8:	01000713          	li	a4,16
    51ec:	06f76463          	bltu	a4,a5,5254 <ee_vsprintf+0xdc>
    51f0:	00279713          	sll	a4,a5,0x2
    51f4:	67000793          	li	a5,1648
    51f8:	00f707b3          	add	a5,a4,a5
    51fc:	0007a783          	lw	a5,0(a5)
    5200:	00078067          	jr	a5
    5204:	fd842783          	lw	a5,-40(s0)
    5208:	0107e793          	or	a5,a5,16
    520c:	fcf42c23          	sw	a5,-40(s0)
    5210:	fc1ff06f          	j	51d0 <ee_vsprintf+0x58>
    5214:	fd842783          	lw	a5,-40(s0)
    5218:	0047e793          	or	a5,a5,4
    521c:	fcf42c23          	sw	a5,-40(s0)
    5220:	fb1ff06f          	j	51d0 <ee_vsprintf+0x58>
    5224:	fd842783          	lw	a5,-40(s0)
    5228:	0087e793          	or	a5,a5,8
    522c:	fcf42c23          	sw	a5,-40(s0)
    5230:	fa1ff06f          	j	51d0 <ee_vsprintf+0x58>
    5234:	fd842783          	lw	a5,-40(s0)
    5238:	0207e793          	or	a5,a5,32
    523c:	fcf42c23          	sw	a5,-40(s0)
    5240:	f91ff06f          	j	51d0 <ee_vsprintf+0x58>
    5244:	fd842783          	lw	a5,-40(s0)
    5248:	0017e793          	or	a5,a5,1
    524c:	fcf42c23          	sw	a5,-40(s0)
    5250:	f81ff06f          	j	51d0 <ee_vsprintf+0x58>
    5254:	fff00793          	li	a5,-1
    5258:	fcf42a23          	sw	a5,-44(s0)
    525c:	fb842783          	lw	a5,-72(s0)
    5260:	0007c703          	lbu	a4,0(a5)
    5264:	02f00793          	li	a5,47
    5268:	02e7f463          	bgeu	a5,a4,5290 <ee_vsprintf+0x118>
    526c:	fb842783          	lw	a5,-72(s0)
    5270:	0007c703          	lbu	a4,0(a5)
    5274:	03900793          	li	a5,57
    5278:	00e7ec63          	bltu	a5,a4,5290 <ee_vsprintf+0x118>
    527c:	fb840793          	add	a5,s0,-72
    5280:	00078513          	mv	a0,a5
    5284:	d21fe0ef          	jal	3fa4 <skip_atoi>
    5288:	fca42a23          	sw	a0,-44(s0)
    528c:	0540006f          	j	52e0 <ee_vsprintf+0x168>
    5290:	fb842783          	lw	a5,-72(s0)
    5294:	0007c703          	lbu	a4,0(a5)
    5298:	02a00793          	li	a5,42
    529c:	04f71263          	bne	a4,a5,52e0 <ee_vsprintf+0x168>
    52a0:	fb842783          	lw	a5,-72(s0)
    52a4:	00178793          	add	a5,a5,1
    52a8:	faf42c23          	sw	a5,-72(s0)
    52ac:	fb442783          	lw	a5,-76(s0)
    52b0:	00478713          	add	a4,a5,4
    52b4:	fae42a23          	sw	a4,-76(s0)
    52b8:	0007a783          	lw	a5,0(a5)
    52bc:	fcf42a23          	sw	a5,-44(s0)
    52c0:	fd442783          	lw	a5,-44(s0)
    52c4:	0007de63          	bgez	a5,52e0 <ee_vsprintf+0x168>
    52c8:	fd442783          	lw	a5,-44(s0)
    52cc:	40f007b3          	neg	a5,a5
    52d0:	fcf42a23          	sw	a5,-44(s0)
    52d4:	fd842783          	lw	a5,-40(s0)
    52d8:	0107e793          	or	a5,a5,16
    52dc:	fcf42c23          	sw	a5,-40(s0)
    52e0:	fff00793          	li	a5,-1
    52e4:	fcf42823          	sw	a5,-48(s0)
    52e8:	fb842783          	lw	a5,-72(s0)
    52ec:	0007c703          	lbu	a4,0(a5)
    52f0:	02e00793          	li	a5,46
    52f4:	08f71063          	bne	a4,a5,5374 <ee_vsprintf+0x1fc>
    52f8:	fb842783          	lw	a5,-72(s0)
    52fc:	00178793          	add	a5,a5,1
    5300:	faf42c23          	sw	a5,-72(s0)
    5304:	fb842783          	lw	a5,-72(s0)
    5308:	0007c703          	lbu	a4,0(a5)
    530c:	02f00793          	li	a5,47
    5310:	02e7f463          	bgeu	a5,a4,5338 <ee_vsprintf+0x1c0>
    5314:	fb842783          	lw	a5,-72(s0)
    5318:	0007c703          	lbu	a4,0(a5)
    531c:	03900793          	li	a5,57
    5320:	00e7ec63          	bltu	a5,a4,5338 <ee_vsprintf+0x1c0>
    5324:	fb840793          	add	a5,s0,-72
    5328:	00078513          	mv	a0,a5
    532c:	c79fe0ef          	jal	3fa4 <skip_atoi>
    5330:	fca42823          	sw	a0,-48(s0)
    5334:	0340006f          	j	5368 <ee_vsprintf+0x1f0>
    5338:	fb842783          	lw	a5,-72(s0)
    533c:	0007c703          	lbu	a4,0(a5)
    5340:	02a00793          	li	a5,42
    5344:	02f71263          	bne	a4,a5,5368 <ee_vsprintf+0x1f0>
    5348:	fb842783          	lw	a5,-72(s0)
    534c:	00178793          	add	a5,a5,1
    5350:	faf42c23          	sw	a5,-72(s0)
    5354:	fb442783          	lw	a5,-76(s0)
    5358:	00478713          	add	a4,a5,4
    535c:	fae42a23          	sw	a4,-76(s0)
    5360:	0007a783          	lw	a5,0(a5)
    5364:	fcf42823          	sw	a5,-48(s0)
    5368:	fd042783          	lw	a5,-48(s0)
    536c:	0007d463          	bgez	a5,5374 <ee_vsprintf+0x1fc>
    5370:	fc042823          	sw	zero,-48(s0)
    5374:	fff00793          	li	a5,-1
    5378:	fcf42623          	sw	a5,-52(s0)
    537c:	fb842783          	lw	a5,-72(s0)
    5380:	0007c703          	lbu	a4,0(a5)
    5384:	06c00793          	li	a5,108
    5388:	00f70a63          	beq	a4,a5,539c <ee_vsprintf+0x224>
    538c:	fb842783          	lw	a5,-72(s0)
    5390:	0007c703          	lbu	a4,0(a5)
    5394:	04c00793          	li	a5,76
    5398:	00f71e63          	bne	a4,a5,53b4 <ee_vsprintf+0x23c>
    539c:	fb842783          	lw	a5,-72(s0)
    53a0:	0007c783          	lbu	a5,0(a5)
    53a4:	fcf42623          	sw	a5,-52(s0)
    53a8:	fb842783          	lw	a5,-72(s0)
    53ac:	00178793          	add	a5,a5,1
    53b0:	faf42c23          	sw	a5,-72(s0)
    53b4:	00a00793          	li	a5,10
    53b8:	fef42223          	sw	a5,-28(s0)
    53bc:	fb842783          	lw	a5,-72(s0)
    53c0:	0007c783          	lbu	a5,0(a5)
    53c4:	fbf78793          	add	a5,a5,-65
    53c8:	03700713          	li	a4,55
    53cc:	2cf76e63          	bltu	a4,a5,56a8 <ee_vsprintf+0x530>
    53d0:	00279713          	sll	a4,a5,0x2
    53d4:	6b400793          	li	a5,1716
    53d8:	00f707b3          	add	a5,a4,a5
    53dc:	0007a783          	lw	a5,0(a5)
    53e0:	00078067          	jr	a5
    53e4:	fd842783          	lw	a5,-40(s0)
    53e8:	0107f793          	and	a5,a5,16
    53ec:	02079863          	bnez	a5,541c <ee_vsprintf+0x2a4>
    53f0:	0180006f          	j	5408 <ee_vsprintf+0x290>
    53f4:	fe042783          	lw	a5,-32(s0)
    53f8:	00178713          	add	a4,a5,1
    53fc:	fee42023          	sw	a4,-32(s0)
    5400:	02000713          	li	a4,32
    5404:	00e78023          	sb	a4,0(a5)
    5408:	fd442783          	lw	a5,-44(s0)
    540c:	fff78793          	add	a5,a5,-1
    5410:	fcf42a23          	sw	a5,-44(s0)
    5414:	fd442783          	lw	a5,-44(s0)
    5418:	fcf04ee3          	bgtz	a5,53f4 <ee_vsprintf+0x27c>
    541c:	fb442783          	lw	a5,-76(s0)
    5420:	00478713          	add	a4,a5,4
    5424:	fae42a23          	sw	a4,-76(s0)
    5428:	0007a683          	lw	a3,0(a5)
    542c:	fe042783          	lw	a5,-32(s0)
    5430:	00178713          	add	a4,a5,1
    5434:	fee42023          	sw	a4,-32(s0)
    5438:	0ff6f713          	zext.b	a4,a3
    543c:	00e78023          	sb	a4,0(a5)
    5440:	0180006f          	j	5458 <ee_vsprintf+0x2e0>
    5444:	fe042783          	lw	a5,-32(s0)
    5448:	00178713          	add	a4,a5,1
    544c:	fee42023          	sw	a4,-32(s0)
    5450:	02000713          	li	a4,32
    5454:	00e78023          	sb	a4,0(a5)
    5458:	fd442783          	lw	a5,-44(s0)
    545c:	fff78793          	add	a5,a5,-1
    5460:	fcf42a23          	sw	a5,-44(s0)
    5464:	fd442783          	lw	a5,-44(s0)
    5468:	fcf04ee3          	bgtz	a5,5444 <ee_vsprintf+0x2cc>
    546c:	3180006f          	j	5784 <ee_vsprintf+0x60c>
    5470:	fb442783          	lw	a5,-76(s0)
    5474:	00478713          	add	a4,a5,4
    5478:	fae42a23          	sw	a4,-76(s0)
    547c:	0007a783          	lw	a5,0(a5)
    5480:	fcf42e23          	sw	a5,-36(s0)
    5484:	fdc42783          	lw	a5,-36(s0)
    5488:	00079663          	bnez	a5,5494 <ee_vsprintf+0x31c>
    548c:	66800793          	li	a5,1640
    5490:	fcf42e23          	sw	a5,-36(s0)
    5494:	fd042783          	lw	a5,-48(s0)
    5498:	00078593          	mv	a1,a5
    549c:	fdc42503          	lw	a0,-36(s0)
    54a0:	aa1fe0ef          	jal	3f40 <strnlen>
    54a4:	00050793          	mv	a5,a0
    54a8:	fcf42423          	sw	a5,-56(s0)
    54ac:	fd842783          	lw	a5,-40(s0)
    54b0:	0107f793          	and	a5,a5,16
    54b4:	02079863          	bnez	a5,54e4 <ee_vsprintf+0x36c>
    54b8:	0180006f          	j	54d0 <ee_vsprintf+0x358>
    54bc:	fe042783          	lw	a5,-32(s0)
    54c0:	00178713          	add	a4,a5,1
    54c4:	fee42023          	sw	a4,-32(s0)
    54c8:	02000713          	li	a4,32
    54cc:	00e78023          	sb	a4,0(a5)
    54d0:	fd442783          	lw	a5,-44(s0)
    54d4:	fff78713          	add	a4,a5,-1
    54d8:	fce42a23          	sw	a4,-44(s0)
    54dc:	fc842703          	lw	a4,-56(s0)
    54e0:	fcf74ee3          	blt	a4,a5,54bc <ee_vsprintf+0x344>
    54e4:	fe042423          	sw	zero,-24(s0)
    54e8:	0300006f          	j	5518 <ee_vsprintf+0x3a0>
    54ec:	fdc42703          	lw	a4,-36(s0)
    54f0:	00170793          	add	a5,a4,1
    54f4:	fcf42e23          	sw	a5,-36(s0)
    54f8:	fe042783          	lw	a5,-32(s0)
    54fc:	00178693          	add	a3,a5,1
    5500:	fed42023          	sw	a3,-32(s0)
    5504:	00074703          	lbu	a4,0(a4)
    5508:	00e78023          	sb	a4,0(a5)
    550c:	fe842783          	lw	a5,-24(s0)
    5510:	00178793          	add	a5,a5,1
    5514:	fef42423          	sw	a5,-24(s0)
    5518:	fe842703          	lw	a4,-24(s0)
    551c:	fc842783          	lw	a5,-56(s0)
    5520:	fcf746e3          	blt	a4,a5,54ec <ee_vsprintf+0x374>
    5524:	0180006f          	j	553c <ee_vsprintf+0x3c4>
    5528:	fe042783          	lw	a5,-32(s0)
    552c:	00178713          	add	a4,a5,1
    5530:	fee42023          	sw	a4,-32(s0)
    5534:	02000713          	li	a4,32
    5538:	00e78023          	sb	a4,0(a5)
    553c:	fd442783          	lw	a5,-44(s0)
    5540:	fff78713          	add	a4,a5,-1
    5544:	fce42a23          	sw	a4,-44(s0)
    5548:	fc842703          	lw	a4,-56(s0)
    554c:	fcf74ee3          	blt	a4,a5,5528 <ee_vsprintf+0x3b0>
    5550:	2340006f          	j	5784 <ee_vsprintf+0x60c>
    5554:	fd442703          	lw	a4,-44(s0)
    5558:	fff00793          	li	a5,-1
    555c:	00f71c63          	bne	a4,a5,5574 <ee_vsprintf+0x3fc>
    5560:	00800793          	li	a5,8
    5564:	fcf42a23          	sw	a5,-44(s0)
    5568:	fd842783          	lw	a5,-40(s0)
    556c:	0017e793          	or	a5,a5,1
    5570:	fcf42c23          	sw	a5,-40(s0)
    5574:	fb442783          	lw	a5,-76(s0)
    5578:	00478713          	add	a4,a5,4
    557c:	fae42a23          	sw	a4,-76(s0)
    5580:	0007a783          	lw	a5,0(a5)
    5584:	00078593          	mv	a1,a5
    5588:	fd842783          	lw	a5,-40(s0)
    558c:	fd042703          	lw	a4,-48(s0)
    5590:	fd442683          	lw	a3,-44(s0)
    5594:	01000613          	li	a2,16
    5598:	fe042503          	lw	a0,-32(s0)
    559c:	a99fe0ef          	jal	4034 <number>
    55a0:	fea42023          	sw	a0,-32(s0)
    55a4:	1e00006f          	j	5784 <ee_vsprintf+0x60c>
    55a8:	fd842783          	lw	a5,-40(s0)
    55ac:	0407e793          	or	a5,a5,64
    55b0:	fcf42c23          	sw	a5,-40(s0)
    55b4:	fcc42703          	lw	a4,-52(s0)
    55b8:	06c00793          	li	a5,108
    55bc:	02f71a63          	bne	a4,a5,55f0 <ee_vsprintf+0x478>
    55c0:	fb442783          	lw	a5,-76(s0)
    55c4:	00478713          	add	a4,a5,4
    55c8:	fae42a23          	sw	a4,-76(s0)
    55cc:	0007a783          	lw	a5,0(a5)
    55d0:	fd842703          	lw	a4,-40(s0)
    55d4:	fd042683          	lw	a3,-48(s0)
    55d8:	fd442603          	lw	a2,-44(s0)
    55dc:	00078593          	mv	a1,a5
    55e0:	fe042503          	lw	a0,-32(s0)
    55e4:	dc5fe0ef          	jal	43a8 <eaddr>
    55e8:	fea42023          	sw	a0,-32(s0)
    55ec:	1980006f          	j	5784 <ee_vsprintf+0x60c>
    55f0:	fb442783          	lw	a5,-76(s0)
    55f4:	00478713          	add	a4,a5,4
    55f8:	fae42a23          	sw	a4,-76(s0)
    55fc:	0007a783          	lw	a5,0(a5)
    5600:	fd842703          	lw	a4,-40(s0)
    5604:	fd042683          	lw	a3,-48(s0)
    5608:	fd442603          	lw	a2,-44(s0)
    560c:	00078593          	mv	a1,a5
    5610:	fe042503          	lw	a0,-32(s0)
    5614:	f49fe0ef          	jal	455c <iaddr>
    5618:	fea42023          	sw	a0,-32(s0)
    561c:	1680006f          	j	5784 <ee_vsprintf+0x60c>
    5620:	00800793          	li	a5,8
    5624:	fef42223          	sw	a5,-28(s0)
    5628:	0e00006f          	j	5708 <ee_vsprintf+0x590>
    562c:	fd842783          	lw	a5,-40(s0)
    5630:	0407e793          	or	a5,a5,64
    5634:	fcf42c23          	sw	a5,-40(s0)
    5638:	01000793          	li	a5,16
    563c:	fef42223          	sw	a5,-28(s0)
    5640:	0c80006f          	j	5708 <ee_vsprintf+0x590>
    5644:	fd842783          	lw	a5,-40(s0)
    5648:	0027e793          	or	a5,a5,2
    564c:	fcf42c23          	sw	a5,-40(s0)
    5650:	0b40006f          	j	5704 <ee_vsprintf+0x58c>
    5654:	fb442783          	lw	a5,-76(s0)
    5658:	00778793          	add	a5,a5,7
    565c:	ff87f793          	and	a5,a5,-8
    5660:	00878713          	add	a4,a5,8
    5664:	fae42a23          	sw	a4,-76(s0)
    5668:	0007a503          	lw	a0,0(a5)
    566c:	0047a583          	lw	a1,4(a5)
    5670:	fb842783          	lw	a5,-72(s0)
    5674:	0007c703          	lbu	a4,0(a5)
    5678:	fd842783          	lw	a5,-40(s0)
    567c:	0027e793          	or	a5,a5,2
    5680:	00078813          	mv	a6,a5
    5684:	00070793          	mv	a5,a4
    5688:	fd042703          	lw	a4,-48(s0)
    568c:	fd442683          	lw	a3,-44(s0)
    5690:	00058613          	mv	a2,a1
    5694:	00050593          	mv	a1,a0
    5698:	fe042503          	lw	a0,-32(s0)
    569c:	831ff0ef          	jal	4ecc <flt>
    56a0:	fea42023          	sw	a0,-32(s0)
    56a4:	0e00006f          	j	5784 <ee_vsprintf+0x60c>
    56a8:	fb842783          	lw	a5,-72(s0)
    56ac:	0007c703          	lbu	a4,0(a5)
    56b0:	02500793          	li	a5,37
    56b4:	00f70c63          	beq	a4,a5,56cc <ee_vsprintf+0x554>
    56b8:	fe042783          	lw	a5,-32(s0)
    56bc:	00178713          	add	a4,a5,1
    56c0:	fee42023          	sw	a4,-32(s0)
    56c4:	02500713          	li	a4,37
    56c8:	00e78023          	sb	a4,0(a5)
    56cc:	fb842783          	lw	a5,-72(s0)
    56d0:	0007c783          	lbu	a5,0(a5)
    56d4:	02078063          	beqz	a5,56f4 <ee_vsprintf+0x57c>
    56d8:	fb842703          	lw	a4,-72(s0)
    56dc:	fe042783          	lw	a5,-32(s0)
    56e0:	00178693          	add	a3,a5,1
    56e4:	fed42023          	sw	a3,-32(s0)
    56e8:	00074703          	lbu	a4,0(a4)
    56ec:	00e78023          	sb	a4,0(a5)
    56f0:	0940006f          	j	5784 <ee_vsprintf+0x60c>
    56f4:	fb842783          	lw	a5,-72(s0)
    56f8:	fff78793          	add	a5,a5,-1
    56fc:	faf42c23          	sw	a5,-72(s0)
    5700:	0840006f          	j	5784 <ee_vsprintf+0x60c>
    5704:	00000013          	nop
    5708:	fcc42703          	lw	a4,-52(s0)
    570c:	06c00793          	li	a5,108
    5710:	00f71e63          	bne	a4,a5,572c <ee_vsprintf+0x5b4>
    5714:	fb442783          	lw	a5,-76(s0)
    5718:	00478713          	add	a4,a5,4
    571c:	fae42a23          	sw	a4,-76(s0)
    5720:	0007a783          	lw	a5,0(a5)
    5724:	fef42623          	sw	a5,-20(s0)
    5728:	03c0006f          	j	5764 <ee_vsprintf+0x5ec>
    572c:	fd842783          	lw	a5,-40(s0)
    5730:	0027f793          	and	a5,a5,2
    5734:	00078e63          	beqz	a5,5750 <ee_vsprintf+0x5d8>
    5738:	fb442783          	lw	a5,-76(s0)
    573c:	00478713          	add	a4,a5,4
    5740:	fae42a23          	sw	a4,-76(s0)
    5744:	0007a783          	lw	a5,0(a5)
    5748:	fef42623          	sw	a5,-20(s0)
    574c:	0180006f          	j	5764 <ee_vsprintf+0x5ec>
    5750:	fb442783          	lw	a5,-76(s0)
    5754:	00478713          	add	a4,a5,4
    5758:	fae42a23          	sw	a4,-76(s0)
    575c:	0007a783          	lw	a5,0(a5)
    5760:	fef42623          	sw	a5,-20(s0)
    5764:	fec42583          	lw	a1,-20(s0)
    5768:	fd842783          	lw	a5,-40(s0)
    576c:	fd042703          	lw	a4,-48(s0)
    5770:	fd442683          	lw	a3,-44(s0)
    5774:	fe442603          	lw	a2,-28(s0)
    5778:	fe042503          	lw	a0,-32(s0)
    577c:	8b9fe0ef          	jal	4034 <number>
    5780:	fea42023          	sw	a0,-32(s0)
    5784:	fb842783          	lw	a5,-72(s0)
    5788:	00178793          	add	a5,a5,1
    578c:	faf42c23          	sw	a5,-72(s0)
    5790:	fb842783          	lw	a5,-72(s0)
    5794:	0007c783          	lbu	a5,0(a5)
    5798:	a00794e3          	bnez	a5,51a0 <ee_vsprintf+0x28>
    579c:	fe042783          	lw	a5,-32(s0)
    57a0:	00078023          	sb	zero,0(a5)
    57a4:	fe042703          	lw	a4,-32(s0)
    57a8:	fbc42783          	lw	a5,-68(s0)
    57ac:	40f707b3          	sub	a5,a4,a5
    57b0:	00078513          	mv	a0,a5
    57b4:	04c12083          	lw	ra,76(sp)
    57b8:	04812403          	lw	s0,72(sp)
    57bc:	05010113          	add	sp,sp,80
    57c0:	00008067          	ret

000057c4 <uart_send_char>:
    57c4:	fd010113          	add	sp,sp,-48
    57c8:	02812623          	sw	s0,44(sp)
    57cc:	03010413          	add	s0,sp,48
    57d0:	00050793          	mv	a5,a0
    57d4:	fcf40fa3          	sb	a5,-33(s0)
    57d8:	060007b7          	lui	a5,0x6000
    57dc:	fef42623          	sw	a5,-20(s0)
    57e0:	00000013          	nop
    57e4:	fec42783          	lw	a5,-20(s0)
    57e8:	00878793          	add	a5,a5,8 # 6000008 <__subdf3+0x5ff8930>
    57ec:	0007c783          	lbu	a5,0(a5)
    57f0:	0ff7f793          	zext.b	a5,a5
    57f4:	fe0798e3          	bnez	a5,57e4 <uart_send_char+0x20>
    57f8:	fec42783          	lw	a5,-20(s0)
    57fc:	fdf44703          	lbu	a4,-33(s0)
    5800:	00e78023          	sb	a4,0(a5)
    5804:	00000013          	nop
    5808:	fec42783          	lw	a5,-20(s0)
    580c:	00878793          	add	a5,a5,8
    5810:	0007c783          	lbu	a5,0(a5)
    5814:	0ff7f793          	zext.b	a5,a5
    5818:	fe0798e3          	bnez	a5,5808 <uart_send_char+0x44>
    581c:	00000013          	nop
    5820:	00000013          	nop
    5824:	02c12403          	lw	s0,44(sp)
    5828:	03010113          	add	sp,sp,48
    582c:	00008067          	ret

00005830 <ee_printf>:
    5830:	bb010113          	add	sp,sp,-1104
    5834:	42112623          	sw	ra,1068(sp)
    5838:	42812423          	sw	s0,1064(sp)
    583c:	43010413          	add	s0,sp,1072
    5840:	bca42e23          	sw	a0,-1060(s0)
    5844:	00b42223          	sw	a1,4(s0)
    5848:	00c42423          	sw	a2,8(s0)
    584c:	00d42623          	sw	a3,12(s0)
    5850:	00e42823          	sw	a4,16(s0)
    5854:	00f42a23          	sw	a5,20(s0)
    5858:	01042c23          	sw	a6,24(s0)
    585c:	01142e23          	sw	a7,28(s0)
    5860:	fe042423          	sw	zero,-24(s0)
    5864:	02040793          	add	a5,s0,32
    5868:	bcf42c23          	sw	a5,-1064(s0)
    586c:	bd842783          	lw	a5,-1064(s0)
    5870:	fe478793          	add	a5,a5,-28
    5874:	bef42223          	sw	a5,-1052(s0)
    5878:	be442703          	lw	a4,-1052(s0)
    587c:	be840793          	add	a5,s0,-1048
    5880:	00070613          	mv	a2,a4
    5884:	bdc42583          	lw	a1,-1060(s0)
    5888:	00078513          	mv	a0,a5
    588c:	8edff0ef          	jal	5178 <ee_vsprintf>
    5890:	be840793          	add	a5,s0,-1048
    5894:	fef42623          	sw	a5,-20(s0)
    5898:	02c0006f          	j	58c4 <ee_printf+0x94>
    589c:	fec42783          	lw	a5,-20(s0)
    58a0:	0007c783          	lbu	a5,0(a5)
    58a4:	00078513          	mv	a0,a5
    58a8:	f1dff0ef          	jal	57c4 <uart_send_char>
    58ac:	fe842783          	lw	a5,-24(s0)
    58b0:	00178793          	add	a5,a5,1
    58b4:	fef42423          	sw	a5,-24(s0)
    58b8:	fec42783          	lw	a5,-20(s0)
    58bc:	00178793          	add	a5,a5,1
    58c0:	fef42623          	sw	a5,-20(s0)
    58c4:	fec42783          	lw	a5,-20(s0)
    58c8:	0007c783          	lbu	a5,0(a5)
    58cc:	fc0798e3          	bnez	a5,589c <ee_printf+0x6c>
    58d0:	fe842783          	lw	a5,-24(s0)
    58d4:	00078513          	mv	a0,a5
    58d8:	42c12083          	lw	ra,1068(sp)
    58dc:	42812403          	lw	s0,1064(sp)
    58e0:	45010113          	add	sp,sp,1104
    58e4:	00008067          	ret

000058e8 <__adddf3>:
    58e8:	001007b7          	lui	a5,0x100
    58ec:	fe010113          	add	sp,sp,-32
    58f0:	fff78e93          	add	t4,a5,-1 # fffff <__subdf3+0xf8927>
    58f4:	00bef833          	and	a6,t4,a1
    58f8:	00def7b3          	and	a5,t4,a3
    58fc:	0146d313          	srl	t1,a3,0x14
    5900:	01212823          	sw	s2,16(sp)
    5904:	0145d913          	srl	s2,a1,0x14
    5908:	00379793          	sll	a5,a5,0x3
    590c:	00812c23          	sw	s0,24(sp)
    5910:	00381813          	sll	a6,a6,0x3
    5914:	01f5d413          	srl	s0,a1,0x1f
    5918:	01d55713          	srl	a4,a0,0x1d
    591c:	01d65893          	srl	a7,a2,0x1d
    5920:	7ff97913          	and	s2,s2,2047
    5924:	7ff37313          	and	t1,t1,2047
    5928:	00112e23          	sw	ra,28(sp)
    592c:	00912a23          	sw	s1,20(sp)
    5930:	01312623          	sw	s3,12(sp)
    5934:	01f6d693          	srl	a3,a3,0x1f
    5938:	00f8e8b3          	or	a7,a7,a5
    593c:	01076733          	or	a4,a4,a6
    5940:	00351593          	sll	a1,a0,0x3
    5944:	00361f13          	sll	t5,a2,0x3
    5948:	406907b3          	sub	a5,s2,t1
    594c:	1ed40463          	beq	s0,a3,5b34 <__adddf3+0x24c>
    5950:	16f05263          	blez	a5,5ab4 <__adddf3+0x1cc>
    5954:	28030663          	beqz	t1,5be0 <__adddf3+0x2f8>
    5958:	7ff00693          	li	a3,2047
    595c:	42d90663          	beq	s2,a3,5d88 <__adddf3+0x4a0>
    5960:	03800693          	li	a3,56
    5964:	00100613          	li	a2,1
    5968:	02f6ce63          	blt	a3,a5,59a4 <__adddf3+0xbc>
    596c:	008006b7          	lui	a3,0x800
    5970:	00d8e8b3          	or	a7,a7,a3
    5974:	01f00693          	li	a3,31
    5978:	52f6ce63          	blt	a3,a5,5eb4 <__adddf3+0x5cc>
    597c:	02000693          	li	a3,32
    5980:	40f686b3          	sub	a3,a3,a5
    5984:	00d89633          	sll	a2,a7,a3
    5988:	00ff5533          	srl	a0,t5,a5
    598c:	00df16b3          	sll	a3,t5,a3
    5990:	00a66633          	or	a2,a2,a0
    5994:	00d036b3          	snez	a3,a3
    5998:	00f8d8b3          	srl	a7,a7,a5
    599c:	00d66633          	or	a2,a2,a3
    59a0:	41170733          	sub	a4,a4,a7
    59a4:	40c58633          	sub	a2,a1,a2
    59a8:	00c5b5b3          	sltu	a1,a1,a2
    59ac:	00060493          	mv	s1,a2
    59b0:	40b709b3          	sub	s3,a4,a1
    59b4:	00899793          	sll	a5,s3,0x8
    59b8:	3207da63          	bgez	a5,5cec <__adddf3+0x404>
    59bc:	008007b7          	lui	a5,0x800
    59c0:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f8927>
    59c4:	00f9f9b3          	and	s3,s3,a5
    59c8:	2c098863          	beqz	s3,5c98 <__adddf3+0x3b0>
    59cc:	00098513          	mv	a0,s3
    59d0:	295010ef          	jal	7464 <__clzsi2>
    59d4:	ff850793          	add	a5,a0,-8
    59d8:	02000693          	li	a3,32
    59dc:	40f68733          	sub	a4,a3,a5
    59e0:	00e4d733          	srl	a4,s1,a4
    59e4:	00f999b3          	sll	s3,s3,a5
    59e8:	01376733          	or	a4,a4,s3
    59ec:	00f494b3          	sll	s1,s1,a5
    59f0:	4b27c863          	blt	a5,s2,5ea0 <__adddf3+0x5b8>
    59f4:	412787b3          	sub	a5,a5,s2
    59f8:	00178793          	add	a5,a5,1
    59fc:	40f686b3          	sub	a3,a3,a5
    5a00:	00d49633          	sll	a2,s1,a3
    5a04:	00f4d9b3          	srl	s3,s1,a5
    5a08:	00c03633          	snez	a2,a2
    5a0c:	01366633          	or	a2,a2,s3
    5a10:	00d716b3          	sll	a3,a4,a3
    5a14:	00c6e4b3          	or	s1,a3,a2
    5a18:	00f759b3          	srl	s3,a4,a5
    5a1c:	00000913          	li	s2,0
    5a20:	0074f793          	and	a5,s1,7
    5a24:	02078063          	beqz	a5,5a44 <__adddf3+0x15c>
    5a28:	00f4f793          	and	a5,s1,15
    5a2c:	00400713          	li	a4,4
    5a30:	00e78a63          	beq	a5,a4,5a44 <__adddf3+0x15c>
    5a34:	00448793          	add	a5,s1,4
    5a38:	0097b633          	sltu	a2,a5,s1
    5a3c:	00c989b3          	add	s3,s3,a2
    5a40:	00078493          	mv	s1,a5
    5a44:	00899793          	sll	a5,s3,0x8
    5a48:	6e07da63          	bgez	a5,613c <__adddf3+0x854>
    5a4c:	00190793          	add	a5,s2,1
    5a50:	7ff00713          	li	a4,2047
    5a54:	00040e13          	mv	t3,s0
    5a58:	2ae78663          	beq	a5,a4,5d04 <__adddf3+0x41c>
    5a5c:	ff800737          	lui	a4,0xff800
    5a60:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f8927>
    5a64:	00e9f733          	and	a4,s3,a4
    5a68:	7ff7f793          	and	a5,a5,2047
    5a6c:	01d71813          	sll	a6,a4,0x1d
    5a70:	0034d613          	srl	a2,s1,0x3
    5a74:	00971713          	sll	a4,a4,0x9
    5a78:	00c86833          	or	a6,a6,a2
    5a7c:	00c75713          	srl	a4,a4,0xc
    5a80:	01c12083          	lw	ra,28(sp)
    5a84:	01812403          	lw	s0,24(sp)
    5a88:	01479793          	sll	a5,a5,0x14
    5a8c:	00e7e7b3          	or	a5,a5,a4
    5a90:	01fe1713          	sll	a4,t3,0x1f
    5a94:	00e7e7b3          	or	a5,a5,a4
    5a98:	01412483          	lw	s1,20(sp)
    5a9c:	01012903          	lw	s2,16(sp)
    5aa0:	00c12983          	lw	s3,12(sp)
    5aa4:	00080513          	mv	a0,a6
    5aa8:	00078593          	mv	a1,a5
    5aac:	02010113          	add	sp,sp,32
    5ab0:	00008067          	ret
    5ab4:	14078c63          	beqz	a5,5c0c <__adddf3+0x324>
    5ab8:	412307b3          	sub	a5,t1,s2
    5abc:	3c091263          	bnez	s2,5e80 <__adddf3+0x598>
    5ac0:	00b76533          	or	a0,a4,a1
    5ac4:	4c050463          	beqz	a0,5f8c <__adddf3+0x6a4>
    5ac8:	fff78513          	add	a0,a5,-1
    5acc:	60050263          	beqz	a0,60d0 <__adddf3+0x7e8>
    5ad0:	7ff00813          	li	a6,2047
    5ad4:	57078663          	beq	a5,a6,6040 <__adddf3+0x758>
    5ad8:	03800793          	li	a5,56
    5adc:	00100613          	li	a2,1
    5ae0:	02a7cc63          	blt	a5,a0,5b18 <__adddf3+0x230>
    5ae4:	00050793          	mv	a5,a0
    5ae8:	01f00613          	li	a2,31
    5aec:	56f64c63          	blt	a2,a5,6064 <__adddf3+0x77c>
    5af0:	02000513          	li	a0,32
    5af4:	40f50533          	sub	a0,a0,a5
    5af8:	00a71633          	sll	a2,a4,a0
    5afc:	00f5d833          	srl	a6,a1,a5
    5b00:	00a59533          	sll	a0,a1,a0
    5b04:	01066633          	or	a2,a2,a6
    5b08:	00a03533          	snez	a0,a0
    5b0c:	00f75733          	srl	a4,a4,a5
    5b10:	00a66633          	or	a2,a2,a0
    5b14:	40e888b3          	sub	a7,a7,a4
    5b18:	40cf0633          	sub	a2,t5,a2
    5b1c:	00cf3733          	sltu	a4,t5,a2
    5b20:	00060493          	mv	s1,a2
    5b24:	40e889b3          	sub	s3,a7,a4
    5b28:	00030913          	mv	s2,t1
    5b2c:	00068413          	mv	s0,a3
    5b30:	e85ff06f          	j	59b4 <__adddf3+0xcc>
    5b34:	1ef05063          	blez	a5,5d14 <__adddf3+0x42c>
    5b38:	14031063          	bnez	t1,5c78 <__adddf3+0x390>
    5b3c:	01e8e6b3          	or	a3,a7,t5
    5b40:	26068c63          	beqz	a3,5db8 <__adddf3+0x4d0>
    5b44:	fff78693          	add	a3,a5,-1
    5b48:	48068063          	beqz	a3,5fc8 <__adddf3+0x6e0>
    5b4c:	7ff00613          	li	a2,2047
    5b50:	22c78c63          	beq	a5,a2,5d88 <__adddf3+0x4a0>
    5b54:	03800793          	li	a5,56
    5b58:	00100993          	li	s3,1
    5b5c:	02d7cc63          	blt	a5,a3,5b94 <__adddf3+0x2ac>
    5b60:	00068793          	mv	a5,a3
    5b64:	01f00693          	li	a3,31
    5b68:	4af6c063          	blt	a3,a5,6008 <__adddf3+0x720>
    5b6c:	02000693          	li	a3,32
    5b70:	40f686b3          	sub	a3,a3,a5
    5b74:	00d899b3          	sll	s3,a7,a3
    5b78:	00ff5633          	srl	a2,t5,a5
    5b7c:	00df16b3          	sll	a3,t5,a3
    5b80:	00c9e9b3          	or	s3,s3,a2
    5b84:	00d036b3          	snez	a3,a3
    5b88:	00f8d8b3          	srl	a7,a7,a5
    5b8c:	00d9e9b3          	or	s3,s3,a3
    5b90:	01170733          	add	a4,a4,a7
    5b94:	00b985b3          	add	a1,s3,a1
    5b98:	0135b9b3          	sltu	s3,a1,s3
    5b9c:	00058493          	mv	s1,a1
    5ba0:	00e989b3          	add	s3,s3,a4
    5ba4:	00899793          	sll	a5,s3,0x8
    5ba8:	1407d263          	bgez	a5,5cec <__adddf3+0x404>
    5bac:	00190913          	add	s2,s2,1
    5bb0:	7ff00793          	li	a5,2047
    5bb4:	36f90c63          	beq	s2,a5,5f2c <__adddf3+0x644>
    5bb8:	ff8007b7          	lui	a5,0xff800
    5bbc:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f8927>
    5bc0:	0014f613          	and	a2,s1,1
    5bc4:	00f9f7b3          	and	a5,s3,a5
    5bc8:	0014d713          	srl	a4,s1,0x1
    5bcc:	00c76733          	or	a4,a4,a2
    5bd0:	01f79613          	sll	a2,a5,0x1f
    5bd4:	00e664b3          	or	s1,a2,a4
    5bd8:	0017d993          	srl	s3,a5,0x1
    5bdc:	e45ff06f          	j	5a20 <__adddf3+0x138>
    5be0:	01e8e6b3          	or	a3,a7,t5
    5be4:	1c068a63          	beqz	a3,5db8 <__adddf3+0x4d0>
    5be8:	fff78693          	add	a3,a5,-1
    5bec:	40068063          	beqz	a3,5fec <__adddf3+0x704>
    5bf0:	7ff00613          	li	a2,2047
    5bf4:	18c78a63          	beq	a5,a2,5d88 <__adddf3+0x4a0>
    5bf8:	03800793          	li	a5,56
    5bfc:	00100613          	li	a2,1
    5c00:	dad7c2e3          	blt	a5,a3,59a4 <__adddf3+0xbc>
    5c04:	00068793          	mv	a5,a3
    5c08:	d6dff06f          	j	5974 <__adddf3+0x8c>
    5c0c:	00190813          	add	a6,s2,1
    5c10:	7fe87813          	and	a6,a6,2046
    5c14:	22081c63          	bnez	a6,5e4c <__adddf3+0x564>
    5c18:	00b76333          	or	t1,a4,a1
    5c1c:	01e8e833          	or	a6,a7,t5
    5c20:	38091063          	bnez	s2,5fa0 <__adddf3+0x6b8>
    5c24:	46030e63          	beqz	t1,60a0 <__adddf3+0x7b8>
    5c28:	40080663          	beqz	a6,6034 <__adddf3+0x74c>
    5c2c:	41e589b3          	sub	s3,a1,t5
    5c30:	0135b533          	sltu	a0,a1,s3
    5c34:	41170633          	sub	a2,a4,a7
    5c38:	40a60633          	sub	a2,a2,a0
    5c3c:	00861513          	sll	a0,a2,0x8
    5c40:	50055e63          	bgez	a0,615c <__adddf3+0x874>
    5c44:	40bf05b3          	sub	a1,t5,a1
    5c48:	40e88733          	sub	a4,a7,a4
    5c4c:	00bf3f33          	sltu	t5,t5,a1
    5c50:	41e70733          	sub	a4,a4,t5
    5c54:	00871613          	sll	a2,a4,0x8
    5c58:	00058493          	mv	s1,a1
    5c5c:	52065e63          	bgez	a2,6198 <__adddf3+0x8b0>
    5c60:	ff8007b7          	lui	a5,0xff800
    5c64:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f8927>
    5c68:	00f77733          	and	a4,a4,a5
    5c6c:	00068e13          	mv	t3,a3
    5c70:	00100793          	li	a5,1
    5c74:	df9ff06f          	j	5a6c <__adddf3+0x184>
    5c78:	7ff00693          	li	a3,2047
    5c7c:	10d90663          	beq	s2,a3,5d88 <__adddf3+0x4a0>
    5c80:	03800693          	li	a3,56
    5c84:	00100993          	li	s3,1
    5c88:	f0f6c6e3          	blt	a3,a5,5b94 <__adddf3+0x2ac>
    5c8c:	008006b7          	lui	a3,0x800
    5c90:	00d8e8b3          	or	a7,a7,a3
    5c94:	ed1ff06f          	j	5b64 <__adddf3+0x27c>
    5c98:	00048513          	mv	a0,s1
    5c9c:	7c8010ef          	jal	7464 <__clzsi2>
    5ca0:	01850793          	add	a5,a0,24
    5ca4:	01f00693          	li	a3,31
    5ca8:	d2f6d8e3          	bge	a3,a5,59d8 <__adddf3+0xf0>
    5cac:	ff850713          	add	a4,a0,-8
    5cb0:	00e49733          	sll	a4,s1,a4
    5cb4:	2327c663          	blt	a5,s2,5ee0 <__adddf3+0x5f8>
    5cb8:	41278933          	sub	s2,a5,s2
    5cbc:	00190793          	add	a5,s2,1
    5cc0:	48f6d663          	bge	a3,a5,614c <__adddf3+0x864>
    5cc4:	fe190913          	add	s2,s2,-31
    5cc8:	02000693          	li	a3,32
    5ccc:	012754b3          	srl	s1,a4,s2
    5cd0:	00d78c63          	beq	a5,a3,5ce8 <__adddf3+0x400>
    5cd4:	04000693          	li	a3,64
    5cd8:	40f687b3          	sub	a5,a3,a5
    5cdc:	00f71733          	sll	a4,a4,a5
    5ce0:	00e03733          	snez	a4,a4
    5ce4:	00e4e4b3          	or	s1,s1,a4
    5ce8:	00000913          	li	s2,0
    5cec:	0074f793          	and	a5,s1,7
    5cf0:	d2079ce3          	bnez	a5,5a28 <__adddf3+0x140>
    5cf4:	00090793          	mv	a5,s2
    5cf8:	0034d613          	srl	a2,s1,0x3
    5cfc:	00098713          	mv	a4,s3
    5d00:	0c00006f          	j	5dc0 <__adddf3+0x4d8>
    5d04:	7ff00793          	li	a5,2047
    5d08:	00000713          	li	a4,0
    5d0c:	00000813          	li	a6,0
    5d10:	d71ff06f          	j	5a80 <__adddf3+0x198>
    5d14:	0c078a63          	beqz	a5,5de8 <__adddf3+0x500>
    5d18:	412307b3          	sub	a5,t1,s2
    5d1c:	1e090263          	beqz	s2,5f00 <__adddf3+0x618>
    5d20:	7ff00693          	li	a3,2047
    5d24:	32d30863          	beq	t1,a3,6054 <__adddf3+0x76c>
    5d28:	03800693          	li	a3,56
    5d2c:	00100993          	li	s3,1
    5d30:	02f6ce63          	blt	a3,a5,5d6c <__adddf3+0x484>
    5d34:	008006b7          	lui	a3,0x800
    5d38:	00d76733          	or	a4,a4,a3
    5d3c:	01f00693          	li	a3,31
    5d40:	3cf6c863          	blt	a3,a5,6110 <__adddf3+0x828>
    5d44:	02000693          	li	a3,32
    5d48:	40f686b3          	sub	a3,a3,a5
    5d4c:	00d719b3          	sll	s3,a4,a3
    5d50:	00f5d633          	srl	a2,a1,a5
    5d54:	00d596b3          	sll	a3,a1,a3
    5d58:	00c9e9b3          	or	s3,s3,a2
    5d5c:	00d036b3          	snez	a3,a3
    5d60:	00f75733          	srl	a4,a4,a5
    5d64:	00d9e9b3          	or	s3,s3,a3
    5d68:	00e888b3          	add	a7,a7,a4
    5d6c:	01e98733          	add	a4,s3,t5
    5d70:	013739b3          	sltu	s3,a4,s3
    5d74:	00070493          	mv	s1,a4
    5d78:	011989b3          	add	s3,s3,a7
    5d7c:	00030913          	mv	s2,t1
    5d80:	e25ff06f          	j	5ba4 <__adddf3+0x2bc>
    5d84:	02081063          	bnez	a6,5da4 <__adddf3+0x4bc>
    5d88:	00351613          	sll	a2,a0,0x3
    5d8c:	00365613          	srl	a2,a2,0x3
    5d90:	01d71813          	sll	a6,a4,0x1d
    5d94:	00c86833          	or	a6,a6,a2
    5d98:	00375713          	srl	a4,a4,0x3
    5d9c:	01076733          	or	a4,a4,a6
    5da0:	18070663          	beqz	a4,5f2c <__adddf3+0x644>
    5da4:	00000e13          	li	t3,0
    5da8:	7ff00793          	li	a5,2047
    5dac:	00080737          	lui	a4,0x80
    5db0:	00000813          	li	a6,0
    5db4:	ccdff06f          	j	5a80 <__adddf3+0x198>
    5db8:	00351613          	sll	a2,a0,0x3
    5dbc:	00365613          	srl	a2,a2,0x3
    5dc0:	01d71813          	sll	a6,a4,0x1d
    5dc4:	7ff00693          	li	a3,2047
    5dc8:	00c86833          	or	a6,a6,a2
    5dcc:	00375713          	srl	a4,a4,0x3
    5dd0:	fcd786e3          	beq	a5,a3,5d9c <__adddf3+0x4b4>
    5dd4:	00c71713          	sll	a4,a4,0xc
    5dd8:	00c75713          	srl	a4,a4,0xc
    5ddc:	7ff7f793          	and	a5,a5,2047
    5de0:	00040e13          	mv	t3,s0
    5de4:	c9dff06f          	j	5a80 <__adddf3+0x198>
    5de8:	00190693          	add	a3,s2,1
    5dec:	7fe6f813          	and	a6,a3,2046
    5df0:	14081863          	bnez	a6,5f40 <__adddf3+0x658>
    5df4:	00b766b3          	or	a3,a4,a1
    5df8:	28091c63          	bnez	s2,6090 <__adddf3+0x7a8>
    5dfc:	30068263          	beqz	a3,6100 <__adddf3+0x818>
    5e00:	01e8e6b3          	or	a3,a7,t5
    5e04:	22068863          	beqz	a3,6034 <__adddf3+0x74c>
    5e08:	01e587b3          	add	a5,a1,t5
    5e0c:	00b7b5b3          	sltu	a1,a5,a1
    5e10:	01170733          	add	a4,a4,a7
    5e14:	00b70733          	add	a4,a4,a1
    5e18:	0037d813          	srl	a6,a5,0x3
    5e1c:	00871793          	sll	a5,a4,0x8
    5e20:	00040e13          	mv	t3,s0
    5e24:	3407de63          	bgez	a5,6180 <__adddf3+0x898>
    5e28:	ff8007b7          	lui	a5,0xff800
    5e2c:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f8927>
    5e30:	00f77733          	and	a4,a4,a5
    5e34:	01d71793          	sll	a5,a4,0x1d
    5e38:	00375713          	srl	a4,a4,0x3
    5e3c:	0107e833          	or	a6,a5,a6
    5e40:	01d77733          	and	a4,a4,t4
    5e44:	00100793          	li	a5,1
    5e48:	c39ff06f          	j	5a80 <__adddf3+0x198>
    5e4c:	41e58833          	sub	a6,a1,t5
    5e50:	0105b7b3          	sltu	a5,a1,a6
    5e54:	411709b3          	sub	s3,a4,a7
    5e58:	40f989b3          	sub	s3,s3,a5
    5e5c:	00899793          	sll	a5,s3,0x8
    5e60:	00080493          	mv	s1,a6
    5e64:	1007c663          	bltz	a5,5f70 <__adddf3+0x688>
    5e68:	01386833          	or	a6,a6,s3
    5e6c:	b4081ee3          	bnez	a6,59c8 <__adddf3+0xe0>
    5e70:	00000e13          	li	t3,0
    5e74:	00000793          	li	a5,0
    5e78:	00000713          	li	a4,0
    5e7c:	c05ff06f          	j	5a80 <__adddf3+0x198>
    5e80:	7ff00513          	li	a0,2047
    5e84:	1aa30e63          	beq	t1,a0,6040 <__adddf3+0x758>
    5e88:	03800513          	li	a0,56
    5e8c:	00100613          	li	a2,1
    5e90:	c8f544e3          	blt	a0,a5,5b18 <__adddf3+0x230>
    5e94:	00800637          	lui	a2,0x800
    5e98:	00c76733          	or	a4,a4,a2
    5e9c:	c4dff06f          	j	5ae8 <__adddf3+0x200>
    5ea0:	ff8009b7          	lui	s3,0xff800
    5ea4:	fff98993          	add	s3,s3,-1 # ff7fffff <__subdf3+0xff7f8927>
    5ea8:	40f90933          	sub	s2,s2,a5
    5eac:	013779b3          	and	s3,a4,s3
    5eb0:	b71ff06f          	j	5a20 <__adddf3+0x138>
    5eb4:	fe078693          	add	a3,a5,-32
    5eb8:	02000613          	li	a2,32
    5ebc:	00d8d6b3          	srl	a3,a7,a3
    5ec0:	00c78a63          	beq	a5,a2,5ed4 <__adddf3+0x5ec>
    5ec4:	04000613          	li	a2,64
    5ec8:	40f607b3          	sub	a5,a2,a5
    5ecc:	00f897b3          	sll	a5,a7,a5
    5ed0:	00ff6f33          	or	t5,t5,a5
    5ed4:	01e03633          	snez	a2,t5
    5ed8:	00d66633          	or	a2,a2,a3
    5edc:	ac9ff06f          	j	59a4 <__adddf3+0xbc>
    5ee0:	ff8006b7          	lui	a3,0xff800
    5ee4:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f8927>
    5ee8:	40f907b3          	sub	a5,s2,a5
    5eec:	00d77733          	and	a4,a4,a3
    5ef0:	01d71813          	sll	a6,a4,0x1d
    5ef4:	01386833          	or	a6,a6,s3
    5ef8:	00375713          	srl	a4,a4,0x3
    5efc:	ed9ff06f          	j	5dd4 <__adddf3+0x4ec>
    5f00:	00b766b3          	or	a3,a4,a1
    5f04:	1e068663          	beqz	a3,60f0 <__adddf3+0x808>
    5f08:	fff78693          	add	a3,a5,-1
    5f0c:	0a068e63          	beqz	a3,5fc8 <__adddf3+0x6e0>
    5f10:	7ff00513          	li	a0,2047
    5f14:	14a78063          	beq	a5,a0,6054 <__adddf3+0x76c>
    5f18:	03800793          	li	a5,56
    5f1c:	00100993          	li	s3,1
    5f20:	e4d7c6e3          	blt	a5,a3,5d6c <__adddf3+0x484>
    5f24:	00068793          	mv	a5,a3
    5f28:	e15ff06f          	j	5d3c <__adddf3+0x454>
    5f2c:	00040e13          	mv	t3,s0
    5f30:	7ff00793          	li	a5,2047
    5f34:	00000713          	li	a4,0
    5f38:	00000813          	li	a6,0
    5f3c:	b45ff06f          	j	5a80 <__adddf3+0x198>
    5f40:	7ff00793          	li	a5,2047
    5f44:	fef684e3          	beq	a3,a5,5f2c <__adddf3+0x644>
    5f48:	01e58f33          	add	t5,a1,t5
    5f4c:	00bf35b3          	sltu	a1,t5,a1
    5f50:	011707b3          	add	a5,a4,a7
    5f54:	00b787b3          	add	a5,a5,a1
    5f58:	01f79613          	sll	a2,a5,0x1f
    5f5c:	001f5f13          	srl	t5,t5,0x1
    5f60:	01e664b3          	or	s1,a2,t5
    5f64:	0017d993          	srl	s3,a5,0x1
    5f68:	00068913          	mv	s2,a3
    5f6c:	ab5ff06f          	j	5a20 <__adddf3+0x138>
    5f70:	40bf0633          	sub	a2,t5,a1
    5f74:	40e887b3          	sub	a5,a7,a4
    5f78:	00cf3733          	sltu	a4,t5,a2
    5f7c:	00060493          	mv	s1,a2
    5f80:	40e789b3          	sub	s3,a5,a4
    5f84:	00068413          	mv	s0,a3
    5f88:	a41ff06f          	j	59c8 <__adddf3+0xe0>
    5f8c:	00361613          	sll	a2,a2,0x3
    5f90:	00365613          	srl	a2,a2,0x3
    5f94:	00068413          	mv	s0,a3
    5f98:	00088713          	mv	a4,a7
    5f9c:	e25ff06f          	j	5dc0 <__adddf3+0x4d8>
    5fa0:	de0312e3          	bnez	t1,5d84 <__adddf3+0x49c>
    5fa4:	1c080663          	beqz	a6,6170 <__adddf3+0x888>
    5fa8:	0038d713          	srl	a4,a7,0x3
    5fac:	00361613          	sll	a2,a2,0x3
    5fb0:	01d89893          	sll	a7,a7,0x1d
    5fb4:	01176733          	or	a4,a4,a7
    5fb8:	00365613          	srl	a2,a2,0x3
    5fbc:	00c76733          	or	a4,a4,a2
    5fc0:	00068413          	mv	s0,a3
    5fc4:	dddff06f          	j	5da0 <__adddf3+0x4b8>
    5fc8:	01e58f33          	add	t5,a1,t5
    5fcc:	011708b3          	add	a7,a4,a7
    5fd0:	00bf35b3          	sltu	a1,t5,a1
    5fd4:	00b889b3          	add	s3,a7,a1
    5fd8:	00899793          	sll	a5,s3,0x8
    5fdc:	000f0493          	mv	s1,t5
    5fe0:	0e07d463          	bgez	a5,60c8 <__adddf3+0x7e0>
    5fe4:	00200913          	li	s2,2
    5fe8:	bd1ff06f          	j	5bb8 <__adddf3+0x2d0>
    5fec:	41e58f33          	sub	t5,a1,t5
    5ff0:	411708b3          	sub	a7,a4,a7
    5ff4:	01e5b5b3          	sltu	a1,a1,t5
    5ff8:	000f0493          	mv	s1,t5
    5ffc:	40b889b3          	sub	s3,a7,a1
    6000:	00100913          	li	s2,1
    6004:	9b1ff06f          	j	59b4 <__adddf3+0xcc>
    6008:	fe078693          	add	a3,a5,-32
    600c:	02000613          	li	a2,32
    6010:	00d8d6b3          	srl	a3,a7,a3
    6014:	00c78a63          	beq	a5,a2,6028 <__adddf3+0x740>
    6018:	04000613          	li	a2,64
    601c:	40f607b3          	sub	a5,a2,a5
    6020:	00f897b3          	sll	a5,a7,a5
    6024:	00ff6f33          	or	t5,t5,a5
    6028:	01e039b3          	snez	s3,t5
    602c:	00d9e9b3          	or	s3,s3,a3
    6030:	b65ff06f          	j	5b94 <__adddf3+0x2ac>
    6034:	00351613          	sll	a2,a0,0x3
    6038:	00365993          	srl	s3,a2,0x3
    603c:	eb5ff06f          	j	5ef0 <__adddf3+0x608>
    6040:	00361613          	sll	a2,a2,0x3
    6044:	00365613          	srl	a2,a2,0x3
    6048:	00068413          	mv	s0,a3
    604c:	00088713          	mv	a4,a7
    6050:	d41ff06f          	j	5d90 <__adddf3+0x4a8>
    6054:	00361613          	sll	a2,a2,0x3
    6058:	00365613          	srl	a2,a2,0x3
    605c:	00088713          	mv	a4,a7
    6060:	d31ff06f          	j	5d90 <__adddf3+0x4a8>
    6064:	fe078513          	add	a0,a5,-32
    6068:	02000613          	li	a2,32
    606c:	00a75533          	srl	a0,a4,a0
    6070:	00c78a63          	beq	a5,a2,6084 <__adddf3+0x79c>
    6074:	04000613          	li	a2,64
    6078:	40f607b3          	sub	a5,a2,a5
    607c:	00f717b3          	sll	a5,a4,a5
    6080:	00f5e5b3          	or	a1,a1,a5
    6084:	00b03633          	snez	a2,a1
    6088:	00a66633          	or	a2,a2,a0
    608c:	a8dff06f          	j	5b18 <__adddf3+0x230>
    6090:	fc0682e3          	beqz	a3,6054 <__adddf3+0x76c>
    6094:	01e8ef33          	or	t5,a7,t5
    6098:	d00f16e3          	bnez	t5,5da4 <__adddf3+0x4bc>
    609c:	cedff06f          	j	5d88 <__adddf3+0x4a0>
    60a0:	dc0808e3          	beqz	a6,5e70 <__adddf3+0x588>
    60a4:	00361813          	sll	a6,a2,0x3
    60a8:	01d89793          	sll	a5,a7,0x1d
    60ac:	00385813          	srl	a6,a6,0x3
    60b0:	0038d713          	srl	a4,a7,0x3
    60b4:	00f86833          	or	a6,a6,a5
    60b8:	01d77733          	and	a4,a4,t4
    60bc:	00068e13          	mv	t3,a3
    60c0:	00000793          	li	a5,0
    60c4:	9bdff06f          	j	5a80 <__adddf3+0x198>
    60c8:	00100793          	li	a5,1
    60cc:	c2dff06f          	j	5cf8 <__adddf3+0x410>
    60d0:	40bf05b3          	sub	a1,t5,a1
    60d4:	40e888b3          	sub	a7,a7,a4
    60d8:	00bf3733          	sltu	a4,t5,a1
    60dc:	00058493          	mv	s1,a1
    60e0:	40e889b3          	sub	s3,a7,a4
    60e4:	00068413          	mv	s0,a3
    60e8:	00100913          	li	s2,1
    60ec:	8c9ff06f          	j	59b4 <__adddf3+0xcc>
    60f0:	00361613          	sll	a2,a2,0x3
    60f4:	00365613          	srl	a2,a2,0x3
    60f8:	00088713          	mv	a4,a7
    60fc:	cc5ff06f          	j	5dc0 <__adddf3+0x4d8>
    6100:	00361613          	sll	a2,a2,0x3
    6104:	00365993          	srl	s3,a2,0x3
    6108:	00088713          	mv	a4,a7
    610c:	de5ff06f          	j	5ef0 <__adddf3+0x608>
    6110:	fe078693          	add	a3,a5,-32
    6114:	02000613          	li	a2,32
    6118:	00d756b3          	srl	a3,a4,a3
    611c:	00c78a63          	beq	a5,a2,6130 <__adddf3+0x848>
    6120:	04000613          	li	a2,64
    6124:	40f607b3          	sub	a5,a2,a5
    6128:	00f717b3          	sll	a5,a4,a5
    612c:	00f5e5b3          	or	a1,a1,a5
    6130:	00b039b3          	snez	s3,a1
    6134:	00d9e9b3          	or	s3,s3,a3
    6138:	c35ff06f          	j	5d6c <__adddf3+0x484>
    613c:	0034d613          	srl	a2,s1,0x3
    6140:	00090793          	mv	a5,s2
    6144:	00098713          	mv	a4,s3
    6148:	c79ff06f          	j	5dc0 <__adddf3+0x4d8>
    614c:	02000693          	li	a3,32
    6150:	40f686b3          	sub	a3,a3,a5
    6154:	00000613          	li	a2,0
    6158:	8b5ff06f          	j	5a0c <__adddf3+0x124>
    615c:	00c9e833          	or	a6,s3,a2
    6160:	d00808e3          	beqz	a6,5e70 <__adddf3+0x588>
    6164:	0039d993          	srl	s3,s3,0x3
    6168:	00060713          	mv	a4,a2
    616c:	d85ff06f          	j	5ef0 <__adddf3+0x608>
    6170:	00000e13          	li	t3,0
    6174:	7ff00793          	li	a5,2047
    6178:	00080737          	lui	a4,0x80
    617c:	905ff06f          	j	5a80 <__adddf3+0x198>
    6180:	01d71793          	sll	a5,a4,0x1d
    6184:	00375713          	srl	a4,a4,0x3
    6188:	0107e833          	or	a6,a5,a6
    618c:	01d77733          	and	a4,a4,t4
    6190:	00000793          	li	a5,0
    6194:	8edff06f          	j	5a80 <__adddf3+0x198>
    6198:	01d71813          	sll	a6,a4,0x1d
    619c:	0035d593          	srl	a1,a1,0x3
    61a0:	00b86833          	or	a6,a6,a1
    61a4:	00375713          	srl	a4,a4,0x3
    61a8:	00068413          	mv	s0,a3
    61ac:	c29ff06f          	j	5dd4 <__adddf3+0x4ec>

000061b0 <__divdf3>:
    61b0:	fd010113          	add	sp,sp,-48
    61b4:	01312e23          	sw	s3,28(sp)
    61b8:	0145d993          	srl	s3,a1,0x14
    61bc:	02812423          	sw	s0,40(sp)
    61c0:	02912223          	sw	s1,36(sp)
    61c4:	03212023          	sw	s2,32(sp)
    61c8:	01412c23          	sw	s4,24(sp)
    61cc:	01712623          	sw	s7,12(sp)
    61d0:	00c59493          	sll	s1,a1,0xc
    61d4:	02112623          	sw	ra,44(sp)
    61d8:	01512a23          	sw	s5,20(sp)
    61dc:	01612823          	sw	s6,16(sp)
    61e0:	01812423          	sw	s8,8(sp)
    61e4:	7ff9f993          	and	s3,s3,2047
    61e8:	00050413          	mv	s0,a0
    61ec:	00060b93          	mv	s7,a2
    61f0:	00068913          	mv	s2,a3
    61f4:	00c4d493          	srl	s1,s1,0xc
    61f8:	01f5da13          	srl	s4,a1,0x1f
    61fc:	18098a63          	beqz	s3,6390 <__divdf3+0x1e0>
    6200:	7ff00793          	li	a5,2047
    6204:	08f98863          	beq	s3,a5,6294 <__divdf3+0xe4>
    6208:	00349493          	sll	s1,s1,0x3
    620c:	01d55793          	srl	a5,a0,0x1d
    6210:	0097e7b3          	or	a5,a5,s1
    6214:	00800737          	lui	a4,0x800
    6218:	00e7eab3          	or	s5,a5,a4
    621c:	00351b13          	sll	s6,a0,0x3
    6220:	c0198993          	add	s3,s3,-1023
    6224:	00000493          	li	s1,0
    6228:	00000c13          	li	s8,0
    622c:	01495793          	srl	a5,s2,0x14
    6230:	00c91413          	sll	s0,s2,0xc
    6234:	7ff7f793          	and	a5,a5,2047
    6238:	00c45413          	srl	s0,s0,0xc
    623c:	01f95913          	srl	s2,s2,0x1f
    6240:	08078263          	beqz	a5,62c4 <__divdf3+0x114>
    6244:	7ff00713          	li	a4,2047
    6248:	18e78a63          	beq	a5,a4,63dc <__divdf3+0x22c>
    624c:	00341413          	sll	s0,s0,0x3
    6250:	01dbd713          	srl	a4,s7,0x1d
    6254:	00876733          	or	a4,a4,s0
    6258:	c0178793          	add	a5,a5,-1023
    625c:	00800437          	lui	s0,0x800
    6260:	00876433          	or	s0,a4,s0
    6264:	003b9893          	sll	a7,s7,0x3
    6268:	40f989b3          	sub	s3,s3,a5
    626c:	00000613          	li	a2,0
    6270:	00f00713          	li	a4,15
    6274:	012a46b3          	xor	a3,s4,s2
    6278:	24976463          	bltu	a4,s1,64c0 <__divdf3+0x310>
    627c:	79c00713          	li	a4,1948
    6280:	00249493          	sll	s1,s1,0x2
    6284:	00e484b3          	add	s1,s1,a4
    6288:	0004a783          	lw	a5,0(s1)
    628c:	00e787b3          	add	a5,a5,a4
    6290:	00078067          	jr	a5
    6294:	00a4eab3          	or	s5,s1,a0
    6298:	1c0a9e63          	bnez	s5,6474 <__divdf3+0x2c4>
    629c:	01495793          	srl	a5,s2,0x14
    62a0:	00c91413          	sll	s0,s2,0xc
    62a4:	7ff7f793          	and	a5,a5,2047
    62a8:	00000b13          	li	s6,0
    62ac:	00800493          	li	s1,8
    62b0:	7ff00993          	li	s3,2047
    62b4:	00200c13          	li	s8,2
    62b8:	00c45413          	srl	s0,s0,0xc
    62bc:	01f95913          	srl	s2,s2,0x1f
    62c0:	f80792e3          	bnez	a5,6244 <__divdf3+0x94>
    62c4:	017468b3          	or	a7,s0,s7
    62c8:	1c088263          	beqz	a7,648c <__divdf3+0x2dc>
    62cc:	4a040a63          	beqz	s0,6780 <__divdf3+0x5d0>
    62d0:	00040513          	mv	a0,s0
    62d4:	190010ef          	jal	7464 <__clzsi2>
    62d8:	00050793          	mv	a5,a0
    62dc:	ff550693          	add	a3,a0,-11
    62e0:	01d00713          	li	a4,29
    62e4:	ff878893          	add	a7,a5,-8
    62e8:	40d70733          	sub	a4,a4,a3
    62ec:	01141433          	sll	s0,s0,a7
    62f0:	00ebd733          	srl	a4,s7,a4
    62f4:	00876433          	or	s0,a4,s0
    62f8:	011b98b3          	sll	a7,s7,a7
    62fc:	013787b3          	add	a5,a5,s3
    6300:	3f378993          	add	s3,a5,1011
    6304:	00000613          	li	a2,0
    6308:	f69ff06f          	j	6270 <__divdf3+0xc0>
    630c:	40f70733          	sub	a4,a4,a5
    6310:	03800613          	li	a2,56
    6314:	4ee65a63          	bge	a2,a4,6808 <__divdf3+0x658>
    6318:	00000793          	li	a5,0
    631c:	00000613          	li	a2,0
    6320:	00000713          	li	a4,0
    6324:	02c12083          	lw	ra,44(sp)
    6328:	02812403          	lw	s0,40(sp)
    632c:	01479793          	sll	a5,a5,0x14
    6330:	00c7e7b3          	or	a5,a5,a2
    6334:	01f69693          	sll	a3,a3,0x1f
    6338:	00d7e7b3          	or	a5,a5,a3
    633c:	02412483          	lw	s1,36(sp)
    6340:	02012903          	lw	s2,32(sp)
    6344:	01c12983          	lw	s3,28(sp)
    6348:	01812a03          	lw	s4,24(sp)
    634c:	01412a83          	lw	s5,20(sp)
    6350:	01012b03          	lw	s6,16(sp)
    6354:	00c12b83          	lw	s7,12(sp)
    6358:	00812c03          	lw	s8,8(sp)
    635c:	00070513          	mv	a0,a4
    6360:	00078593          	mv	a1,a5
    6364:	03010113          	add	sp,sp,48
    6368:	00008067          	ret
    636c:	7ff00793          	li	a5,2047
    6370:	00000613          	li	a2,0
    6374:	00000713          	li	a4,0
    6378:	fadff06f          	j	6324 <__divdf3+0x174>
    637c:	00000693          	li	a3,0
    6380:	7ff00793          	li	a5,2047
    6384:	00080637          	lui	a2,0x80
    6388:	00000713          	li	a4,0
    638c:	f99ff06f          	j	6324 <__divdf3+0x174>
    6390:	00a4eab3          	or	s5,s1,a0
    6394:	100a8c63          	beqz	s5,64ac <__divdf3+0x2fc>
    6398:	40048863          	beqz	s1,67a8 <__divdf3+0x5f8>
    639c:	00048513          	mv	a0,s1
    63a0:	0c4010ef          	jal	7464 <__clzsi2>
    63a4:	00050713          	mv	a4,a0
    63a8:	ff550693          	add	a3,a0,-11
    63ac:	01d00793          	li	a5,29
    63b0:	ff870b13          	add	s6,a4,-8 # 7ffff8 <__subdf3+0x7f8920>
    63b4:	40d787b3          	sub	a5,a5,a3
    63b8:	016494b3          	sll	s1,s1,s6
    63bc:	00f457b3          	srl	a5,s0,a5
    63c0:	0097eab3          	or	s5,a5,s1
    63c4:	01641b33          	sll	s6,s0,s6
    63c8:	c0d00993          	li	s3,-1011
    63cc:	40e989b3          	sub	s3,s3,a4
    63d0:	00000493          	li	s1,0
    63d4:	00000c13          	li	s8,0
    63d8:	e55ff06f          	j	622c <__divdf3+0x7c>
    63dc:	017468b3          	or	a7,s0,s7
    63e0:	80198993          	add	s3,s3,-2047
    63e4:	0a089c63          	bnez	a7,649c <__divdf3+0x2ec>
    63e8:	0024e493          	or	s1,s1,2
    63ec:	00000413          	li	s0,0
    63f0:	00200613          	li	a2,2
    63f4:	e7dff06f          	j	6270 <__divdf3+0xc0>
    63f8:	000a0913          	mv	s2,s4
    63fc:	000a8413          	mv	s0,s5
    6400:	000b0893          	mv	a7,s6
    6404:	00200793          	li	a5,2
    6408:	4efc0863          	beq	s8,a5,68f8 <__divdf3+0x748>
    640c:	00300793          	li	a5,3
    6410:	f6fc06e3          	beq	s8,a5,637c <__divdf3+0x1cc>
    6414:	00100793          	li	a5,1
    6418:	00090693          	mv	a3,s2
    641c:	eefc0ee3          	beq	s8,a5,6318 <__divdf3+0x168>
    6420:	3ff98793          	add	a5,s3,1023
    6424:	2af05663          	blez	a5,66d0 <__divdf3+0x520>
    6428:	0078f713          	and	a4,a7,7
    642c:	4a071663          	bnez	a4,68d8 <__divdf3+0x728>
    6430:	00741713          	sll	a4,s0,0x7
    6434:	00075a63          	bgez	a4,6448 <__divdf3+0x298>
    6438:	ff0007b7          	lui	a5,0xff000
    643c:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff8927>
    6440:	00f47433          	and	s0,s0,a5
    6444:	40098793          	add	a5,s3,1024
    6448:	7fe00713          	li	a4,2046
    644c:	f2f740e3          	blt	a4,a5,636c <__divdf3+0x1bc>
    6450:	0038d893          	srl	a7,a7,0x3
    6454:	01d41713          	sll	a4,s0,0x1d
    6458:	00941613          	sll	a2,s0,0x9
    645c:	01176733          	or	a4,a4,a7
    6460:	00c65613          	srl	a2,a2,0xc
    6464:	7ff7f793          	and	a5,a5,2047
    6468:	ebdff06f          	j	6324 <__divdf3+0x174>
    646c:	00060c13          	mv	s8,a2
    6470:	f95ff06f          	j	6404 <__divdf3+0x254>
    6474:	00048a93          	mv	s5,s1
    6478:	00050b13          	mv	s6,a0
    647c:	00c00493          	li	s1,12
    6480:	7ff00993          	li	s3,2047
    6484:	00300c13          	li	s8,3
    6488:	da5ff06f          	j	622c <__divdf3+0x7c>
    648c:	0014e493          	or	s1,s1,1
    6490:	00000413          	li	s0,0
    6494:	00100613          	li	a2,1
    6498:	dd9ff06f          	j	6270 <__divdf3+0xc0>
    649c:	0034e493          	or	s1,s1,3
    64a0:	000b8893          	mv	a7,s7
    64a4:	00300613          	li	a2,3
    64a8:	dc9ff06f          	j	6270 <__divdf3+0xc0>
    64ac:	00000b13          	li	s6,0
    64b0:	00400493          	li	s1,4
    64b4:	00000993          	li	s3,0
    64b8:	00100c13          	li	s8,1
    64bc:	d71ff06f          	j	622c <__divdf3+0x7c>
    64c0:	2b546463          	bltu	s0,s5,6768 <__divdf3+0x5b8>
    64c4:	2a8a8063          	beq	s5,s0,6764 <__divdf3+0x5b4>
    64c8:	000b0313          	mv	t1,s6
    64cc:	fff98993          	add	s3,s3,-1
    64d0:	000a8793          	mv	a5,s5
    64d4:	00000b13          	li	s6,0
    64d8:	00841713          	sll	a4,s0,0x8
    64dc:	01075513          	srl	a0,a4,0x10
    64e0:	02a7d433          	divu	s0,a5,a0
    64e4:	0188d613          	srl	a2,a7,0x18
    64e8:	00e66633          	or	a2,a2,a4
    64ec:	01061813          	sll	a6,a2,0x10
    64f0:	01085813          	srl	a6,a6,0x10
    64f4:	00889593          	sll	a1,a7,0x8
    64f8:	01035713          	srl	a4,t1,0x10
    64fc:	02a7f7b3          	remu	a5,a5,a0
    6500:	028808b3          	mul	a7,a6,s0
    6504:	01079793          	sll	a5,a5,0x10
    6508:	00f767b3          	or	a5,a4,a5
    650c:	0117fa63          	bgeu	a5,a7,6520 <__divdf3+0x370>
    6510:	00f607b3          	add	a5,a2,a5
    6514:	fff40713          	add	a4,s0,-1 # 7fffff <__subdf3+0x7f8927>
    6518:	2ec7f063          	bgeu	a5,a2,67f8 <__divdf3+0x648>
    651c:	00070413          	mv	s0,a4
    6520:	411787b3          	sub	a5,a5,a7
    6524:	02a7d8b3          	divu	a7,a5,a0
    6528:	01031713          	sll	a4,t1,0x10
    652c:	01075713          	srl	a4,a4,0x10
    6530:	02a7f7b3          	remu	a5,a5,a0
    6534:	03180fb3          	mul	t6,a6,a7
    6538:	01079793          	sll	a5,a5,0x10
    653c:	00f76733          	or	a4,a4,a5
    6540:	01f77a63          	bgeu	a4,t6,6554 <__divdf3+0x3a4>
    6544:	00e60733          	add	a4,a2,a4
    6548:	fff88793          	add	a5,a7,-1
    654c:	28c77e63          	bgeu	a4,a2,67e8 <__divdf3+0x638>
    6550:	00078893          	mv	a7,a5
    6554:	01041413          	sll	s0,s0,0x10
    6558:	000102b7          	lui	t0,0x10
    655c:	01146433          	or	s0,s0,a7
    6560:	fff28313          	add	t1,t0,-1 # ffff <__subdf3+0x8927>
    6564:	006478b3          	and	a7,s0,t1
    6568:	01045e93          	srl	t4,s0,0x10
    656c:	0105de13          	srl	t3,a1,0x10
    6570:	0065f333          	and	t1,a1,t1
    6574:	03130f33          	mul	t5,t1,a7
    6578:	41f70733          	sub	a4,a4,t6
    657c:	031e08b3          	mul	a7,t3,a7
    6580:	010f5793          	srl	a5,t5,0x10
    6584:	026e8fb3          	mul	t6,t4,t1
    6588:	01f888b3          	add	a7,a7,t6
    658c:	011787b3          	add	a5,a5,a7
    6590:	03ce8eb3          	mul	t4,t4,t3
    6594:	01f7f463          	bgeu	a5,t6,659c <__divdf3+0x3ec>
    6598:	005e8eb3          	add	t4,t4,t0
    659c:	00010fb7          	lui	t6,0x10
    65a0:	ffff8f93          	add	t6,t6,-1 # ffff <__subdf3+0x8927>
    65a4:	0107d893          	srl	a7,a5,0x10
    65a8:	01f7f7b3          	and	a5,a5,t6
    65ac:	01079793          	sll	a5,a5,0x10
    65b0:	01ff7f33          	and	t5,t5,t6
    65b4:	01d888b3          	add	a7,a7,t4
    65b8:	01e787b3          	add	a5,a5,t5
    65bc:	17176e63          	bltu	a4,a7,6738 <__divdf3+0x588>
    65c0:	17170a63          	beq	a4,a7,6734 <__divdf3+0x584>
    65c4:	40fb07b3          	sub	a5,s6,a5
    65c8:	41170733          	sub	a4,a4,a7
    65cc:	00fb3b33          	sltu	s6,s6,a5
    65d0:	41670733          	sub	a4,a4,s6
    65d4:	2ee60063          	beq	a2,a4,68b4 <__divdf3+0x704>
    65d8:	02a758b3          	divu	a7,a4,a0
    65dc:	0107de93          	srl	t4,a5,0x10
    65e0:	02a77733          	remu	a4,a4,a0
    65e4:	03180f33          	mul	t5,a6,a7
    65e8:	01071713          	sll	a4,a4,0x10
    65ec:	00eee733          	or	a4,t4,a4
    65f0:	01e77e63          	bgeu	a4,t5,660c <__divdf3+0x45c>
    65f4:	00e60733          	add	a4,a2,a4
    65f8:	fff88e93          	add	t4,a7,-1
    65fc:	2ec76a63          	bltu	a4,a2,68f0 <__divdf3+0x740>
    6600:	2fe77863          	bgeu	a4,t5,68f0 <__divdf3+0x740>
    6604:	ffe88893          	add	a7,a7,-2
    6608:	00c70733          	add	a4,a4,a2
    660c:	41e70733          	sub	a4,a4,t5
    6610:	02a75eb3          	divu	t4,a4,a0
    6614:	01079793          	sll	a5,a5,0x10
    6618:	0107d793          	srl	a5,a5,0x10
    661c:	02a77733          	remu	a4,a4,a0
    6620:	03d80833          	mul	a6,a6,t4
    6624:	01071713          	sll	a4,a4,0x10
    6628:	00e7e7b3          	or	a5,a5,a4
    662c:	0107fe63          	bgeu	a5,a6,6648 <__divdf3+0x498>
    6630:	00f607b3          	add	a5,a2,a5
    6634:	fffe8713          	add	a4,t4,-1
    6638:	2ac7e863          	bltu	a5,a2,68e8 <__divdf3+0x738>
    663c:	2b07f663          	bgeu	a5,a6,68e8 <__divdf3+0x738>
    6640:	ffee8e93          	add	t4,t4,-2
    6644:	00c787b3          	add	a5,a5,a2
    6648:	01089893          	sll	a7,a7,0x10
    664c:	01d8e8b3          	or	a7,a7,t4
    6650:	01089513          	sll	a0,a7,0x10
    6654:	0108df13          	srl	t5,a7,0x10
    6658:	01055513          	srl	a0,a0,0x10
    665c:	02650eb3          	mul	t4,a0,t1
    6660:	410787b3          	sub	a5,a5,a6
    6664:	02ae0533          	mul	a0,t3,a0
    6668:	010ed713          	srl	a4,t4,0x10
    666c:	026f0333          	mul	t1,t5,t1
    6670:	00650533          	add	a0,a0,t1
    6674:	00a70733          	add	a4,a4,a0
    6678:	03ee0e33          	mul	t3,t3,t5
    667c:	00677663          	bgeu	a4,t1,6688 <__divdf3+0x4d8>
    6680:	00010537          	lui	a0,0x10
    6684:	00ae0e33          	add	t3,t3,a0
    6688:	00010837          	lui	a6,0x10
    668c:	fff80813          	add	a6,a6,-1 # ffff <__subdf3+0x8927>
    6690:	01075513          	srl	a0,a4,0x10
    6694:	01077733          	and	a4,a4,a6
    6698:	01071713          	sll	a4,a4,0x10
    669c:	010efeb3          	and	t4,t4,a6
    66a0:	01c50533          	add	a0,a0,t3
    66a4:	01d70733          	add	a4,a4,t4
    66a8:	12a7f263          	bgeu	a5,a0,67cc <__divdf3+0x61c>
    66ac:	00f607b3          	add	a5,a2,a5
    66b0:	fff88313          	add	t1,a7,-1
    66b4:	00078813          	mv	a6,a5
    66b8:	1cc7e463          	bltu	a5,a2,6880 <__divdf3+0x6d0>
    66bc:	24a7e863          	bltu	a5,a0,690c <__divdf3+0x75c>
    66c0:	26a78663          	beq	a5,a0,692c <__divdf3+0x77c>
    66c4:	00030893          	mv	a7,t1
    66c8:	0018e893          	or	a7,a7,1
    66cc:	d55ff06f          	j	6420 <__divdf3+0x270>
    66d0:	00100713          	li	a4,1
    66d4:	c2079ce3          	bnez	a5,630c <__divdf3+0x15c>
    66d8:	41e98993          	add	s3,s3,1054
    66dc:	013897b3          	sll	a5,a7,s3
    66e0:	00f037b3          	snez	a5,a5
    66e4:	013419b3          	sll	s3,s0,s3
    66e8:	0137e7b3          	or	a5,a5,s3
    66ec:	00e8d8b3          	srl	a7,a7,a4
    66f0:	00f8e8b3          	or	a7,a7,a5
    66f4:	0078f793          	and	a5,a7,7
    66f8:	00e45433          	srl	s0,s0,a4
    66fc:	02078063          	beqz	a5,671c <__divdf3+0x56c>
    6700:	00f8f793          	and	a5,a7,15
    6704:	00400713          	li	a4,4
    6708:	00e78a63          	beq	a5,a4,671c <__divdf3+0x56c>
    670c:	00488793          	add	a5,a7,4
    6710:	0117b8b3          	sltu	a7,a5,a7
    6714:	01140433          	add	s0,s0,a7
    6718:	00078893          	mv	a7,a5
    671c:	00841593          	sll	a1,s0,0x8
    6720:	00100793          	li	a5,1
    6724:	00000613          	li	a2,0
    6728:	00000713          	li	a4,0
    672c:	be05cce3          	bltz	a1,6324 <__divdf3+0x174>
    6730:	1340006f          	j	6864 <__divdf3+0x6b4>
    6734:	e8fb78e3          	bgeu	s6,a5,65c4 <__divdf3+0x414>
    6738:	00bb0eb3          	add	t4,s6,a1
    673c:	016ebf33          	sltu	t5,t4,s6
    6740:	00cf0fb3          	add	t6,t5,a2
    6744:	01f70733          	add	a4,a4,t6
    6748:	000e8b13          	mv	s6,t4
    674c:	fff40f93          	add	t6,s0,-1
    6750:	08e67463          	bgeu	a2,a4,67d8 <__divdf3+0x628>
    6754:	15176263          	bltu	a4,a7,6898 <__divdf3+0x6e8>
    6758:	12e88e63          	beq	a7,a4,6894 <__divdf3+0x6e4>
    675c:	000f8413          	mv	s0,t6
    6760:	e65ff06f          	j	65c4 <__divdf3+0x414>
    6764:	d71b62e3          	bltu	s6,a7,64c8 <__divdf3+0x318>
    6768:	001b5713          	srl	a4,s6,0x1
    676c:	01fa9313          	sll	t1,s5,0x1f
    6770:	001ad793          	srl	a5,s5,0x1
    6774:	00e36333          	or	t1,t1,a4
    6778:	01fb1b13          	sll	s6,s6,0x1f
    677c:	d5dff06f          	j	64d8 <__divdf3+0x328>
    6780:	000b8513          	mv	a0,s7
    6784:	4e1000ef          	jal	7464 <__clzsi2>
    6788:	01550693          	add	a3,a0,21 # 10015 <__subdf3+0x893d>
    678c:	01c00713          	li	a4,28
    6790:	02050793          	add	a5,a0,32
    6794:	b4d756e3          	bge	a4,a3,62e0 <__divdf3+0x130>
    6798:	ff850513          	add	a0,a0,-8
    679c:	00000893          	li	a7,0
    67a0:	00ab9433          	sll	s0,s7,a0
    67a4:	b59ff06f          	j	62fc <__divdf3+0x14c>
    67a8:	4bd000ef          	jal	7464 <__clzsi2>
    67ac:	01550693          	add	a3,a0,21
    67b0:	01c00793          	li	a5,28
    67b4:	02050713          	add	a4,a0,32
    67b8:	bed7dae3          	bge	a5,a3,63ac <__divdf3+0x1fc>
    67bc:	ff850793          	add	a5,a0,-8
    67c0:	00f41ab3          	sll	s5,s0,a5
    67c4:	00000b13          	li	s6,0
    67c8:	c01ff06f          	j	63c8 <__divdf3+0x218>
    67cc:	eea79ee3          	bne	a5,a0,66c8 <__divdf3+0x518>
    67d0:	c40708e3          	beqz	a4,6420 <__divdf3+0x270>
    67d4:	ed9ff06f          	j	66ac <__divdf3+0x4fc>
    67d8:	f8e612e3          	bne	a2,a4,675c <__divdf3+0x5ac>
    67dc:	f60f0ce3          	beqz	t5,6754 <__divdf3+0x5a4>
    67e0:	000f8413          	mv	s0,t6
    67e4:	de1ff06f          	j	65c4 <__divdf3+0x414>
    67e8:	d7f774e3          	bgeu	a4,t6,6550 <__divdf3+0x3a0>
    67ec:	ffe88893          	add	a7,a7,-2
    67f0:	00c70733          	add	a4,a4,a2
    67f4:	d61ff06f          	j	6554 <__divdf3+0x3a4>
    67f8:	d317f2e3          	bgeu	a5,a7,651c <__divdf3+0x36c>
    67fc:	ffe40413          	add	s0,s0,-2
    6800:	00c787b3          	add	a5,a5,a2
    6804:	d1dff06f          	j	6520 <__divdf3+0x370>
    6808:	01f00613          	li	a2,31
    680c:	ece656e3          	bge	a2,a4,66d8 <__divdf3+0x528>
    6810:	fe100613          	li	a2,-31
    6814:	40f607b3          	sub	a5,a2,a5
    6818:	02000613          	li	a2,32
    681c:	00f457b3          	srl	a5,s0,a5
    6820:	00c70863          	beq	a4,a2,6830 <__divdf3+0x680>
    6824:	43e98993          	add	s3,s3,1086
    6828:	013419b3          	sll	s3,s0,s3
    682c:	0138e8b3          	or	a7,a7,s3
    6830:	011038b3          	snez	a7,a7
    6834:	00f8e8b3          	or	a7,a7,a5
    6838:	0078f713          	and	a4,a7,7
    683c:	00000613          	li	a2,0
    6840:	02070863          	beqz	a4,6870 <__divdf3+0x6c0>
    6844:	00f8f793          	and	a5,a7,15
    6848:	00400713          	li	a4,4
    684c:	00000413          	li	s0,0
    6850:	00e78a63          	beq	a5,a4,6864 <__divdf3+0x6b4>
    6854:	00488793          	add	a5,a7,4
    6858:	0117b8b3          	sltu	a7,a5,a7
    685c:	01103433          	snez	s0,a7
    6860:	00078893          	mv	a7,a5
    6864:	00941613          	sll	a2,s0,0x9
    6868:	01d41713          	sll	a4,s0,0x1d
    686c:	00c65613          	srl	a2,a2,0xc
    6870:	0038d893          	srl	a7,a7,0x3
    6874:	00e8e733          	or	a4,a7,a4
    6878:	00000793          	li	a5,0
    687c:	aa9ff06f          	j	6324 <__divdf3+0x174>
    6880:	00030893          	mv	a7,t1
    6884:	e4a812e3          	bne	a6,a0,66c8 <__divdf3+0x518>
    6888:	b8b70ce3          	beq	a4,a1,6420 <__divdf3+0x270>
    688c:	0018e893          	or	a7,a7,1
    6890:	b91ff06f          	j	6420 <__divdf3+0x270>
    6894:	ecfef4e3          	bgeu	t4,a5,675c <__divdf3+0x5ac>
    6898:	01d58eb3          	add	t4,a1,t4
    689c:	00bebf33          	sltu	t5,t4,a1
    68a0:	00cf0f33          	add	t5,t5,a2
    68a4:	ffe40413          	add	s0,s0,-2
    68a8:	000e8b13          	mv	s6,t4
    68ac:	01e70733          	add	a4,a4,t5
    68b0:	d15ff06f          	j	65c4 <__divdf3+0x414>
    68b4:	c0200713          	li	a4,-1022
    68b8:	3ff98793          	add	a5,s3,1023
    68bc:	fff00893          	li	a7,-1
    68c0:	e0e9c8e3          	blt	s3,a4,66d0 <__divdf3+0x520>
    68c4:	00488713          	add	a4,a7,4
    68c8:	011738b3          	sltu	a7,a4,a7
    68cc:	01140433          	add	s0,s0,a7
    68d0:	00070893          	mv	a7,a4
    68d4:	b5dff06f          	j	6430 <__divdf3+0x280>
    68d8:	00f8f713          	and	a4,a7,15
    68dc:	00400613          	li	a2,4
    68e0:	b4c708e3          	beq	a4,a2,6430 <__divdf3+0x280>
    68e4:	fe1ff06f          	j	68c4 <__divdf3+0x714>
    68e8:	00070e93          	mv	t4,a4
    68ec:	d5dff06f          	j	6648 <__divdf3+0x498>
    68f0:	000e8893          	mv	a7,t4
    68f4:	d19ff06f          	j	660c <__divdf3+0x45c>
    68f8:	00090693          	mv	a3,s2
    68fc:	7ff00793          	li	a5,2047
    6900:	00000613          	li	a2,0
    6904:	00000713          	li	a4,0
    6908:	a1dff06f          	j	6324 <__divdf3+0x174>
    690c:	00159313          	sll	t1,a1,0x1
    6910:	00b33833          	sltu	a6,t1,a1
    6914:	00c80833          	add	a6,a6,a2
    6918:	01078833          	add	a6,a5,a6
    691c:	ffe88893          	add	a7,a7,-2
    6920:	00030593          	mv	a1,t1
    6924:	f6a802e3          	beq	a6,a0,6888 <__divdf3+0x6d8>
    6928:	da1ff06f          	j	66c8 <__divdf3+0x518>
    692c:	fee5e0e3          	bltu	a1,a4,690c <__divdf3+0x75c>
    6930:	00030893          	mv	a7,t1
    6934:	f4b71ce3          	bne	a4,a1,688c <__divdf3+0x6dc>
    6938:	ae9ff06f          	j	6420 <__divdf3+0x270>

0000693c <__eqdf2>:
    693c:	0145d713          	srl	a4,a1,0x14
    6940:	001007b7          	lui	a5,0x100
    6944:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf8927>
    6948:	0146d813          	srl	a6,a3,0x14
    694c:	7ff77713          	and	a4,a4,2047
    6950:	7ff00313          	li	t1,2047
    6954:	00b7fe33          	and	t3,a5,a1
    6958:	00050893          	mv	a7,a0
    695c:	00d7f7b3          	and	a5,a5,a3
    6960:	01f5d593          	srl	a1,a1,0x1f
    6964:	7ff87813          	and	a6,a6,2047
    6968:	01f6d693          	srl	a3,a3,0x1f
    696c:	00100513          	li	a0,1
    6970:	00670c63          	beq	a4,t1,6988 <__eqdf2+0x4c>
    6974:	00680863          	beq	a6,t1,6984 <__eqdf2+0x48>
    6978:	01071463          	bne	a4,a6,6980 <__eqdf2+0x44>
    697c:	02fe0663          	beq	t3,a5,69a8 <__eqdf2+0x6c>
    6980:	00008067          	ret
    6984:	00008067          	ret
    6988:	fee81ce3          	bne	a6,a4,6980 <__eqdf2+0x44>
    698c:	00fe67b3          	or	a5,t3,a5
    6990:	00c7e7b3          	or	a5,a5,a2
    6994:	0117e7b3          	or	a5,a5,a7
    6998:	fe0794e3          	bnez	a5,6980 <__eqdf2+0x44>
    699c:	40d585b3          	sub	a1,a1,a3
    69a0:	00b03533          	snez	a0,a1
    69a4:	00008067          	ret
    69a8:	fcc89ce3          	bne	a7,a2,6980 <__eqdf2+0x44>
    69ac:	00d58a63          	beq	a1,a3,69c0 <__eqdf2+0x84>
    69b0:	fc0718e3          	bnez	a4,6980 <__eqdf2+0x44>
    69b4:	011e6e33          	or	t3,t3,a7
    69b8:	01c03533          	snez	a0,t3
    69bc:	00008067          	ret
    69c0:	00000513          	li	a0,0
    69c4:	00008067          	ret

000069c8 <__gedf2>:
    69c8:	0145d893          	srl	a7,a1,0x14
    69cc:	001007b7          	lui	a5,0x100
    69d0:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf8927>
    69d4:	0146d713          	srl	a4,a3,0x14
    69d8:	7ff8f893          	and	a7,a7,2047
    69dc:	7ff00e13          	li	t3,2047
    69e0:	00b7f333          	and	t1,a5,a1
    69e4:	00050813          	mv	a6,a0
    69e8:	00050e93          	mv	t4,a0
    69ec:	00d7f7b3          	and	a5,a5,a3
    69f0:	01f5d593          	srl	a1,a1,0x1f
    69f4:	00060f13          	mv	t5,a2
    69f8:	7ff77513          	and	a0,a4,2047
    69fc:	01f6d693          	srl	a3,a3,0x1f
    6a00:	05c88863          	beq	a7,t3,6a50 <__gedf2+0x88>
    6a04:	03c50463          	beq	a0,t3,6a2c <__gedf2+0x64>
    6a08:	06089a63          	bnez	a7,6a7c <__gedf2+0xb4>
    6a0c:	01036833          	or	a6,t1,a6
    6a10:	06051063          	bnez	a0,6a70 <__gedf2+0xa8>
    6a14:	00c7e633          	or	a2,a5,a2
    6a18:	08060c63          	beqz	a2,6ab0 <__gedf2+0xe8>
    6a1c:	0a081263          	bnez	a6,6ac0 <__gedf2+0xf8>
    6a20:	00100513          	li	a0,1
    6a24:	08068263          	beqz	a3,6aa8 <__gedf2+0xe0>
    6a28:	00008067          	ret
    6a2c:	00c7e633          	or	a2,a5,a2
    6a30:	08061463          	bnez	a2,6ab8 <__gedf2+0xf0>
    6a34:	00089663          	bnez	a7,6a40 <__gedf2+0x78>
    6a38:	01036333          	or	t1,t1,a6
    6a3c:	fe0302e3          	beqz	t1,6a20 <__gedf2+0x58>
    6a40:	06d58063          	beq	a1,a3,6aa0 <__gedf2+0xd8>
    6a44:	06059263          	bnez	a1,6aa8 <__gedf2+0xe0>
    6a48:	00100513          	li	a0,1
    6a4c:	00008067          	ret
    6a50:	01036333          	or	t1,t1,a6
    6a54:	06031263          	bnez	t1,6ab8 <__gedf2+0xf0>
    6a58:	ff1516e3          	bne	a0,a7,6a44 <__gedf2+0x7c>
    6a5c:	00c7e7b3          	or	a5,a5,a2
    6a60:	04079c63          	bnez	a5,6ab8 <__gedf2+0xf0>
    6a64:	fed590e3          	bne	a1,a3,6a44 <__gedf2+0x7c>
    6a68:	00000513          	li	a0,0
    6a6c:	00008067          	ret
    6a70:	fa0808e3          	beqz	a6,6a20 <__gedf2+0x58>
    6a74:	fcd598e3          	bne	a1,a3,6a44 <__gedf2+0x7c>
    6a78:	0280006f          	j	6aa0 <__gedf2+0xd8>
    6a7c:	fc0504e3          	beqz	a0,6a44 <__gedf2+0x7c>
    6a80:	fcd592e3          	bne	a1,a3,6a44 <__gedf2+0x7c>
    6a84:	fd1540e3          	blt	a0,a7,6a44 <__gedf2+0x7c>
    6a88:	00a8cc63          	blt	a7,a0,6aa0 <__gedf2+0xd8>
    6a8c:	fa67ece3          	bltu	a5,t1,6a44 <__gedf2+0x7c>
    6a90:	00f31863          	bne	t1,a5,6aa0 <__gedf2+0xd8>
    6a94:	fbdf68e3          	bltu	t5,t4,6a44 <__gedf2+0x7c>
    6a98:	00000513          	li	a0,0
    6a9c:	f9eef6e3          	bgeu	t4,t5,6a28 <__gedf2+0x60>
    6aa0:	00100513          	li	a0,1
    6aa4:	f80592e3          	bnez	a1,6a28 <__gedf2+0x60>
    6aa8:	fff00513          	li	a0,-1
    6aac:	00008067          	ret
    6ab0:	f8081ae3          	bnez	a6,6a44 <__gedf2+0x7c>
    6ab4:	00008067          	ret
    6ab8:	ffe00513          	li	a0,-2
    6abc:	00008067          	ret
    6ac0:	fcd586e3          	beq	a1,a3,6a8c <__gedf2+0xc4>
    6ac4:	f81ff06f          	j	6a44 <__gedf2+0x7c>

00006ac8 <__ledf2>:
    6ac8:	0145d893          	srl	a7,a1,0x14
    6acc:	001007b7          	lui	a5,0x100
    6ad0:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf8927>
    6ad4:	0146d713          	srl	a4,a3,0x14
    6ad8:	7ff8f893          	and	a7,a7,2047
    6adc:	7ff00313          	li	t1,2047
    6ae0:	00b7fe33          	and	t3,a5,a1
    6ae4:	00050813          	mv	a6,a0
    6ae8:	00050e93          	mv	t4,a0
    6aec:	00d7f7b3          	and	a5,a5,a3
    6af0:	01f5d593          	srl	a1,a1,0x1f
    6af4:	00060f13          	mv	t5,a2
    6af8:	7ff77513          	and	a0,a4,2047
    6afc:	01f6d693          	srl	a3,a3,0x1f
    6b00:	04688a63          	beq	a7,t1,6b54 <__ledf2+0x8c>
    6b04:	02650463          	beq	a0,t1,6b2c <__ledf2+0x64>
    6b08:	06089863          	bnez	a7,6b78 <__ledf2+0xb0>
    6b0c:	010e6833          	or	a6,t3,a6
    6b10:	08051e63          	bnez	a0,6bac <__ledf2+0xe4>
    6b14:	00c7e633          	or	a2,a5,a2
    6b18:	0a060463          	beqz	a2,6bc0 <__ledf2+0xf8>
    6b1c:	0a081663          	bnez	a6,6bc8 <__ledf2+0x100>
    6b20:	00100513          	li	a0,1
    6b24:	08068063          	beqz	a3,6ba4 <__ledf2+0xdc>
    6b28:	00008067          	ret
    6b2c:	00c7e633          	or	a2,a5,a2
    6b30:	00200513          	li	a0,2
    6b34:	fe061ae3          	bnez	a2,6b28 <__ledf2+0x60>
    6b38:	00089663          	bnez	a7,6b44 <__ledf2+0x7c>
    6b3c:	010e6e33          	or	t3,t3,a6
    6b40:	fe0e00e3          	beqz	t3,6b20 <__ledf2+0x58>
    6b44:	04d58c63          	beq	a1,a3,6b9c <__ledf2+0xd4>
    6b48:	04059e63          	bnez	a1,6ba4 <__ledf2+0xdc>
    6b4c:	00100513          	li	a0,1
    6b50:	00008067          	ret
    6b54:	010e6e33          	or	t3,t3,a6
    6b58:	060e1063          	bnez	t3,6bb8 <__ledf2+0xf0>
    6b5c:	ff1516e3          	bne	a0,a7,6b48 <__ledf2+0x80>
    6b60:	00c7e7b3          	or	a5,a5,a2
    6b64:	00200513          	li	a0,2
    6b68:	fc0790e3          	bnez	a5,6b28 <__ledf2+0x60>
    6b6c:	fcd59ee3          	bne	a1,a3,6b48 <__ledf2+0x80>
    6b70:	00000513          	li	a0,0
    6b74:	00008067          	ret
    6b78:	fc0508e3          	beqz	a0,6b48 <__ledf2+0x80>
    6b7c:	fcd596e3          	bne	a1,a3,6b48 <__ledf2+0x80>
    6b80:	fd1544e3          	blt	a0,a7,6b48 <__ledf2+0x80>
    6b84:	00a8cc63          	blt	a7,a0,6b9c <__ledf2+0xd4>
    6b88:	fdc7e0e3          	bltu	a5,t3,6b48 <__ledf2+0x80>
    6b8c:	00fe1863          	bne	t3,a5,6b9c <__ledf2+0xd4>
    6b90:	fbdf6ce3          	bltu	t5,t4,6b48 <__ledf2+0x80>
    6b94:	00000513          	li	a0,0
    6b98:	f9eef8e3          	bgeu	t4,t5,6b28 <__ledf2+0x60>
    6b9c:	00100513          	li	a0,1
    6ba0:	f80594e3          	bnez	a1,6b28 <__ledf2+0x60>
    6ba4:	fff00513          	li	a0,-1
    6ba8:	00008067          	ret
    6bac:	f6080ae3          	beqz	a6,6b20 <__ledf2+0x58>
    6bb0:	f8d59ce3          	bne	a1,a3,6b48 <__ledf2+0x80>
    6bb4:	fe9ff06f          	j	6b9c <__ledf2+0xd4>
    6bb8:	00200513          	li	a0,2
    6bbc:	00008067          	ret
    6bc0:	f80814e3          	bnez	a6,6b48 <__ledf2+0x80>
    6bc4:	00008067          	ret
    6bc8:	fcd580e3          	beq	a1,a3,6b88 <__ledf2+0xc0>
    6bcc:	f7dff06f          	j	6b48 <__ledf2+0x80>

00006bd0 <__muldf3>:
    6bd0:	fd010113          	add	sp,sp,-48
    6bd4:	0145d793          	srl	a5,a1,0x14
    6bd8:	02812423          	sw	s0,40(sp)
    6bdc:	02912223          	sw	s1,36(sp)
    6be0:	03212023          	sw	s2,32(sp)
    6be4:	01312e23          	sw	s3,28(sp)
    6be8:	01512a23          	sw	s5,20(sp)
    6bec:	00c59493          	sll	s1,a1,0xc
    6bf0:	02112623          	sw	ra,44(sp)
    6bf4:	01412c23          	sw	s4,24(sp)
    6bf8:	01612823          	sw	s6,16(sp)
    6bfc:	01712623          	sw	s7,12(sp)
    6c00:	01812423          	sw	s8,8(sp)
    6c04:	7ff7f793          	and	a5,a5,2047
    6c08:	00050413          	mv	s0,a0
    6c0c:	00060a93          	mv	s5,a2
    6c10:	00068993          	mv	s3,a3
    6c14:	00c4d493          	srl	s1,s1,0xc
    6c18:	01f5d913          	srl	s2,a1,0x1f
    6c1c:	42078463          	beqz	a5,7044 <__muldf3+0x474>
    6c20:	7ff00713          	li	a4,2047
    6c24:	0ae78663          	beq	a5,a4,6cd0 <__muldf3+0x100>
    6c28:	00349693          	sll	a3,s1,0x3
    6c2c:	01d55713          	srl	a4,a0,0x1d
    6c30:	00d76733          	or	a4,a4,a3
    6c34:	008006b7          	lui	a3,0x800
    6c38:	00d764b3          	or	s1,a4,a3
    6c3c:	00351a13          	sll	s4,a0,0x3
    6c40:	c0178c13          	add	s8,a5,-1023
    6c44:	00000b13          	li	s6,0
    6c48:	00000b93          	li	s7,0
    6c4c:	0149d793          	srl	a5,s3,0x14
    6c50:	00c99713          	sll	a4,s3,0xc
    6c54:	7ff7f793          	and	a5,a5,2047
    6c58:	000a8f13          	mv	t5,s5
    6c5c:	00c75413          	srl	s0,a4,0xc
    6c60:	01f9d993          	srl	s3,s3,0x1f
    6c64:	0a078063          	beqz	a5,6d04 <__muldf3+0x134>
    6c68:	7ff00713          	li	a4,2047
    6c6c:	14e78e63          	beq	a5,a4,6dc8 <__muldf3+0x1f8>
    6c70:	00341713          	sll	a4,s0,0x3
    6c74:	01dad593          	srl	a1,s5,0x1d
    6c78:	00e5e5b3          	or	a1,a1,a4
    6c7c:	c0178793          	add	a5,a5,-1023
    6c80:	00800737          	lui	a4,0x800
    6c84:	00e5e433          	or	s0,a1,a4
    6c88:	003a9f13          	sll	t5,s5,0x3
    6c8c:	018788b3          	add	a7,a5,s8
    6c90:	00000313          	li	t1,0
    6c94:	00a00713          	li	a4,10
    6c98:	00188513          	add	a0,a7,1
    6c9c:	0b674c63          	blt	a4,s6,6d54 <__muldf3+0x184>
    6ca0:	013945b3          	xor	a1,s2,s3
    6ca4:	00200793          	li	a5,2
    6ca8:	00058813          	mv	a6,a1
    6cac:	1567c663          	blt	a5,s6,6df8 <__muldf3+0x228>
    6cb0:	fffb0b13          	add	s6,s6,-1
    6cb4:	00100713          	li	a4,1
    6cb8:	17676063          	bltu	a4,s6,6e18 <__muldf3+0x248>
    6cbc:	3cf30a63          	beq	t1,a5,7090 <__muldf3+0x4c0>
    6cc0:	00040493          	mv	s1,s0
    6cc4:	000f0a13          	mv	s4,t5
    6cc8:	00030b93          	mv	s7,t1
    6ccc:	09c0006f          	j	6d68 <__muldf3+0x198>
    6cd0:	00a4ea33          	or	s4,s1,a0
    6cd4:	3c0a1863          	bnez	s4,70a4 <__muldf3+0x4d4>
    6cd8:	0149d793          	srl	a5,s3,0x14
    6cdc:	00c99713          	sll	a4,s3,0xc
    6ce0:	7ff7f793          	and	a5,a5,2047
    6ce4:	00000493          	li	s1,0
    6ce8:	00800b13          	li	s6,8
    6cec:	7ff00c13          	li	s8,2047
    6cf0:	00200b93          	li	s7,2
    6cf4:	000a8f13          	mv	t5,s5
    6cf8:	00c75413          	srl	s0,a4,0xc
    6cfc:	01f9d993          	srl	s3,s3,0x1f
    6d00:	f60794e3          	bnez	a5,6c68 <__muldf3+0x98>
    6d04:	015467b3          	or	a5,s0,s5
    6d08:	3c078263          	beqz	a5,70cc <__muldf3+0x4fc>
    6d0c:	4a040063          	beqz	s0,71ac <__muldf3+0x5dc>
    6d10:	00040513          	mv	a0,s0
    6d14:	750000ef          	jal	7464 <__clzsi2>
    6d18:	00050893          	mv	a7,a0
    6d1c:	ff550713          	add	a4,a0,-11
    6d20:	01d00793          	li	a5,29
    6d24:	ff888f13          	add	t5,a7,-8
    6d28:	40e787b3          	sub	a5,a5,a4
    6d2c:	00fad7b3          	srl	a5,s5,a5
    6d30:	01e41733          	sll	a4,s0,t5
    6d34:	00e7e433          	or	s0,a5,a4
    6d38:	01ea9f33          	sll	t5,s5,t5
    6d3c:	411c08b3          	sub	a7,s8,a7
    6d40:	c0d88893          	add	a7,a7,-1011
    6d44:	00a00713          	li	a4,10
    6d48:	00000313          	li	t1,0
    6d4c:	00188513          	add	a0,a7,1
    6d50:	f56758e3          	bge	a4,s6,6ca0 <__muldf3+0xd0>
    6d54:	00090593          	mv	a1,s2
    6d58:	00200793          	li	a5,2
    6d5c:	32fb8a63          	beq	s7,a5,7090 <__muldf3+0x4c0>
    6d60:	00300793          	li	a5,3
    6d64:	48fb8c63          	beq	s7,a5,71fc <__muldf3+0x62c>
    6d68:	00100793          	li	a5,1
    6d6c:	00058813          	mv	a6,a1
    6d70:	46fb9a63          	bne	s7,a5,71e4 <__muldf3+0x614>
    6d74:	00000793          	li	a5,0
    6d78:	00000693          	li	a3,0
    6d7c:	00000713          	li	a4,0
    6d80:	02c12083          	lw	ra,44(sp)
    6d84:	02812403          	lw	s0,40(sp)
    6d88:	01479793          	sll	a5,a5,0x14
    6d8c:	00d7e7b3          	or	a5,a5,a3
    6d90:	01f81693          	sll	a3,a6,0x1f
    6d94:	00d7e7b3          	or	a5,a5,a3
    6d98:	02412483          	lw	s1,36(sp)
    6d9c:	02012903          	lw	s2,32(sp)
    6da0:	01c12983          	lw	s3,28(sp)
    6da4:	01812a03          	lw	s4,24(sp)
    6da8:	01412a83          	lw	s5,20(sp)
    6dac:	01012b03          	lw	s6,16(sp)
    6db0:	00c12b83          	lw	s7,12(sp)
    6db4:	00812c03          	lw	s8,8(sp)
    6db8:	00070513          	mv	a0,a4
    6dbc:	00078593          	mv	a1,a5
    6dc0:	03010113          	add	sp,sp,48
    6dc4:	00008067          	ret
    6dc8:	01546733          	or	a4,s0,s5
    6dcc:	7ffc0893          	add	a7,s8,2047
    6dd0:	30070a63          	beqz	a4,70e4 <__muldf3+0x514>
    6dd4:	00001737          	lui	a4,0x1
    6dd8:	01394833          	xor	a6,s2,s3
    6ddc:	80070713          	add	a4,a4,-2048 # 800 <_gbl_ptr>
    6de0:	003b6b13          	or	s6,s6,3
    6de4:	00a00693          	li	a3,10
    6de8:	00080593          	mv	a1,a6
    6dec:	00ec0533          	add	a0,s8,a4
    6df0:	3966c063          	blt	a3,s6,7170 <__muldf3+0x5a0>
    6df4:	00300313          	li	t1,3
    6df8:	00100613          	li	a2,1
    6dfc:	01661633          	sll	a2,a2,s6
    6e00:	53067713          	and	a4,a2,1328
    6e04:	f4071ae3          	bnez	a4,6d58 <__muldf3+0x188>
    6e08:	24067793          	and	a5,a2,576
    6e0c:	3c079463          	bnez	a5,71d4 <__muldf3+0x604>
    6e10:	08867613          	and	a2,a2,136
    6e14:	2e061263          	bnez	a2,70f8 <__muldf3+0x528>
    6e18:	00010fb7          	lui	t6,0x10
    6e1c:	ffff8e93          	add	t4,t6,-1 # ffff <__subdf3+0x8927>
    6e20:	01da77b3          	and	a5,s4,t4
    6e24:	010a5693          	srl	a3,s4,0x10
    6e28:	01df7eb3          	and	t4,t5,t4
    6e2c:	010f5e13          	srl	t3,t5,0x10
    6e30:	03d78733          	mul	a4,a5,t4
    6e34:	03d68333          	mul	t1,a3,t4
    6e38:	01075593          	srl	a1,a4,0x10
    6e3c:	02fe0633          	mul	a2,t3,a5
    6e40:	00660633          	add	a2,a2,t1
    6e44:	00c585b3          	add	a1,a1,a2
    6e48:	03c68f33          	mul	t5,a3,t3
    6e4c:	0065f463          	bgeu	a1,t1,6e54 <__muldf3+0x284>
    6e50:	01ff0f33          	add	t5,t5,t6
    6e54:	000103b7          	lui	t2,0x10
    6e58:	fff38613          	add	a2,t2,-1 # ffff <__subdf3+0x8927>
    6e5c:	00c5f333          	and	t1,a1,a2
    6e60:	01045f93          	srl	t6,s0,0x10
    6e64:	00c77733          	and	a4,a4,a2
    6e68:	00c47433          	and	s0,s0,a2
    6e6c:	01031313          	sll	t1,t1,0x10
    6e70:	028782b3          	mul	t0,a5,s0
    6e74:	00e30333          	add	t1,t1,a4
    6e78:	0105d593          	srl	a1,a1,0x10
    6e7c:	02868733          	mul	a4,a3,s0
    6e80:	0102d613          	srl	a2,t0,0x10
    6e84:	02ff87b3          	mul	a5,t6,a5
    6e88:	00e787b3          	add	a5,a5,a4
    6e8c:	00f60633          	add	a2,a2,a5
    6e90:	03f687b3          	mul	a5,a3,t6
    6e94:	00e67463          	bgeu	a2,a4,6e9c <__muldf3+0x2cc>
    6e98:	007787b3          	add	a5,a5,t2
    6e9c:	00010937          	lui	s2,0x10
    6ea0:	fff90993          	add	s3,s2,-1 # ffff <__subdf3+0x8927>
    6ea4:	01367733          	and	a4,a2,s3
    6ea8:	0104d393          	srl	t2,s1,0x10
    6eac:	0134f6b3          	and	a3,s1,s3
    6eb0:	0132f2b3          	and	t0,t0,s3
    6eb4:	01071713          	sll	a4,a4,0x10
    6eb8:	02de84b3          	mul	s1,t4,a3
    6ebc:	00570733          	add	a4,a4,t0
    6ec0:	01065613          	srl	a2,a2,0x10
    6ec4:	00f60633          	add	a2,a2,a5
    6ec8:	00e585b3          	add	a1,a1,a4
    6ecc:	02de02b3          	mul	t0,t3,a3
    6ed0:	0104d793          	srl	a5,s1,0x10
    6ed4:	03d38eb3          	mul	t4,t2,t4
    6ed8:	01d282b3          	add	t0,t0,t4
    6edc:	005787b3          	add	a5,a5,t0
    6ee0:	027e0e33          	mul	t3,t3,t2
    6ee4:	01d7f463          	bgeu	a5,t4,6eec <__muldf3+0x31c>
    6ee8:	012e0e33          	add	t3,t3,s2
    6eec:	000109b7          	lui	s3,0x10
    6ef0:	fff98e93          	add	t4,s3,-1 # ffff <__subdf3+0x8927>
    6ef4:	01d7f2b3          	and	t0,a5,t4
    6ef8:	0107d793          	srl	a5,a5,0x10
    6efc:	01c787b3          	add	a5,a5,t3
    6f00:	01d4feb3          	and	t4,s1,t4
    6f04:	01029293          	sll	t0,t0,0x10
    6f08:	02d40933          	mul	s2,s0,a3
    6f0c:	01d282b3          	add	t0,t0,t4
    6f10:	02838433          	mul	s0,t2,s0
    6f14:	01095e13          	srl	t3,s2,0x10
    6f18:	02df86b3          	mul	a3,t6,a3
    6f1c:	008686b3          	add	a3,a3,s0
    6f20:	00de0e33          	add	t3,t3,a3
    6f24:	027f8eb3          	mul	t4,t6,t2
    6f28:	008e7463          	bgeu	t3,s0,6f30 <__muldf3+0x360>
    6f2c:	013e8eb3          	add	t4,t4,s3
    6f30:	00010fb7          	lui	t6,0x10
    6f34:	ffff8f93          	add	t6,t6,-1 # ffff <__subdf3+0x8927>
    6f38:	01fe76b3          	and	a3,t3,t6
    6f3c:	01069693          	sll	a3,a3,0x10
    6f40:	01f97933          	and	s2,s2,t6
    6f44:	01e585b3          	add	a1,a1,t5
    6f48:	012686b3          	add	a3,a3,s2
    6f4c:	00c68633          	add	a2,a3,a2
    6f50:	00e5b733          	sltu	a4,a1,a4
    6f54:	00e60733          	add	a4,a2,a4
    6f58:	00558f33          	add	t5,a1,t0
    6f5c:	00f707b3          	add	a5,a4,a5
    6f60:	00bf35b3          	sltu	a1,t5,a1
    6f64:	00b785b3          	add	a1,a5,a1
    6f68:	00d636b3          	sltu	a3,a2,a3
    6f6c:	00c73633          	sltu	a2,a4,a2
    6f70:	00c6e6b3          	or	a3,a3,a2
    6f74:	00e7b733          	sltu	a4,a5,a4
    6f78:	010e5e13          	srl	t3,t3,0x10
    6f7c:	00f5b7b3          	sltu	a5,a1,a5
    6f80:	01c686b3          	add	a3,a3,t3
    6f84:	00f76733          	or	a4,a4,a5
    6f88:	009f1793          	sll	a5,t5,0x9
    6f8c:	00d70733          	add	a4,a4,a3
    6f90:	0067e7b3          	or	a5,a5,t1
    6f94:	01d70733          	add	a4,a4,t4
    6f98:	00f037b3          	snez	a5,a5
    6f9c:	017f5613          	srl	a2,t5,0x17
    6fa0:	00971713          	sll	a4,a4,0x9
    6fa4:	0175d693          	srl	a3,a1,0x17
    6fa8:	00c7e7b3          	or	a5,a5,a2
    6fac:	00959593          	sll	a1,a1,0x9
    6fb0:	00b7ea33          	or	s4,a5,a1
    6fb4:	00771793          	sll	a5,a4,0x7
    6fb8:	00d764b3          	or	s1,a4,a3
    6fbc:	0207d063          	bgez	a5,6fdc <__muldf3+0x40c>
    6fc0:	001a5713          	srl	a4,s4,0x1
    6fc4:	001a7793          	and	a5,s4,1
    6fc8:	01f49693          	sll	a3,s1,0x1f
    6fcc:	00f767b3          	or	a5,a4,a5
    6fd0:	00d7ea33          	or	s4,a5,a3
    6fd4:	0014d493          	srl	s1,s1,0x1
    6fd8:	00050893          	mv	a7,a0
    6fdc:	3ff88613          	add	a2,a7,1023
    6fe0:	12c05663          	blez	a2,710c <__muldf3+0x53c>
    6fe4:	007a7793          	and	a5,s4,7
    6fe8:	02078063          	beqz	a5,7008 <__muldf3+0x438>
    6fec:	00fa7793          	and	a5,s4,15
    6ff0:	00400713          	li	a4,4
    6ff4:	00e78a63          	beq	a5,a4,7008 <__muldf3+0x438>
    6ff8:	004a0713          	add	a4,s4,4
    6ffc:	014737b3          	sltu	a5,a4,s4
    7000:	00f484b3          	add	s1,s1,a5
    7004:	00070a13          	mv	s4,a4
    7008:	00749793          	sll	a5,s1,0x7
    700c:	0007da63          	bgez	a5,7020 <__muldf3+0x450>
    7010:	ff0007b7          	lui	a5,0xff000
    7014:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff8927>
    7018:	00f4f4b3          	and	s1,s1,a5
    701c:	40088613          	add	a2,a7,1024
    7020:	7fe00793          	li	a5,2046
    7024:	1cc7c463          	blt	a5,a2,71ec <__muldf3+0x61c>
    7028:	003a5793          	srl	a5,s4,0x3
    702c:	01d49713          	sll	a4,s1,0x1d
    7030:	00949693          	sll	a3,s1,0x9
    7034:	00f76733          	or	a4,a4,a5
    7038:	00c6d693          	srl	a3,a3,0xc
    703c:	7ff67793          	and	a5,a2,2047
    7040:	d41ff06f          	j	6d80 <__muldf3+0x1b0>
    7044:	00a4ea33          	or	s4,s1,a0
    7048:	060a0863          	beqz	s4,70b8 <__muldf3+0x4e8>
    704c:	12048e63          	beqz	s1,7188 <__muldf3+0x5b8>
    7050:	00048513          	mv	a0,s1
    7054:	410000ef          	jal	7464 <__clzsi2>
    7058:	00050613          	mv	a2,a0
    705c:	ff550693          	add	a3,a0,-11
    7060:	01d00713          	li	a4,29
    7064:	ff860793          	add	a5,a2,-8 # 7fff8 <__subdf3+0x78920>
    7068:	40d70733          	sub	a4,a4,a3
    706c:	00e45733          	srl	a4,s0,a4
    7070:	00f496b3          	sll	a3,s1,a5
    7074:	00d764b3          	or	s1,a4,a3
    7078:	00f41a33          	sll	s4,s0,a5
    707c:	c0d00793          	li	a5,-1011
    7080:	40c78c33          	sub	s8,a5,a2
    7084:	00000b13          	li	s6,0
    7088:	00000b93          	li	s7,0
    708c:	bc1ff06f          	j	6c4c <__muldf3+0x7c>
    7090:	00058813          	mv	a6,a1
    7094:	7ff00793          	li	a5,2047
    7098:	00000693          	li	a3,0
    709c:	00000713          	li	a4,0
    70a0:	ce1ff06f          	j	6d80 <__muldf3+0x1b0>
    70a4:	00050a13          	mv	s4,a0
    70a8:	00c00b13          	li	s6,12
    70ac:	7ff00c13          	li	s8,2047
    70b0:	00300b93          	li	s7,3
    70b4:	b99ff06f          	j	6c4c <__muldf3+0x7c>
    70b8:	00000493          	li	s1,0
    70bc:	00400b13          	li	s6,4
    70c0:	00000c13          	li	s8,0
    70c4:	00100b93          	li	s7,1
    70c8:	b85ff06f          	j	6c4c <__muldf3+0x7c>
    70cc:	001b6b13          	or	s6,s6,1
    70d0:	000c0893          	mv	a7,s8
    70d4:	00000413          	li	s0,0
    70d8:	00000f13          	li	t5,0
    70dc:	00100313          	li	t1,1
    70e0:	bb5ff06f          	j	6c94 <__muldf3+0xc4>
    70e4:	002b6b13          	or	s6,s6,2
    70e8:	00000413          	li	s0,0
    70ec:	00000f13          	li	t5,0
    70f0:	00200313          	li	t1,2
    70f4:	ba1ff06f          	j	6c94 <__muldf3+0xc4>
    70f8:	00040493          	mv	s1,s0
    70fc:	000f0a13          	mv	s4,t5
    7100:	00030b93          	mv	s7,t1
    7104:	00098593          	mv	a1,s3
    7108:	c51ff06f          	j	6d58 <__muldf3+0x188>
    710c:	00100713          	li	a4,1
    7110:	10061063          	bnez	a2,7210 <__muldf3+0x640>
    7114:	41e88893          	add	a7,a7,1054
    7118:	011a1633          	sll	a2,s4,a7
    711c:	00c03633          	snez	a2,a2
    7120:	011498b3          	sll	a7,s1,a7
    7124:	00ea57b3          	srl	a5,s4,a4
    7128:	01166633          	or	a2,a2,a7
    712c:	00f66633          	or	a2,a2,a5
    7130:	00767793          	and	a5,a2,7
    7134:	00e4d5b3          	srl	a1,s1,a4
    7138:	02078063          	beqz	a5,7158 <__muldf3+0x588>
    713c:	00f67793          	and	a5,a2,15
    7140:	00400713          	li	a4,4
    7144:	00e78a63          	beq	a5,a4,7158 <__muldf3+0x588>
    7148:	00460793          	add	a5,a2,4
    714c:	00c7b633          	sltu	a2,a5,a2
    7150:	00c585b3          	add	a1,a1,a2
    7154:	00078613          	mv	a2,a5
    7158:	00859513          	sll	a0,a1,0x8
    715c:	00100793          	li	a5,1
    7160:	00000693          	li	a3,0
    7164:	00000713          	li	a4,0
    7168:	c0054ce3          	bltz	a0,6d80 <__muldf3+0x1b0>
    716c:	10c0006f          	j	7278 <__muldf3+0x6a8>
    7170:	00f00713          	li	a4,15
    7174:	12eb1063          	bne	s6,a4,7294 <__muldf3+0x6c4>
    7178:	00000813          	li	a6,0
    717c:	000806b7          	lui	a3,0x80
    7180:	00000713          	li	a4,0
    7184:	bfdff06f          	j	6d80 <__muldf3+0x1b0>
    7188:	2dc000ef          	jal	7464 <__clzsi2>
    718c:	01550693          	add	a3,a0,21
    7190:	01c00793          	li	a5,28
    7194:	02050613          	add	a2,a0,32
    7198:	ecd7d4e3          	bge	a5,a3,7060 <__muldf3+0x490>
    719c:	ff850513          	add	a0,a0,-8
    71a0:	00000a13          	li	s4,0
    71a4:	00a414b3          	sll	s1,s0,a0
    71a8:	ed5ff06f          	j	707c <__muldf3+0x4ac>
    71ac:	000a8513          	mv	a0,s5
    71b0:	2b4000ef          	jal	7464 <__clzsi2>
    71b4:	01550713          	add	a4,a0,21
    71b8:	01c00793          	li	a5,28
    71bc:	02050893          	add	a7,a0,32
    71c0:	b6e7d0e3          	bge	a5,a4,6d20 <__muldf3+0x150>
    71c4:	ff850513          	add	a0,a0,-8
    71c8:	00000f13          	li	t5,0
    71cc:	00aa9433          	sll	s0,s5,a0
    71d0:	b6dff06f          	j	6d3c <__muldf3+0x16c>
    71d4:	00000813          	li	a6,0
    71d8:	7ff00793          	li	a5,2047
    71dc:	000806b7          	lui	a3,0x80
    71e0:	ba1ff06f          	j	6d80 <__muldf3+0x1b0>
    71e4:	00050893          	mv	a7,a0
    71e8:	df5ff06f          	j	6fdc <__muldf3+0x40c>
    71ec:	7ff00793          	li	a5,2047
    71f0:	00000693          	li	a3,0
    71f4:	00000713          	li	a4,0
    71f8:	b89ff06f          	j	6d80 <__muldf3+0x1b0>
    71fc:	00000813          	li	a6,0
    7200:	7ff00793          	li	a5,2047
    7204:	000806b7          	lui	a3,0x80
    7208:	00000713          	li	a4,0
    720c:	b75ff06f          	j	6d80 <__muldf3+0x1b0>
    7210:	40c70733          	sub	a4,a4,a2
    7214:	03800793          	li	a5,56
    7218:	b4e7cee3          	blt	a5,a4,6d74 <__muldf3+0x1a4>
    721c:	01f00793          	li	a5,31
    7220:	eee7dae3          	bge	a5,a4,7114 <__muldf3+0x544>
    7224:	fe100793          	li	a5,-31
    7228:	40c787b3          	sub	a5,a5,a2
    722c:	02000693          	li	a3,32
    7230:	00f4d7b3          	srl	a5,s1,a5
    7234:	00d70863          	beq	a4,a3,7244 <__muldf3+0x674>
    7238:	43e88893          	add	a7,a7,1086
    723c:	011498b3          	sll	a7,s1,a7
    7240:	011a6a33          	or	s4,s4,a7
    7244:	01403633          	snez	a2,s4
    7248:	00f66633          	or	a2,a2,a5
    724c:	00767713          	and	a4,a2,7
    7250:	00000693          	li	a3,0
    7254:	02070863          	beqz	a4,7284 <__muldf3+0x6b4>
    7258:	00f67793          	and	a5,a2,15
    725c:	00400713          	li	a4,4
    7260:	00000593          	li	a1,0
    7264:	00e78a63          	beq	a5,a4,7278 <__muldf3+0x6a8>
    7268:	00460793          	add	a5,a2,4
    726c:	00c7b633          	sltu	a2,a5,a2
    7270:	00c035b3          	snez	a1,a2
    7274:	00078613          	mv	a2,a5
    7278:	00959693          	sll	a3,a1,0x9
    727c:	01d59713          	sll	a4,a1,0x1d
    7280:	00c6d693          	srl	a3,a3,0xc
    7284:	00365613          	srl	a2,a2,0x3
    7288:	00e66733          	or	a4,a2,a4
    728c:	00000793          	li	a5,0
    7290:	af1ff06f          	j	6d80 <__muldf3+0x1b0>
    7294:	00040493          	mv	s1,s0
    7298:	000a8a13          	mv	s4,s5
    729c:	00300b93          	li	s7,3
    72a0:	00098593          	mv	a1,s3
    72a4:	ab5ff06f          	j	6d58 <__muldf3+0x188>

000072a8 <__fixdfsi>:
    72a8:	0145d793          	srl	a5,a1,0x14
    72ac:	001006b7          	lui	a3,0x100
    72b0:	fff68713          	add	a4,a3,-1 # fffff <__subdf3+0xf8927>
    72b4:	7ff7f793          	and	a5,a5,2047
    72b8:	3fe00613          	li	a2,1022
    72bc:	00b77733          	and	a4,a4,a1
    72c0:	01f5d593          	srl	a1,a1,0x1f
    72c4:	00f65e63          	bge	a2,a5,72e0 <__fixdfsi+0x38>
    72c8:	41d00613          	li	a2,1053
    72cc:	00f65e63          	bge	a2,a5,72e8 <__fixdfsi+0x40>
    72d0:	80000537          	lui	a0,0x80000
    72d4:	fff50513          	add	a0,a0,-1 # 7fffffff <__subdf3+0x7fff8927>
    72d8:	00a58533          	add	a0,a1,a0
    72dc:	00008067          	ret
    72e0:	00000513          	li	a0,0
    72e4:	00008067          	ret
    72e8:	43300613          	li	a2,1075
    72ec:	40f60633          	sub	a2,a2,a5
    72f0:	01f00813          	li	a6,31
    72f4:	00d76733          	or	a4,a4,a3
    72f8:	02c85063          	bge	a6,a2,7318 <__fixdfsi+0x70>
    72fc:	41300693          	li	a3,1043
    7300:	40f687b3          	sub	a5,a3,a5
    7304:	00f75733          	srl	a4,a4,a5
    7308:	40e00533          	neg	a0,a4
    730c:	fc059ce3          	bnez	a1,72e4 <__fixdfsi+0x3c>
    7310:	00070513          	mv	a0,a4
    7314:	00008067          	ret
    7318:	bed78793          	add	a5,a5,-1043
    731c:	00f71733          	sll	a4,a4,a5
    7320:	00c55533          	srl	a0,a0,a2
    7324:	00a76733          	or	a4,a4,a0
    7328:	fe1ff06f          	j	7308 <__fixdfsi+0x60>

0000732c <__fixunsdfsi>:
    732c:	0145d793          	srl	a5,a1,0x14
    7330:	00100637          	lui	a2,0x100
    7334:	fff60713          	add	a4,a2,-1 # fffff <__subdf3+0xf8927>
    7338:	7ff7f793          	and	a5,a5,2047
    733c:	3fe00813          	li	a6,1022
    7340:	00050693          	mv	a3,a0
    7344:	00b77733          	and	a4,a4,a1
    7348:	00000513          	li	a0,0
    734c:	01f5d593          	srl	a1,a1,0x1f
    7350:	00f85463          	bge	a6,a5,7358 <__fixunsdfsi+0x2c>
    7354:	00058463          	beqz	a1,735c <__fixunsdfsi+0x30>
    7358:	00008067          	ret
    735c:	41e00593          	li	a1,1054
    7360:	fff00513          	li	a0,-1
    7364:	fef5cae3          	blt	a1,a5,7358 <__fixunsdfsi+0x2c>
    7368:	43300593          	li	a1,1075
    736c:	40f585b3          	sub	a1,a1,a5
    7370:	01f00513          	li	a0,31
    7374:	00c76733          	or	a4,a4,a2
    7378:	00b54c63          	blt	a0,a1,7390 <__fixunsdfsi+0x64>
    737c:	bed78793          	add	a5,a5,-1043
    7380:	00f71733          	sll	a4,a4,a5
    7384:	00b6d533          	srl	a0,a3,a1
    7388:	00a76533          	or	a0,a4,a0
    738c:	00008067          	ret
    7390:	41300513          	li	a0,1043
    7394:	40f50533          	sub	a0,a0,a5
    7398:	00a75533          	srl	a0,a4,a0
    739c:	00008067          	ret

000073a0 <__floatunsidf>:
    73a0:	ff010113          	add	sp,sp,-16
    73a4:	00812423          	sw	s0,8(sp)
    73a8:	00112623          	sw	ra,12(sp)
    73ac:	00050413          	mv	s0,a0
    73b0:	04050c63          	beqz	a0,7408 <__floatunsidf+0x68>
    73b4:	0b0000ef          	jal	7464 <__clzsi2>
    73b8:	41e00793          	li	a5,1054
    73bc:	40a787b3          	sub	a5,a5,a0
    73c0:	00a00713          	li	a4,10
    73c4:	7ff7f793          	and	a5,a5,2047
    73c8:	06a74463          	blt	a4,a0,7430 <__floatunsidf+0x90>
    73cc:	00b00713          	li	a4,11
    73d0:	40a70733          	sub	a4,a4,a0
    73d4:	01550513          	add	a0,a0,21
    73d8:	00e45733          	srl	a4,s0,a4
    73dc:	00a41433          	sll	s0,s0,a0
    73e0:	00c12083          	lw	ra,12(sp)
    73e4:	00040513          	mv	a0,s0
    73e8:	00c71713          	sll	a4,a4,0xc
    73ec:	00812403          	lw	s0,8(sp)
    73f0:	00c75713          	srl	a4,a4,0xc
    73f4:	01479793          	sll	a5,a5,0x14
    73f8:	00e7e7b3          	or	a5,a5,a4
    73fc:	00078593          	mv	a1,a5
    7400:	01010113          	add	sp,sp,16
    7404:	00008067          	ret
    7408:	00c12083          	lw	ra,12(sp)
    740c:	00040513          	mv	a0,s0
    7410:	00000793          	li	a5,0
    7414:	00812403          	lw	s0,8(sp)
    7418:	00000713          	li	a4,0
    741c:	01479793          	sll	a5,a5,0x14
    7420:	00e7e7b3          	or	a5,a5,a4
    7424:	00078593          	mv	a1,a5
    7428:	01010113          	add	sp,sp,16
    742c:	00008067          	ret
    7430:	ff550513          	add	a0,a0,-11
    7434:	00a41733          	sll	a4,s0,a0
    7438:	00000413          	li	s0,0
    743c:	00c12083          	lw	ra,12(sp)
    7440:	00040513          	mv	a0,s0
    7444:	00c71713          	sll	a4,a4,0xc
    7448:	00812403          	lw	s0,8(sp)
    744c:	00c75713          	srl	a4,a4,0xc
    7450:	01479793          	sll	a5,a5,0x14
    7454:	00e7e7b3          	or	a5,a5,a4
    7458:	00078593          	mv	a1,a5
    745c:	01010113          	add	sp,sp,16
    7460:	00008067          	ret

00007464 <__clzsi2>:
    7464:	000107b7          	lui	a5,0x10
    7468:	02f57863          	bgeu	a0,a5,7498 <__clzsi2+0x34>
    746c:	10053793          	sltiu	a5,a0,256
    7470:	0017b793          	seqz	a5,a5
    7474:	00379793          	sll	a5,a5,0x3
    7478:	02000713          	li	a4,32
    747c:	40f70733          	sub	a4,a4,a5
    7480:	00f55533          	srl	a0,a0,a5
    7484:	7dc00793          	li	a5,2012
    7488:	00a787b3          	add	a5,a5,a0
    748c:	0007c503          	lbu	a0,0(a5) # 10000 <__subdf3+0x8928>
    7490:	40a70533          	sub	a0,a4,a0
    7494:	00008067          	ret
    7498:	010007b7          	lui	a5,0x1000
    749c:	02f57263          	bgeu	a0,a5,74c0 <__clzsi2+0x5c>
    74a0:	01000793          	li	a5,16
    74a4:	00f55533          	srl	a0,a0,a5
    74a8:	7dc00793          	li	a5,2012
    74ac:	00a787b3          	add	a5,a5,a0
    74b0:	0007c503          	lbu	a0,0(a5) # 1000000 <__subdf3+0xff8928>
    74b4:	01000713          	li	a4,16
    74b8:	40a70533          	sub	a0,a4,a0
    74bc:	00008067          	ret
    74c0:	01800793          	li	a5,24
    74c4:	00f55533          	srl	a0,a0,a5
    74c8:	7dc00793          	li	a5,2012
    74cc:	00a787b3          	add	a5,a5,a0
    74d0:	0007c503          	lbu	a0,0(a5)
    74d4:	00800713          	li	a4,8
    74d8:	40a70533          	sub	a0,a4,a0
    74dc:	00008067          	ret

000074e0 <modf>:
    74e0:	4145d793          	sra	a5,a1,0x14
    74e4:	ff010113          	add	sp,sp,-16
    74e8:	7ff7f793          	and	a5,a5,2047
    74ec:	00812423          	sw	s0,8(sp)
    74f0:	00912223          	sw	s1,4(sp)
    74f4:	01212023          	sw	s2,0(sp)
    74f8:	00112623          	sw	ra,12(sp)
    74fc:	c0178713          	add	a4,a5,-1023
    7500:	01300693          	li	a3,19
    7504:	00058413          	mv	s0,a1
    7508:	00050493          	mv	s1,a0
    750c:	00060913          	mv	s2,a2
    7510:	04e6cc63          	blt	a3,a4,7568 <modf+0x88>
    7514:	10074a63          	bltz	a4,7628 <modf+0x148>
    7518:	001007b7          	lui	a5,0x100
    751c:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf8927>
    7520:	40e7d7b3          	sra	a5,a5,a4
    7524:	00b7f733          	and	a4,a5,a1
    7528:	00a76733          	or	a4,a4,a0
    752c:	06071a63          	bnez	a4,75a0 <modf+0xc0>
    7530:	00040793          	mv	a5,s0
    7534:	800006b7          	lui	a3,0x80000
    7538:	00992023          	sw	s1,0(s2)
    753c:	0086f433          	and	s0,a3,s0
    7540:	00f92223          	sw	a5,4(s2)
    7544:	00000493          	li	s1,0
    7548:	00c12083          	lw	ra,12(sp)
    754c:	00040593          	mv	a1,s0
    7550:	00812403          	lw	s0,8(sp)
    7554:	00012903          	lw	s2,0(sp)
    7558:	00048513          	mv	a0,s1
    755c:	00412483          	lw	s1,4(sp)
    7560:	01010113          	add	sp,sp,16
    7564:	00008067          	ret
    7568:	03300693          	li	a3,51
    756c:	08e6c263          	blt	a3,a4,75f0 <modf+0x110>
    7570:	fff00713          	li	a4,-1
    7574:	bed78793          	add	a5,a5,-1043
    7578:	00f757b3          	srl	a5,a4,a5
    757c:	00a7f733          	and	a4,a5,a0
    7580:	fa0708e3          	beqz	a4,7530 <modf+0x50>
    7584:	fff7c793          	not	a5,a5
    7588:	00a7f7b3          	and	a5,a5,a0
    758c:	00078813          	mv	a6,a5
    7590:	00078613          	mv	a2,a5
    7594:	00058893          	mv	a7,a1
    7598:	00058693          	mv	a3,a1
    759c:	0200006f          	j	75bc <modf+0xdc>
    75a0:	fff7c793          	not	a5,a5
    75a4:	00000713          	li	a4,0
    75a8:	00b7f7b3          	and	a5,a5,a1
    75ac:	00070813          	mv	a6,a4
    75b0:	00070613          	mv	a2,a4
    75b4:	00078893          	mv	a7,a5
    75b8:	00078693          	mv	a3,a5
    75bc:	01092023          	sw	a6,0(s2)
    75c0:	01192223          	sw	a7,4(s2)
    75c4:	114000ef          	jal	76d8 <__subdf3>
    75c8:	00058413          	mv	s0,a1
    75cc:	00c12083          	lw	ra,12(sp)
    75d0:	00040593          	mv	a1,s0
    75d4:	00812403          	lw	s0,8(sp)
    75d8:	00050493          	mv	s1,a0
    75dc:	00012903          	lw	s2,0(sp)
    75e0:	00048513          	mv	a0,s1
    75e4:	00412483          	lw	s1,4(sp)
    75e8:	01010113          	add	sp,sp,16
    75ec:	00008067          	ret
    75f0:	00a92023          	sw	a0,0(s2)
    75f4:	00b92223          	sw	a1,4(s2)
    75f8:	070000ef          	jal	7668 <__fpclassifyd>
    75fc:	04051e63          	bnez	a0,7658 <modf+0x178>
    7600:	00048613          	mv	a2,s1
    7604:	00048513          	mv	a0,s1
    7608:	00040693          	mv	a3,s0
    760c:	00040593          	mv	a1,s0
    7610:	ad8fe0ef          	jal	58e8 <__adddf3>
    7614:	00050493          	mv	s1,a0
    7618:	00058413          	mv	s0,a1
    761c:	00a92023          	sw	a0,0(s2)
    7620:	00b92223          	sw	a1,4(s2)
    7624:	f25ff06f          	j	7548 <modf+0x68>
    7628:	800007b7          	lui	a5,0x80000
    762c:	00c12083          	lw	ra,12(sp)
    7630:	00b7f7b3          	and	a5,a5,a1
    7634:	00040593          	mv	a1,s0
    7638:	00812403          	lw	s0,8(sp)
    763c:	00062023          	sw	zero,0(a2)
    7640:	00f62223          	sw	a5,4(a2)
    7644:	00012903          	lw	s2,0(sp)
    7648:	00048513          	mv	a0,s1
    764c:	00412483          	lw	s1,4(sp)
    7650:	01010113          	add	sp,sp,16
    7654:	00008067          	ret
    7658:	800007b7          	lui	a5,0x80000
    765c:	0087f433          	and	s0,a5,s0
    7660:	00000493          	li	s1,0
    7664:	ee5ff06f          	j	7548 <modf+0x68>

00007668 <__fpclassifyd>:
    7668:	00b56733          	or	a4,a0,a1
    766c:	00050793          	mv	a5,a0
    7670:	04070c63          	beqz	a4,76c8 <__fpclassifyd+0x60>
    7674:	80000737          	lui	a4,0x80000
    7678:	04e58263          	beq	a1,a4,76bc <__fpclassifyd+0x54>
    767c:	fff70693          	add	a3,a4,-1 # 7fffffff <__subdf3+0x7fff8927>
    7680:	00b6f6b3          	and	a3,a3,a1
    7684:	fff00837          	lui	a6,0xfff00
    7688:	01068833          	add	a6,a3,a6
    768c:	7fe008b7          	lui	a7,0x7fe00
    7690:	00400513          	li	a0,4
    7694:	03186263          	bltu	a6,a7,76b8 <__fpclassifyd+0x50>
    7698:	00100837          	lui	a6,0x100
    769c:	00300513          	li	a0,3
    76a0:	0105ec63          	bltu	a1,a6,76b8 <__fpclassifyd+0x50>
    76a4:	00b70733          	add	a4,a4,a1
    76a8:	01076863          	bltu	a4,a6,76b8 <__fpclassifyd+0x50>
    76ac:	7ff00737          	lui	a4,0x7ff00
    76b0:	00000513          	li	a0,0
    76b4:	00e68e63          	beq	a3,a4,76d0 <__fpclassifyd+0x68>
    76b8:	00008067          	ret
    76bc:	00a03533          	snez	a0,a0
    76c0:	00250513          	add	a0,a0,2
    76c4:	00008067          	ret
    76c8:	00200513          	li	a0,2
    76cc:	00008067          	ret
    76d0:	0017b513          	seqz	a0,a5
    76d4:	00008067          	ret

000076d8 <__subdf3>:
    76d8:	001007b7          	lui	a5,0x100
    76dc:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf8927>
    76e0:	fe010113          	add	sp,sp,-32
    76e4:	00b7f8b3          	and	a7,a5,a1
    76e8:	00d7f833          	and	a6,a5,a3
    76ec:	0146d793          	srl	a5,a3,0x14
    76f0:	00389893          	sll	a7,a7,0x3
    76f4:	00812c23          	sw	s0,24(sp)
    76f8:	01312623          	sw	s3,12(sp)
    76fc:	01f5d413          	srl	s0,a1,0x1f
    7700:	0145d993          	srl	s3,a1,0x14
    7704:	01d55713          	srl	a4,a0,0x1d
    7708:	00381813          	sll	a6,a6,0x3
    770c:	01d65593          	srl	a1,a2,0x1d
    7710:	00112e23          	sw	ra,28(sp)
    7714:	00912a23          	sw	s1,20(sp)
    7718:	01212823          	sw	s2,16(sp)
    771c:	7ff7ff13          	and	t5,a5,2047
    7720:	7ff00313          	li	t1,2047
    7724:	01176733          	or	a4,a4,a7
    7728:	7ff9f993          	and	s3,s3,2047
    772c:	00040e13          	mv	t3,s0
    7730:	00351893          	sll	a7,a0,0x3
    7734:	01f6d693          	srl	a3,a3,0x1f
    7738:	0105e5b3          	or	a1,a1,a6
    773c:	00361e93          	sll	t4,a2,0x3
    7740:	206f0c63          	beq	t5,t1,7958 <__subdf3+0x280>
    7744:	0016c693          	xor	a3,a3,1
    7748:	41e987b3          	sub	a5,s3,t5
    774c:	16d40263          	beq	s0,a3,78b0 <__subdf3+0x1d8>
    7750:	00f05ae3          	blez	a5,7f64 <__subdf3+0x88c>
    7754:	240f0a63          	beqz	t5,79a8 <__subdf3+0x2d0>
    7758:	3c698463          	beq	s3,t1,7b20 <__subdf3+0x448>
    775c:	03800693          	li	a3,56
    7760:	00100513          	li	a0,1
    7764:	02f6ce63          	blt	a3,a5,77a0 <__subdf3+0xc8>
    7768:	008006b7          	lui	a3,0x800
    776c:	00d5e5b3          	or	a1,a1,a3
    7770:	01f00693          	li	a3,31
    7774:	4ef6c463          	blt	a3,a5,7c5c <__subdf3+0x584>
    7778:	02000693          	li	a3,32
    777c:	40f686b3          	sub	a3,a3,a5
    7780:	00d59533          	sll	a0,a1,a3
    7784:	00fed633          	srl	a2,t4,a5
    7788:	00de96b3          	sll	a3,t4,a3
    778c:	00c56533          	or	a0,a0,a2
    7790:	00d036b3          	snez	a3,a3
    7794:	00f5d7b3          	srl	a5,a1,a5
    7798:	00d56533          	or	a0,a0,a3
    779c:	40f70733          	sub	a4,a4,a5
    77a0:	40a88533          	sub	a0,a7,a0
    77a4:	00a8b633          	sltu	a2,a7,a0
    77a8:	00050493          	mv	s1,a0
    77ac:	40c70933          	sub	s2,a4,a2
    77b0:	00891793          	sll	a5,s2,0x8
    77b4:	3407d863          	bgez	a5,7b04 <__subdf3+0x42c>
    77b8:	008007b7          	lui	a5,0x800
    77bc:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f8927>
    77c0:	00f97933          	and	s2,s2,a5
    77c4:	2e090663          	beqz	s2,7ab0 <__subdf3+0x3d8>
    77c8:	00090513          	mv	a0,s2
    77cc:	c99ff0ef          	jal	7464 <__clzsi2>
    77d0:	ff850793          	add	a5,a0,-8
    77d4:	02000693          	li	a3,32
    77d8:	40f68733          	sub	a4,a3,a5
    77dc:	00e4d733          	srl	a4,s1,a4
    77e0:	00f91933          	sll	s2,s2,a5
    77e4:	01276733          	or	a4,a4,s2
    77e8:	00f494b3          	sll	s1,s1,a5
    77ec:	3f37c463          	blt	a5,s3,7bd4 <__subdf3+0x4fc>
    77f0:	413787b3          	sub	a5,a5,s3
    77f4:	00178793          	add	a5,a5,1
    77f8:	40f686b3          	sub	a3,a3,a5
    77fc:	00d49633          	sll	a2,s1,a3
    7800:	00f4d933          	srl	s2,s1,a5
    7804:	00c03633          	snez	a2,a2
    7808:	00c96633          	or	a2,s2,a2
    780c:	00d716b3          	sll	a3,a4,a3
    7810:	00c6e4b3          	or	s1,a3,a2
    7814:	00f75933          	srl	s2,a4,a5
    7818:	00000993          	li	s3,0
    781c:	0074f793          	and	a5,s1,7
    7820:	02078063          	beqz	a5,7840 <__subdf3+0x168>
    7824:	00f4f793          	and	a5,s1,15
    7828:	00400713          	li	a4,4
    782c:	00e78a63          	beq	a5,a4,7840 <__subdf3+0x168>
    7830:	00448793          	add	a5,s1,4
    7834:	0097b533          	sltu	a0,a5,s1
    7838:	00a90933          	add	s2,s2,a0
    783c:	00078493          	mv	s1,a5
    7840:	00891793          	sll	a5,s2,0x8
    7844:	6c07d063          	bgez	a5,7f04 <__subdf3+0x82c>
    7848:	00198793          	add	a5,s3,1
    784c:	7ff00713          	li	a4,2047
    7850:	24e78663          	beq	a5,a4,7a9c <__subdf3+0x3c4>
    7854:	ff800737          	lui	a4,0xff800
    7858:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f8927>
    785c:	00e97733          	and	a4,s2,a4
    7860:	7ff7f793          	and	a5,a5,2047
    7864:	01d71813          	sll	a6,a4,0x1d
    7868:	0034d513          	srl	a0,s1,0x3
    786c:	00971713          	sll	a4,a4,0x9
    7870:	00a86833          	or	a6,a6,a0
    7874:	00c75713          	srl	a4,a4,0xc
    7878:	00147e13          	and	t3,s0,1
    787c:	01c12083          	lw	ra,28(sp)
    7880:	01812403          	lw	s0,24(sp)
    7884:	01479793          	sll	a5,a5,0x14
    7888:	00e7e7b3          	or	a5,a5,a4
    788c:	01fe1713          	sll	a4,t3,0x1f
    7890:	00e7e7b3          	or	a5,a5,a4
    7894:	01412483          	lw	s1,20(sp)
    7898:	01012903          	lw	s2,16(sp)
    789c:	00c12983          	lw	s3,12(sp)
    78a0:	00080513          	mv	a0,a6
    78a4:	00078593          	mv	a1,a5
    78a8:	02010113          	add	sp,sp,32
    78ac:	00008067          	ret
    78b0:	70f05263          	blez	a5,7fb4 <__subdf3+0x8dc>
    78b4:	1c0f1663          	bnez	t5,7a80 <__subdf3+0x3a8>
    78b8:	01d5e6b3          	or	a3,a1,t4
    78bc:	26068e63          	beqz	a3,7b38 <__subdf3+0x460>
    78c0:	fff78693          	add	a3,a5,-1
    78c4:	46068863          	beqz	a3,7d34 <__subdf3+0x65c>
    78c8:	24678c63          	beq	a5,t1,7b20 <__subdf3+0x448>
    78cc:	03800793          	li	a5,56
    78d0:	00100913          	li	s2,1
    78d4:	02d7cc63          	blt	a5,a3,790c <__subdf3+0x234>
    78d8:	00068793          	mv	a5,a3
    78dc:	01f00693          	li	a3,31
    78e0:	48f6ca63          	blt	a3,a5,7d74 <__subdf3+0x69c>
    78e4:	02000693          	li	a3,32
    78e8:	40f686b3          	sub	a3,a3,a5
    78ec:	00d59933          	sll	s2,a1,a3
    78f0:	00fed633          	srl	a2,t4,a5
    78f4:	00de96b3          	sll	a3,t4,a3
    78f8:	00c96933          	or	s2,s2,a2
    78fc:	00d036b3          	snez	a3,a3
    7900:	00f5d7b3          	srl	a5,a1,a5
    7904:	00d96933          	or	s2,s2,a3
    7908:	00f70733          	add	a4,a4,a5
    790c:	01190633          	add	a2,s2,a7
    7910:	01263933          	sltu	s2,a2,s2
    7914:	00060493          	mv	s1,a2
    7918:	00e90933          	add	s2,s2,a4
    791c:	00891793          	sll	a5,s2,0x8
    7920:	1e07d263          	bgez	a5,7b04 <__subdf3+0x42c>
    7924:	00198993          	add	s3,s3,1
    7928:	7ff00793          	li	a5,2047
    792c:	16f98863          	beq	s3,a5,7a9c <__subdf3+0x3c4>
    7930:	ff8007b7          	lui	a5,0xff800
    7934:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f8927>
    7938:	0014f513          	and	a0,s1,1
    793c:	00f977b3          	and	a5,s2,a5
    7940:	0014d713          	srl	a4,s1,0x1
    7944:	00a76733          	or	a4,a4,a0
    7948:	01f79513          	sll	a0,a5,0x1f
    794c:	00e564b3          	or	s1,a0,a4
    7950:	0017d913          	srl	s2,a5,0x1
    7954:	ec9ff06f          	j	781c <__subdf3+0x144>
    7958:	01d5e833          	or	a6,a1,t4
    795c:	80198313          	add	t1,s3,-2047
    7960:	06080863          	beqz	a6,79d0 <__subdf3+0x2f8>
    7964:	06d40a63          	beq	s0,a3,79d8 <__subdf3+0x300>
    7968:	0e030463          	beqz	t1,7a50 <__subdf3+0x378>
    796c:	26098e63          	beqz	s3,7be8 <__subdf3+0x510>
    7970:	00361513          	sll	a0,a2,0x3
    7974:	00355513          	srl	a0,a0,0x3
    7978:	00068413          	mv	s0,a3
    797c:	00058713          	mv	a4,a1
    7980:	01d71813          	sll	a6,a4,0x1d
    7984:	00a86833          	or	a6,a6,a0
    7988:	00375713          	srl	a4,a4,0x3
    798c:	01076733          	or	a4,a4,a6
    7990:	10070663          	beqz	a4,7a9c <__subdf3+0x3c4>
    7994:	00000e13          	li	t3,0
    7998:	7ff00793          	li	a5,2047
    799c:	00080737          	lui	a4,0x80
    79a0:	00000813          	li	a6,0
    79a4:	ed9ff06f          	j	787c <__subdf3+0x1a4>
    79a8:	01d5e6b3          	or	a3,a1,t4
    79ac:	18068663          	beqz	a3,7b38 <__subdf3+0x460>
    79b0:	fff78693          	add	a3,a5,-1
    79b4:	3a068263          	beqz	a3,7d58 <__subdf3+0x680>
    79b8:	16678463          	beq	a5,t1,7b20 <__subdf3+0x448>
    79bc:	03800793          	li	a5,56
    79c0:	00100513          	li	a0,1
    79c4:	dcd7cee3          	blt	a5,a3,77a0 <__subdf3+0xc8>
    79c8:	00068793          	mv	a5,a3
    79cc:	da5ff06f          	j	7770 <__subdf3+0x98>
    79d0:	0016c693          	xor	a3,a3,1
    79d4:	f8d41ae3          	bne	s0,a3,7968 <__subdf3+0x290>
    79d8:	18030863          	beqz	t1,7b68 <__subdf3+0x490>
    79dc:	2c099063          	bnez	s3,7c9c <__subdf3+0x5c4>
    79e0:	7ff00793          	li	a5,2047
    79e4:	011766b3          	or	a3,a4,a7
    79e8:	48068863          	beqz	a3,7e78 <__subdf3+0x7a0>
    79ec:	fff78693          	add	a3,a5,-1
    79f0:	34068263          	beqz	a3,7d34 <__subdf3+0x65c>
    79f4:	7ff00513          	li	a0,2047
    79f8:	2aa78263          	beq	a5,a0,7c9c <__subdf3+0x5c4>
    79fc:	03800793          	li	a5,56
    7a00:	00100913          	li	s2,1
    7a04:	02d7ca63          	blt	a5,a3,7a38 <__subdf3+0x360>
    7a08:	01f00793          	li	a5,31
    7a0c:	4cd7c663          	blt	a5,a3,7ed8 <__subdf3+0x800>
    7a10:	02000793          	li	a5,32
    7a14:	40d787b3          	sub	a5,a5,a3
    7a18:	00f71933          	sll	s2,a4,a5
    7a1c:	00d8d633          	srl	a2,a7,a3
    7a20:	00f897b3          	sll	a5,a7,a5
    7a24:	00c96933          	or	s2,s2,a2
    7a28:	00f037b3          	snez	a5,a5
    7a2c:	00d756b3          	srl	a3,a4,a3
    7a30:	00f96933          	or	s2,s2,a5
    7a34:	00d585b3          	add	a1,a1,a3
    7a38:	01d90733          	add	a4,s2,t4
    7a3c:	01273933          	sltu	s2,a4,s2
    7a40:	00070493          	mv	s1,a4
    7a44:	00b90933          	add	s2,s2,a1
    7a48:	000f0993          	mv	s3,t5
    7a4c:	ed1ff06f          	j	791c <__subdf3+0x244>
    7a50:	00198793          	add	a5,s3,1
    7a54:	7fe7f793          	and	a5,a5,2046
    7a58:	14079463          	bnez	a5,7ba0 <__subdf3+0x4c8>
    7a5c:	01d5e833          	or	a6,a1,t4
    7a60:	011767b3          	or	a5,a4,a7
    7a64:	2a099463          	bnez	s3,7d0c <__subdf3+0x634>
    7a68:	38078e63          	beqz	a5,7e04 <__subdf3+0x72c>
    7a6c:	3c081063          	bnez	a6,7e2c <__subdf3+0x754>
    7a70:	00351513          	sll	a0,a0,0x3
    7a74:	00355913          	srl	s2,a0,0x3
    7a78:	00000793          	li	a5,0
    7a7c:	1140006f          	j	7b90 <__subdf3+0x4b8>
    7a80:	0a698063          	beq	s3,t1,7b20 <__subdf3+0x448>
    7a84:	03800693          	li	a3,56
    7a88:	00100913          	li	s2,1
    7a8c:	e8f6c0e3          	blt	a3,a5,790c <__subdf3+0x234>
    7a90:	008006b7          	lui	a3,0x800
    7a94:	00d5e5b3          	or	a1,a1,a3
    7a98:	e45ff06f          	j	78dc <__subdf3+0x204>
    7a9c:	00147e13          	and	t3,s0,1
    7aa0:	7ff00793          	li	a5,2047
    7aa4:	00000713          	li	a4,0
    7aa8:	00000813          	li	a6,0
    7aac:	dd1ff06f          	j	787c <__subdf3+0x1a4>
    7ab0:	00048513          	mv	a0,s1
    7ab4:	9b1ff0ef          	jal	7464 <__clzsi2>
    7ab8:	01850793          	add	a5,a0,24
    7abc:	01f00693          	li	a3,31
    7ac0:	d0f6dae3          	bge	a3,a5,77d4 <__subdf3+0xfc>
    7ac4:	ff850713          	add	a4,a0,-8
    7ac8:	00e49733          	sll	a4,s1,a4
    7acc:	1b37ce63          	blt	a5,s3,7c88 <__subdf3+0x5b0>
    7ad0:	413789b3          	sub	s3,a5,s3
    7ad4:	00198793          	add	a5,s3,1
    7ad8:	42f6de63          	bge	a3,a5,7f14 <__subdf3+0x83c>
    7adc:	fe198993          	add	s3,s3,-31
    7ae0:	02000693          	li	a3,32
    7ae4:	013754b3          	srl	s1,a4,s3
    7ae8:	00d78c63          	beq	a5,a3,7b00 <__subdf3+0x428>
    7aec:	04000693          	li	a3,64
    7af0:	40f687b3          	sub	a5,a3,a5
    7af4:	00f71733          	sll	a4,a4,a5
    7af8:	00e03733          	snez	a4,a4
    7afc:	00e4e4b3          	or	s1,s1,a4
    7b00:	00000993          	li	s3,0
    7b04:	0074f793          	and	a5,s1,7
    7b08:	d0079ee3          	bnez	a5,7824 <__subdf3+0x14c>
    7b0c:	00098793          	mv	a5,s3
    7b10:	0034d513          	srl	a0,s1,0x3
    7b14:	00090713          	mv	a4,s2
    7b18:	0280006f          	j	7b40 <__subdf3+0x468>
    7b1c:	e6081ce3          	bnez	a6,7994 <__subdf3+0x2bc>
    7b20:	00351513          	sll	a0,a0,0x3
    7b24:	01d71813          	sll	a6,a4,0x1d
    7b28:	00355513          	srl	a0,a0,0x3
    7b2c:	00a86833          	or	a6,a6,a0
    7b30:	00375713          	srl	a4,a4,0x3
    7b34:	e59ff06f          	j	798c <__subdf3+0x2b4>
    7b38:	00351513          	sll	a0,a0,0x3
    7b3c:	00355513          	srl	a0,a0,0x3
    7b40:	01d71813          	sll	a6,a4,0x1d
    7b44:	7ff00693          	li	a3,2047
    7b48:	00a86833          	or	a6,a6,a0
    7b4c:	00375713          	srl	a4,a4,0x3
    7b50:	e2d78ee3          	beq	a5,a3,798c <__subdf3+0x2b4>
    7b54:	00c71713          	sll	a4,a4,0xc
    7b58:	00c75713          	srl	a4,a4,0xc
    7b5c:	7ff7f793          	and	a5,a5,2047
    7b60:	00147e13          	and	t3,s0,1
    7b64:	d19ff06f          	j	787c <__subdf3+0x1a4>
    7b68:	00198693          	add	a3,s3,1
    7b6c:	7fe6f793          	and	a5,a3,2046
    7b70:	12079e63          	bnez	a5,7cac <__subdf3+0x5d4>
    7b74:	011767b3          	or	a5,a4,a7
    7b78:	24099a63          	bnez	s3,7dcc <__subdf3+0x6f4>
    7b7c:	30078663          	beqz	a5,7e88 <__subdf3+0x7b0>
    7b80:	01d5e7b3          	or	a5,a1,t4
    7b84:	30079a63          	bnez	a5,7e98 <__subdf3+0x7c0>
    7b88:	00351513          	sll	a0,a0,0x3
    7b8c:	00355913          	srl	s2,a0,0x3
    7b90:	01d71813          	sll	a6,a4,0x1d
    7b94:	01286833          	or	a6,a6,s2
    7b98:	00375713          	srl	a4,a4,0x3
    7b9c:	fb9ff06f          	j	7b54 <__subdf3+0x47c>
    7ba0:	41d88833          	sub	a6,a7,t4
    7ba4:	0108b7b3          	sltu	a5,a7,a6
    7ba8:	40b70933          	sub	s2,a4,a1
    7bac:	40f90933          	sub	s2,s2,a5
    7bb0:	00891793          	sll	a5,s2,0x8
    7bb4:	00080493          	mv	s1,a6
    7bb8:	1207c263          	bltz	a5,7cdc <__subdf3+0x604>
    7bbc:	01286833          	or	a6,a6,s2
    7bc0:	c00812e3          	bnez	a6,77c4 <__subdf3+0xec>
    7bc4:	00000e13          	li	t3,0
    7bc8:	00000793          	li	a5,0
    7bcc:	00000713          	li	a4,0
    7bd0:	cadff06f          	j	787c <__subdf3+0x1a4>
    7bd4:	ff800937          	lui	s2,0xff800
    7bd8:	fff90913          	add	s2,s2,-1 # ff7fffff <__subdf3+0xff7f8927>
    7bdc:	40f989b3          	sub	s3,s3,a5
    7be0:	01277933          	and	s2,a4,s2
    7be4:	c39ff06f          	j	781c <__subdf3+0x144>
    7be8:	7ff00793          	li	a5,2047
    7bec:	01176533          	or	a0,a4,a7
    7bf0:	10050463          	beqz	a0,7cf8 <__subdf3+0x620>
    7bf4:	fff78813          	add	a6,a5,-1
    7bf8:	1e080263          	beqz	a6,7ddc <__subdf3+0x704>
    7bfc:	7ff00513          	li	a0,2047
    7c00:	d6a788e3          	beq	a5,a0,7970 <__subdf3+0x298>
    7c04:	03800793          	li	a5,56
    7c08:	00068413          	mv	s0,a3
    7c0c:	00100513          	li	a0,1
    7c10:	0307ca63          	blt	a5,a6,7c44 <__subdf3+0x56c>
    7c14:	01f00793          	li	a5,31
    7c18:	1907c463          	blt	a5,a6,7da0 <__subdf3+0x6c8>
    7c1c:	02000793          	li	a5,32
    7c20:	410787b3          	sub	a5,a5,a6
    7c24:	00f71533          	sll	a0,a4,a5
    7c28:	0108d6b3          	srl	a3,a7,a6
    7c2c:	00f897b3          	sll	a5,a7,a5
    7c30:	00d56533          	or	a0,a0,a3
    7c34:	00f037b3          	snez	a5,a5
    7c38:	01075833          	srl	a6,a4,a6
    7c3c:	00f56533          	or	a0,a0,a5
    7c40:	410585b3          	sub	a1,a1,a6
    7c44:	40ae8533          	sub	a0,t4,a0
    7c48:	00aeb733          	sltu	a4,t4,a0
    7c4c:	00050493          	mv	s1,a0
    7c50:	40e58933          	sub	s2,a1,a4
    7c54:	000f0993          	mv	s3,t5
    7c58:	b59ff06f          	j	77b0 <__subdf3+0xd8>
    7c5c:	fe078693          	add	a3,a5,-32
    7c60:	02000613          	li	a2,32
    7c64:	00d5d6b3          	srl	a3,a1,a3
    7c68:	00c78a63          	beq	a5,a2,7c7c <__subdf3+0x5a4>
    7c6c:	04000613          	li	a2,64
    7c70:	40f607b3          	sub	a5,a2,a5
    7c74:	00f597b3          	sll	a5,a1,a5
    7c78:	00feeeb3          	or	t4,t4,a5
    7c7c:	01d03533          	snez	a0,t4
    7c80:	00d56533          	or	a0,a0,a3
    7c84:	b1dff06f          	j	77a0 <__subdf3+0xc8>
    7c88:	ff8006b7          	lui	a3,0xff800
    7c8c:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f8927>
    7c90:	40f987b3          	sub	a5,s3,a5
    7c94:	00d77733          	and	a4,a4,a3
    7c98:	ef9ff06f          	j	7b90 <__subdf3+0x4b8>
    7c9c:	00361513          	sll	a0,a2,0x3
    7ca0:	00355513          	srl	a0,a0,0x3
    7ca4:	00058713          	mv	a4,a1
    7ca8:	cd9ff06f          	j	7980 <__subdf3+0x2a8>
    7cac:	7ff00793          	li	a5,2047
    7cb0:	def686e3          	beq	a3,a5,7a9c <__subdf3+0x3c4>
    7cb4:	01d88eb3          	add	t4,a7,t4
    7cb8:	011eb633          	sltu	a2,t4,a7
    7cbc:	00b707b3          	add	a5,a4,a1
    7cc0:	00c787b3          	add	a5,a5,a2
    7cc4:	01f79513          	sll	a0,a5,0x1f
    7cc8:	001ede93          	srl	t4,t4,0x1
    7ccc:	01d564b3          	or	s1,a0,t4
    7cd0:	0017d913          	srl	s2,a5,0x1
    7cd4:	00068993          	mv	s3,a3
    7cd8:	b45ff06f          	j	781c <__subdf3+0x144>
    7cdc:	411e8633          	sub	a2,t4,a7
    7ce0:	40e587b3          	sub	a5,a1,a4
    7ce4:	00ceb733          	sltu	a4,t4,a2
    7ce8:	00060493          	mv	s1,a2
    7cec:	40e78933          	sub	s2,a5,a4
    7cf0:	00068413          	mv	s0,a3
    7cf4:	ad1ff06f          	j	77c4 <__subdf3+0xec>
    7cf8:	00361613          	sll	a2,a2,0x3
    7cfc:	00365513          	srl	a0,a2,0x3
    7d00:	00068413          	mv	s0,a3
    7d04:	00058713          	mv	a4,a1
    7d08:	e39ff06f          	j	7b40 <__subdf3+0x468>
    7d0c:	e00798e3          	bnez	a5,7b1c <__subdf3+0x444>
    7d10:	22080663          	beqz	a6,7f3c <__subdf3+0x864>
    7d14:	0035d713          	srl	a4,a1,0x3
    7d18:	00361613          	sll	a2,a2,0x3
    7d1c:	01d59593          	sll	a1,a1,0x1d
    7d20:	00b76733          	or	a4,a4,a1
    7d24:	00365613          	srl	a2,a2,0x3
    7d28:	00c76733          	or	a4,a4,a2
    7d2c:	00068413          	mv	s0,a3
    7d30:	c61ff06f          	j	7990 <__subdf3+0x2b8>
    7d34:	01d88eb3          	add	t4,a7,t4
    7d38:	00b705b3          	add	a1,a4,a1
    7d3c:	011eb633          	sltu	a2,t4,a7
    7d40:	00c58933          	add	s2,a1,a2
    7d44:	00891793          	sll	a5,s2,0x8
    7d48:	000e8493          	mv	s1,t4
    7d4c:	0a07d863          	bgez	a5,7dfc <__subdf3+0x724>
    7d50:	00200993          	li	s3,2
    7d54:	bddff06f          	j	7930 <__subdf3+0x258>
    7d58:	41d88eb3          	sub	t4,a7,t4
    7d5c:	40b705b3          	sub	a1,a4,a1
    7d60:	01d8b633          	sltu	a2,a7,t4
    7d64:	000e8493          	mv	s1,t4
    7d68:	40c58933          	sub	s2,a1,a2
    7d6c:	00100993          	li	s3,1
    7d70:	a41ff06f          	j	77b0 <__subdf3+0xd8>
    7d74:	fe078693          	add	a3,a5,-32
    7d78:	02000613          	li	a2,32
    7d7c:	00d5d6b3          	srl	a3,a1,a3
    7d80:	00c78a63          	beq	a5,a2,7d94 <__subdf3+0x6bc>
    7d84:	04000613          	li	a2,64
    7d88:	40f607b3          	sub	a5,a2,a5
    7d8c:	00f597b3          	sll	a5,a1,a5
    7d90:	00feeeb3          	or	t4,t4,a5
    7d94:	01d03933          	snez	s2,t4
    7d98:	00d96933          	or	s2,s2,a3
    7d9c:	b71ff06f          	j	790c <__subdf3+0x234>
    7da0:	fe080793          	add	a5,a6,-32 # fffe0 <__subdf3+0xf8908>
    7da4:	02000693          	li	a3,32
    7da8:	00f757b3          	srl	a5,a4,a5
    7dac:	00d80a63          	beq	a6,a3,7dc0 <__subdf3+0x6e8>
    7db0:	04000693          	li	a3,64
    7db4:	410686b3          	sub	a3,a3,a6
    7db8:	00d71733          	sll	a4,a4,a3
    7dbc:	00e8e8b3          	or	a7,a7,a4
    7dc0:	01103533          	snez	a0,a7
    7dc4:	00f56533          	or	a0,a0,a5
    7dc8:	e7dff06f          	j	7c44 <__subdf3+0x56c>
    7dcc:	ec0788e3          	beqz	a5,7c9c <__subdf3+0x5c4>
    7dd0:	01d5eeb3          	or	t4,a1,t4
    7dd4:	bc0e90e3          	bnez	t4,7994 <__subdf3+0x2bc>
    7dd8:	d49ff06f          	j	7b20 <__subdf3+0x448>
    7ddc:	411e8633          	sub	a2,t4,a7
    7de0:	40e585b3          	sub	a1,a1,a4
    7de4:	00ceb733          	sltu	a4,t4,a2
    7de8:	00060493          	mv	s1,a2
    7dec:	40e58933          	sub	s2,a1,a4
    7df0:	00068413          	mv	s0,a3
    7df4:	00100993          	li	s3,1
    7df8:	9b9ff06f          	j	77b0 <__subdf3+0xd8>
    7dfc:	00100793          	li	a5,1
    7e00:	d11ff06f          	j	7b10 <__subdf3+0x438>
    7e04:	dc0800e3          	beqz	a6,7bc4 <__subdf3+0x4ec>
    7e08:	00361613          	sll	a2,a2,0x3
    7e0c:	00365793          	srl	a5,a2,0x3
    7e10:	01d59813          	sll	a6,a1,0x1d
    7e14:	00959713          	sll	a4,a1,0x9
    7e18:	00f86833          	or	a6,a6,a5
    7e1c:	00c75713          	srl	a4,a4,0xc
    7e20:	00068e13          	mv	t3,a3
    7e24:	00000793          	li	a5,0
    7e28:	a55ff06f          	j	787c <__subdf3+0x1a4>
    7e2c:	41d88933          	sub	s2,a7,t4
    7e30:	0128b7b3          	sltu	a5,a7,s2
    7e34:	40b70633          	sub	a2,a4,a1
    7e38:	40f60633          	sub	a2,a2,a5
    7e3c:	00861793          	sll	a5,a2,0x8
    7e40:	0e07d263          	bgez	a5,7f24 <__subdf3+0x84c>
    7e44:	411e8633          	sub	a2,t4,a7
    7e48:	40e58733          	sub	a4,a1,a4
    7e4c:	00cebeb3          	sltu	t4,t4,a2
    7e50:	41d70733          	sub	a4,a4,t4
    7e54:	00871793          	sll	a5,a4,0x8
    7e58:	00060493          	mv	s1,a2
    7e5c:	1207de63          	bgez	a5,7f98 <__subdf3+0x8c0>
    7e60:	ff8007b7          	lui	a5,0xff800
    7e64:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f8927>
    7e68:	00f77733          	and	a4,a4,a5
    7e6c:	00068413          	mv	s0,a3
    7e70:	00100793          	li	a5,1
    7e74:	9f1ff06f          	j	7864 <__subdf3+0x18c>
    7e78:	00361613          	sll	a2,a2,0x3
    7e7c:	00365513          	srl	a0,a2,0x3
    7e80:	00058713          	mv	a4,a1
    7e84:	cbdff06f          	j	7b40 <__subdf3+0x468>
    7e88:	00361613          	sll	a2,a2,0x3
    7e8c:	00365913          	srl	s2,a2,0x3
    7e90:	00058713          	mv	a4,a1
    7e94:	cfdff06f          	j	7b90 <__subdf3+0x4b8>
    7e98:	01d886b3          	add	a3,a7,t4
    7e9c:	00b707b3          	add	a5,a4,a1
    7ea0:	0116b633          	sltu	a2,a3,a7
    7ea4:	00c787b3          	add	a5,a5,a2
    7ea8:	00879713          	sll	a4,a5,0x8
    7eac:	0036d813          	srl	a6,a3,0x3
    7eb0:	08075e63          	bgez	a4,7f4c <__subdf3+0x874>
    7eb4:	ff800737          	lui	a4,0xff800
    7eb8:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f8927>
    7ebc:	00e7f7b3          	and	a5,a5,a4
    7ec0:	01d79713          	sll	a4,a5,0x1d
    7ec4:	00979793          	sll	a5,a5,0x9
    7ec8:	01076833          	or	a6,a4,a6
    7ecc:	00c7d713          	srl	a4,a5,0xc
    7ed0:	00100793          	li	a5,1
    7ed4:	9a9ff06f          	j	787c <__subdf3+0x1a4>
    7ed8:	fe068793          	add	a5,a3,-32
    7edc:	02000613          	li	a2,32
    7ee0:	00f757b3          	srl	a5,a4,a5
    7ee4:	00c68a63          	beq	a3,a2,7ef8 <__subdf3+0x820>
    7ee8:	04000613          	li	a2,64
    7eec:	40d606b3          	sub	a3,a2,a3
    7ef0:	00d71733          	sll	a4,a4,a3
    7ef4:	00e8e8b3          	or	a7,a7,a4
    7ef8:	01103933          	snez	s2,a7
    7efc:	00f96933          	or	s2,s2,a5
    7f00:	b39ff06f          	j	7a38 <__subdf3+0x360>
    7f04:	0034d513          	srl	a0,s1,0x3
    7f08:	00098793          	mv	a5,s3
    7f0c:	00090713          	mv	a4,s2
    7f10:	c31ff06f          	j	7b40 <__subdf3+0x468>
    7f14:	02000693          	li	a3,32
    7f18:	40f686b3          	sub	a3,a3,a5
    7f1c:	00000613          	li	a2,0
    7f20:	8e9ff06f          	j	7808 <__subdf3+0x130>
    7f24:	00c96833          	or	a6,s2,a2
    7f28:	c8080ee3          	beqz	a6,7bc4 <__subdf3+0x4ec>
    7f2c:	00395913          	srl	s2,s2,0x3
    7f30:	00000793          	li	a5,0
    7f34:	00060713          	mv	a4,a2
    7f38:	c59ff06f          	j	7b90 <__subdf3+0x4b8>
    7f3c:	00000e13          	li	t3,0
    7f40:	7ff00793          	li	a5,2047
    7f44:	00080737          	lui	a4,0x80
    7f48:	935ff06f          	j	787c <__subdf3+0x1a4>
    7f4c:	01d79713          	sll	a4,a5,0x1d
    7f50:	00979793          	sll	a5,a5,0x9
    7f54:	01076833          	or	a6,a4,a6
    7f58:	00c7d713          	srl	a4,a5,0xc
    7f5c:	00000793          	li	a5,0
    7f60:	91dff06f          	j	787c <__subdf3+0x1a4>
    7f64:	ae0786e3          	beqz	a5,7a50 <__subdf3+0x378>
    7f68:	413f0833          	sub	a6,t5,s3
    7f6c:	00080793          	mv	a5,a6
    7f70:	c6098ee3          	beqz	s3,7bec <__subdf3+0x514>
    7f74:	03800793          	li	a5,56
    7f78:	0107ca63          	blt	a5,a6,7f8c <__subdf3+0x8b4>
    7f7c:	008007b7          	lui	a5,0x800
    7f80:	00f76733          	or	a4,a4,a5
    7f84:	00068413          	mv	s0,a3
    7f88:	c8dff06f          	j	7c14 <__subdf3+0x53c>
    7f8c:	00068413          	mv	s0,a3
    7f90:	00100513          	li	a0,1
    7f94:	cb1ff06f          	j	7c44 <__subdf3+0x56c>
    7f98:	01d71813          	sll	a6,a4,0x1d
    7f9c:	00365613          	srl	a2,a2,0x3
    7fa0:	00c86833          	or	a6,a6,a2
    7fa4:	00375713          	srl	a4,a4,0x3
    7fa8:	00000793          	li	a5,0
    7fac:	00068413          	mv	s0,a3
    7fb0:	ba5ff06f          	j	7b54 <__subdf3+0x47c>
    7fb4:	ba078ae3          	beqz	a5,7b68 <__subdf3+0x490>
    7fb8:	413f06b3          	sub	a3,t5,s3
    7fbc:	00099663          	bnez	s3,7fc8 <__subdf3+0x8f0>
    7fc0:	00068793          	mv	a5,a3
    7fc4:	a21ff06f          	j	79e4 <__subdf3+0x30c>
    7fc8:	03800793          	li	a5,56
    7fcc:	00100913          	li	s2,1
    7fd0:	a6d7c4e3          	blt	a5,a3,7a38 <__subdf3+0x360>
    7fd4:	008007b7          	lui	a5,0x800
    7fd8:	00f76733          	or	a4,a4,a5
    7fdc:	a2dff06f          	j	7a08 <__subdf3+0x330>

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
  96:	6320726f          	jal	tp,76c8 <__fpclassifyd+0x60>
  9a:	6d65726f          	jal	tp,57770 <__subdf3+0x50098>
  9e:	7261                	.insn	2, 0x7261
  a0:	000a2e6b          	.insn	4, 0x000a2e6b
  a4:	7250                	.insn	2, 0x7250
  a6:	6c69666f          	jal	a2,9676c <__subdf3+0x8f094>
  aa:	2065                	.insn	2, 0x2065
  ac:	656e6567          	.insn	4, 0x656e6567
  b0:	6172                	.insn	2, 0x6172
  b2:	6974                	.insn	2, 0x6974
  b4:	72206e6f          	jal	t3,67d6 <__divdf3+0x626>
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
 126:	6320726f          	jal	tp,7758 <__subdf3+0x80>
 12a:	6d65726f          	jal	tp,57800 <__subdf3+0x50128>
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
 252:	6120726f          	jal	tp,7864 <__subdf3+0x18c>
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
 2b0:	5f6d                	.insn	2, 0x5f6d
 2b2:	697a                	.insn	2, 0x697a
 2b4:	20727363          	bgeu	tp,t2,4ba <errpat+0x2>
 2b8:	6d2d                	.insn	2, 0x6d2d
 2ba:	6261                	.insn	2, 0x6261
 2bc:	3d69                	.insn	2, 0x3d69
 2be:	6c69                	.insn	2, 0x6c69
 2c0:	3370                	.insn	2, 0x3370
 2c2:	0032                	.insn	2, 0x0032
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
 2ec:	7461636f          	jal	t1,16a32 <__subdf3+0xf35a>
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
 390:	7265706f          	j	57ab6 <__subdf3+0x503de>
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
 3b4:	7220726f          	jal	tp,7ad6 <__subdf3+0x3fe>
 3b8:	6e75                	.insn	2, 0x6e75
 3ba:	6120                	.insn	2, 0x6120
 3bc:	646e                	.insn	2, 0x646e
 3be:	7220                	.insn	2, 0x7220
 3c0:	7065                	.insn	2, 0x7065
 3c2:	6974726f          	jal	tp,48258 <__subdf3+0x40b80>
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
 414:	7620746f          	jal	s0,7b76 <__subdf3+0x49e>
 418:	6c61                	.insn	2, 0x6c61
 41a:	6469                	.insn	2, 0x6469
 41c:	7461                	.insn	2, 0x7461
 41e:	2065                	.insn	2, 0x2065
 420:	7265706f          	j	57b46 <__subdf3+0x5046e>
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
 578:	3100                	.insn	2, 0x3100
 57a:	0000                	.insn	2, 0x
 57c:	33bc                	.insn	2, 0x33bc
 57e:	0000                	.insn	2, 0x
 580:	3190                	.insn	2, 0x3190
 582:	0000                	.insn	2, 0x
 584:	32dc                	.insn	2, 0x32dc
 586:	0000                	.insn	2, 0x
 588:	3210                	.insn	2, 0x3210
 58a:	0000                	.insn	2, 0x
 58c:	3270                	.insn	2, 0x3270
 58e:	0000                	.insn	2, 0x
 590:	3334                	.insn	2, 0x3334
 592:	0000                	.insn	2, 0x
 594:	3388                	.insn	2, 0x3388
 596:	0000                	.insn	2, 0x
 598:	349c                	.insn	2, 0x349c
 59a:	0000                	.insn	2, 0x
 59c:	3454                	.insn	2, 0x3454
 59e:	0000                	.insn	2, 0x
 5a0:	3464                	.insn	2, 0x3464
 5a2:	0000                	.insn	2, 0x
 5a4:	3474                	.insn	2, 0x3474
 5a6:	0000                	.insn	2, 0x
 5a8:	3480                	.insn	2, 0x3480
 5aa:	0000                	.insn	2, 0x
 5ac:	348c                	.insn	2, 0x348c
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
 630:	7271706f          	j	18556 <__subdf3+0x10e7e>
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
 670:	5224                	.insn	2, 0x5224
 672:	0000                	.insn	2, 0x
 674:	5254                	.insn	2, 0x5254
 676:	0000                	.insn	2, 0x
 678:	5254                	.insn	2, 0x5254
 67a:	0000                	.insn	2, 0x
 67c:	5234                	.insn	2, 0x5234
 67e:	0000                	.insn	2, 0x
 680:	5254                	.insn	2, 0x5254
 682:	0000                	.insn	2, 0x
 684:	5254                	.insn	2, 0x5254
 686:	0000                	.insn	2, 0x
 688:	5254                	.insn	2, 0x5254
 68a:	0000                	.insn	2, 0x
 68c:	5254                	.insn	2, 0x5254
 68e:	0000                	.insn	2, 0x
 690:	5254                	.insn	2, 0x5254
 692:	0000                	.insn	2, 0x
 694:	5254                	.insn	2, 0x5254
 696:	0000                	.insn	2, 0x
 698:	5254                	.insn	2, 0x5254
 69a:	0000                	.insn	2, 0x
 69c:	5214                	.insn	2, 0x5214
 69e:	0000                	.insn	2, 0x
 6a0:	5254                	.insn	2, 0x5254
 6a2:	0000                	.insn	2, 0x
 6a4:	5204                	.insn	2, 0x5204
 6a6:	0000                	.insn	2, 0x
 6a8:	5254                	.insn	2, 0x5254
 6aa:	0000                	.insn	2, 0x
 6ac:	5254                	.insn	2, 0x5254
 6ae:	0000                	.insn	2, 0x
 6b0:	5244                	.insn	2, 0x5244
 6b2:	0000                	.insn	2, 0x
 6b4:	55a8                	.insn	2, 0x55a8
 6b6:	0000                	.insn	2, 0x
 6b8:	56a8                	.insn	2, 0x56a8
 6ba:	0000                	.insn	2, 0x
 6bc:	56a8                	.insn	2, 0x56a8
 6be:	0000                	.insn	2, 0x
 6c0:	56a8                	.insn	2, 0x56a8
 6c2:	0000                	.insn	2, 0x
 6c4:	56a8                	.insn	2, 0x56a8
 6c6:	0000                	.insn	2, 0x
 6c8:	56a8                	.insn	2, 0x56a8
 6ca:	0000                	.insn	2, 0x
 6cc:	56a8                	.insn	2, 0x56a8
 6ce:	0000                	.insn	2, 0x
 6d0:	56a8                	.insn	2, 0x56a8
 6d2:	0000                	.insn	2, 0x
 6d4:	56a8                	.insn	2, 0x56a8
 6d6:	0000                	.insn	2, 0x
 6d8:	56a8                	.insn	2, 0x56a8
 6da:	0000                	.insn	2, 0x
 6dc:	56a8                	.insn	2, 0x56a8
 6de:	0000                	.insn	2, 0x
 6e0:	56a8                	.insn	2, 0x56a8
 6e2:	0000                	.insn	2, 0x
 6e4:	56a8                	.insn	2, 0x56a8
 6e6:	0000                	.insn	2, 0x
 6e8:	56a8                	.insn	2, 0x56a8
 6ea:	0000                	.insn	2, 0x
 6ec:	56a8                	.insn	2, 0x56a8
 6ee:	0000                	.insn	2, 0x
 6f0:	56a8                	.insn	2, 0x56a8
 6f2:	0000                	.insn	2, 0x
 6f4:	56a8                	.insn	2, 0x56a8
 6f6:	0000                	.insn	2, 0x
 6f8:	56a8                	.insn	2, 0x56a8
 6fa:	0000                	.insn	2, 0x
 6fc:	56a8                	.insn	2, 0x56a8
 6fe:	0000                	.insn	2, 0x
 700:	56a8                	.insn	2, 0x56a8
 702:	0000                	.insn	2, 0x
 704:	56a8                	.insn	2, 0x56a8
 706:	0000                	.insn	2, 0x
 708:	56a8                	.insn	2, 0x56a8
 70a:	0000                	.insn	2, 0x
 70c:	56a8                	.insn	2, 0x56a8
 70e:	0000                	.insn	2, 0x
 710:	562c                	.insn	2, 0x562c
 712:	0000                	.insn	2, 0x
 714:	56a8                	.insn	2, 0x56a8
 716:	0000                	.insn	2, 0x
 718:	56a8                	.insn	2, 0x56a8
 71a:	0000                	.insn	2, 0x
 71c:	56a8                	.insn	2, 0x56a8
 71e:	0000                	.insn	2, 0x
 720:	56a8                	.insn	2, 0x56a8
 722:	0000                	.insn	2, 0x
 724:	56a8                	.insn	2, 0x56a8
 726:	0000                	.insn	2, 0x
 728:	56a8                	.insn	2, 0x56a8
 72a:	0000                	.insn	2, 0x
 72c:	56a8                	.insn	2, 0x56a8
 72e:	0000                	.insn	2, 0x
 730:	56a8                	.insn	2, 0x56a8
 732:	0000                	.insn	2, 0x
 734:	55b4                	.insn	2, 0x55b4
 736:	0000                	.insn	2, 0x
 738:	56a8                	.insn	2, 0x56a8
 73a:	0000                	.insn	2, 0x
 73c:	53e4                	.insn	2, 0x53e4
 73e:	0000                	.insn	2, 0x
 740:	5644                	.insn	2, 0x5644
 742:	0000                	.insn	2, 0x
 744:	56a8                	.insn	2, 0x56a8
 746:	0000                	.insn	2, 0x
 748:	5654                	.insn	2, 0x5654
 74a:	0000                	.insn	2, 0x
 74c:	56a8                	.insn	2, 0x56a8
 74e:	0000                	.insn	2, 0x
 750:	56a8                	.insn	2, 0x56a8
 752:	0000                	.insn	2, 0x
 754:	5644                	.insn	2, 0x5644
 756:	0000                	.insn	2, 0x
 758:	56a8                	.insn	2, 0x56a8
 75a:	0000                	.insn	2, 0x
 75c:	56a8                	.insn	2, 0x56a8
 75e:	0000                	.insn	2, 0x
 760:	56a8                	.insn	2, 0x56a8
 762:	0000                	.insn	2, 0x
 764:	56a8                	.insn	2, 0x56a8
 766:	0000                	.insn	2, 0x
 768:	56a8                	.insn	2, 0x56a8
 76a:	0000                	.insn	2, 0x
 76c:	5620                	.insn	2, 0x5620
 76e:	0000                	.insn	2, 0x
 770:	5554                	.insn	2, 0x5554
 772:	0000                	.insn	2, 0x
 774:	56a8                	.insn	2, 0x56a8
 776:	0000                	.insn	2, 0x
 778:	56a8                	.insn	2, 0x56a8
 77a:	0000                	.insn	2, 0x
 77c:	5470                	.insn	2, 0x5470
 77e:	0000                	.insn	2, 0x
 780:	56a8                	.insn	2, 0x56a8
 782:	0000                	.insn	2, 0x
 784:	5704                	.insn	2, 0x5704
 786:	0000                	.insn	2, 0x
 788:	56a8                	.insn	2, 0x56a8
 78a:	0000                	.insn	2, 0x
 78c:	56a8                	.insn	2, 0x56a8
 78e:	0000                	.insn	2, 0x
 790:	5638                	.insn	2, 0x5638
	...

00000794 <digits>:
 794:	0618                	.insn	2, 0x0618
	...

00000798 <upper_digits>:
 798:	0640                	.insn	2, 0x0640
 79a:	0000                	.insn	2, 0x
 79c:	5d24                	.insn	2, 0x5d24
 79e:	0000                	.insn	2, 0x
 7a0:	5bd0                	.insn	2, 0x5bd0
 7a2:	0000                	.insn	2, 0x
 7a4:	5b7c                	.insn	2, 0x5b7c
 7a6:	0000                	.insn	2, 0x
 7a8:	5cd0                	.insn	2, 0x5cd0
 7aa:	0000                	.insn	2, 0x
 7ac:	5b7c                	.insn	2, 0x5b7c
 7ae:	0000                	.insn	2, 0x
 7b0:	5be0                	.insn	2, 0x5be0
 7b2:	0000                	.insn	2, 0x
 7b4:	5b7c                	.insn	2, 0x5b7c
 7b6:	0000                	.insn	2, 0x
 7b8:	5cd0                	.insn	2, 0x5cd0
 7ba:	0000                	.insn	2, 0x
 7bc:	5bd0                	.insn	2, 0x5bd0
 7be:	0000                	.insn	2, 0x
 7c0:	5bd0                	.insn	2, 0x5bd0
 7c2:	0000                	.insn	2, 0x
 7c4:	5be0                	.insn	2, 0x5be0
 7c6:	0000                	.insn	2, 0x
 7c8:	5cd0                	.insn	2, 0x5cd0
 7ca:	0000                	.insn	2, 0x
 7cc:	5c5c                	.insn	2, 0x5c5c
 7ce:	0000                	.insn	2, 0x
 7d0:	5c5c                	.insn	2, 0x5c5c
 7d2:	0000                	.insn	2, 0x
 7d4:	5c5c                	.insn	2, 0x5c5c
 7d6:	0000                	.insn	2, 0x
 7d8:	5be0                	.insn	2, 0x5be0
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
   0:	3641                	.insn	2, 0x3641
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <matrix_known_crc+0x8>
   c:	002c                	.insn	2, 0x002c
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6369 7273      	.insn	6, 0x727363697a5f
  26:	7032                	.insn	2, 0x7032
  28:	5f30                	.insn	2, 0x5f30
  2a:	6d7a                	.insn	2, 0x6d7a
  2c:	756d                	.insn	2, 0x756d
  2e:	316c                	.insn	2, 0x316c
  30:	3070                	.insn	2, 0x3070
  32:	0800                	.insn	2, 0x0800
  34:	0a01                	.insn	2, 0x0a01
  36:	Address 0x36 is out of bounds.

