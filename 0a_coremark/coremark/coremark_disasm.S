
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
      54:	048010ef          	jal	109c <main>

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
      c8:	6a9000ef          	jal	f70 <int_handler>
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

00000130 <calc_func>:
     130:	fd010113          	add	sp,sp,-48
     134:	02112623          	sw	ra,44(sp)
     138:	02812423          	sw	s0,40(sp)
     13c:	03010413          	add	s0,sp,48
     140:	fca42e23          	sw	a0,-36(s0)
     144:	fcb42c23          	sw	a1,-40(s0)
     148:	fdc42783          	lw	a5,-36(s0)
     14c:	0007d783          	lhu	a5,0(a5)
     150:	fef41523          	sh	a5,-22(s0)
     154:	fea41783          	lh	a5,-22(s0)
     158:	4077d793          	sra	a5,a5,0x7
     15c:	01079793          	sll	a5,a5,0x10
     160:	4107d793          	sra	a5,a5,0x10
     164:	0ff7f793          	zext.b	a5,a5
     168:	0017f793          	and	a5,a5,1
     16c:	fef404a3          	sb	a5,-23(s0)
     170:	fe944783          	lbu	a5,-23(s0)
     174:	00078c63          	beqz	a5,18c <calc_func+0x5c>
     178:	fea45783          	lhu	a5,-22(s0)
     17c:	07f7f793          	and	a5,a5,127
     180:	01079793          	sll	a5,a5,0x10
     184:	4107d793          	sra	a5,a5,0x10
     188:	18c0006f          	j	314 <calc_func+0x1e4>
     18c:	fea45783          	lhu	a5,-22(s0)
     190:	0077f793          	and	a5,a5,7
     194:	fef41323          	sh	a5,-26(s0)
     198:	fea41783          	lh	a5,-22(s0)
     19c:	4037d793          	sra	a5,a5,0x3
     1a0:	01079793          	sll	a5,a5,0x10
     1a4:	4107d793          	sra	a5,a5,0x10
     1a8:	00f7f793          	and	a5,a5,15
     1ac:	fef41623          	sh	a5,-20(s0)
     1b0:	fec45783          	lhu	a5,-20(s0)
     1b4:	00479793          	sll	a5,a5,0x4
     1b8:	01079793          	sll	a5,a5,0x10
     1bc:	4107d793          	sra	a5,a5,0x10
     1c0:	fec45703          	lhu	a4,-20(s0)
     1c4:	00e7e7b3          	or	a5,a5,a4
     1c8:	fef41623          	sh	a5,-20(s0)
     1cc:	fe641783          	lh	a5,-26(s0)
     1d0:	00078863          	beqz	a5,1e0 <calc_func+0xb0>
     1d4:	00100713          	li	a4,1
     1d8:	06e78863          	beq	a5,a4,248 <calc_func+0x118>
     1dc:	0b40006f          	j	290 <calc_func+0x160>
     1e0:	fec41703          	lh	a4,-20(s0)
     1e4:	02100793          	li	a5,33
     1e8:	00e7c663          	blt	a5,a4,1f4 <calc_func+0xc4>
     1ec:	02200793          	li	a5,34
     1f0:	fef41623          	sh	a5,-20(s0)
     1f4:	fd842783          	lw	a5,-40(s0)
     1f8:	0187a503          	lw	a0,24(a5)
     1fc:	fd842783          	lw	a5,-40(s0)
     200:	0147a583          	lw	a1,20(a5)
     204:	fd842783          	lw	a5,-40(s0)
     208:	00079603          	lh	a2,0(a5)
     20c:	fd842783          	lw	a5,-40(s0)
     210:	00279683          	lh	a3,2(a5)
     214:	fd842783          	lw	a5,-40(s0)
     218:	0387d783          	lhu	a5,56(a5)
     21c:	fec41703          	lh	a4,-20(s0)
     220:	49d020ef          	jal	2ebc <core_bench_state>
     224:	00050793          	mv	a5,a0
     228:	fef41723          	sh	a5,-18(s0)
     22c:	fd842783          	lw	a5,-40(s0)
     230:	03e7d783          	lhu	a5,62(a5)
     234:	06079463          	bnez	a5,29c <calc_func+0x16c>
     238:	fee45703          	lhu	a4,-18(s0)
     23c:	fd842783          	lw	a5,-40(s0)
     240:	02e79f23          	sh	a4,62(a5)
     244:	0580006f          	j	29c <calc_func+0x16c>
     248:	fd842783          	lw	a5,-40(s0)
     24c:	02878713          	add	a4,a5,40
     250:	fd842783          	lw	a5,-40(s0)
     254:	0387d683          	lhu	a3,56(a5)
     258:	fec41783          	lh	a5,-20(s0)
     25c:	00068613          	mv	a2,a3
     260:	00078593          	mv	a1,a5
     264:	00070513          	mv	a0,a4
     268:	61d010ef          	jal	2084 <core_bench_matrix>
     26c:	00050793          	mv	a5,a0
     270:	fef41723          	sh	a5,-18(s0)
     274:	fd842783          	lw	a5,-40(s0)
     278:	03c7d783          	lhu	a5,60(a5)
     27c:	02079463          	bnez	a5,2a4 <calc_func+0x174>
     280:	fee45703          	lhu	a4,-18(s0)
     284:	fd842783          	lw	a5,-40(s0)
     288:	02e79e23          	sh	a4,60(a5)
     28c:	0180006f          	j	2a4 <calc_func+0x174>
     290:	fea45783          	lhu	a5,-22(s0)
     294:	fef41723          	sh	a5,-18(s0)
     298:	0100006f          	j	2a8 <calc_func+0x178>
     29c:	00000013          	nop
     2a0:	0080006f          	j	2a8 <calc_func+0x178>
     2a4:	00000013          	nop
     2a8:	fee45703          	lhu	a4,-18(s0)
     2ac:	fd842783          	lw	a5,-40(s0)
     2b0:	0387d783          	lhu	a5,56(a5)
     2b4:	00078593          	mv	a1,a5
     2b8:	00070513          	mv	a0,a4
     2bc:	6b0030ef          	jal	396c <crcu16>
     2c0:	00050793          	mv	a5,a0
     2c4:	00078713          	mv	a4,a5
     2c8:	fd842783          	lw	a5,-40(s0)
     2cc:	02e79c23          	sh	a4,56(a5)
     2d0:	fee45783          	lhu	a5,-18(s0)
     2d4:	07f7f793          	and	a5,a5,127
     2d8:	fef41723          	sh	a5,-18(s0)
     2dc:	fea45783          	lhu	a5,-22(s0)
     2e0:	f007f793          	and	a5,a5,-256
     2e4:	01079793          	sll	a5,a5,0x10
     2e8:	4107d793          	sra	a5,a5,0x10
     2ec:	0807e793          	or	a5,a5,128
     2f0:	01079793          	sll	a5,a5,0x10
     2f4:	4107d793          	sra	a5,a5,0x10
     2f8:	fee45703          	lhu	a4,-18(s0)
     2fc:	00e7e7b3          	or	a5,a5,a4
     300:	01079713          	sll	a4,a5,0x10
     304:	41075713          	sra	a4,a4,0x10
     308:	fdc42783          	lw	a5,-36(s0)
     30c:	00e79023          	sh	a4,0(a5)
     310:	fee41783          	lh	a5,-18(s0)
     314:	00078513          	mv	a0,a5
     318:	02c12083          	lw	ra,44(sp)
     31c:	02812403          	lw	s0,40(sp)
     320:	03010113          	add	sp,sp,48
     324:	00008067          	ret

00000328 <cmp_complex>:
     328:	fd010113          	add	sp,sp,-48
     32c:	02112623          	sw	ra,44(sp)
     330:	02812423          	sw	s0,40(sp)
     334:	03010413          	add	s0,sp,48
     338:	fca42e23          	sw	a0,-36(s0)
     33c:	fcb42c23          	sw	a1,-40(s0)
     340:	fcc42a23          	sw	a2,-44(s0)
     344:	fdc42783          	lw	a5,-36(s0)
     348:	fd442583          	lw	a1,-44(s0)
     34c:	00078513          	mv	a0,a5
     350:	de1ff0ef          	jal	130 <calc_func>
     354:	00050793          	mv	a5,a0
     358:	fef41723          	sh	a5,-18(s0)
     35c:	fd842783          	lw	a5,-40(s0)
     360:	fd442583          	lw	a1,-44(s0)
     364:	00078513          	mv	a0,a5
     368:	dc9ff0ef          	jal	130 <calc_func>
     36c:	00050793          	mv	a5,a0
     370:	fef41623          	sh	a5,-20(s0)
     374:	fee41703          	lh	a4,-18(s0)
     378:	fec41783          	lh	a5,-20(s0)
     37c:	40f707b3          	sub	a5,a4,a5
     380:	00078513          	mv	a0,a5
     384:	02c12083          	lw	ra,44(sp)
     388:	02812403          	lw	s0,40(sp)
     38c:	03010113          	add	sp,sp,48
     390:	00008067          	ret

00000394 <cmp_idx>:
     394:	fe010113          	add	sp,sp,-32
     398:	00812e23          	sw	s0,28(sp)
     39c:	02010413          	add	s0,sp,32
     3a0:	fea42623          	sw	a0,-20(s0)
     3a4:	feb42423          	sw	a1,-24(s0)
     3a8:	fec42223          	sw	a2,-28(s0)
     3ac:	fe442783          	lw	a5,-28(s0)
     3b0:	08079e63          	bnez	a5,44c <cmp_idx+0xb8>
     3b4:	fec42783          	lw	a5,-20(s0)
     3b8:	00079783          	lh	a5,0(a5)
     3bc:	f007f793          	and	a5,a5,-256
     3c0:	01079713          	sll	a4,a5,0x10
     3c4:	41075713          	sra	a4,a4,0x10
     3c8:	fec42783          	lw	a5,-20(s0)
     3cc:	00079783          	lh	a5,0(a5)
     3d0:	01079793          	sll	a5,a5,0x10
     3d4:	0107d793          	srl	a5,a5,0x10
     3d8:	0087d793          	srl	a5,a5,0x8
     3dc:	01079793          	sll	a5,a5,0x10
     3e0:	0107d793          	srl	a5,a5,0x10
     3e4:	01079793          	sll	a5,a5,0x10
     3e8:	4107d793          	sra	a5,a5,0x10
     3ec:	00f767b3          	or	a5,a4,a5
     3f0:	01079713          	sll	a4,a5,0x10
     3f4:	41075713          	sra	a4,a4,0x10
     3f8:	fec42783          	lw	a5,-20(s0)
     3fc:	00e79023          	sh	a4,0(a5)
     400:	fe842783          	lw	a5,-24(s0)
     404:	00079783          	lh	a5,0(a5)
     408:	f007f793          	and	a5,a5,-256
     40c:	01079713          	sll	a4,a5,0x10
     410:	41075713          	sra	a4,a4,0x10
     414:	fe842783          	lw	a5,-24(s0)
     418:	00079783          	lh	a5,0(a5)
     41c:	01079793          	sll	a5,a5,0x10
     420:	0107d793          	srl	a5,a5,0x10
     424:	0087d793          	srl	a5,a5,0x8
     428:	01079793          	sll	a5,a5,0x10
     42c:	0107d793          	srl	a5,a5,0x10
     430:	01079793          	sll	a5,a5,0x10
     434:	4107d793          	sra	a5,a5,0x10
     438:	00f767b3          	or	a5,a4,a5
     43c:	01079713          	sll	a4,a5,0x10
     440:	41075713          	sra	a4,a4,0x10
     444:	fe842783          	lw	a5,-24(s0)
     448:	00e79023          	sh	a4,0(a5)
     44c:	fec42783          	lw	a5,-20(s0)
     450:	00279783          	lh	a5,2(a5)
     454:	00078713          	mv	a4,a5
     458:	fe842783          	lw	a5,-24(s0)
     45c:	00279783          	lh	a5,2(a5)
     460:	40f707b3          	sub	a5,a4,a5
     464:	00078513          	mv	a0,a5
     468:	01c12403          	lw	s0,28(sp)
     46c:	02010113          	add	sp,sp,32
     470:	00008067          	ret

00000474 <copy_info>:
     474:	fe010113          	add	sp,sp,-32
     478:	00812e23          	sw	s0,28(sp)
     47c:	02010413          	add	s0,sp,32
     480:	fea42623          	sw	a0,-20(s0)
     484:	feb42423          	sw	a1,-24(s0)
     488:	fe842783          	lw	a5,-24(s0)
     48c:	00079703          	lh	a4,0(a5)
     490:	fec42783          	lw	a5,-20(s0)
     494:	00e79023          	sh	a4,0(a5)
     498:	fe842783          	lw	a5,-24(s0)
     49c:	00279703          	lh	a4,2(a5)
     4a0:	fec42783          	lw	a5,-20(s0)
     4a4:	00e79123          	sh	a4,2(a5)
     4a8:	00000013          	nop
     4ac:	01c12403          	lw	s0,28(sp)
     4b0:	02010113          	add	sp,sp,32
     4b4:	00008067          	ret

000004b8 <core_bench_list>:
     4b8:	fc010113          	add	sp,sp,-64
     4bc:	02112e23          	sw	ra,60(sp)
     4c0:	02812c23          	sw	s0,56(sp)
     4c4:	04010413          	add	s0,sp,64
     4c8:	fca42623          	sw	a0,-52(s0)
     4cc:	00058793          	mv	a5,a1
     4d0:	fcf41523          	sh	a5,-54(s0)
     4d4:	fe041723          	sh	zero,-18(s0)
     4d8:	fe041623          	sh	zero,-20(s0)
     4dc:	fe041523          	sh	zero,-22(s0)
     4e0:	fcc42783          	lw	a5,-52(s0)
     4e4:	0247a783          	lw	a5,36(a5)
     4e8:	fef42223          	sw	a5,-28(s0)
     4ec:	fcc42783          	lw	a5,-52(s0)
     4f0:	0047d783          	lhu	a5,4(a5)
     4f4:	fcf41e23          	sh	a5,-36(s0)
     4f8:	fc042823          	sw	zero,-48(s0)
     4fc:	fca45783          	lhu	a5,-54(s0)
     500:	fcf41923          	sh	a5,-46(s0)
     504:	fc041f23          	sh	zero,-34(s0)
     508:	1780006f          	j	680 <_stack_size+0x180>
     50c:	fde45783          	lhu	a5,-34(s0)
     510:	0ff7f793          	zext.b	a5,a5
     514:	01079793          	sll	a5,a5,0x10
     518:	4107d793          	sra	a5,a5,0x10
     51c:	fcf41823          	sh	a5,-48(s0)
     520:	fd040793          	add	a5,s0,-48
     524:	00078593          	mv	a1,a5
     528:	fe442503          	lw	a0,-28(s0)
     52c:	73c000ef          	jal	c68 <core_list_find>
     530:	fca42a23          	sw	a0,-44(s0)
     534:	fe442503          	lw	a0,-28(s0)
     538:	7d4000ef          	jal	d0c <core_list_reverse>
     53c:	fea42223          	sw	a0,-28(s0)
     540:	fd442783          	lw	a5,-44(s0)
     544:	04079863          	bnez	a5,594 <_stack_size+0x94>
     548:	fea45783          	lhu	a5,-22(s0)
     54c:	00178793          	add	a5,a5,1
     550:	fef41523          	sh	a5,-22(s0)
     554:	fe442783          	lw	a5,-28(s0)
     558:	0007a783          	lw	a5,0(a5)
     55c:	0047a783          	lw	a5,4(a5)
     560:	00079783          	lh	a5,0(a5)
     564:	4087d793          	sra	a5,a5,0x8
     568:	01079793          	sll	a5,a5,0x10
     56c:	4107d793          	sra	a5,a5,0x10
     570:	01079793          	sll	a5,a5,0x10
     574:	0107d793          	srl	a5,a5,0x10
     578:	0017f793          	and	a5,a5,1
     57c:	01079793          	sll	a5,a5,0x10
     580:	0107d793          	srl	a5,a5,0x10
     584:	fee45703          	lhu	a4,-18(s0)
     588:	00e787b3          	add	a5,a5,a4
     58c:	fef41723          	sh	a5,-18(s0)
     590:	0a80006f          	j	638 <_stack_size+0x138>
     594:	fec45783          	lhu	a5,-20(s0)
     598:	00178793          	add	a5,a5,1
     59c:	fef41623          	sh	a5,-20(s0)
     5a0:	fd442783          	lw	a5,-44(s0)
     5a4:	0047a783          	lw	a5,4(a5)
     5a8:	00079783          	lh	a5,0(a5)
     5ac:	01079793          	sll	a5,a5,0x10
     5b0:	0107d793          	srl	a5,a5,0x10
     5b4:	0017f793          	and	a5,a5,1
     5b8:	02078e63          	beqz	a5,5f4 <_stack_size+0xf4>
     5bc:	fd442783          	lw	a5,-44(s0)
     5c0:	0047a783          	lw	a5,4(a5)
     5c4:	00079783          	lh	a5,0(a5)
     5c8:	4097d793          	sra	a5,a5,0x9
     5cc:	01079793          	sll	a5,a5,0x10
     5d0:	4107d793          	sra	a5,a5,0x10
     5d4:	01079793          	sll	a5,a5,0x10
     5d8:	0107d793          	srl	a5,a5,0x10
     5dc:	0017f793          	and	a5,a5,1
     5e0:	01079793          	sll	a5,a5,0x10
     5e4:	0107d793          	srl	a5,a5,0x10
     5e8:	fee45703          	lhu	a4,-18(s0)
     5ec:	00e787b3          	add	a5,a5,a4
     5f0:	fef41723          	sh	a5,-18(s0)
     5f4:	fd442783          	lw	a5,-44(s0)
     5f8:	0007a783          	lw	a5,0(a5)
     5fc:	02078e63          	beqz	a5,638 <_stack_size+0x138>
     600:	fd442783          	lw	a5,-44(s0)
     604:	0007a783          	lw	a5,0(a5)
     608:	fef42023          	sw	a5,-32(s0)
     60c:	fe042783          	lw	a5,-32(s0)
     610:	0007a703          	lw	a4,0(a5)
     614:	fd442783          	lw	a5,-44(s0)
     618:	00e7a023          	sw	a4,0(a5)
     61c:	fe442783          	lw	a5,-28(s0)
     620:	0007a703          	lw	a4,0(a5)
     624:	fe042783          	lw	a5,-32(s0)
     628:	00e7a023          	sw	a4,0(a5)
     62c:	fe442783          	lw	a5,-28(s0)
     630:	fe042703          	lw	a4,-32(s0)
     634:	00e7a023          	sw	a4,0(a5)
     638:	fd241783          	lh	a5,-46(s0)
     63c:	0207c463          	bltz	a5,664 <_stack_size+0x164>
     640:	fd241783          	lh	a5,-46(s0)
     644:	01079793          	sll	a5,a5,0x10
     648:	0107d793          	srl	a5,a5,0x10
     64c:	00178793          	add	a5,a5,1
     650:	01079793          	sll	a5,a5,0x10
     654:	0107d793          	srl	a5,a5,0x10
     658:	01079793          	sll	a5,a5,0x10
     65c:	4107d793          	sra	a5,a5,0x10
     660:	fcf41923          	sh	a5,-46(s0)
     664:	fde41783          	lh	a5,-34(s0)
     668:	01079793          	sll	a5,a5,0x10
     66c:	0107d793          	srl	a5,a5,0x10
     670:	00178793          	add	a5,a5,1
     674:	01079793          	sll	a5,a5,0x10
     678:	0107d793          	srl	a5,a5,0x10
     67c:	fcf41f23          	sh	a5,-34(s0)
     680:	fde41703          	lh	a4,-34(s0)
     684:	fdc41783          	lh	a5,-36(s0)
     688:	e8f742e3          	blt	a4,a5,50c <_stack_size+0xc>
     68c:	fec45783          	lhu	a5,-20(s0)
     690:	00279793          	sll	a5,a5,0x2
     694:	01079793          	sll	a5,a5,0x10
     698:	0107d793          	srl	a5,a5,0x10
     69c:	fea45703          	lhu	a4,-22(s0)
     6a0:	40e787b3          	sub	a5,a5,a4
     6a4:	01079793          	sll	a5,a5,0x10
     6a8:	0107d793          	srl	a5,a5,0x10
     6ac:	fee45703          	lhu	a4,-18(s0)
     6b0:	00e787b3          	add	a5,a5,a4
     6b4:	fef41723          	sh	a5,-18(s0)
     6b8:	fca41783          	lh	a5,-54(s0)
     6bc:	00f05c63          	blez	a5,6d4 <_stack_size+0x1d4>
     6c0:	fcc42603          	lw	a2,-52(s0)
     6c4:	32800593          	li	a1,808
     6c8:	fe442503          	lw	a0,-28(s0)
     6cc:	69c000ef          	jal	d68 <core_list_mergesort>
     6d0:	fea42223          	sw	a0,-28(s0)
     6d4:	fe442783          	lw	a5,-28(s0)
     6d8:	0007a783          	lw	a5,0(a5)
     6dc:	00078513          	mv	a0,a5
     6e0:	4a8000ef          	jal	b88 <core_list_remove>
     6e4:	fca42c23          	sw	a0,-40(s0)
     6e8:	fd040793          	add	a5,s0,-48
     6ec:	00078593          	mv	a1,a5
     6f0:	fe442503          	lw	a0,-28(s0)
     6f4:	574000ef          	jal	c68 <core_list_find>
     6f8:	fea42023          	sw	a0,-32(s0)
     6fc:	fe042783          	lw	a5,-32(s0)
     700:	04079263          	bnez	a5,744 <_stack_size+0x244>
     704:	fe442783          	lw	a5,-28(s0)
     708:	0007a783          	lw	a5,0(a5)
     70c:	fef42023          	sw	a5,-32(s0)
     710:	0340006f          	j	744 <_stack_size+0x244>
     714:	fe442783          	lw	a5,-28(s0)
     718:	0047a783          	lw	a5,4(a5)
     71c:	00079783          	lh	a5,0(a5)
     720:	fee45703          	lhu	a4,-18(s0)
     724:	00070593          	mv	a1,a4
     728:	00078513          	mv	a0,a5
     72c:	348030ef          	jal	3a74 <crc16>
     730:	00050793          	mv	a5,a0
     734:	fef41723          	sh	a5,-18(s0)
     738:	fe042783          	lw	a5,-32(s0)
     73c:	0007a783          	lw	a5,0(a5)
     740:	fef42023          	sw	a5,-32(s0)
     744:	fe042783          	lw	a5,-32(s0)
     748:	fc0796e3          	bnez	a5,714 <_stack_size+0x214>
     74c:	fe442783          	lw	a5,-28(s0)
     750:	0007a783          	lw	a5,0(a5)
     754:	00078593          	mv	a1,a5
     758:	fd842503          	lw	a0,-40(s0)
     75c:	4a0000ef          	jal	bfc <core_list_undo_remove>
     760:	fca42c23          	sw	a0,-40(s0)
     764:	00000613          	li	a2,0
     768:	39400593          	li	a1,916
     76c:	fe442503          	lw	a0,-28(s0)
     770:	5f8000ef          	jal	d68 <core_list_mergesort>
     774:	fea42223          	sw	a0,-28(s0)
     778:	fe442783          	lw	a5,-28(s0)
     77c:	0007a783          	lw	a5,0(a5)
     780:	fef42023          	sw	a5,-32(s0)
     784:	0340006f          	j	7b8 <upper_digits+0x20>
     788:	fe442783          	lw	a5,-28(s0)
     78c:	0047a783          	lw	a5,4(a5)
     790:	00079783          	lh	a5,0(a5)
     794:	fee45703          	lhu	a4,-18(s0)
     798:	00070593          	mv	a1,a4
     79c:	00078513          	mv	a0,a5
     7a0:	2d4030ef          	jal	3a74 <crc16>
     7a4:	00050793          	mv	a5,a0
     7a8:	fef41723          	sh	a5,-18(s0)
     7ac:	fe042783          	lw	a5,-32(s0)
     7b0:	0007a783          	lw	a5,0(a5)
     7b4:	fef42023          	sw	a5,-32(s0)
     7b8:	fe042783          	lw	a5,-32(s0)
     7bc:	fc0796e3          	bnez	a5,788 <_stack_size+0x288>
     7c0:	fee45783          	lhu	a5,-18(s0)
     7c4:	00078513          	mv	a0,a5
     7c8:	03c12083          	lw	ra,60(sp)
     7cc:	03812403          	lw	s0,56(sp)
     7d0:	04010113          	add	sp,sp,64
     7d4:	00008067          	ret

000007d8 <core_list_init>:
     7d8:	fb010113          	add	sp,sp,-80
     7dc:	04112623          	sw	ra,76(sp)
     7e0:	04812423          	sw	s0,72(sp)
     7e4:	05010413          	add	s0,sp,80
     7e8:	faa42e23          	sw	a0,-68(s0)
     7ec:	fab42c23          	sw	a1,-72(s0)
     7f0:	00060793          	mv	a5,a2
     7f4:	faf41b23          	sh	a5,-74(s0)
     7f8:	01400793          	li	a5,20
     7fc:	fef42223          	sw	a5,-28(s0)
     800:	fe442583          	lw	a1,-28(s0)
     804:	fbc42503          	lw	a0,-68(s0)
     808:	0bc070ef          	jal	78c4 <__hidden___udivsi3>
     80c:	00050793          	mv	a5,a0
     810:	ffe78793          	add	a5,a5,-2
     814:	fef42023          	sw	a5,-32(s0)
     818:	fb842703          	lw	a4,-72(s0)
     81c:	fe042783          	lw	a5,-32(s0)
     820:	00379793          	sll	a5,a5,0x3
     824:	00f707b3          	add	a5,a4,a5
     828:	fcf42e23          	sw	a5,-36(s0)
     82c:	fdc42783          	lw	a5,-36(s0)
     830:	fcf42423          	sw	a5,-56(s0)
     834:	fc842703          	lw	a4,-56(s0)
     838:	fe042783          	lw	a5,-32(s0)
     83c:	00279793          	sll	a5,a5,0x2
     840:	00f707b3          	add	a5,a4,a5
     844:	fcf42c23          	sw	a5,-40(s0)
     848:	fb842783          	lw	a5,-72(s0)
     84c:	fcf42a23          	sw	a5,-44(s0)
     850:	fd442783          	lw	a5,-44(s0)
     854:	0007a023          	sw	zero,0(a5)
     858:	fc842703          	lw	a4,-56(s0)
     85c:	fd442783          	lw	a5,-44(s0)
     860:	00e7a223          	sw	a4,4(a5)
     864:	fd442783          	lw	a5,-44(s0)
     868:	0047a783          	lw	a5,4(a5)
     86c:	00079123          	sh	zero,2(a5)
     870:	fd442783          	lw	a5,-44(s0)
     874:	0047a783          	lw	a5,4(a5)
     878:	ffff8737          	lui	a4,0xffff8
     87c:	08070713          	add	a4,a4,128 # ffff8080 <__subdf3+0xffff049c>
     880:	00e79023          	sh	a4,0(a5)
     884:	fb842783          	lw	a5,-72(s0)
     888:	00878793          	add	a5,a5,8
     88c:	faf42c23          	sw	a5,-72(s0)
     890:	fc842783          	lw	a5,-56(s0)
     894:	00478793          	add	a5,a5,4
     898:	fcf42423          	sw	a5,-56(s0)
     89c:	ffff87b7          	lui	a5,0xffff8
     8a0:	fff7c793          	not	a5,a5
     8a4:	fcf41323          	sh	a5,-58(s0)
     8a8:	fff00793          	li	a5,-1
     8ac:	fcf41223          	sh	a5,-60(s0)
     8b0:	fc840693          	add	a3,s0,-56
     8b4:	fb840613          	add	a2,s0,-72
     8b8:	fc440593          	add	a1,s0,-60
     8bc:	fd842783          	lw	a5,-40(s0)
     8c0:	fdc42703          	lw	a4,-36(s0)
     8c4:	fd442503          	lw	a0,-44(s0)
     8c8:	1d4000ef          	jal	a9c <core_list_insert_new>
     8cc:	fe042623          	sw	zero,-20(s0)
     8d0:	0a40006f          	j	974 <_bss_end+0x34>
     8d4:	fec42783          	lw	a5,-20(s0)
     8d8:	01079713          	sll	a4,a5,0x10
     8dc:	01075713          	srl	a4,a4,0x10
     8e0:	fb645783          	lhu	a5,-74(s0)
     8e4:	00f747b3          	xor	a5,a4,a5
     8e8:	01079793          	sll	a5,a5,0x10
     8ec:	0107d793          	srl	a5,a5,0x10
     8f0:	00f7f793          	and	a5,a5,15
     8f4:	fcf41823          	sh	a5,-48(s0)
     8f8:	fd045783          	lhu	a5,-48(s0)
     8fc:	00379793          	sll	a5,a5,0x3
     900:	01079713          	sll	a4,a5,0x10
     904:	01075713          	srl	a4,a4,0x10
     908:	fec42783          	lw	a5,-20(s0)
     90c:	01079793          	sll	a5,a5,0x10
     910:	0107d793          	srl	a5,a5,0x10
     914:	0077f793          	and	a5,a5,7
     918:	01079793          	sll	a5,a5,0x10
     91c:	0107d793          	srl	a5,a5,0x10
     920:	00f767b3          	or	a5,a4,a5
     924:	fcf41723          	sh	a5,-50(s0)
     928:	fce41783          	lh	a5,-50(s0)
     92c:	00879793          	sll	a5,a5,0x8
     930:	01079713          	sll	a4,a5,0x10
     934:	41075713          	sra	a4,a4,0x10
     938:	fce41783          	lh	a5,-50(s0)
     93c:	00f767b3          	or	a5,a4,a5
     940:	01079793          	sll	a5,a5,0x10
     944:	4107d793          	sra	a5,a5,0x10
     948:	fcf41223          	sh	a5,-60(s0)
     94c:	fc840693          	add	a3,s0,-56
     950:	fb840613          	add	a2,s0,-72
     954:	fc440593          	add	a1,s0,-60
     958:	fd842783          	lw	a5,-40(s0)
     95c:	fdc42703          	lw	a4,-36(s0)
     960:	fd442503          	lw	a0,-44(s0)
     964:	138000ef          	jal	a9c <core_list_insert_new>
     968:	fec42783          	lw	a5,-20(s0)
     96c:	00178793          	add	a5,a5,1 # ffff8001 <__subdf3+0xffff041d>
     970:	fef42623          	sw	a5,-20(s0)
     974:	fec42703          	lw	a4,-20(s0)
     978:	fe042783          	lw	a5,-32(s0)
     97c:	f4f76ce3          	bltu	a4,a5,8d4 <_gbl_ptr+0xd4>
     980:	fd442783          	lw	a5,-44(s0)
     984:	0007a783          	lw	a5,0(a5)
     988:	fef42423          	sw	a5,-24(s0)
     98c:	00100793          	li	a5,1
     990:	fef42623          	sw	a5,-20(s0)
     994:	0d00006f          	j	a64 <_trap_stack_size+0x64>
     998:	fe042783          	lw	a5,-32(s0)
     99c:	00500593          	li	a1,5
     9a0:	00078513          	mv	a0,a5
     9a4:	721060ef          	jal	78c4 <__hidden___udivsi3>
     9a8:	00050793          	mv	a5,a0
     9ac:	00078713          	mv	a4,a5
     9b0:	fec42783          	lw	a5,-20(s0)
     9b4:	02e7f463          	bgeu	a5,a4,9dc <_bss_end+0x9c>
     9b8:	fec42783          	lw	a5,-20(s0)
     9bc:	00178713          	add	a4,a5,1
     9c0:	fee42623          	sw	a4,-20(s0)
     9c4:	fe842703          	lw	a4,-24(s0)
     9c8:	00472703          	lw	a4,4(a4)
     9cc:	01079793          	sll	a5,a5,0x10
     9d0:	4107d793          	sra	a5,a5,0x10
     9d4:	00f71123          	sh	a5,2(a4)
     9d8:	0800006f          	j	a58 <_trap_stack_size+0x58>
     9dc:	fec42783          	lw	a5,-20(s0)
     9e0:	00178713          	add	a4,a5,1
     9e4:	fee42623          	sw	a4,-20(s0)
     9e8:	01079713          	sll	a4,a5,0x10
     9ec:	01075713          	srl	a4,a4,0x10
     9f0:	fb645783          	lhu	a5,-74(s0)
     9f4:	00f747b3          	xor	a5,a4,a5
     9f8:	fcf41923          	sh	a5,-46(s0)
     9fc:	fec42783          	lw	a5,-20(s0)
     a00:	01079793          	sll	a5,a5,0x10
     a04:	0107d793          	srl	a5,a5,0x10
     a08:	00879793          	sll	a5,a5,0x8
     a0c:	01079793          	sll	a5,a5,0x10
     a10:	0107d793          	srl	a5,a5,0x10
     a14:	7007f793          	and	a5,a5,1792
     a18:	01079793          	sll	a5,a5,0x10
     a1c:	0107d793          	srl	a5,a5,0x10
     a20:	fd245703          	lhu	a4,-46(s0)
     a24:	00e7e7b3          	or	a5,a5,a4
     a28:	01079793          	sll	a5,a5,0x10
     a2c:	0107d793          	srl	a5,a5,0x10
     a30:	01079693          	sll	a3,a5,0x10
     a34:	4106d693          	sra	a3,a3,0x10
     a38:	fe842783          	lw	a5,-24(s0)
     a3c:	0047a783          	lw	a5,4(a5)
     a40:	00004737          	lui	a4,0x4
     a44:	fff70713          	add	a4,a4,-1 # 3fff <ecvtbuf+0xb>
     a48:	00e6f733          	and	a4,a3,a4
     a4c:	01071713          	sll	a4,a4,0x10
     a50:	41075713          	sra	a4,a4,0x10
     a54:	00e79123          	sh	a4,2(a5)
     a58:	fe842783          	lw	a5,-24(s0)
     a5c:	0007a783          	lw	a5,0(a5)
     a60:	fef42423          	sw	a5,-24(s0)
     a64:	fe842783          	lw	a5,-24(s0)
     a68:	0007a783          	lw	a5,0(a5)
     a6c:	f20796e3          	bnez	a5,998 <_bss_end+0x58>
     a70:	00000613          	li	a2,0
     a74:	39400593          	li	a1,916
     a78:	fd442503          	lw	a0,-44(s0)
     a7c:	2ec000ef          	jal	d68 <core_list_mergesort>
     a80:	fca42a23          	sw	a0,-44(s0)
     a84:	fd442783          	lw	a5,-44(s0)
     a88:	00078513          	mv	a0,a5
     a8c:	04c12083          	lw	ra,76(sp)
     a90:	04812403          	lw	s0,72(sp)
     a94:	05010113          	add	sp,sp,80
     a98:	00008067          	ret

00000a9c <core_list_insert_new>:
     a9c:	fc010113          	add	sp,sp,-64
     aa0:	02112e23          	sw	ra,60(sp)
     aa4:	02812c23          	sw	s0,56(sp)
     aa8:	04010413          	add	s0,sp,64
     aac:	fca42e23          	sw	a0,-36(s0)
     ab0:	fcb42c23          	sw	a1,-40(s0)
     ab4:	fcc42a23          	sw	a2,-44(s0)
     ab8:	fcd42823          	sw	a3,-48(s0)
     abc:	fce42623          	sw	a4,-52(s0)
     ac0:	fcf42423          	sw	a5,-56(s0)
     ac4:	fd442783          	lw	a5,-44(s0)
     ac8:	0007a783          	lw	a5,0(a5)
     acc:	00878793          	add	a5,a5,8
     ad0:	fcc42703          	lw	a4,-52(s0)
     ad4:	00e7e663          	bltu	a5,a4,ae0 <core_list_insert_new+0x44>
     ad8:	00000793          	li	a5,0
     adc:	0980006f          	j	b74 <core_list_insert_new+0xd8>
     ae0:	fd042783          	lw	a5,-48(s0)
     ae4:	0007a783          	lw	a5,0(a5)
     ae8:	00478793          	add	a5,a5,4
     aec:	fc842703          	lw	a4,-56(s0)
     af0:	00e7e663          	bltu	a5,a4,afc <core_list_insert_new+0x60>
     af4:	00000793          	li	a5,0
     af8:	07c0006f          	j	b74 <core_list_insert_new+0xd8>
     afc:	fd442783          	lw	a5,-44(s0)
     b00:	0007a783          	lw	a5,0(a5)
     b04:	fef42623          	sw	a5,-20(s0)
     b08:	fd442783          	lw	a5,-44(s0)
     b0c:	0007a783          	lw	a5,0(a5)
     b10:	00878713          	add	a4,a5,8
     b14:	fd442783          	lw	a5,-44(s0)
     b18:	00e7a023          	sw	a4,0(a5)
     b1c:	fdc42783          	lw	a5,-36(s0)
     b20:	0007a703          	lw	a4,0(a5)
     b24:	fec42783          	lw	a5,-20(s0)
     b28:	00e7a023          	sw	a4,0(a5)
     b2c:	fdc42783          	lw	a5,-36(s0)
     b30:	fec42703          	lw	a4,-20(s0)
     b34:	00e7a023          	sw	a4,0(a5)
     b38:	fd042783          	lw	a5,-48(s0)
     b3c:	0007a703          	lw	a4,0(a5)
     b40:	fec42783          	lw	a5,-20(s0)
     b44:	00e7a223          	sw	a4,4(a5)
     b48:	fd042783          	lw	a5,-48(s0)
     b4c:	0007a783          	lw	a5,0(a5)
     b50:	00478713          	add	a4,a5,4
     b54:	fd042783          	lw	a5,-48(s0)
     b58:	00e7a023          	sw	a4,0(a5)
     b5c:	fec42783          	lw	a5,-20(s0)
     b60:	0047a783          	lw	a5,4(a5)
     b64:	fd842583          	lw	a1,-40(s0)
     b68:	00078513          	mv	a0,a5
     b6c:	909ff0ef          	jal	474 <copy_info>
     b70:	fec42783          	lw	a5,-20(s0)
     b74:	00078513          	mv	a0,a5
     b78:	03c12083          	lw	ra,60(sp)
     b7c:	03812403          	lw	s0,56(sp)
     b80:	04010113          	add	sp,sp,64
     b84:	00008067          	ret

00000b88 <core_list_remove>:
     b88:	fd010113          	add	sp,sp,-48
     b8c:	02812623          	sw	s0,44(sp)
     b90:	03010413          	add	s0,sp,48
     b94:	fca42e23          	sw	a0,-36(s0)
     b98:	fdc42783          	lw	a5,-36(s0)
     b9c:	0007a783          	lw	a5,0(a5)
     ba0:	fef42623          	sw	a5,-20(s0)
     ba4:	fdc42783          	lw	a5,-36(s0)
     ba8:	0047a783          	lw	a5,4(a5)
     bac:	fef42423          	sw	a5,-24(s0)
     bb0:	fec42783          	lw	a5,-20(s0)
     bb4:	0047a703          	lw	a4,4(a5)
     bb8:	fdc42783          	lw	a5,-36(s0)
     bbc:	00e7a223          	sw	a4,4(a5)
     bc0:	fec42783          	lw	a5,-20(s0)
     bc4:	fe842703          	lw	a4,-24(s0)
     bc8:	00e7a223          	sw	a4,4(a5)
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0007a783          	lw	a5,0(a5)
     bd4:	0007a703          	lw	a4,0(a5)
     bd8:	fdc42783          	lw	a5,-36(s0)
     bdc:	00e7a023          	sw	a4,0(a5)
     be0:	fec42783          	lw	a5,-20(s0)
     be4:	0007a023          	sw	zero,0(a5)
     be8:	fec42783          	lw	a5,-20(s0)
     bec:	00078513          	mv	a0,a5
     bf0:	02c12403          	lw	s0,44(sp)
     bf4:	03010113          	add	sp,sp,48
     bf8:	00008067          	ret

00000bfc <core_list_undo_remove>:
     bfc:	fd010113          	add	sp,sp,-48
     c00:	02812623          	sw	s0,44(sp)
     c04:	03010413          	add	s0,sp,48
     c08:	fca42e23          	sw	a0,-36(s0)
     c0c:	fcb42c23          	sw	a1,-40(s0)
     c10:	fdc42783          	lw	a5,-36(s0)
     c14:	0047a783          	lw	a5,4(a5)
     c18:	fef42623          	sw	a5,-20(s0)
     c1c:	fd842783          	lw	a5,-40(s0)
     c20:	0047a703          	lw	a4,4(a5)
     c24:	fdc42783          	lw	a5,-36(s0)
     c28:	00e7a223          	sw	a4,4(a5)
     c2c:	fd842783          	lw	a5,-40(s0)
     c30:	fec42703          	lw	a4,-20(s0)
     c34:	00e7a223          	sw	a4,4(a5)
     c38:	fd842783          	lw	a5,-40(s0)
     c3c:	0007a703          	lw	a4,0(a5)
     c40:	fdc42783          	lw	a5,-36(s0)
     c44:	00e7a023          	sw	a4,0(a5)
     c48:	fd842783          	lw	a5,-40(s0)
     c4c:	fdc42703          	lw	a4,-36(s0)
     c50:	00e7a023          	sw	a4,0(a5)
     c54:	fdc42783          	lw	a5,-36(s0)
     c58:	00078513          	mv	a0,a5
     c5c:	02c12403          	lw	s0,44(sp)
     c60:	03010113          	add	sp,sp,48
     c64:	00008067          	ret

00000c68 <core_list_find>:
     c68:	fe010113          	add	sp,sp,-32
     c6c:	00812e23          	sw	s0,28(sp)
     c70:	02010413          	add	s0,sp,32
     c74:	fea42623          	sw	a0,-20(s0)
     c78:	feb42423          	sw	a1,-24(s0)
     c7c:	fe842783          	lw	a5,-24(s0)
     c80:	00279783          	lh	a5,2(a5)
     c84:	0407c463          	bltz	a5,ccc <core_list_find+0x64>
     c88:	0100006f          	j	c98 <core_list_find+0x30>
     c8c:	fec42783          	lw	a5,-20(s0)
     c90:	0007a783          	lw	a5,0(a5)
     c94:	fef42623          	sw	a5,-20(s0)
     c98:	fec42783          	lw	a5,-20(s0)
     c9c:	00078e63          	beqz	a5,cb8 <core_list_find+0x50>
     ca0:	fec42783          	lw	a5,-20(s0)
     ca4:	0047a783          	lw	a5,4(a5)
     ca8:	00279703          	lh	a4,2(a5)
     cac:	fe842783          	lw	a5,-24(s0)
     cb0:	00279783          	lh	a5,2(a5)
     cb4:	fcf71ce3          	bne	a4,a5,c8c <core_list_find+0x24>
     cb8:	fec42783          	lw	a5,-20(s0)
     cbc:	0400006f          	j	cfc <core_list_find+0x94>
     cc0:	fec42783          	lw	a5,-20(s0)
     cc4:	0007a783          	lw	a5,0(a5)
     cc8:	fef42623          	sw	a5,-20(s0)
     ccc:	fec42783          	lw	a5,-20(s0)
     cd0:	02078463          	beqz	a5,cf8 <core_list_find+0x90>
     cd4:	fec42783          	lw	a5,-20(s0)
     cd8:	0047a783          	lw	a5,4(a5)
     cdc:	00079783          	lh	a5,0(a5)
     ce0:	01079793          	sll	a5,a5,0x10
     ce4:	0107d793          	srl	a5,a5,0x10
     ce8:	0ff7f793          	zext.b	a5,a5
     cec:	fe842703          	lw	a4,-24(s0)
     cf0:	00071703          	lh	a4,0(a4)
     cf4:	fce796e3          	bne	a5,a4,cc0 <core_list_find+0x58>
     cf8:	fec42783          	lw	a5,-20(s0)
     cfc:	00078513          	mv	a0,a5
     d00:	01c12403          	lw	s0,28(sp)
     d04:	02010113          	add	sp,sp,32
     d08:	00008067          	ret

00000d0c <core_list_reverse>:
     d0c:	fd010113          	add	sp,sp,-48
     d10:	02812623          	sw	s0,44(sp)
     d14:	03010413          	add	s0,sp,48
     d18:	fca42e23          	sw	a0,-36(s0)
     d1c:	fe042623          	sw	zero,-20(s0)
     d20:	02c0006f          	j	d4c <core_list_reverse+0x40>
     d24:	fdc42783          	lw	a5,-36(s0)
     d28:	0007a783          	lw	a5,0(a5)
     d2c:	fef42423          	sw	a5,-24(s0)
     d30:	fdc42783          	lw	a5,-36(s0)
     d34:	fec42703          	lw	a4,-20(s0)
     d38:	00e7a023          	sw	a4,0(a5)
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	fef42623          	sw	a5,-20(s0)
     d44:	fe842783          	lw	a5,-24(s0)
     d48:	fcf42e23          	sw	a5,-36(s0)
     d4c:	fdc42783          	lw	a5,-36(s0)
     d50:	fc079ae3          	bnez	a5,d24 <core_list_reverse+0x18>
     d54:	fec42783          	lw	a5,-20(s0)
     d58:	00078513          	mv	a0,a5
     d5c:	02c12403          	lw	s0,44(sp)
     d60:	03010113          	add	sp,sp,48
     d64:	00008067          	ret

00000d68 <core_list_mergesort>:
     d68:	fb010113          	add	sp,sp,-80
     d6c:	04112623          	sw	ra,76(sp)
     d70:	04812423          	sw	s0,72(sp)
     d74:	05010413          	add	s0,sp,80
     d78:	faa42e23          	sw	a0,-68(s0)
     d7c:	fab42c23          	sw	a1,-72(s0)
     d80:	fac42a23          	sw	a2,-76(s0)
     d84:	00100793          	li	a5,1
     d88:	fcf42e23          	sw	a5,-36(s0)
     d8c:	fbc42783          	lw	a5,-68(s0)
     d90:	fef42623          	sw	a5,-20(s0)
     d94:	fa042e23          	sw	zero,-68(s0)
     d98:	fe042023          	sw	zero,-32(s0)
     d9c:	fc042c23          	sw	zero,-40(s0)
     da0:	1880006f          	j	f28 <core_list_mergesort+0x1c0>
     da4:	fd842783          	lw	a5,-40(s0)
     da8:	00178793          	add	a5,a5,1
     dac:	fcf42c23          	sw	a5,-40(s0)
     db0:	fec42783          	lw	a5,-20(s0)
     db4:	fef42423          	sw	a5,-24(s0)
     db8:	fc042a23          	sw	zero,-44(s0)
     dbc:	fc042623          	sw	zero,-52(s0)
     dc0:	0300006f          	j	df0 <core_list_mergesort+0x88>
     dc4:	fd442783          	lw	a5,-44(s0)
     dc8:	00178793          	add	a5,a5,1
     dcc:	fcf42a23          	sw	a5,-44(s0)
     dd0:	fe842783          	lw	a5,-24(s0)
     dd4:	0007a783          	lw	a5,0(a5)
     dd8:	fef42423          	sw	a5,-24(s0)
     ddc:	fe842783          	lw	a5,-24(s0)
     de0:	02078063          	beqz	a5,e00 <core_list_mergesort+0x98>
     de4:	fcc42783          	lw	a5,-52(s0)
     de8:	00178793          	add	a5,a5,1
     dec:	fcf42623          	sw	a5,-52(s0)
     df0:	fcc42703          	lw	a4,-52(s0)
     df4:	fdc42783          	lw	a5,-36(s0)
     df8:	fcf746e3          	blt	a4,a5,dc4 <core_list_mergesort+0x5c>
     dfc:	0080006f          	j	e04 <core_list_mergesort+0x9c>
     e00:	00000013          	nop
     e04:	fdc42783          	lw	a5,-36(s0)
     e08:	fcf42823          	sw	a5,-48(s0)
     e0c:	0fc0006f          	j	f08 <core_list_mergesort+0x1a0>
     e10:	fd442783          	lw	a5,-44(s0)
     e14:	02079463          	bnez	a5,e3c <core_list_mergesort+0xd4>
     e18:	fe842783          	lw	a5,-24(s0)
     e1c:	fef42223          	sw	a5,-28(s0)
     e20:	fe842783          	lw	a5,-24(s0)
     e24:	0007a783          	lw	a5,0(a5)
     e28:	fef42423          	sw	a5,-24(s0)
     e2c:	fd042783          	lw	a5,-48(s0)
     e30:	fff78793          	add	a5,a5,-1
     e34:	fcf42823          	sw	a5,-48(s0)
     e38:	0a80006f          	j	ee0 <core_list_mergesort+0x178>
     e3c:	fd042783          	lw	a5,-48(s0)
     e40:	00078663          	beqz	a5,e4c <core_list_mergesort+0xe4>
     e44:	fe842783          	lw	a5,-24(s0)
     e48:	02079463          	bnez	a5,e70 <core_list_mergesort+0x108>
     e4c:	fec42783          	lw	a5,-20(s0)
     e50:	fef42223          	sw	a5,-28(s0)
     e54:	fec42783          	lw	a5,-20(s0)
     e58:	0007a783          	lw	a5,0(a5)
     e5c:	fef42623          	sw	a5,-20(s0)
     e60:	fd442783          	lw	a5,-44(s0)
     e64:	fff78793          	add	a5,a5,-1
     e68:	fcf42a23          	sw	a5,-44(s0)
     e6c:	0740006f          	j	ee0 <core_list_mergesort+0x178>
     e70:	fec42783          	lw	a5,-20(s0)
     e74:	0047a703          	lw	a4,4(a5)
     e78:	fe842783          	lw	a5,-24(s0)
     e7c:	0047a683          	lw	a3,4(a5)
     e80:	fb842783          	lw	a5,-72(s0)
     e84:	fb442603          	lw	a2,-76(s0)
     e88:	00068593          	mv	a1,a3
     e8c:	00070513          	mv	a0,a4
     e90:	000780e7          	jalr	a5
     e94:	00050793          	mv	a5,a0
     e98:	02f04463          	bgtz	a5,ec0 <core_list_mergesort+0x158>
     e9c:	fec42783          	lw	a5,-20(s0)
     ea0:	fef42223          	sw	a5,-28(s0)
     ea4:	fec42783          	lw	a5,-20(s0)
     ea8:	0007a783          	lw	a5,0(a5)
     eac:	fef42623          	sw	a5,-20(s0)
     eb0:	fd442783          	lw	a5,-44(s0)
     eb4:	fff78793          	add	a5,a5,-1
     eb8:	fcf42a23          	sw	a5,-44(s0)
     ebc:	0240006f          	j	ee0 <core_list_mergesort+0x178>
     ec0:	fe842783          	lw	a5,-24(s0)
     ec4:	fef42223          	sw	a5,-28(s0)
     ec8:	fe842783          	lw	a5,-24(s0)
     ecc:	0007a783          	lw	a5,0(a5)
     ed0:	fef42423          	sw	a5,-24(s0)
     ed4:	fd042783          	lw	a5,-48(s0)
     ed8:	fff78793          	add	a5,a5,-1
     edc:	fcf42823          	sw	a5,-48(s0)
     ee0:	fe042783          	lw	a5,-32(s0)
     ee4:	00078a63          	beqz	a5,ef8 <core_list_mergesort+0x190>
     ee8:	fe042783          	lw	a5,-32(s0)
     eec:	fe442703          	lw	a4,-28(s0)
     ef0:	00e7a023          	sw	a4,0(a5)
     ef4:	00c0006f          	j	f00 <core_list_mergesort+0x198>
     ef8:	fe442783          	lw	a5,-28(s0)
     efc:	faf42e23          	sw	a5,-68(s0)
     f00:	fe442783          	lw	a5,-28(s0)
     f04:	fef42023          	sw	a5,-32(s0)
     f08:	fd442783          	lw	a5,-44(s0)
     f0c:	f0f042e3          	bgtz	a5,e10 <core_list_mergesort+0xa8>
     f10:	fd042783          	lw	a5,-48(s0)
     f14:	00f05663          	blez	a5,f20 <core_list_mergesort+0x1b8>
     f18:	fe842783          	lw	a5,-24(s0)
     f1c:	ee079ae3          	bnez	a5,e10 <core_list_mergesort+0xa8>
     f20:	fe842783          	lw	a5,-24(s0)
     f24:	fef42623          	sw	a5,-20(s0)
     f28:	fec42783          	lw	a5,-20(s0)
     f2c:	e6079ce3          	bnez	a5,da4 <core_list_mergesort+0x3c>
     f30:	fe042783          	lw	a5,-32(s0)
     f34:	0007a023          	sw	zero,0(a5)
     f38:	fd842703          	lw	a4,-40(s0)
     f3c:	00100793          	li	a5,1
     f40:	00e7c663          	blt	a5,a4,f4c <core_list_mergesort+0x1e4>
     f44:	fbc42783          	lw	a5,-68(s0)
     f48:	0140006f          	j	f5c <core_list_mergesort+0x1f4>
     f4c:	fdc42783          	lw	a5,-36(s0)
     f50:	00179793          	sll	a5,a5,0x1
     f54:	fcf42e23          	sw	a5,-36(s0)
     f58:	e35ff06f          	j	d8c <core_list_mergesort+0x24>
     f5c:	00078513          	mv	a0,a5
     f60:	04c12083          	lw	ra,76(sp)
     f64:	04812403          	lw	s0,72(sp)
     f68:	05010113          	add	sp,sp,80
     f6c:	00008067          	ret

00000f70 <int_handler>:
     f70:	ff010113          	add	sp,sp,-16
     f74:	00812623          	sw	s0,12(sp)
     f78:	01010413          	add	s0,sp,16
     f7c:	00000013          	nop
     f80:	00c12403          	lw	s0,12(sp)
     f84:	01010113          	add	sp,sp,16
     f88:	00008067          	ret

00000f8c <iterate>:
     f8c:	fd010113          	add	sp,sp,-48
     f90:	02112623          	sw	ra,44(sp)
     f94:	02812423          	sw	s0,40(sp)
     f98:	03010413          	add	s0,sp,48
     f9c:	fca42e23          	sw	a0,-36(s0)
     fa0:	fdc42783          	lw	a5,-36(s0)
     fa4:	fef42423          	sw	a5,-24(s0)
     fa8:	fe842783          	lw	a5,-24(s0)
     fac:	01c7a783          	lw	a5,28(a5)
     fb0:	fef42223          	sw	a5,-28(s0)
     fb4:	fe842783          	lw	a5,-24(s0)
     fb8:	02079c23          	sh	zero,56(a5)
     fbc:	fe842783          	lw	a5,-24(s0)
     fc0:	02079d23          	sh	zero,58(a5)
     fc4:	fe842783          	lw	a5,-24(s0)
     fc8:	02079e23          	sh	zero,60(a5)
     fcc:	fe842783          	lw	a5,-24(s0)
     fd0:	02079f23          	sh	zero,62(a5)
     fd4:	fe042623          	sw	zero,-20(s0)
     fd8:	0a00006f          	j	1078 <iterate+0xec>
     fdc:	00100593          	li	a1,1
     fe0:	fe842503          	lw	a0,-24(s0)
     fe4:	cd4ff0ef          	jal	4b8 <core_bench_list>
     fe8:	00050793          	mv	a5,a0
     fec:	fef41123          	sh	a5,-30(s0)
     ff0:	fe842783          	lw	a5,-24(s0)
     ff4:	0387d703          	lhu	a4,56(a5)
     ff8:	fe245783          	lhu	a5,-30(s0)
     ffc:	00070593          	mv	a1,a4
    1000:	00078513          	mv	a0,a5
    1004:	169020ef          	jal	396c <crcu16>
    1008:	00050793          	mv	a5,a0
    100c:	00078713          	mv	a4,a5
    1010:	fe842783          	lw	a5,-24(s0)
    1014:	02e79c23          	sh	a4,56(a5)
    1018:	fff00593          	li	a1,-1
    101c:	fe842503          	lw	a0,-24(s0)
    1020:	c98ff0ef          	jal	4b8 <core_bench_list>
    1024:	00050793          	mv	a5,a0
    1028:	fef41123          	sh	a5,-30(s0)
    102c:	fe842783          	lw	a5,-24(s0)
    1030:	0387d703          	lhu	a4,56(a5)
    1034:	fe245783          	lhu	a5,-30(s0)
    1038:	00070593          	mv	a1,a4
    103c:	00078513          	mv	a0,a5
    1040:	12d020ef          	jal	396c <crcu16>
    1044:	00050793          	mv	a5,a0
    1048:	00078713          	mv	a4,a5
    104c:	fe842783          	lw	a5,-24(s0)
    1050:	02e79c23          	sh	a4,56(a5)
    1054:	fec42783          	lw	a5,-20(s0)
    1058:	00079a63          	bnez	a5,106c <iterate+0xe0>
    105c:	fe842783          	lw	a5,-24(s0)
    1060:	0387d703          	lhu	a4,56(a5)
    1064:	fe842783          	lw	a5,-24(s0)
    1068:	02e79d23          	sh	a4,58(a5)
    106c:	fec42783          	lw	a5,-20(s0)
    1070:	00178793          	add	a5,a5,1
    1074:	fef42623          	sw	a5,-20(s0)
    1078:	fec42703          	lw	a4,-20(s0)
    107c:	fe442783          	lw	a5,-28(s0)
    1080:	f4f76ee3          	bltu	a4,a5,fdc <iterate+0x50>
    1084:	00000793          	li	a5,0
    1088:	00078513          	mv	a0,a5
    108c:	02c12083          	lw	ra,44(sp)
    1090:	02812403          	lw	s0,40(sp)
    1094:	03010113          	add	sp,sp,48
    1098:	00008067          	ret

0000109c <main>:
    109c:	81010113          	add	sp,sp,-2032
    10a0:	7e112623          	sw	ra,2028(sp)
    10a4:	7e812423          	sw	s0,2024(sp)
    10a8:	7e912223          	sw	s1,2020(sp)
    10ac:	7f212023          	sw	s2,2016(sp)
    10b0:	7d312e23          	sw	s3,2012(sp)
    10b4:	7f010413          	add	s0,sp,2032
    10b8:	f8010113          	add	sp,sp,-128
    10bc:	fffff7b7          	lui	a5,0xfffff
    10c0:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73fc>
    10c4:	008787b3          	add	a5,a5,s0
    10c8:	7aa7ae23          	sw	a0,1980(a5)
    10cc:	fffff7b7          	lui	a5,0xfffff
    10d0:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73fc>
    10d4:	008787b3          	add	a5,a5,s0
    10d8:	7ab7ac23          	sw	a1,1976(a5)
    10dc:	fc041e23          	sh	zero,-36(s0)
    10e0:	fc041d23          	sh	zero,-38(s0)
    10e4:	fff00793          	li	a5,-1
    10e8:	fcf41c23          	sh	a5,-40(s0)
    10ec:	fc041b23          	sh	zero,-42(s0)
    10f0:	fc041123          	sh	zero,-62(s0)
    10f4:	fffff7b7          	lui	a5,0xfffff
    10f8:	fe078793          	add	a5,a5,-32 # ffffefe0 <__subdf3+0xffff73fc>
    10fc:	008787b3          	add	a5,a5,s0
    1100:	fffff737          	lui	a4,0xfffff
    1104:	7bc70713          	add	a4,a4,1980 # fffff7bc <__subdf3+0xffff7bd8>
    1108:	fe070713          	add	a4,a4,-32
    110c:	008706b3          	add	a3,a4,s0
    1110:	f7840713          	add	a4,s0,-136
    1114:	04270713          	add	a4,a4,66
    1118:	7b87a603          	lw	a2,1976(a5)
    111c:	00068593          	mv	a1,a3
    1120:	00070513          	mv	a0,a4
    1124:	501010ef          	jal	2e24 <portable_init>
    1128:	00100513          	li	a0,1
    112c:	69c020ef          	jal	37c8 <get_seed_32>
    1130:	00050793          	mv	a5,a0
    1134:	01079793          	sll	a5,a5,0x10
    1138:	4107d793          	sra	a5,a5,0x10
    113c:	f6f41c23          	sh	a5,-136(s0)
    1140:	00200513          	li	a0,2
    1144:	684020ef          	jal	37c8 <get_seed_32>
    1148:	00050793          	mv	a5,a0
    114c:	01079793          	sll	a5,a5,0x10
    1150:	4107d793          	sra	a5,a5,0x10
    1154:	f6f41d23          	sh	a5,-134(s0)
    1158:	00300513          	li	a0,3
    115c:	66c020ef          	jal	37c8 <get_seed_32>
    1160:	00050793          	mv	a5,a0
    1164:	01079793          	sll	a5,a5,0x10
    1168:	4107d793          	sra	a5,a5,0x10
    116c:	f6f41e23          	sh	a5,-132(s0)
    1170:	00400513          	li	a0,4
    1174:	654020ef          	jal	37c8 <get_seed_32>
    1178:	00050793          	mv	a5,a0
    117c:	f8f42a23          	sw	a5,-108(s0)
    1180:	00500513          	li	a0,5
    1184:	644020ef          	jal	37c8 <get_seed_32>
    1188:	00050793          	mv	a5,a0
    118c:	f8f42c23          	sw	a5,-104(s0)
    1190:	f9842783          	lw	a5,-104(s0)
    1194:	00079663          	bnez	a5,11a0 <main+0x104>
    1198:	00700793          	li	a5,7
    119c:	f8f42c23          	sw	a5,-104(s0)
    11a0:	f7841783          	lh	a5,-136(s0)
    11a4:	02079263          	bnez	a5,11c8 <main+0x12c>
    11a8:	f7a41783          	lh	a5,-134(s0)
    11ac:	00079e63          	bnez	a5,11c8 <main+0x12c>
    11b0:	f7c41783          	lh	a5,-132(s0)
    11b4:	00079a63          	bnez	a5,11c8 <main+0x12c>
    11b8:	f6041c23          	sh	zero,-136(s0)
    11bc:	f6041d23          	sh	zero,-134(s0)
    11c0:	06600793          	li	a5,102
    11c4:	f6f41e23          	sh	a5,-132(s0)
    11c8:	f7841703          	lh	a4,-136(s0)
    11cc:	00100793          	li	a5,1
    11d0:	02f71a63          	bne	a4,a5,1204 <main+0x168>
    11d4:	f7a41783          	lh	a5,-134(s0)
    11d8:	02079663          	bnez	a5,1204 <main+0x168>
    11dc:	f7c41783          	lh	a5,-132(s0)
    11e0:	02079263          	bnez	a5,1204 <main+0x168>
    11e4:	000037b7          	lui	a5,0x3
    11e8:	41578793          	add	a5,a5,1045 # 3415 <ee_isdigit+0x35>
    11ec:	f6f41c23          	sh	a5,-136(s0)
    11f0:	000037b7          	lui	a5,0x3
    11f4:	41578793          	add	a5,a5,1045 # 3415 <ee_isdigit+0x35>
    11f8:	f6f41d23          	sh	a5,-134(s0)
    11fc:	06600793          	li	a5,102
    1200:	f6f41e23          	sh	a5,-132(s0)
    1204:	fc041f23          	sh	zero,-34(s0)
    1208:	1380006f          	j	1340 <main+0x2a4>
    120c:	fde45703          	lhu	a4,-34(s0)
    1210:	00070793          	mv	a5,a4
    1214:	00579793          	sll	a5,a5,0x5
    1218:	40e787b3          	sub	a5,a5,a4
    121c:	00279793          	sll	a5,a5,0x2
    1220:	00e787b3          	add	a5,a5,a4
    1224:	00479793          	sll	a5,a5,0x4
    1228:	00078693          	mv	a3,a5
    122c:	fde45703          	lhu	a4,-34(s0)
    1230:	fffff7b7          	lui	a5,0xfffff
    1234:	7c878793          	add	a5,a5,1992 # fffff7c8 <__subdf3+0xffff7be4>
    1238:	fe078793          	add	a5,a5,-32
    123c:	008787b3          	add	a5,a5,s0
    1240:	00d786b3          	add	a3,a5,a3
    1244:	00070793          	mv	a5,a4
    1248:	00479793          	sll	a5,a5,0x4
    124c:	00e787b3          	add	a5,a5,a4
    1250:	00279793          	sll	a5,a5,0x2
    1254:	fe078793          	add	a5,a5,-32
    1258:	008787b3          	add	a5,a5,s0
    125c:	fad7a023          	sw	a3,-96(a5)
    1260:	fde45703          	lhu	a4,-34(s0)
    1264:	00070793          	mv	a5,a4
    1268:	00479793          	sll	a5,a5,0x4
    126c:	00e787b3          	add	a5,a5,a4
    1270:	00279793          	sll	a5,a5,0x2
    1274:	fe078793          	add	a5,a5,-32
    1278:	008787b3          	add	a5,a5,s0
    127c:	7d000713          	li	a4,2000
    1280:	fae7a823          	sw	a4,-80(a5)
    1284:	fde45703          	lhu	a4,-34(s0)
    1288:	f7841683          	lh	a3,-136(s0)
    128c:	00070793          	mv	a5,a4
    1290:	00479793          	sll	a5,a5,0x4
    1294:	00e787b3          	add	a5,a5,a4
    1298:	00279793          	sll	a5,a5,0x2
    129c:	fe078793          	add	a5,a5,-32
    12a0:	008787b3          	add	a5,a5,s0
    12a4:	f8d79c23          	sh	a3,-104(a5)
    12a8:	fde45703          	lhu	a4,-34(s0)
    12ac:	f7a41683          	lh	a3,-134(s0)
    12b0:	00070793          	mv	a5,a4
    12b4:	00479793          	sll	a5,a5,0x4
    12b8:	00e787b3          	add	a5,a5,a4
    12bc:	00279793          	sll	a5,a5,0x2
    12c0:	fe078793          	add	a5,a5,-32
    12c4:	008787b3          	add	a5,a5,s0
    12c8:	f8d79d23          	sh	a3,-102(a5)
    12cc:	fde45703          	lhu	a4,-34(s0)
    12d0:	f7c41683          	lh	a3,-132(s0)
    12d4:	00070793          	mv	a5,a4
    12d8:	00479793          	sll	a5,a5,0x4
    12dc:	00e787b3          	add	a5,a5,a4
    12e0:	00279793          	sll	a5,a5,0x2
    12e4:	fe078793          	add	a5,a5,-32
    12e8:	008787b3          	add	a5,a5,s0
    12ec:	f8d79e23          	sh	a3,-100(a5)
    12f0:	fde45703          	lhu	a4,-34(s0)
    12f4:	00070793          	mv	a5,a4
    12f8:	00479793          	sll	a5,a5,0x4
    12fc:	00e787b3          	add	a5,a5,a4
    1300:	00279793          	sll	a5,a5,0x2
    1304:	fe078793          	add	a5,a5,-32
    1308:	008787b3          	add	a5,a5,s0
    130c:	fc079c23          	sh	zero,-40(a5)
    1310:	fde45703          	lhu	a4,-34(s0)
    1314:	f9842683          	lw	a3,-104(s0)
    1318:	00070793          	mv	a5,a4
    131c:	00479793          	sll	a5,a5,0x4
    1320:	00e787b3          	add	a5,a5,a4
    1324:	00279793          	sll	a5,a5,0x2
    1328:	fe078793          	add	a5,a5,-32
    132c:	008787b3          	add	a5,a5,s0
    1330:	fad7ac23          	sw	a3,-72(a5)
    1334:	fde45783          	lhu	a5,-34(s0)
    1338:	00178793          	add	a5,a5,1
    133c:	fcf41f23          	sh	a5,-34(s0)
    1340:	fde45783          	lhu	a5,-34(s0)
    1344:	ec0784e3          	beqz	a5,120c <main+0x170>
    1348:	fc041f23          	sh	zero,-34(s0)
    134c:	0380006f          	j	1384 <main+0x2e8>
    1350:	fde45783          	lhu	a5,-34(s0)
    1354:	00100713          	li	a4,1
    1358:	00f717b3          	sll	a5,a4,a5
    135c:	00078713          	mv	a4,a5
    1360:	f9842783          	lw	a5,-104(s0)
    1364:	00f777b3          	and	a5,a4,a5
    1368:	00078863          	beqz	a5,1378 <main+0x2dc>
    136c:	fda45783          	lhu	a5,-38(s0)
    1370:	00178793          	add	a5,a5,1
    1374:	fcf41d23          	sh	a5,-38(s0)
    1378:	fde45783          	lhu	a5,-34(s0)
    137c:	00178793          	add	a5,a5,1
    1380:	fcf41f23          	sh	a5,-34(s0)
    1384:	fde45703          	lhu	a4,-34(s0)
    1388:	00200793          	li	a5,2
    138c:	fce7f2e3          	bgeu	a5,a4,1350 <main+0x2b4>
    1390:	fc041f23          	sh	zero,-34(s0)
    1394:	0680006f          	j	13fc <main+0x360>
    1398:	fde45703          	lhu	a4,-34(s0)
    139c:	00070793          	mv	a5,a4
    13a0:	00479793          	sll	a5,a5,0x4
    13a4:	00e787b3          	add	a5,a5,a4
    13a8:	00279793          	sll	a5,a5,0x2
    13ac:	fe078793          	add	a5,a5,-32
    13b0:	008787b3          	add	a5,a5,s0
    13b4:	fb07a783          	lw	a5,-80(a5)
    13b8:	fda45703          	lhu	a4,-38(s0)
    13bc:	fde45483          	lhu	s1,-34(s0)
    13c0:	00070593          	mv	a1,a4
    13c4:	00078513          	mv	a0,a5
    13c8:	4fc060ef          	jal	78c4 <__hidden___udivsi3>
    13cc:	00050793          	mv	a5,a0
    13d0:	00078713          	mv	a4,a5
    13d4:	00048793          	mv	a5,s1
    13d8:	00479793          	sll	a5,a5,0x4
    13dc:	009787b3          	add	a5,a5,s1
    13e0:	00279793          	sll	a5,a5,0x2
    13e4:	fe078793          	add	a5,a5,-32
    13e8:	008787b3          	add	a5,a5,s0
    13ec:	fae7a823          	sw	a4,-80(a5)
    13f0:	fde45783          	lhu	a5,-34(s0)
    13f4:	00178793          	add	a5,a5,1
    13f8:	fcf41f23          	sh	a5,-34(s0)
    13fc:	fde45783          	lhu	a5,-34(s0)
    1400:	f8078ce3          	beqz	a5,1398 <main+0x2fc>
    1404:	fc041f23          	sh	zero,-34(s0)
    1408:	0c00006f          	j	14c8 <main+0x42c>
    140c:	fde45783          	lhu	a5,-34(s0)
    1410:	00100713          	li	a4,1
    1414:	00f717b3          	sll	a5,a4,a5
    1418:	00078713          	mv	a4,a5
    141c:	f9842783          	lw	a5,-104(s0)
    1420:	00f777b3          	and	a5,a4,a5
    1424:	08078c63          	beqz	a5,14bc <main+0x420>
    1428:	fc042823          	sw	zero,-48(s0)
    142c:	07c0006f          	j	14a8 <main+0x40c>
    1430:	fd042703          	lw	a4,-48(s0)
    1434:	00070793          	mv	a5,a4
    1438:	00479793          	sll	a5,a5,0x4
    143c:	00e787b3          	add	a5,a5,a4
    1440:	00279793          	sll	a5,a5,0x2
    1444:	fe078793          	add	a5,a5,-32
    1448:	008787b3          	add	a5,a5,s0
    144c:	fa07a483          	lw	s1,-96(a5)
    1450:	f9042783          	lw	a5,-112(s0)
    1454:	fdc45703          	lhu	a4,-36(s0)
    1458:	00070593          	mv	a1,a4
    145c:	00078513          	mv	a0,a5
    1460:	438060ef          	jal	7898 <__mulsi3>
    1464:	00050793          	mv	a5,a0
    1468:	00078713          	mv	a4,a5
    146c:	fde45783          	lhu	a5,-34(s0)
    1470:	00178613          	add	a2,a5,1
    1474:	00e486b3          	add	a3,s1,a4
    1478:	fd042703          	lw	a4,-48(s0)
    147c:	00070793          	mv	a5,a4
    1480:	00479793          	sll	a5,a5,0x4
    1484:	00e787b3          	add	a5,a5,a4
    1488:	00c787b3          	add	a5,a5,a2
    148c:	00279793          	sll	a5,a5,0x2
    1490:	fe078793          	add	a5,a5,-32
    1494:	008787b3          	add	a5,a5,s0
    1498:	fad7a023          	sw	a3,-96(a5)
    149c:	fd042783          	lw	a5,-48(s0)
    14a0:	00178793          	add	a5,a5,1
    14a4:	fcf42823          	sw	a5,-48(s0)
    14a8:	fd042783          	lw	a5,-48(s0)
    14ac:	f80782e3          	beqz	a5,1430 <main+0x394>
    14b0:	fdc45783          	lhu	a5,-36(s0)
    14b4:	00178793          	add	a5,a5,1
    14b8:	fcf41e23          	sh	a5,-36(s0)
    14bc:	fde45783          	lhu	a5,-34(s0)
    14c0:	00178793          	add	a5,a5,1
    14c4:	fcf41f23          	sh	a5,-34(s0)
    14c8:	fde45703          	lhu	a4,-34(s0)
    14cc:	00200793          	li	a5,2
    14d0:	f2e7fee3          	bgeu	a5,a4,140c <main+0x370>
    14d4:	fc041f23          	sh	zero,-34(s0)
    14d8:	1e80006f          	j	16c0 <main+0x624>
    14dc:	fde45703          	lhu	a4,-34(s0)
    14e0:	00070793          	mv	a5,a4
    14e4:	00479793          	sll	a5,a5,0x4
    14e8:	00e787b3          	add	a5,a5,a4
    14ec:	00279793          	sll	a5,a5,0x2
    14f0:	fe078793          	add	a5,a5,-32
    14f4:	008787b3          	add	a5,a5,s0
    14f8:	fb87a783          	lw	a5,-72(a5)
    14fc:	0017f793          	and	a5,a5,1
    1500:	06078c63          	beqz	a5,1578 <main+0x4dc>
    1504:	f9042683          	lw	a3,-112(s0)
    1508:	fde45703          	lhu	a4,-34(s0)
    150c:	00070793          	mv	a5,a4
    1510:	00479793          	sll	a5,a5,0x4
    1514:	00e787b3          	add	a5,a5,a4
    1518:	00279793          	sll	a5,a5,0x2
    151c:	fe078793          	add	a5,a5,-32
    1520:	008787b3          	add	a5,a5,s0
    1524:	fa47a583          	lw	a1,-92(a5)
    1528:	fde45703          	lhu	a4,-34(s0)
    152c:	00070793          	mv	a5,a4
    1530:	00479793          	sll	a5,a5,0x4
    1534:	00e787b3          	add	a5,a5,a4
    1538:	00279793          	sll	a5,a5,0x2
    153c:	fe078793          	add	a5,a5,-32
    1540:	008787b3          	add	a5,a5,s0
    1544:	f9879783          	lh	a5,-104(a5)
    1548:	fde45483          	lhu	s1,-34(s0)
    154c:	00078613          	mv	a2,a5
    1550:	00068513          	mv	a0,a3
    1554:	a84ff0ef          	jal	7d8 <core_list_init>
    1558:	00050713          	mv	a4,a0
    155c:	00048793          	mv	a5,s1
    1560:	00479793          	sll	a5,a5,0x4
    1564:	009787b3          	add	a5,a5,s1
    1568:	00279793          	sll	a5,a5,0x2
    156c:	fe078793          	add	a5,a5,-32
    1570:	008787b3          	add	a5,a5,s0
    1574:	fae7ae23          	sw	a4,-68(a5)
    1578:	fde45703          	lhu	a4,-34(s0)
    157c:	00070793          	mv	a5,a4
    1580:	00479793          	sll	a5,a5,0x4
    1584:	00e787b3          	add	a5,a5,a4
    1588:	00279793          	sll	a5,a5,0x2
    158c:	fe078793          	add	a5,a5,-32
    1590:	008787b3          	add	a5,a5,s0
    1594:	fb87a783          	lw	a5,-72(a5)
    1598:	0027f793          	and	a5,a5,2
    159c:	0a078063          	beqz	a5,163c <main+0x5a0>
    15a0:	f9042503          	lw	a0,-112(s0)
    15a4:	fde45703          	lhu	a4,-34(s0)
    15a8:	00070793          	mv	a5,a4
    15ac:	00479793          	sll	a5,a5,0x4
    15b0:	00e787b3          	add	a5,a5,a4
    15b4:	00279793          	sll	a5,a5,0x2
    15b8:	fe078793          	add	a5,a5,-32
    15bc:	008787b3          	add	a5,a5,s0
    15c0:	fa87a583          	lw	a1,-88(a5)
    15c4:	fde45703          	lhu	a4,-34(s0)
    15c8:	00070793          	mv	a5,a4
    15cc:	00479793          	sll	a5,a5,0x4
    15d0:	00e787b3          	add	a5,a5,a4
    15d4:	00279793          	sll	a5,a5,0x2
    15d8:	fe078793          	add	a5,a5,-32
    15dc:	008787b3          	add	a5,a5,s0
    15e0:	f9879783          	lh	a5,-104(a5)
    15e4:	00078693          	mv	a3,a5
    15e8:	fde45703          	lhu	a4,-34(s0)
    15ec:	00070793          	mv	a5,a4
    15f0:	00479793          	sll	a5,a5,0x4
    15f4:	00e787b3          	add	a5,a5,a4
    15f8:	00279793          	sll	a5,a5,0x2
    15fc:	fe078793          	add	a5,a5,-32
    1600:	008787b3          	add	a5,a5,s0
    1604:	f9a79783          	lh	a5,-102(a5)
    1608:	01079793          	sll	a5,a5,0x10
    160c:	00f6e633          	or	a2,a3,a5
    1610:	fde45703          	lhu	a4,-34(s0)
    1614:	f7840693          	add	a3,s0,-136
    1618:	00070793          	mv	a5,a4
    161c:	00479793          	sll	a5,a5,0x4
    1620:	00e787b3          	add	a5,a5,a4
    1624:	00279793          	sll	a5,a5,0x2
    1628:	02078793          	add	a5,a5,32
    162c:	00f687b3          	add	a5,a3,a5
    1630:	00878793          	add	a5,a5,8
    1634:	00078693          	mv	a3,a5
    1638:	4b9000ef          	jal	22f0 <core_init_matrix>
    163c:	fde45703          	lhu	a4,-34(s0)
    1640:	00070793          	mv	a5,a4
    1644:	00479793          	sll	a5,a5,0x4
    1648:	00e787b3          	add	a5,a5,a4
    164c:	00279793          	sll	a5,a5,0x2
    1650:	fe078793          	add	a5,a5,-32
    1654:	008787b3          	add	a5,a5,s0
    1658:	fb87a783          	lw	a5,-72(a5)
    165c:	0047f793          	and	a5,a5,4
    1660:	04078a63          	beqz	a5,16b4 <main+0x618>
    1664:	f9042683          	lw	a3,-112(s0)
    1668:	fde45703          	lhu	a4,-34(s0)
    166c:	00070793          	mv	a5,a4
    1670:	00479793          	sll	a5,a5,0x4
    1674:	00e787b3          	add	a5,a5,a4
    1678:	00279793          	sll	a5,a5,0x2
    167c:	fe078793          	add	a5,a5,-32
    1680:	008787b3          	add	a5,a5,s0
    1684:	f9879583          	lh	a1,-104(a5)
    1688:	fde45703          	lhu	a4,-34(s0)
    168c:	00070793          	mv	a5,a4
    1690:	00479793          	sll	a5,a5,0x4
    1694:	00e787b3          	add	a5,a5,a4
    1698:	00279793          	sll	a5,a5,0x2
    169c:	fe078793          	add	a5,a5,-32
    16a0:	008787b3          	add	a5,a5,s0
    16a4:	fac7a783          	lw	a5,-84(a5)
    16a8:	00078613          	mv	a2,a5
    16ac:	00068513          	mv	a0,a3
    16b0:	2b9010ef          	jal	3168 <core_init_state>
    16b4:	fde45783          	lhu	a5,-34(s0)
    16b8:	00178793          	add	a5,a5,1
    16bc:	fcf41f23          	sh	a5,-34(s0)
    16c0:	fde45783          	lhu	a5,-34(s0)
    16c4:	e0078ce3          	beqz	a5,14dc <main+0x440>
    16c8:	f9442783          	lw	a5,-108(s0)
    16cc:	0c079863          	bnez	a5,179c <main+0x700>
    16d0:	00000713          	li	a4,0
    16d4:	00000793          	li	a5,0
    16d8:	fce42423          	sw	a4,-56(s0)
    16dc:	fcf42623          	sw	a5,-52(s0)
    16e0:	00100793          	li	a5,1
    16e4:	f8f42a23          	sw	a5,-108(s0)
    16e8:	0480006f          	j	1730 <main+0x694>
    16ec:	f9442703          	lw	a4,-108(s0)
    16f0:	00070793          	mv	a5,a4
    16f4:	00279793          	sll	a5,a5,0x2
    16f8:	00e787b3          	add	a5,a5,a4
    16fc:	00179793          	sll	a5,a5,0x1
    1700:	f8f42a23          	sw	a5,-108(s0)
    1704:	618010ef          	jal	2d1c <start_time>
    1708:	f7840793          	add	a5,s0,-136
    170c:	00078513          	mv	a0,a5
    1710:	87dff0ef          	jal	f8c <iterate>
    1714:	63c010ef          	jal	2d50 <stop_time>
    1718:	66c010ef          	jal	2d84 <get_time>
    171c:	00050793          	mv	a5,a0
    1720:	00078513          	mv	a0,a5
    1724:	698010ef          	jal	2dbc <time_in_secs>
    1728:	fca42423          	sw	a0,-56(s0)
    172c:	fcb42623          	sw	a1,-52(s0)
    1730:	47802603          	lw	a2,1144(zero) # 478 <copy_info+0x4>
    1734:	47c02683          	lw	a3,1148(zero) # 47c <copy_info+0x8>
    1738:	fc842503          	lw	a0,-56(s0)
    173c:	fcc42583          	lw	a1,-52(s0)
    1740:	704050ef          	jal	6e44 <__ledf2>
    1744:	00050793          	mv	a5,a0
    1748:	fa07c2e3          	bltz	a5,16ec <main+0x650>
    174c:	fc842503          	lw	a0,-56(s0)
    1750:	fcc42583          	lw	a1,-52(s0)
    1754:	00c060ef          	jal	7760 <__fixunsdfsi>
    1758:	00050793          	mv	a5,a0
    175c:	fcf42223          	sw	a5,-60(s0)
    1760:	fc442783          	lw	a5,-60(s0)
    1764:	00079663          	bnez	a5,1770 <main+0x6d4>
    1768:	00100793          	li	a5,1
    176c:	fcf42223          	sw	a5,-60(s0)
    1770:	f9442483          	lw	s1,-108(s0)
    1774:	fc442583          	lw	a1,-60(s0)
    1778:	00a00513          	li	a0,10
    177c:	148060ef          	jal	78c4 <__hidden___udivsi3>
    1780:	00050793          	mv	a5,a0
    1784:	00178793          	add	a5,a5,1
    1788:	00078593          	mv	a1,a5
    178c:	00048513          	mv	a0,s1
    1790:	108060ef          	jal	7898 <__mulsi3>
    1794:	00050793          	mv	a5,a0
    1798:	f8f42a23          	sw	a5,-108(s0)
    179c:	580010ef          	jal	2d1c <start_time>
    17a0:	f7840793          	add	a5,s0,-136
    17a4:	00078513          	mv	a0,a5
    17a8:	fe4ff0ef          	jal	f8c <iterate>
    17ac:	5a4010ef          	jal	2d50 <stop_time>
    17b0:	5d4010ef          	jal	2d84 <get_time>
    17b4:	faa42e23          	sw	a0,-68(s0)
    17b8:	f7841783          	lh	a5,-136(s0)
    17bc:	fc245703          	lhu	a4,-62(s0)
    17c0:	00070593          	mv	a1,a4
    17c4:	00078513          	mv	a0,a5
    17c8:	2ac020ef          	jal	3a74 <crc16>
    17cc:	00050793          	mv	a5,a0
    17d0:	fcf41123          	sh	a5,-62(s0)
    17d4:	f7a41783          	lh	a5,-134(s0)
    17d8:	fc245703          	lhu	a4,-62(s0)
    17dc:	00070593          	mv	a1,a4
    17e0:	00078513          	mv	a0,a5
    17e4:	290020ef          	jal	3a74 <crc16>
    17e8:	00050793          	mv	a5,a0
    17ec:	fcf41123          	sh	a5,-62(s0)
    17f0:	f7c41783          	lh	a5,-132(s0)
    17f4:	fc245703          	lhu	a4,-62(s0)
    17f8:	00070593          	mv	a1,a4
    17fc:	00078513          	mv	a0,a5
    1800:	274020ef          	jal	3a74 <crc16>
    1804:	00050793          	mv	a5,a0
    1808:	fcf41123          	sh	a5,-62(s0)
    180c:	f9042783          	lw	a5,-112(s0)
    1810:	01079793          	sll	a5,a5,0x10
    1814:	4107d793          	sra	a5,a5,0x10
    1818:	fc245703          	lhu	a4,-62(s0)
    181c:	00070593          	mv	a1,a4
    1820:	00078513          	mv	a0,a5
    1824:	250020ef          	jal	3a74 <crc16>
    1828:	00050793          	mv	a5,a0
    182c:	fcf41123          	sh	a5,-62(s0)
    1830:	fc245783          	lhu	a5,-62(s0)
    1834:	0000f737          	lui	a4,0xf
    1838:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x6e11>
    183c:	08e78a63          	beq	a5,a4,18d0 <main+0x834>
    1840:	0000f737          	lui	a4,0xf
    1844:	9f570713          	add	a4,a4,-1547 # e9f5 <__subdf3+0x6e11>
    1848:	0af74863          	blt	a4,a5,18f8 <main+0x85c>
    184c:	00009737          	lui	a4,0x9
    1850:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0xe1e>
    1854:	04e78263          	beq	a5,a4,1898 <main+0x7fc>
    1858:	00009737          	lui	a4,0x9
    185c:	a0270713          	add	a4,a4,-1534 # 8a02 <__subdf3+0xe1e>
    1860:	08f74c63          	blt	a4,a5,18f8 <main+0x85c>
    1864:	00008737          	lui	a4,0x8
    1868:	b0570713          	add	a4,a4,-1275 # 7b05 <modf+0x119>
    186c:	02e78e63          	beq	a5,a4,18a8 <main+0x80c>
    1870:	00008737          	lui	a4,0x8
    1874:	b0570713          	add	a4,a4,-1275 # 7b05 <modf+0x119>
    1878:	08f74063          	blt	a4,a5,18f8 <main+0x85c>
    187c:	00002737          	lui	a4,0x2
    1880:	8f270713          	add	a4,a4,-1806 # 18f2 <main+0x856>
    1884:	06e78063          	beq	a5,a4,18e4 <main+0x848>
    1888:	00005737          	lui	a4,0x5
    188c:	eaf70713          	add	a4,a4,-337 # 4eaf <parse_float+0x44b>
    1890:	02e78663          	beq	a5,a4,18bc <main+0x820>
    1894:	0640006f          	j	18f8 <main+0x85c>
    1898:	fc041c23          	sh	zero,-40(s0)
    189c:	04800513          	li	a0,72
    18a0:	1f0040ef          	jal	5a90 <ee_printf>
    18a4:	0600006f          	j	1904 <main+0x868>
    18a8:	00100793          	li	a5,1
    18ac:	fcf41c23          	sh	a5,-40(s0)
    18b0:	07800513          	li	a0,120
    18b4:	1dc040ef          	jal	5a90 <ee_printf>
    18b8:	04c0006f          	j	1904 <main+0x868>
    18bc:	00200793          	li	a5,2
    18c0:	fcf41c23          	sh	a5,-40(s0)
    18c4:	0a400513          	li	a0,164
    18c8:	1c8040ef          	jal	5a90 <ee_printf>
    18cc:	0380006f          	j	1904 <main+0x868>
    18d0:	00300793          	li	a5,3
    18d4:	fcf41c23          	sh	a5,-40(s0)
    18d8:	0d800513          	li	a0,216
    18dc:	1b4040ef          	jal	5a90 <ee_printf>
    18e0:	0240006f          	j	1904 <main+0x868>
    18e4:	00400793          	li	a5,4
    18e8:	fcf41c23          	sh	a5,-40(s0)
    18ec:	10800513          	li	a0,264
    18f0:	1a0040ef          	jal	5a90 <ee_printf>
    18f4:	0100006f          	j	1904 <main+0x868>
    18f8:	fff00793          	li	a5,-1
    18fc:	fcf41b23          	sh	a5,-42(s0)
    1900:	00000013          	nop
    1904:	fd841783          	lh	a5,-40(s0)
    1908:	3807c063          	bltz	a5,1c88 <main+0xbec>
    190c:	fc041f23          	sh	zero,-34(s0)
    1910:	36c0006f          	j	1c7c <main+0xbe0>
    1914:	fde45703          	lhu	a4,-34(s0)
    1918:	00070793          	mv	a5,a4
    191c:	00479793          	sll	a5,a5,0x4
    1920:	00e787b3          	add	a5,a5,a4
    1924:	00279793          	sll	a5,a5,0x2
    1928:	fe078793          	add	a5,a5,-32
    192c:	008787b3          	add	a5,a5,s0
    1930:	fc079c23          	sh	zero,-40(a5)
    1934:	fde45703          	lhu	a4,-34(s0)
    1938:	00070793          	mv	a5,a4
    193c:	00479793          	sll	a5,a5,0x4
    1940:	00e787b3          	add	a5,a5,a4
    1944:	00279793          	sll	a5,a5,0x2
    1948:	fe078793          	add	a5,a5,-32
    194c:	008787b3          	add	a5,a5,s0
    1950:	fb87a783          	lw	a5,-72(a5)
    1954:	0017f793          	and	a5,a5,1
    1958:	0c078e63          	beqz	a5,1a34 <main+0x998>
    195c:	fde45703          	lhu	a4,-34(s0)
    1960:	00070793          	mv	a5,a4
    1964:	00479793          	sll	a5,a5,0x4
    1968:	00e787b3          	add	a5,a5,a4
    196c:	00279793          	sll	a5,a5,0x2
    1970:	fe078793          	add	a5,a5,-32
    1974:	008787b3          	add	a5,a5,s0
    1978:	fd27d703          	lhu	a4,-46(a5)
    197c:	fd841783          	lh	a5,-40(s0)
    1980:	00000693          	li	a3,0
    1984:	00179793          	sll	a5,a5,0x1
    1988:	00f687b3          	add	a5,a3,a5
    198c:	0007d783          	lhu	a5,0(a5)
    1990:	0af70263          	beq	a4,a5,1a34 <main+0x998>
    1994:	fde45583          	lhu	a1,-34(s0)
    1998:	fde45703          	lhu	a4,-34(s0)
    199c:	00070793          	mv	a5,a4
    19a0:	00479793          	sll	a5,a5,0x4
    19a4:	00e787b3          	add	a5,a5,a4
    19a8:	00279793          	sll	a5,a5,0x2
    19ac:	fe078793          	add	a5,a5,-32
    19b0:	008787b3          	add	a5,a5,s0
    19b4:	fd27d783          	lhu	a5,-46(a5)
    19b8:	00078613          	mv	a2,a5
    19bc:	fd841783          	lh	a5,-40(s0)
    19c0:	00000713          	li	a4,0
    19c4:	00179793          	sll	a5,a5,0x1
    19c8:	00f707b3          	add	a5,a4,a5
    19cc:	0007d783          	lhu	a5,0(a5)
    19d0:	00078693          	mv	a3,a5
    19d4:	13400513          	li	a0,308
    19d8:	0b8040ef          	jal	5a90 <ee_printf>
    19dc:	fde45703          	lhu	a4,-34(s0)
    19e0:	00070793          	mv	a5,a4
    19e4:	00479793          	sll	a5,a5,0x4
    19e8:	00e787b3          	add	a5,a5,a4
    19ec:	00279793          	sll	a5,a5,0x2
    19f0:	fe078793          	add	a5,a5,-32
    19f4:	008787b3          	add	a5,a5,s0
    19f8:	fd879783          	lh	a5,-40(a5)
    19fc:	01079793          	sll	a5,a5,0x10
    1a00:	0107d793          	srl	a5,a5,0x10
    1a04:	00178793          	add	a5,a5,1
    1a08:	01079793          	sll	a5,a5,0x10
    1a0c:	0107d793          	srl	a5,a5,0x10
    1a10:	01079693          	sll	a3,a5,0x10
    1a14:	4106d693          	sra	a3,a3,0x10
    1a18:	00070793          	mv	a5,a4
    1a1c:	00479793          	sll	a5,a5,0x4
    1a20:	00e787b3          	add	a5,a5,a4
    1a24:	00279793          	sll	a5,a5,0x2
    1a28:	fe078793          	add	a5,a5,-32
    1a2c:	008787b3          	add	a5,a5,s0
    1a30:	fcd79c23          	sh	a3,-40(a5)
    1a34:	fde45703          	lhu	a4,-34(s0)
    1a38:	00070793          	mv	a5,a4
    1a3c:	00479793          	sll	a5,a5,0x4
    1a40:	00e787b3          	add	a5,a5,a4
    1a44:	00279793          	sll	a5,a5,0x2
    1a48:	fe078793          	add	a5,a5,-32
    1a4c:	008787b3          	add	a5,a5,s0
    1a50:	fb87a783          	lw	a5,-72(a5)
    1a54:	0027f793          	and	a5,a5,2
    1a58:	0c078e63          	beqz	a5,1b34 <main+0xa98>
    1a5c:	fde45703          	lhu	a4,-34(s0)
    1a60:	00070793          	mv	a5,a4
    1a64:	00479793          	sll	a5,a5,0x4
    1a68:	00e787b3          	add	a5,a5,a4
    1a6c:	00279793          	sll	a5,a5,0x2
    1a70:	fe078793          	add	a5,a5,-32
    1a74:	008787b3          	add	a5,a5,s0
    1a78:	fd47d703          	lhu	a4,-44(a5)
    1a7c:	fd841783          	lh	a5,-40(s0)
    1a80:	00c00693          	li	a3,12
    1a84:	00179793          	sll	a5,a5,0x1
    1a88:	00f687b3          	add	a5,a3,a5
    1a8c:	0007d783          	lhu	a5,0(a5)
    1a90:	0af70263          	beq	a4,a5,1b34 <main+0xa98>
    1a94:	fde45583          	lhu	a1,-34(s0)
    1a98:	fde45703          	lhu	a4,-34(s0)
    1a9c:	00070793          	mv	a5,a4
    1aa0:	00479793          	sll	a5,a5,0x4
    1aa4:	00e787b3          	add	a5,a5,a4
    1aa8:	00279793          	sll	a5,a5,0x2
    1aac:	fe078793          	add	a5,a5,-32
    1ab0:	008787b3          	add	a5,a5,s0
    1ab4:	fd47d783          	lhu	a5,-44(a5)
    1ab8:	00078613          	mv	a2,a5
    1abc:	fd841783          	lh	a5,-40(s0)
    1ac0:	00c00713          	li	a4,12
    1ac4:	00179793          	sll	a5,a5,0x1
    1ac8:	00f707b3          	add	a5,a4,a5
    1acc:	0007d783          	lhu	a5,0(a5)
    1ad0:	00078693          	mv	a3,a5
    1ad4:	16400513          	li	a0,356
    1ad8:	7b9030ef          	jal	5a90 <ee_printf>
    1adc:	fde45703          	lhu	a4,-34(s0)
    1ae0:	00070793          	mv	a5,a4
    1ae4:	00479793          	sll	a5,a5,0x4
    1ae8:	00e787b3          	add	a5,a5,a4
    1aec:	00279793          	sll	a5,a5,0x2
    1af0:	fe078793          	add	a5,a5,-32
    1af4:	008787b3          	add	a5,a5,s0
    1af8:	fd879783          	lh	a5,-40(a5)
    1afc:	01079793          	sll	a5,a5,0x10
    1b00:	0107d793          	srl	a5,a5,0x10
    1b04:	00178793          	add	a5,a5,1
    1b08:	01079793          	sll	a5,a5,0x10
    1b0c:	0107d793          	srl	a5,a5,0x10
    1b10:	01079693          	sll	a3,a5,0x10
    1b14:	4106d693          	sra	a3,a3,0x10
    1b18:	00070793          	mv	a5,a4
    1b1c:	00479793          	sll	a5,a5,0x4
    1b20:	00e787b3          	add	a5,a5,a4
    1b24:	00279793          	sll	a5,a5,0x2
    1b28:	fe078793          	add	a5,a5,-32
    1b2c:	008787b3          	add	a5,a5,s0
    1b30:	fcd79c23          	sh	a3,-40(a5)
    1b34:	fde45703          	lhu	a4,-34(s0)
    1b38:	00070793          	mv	a5,a4
    1b3c:	00479793          	sll	a5,a5,0x4
    1b40:	00e787b3          	add	a5,a5,a4
    1b44:	00279793          	sll	a5,a5,0x2
    1b48:	fe078793          	add	a5,a5,-32
    1b4c:	008787b3          	add	a5,a5,s0
    1b50:	fb87a783          	lw	a5,-72(a5)
    1b54:	0047f793          	and	a5,a5,4
    1b58:	0c078e63          	beqz	a5,1c34 <main+0xb98>
    1b5c:	fde45703          	lhu	a4,-34(s0)
    1b60:	00070793          	mv	a5,a4
    1b64:	00479793          	sll	a5,a5,0x4
    1b68:	00e787b3          	add	a5,a5,a4
    1b6c:	00279793          	sll	a5,a5,0x2
    1b70:	fe078793          	add	a5,a5,-32
    1b74:	008787b3          	add	a5,a5,s0
    1b78:	fd67d703          	lhu	a4,-42(a5)
    1b7c:	fd841783          	lh	a5,-40(s0)
    1b80:	01800693          	li	a3,24
    1b84:	00179793          	sll	a5,a5,0x1
    1b88:	00f687b3          	add	a5,a3,a5
    1b8c:	0007d783          	lhu	a5,0(a5)
    1b90:	0af70263          	beq	a4,a5,1c34 <main+0xb98>
    1b94:	fde45583          	lhu	a1,-34(s0)
    1b98:	fde45703          	lhu	a4,-34(s0)
    1b9c:	00070793          	mv	a5,a4
    1ba0:	00479793          	sll	a5,a5,0x4
    1ba4:	00e787b3          	add	a5,a5,a4
    1ba8:	00279793          	sll	a5,a5,0x2
    1bac:	fe078793          	add	a5,a5,-32
    1bb0:	008787b3          	add	a5,a5,s0
    1bb4:	fd67d783          	lhu	a5,-42(a5)
    1bb8:	00078613          	mv	a2,a5
    1bbc:	fd841783          	lh	a5,-40(s0)
    1bc0:	01800713          	li	a4,24
    1bc4:	00179793          	sll	a5,a5,0x1
    1bc8:	00f707b3          	add	a5,a4,a5
    1bcc:	0007d783          	lhu	a5,0(a5)
    1bd0:	00078693          	mv	a3,a5
    1bd4:	19800513          	li	a0,408
    1bd8:	6b9030ef          	jal	5a90 <ee_printf>
    1bdc:	fde45703          	lhu	a4,-34(s0)
    1be0:	00070793          	mv	a5,a4
    1be4:	00479793          	sll	a5,a5,0x4
    1be8:	00e787b3          	add	a5,a5,a4
    1bec:	00279793          	sll	a5,a5,0x2
    1bf0:	fe078793          	add	a5,a5,-32
    1bf4:	008787b3          	add	a5,a5,s0
    1bf8:	fd879783          	lh	a5,-40(a5)
    1bfc:	01079793          	sll	a5,a5,0x10
    1c00:	0107d793          	srl	a5,a5,0x10
    1c04:	00178793          	add	a5,a5,1
    1c08:	01079793          	sll	a5,a5,0x10
    1c0c:	0107d793          	srl	a5,a5,0x10
    1c10:	01079693          	sll	a3,a5,0x10
    1c14:	4106d693          	sra	a3,a3,0x10
    1c18:	00070793          	mv	a5,a4
    1c1c:	00479793          	sll	a5,a5,0x4
    1c20:	00e787b3          	add	a5,a5,a4
    1c24:	00279793          	sll	a5,a5,0x2
    1c28:	fe078793          	add	a5,a5,-32
    1c2c:	008787b3          	add	a5,a5,s0
    1c30:	fcd79c23          	sh	a3,-40(a5)
    1c34:	fde45703          	lhu	a4,-34(s0)
    1c38:	00070793          	mv	a5,a4
    1c3c:	00479793          	sll	a5,a5,0x4
    1c40:	00e787b3          	add	a5,a5,a4
    1c44:	00279793          	sll	a5,a5,0x2
    1c48:	fe078793          	add	a5,a5,-32
    1c4c:	008787b3          	add	a5,a5,s0
    1c50:	fd879783          	lh	a5,-40(a5)
    1c54:	01079713          	sll	a4,a5,0x10
    1c58:	01075713          	srl	a4,a4,0x10
    1c5c:	fd645783          	lhu	a5,-42(s0)
    1c60:	00f707b3          	add	a5,a4,a5
    1c64:	01079793          	sll	a5,a5,0x10
    1c68:	0107d793          	srl	a5,a5,0x10
    1c6c:	fcf41b23          	sh	a5,-42(s0)
    1c70:	fde45783          	lhu	a5,-34(s0)
    1c74:	00178793          	add	a5,a5,1
    1c78:	fcf41f23          	sh	a5,-34(s0)
    1c7c:	fde45703          	lhu	a4,-34(s0)
    1c80:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1c84:	c8f768e3          	bltu	a4,a5,1914 <main+0x878>
    1c88:	63d010ef          	jal	3ac4 <check_data_types>
    1c8c:	00050793          	mv	a5,a0
    1c90:	00078713          	mv	a4,a5
    1c94:	fd645783          	lhu	a5,-42(s0)
    1c98:	00f707b3          	add	a5,a4,a5
    1c9c:	01079793          	sll	a5,a5,0x10
    1ca0:	0107d793          	srl	a5,a5,0x10
    1ca4:	fcf41b23          	sh	a5,-42(s0)
    1ca8:	f9042783          	lw	a5,-112(s0)
    1cac:	00078593          	mv	a1,a5
    1cb0:	1c800513          	li	a0,456
    1cb4:	5dd030ef          	jal	5a90 <ee_printf>
    1cb8:	fbc42583          	lw	a1,-68(s0)
    1cbc:	1e000513          	li	a0,480
    1cc0:	5d1030ef          	jal	5a90 <ee_printf>
    1cc4:	fbc42503          	lw	a0,-68(s0)
    1cc8:	0f4010ef          	jal	2dbc <time_in_secs>
    1ccc:	00050713          	mv	a4,a0
    1cd0:	00058793          	mv	a5,a1
    1cd4:	00070613          	mv	a2,a4
    1cd8:	00078693          	mv	a3,a5
    1cdc:	1f800513          	li	a0,504
    1ce0:	5b1030ef          	jal	5a90 <ee_printf>
    1ce4:	fbc42503          	lw	a0,-68(s0)
    1ce8:	0d4010ef          	jal	2dbc <time_in_secs>
    1cec:	00050713          	mv	a4,a0
    1cf0:	00058793          	mv	a5,a1
    1cf4:	00000613          	li	a2,0
    1cf8:	00000693          	li	a3,0
    1cfc:	00070513          	mv	a0,a4
    1d00:	00078593          	mv	a1,a5
    1d04:	040050ef          	jal	6d44 <__gedf2>
    1d08:	00050793          	mv	a5,a0
    1d0c:	06f05463          	blez	a5,1d74 <main+0xcd8>
    1d10:	f9442703          	lw	a4,-108(s0)
    1d14:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1d18:	00078593          	mv	a1,a5
    1d1c:	00070513          	mv	a0,a4
    1d20:	379050ef          	jal	7898 <__mulsi3>
    1d24:	00050793          	mv	a5,a0
    1d28:	00078513          	mv	a0,a5
    1d2c:	2a9050ef          	jal	77d4 <__floatunsidf>
    1d30:	00050913          	mv	s2,a0
    1d34:	00058993          	mv	s3,a1
    1d38:	fbc42503          	lw	a0,-68(s0)
    1d3c:	080010ef          	jal	2dbc <time_in_secs>
    1d40:	00050713          	mv	a4,a0
    1d44:	00058793          	mv	a5,a1
    1d48:	00070613          	mv	a2,a4
    1d4c:	00078693          	mv	a3,a5
    1d50:	00090513          	mv	a0,s2
    1d54:	00098593          	mv	a1,s3
    1d58:	6b8040ef          	jal	6410 <__divdf3>
    1d5c:	00050713          	mv	a4,a0
    1d60:	00058793          	mv	a5,a1
    1d64:	00070613          	mv	a2,a4
    1d68:	00078693          	mv	a3,a5
    1d6c:	21000513          	li	a0,528
    1d70:	521030ef          	jal	5a90 <ee_printf>
    1d74:	fbc42503          	lw	a0,-68(s0)
    1d78:	044010ef          	jal	2dbc <time_in_secs>
    1d7c:	00050713          	mv	a4,a0
    1d80:	00058793          	mv	a5,a1
    1d84:	48002603          	lw	a2,1152(zero) # 480 <copy_info+0xc>
    1d88:	48402683          	lw	a3,1156(zero) # 484 <copy_info+0x10>
    1d8c:	00070513          	mv	a0,a4
    1d90:	00078593          	mv	a1,a5
    1d94:	0b0050ef          	jal	6e44 <__ledf2>
    1d98:	00050793          	mv	a5,a0
    1d9c:	0207d463          	bgez	a5,1dc4 <main+0xd28>
    1da0:	22800513          	li	a0,552
    1da4:	4ed030ef          	jal	5a90 <ee_printf>
    1da8:	fd641783          	lh	a5,-42(s0)
    1dac:	01079793          	sll	a5,a5,0x10
    1db0:	0107d793          	srl	a5,a5,0x10
    1db4:	00178793          	add	a5,a5,1
    1db8:	01079793          	sll	a5,a5,0x10
    1dbc:	0107d793          	srl	a5,a5,0x10
    1dc0:	fcf41b23          	sh	a5,-42(s0)
    1dc4:	f9442703          	lw	a4,-108(s0)
    1dc8:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1dcc:	00078593          	mv	a1,a5
    1dd0:	00070513          	mv	a0,a4
    1dd4:	2c5050ef          	jal	7898 <__mulsi3>
    1dd8:	00050793          	mv	a5,a0
    1ddc:	00078593          	mv	a1,a5
    1de0:	26800513          	li	a0,616
    1de4:	4ad030ef          	jal	5a90 <ee_printf>
    1de8:	28000593          	li	a1,640
    1dec:	28c00513          	li	a0,652
    1df0:	4a1030ef          	jal	5a90 <ee_printf>
    1df4:	2a400593          	li	a1,676
    1df8:	2c400513          	li	a0,708
    1dfc:	495030ef          	jal	5a90 <ee_printf>
    1e00:	2dc00593          	li	a1,732
    1e04:	2e400513          	li	a0,740
    1e08:	489030ef          	jal	5a90 <ee_printf>
    1e0c:	fc245783          	lhu	a5,-62(s0)
    1e10:	00078593          	mv	a1,a5
    1e14:	2fc00513          	li	a0,764
    1e18:	479030ef          	jal	5a90 <ee_printf>
    1e1c:	f9842783          	lw	a5,-104(s0)
    1e20:	0017f793          	and	a5,a5,1
    1e24:	04078c63          	beqz	a5,1e7c <main+0xde0>
    1e28:	fc041f23          	sh	zero,-34(s0)
    1e2c:	0440006f          	j	1e70 <main+0xdd4>
    1e30:	fde45683          	lhu	a3,-34(s0)
    1e34:	fde45703          	lhu	a4,-34(s0)
    1e38:	00070793          	mv	a5,a4
    1e3c:	00479793          	sll	a5,a5,0x4
    1e40:	00e787b3          	add	a5,a5,a4
    1e44:	00279793          	sll	a5,a5,0x2
    1e48:	fe078793          	add	a5,a5,-32
    1e4c:	008787b3          	add	a5,a5,s0
    1e50:	fd27d783          	lhu	a5,-46(a5)
    1e54:	00078613          	mv	a2,a5
    1e58:	00068593          	mv	a1,a3
    1e5c:	31800513          	li	a0,792
    1e60:	431030ef          	jal	5a90 <ee_printf>
    1e64:	fde45783          	lhu	a5,-34(s0)
    1e68:	00178793          	add	a5,a5,1
    1e6c:	fcf41f23          	sh	a5,-34(s0)
    1e70:	fde45703          	lhu	a4,-34(s0)
    1e74:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1e78:	faf76ce3          	bltu	a4,a5,1e30 <main+0xd94>
    1e7c:	f9842783          	lw	a5,-104(s0)
    1e80:	0027f793          	and	a5,a5,2
    1e84:	04078c63          	beqz	a5,1edc <main+0xe40>
    1e88:	fc041f23          	sh	zero,-34(s0)
    1e8c:	0440006f          	j	1ed0 <main+0xe34>
    1e90:	fde45683          	lhu	a3,-34(s0)
    1e94:	fde45703          	lhu	a4,-34(s0)
    1e98:	00070793          	mv	a5,a4
    1e9c:	00479793          	sll	a5,a5,0x4
    1ea0:	00e787b3          	add	a5,a5,a4
    1ea4:	00279793          	sll	a5,a5,0x2
    1ea8:	fe078793          	add	a5,a5,-32
    1eac:	008787b3          	add	a5,a5,s0
    1eb0:	fd47d783          	lhu	a5,-44(a5)
    1eb4:	00078613          	mv	a2,a5
    1eb8:	00068593          	mv	a1,a3
    1ebc:	33400513          	li	a0,820
    1ec0:	3d1030ef          	jal	5a90 <ee_printf>
    1ec4:	fde45783          	lhu	a5,-34(s0)
    1ec8:	00178793          	add	a5,a5,1
    1ecc:	fcf41f23          	sh	a5,-34(s0)
    1ed0:	fde45703          	lhu	a4,-34(s0)
    1ed4:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1ed8:	faf76ce3          	bltu	a4,a5,1e90 <main+0xdf4>
    1edc:	f9842783          	lw	a5,-104(s0)
    1ee0:	0047f793          	and	a5,a5,4
    1ee4:	04078c63          	beqz	a5,1f3c <main+0xea0>
    1ee8:	fc041f23          	sh	zero,-34(s0)
    1eec:	0440006f          	j	1f30 <main+0xe94>
    1ef0:	fde45683          	lhu	a3,-34(s0)
    1ef4:	fde45703          	lhu	a4,-34(s0)
    1ef8:	00070793          	mv	a5,a4
    1efc:	00479793          	sll	a5,a5,0x4
    1f00:	00e787b3          	add	a5,a5,a4
    1f04:	00279793          	sll	a5,a5,0x2
    1f08:	fe078793          	add	a5,a5,-32
    1f0c:	008787b3          	add	a5,a5,s0
    1f10:	fd67d783          	lhu	a5,-42(a5)
    1f14:	00078613          	mv	a2,a5
    1f18:	00068593          	mv	a1,a3
    1f1c:	35000513          	li	a0,848
    1f20:	371030ef          	jal	5a90 <ee_printf>
    1f24:	fde45783          	lhu	a5,-34(s0)
    1f28:	00178793          	add	a5,a5,1
    1f2c:	fcf41f23          	sh	a5,-34(s0)
    1f30:	fde45703          	lhu	a4,-34(s0)
    1f34:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1f38:	faf76ce3          	bltu	a4,a5,1ef0 <main+0xe54>
    1f3c:	fc041f23          	sh	zero,-34(s0)
    1f40:	0440006f          	j	1f84 <main+0xee8>
    1f44:	fde45683          	lhu	a3,-34(s0)
    1f48:	fde45703          	lhu	a4,-34(s0)
    1f4c:	00070793          	mv	a5,a4
    1f50:	00479793          	sll	a5,a5,0x4
    1f54:	00e787b3          	add	a5,a5,a4
    1f58:	00279793          	sll	a5,a5,0x2
    1f5c:	fe078793          	add	a5,a5,-32
    1f60:	008787b3          	add	a5,a5,s0
    1f64:	fd07d783          	lhu	a5,-48(a5)
    1f68:	00078613          	mv	a2,a5
    1f6c:	00068593          	mv	a1,a3
    1f70:	36c00513          	li	a0,876
    1f74:	31d030ef          	jal	5a90 <ee_printf>
    1f78:	fde45783          	lhu	a5,-34(s0)
    1f7c:	00178793          	add	a5,a5,1
    1f80:	fcf41f23          	sh	a5,-34(s0)
    1f84:	fde45703          	lhu	a4,-34(s0)
    1f88:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1f8c:	faf76ce3          	bltu	a4,a5,1f44 <main+0xea8>
    1f90:	fd641783          	lh	a5,-42(s0)
    1f94:	08079c63          	bnez	a5,202c <main+0xf90>
    1f98:	38800513          	li	a0,904
    1f9c:	2f5030ef          	jal	5a90 <ee_printf>
    1fa0:	fd841703          	lh	a4,-40(s0)
    1fa4:	00300793          	li	a5,3
    1fa8:	08f71263          	bne	a4,a5,202c <main+0xf90>
    1fac:	f9442703          	lw	a4,-108(s0)
    1fb0:	49002783          	lw	a5,1168(zero) # 490 <default_num_contexts>
    1fb4:	00078593          	mv	a1,a5
    1fb8:	00070513          	mv	a0,a4
    1fbc:	0dd050ef          	jal	7898 <__mulsi3>
    1fc0:	00050793          	mv	a5,a0
    1fc4:	00078513          	mv	a0,a5
    1fc8:	00d050ef          	jal	77d4 <__floatunsidf>
    1fcc:	00050913          	mv	s2,a0
    1fd0:	00058993          	mv	s3,a1
    1fd4:	fbc42503          	lw	a0,-68(s0)
    1fd8:	5e5000ef          	jal	2dbc <time_in_secs>
    1fdc:	00050713          	mv	a4,a0
    1fe0:	00058793          	mv	a5,a1
    1fe4:	00070613          	mv	a2,a4
    1fe8:	00078693          	mv	a3,a5
    1fec:	00090513          	mv	a0,s2
    1ff0:	00098593          	mv	a1,s3
    1ff4:	41c040ef          	jal	6410 <__divdf3>
    1ff8:	00050713          	mv	a4,a0
    1ffc:	00058793          	mv	a5,a1
    2000:	00070613          	mv	a2,a4
    2004:	00078693          	mv	a3,a5
    2008:	2a400793          	li	a5,676
    200c:	28000713          	li	a4,640
    2010:	3d400513          	li	a0,980
    2014:	27d030ef          	jal	5a90 <ee_printf>
    2018:	2dc00593          	li	a1,732
    201c:	3f000513          	li	a0,1008
    2020:	271030ef          	jal	5a90 <ee_printf>
    2024:	3f800513          	li	a0,1016
    2028:	269030ef          	jal	5a90 <ee_printf>
    202c:	fd641783          	lh	a5,-42(s0)
    2030:	00f05663          	blez	a5,203c <main+0xfa0>
    2034:	3fc00513          	li	a0,1020
    2038:	259030ef          	jal	5a90 <ee_printf>
    203c:	fd641783          	lh	a5,-42(s0)
    2040:	0007d663          	bgez	a5,204c <main+0xfb0>
    2044:	41000513          	li	a0,1040
    2048:	249030ef          	jal	5a90 <ee_printf>
    204c:	f7840793          	add	a5,s0,-136
    2050:	04278793          	add	a5,a5,66
    2054:	00078513          	mv	a0,a5
    2058:	63d000ef          	jal	2e94 <portable_fini>
    205c:	00000793          	li	a5,0
    2060:	00078513          	mv	a0,a5
    2064:	08010113          	add	sp,sp,128
    2068:	7ec12083          	lw	ra,2028(sp)
    206c:	7e812403          	lw	s0,2024(sp)
    2070:	7e412483          	lw	s1,2020(sp)
    2074:	7e012903          	lw	s2,2016(sp)
    2078:	7dc12983          	lw	s3,2012(sp)
    207c:	7f010113          	add	sp,sp,2032
    2080:	00008067          	ret

00002084 <core_bench_matrix>:
    2084:	fc010113          	add	sp,sp,-64
    2088:	02112e23          	sw	ra,60(sp)
    208c:	02812c23          	sw	s0,56(sp)
    2090:	04010413          	add	s0,sp,64
    2094:	fca42623          	sw	a0,-52(s0)
    2098:	00058793          	mv	a5,a1
    209c:	00060713          	mv	a4,a2
    20a0:	fcf41523          	sh	a5,-54(s0)
    20a4:	00070793          	mv	a5,a4
    20a8:	fcf41423          	sh	a5,-56(s0)
    20ac:	fcc42783          	lw	a5,-52(s0)
    20b0:	0007a783          	lw	a5,0(a5)
    20b4:	fef42623          	sw	a5,-20(s0)
    20b8:	fcc42783          	lw	a5,-52(s0)
    20bc:	00c7a783          	lw	a5,12(a5)
    20c0:	fef42423          	sw	a5,-24(s0)
    20c4:	fcc42783          	lw	a5,-52(s0)
    20c8:	0047a783          	lw	a5,4(a5)
    20cc:	fef42223          	sw	a5,-28(s0)
    20d0:	fcc42783          	lw	a5,-52(s0)
    20d4:	0087a783          	lw	a5,8(a5)
    20d8:	fef42023          	sw	a5,-32(s0)
    20dc:	fca45783          	lhu	a5,-54(s0)
    20e0:	fcf41f23          	sh	a5,-34(s0)
    20e4:	fde41783          	lh	a5,-34(s0)
    20e8:	00078713          	mv	a4,a5
    20ec:	fe042683          	lw	a3,-32(s0)
    20f0:	fe442603          	lw	a2,-28(s0)
    20f4:	fe842583          	lw	a1,-24(s0)
    20f8:	fec42503          	lw	a0,-20(s0)
    20fc:	03c000ef          	jal	2138 <matrix_test>
    2100:	00050793          	mv	a5,a0
    2104:	00078713          	mv	a4,a5
    2108:	fc845783          	lhu	a5,-56(s0)
    210c:	00078593          	mv	a1,a5
    2110:	00070513          	mv	a0,a4
    2114:	161010ef          	jal	3a74 <crc16>
    2118:	00050793          	mv	a5,a0
    211c:	fcf41423          	sh	a5,-56(s0)
    2120:	fc845783          	lhu	a5,-56(s0)
    2124:	00078513          	mv	a0,a5
    2128:	03c12083          	lw	ra,60(sp)
    212c:	03812403          	lw	s0,56(sp)
    2130:	04010113          	add	sp,sp,64
    2134:	00008067          	ret

00002138 <matrix_test>:
    2138:	fc010113          	add	sp,sp,-64
    213c:	02112e23          	sw	ra,60(sp)
    2140:	02812c23          	sw	s0,56(sp)
    2144:	04010413          	add	s0,sp,64
    2148:	fca42e23          	sw	a0,-36(s0)
    214c:	fcb42c23          	sw	a1,-40(s0)
    2150:	fcc42a23          	sw	a2,-44(s0)
    2154:	fcd42823          	sw	a3,-48(s0)
    2158:	00070793          	mv	a5,a4
    215c:	fcf41723          	sh	a5,-50(s0)
    2160:	fe041723          	sh	zero,-18(s0)
    2164:	fce45783          	lhu	a5,-50(s0)
    2168:	00078713          	mv	a4,a5
    216c:	fffff7b7          	lui	a5,0xfffff
    2170:	00f767b3          	or	a5,a4,a5
    2174:	fef41623          	sh	a5,-20(s0)
    2178:	fce41783          	lh	a5,-50(s0)
    217c:	00078613          	mv	a2,a5
    2180:	fd442583          	lw	a1,-44(s0)
    2184:	fdc42503          	lw	a0,-36(s0)
    2188:	5e8000ef          	jal	2770 <matrix_add_const>
    218c:	fce41783          	lh	a5,-50(s0)
    2190:	00078693          	mv	a3,a5
    2194:	fd442603          	lw	a2,-44(s0)
    2198:	fd842583          	lw	a1,-40(s0)
    219c:	fdc42503          	lw	a0,-36(s0)
    21a0:	4cc000ef          	jal	266c <matrix_mul_const>
    21a4:	fec41783          	lh	a5,-20(s0)
    21a8:	00078613          	mv	a2,a5
    21ac:	fd842583          	lw	a1,-40(s0)
    21b0:	fdc42503          	lw	a0,-36(s0)
    21b4:	398000ef          	jal	254c <matrix_sum>
    21b8:	00050793          	mv	a5,a0
    21bc:	00078713          	mv	a4,a5
    21c0:	fee45783          	lhu	a5,-18(s0)
    21c4:	00078593          	mv	a1,a5
    21c8:	00070513          	mv	a0,a4
    21cc:	0a9010ef          	jal	3a74 <crc16>
    21d0:	00050793          	mv	a5,a0
    21d4:	fef41723          	sh	a5,-18(s0)
    21d8:	fd042683          	lw	a3,-48(s0)
    21dc:	fd442603          	lw	a2,-44(s0)
    21e0:	fd842583          	lw	a1,-40(s0)
    21e4:	fdc42503          	lw	a0,-36(s0)
    21e8:	680000ef          	jal	2868 <matrix_mul_vect>
    21ec:	fec41783          	lh	a5,-20(s0)
    21f0:	00078613          	mv	a2,a5
    21f4:	fd842583          	lw	a1,-40(s0)
    21f8:	fdc42503          	lw	a0,-36(s0)
    21fc:	350000ef          	jal	254c <matrix_sum>
    2200:	00050793          	mv	a5,a0
    2204:	00078713          	mv	a4,a5
    2208:	fee45783          	lhu	a5,-18(s0)
    220c:	00078593          	mv	a1,a5
    2210:	00070513          	mv	a0,a4
    2214:	061010ef          	jal	3a74 <crc16>
    2218:	00050793          	mv	a5,a0
    221c:	fef41723          	sh	a5,-18(s0)
    2220:	fd042683          	lw	a3,-48(s0)
    2224:	fd442603          	lw	a2,-44(s0)
    2228:	fd842583          	lw	a1,-40(s0)
    222c:	fdc42503          	lw	a0,-36(s0)
    2230:	750000ef          	jal	2980 <matrix_mul_matrix>
    2234:	fec41783          	lh	a5,-20(s0)
    2238:	00078613          	mv	a2,a5
    223c:	fd842583          	lw	a1,-40(s0)
    2240:	fdc42503          	lw	a0,-36(s0)
    2244:	308000ef          	jal	254c <matrix_sum>
    2248:	00050793          	mv	a5,a0
    224c:	00078713          	mv	a4,a5
    2250:	fee45783          	lhu	a5,-18(s0)
    2254:	00078593          	mv	a1,a5
    2258:	00070513          	mv	a0,a4
    225c:	019010ef          	jal	3a74 <crc16>
    2260:	00050793          	mv	a5,a0
    2264:	fef41723          	sh	a5,-18(s0)
    2268:	fd042683          	lw	a3,-48(s0)
    226c:	fd442603          	lw	a2,-44(s0)
    2270:	fd842583          	lw	a1,-40(s0)
    2274:	fdc42503          	lw	a0,-36(s0)
    2278:	0a9000ef          	jal	2b20 <matrix_mul_matrix_bitextract>
    227c:	fec41783          	lh	a5,-20(s0)
    2280:	00078613          	mv	a2,a5
    2284:	fd842583          	lw	a1,-40(s0)
    2288:	fdc42503          	lw	a0,-36(s0)
    228c:	2c0000ef          	jal	254c <matrix_sum>
    2290:	00050793          	mv	a5,a0
    2294:	00078713          	mv	a4,a5
    2298:	fee45783          	lhu	a5,-18(s0)
    229c:	00078593          	mv	a1,a5
    22a0:	00070513          	mv	a0,a4
    22a4:	7d0010ef          	jal	3a74 <crc16>
    22a8:	00050793          	mv	a5,a0
    22ac:	fef41723          	sh	a5,-18(s0)
    22b0:	fce45783          	lhu	a5,-50(s0)
    22b4:	40f007b3          	neg	a5,a5
    22b8:	01079793          	sll	a5,a5,0x10
    22bc:	0107d793          	srl	a5,a5,0x10
    22c0:	01079793          	sll	a5,a5,0x10
    22c4:	4107d793          	sra	a5,a5,0x10
    22c8:	00078613          	mv	a2,a5
    22cc:	fd442583          	lw	a1,-44(s0)
    22d0:	fdc42503          	lw	a0,-36(s0)
    22d4:	49c000ef          	jal	2770 <matrix_add_const>
    22d8:	fee41783          	lh	a5,-18(s0)
    22dc:	00078513          	mv	a0,a5
    22e0:	03c12083          	lw	ra,60(sp)
    22e4:	03812403          	lw	s0,56(sp)
    22e8:	04010113          	add	sp,sp,64
    22ec:	00008067          	ret

000022f0 <core_init_matrix>:
    22f0:	fc010113          	add	sp,sp,-64
    22f4:	02112e23          	sw	ra,60(sp)
    22f8:	02812c23          	sw	s0,56(sp)
    22fc:	04010413          	add	s0,sp,64
    2300:	fca42623          	sw	a0,-52(s0)
    2304:	fcb42423          	sw	a1,-56(s0)
    2308:	fcc42223          	sw	a2,-60(s0)
    230c:	fcd42023          	sw	a3,-64(s0)
    2310:	fe042023          	sw	zero,-32(s0)
    2314:	00100793          	li	a5,1
    2318:	fef42623          	sw	a5,-20(s0)
    231c:	fe042423          	sw	zero,-24(s0)
    2320:	fe042223          	sw	zero,-28(s0)
    2324:	fc442783          	lw	a5,-60(s0)
    2328:	02079a63          	bnez	a5,235c <core_init_matrix+0x6c>
    232c:	00100793          	li	a5,1
    2330:	fcf42223          	sw	a5,-60(s0)
    2334:	0280006f          	j	235c <core_init_matrix+0x6c>
    2338:	fe842783          	lw	a5,-24(s0)
    233c:	00178793          	add	a5,a5,1 # fffff001 <__subdf3+0xffff741d>
    2340:	fef42423          	sw	a5,-24(s0)
    2344:	fe842583          	lw	a1,-24(s0)
    2348:	fe842503          	lw	a0,-24(s0)
    234c:	54c050ef          	jal	7898 <__mulsi3>
    2350:	00050793          	mv	a5,a0
    2354:	00379793          	sll	a5,a5,0x3
    2358:	fef42223          	sw	a5,-28(s0)
    235c:	fe442703          	lw	a4,-28(s0)
    2360:	fcc42783          	lw	a5,-52(s0)
    2364:	fcf76ae3          	bltu	a4,a5,2338 <core_init_matrix+0x48>
    2368:	fe842783          	lw	a5,-24(s0)
    236c:	fff78793          	add	a5,a5,-1
    2370:	fef42023          	sw	a5,-32(s0)
    2374:	fc842783          	lw	a5,-56(s0)
    2378:	fff78793          	add	a5,a5,-1
    237c:	ffc7f793          	and	a5,a5,-4
    2380:	00478793          	add	a5,a5,4
    2384:	fcf42e23          	sw	a5,-36(s0)
    2388:	fe042583          	lw	a1,-32(s0)
    238c:	fe042503          	lw	a0,-32(s0)
    2390:	508050ef          	jal	7898 <__mulsi3>
    2394:	00050793          	mv	a5,a0
    2398:	00179793          	sll	a5,a5,0x1
    239c:	fdc42703          	lw	a4,-36(s0)
    23a0:	00f707b3          	add	a5,a4,a5
    23a4:	fcf42c23          	sw	a5,-40(s0)
    23a8:	fe042423          	sw	zero,-24(s0)
    23ac:	1240006f          	j	24d0 <core_init_matrix+0x1e0>
    23b0:	fe042223          	sw	zero,-28(s0)
    23b4:	1040006f          	j	24b8 <core_init_matrix+0x1c8>
    23b8:	fc442583          	lw	a1,-60(s0)
    23bc:	fec42503          	lw	a0,-20(s0)
    23c0:	4d8050ef          	jal	7898 <__mulsi3>
    23c4:	00050793          	mv	a5,a0
    23c8:	00078713          	mv	a4,a5
    23cc:	41f75793          	sra	a5,a4,0x1f
    23d0:	0107d793          	srl	a5,a5,0x10
    23d4:	00f706b3          	add	a3,a4,a5
    23d8:	00010737          	lui	a4,0x10
    23dc:	fff70713          	add	a4,a4,-1 # ffff <__subdf3+0x841b>
    23e0:	00e6f733          	and	a4,a3,a4
    23e4:	40f707b3          	sub	a5,a4,a5
    23e8:	fcf42223          	sw	a5,-60(s0)
    23ec:	fc442783          	lw	a5,-60(s0)
    23f0:	01079713          	sll	a4,a5,0x10
    23f4:	01075713          	srl	a4,a4,0x10
    23f8:	fec42783          	lw	a5,-20(s0)
    23fc:	01079793          	sll	a5,a5,0x10
    2400:	0107d793          	srl	a5,a5,0x10
    2404:	00f707b3          	add	a5,a4,a5
    2408:	01079793          	sll	a5,a5,0x10
    240c:	0107d793          	srl	a5,a5,0x10
    2410:	fcf41b23          	sh	a5,-42(s0)
    2414:	fe042583          	lw	a1,-32(s0)
    2418:	fe842503          	lw	a0,-24(s0)
    241c:	47c050ef          	jal	7898 <__mulsi3>
    2420:	00050793          	mv	a5,a0
    2424:	00078713          	mv	a4,a5
    2428:	fe442783          	lw	a5,-28(s0)
    242c:	00f707b3          	add	a5,a4,a5
    2430:	00179793          	sll	a5,a5,0x1
    2434:	fd842703          	lw	a4,-40(s0)
    2438:	00f707b3          	add	a5,a4,a5
    243c:	fd645703          	lhu	a4,-42(s0)
    2440:	00e79023          	sh	a4,0(a5)
    2444:	fec42783          	lw	a5,-20(s0)
    2448:	01079713          	sll	a4,a5,0x10
    244c:	01075713          	srl	a4,a4,0x10
    2450:	fd645783          	lhu	a5,-42(s0)
    2454:	00f707b3          	add	a5,a4,a5
    2458:	01079793          	sll	a5,a5,0x10
    245c:	0107d793          	srl	a5,a5,0x10
    2460:	fcf41b23          	sh	a5,-42(s0)
    2464:	fd645783          	lhu	a5,-42(s0)
    2468:	0ff7f793          	zext.b	a5,a5
    246c:	fcf41b23          	sh	a5,-42(s0)
    2470:	fe042583          	lw	a1,-32(s0)
    2474:	fe842503          	lw	a0,-24(s0)
    2478:	420050ef          	jal	7898 <__mulsi3>
    247c:	00050793          	mv	a5,a0
    2480:	00078713          	mv	a4,a5
    2484:	fe442783          	lw	a5,-28(s0)
    2488:	00f707b3          	add	a5,a4,a5
    248c:	00179793          	sll	a5,a5,0x1
    2490:	fdc42703          	lw	a4,-36(s0)
    2494:	00f707b3          	add	a5,a4,a5
    2498:	fd645703          	lhu	a4,-42(s0)
    249c:	00e79023          	sh	a4,0(a5)
    24a0:	fec42783          	lw	a5,-20(s0)
    24a4:	00178793          	add	a5,a5,1
    24a8:	fef42623          	sw	a5,-20(s0)
    24ac:	fe442783          	lw	a5,-28(s0)
    24b0:	00178793          	add	a5,a5,1
    24b4:	fef42223          	sw	a5,-28(s0)
    24b8:	fe442703          	lw	a4,-28(s0)
    24bc:	fe042783          	lw	a5,-32(s0)
    24c0:	eef76ce3          	bltu	a4,a5,23b8 <core_init_matrix+0xc8>
    24c4:	fe842783          	lw	a5,-24(s0)
    24c8:	00178793          	add	a5,a5,1
    24cc:	fef42423          	sw	a5,-24(s0)
    24d0:	fe842703          	lw	a4,-24(s0)
    24d4:	fe042783          	lw	a5,-32(s0)
    24d8:	ecf76ce3          	bltu	a4,a5,23b0 <core_init_matrix+0xc0>
    24dc:	fc042783          	lw	a5,-64(s0)
    24e0:	fdc42703          	lw	a4,-36(s0)
    24e4:	00e7a223          	sw	a4,4(a5)
    24e8:	fc042783          	lw	a5,-64(s0)
    24ec:	fd842703          	lw	a4,-40(s0)
    24f0:	00e7a423          	sw	a4,8(a5)
    24f4:	fe042583          	lw	a1,-32(s0)
    24f8:	fe042503          	lw	a0,-32(s0)
    24fc:	39c050ef          	jal	7898 <__mulsi3>
    2500:	00050793          	mv	a5,a0
    2504:	00179793          	sll	a5,a5,0x1
    2508:	fd842703          	lw	a4,-40(s0)
    250c:	00f707b3          	add	a5,a4,a5
    2510:	fff78793          	add	a5,a5,-1
    2514:	ffc7f793          	and	a5,a5,-4
    2518:	00478793          	add	a5,a5,4
    251c:	00078713          	mv	a4,a5
    2520:	fc042783          	lw	a5,-64(s0)
    2524:	00e7a623          	sw	a4,12(a5)
    2528:	fe042703          	lw	a4,-32(s0)
    252c:	fc042783          	lw	a5,-64(s0)
    2530:	00e7a023          	sw	a4,0(a5)
    2534:	fe042783          	lw	a5,-32(s0)
    2538:	00078513          	mv	a0,a5
    253c:	03c12083          	lw	ra,60(sp)
    2540:	03812403          	lw	s0,56(sp)
    2544:	04010113          	add	sp,sp,64
    2548:	00008067          	ret

0000254c <matrix_sum>:
    254c:	fc010113          	add	sp,sp,-64
    2550:	02112e23          	sw	ra,60(sp)
    2554:	02812c23          	sw	s0,56(sp)
    2558:	04010413          	add	s0,sp,64
    255c:	fca42623          	sw	a0,-52(s0)
    2560:	fcb42423          	sw	a1,-56(s0)
    2564:	00060793          	mv	a5,a2
    2568:	fcf41323          	sh	a5,-58(s0)
    256c:	fe042623          	sw	zero,-20(s0)
    2570:	fe042423          	sw	zero,-24(s0)
    2574:	fc042c23          	sw	zero,-40(s0)
    2578:	fe041323          	sh	zero,-26(s0)
    257c:	fe042023          	sw	zero,-32(s0)
    2580:	0c80006f          	j	2648 <matrix_sum+0xfc>
    2584:	fc042e23          	sw	zero,-36(s0)
    2588:	0a80006f          	j	2630 <matrix_sum+0xe4>
    258c:	fcc42583          	lw	a1,-52(s0)
    2590:	fe042503          	lw	a0,-32(s0)
    2594:	304050ef          	jal	7898 <__mulsi3>
    2598:	00050793          	mv	a5,a0
    259c:	00078713          	mv	a4,a5
    25a0:	fdc42783          	lw	a5,-36(s0)
    25a4:	00f707b3          	add	a5,a4,a5
    25a8:	00279793          	sll	a5,a5,0x2
    25ac:	fc842703          	lw	a4,-56(s0)
    25b0:	00f707b3          	add	a5,a4,a5
    25b4:	0007a783          	lw	a5,0(a5)
    25b8:	fcf42c23          	sw	a5,-40(s0)
    25bc:	fec42703          	lw	a4,-20(s0)
    25c0:	fd842783          	lw	a5,-40(s0)
    25c4:	00f707b3          	add	a5,a4,a5
    25c8:	fef42623          	sw	a5,-20(s0)
    25cc:	fc641783          	lh	a5,-58(s0)
    25d0:	fec42703          	lw	a4,-20(s0)
    25d4:	02e7d063          	bge	a5,a4,25f4 <matrix_sum+0xa8>
    25d8:	fe645783          	lhu	a5,-26(s0)
    25dc:	00a78793          	add	a5,a5,10
    25e0:	01079793          	sll	a5,a5,0x10
    25e4:	0107d793          	srl	a5,a5,0x10
    25e8:	fef41323          	sh	a5,-26(s0)
    25ec:	fe042623          	sw	zero,-20(s0)
    25f0:	02c0006f          	j	261c <matrix_sum+0xd0>
    25f4:	fd842703          	lw	a4,-40(s0)
    25f8:	fe842783          	lw	a5,-24(s0)
    25fc:	00e7a7b3          	slt	a5,a5,a4
    2600:	0ff7f793          	zext.b	a5,a5
    2604:	00078713          	mv	a4,a5
    2608:	fe645783          	lhu	a5,-26(s0)
    260c:	00f707b3          	add	a5,a4,a5
    2610:	01079793          	sll	a5,a5,0x10
    2614:	0107d793          	srl	a5,a5,0x10
    2618:	fef41323          	sh	a5,-26(s0)
    261c:	fd842783          	lw	a5,-40(s0)
    2620:	fef42423          	sw	a5,-24(s0)
    2624:	fdc42783          	lw	a5,-36(s0)
    2628:	00178793          	add	a5,a5,1
    262c:	fcf42e23          	sw	a5,-36(s0)
    2630:	fdc42703          	lw	a4,-36(s0)
    2634:	fcc42783          	lw	a5,-52(s0)
    2638:	f4f76ae3          	bltu	a4,a5,258c <matrix_sum+0x40>
    263c:	fe042783          	lw	a5,-32(s0)
    2640:	00178793          	add	a5,a5,1
    2644:	fef42023          	sw	a5,-32(s0)
    2648:	fe042703          	lw	a4,-32(s0)
    264c:	fcc42783          	lw	a5,-52(s0)
    2650:	f2f76ae3          	bltu	a4,a5,2584 <matrix_sum+0x38>
    2654:	fe641783          	lh	a5,-26(s0)
    2658:	00078513          	mv	a0,a5
    265c:	03c12083          	lw	ra,60(sp)
    2660:	03812403          	lw	s0,56(sp)
    2664:	04010113          	add	sp,sp,64
    2668:	00008067          	ret

0000266c <matrix_mul_const>:
    266c:	fc010113          	add	sp,sp,-64
    2670:	02112e23          	sw	ra,60(sp)
    2674:	02812c23          	sw	s0,56(sp)
    2678:	02912a23          	sw	s1,52(sp)
    267c:	03212823          	sw	s2,48(sp)
    2680:	03312623          	sw	s3,44(sp)
    2684:	04010413          	add	s0,sp,64
    2688:	fca42623          	sw	a0,-52(s0)
    268c:	fcb42423          	sw	a1,-56(s0)
    2690:	fcc42223          	sw	a2,-60(s0)
    2694:	00068793          	mv	a5,a3
    2698:	fcf41123          	sh	a5,-62(s0)
    269c:	fc042e23          	sw	zero,-36(s0)
    26a0:	0a00006f          	j	2740 <matrix_mul_const+0xd4>
    26a4:	fc042c23          	sw	zero,-40(s0)
    26a8:	0800006f          	j	2728 <matrix_mul_const+0xbc>
    26ac:	fcc42583          	lw	a1,-52(s0)
    26b0:	fdc42503          	lw	a0,-36(s0)
    26b4:	1e4050ef          	jal	7898 <__mulsi3>
    26b8:	00050793          	mv	a5,a0
    26bc:	00078713          	mv	a4,a5
    26c0:	fd842783          	lw	a5,-40(s0)
    26c4:	00f707b3          	add	a5,a4,a5
    26c8:	00179793          	sll	a5,a5,0x1
    26cc:	fc442703          	lw	a4,-60(s0)
    26d0:	00f707b3          	add	a5,a4,a5
    26d4:	00079783          	lh	a5,0(a5)
    26d8:	00078993          	mv	s3,a5
    26dc:	fc241903          	lh	s2,-62(s0)
    26e0:	fcc42583          	lw	a1,-52(s0)
    26e4:	fdc42503          	lw	a0,-36(s0)
    26e8:	1b0050ef          	jal	7898 <__mulsi3>
    26ec:	00050793          	mv	a5,a0
    26f0:	00078713          	mv	a4,a5
    26f4:	fd842783          	lw	a5,-40(s0)
    26f8:	00f707b3          	add	a5,a4,a5
    26fc:	00279793          	sll	a5,a5,0x2
    2700:	fc842703          	lw	a4,-56(s0)
    2704:	00f704b3          	add	s1,a4,a5
    2708:	00090593          	mv	a1,s2
    270c:	00098513          	mv	a0,s3
    2710:	188050ef          	jal	7898 <__mulsi3>
    2714:	00050793          	mv	a5,a0
    2718:	00f4a023          	sw	a5,0(s1)
    271c:	fd842783          	lw	a5,-40(s0)
    2720:	00178793          	add	a5,a5,1
    2724:	fcf42c23          	sw	a5,-40(s0)
    2728:	fd842703          	lw	a4,-40(s0)
    272c:	fcc42783          	lw	a5,-52(s0)
    2730:	f6f76ee3          	bltu	a4,a5,26ac <matrix_mul_const+0x40>
    2734:	fdc42783          	lw	a5,-36(s0)
    2738:	00178793          	add	a5,a5,1
    273c:	fcf42e23          	sw	a5,-36(s0)
    2740:	fdc42703          	lw	a4,-36(s0)
    2744:	fcc42783          	lw	a5,-52(s0)
    2748:	f4f76ee3          	bltu	a4,a5,26a4 <matrix_mul_const+0x38>
    274c:	00000013          	nop
    2750:	00000013          	nop
    2754:	03c12083          	lw	ra,60(sp)
    2758:	03812403          	lw	s0,56(sp)
    275c:	03412483          	lw	s1,52(sp)
    2760:	03012903          	lw	s2,48(sp)
    2764:	02c12983          	lw	s3,44(sp)
    2768:	04010113          	add	sp,sp,64
    276c:	00008067          	ret

00002770 <matrix_add_const>:
    2770:	fd010113          	add	sp,sp,-48
    2774:	02112623          	sw	ra,44(sp)
    2778:	02812423          	sw	s0,40(sp)
    277c:	02912223          	sw	s1,36(sp)
    2780:	03010413          	add	s0,sp,48
    2784:	fca42e23          	sw	a0,-36(s0)
    2788:	fcb42c23          	sw	a1,-40(s0)
    278c:	00060793          	mv	a5,a2
    2790:	fcf41b23          	sh	a5,-42(s0)
    2794:	fe042623          	sw	zero,-20(s0)
    2798:	0a80006f          	j	2840 <matrix_add_const+0xd0>
    279c:	fe042423          	sw	zero,-24(s0)
    27a0:	0880006f          	j	2828 <matrix_add_const+0xb8>
    27a4:	fdc42583          	lw	a1,-36(s0)
    27a8:	fec42503          	lw	a0,-20(s0)
    27ac:	0ec050ef          	jal	7898 <__mulsi3>
    27b0:	00050793          	mv	a5,a0
    27b4:	00078713          	mv	a4,a5
    27b8:	fe842783          	lw	a5,-24(s0)
    27bc:	00f707b3          	add	a5,a4,a5
    27c0:	00179793          	sll	a5,a5,0x1
    27c4:	fd842703          	lw	a4,-40(s0)
    27c8:	00f707b3          	add	a5,a4,a5
    27cc:	00079783          	lh	a5,0(a5)
    27d0:	01079713          	sll	a4,a5,0x10
    27d4:	01075713          	srl	a4,a4,0x10
    27d8:	fd645783          	lhu	a5,-42(s0)
    27dc:	00f707b3          	add	a5,a4,a5
    27e0:	01079493          	sll	s1,a5,0x10
    27e4:	0104d493          	srl	s1,s1,0x10
    27e8:	fdc42583          	lw	a1,-36(s0)
    27ec:	fec42503          	lw	a0,-20(s0)
    27f0:	0a8050ef          	jal	7898 <__mulsi3>
    27f4:	00050793          	mv	a5,a0
    27f8:	00078713          	mv	a4,a5
    27fc:	fe842783          	lw	a5,-24(s0)
    2800:	00f707b3          	add	a5,a4,a5
    2804:	00179793          	sll	a5,a5,0x1
    2808:	fd842703          	lw	a4,-40(s0)
    280c:	00f707b3          	add	a5,a4,a5
    2810:	01049713          	sll	a4,s1,0x10
    2814:	41075713          	sra	a4,a4,0x10
    2818:	00e79023          	sh	a4,0(a5)
    281c:	fe842783          	lw	a5,-24(s0)
    2820:	00178793          	add	a5,a5,1
    2824:	fef42423          	sw	a5,-24(s0)
    2828:	fe842703          	lw	a4,-24(s0)
    282c:	fdc42783          	lw	a5,-36(s0)
    2830:	f6f76ae3          	bltu	a4,a5,27a4 <matrix_add_const+0x34>
    2834:	fec42783          	lw	a5,-20(s0)
    2838:	00178793          	add	a5,a5,1
    283c:	fef42623          	sw	a5,-20(s0)
    2840:	fec42703          	lw	a4,-20(s0)
    2844:	fdc42783          	lw	a5,-36(s0)
    2848:	f4f76ae3          	bltu	a4,a5,279c <matrix_add_const+0x2c>
    284c:	00000013          	nop
    2850:	00000013          	nop
    2854:	02c12083          	lw	ra,44(sp)
    2858:	02812403          	lw	s0,40(sp)
    285c:	02412483          	lw	s1,36(sp)
    2860:	03010113          	add	sp,sp,48
    2864:	00008067          	ret

00002868 <matrix_mul_vect>:
    2868:	fd010113          	add	sp,sp,-48
    286c:	02112623          	sw	ra,44(sp)
    2870:	02812423          	sw	s0,40(sp)
    2874:	02912223          	sw	s1,36(sp)
    2878:	03010413          	add	s0,sp,48
    287c:	fca42e23          	sw	a0,-36(s0)
    2880:	fcb42c23          	sw	a1,-40(s0)
    2884:	fcc42a23          	sw	a2,-44(s0)
    2888:	fcd42823          	sw	a3,-48(s0)
    288c:	fe042623          	sw	zero,-20(s0)
    2890:	0c80006f          	j	2958 <matrix_mul_vect+0xf0>
    2894:	fec42783          	lw	a5,-20(s0)
    2898:	00279793          	sll	a5,a5,0x2
    289c:	fd842703          	lw	a4,-40(s0)
    28a0:	00f707b3          	add	a5,a4,a5
    28a4:	0007a023          	sw	zero,0(a5)
    28a8:	fe042423          	sw	zero,-24(s0)
    28ac:	0940006f          	j	2940 <matrix_mul_vect+0xd8>
    28b0:	fec42783          	lw	a5,-20(s0)
    28b4:	00279793          	sll	a5,a5,0x2
    28b8:	fd842703          	lw	a4,-40(s0)
    28bc:	00f707b3          	add	a5,a4,a5
    28c0:	0007a483          	lw	s1,0(a5)
    28c4:	fdc42583          	lw	a1,-36(s0)
    28c8:	fec42503          	lw	a0,-20(s0)
    28cc:	7cd040ef          	jal	7898 <__mulsi3>
    28d0:	00050793          	mv	a5,a0
    28d4:	00078713          	mv	a4,a5
    28d8:	fe842783          	lw	a5,-24(s0)
    28dc:	00f707b3          	add	a5,a4,a5
    28e0:	00179793          	sll	a5,a5,0x1
    28e4:	fd442703          	lw	a4,-44(s0)
    28e8:	00f707b3          	add	a5,a4,a5
    28ec:	00079783          	lh	a5,0(a5)
    28f0:	00078693          	mv	a3,a5
    28f4:	fe842783          	lw	a5,-24(s0)
    28f8:	00179793          	sll	a5,a5,0x1
    28fc:	fd042703          	lw	a4,-48(s0)
    2900:	00f707b3          	add	a5,a4,a5
    2904:	00079783          	lh	a5,0(a5)
    2908:	00078593          	mv	a1,a5
    290c:	00068513          	mv	a0,a3
    2910:	789040ef          	jal	7898 <__mulsi3>
    2914:	00050793          	mv	a5,a0
    2918:	00078693          	mv	a3,a5
    291c:	fec42783          	lw	a5,-20(s0)
    2920:	00279793          	sll	a5,a5,0x2
    2924:	fd842703          	lw	a4,-40(s0)
    2928:	00f707b3          	add	a5,a4,a5
    292c:	00d48733          	add	a4,s1,a3
    2930:	00e7a023          	sw	a4,0(a5)
    2934:	fe842783          	lw	a5,-24(s0)
    2938:	00178793          	add	a5,a5,1
    293c:	fef42423          	sw	a5,-24(s0)
    2940:	fe842703          	lw	a4,-24(s0)
    2944:	fdc42783          	lw	a5,-36(s0)
    2948:	f6f764e3          	bltu	a4,a5,28b0 <matrix_mul_vect+0x48>
    294c:	fec42783          	lw	a5,-20(s0)
    2950:	00178793          	add	a5,a5,1
    2954:	fef42623          	sw	a5,-20(s0)
    2958:	fec42703          	lw	a4,-20(s0)
    295c:	fdc42783          	lw	a5,-36(s0)
    2960:	f2f76ae3          	bltu	a4,a5,2894 <matrix_mul_vect+0x2c>
    2964:	00000013          	nop
    2968:	00000013          	nop
    296c:	02c12083          	lw	ra,44(sp)
    2970:	02812403          	lw	s0,40(sp)
    2974:	02412483          	lw	s1,36(sp)
    2978:	03010113          	add	sp,sp,48
    297c:	00008067          	ret

00002980 <matrix_mul_matrix>:
    2980:	fd010113          	add	sp,sp,-48
    2984:	02112623          	sw	ra,44(sp)
    2988:	02812423          	sw	s0,40(sp)
    298c:	02912223          	sw	s1,36(sp)
    2990:	03212023          	sw	s2,32(sp)
    2994:	03010413          	add	s0,sp,48
    2998:	fca42e23          	sw	a0,-36(s0)
    299c:	fcb42c23          	sw	a1,-40(s0)
    29a0:	fcc42a23          	sw	a2,-44(s0)
    29a4:	fcd42823          	sw	a3,-48(s0)
    29a8:	fe042623          	sw	zero,-20(s0)
    29ac:	1480006f          	j	2af4 <matrix_mul_matrix+0x174>
    29b0:	fe042423          	sw	zero,-24(s0)
    29b4:	1280006f          	j	2adc <matrix_mul_matrix+0x15c>
    29b8:	fdc42583          	lw	a1,-36(s0)
    29bc:	fec42503          	lw	a0,-20(s0)
    29c0:	6d9040ef          	jal	7898 <__mulsi3>
    29c4:	00050793          	mv	a5,a0
    29c8:	00078713          	mv	a4,a5
    29cc:	fe842783          	lw	a5,-24(s0)
    29d0:	00f707b3          	add	a5,a4,a5
    29d4:	00279793          	sll	a5,a5,0x2
    29d8:	fd842703          	lw	a4,-40(s0)
    29dc:	00f707b3          	add	a5,a4,a5
    29e0:	0007a023          	sw	zero,0(a5)
    29e4:	fe042223          	sw	zero,-28(s0)
    29e8:	0dc0006f          	j	2ac4 <matrix_mul_matrix+0x144>
    29ec:	fdc42583          	lw	a1,-36(s0)
    29f0:	fec42503          	lw	a0,-20(s0)
    29f4:	6a5040ef          	jal	7898 <__mulsi3>
    29f8:	00050793          	mv	a5,a0
    29fc:	00078713          	mv	a4,a5
    2a00:	fe842783          	lw	a5,-24(s0)
    2a04:	00f707b3          	add	a5,a4,a5
    2a08:	00279793          	sll	a5,a5,0x2
    2a0c:	fd842703          	lw	a4,-40(s0)
    2a10:	00f707b3          	add	a5,a4,a5
    2a14:	0007a483          	lw	s1,0(a5)
    2a18:	fdc42583          	lw	a1,-36(s0)
    2a1c:	fec42503          	lw	a0,-20(s0)
    2a20:	679040ef          	jal	7898 <__mulsi3>
    2a24:	00050793          	mv	a5,a0
    2a28:	00078713          	mv	a4,a5
    2a2c:	fe442783          	lw	a5,-28(s0)
    2a30:	00f707b3          	add	a5,a4,a5
    2a34:	00179793          	sll	a5,a5,0x1
    2a38:	fd442703          	lw	a4,-44(s0)
    2a3c:	00f707b3          	add	a5,a4,a5
    2a40:	00079783          	lh	a5,0(a5)
    2a44:	00078913          	mv	s2,a5
    2a48:	fdc42583          	lw	a1,-36(s0)
    2a4c:	fe442503          	lw	a0,-28(s0)
    2a50:	649040ef          	jal	7898 <__mulsi3>
    2a54:	00050793          	mv	a5,a0
    2a58:	00078713          	mv	a4,a5
    2a5c:	fe842783          	lw	a5,-24(s0)
    2a60:	00f707b3          	add	a5,a4,a5
    2a64:	00179793          	sll	a5,a5,0x1
    2a68:	fd042703          	lw	a4,-48(s0)
    2a6c:	00f707b3          	add	a5,a4,a5
    2a70:	00079783          	lh	a5,0(a5)
    2a74:	00078593          	mv	a1,a5
    2a78:	00090513          	mv	a0,s2
    2a7c:	61d040ef          	jal	7898 <__mulsi3>
    2a80:	00050793          	mv	a5,a0
    2a84:	00078913          	mv	s2,a5
    2a88:	fdc42583          	lw	a1,-36(s0)
    2a8c:	fec42503          	lw	a0,-20(s0)
    2a90:	609040ef          	jal	7898 <__mulsi3>
    2a94:	00050793          	mv	a5,a0
    2a98:	00078713          	mv	a4,a5
    2a9c:	fe842783          	lw	a5,-24(s0)
    2aa0:	00f707b3          	add	a5,a4,a5
    2aa4:	00279793          	sll	a5,a5,0x2
    2aa8:	fd842703          	lw	a4,-40(s0)
    2aac:	00f707b3          	add	a5,a4,a5
    2ab0:	01248733          	add	a4,s1,s2
    2ab4:	00e7a023          	sw	a4,0(a5)
    2ab8:	fe442783          	lw	a5,-28(s0)
    2abc:	00178793          	add	a5,a5,1
    2ac0:	fef42223          	sw	a5,-28(s0)
    2ac4:	fe442703          	lw	a4,-28(s0)
    2ac8:	fdc42783          	lw	a5,-36(s0)
    2acc:	f2f760e3          	bltu	a4,a5,29ec <matrix_mul_matrix+0x6c>
    2ad0:	fe842783          	lw	a5,-24(s0)
    2ad4:	00178793          	add	a5,a5,1
    2ad8:	fef42423          	sw	a5,-24(s0)
    2adc:	fe842703          	lw	a4,-24(s0)
    2ae0:	fdc42783          	lw	a5,-36(s0)
    2ae4:	ecf76ae3          	bltu	a4,a5,29b8 <matrix_mul_matrix+0x38>
    2ae8:	fec42783          	lw	a5,-20(s0)
    2aec:	00178793          	add	a5,a5,1
    2af0:	fef42623          	sw	a5,-20(s0)
    2af4:	fec42703          	lw	a4,-20(s0)
    2af8:	fdc42783          	lw	a5,-36(s0)
    2afc:	eaf76ae3          	bltu	a4,a5,29b0 <matrix_mul_matrix+0x30>
    2b00:	00000013          	nop
    2b04:	00000013          	nop
    2b08:	02c12083          	lw	ra,44(sp)
    2b0c:	02812403          	lw	s0,40(sp)
    2b10:	02412483          	lw	s1,36(sp)
    2b14:	02012903          	lw	s2,32(sp)
    2b18:	03010113          	add	sp,sp,48
    2b1c:	00008067          	ret

00002b20 <matrix_mul_matrix_bitextract>:
    2b20:	fd010113          	add	sp,sp,-48
    2b24:	02112623          	sw	ra,44(sp)
    2b28:	02812423          	sw	s0,40(sp)
    2b2c:	02912223          	sw	s1,36(sp)
    2b30:	03010413          	add	s0,sp,48
    2b34:	fca42e23          	sw	a0,-36(s0)
    2b38:	fcb42c23          	sw	a1,-40(s0)
    2b3c:	fcc42a23          	sw	a2,-44(s0)
    2b40:	fcd42823          	sw	a3,-48(s0)
    2b44:	fe042623          	sw	zero,-20(s0)
    2b48:	1780006f          	j	2cc0 <matrix_mul_matrix_bitextract+0x1a0>
    2b4c:	fe042423          	sw	zero,-24(s0)
    2b50:	1580006f          	j	2ca8 <matrix_mul_matrix_bitextract+0x188>
    2b54:	fdc42583          	lw	a1,-36(s0)
    2b58:	fec42503          	lw	a0,-20(s0)
    2b5c:	53d040ef          	jal	7898 <__mulsi3>
    2b60:	00050793          	mv	a5,a0
    2b64:	00078713          	mv	a4,a5
    2b68:	fe842783          	lw	a5,-24(s0)
    2b6c:	00f707b3          	add	a5,a4,a5
    2b70:	00279793          	sll	a5,a5,0x2
    2b74:	fd842703          	lw	a4,-40(s0)
    2b78:	00f707b3          	add	a5,a4,a5
    2b7c:	0007a023          	sw	zero,0(a5)
    2b80:	fe042223          	sw	zero,-28(s0)
    2b84:	10c0006f          	j	2c90 <matrix_mul_matrix_bitextract+0x170>
    2b88:	fdc42583          	lw	a1,-36(s0)
    2b8c:	fec42503          	lw	a0,-20(s0)
    2b90:	509040ef          	jal	7898 <__mulsi3>
    2b94:	00050793          	mv	a5,a0
    2b98:	00078713          	mv	a4,a5
    2b9c:	fe442783          	lw	a5,-28(s0)
    2ba0:	00f707b3          	add	a5,a4,a5
    2ba4:	00179793          	sll	a5,a5,0x1
    2ba8:	fd442703          	lw	a4,-44(s0)
    2bac:	00f707b3          	add	a5,a4,a5
    2bb0:	00079783          	lh	a5,0(a5)
    2bb4:	00078493          	mv	s1,a5
    2bb8:	fdc42583          	lw	a1,-36(s0)
    2bbc:	fe442503          	lw	a0,-28(s0)
    2bc0:	4d9040ef          	jal	7898 <__mulsi3>
    2bc4:	00050793          	mv	a5,a0
    2bc8:	00078713          	mv	a4,a5
    2bcc:	fe842783          	lw	a5,-24(s0)
    2bd0:	00f707b3          	add	a5,a4,a5
    2bd4:	00179793          	sll	a5,a5,0x1
    2bd8:	fd042703          	lw	a4,-48(s0)
    2bdc:	00f707b3          	add	a5,a4,a5
    2be0:	00079783          	lh	a5,0(a5)
    2be4:	00078593          	mv	a1,a5
    2be8:	00048513          	mv	a0,s1
    2bec:	4ad040ef          	jal	7898 <__mulsi3>
    2bf0:	00050793          	mv	a5,a0
    2bf4:	fef42023          	sw	a5,-32(s0)
    2bf8:	fdc42583          	lw	a1,-36(s0)
    2bfc:	fec42503          	lw	a0,-20(s0)
    2c00:	499040ef          	jal	7898 <__mulsi3>
    2c04:	00050793          	mv	a5,a0
    2c08:	00078713          	mv	a4,a5
    2c0c:	fe842783          	lw	a5,-24(s0)
    2c10:	00f707b3          	add	a5,a4,a5
    2c14:	00279793          	sll	a5,a5,0x2
    2c18:	fd842703          	lw	a4,-40(s0)
    2c1c:	00f707b3          	add	a5,a4,a5
    2c20:	0007a783          	lw	a5,0(a5)
    2c24:	00078493          	mv	s1,a5
    2c28:	fe042783          	lw	a5,-32(s0)
    2c2c:	4027d793          	sra	a5,a5,0x2
    2c30:	00f7f713          	and	a4,a5,15
    2c34:	fe042783          	lw	a5,-32(s0)
    2c38:	4057d793          	sra	a5,a5,0x5
    2c3c:	07f7f793          	and	a5,a5,127
    2c40:	00078593          	mv	a1,a5
    2c44:	00070513          	mv	a0,a4
    2c48:	451040ef          	jal	7898 <__mulsi3>
    2c4c:	00050793          	mv	a5,a0
    2c50:	00f484b3          	add	s1,s1,a5
    2c54:	fdc42583          	lw	a1,-36(s0)
    2c58:	fec42503          	lw	a0,-20(s0)
    2c5c:	43d040ef          	jal	7898 <__mulsi3>
    2c60:	00050793          	mv	a5,a0
    2c64:	00078713          	mv	a4,a5
    2c68:	fe842783          	lw	a5,-24(s0)
    2c6c:	00f707b3          	add	a5,a4,a5
    2c70:	00279793          	sll	a5,a5,0x2
    2c74:	fd842703          	lw	a4,-40(s0)
    2c78:	00f707b3          	add	a5,a4,a5
    2c7c:	00048713          	mv	a4,s1
    2c80:	00e7a023          	sw	a4,0(a5)
    2c84:	fe442783          	lw	a5,-28(s0)
    2c88:	00178793          	add	a5,a5,1
    2c8c:	fef42223          	sw	a5,-28(s0)
    2c90:	fe442703          	lw	a4,-28(s0)
    2c94:	fdc42783          	lw	a5,-36(s0)
    2c98:	eef768e3          	bltu	a4,a5,2b88 <matrix_mul_matrix_bitextract+0x68>
    2c9c:	fe842783          	lw	a5,-24(s0)
    2ca0:	00178793          	add	a5,a5,1
    2ca4:	fef42423          	sw	a5,-24(s0)
    2ca8:	fe842703          	lw	a4,-24(s0)
    2cac:	fdc42783          	lw	a5,-36(s0)
    2cb0:	eaf762e3          	bltu	a4,a5,2b54 <matrix_mul_matrix_bitextract+0x34>
    2cb4:	fec42783          	lw	a5,-20(s0)
    2cb8:	00178793          	add	a5,a5,1
    2cbc:	fef42623          	sw	a5,-20(s0)
    2cc0:	fec42703          	lw	a4,-20(s0)
    2cc4:	fdc42783          	lw	a5,-36(s0)
    2cc8:	e8f762e3          	bltu	a4,a5,2b4c <matrix_mul_matrix_bitextract+0x2c>
    2ccc:	00000013          	nop
    2cd0:	00000013          	nop
    2cd4:	02c12083          	lw	ra,44(sp)
    2cd8:	02812403          	lw	s0,40(sp)
    2cdc:	02412483          	lw	s1,36(sp)
    2ce0:	03010113          	add	sp,sp,48
    2ce4:	00008067          	ret

00002ce8 <barebones_clock>:
    2ce8:	fe010113          	add	sp,sp,-32
    2cec:	00812e23          	sw	s0,28(sp)
    2cf0:	02010413          	add	s0,sp,32
    2cf4:	080007b7          	lui	a5,0x8000
    2cf8:	fef42623          	sw	a5,-20(s0)
    2cfc:	fec42783          	lw	a5,-20(s0)
    2d00:	0007a783          	lw	a5,0(a5) # 8000000 <__subdf3+0x7ff841c>
    2d04:	fef42423          	sw	a5,-24(s0)
    2d08:	fe842783          	lw	a5,-24(s0)
    2d0c:	00078513          	mv	a0,a5
    2d10:	01c12403          	lw	s0,28(sp)
    2d14:	02010113          	add	sp,sp,32
    2d18:	00008067          	ret

00002d1c <start_time>:
    2d1c:	ff010113          	add	sp,sp,-16
    2d20:	00112623          	sw	ra,12(sp)
    2d24:	00812423          	sw	s0,8(sp)
    2d28:	01010413          	add	s0,sp,16
    2d2c:	fbdff0ef          	jal	2ce8 <barebones_clock>
    2d30:	00050713          	mv	a4,a0
    2d34:	000017b7          	lui	a5,0x1
    2d38:	8ce7ae23          	sw	a4,-1828(a5) # 8dc <start_time_val>
    2d3c:	00000013          	nop
    2d40:	00c12083          	lw	ra,12(sp)
    2d44:	00812403          	lw	s0,8(sp)
    2d48:	01010113          	add	sp,sp,16
    2d4c:	00008067          	ret

00002d50 <stop_time>:
    2d50:	ff010113          	add	sp,sp,-16
    2d54:	00112623          	sw	ra,12(sp)
    2d58:	00812423          	sw	s0,8(sp)
    2d5c:	01010413          	add	s0,sp,16
    2d60:	f89ff0ef          	jal	2ce8 <barebones_clock>
    2d64:	00050713          	mv	a4,a0
    2d68:	000017b7          	lui	a5,0x1
    2d6c:	8ee7a023          	sw	a4,-1824(a5) # 8e0 <stop_time_val>
    2d70:	00000013          	nop
    2d74:	00c12083          	lw	ra,12(sp)
    2d78:	00812403          	lw	s0,8(sp)
    2d7c:	01010113          	add	sp,sp,16
    2d80:	00008067          	ret

00002d84 <get_time>:
    2d84:	fe010113          	add	sp,sp,-32
    2d88:	00812e23          	sw	s0,28(sp)
    2d8c:	02010413          	add	s0,sp,32
    2d90:	000017b7          	lui	a5,0x1
    2d94:	8e07a703          	lw	a4,-1824(a5) # 8e0 <stop_time_val>
    2d98:	000017b7          	lui	a5,0x1
    2d9c:	8dc7a783          	lw	a5,-1828(a5) # 8dc <start_time_val>
    2da0:	40f707b3          	sub	a5,a4,a5
    2da4:	fef42623          	sw	a5,-20(s0)
    2da8:	fec42783          	lw	a5,-20(s0)
    2dac:	00078513          	mv	a0,a5
    2db0:	01c12403          	lw	s0,28(sp)
    2db4:	02010113          	add	sp,sp,32
    2db8:	00008067          	ret

00002dbc <time_in_secs>:
    2dbc:	fd010113          	add	sp,sp,-48
    2dc0:	02112623          	sw	ra,44(sp)
    2dc4:	02812423          	sw	s0,40(sp)
    2dc8:	03010413          	add	s0,sp,48
    2dcc:	fca42e23          	sw	a0,-36(s0)
    2dd0:	fdc42503          	lw	a0,-36(s0)
    2dd4:	201040ef          	jal	77d4 <__floatunsidf>
    2dd8:	00050713          	mv	a4,a0
    2ddc:	00058793          	mv	a5,a1
    2de0:	49802603          	lw	a2,1176(zero) # 498 <default_num_contexts+0x8>
    2de4:	49c02683          	lw	a3,1180(zero) # 49c <default_num_contexts+0xc>
    2de8:	00070513          	mv	a0,a4
    2dec:	00078593          	mv	a1,a5
    2df0:	620030ef          	jal	6410 <__divdf3>
    2df4:	00050713          	mv	a4,a0
    2df8:	00058793          	mv	a5,a1
    2dfc:	fee42423          	sw	a4,-24(s0)
    2e00:	fef42623          	sw	a5,-20(s0)
    2e04:	fe842703          	lw	a4,-24(s0)
    2e08:	fec42783          	lw	a5,-20(s0)
    2e0c:	00070513          	mv	a0,a4
    2e10:	00078593          	mv	a1,a5
    2e14:	02c12083          	lw	ra,44(sp)
    2e18:	02812403          	lw	s0,40(sp)
    2e1c:	03010113          	add	sp,sp,48
    2e20:	00008067          	ret

00002e24 <portable_init>:
    2e24:	fd010113          	add	sp,sp,-48
    2e28:	02812623          	sw	s0,44(sp)
    2e2c:	03010413          	add	s0,sp,48
    2e30:	fca42e23          	sw	a0,-36(s0)
    2e34:	fcb42c23          	sw	a1,-40(s0)
    2e38:	fcc42a23          	sw	a2,-44(s0)
    2e3c:	060007b7          	lui	a5,0x6000
    2e40:	fef42623          	sw	a5,-20(s0)
    2e44:	fec42783          	lw	a5,-20(s0)
    2e48:	00c78793          	add	a5,a5,12 # 600000c <__subdf3+0x5ff8428>
    2e4c:	0001c737          	lui	a4,0x1c
    2e50:	20070713          	add	a4,a4,512 # 1c200 <__subdf3+0x1461c>
    2e54:	00e7a023          	sw	a4,0(a5)
    2e58:	fec42783          	lw	a5,-20(s0)
    2e5c:	01078793          	add	a5,a5,16
    2e60:	00100713          	li	a4,1
    2e64:	00e7a023          	sw	a4,0(a5)
    2e68:	fec42783          	lw	a5,-20(s0)
    2e6c:	01478793          	add	a5,a5,20
    2e70:	00100713          	li	a4,1
    2e74:	00e7a023          	sw	a4,0(a5)
    2e78:	fdc42783          	lw	a5,-36(s0)
    2e7c:	00100713          	li	a4,1
    2e80:	00e78023          	sb	a4,0(a5)
    2e84:	00000013          	nop
    2e88:	02c12403          	lw	s0,44(sp)
    2e8c:	03010113          	add	sp,sp,48
    2e90:	00008067          	ret

00002e94 <portable_fini>:
    2e94:	fe010113          	add	sp,sp,-32
    2e98:	00812e23          	sw	s0,28(sp)
    2e9c:	02010413          	add	s0,sp,32
    2ea0:	fea42623          	sw	a0,-20(s0)
    2ea4:	fec42783          	lw	a5,-20(s0)
    2ea8:	00078023          	sb	zero,0(a5)
    2eac:	00000013          	nop
    2eb0:	01c12403          	lw	s0,28(sp)
    2eb4:	02010113          	add	sp,sp,32
    2eb8:	00008067          	ret

00002ebc <core_bench_state>:
    2ebc:	f9010113          	add	sp,sp,-112
    2ec0:	06112623          	sw	ra,108(sp)
    2ec4:	06812423          	sw	s0,104(sp)
    2ec8:	07010413          	add	s0,sp,112
    2ecc:	f8a42e23          	sw	a0,-100(s0)
    2ed0:	f8b42c23          	sw	a1,-104(s0)
    2ed4:	00060593          	mv	a1,a2
    2ed8:	00068613          	mv	a2,a3
    2edc:	00070693          	mv	a3,a4
    2ee0:	00078713          	mv	a4,a5
    2ee4:	00058793          	mv	a5,a1
    2ee8:	f8f41b23          	sh	a5,-106(s0)
    2eec:	00060793          	mv	a5,a2
    2ef0:	f8f41a23          	sh	a5,-108(s0)
    2ef4:	00068793          	mv	a5,a3
    2ef8:	f8f41923          	sh	a5,-110(s0)
    2efc:	00070793          	mv	a5,a4
    2f00:	f8f41823          	sh	a5,-112(s0)
    2f04:	f9842783          	lw	a5,-104(s0)
    2f08:	faf42023          	sw	a5,-96(s0)
    2f0c:	fe042623          	sw	zero,-20(s0)
    2f10:	04c0006f          	j	2f5c <core_bench_state+0xa0>
    2f14:	fec42783          	lw	a5,-20(s0)
    2f18:	00279793          	sll	a5,a5,0x2
    2f1c:	ff078793          	add	a5,a5,-16
    2f20:	008787b3          	add	a5,a5,s0
    2f24:	fa07aa23          	sw	zero,-76(a5)
    2f28:	fec42783          	lw	a5,-20(s0)
    2f2c:	00279793          	sll	a5,a5,0x2
    2f30:	ff078793          	add	a5,a5,-16
    2f34:	008787b3          	add	a5,a5,s0
    2f38:	fb47a703          	lw	a4,-76(a5)
    2f3c:	fec42783          	lw	a5,-20(s0)
    2f40:	00279793          	sll	a5,a5,0x2
    2f44:	ff078793          	add	a5,a5,-16
    2f48:	008787b3          	add	a5,a5,s0
    2f4c:	fce7aa23          	sw	a4,-44(a5)
    2f50:	fec42783          	lw	a5,-20(s0)
    2f54:	00178793          	add	a5,a5,1
    2f58:	fef42623          	sw	a5,-20(s0)
    2f5c:	fec42703          	lw	a4,-20(s0)
    2f60:	00700793          	li	a5,7
    2f64:	fae7f8e3          	bgeu	a5,a4,2f14 <core_bench_state+0x58>
    2f68:	0480006f          	j	2fb0 <core_bench_state+0xf4>
    2f6c:	fa440713          	add	a4,s0,-92
    2f70:	fa040793          	add	a5,s0,-96
    2f74:	00070593          	mv	a1,a4
    2f78:	00078513          	mv	a0,a5
    2f7c:	4b4000ef          	jal	3430 <core_state_transition>
    2f80:	fea42223          	sw	a0,-28(s0)
    2f84:	fe442783          	lw	a5,-28(s0)
    2f88:	00279793          	sll	a5,a5,0x2
    2f8c:	ff078793          	add	a5,a5,-16
    2f90:	008787b3          	add	a5,a5,s0
    2f94:	fd47a783          	lw	a5,-44(a5)
    2f98:	00178713          	add	a4,a5,1
    2f9c:	fe442783          	lw	a5,-28(s0)
    2fa0:	00279793          	sll	a5,a5,0x2
    2fa4:	ff078793          	add	a5,a5,-16
    2fa8:	008787b3          	add	a5,a5,s0
    2fac:	fce7aa23          	sw	a4,-44(a5)
    2fb0:	fa042783          	lw	a5,-96(s0)
    2fb4:	0007c783          	lbu	a5,0(a5)
    2fb8:	fa079ae3          	bnez	a5,2f6c <core_bench_state+0xb0>
    2fbc:	f9842783          	lw	a5,-104(s0)
    2fc0:	faf42023          	sw	a5,-96(s0)
    2fc4:	0440006f          	j	3008 <core_bench_state+0x14c>
    2fc8:	fa042783          	lw	a5,-96(s0)
    2fcc:	0007c703          	lbu	a4,0(a5)
    2fd0:	02c00793          	li	a5,44
    2fd4:	02f70263          	beq	a4,a5,2ff8 <core_bench_state+0x13c>
    2fd8:	fa042783          	lw	a5,-96(s0)
    2fdc:	0007c683          	lbu	a3,0(a5)
    2fe0:	f9645783          	lhu	a5,-106(s0)
    2fe4:	0ff7f713          	zext.b	a4,a5
    2fe8:	fa042783          	lw	a5,-96(s0)
    2fec:	00e6c733          	xor	a4,a3,a4
    2ff0:	0ff77713          	zext.b	a4,a4
    2ff4:	00e78023          	sb	a4,0(a5)
    2ff8:	fa042703          	lw	a4,-96(s0)
    2ffc:	f9241783          	lh	a5,-110(s0)
    3000:	00f707b3          	add	a5,a4,a5
    3004:	faf42023          	sw	a5,-96(s0)
    3008:	f9842703          	lw	a4,-104(s0)
    300c:	f9c42783          	lw	a5,-100(s0)
    3010:	00f70733          	add	a4,a4,a5
    3014:	fa042783          	lw	a5,-96(s0)
    3018:	fae7e8e3          	bltu	a5,a4,2fc8 <core_bench_state+0x10c>
    301c:	f9842783          	lw	a5,-104(s0)
    3020:	faf42023          	sw	a5,-96(s0)
    3024:	0480006f          	j	306c <core_bench_state+0x1b0>
    3028:	fa440713          	add	a4,s0,-92
    302c:	fa040793          	add	a5,s0,-96
    3030:	00070593          	mv	a1,a4
    3034:	00078513          	mv	a0,a5
    3038:	3f8000ef          	jal	3430 <core_state_transition>
    303c:	fea42423          	sw	a0,-24(s0)
    3040:	fe842783          	lw	a5,-24(s0)
    3044:	00279793          	sll	a5,a5,0x2
    3048:	ff078793          	add	a5,a5,-16
    304c:	008787b3          	add	a5,a5,s0
    3050:	fd47a783          	lw	a5,-44(a5)
    3054:	00178713          	add	a4,a5,1
    3058:	fe842783          	lw	a5,-24(s0)
    305c:	00279793          	sll	a5,a5,0x2
    3060:	ff078793          	add	a5,a5,-16
    3064:	008787b3          	add	a5,a5,s0
    3068:	fce7aa23          	sw	a4,-44(a5)
    306c:	fa042783          	lw	a5,-96(s0)
    3070:	0007c783          	lbu	a5,0(a5)
    3074:	fa079ae3          	bnez	a5,3028 <core_bench_state+0x16c>
    3078:	f9842783          	lw	a5,-104(s0)
    307c:	faf42023          	sw	a5,-96(s0)
    3080:	0440006f          	j	30c4 <core_bench_state+0x208>
    3084:	fa042783          	lw	a5,-96(s0)
    3088:	0007c703          	lbu	a4,0(a5)
    308c:	02c00793          	li	a5,44
    3090:	02f70263          	beq	a4,a5,30b4 <core_bench_state+0x1f8>
    3094:	fa042783          	lw	a5,-96(s0)
    3098:	0007c683          	lbu	a3,0(a5)
    309c:	f9445783          	lhu	a5,-108(s0)
    30a0:	0ff7f713          	zext.b	a4,a5
    30a4:	fa042783          	lw	a5,-96(s0)
    30a8:	00e6c733          	xor	a4,a3,a4
    30ac:	0ff77713          	zext.b	a4,a4
    30b0:	00e78023          	sb	a4,0(a5)
    30b4:	fa042703          	lw	a4,-96(s0)
    30b8:	f9241783          	lh	a5,-110(s0)
    30bc:	00f707b3          	add	a5,a4,a5
    30c0:	faf42023          	sw	a5,-96(s0)
    30c4:	f9842703          	lw	a4,-104(s0)
    30c8:	f9c42783          	lw	a5,-100(s0)
    30cc:	00f70733          	add	a4,a4,a5
    30d0:	fa042783          	lw	a5,-96(s0)
    30d4:	fae7e8e3          	bltu	a5,a4,3084 <core_bench_state+0x1c8>
    30d8:	fe042623          	sw	zero,-20(s0)
    30dc:	0680006f          	j	3144 <core_bench_state+0x288>
    30e0:	fec42783          	lw	a5,-20(s0)
    30e4:	00279793          	sll	a5,a5,0x2
    30e8:	ff078793          	add	a5,a5,-16
    30ec:	008787b3          	add	a5,a5,s0
    30f0:	fd47a783          	lw	a5,-44(a5)
    30f4:	f9045703          	lhu	a4,-112(s0)
    30f8:	00070593          	mv	a1,a4
    30fc:	00078513          	mv	a0,a5
    3100:	0f5000ef          	jal	39f4 <crcu32>
    3104:	00050793          	mv	a5,a0
    3108:	f8f41823          	sh	a5,-112(s0)
    310c:	fec42783          	lw	a5,-20(s0)
    3110:	00279793          	sll	a5,a5,0x2
    3114:	ff078793          	add	a5,a5,-16
    3118:	008787b3          	add	a5,a5,s0
    311c:	fb47a783          	lw	a5,-76(a5)
    3120:	f9045703          	lhu	a4,-112(s0)
    3124:	00070593          	mv	a1,a4
    3128:	00078513          	mv	a0,a5
    312c:	0c9000ef          	jal	39f4 <crcu32>
    3130:	00050793          	mv	a5,a0
    3134:	f8f41823          	sh	a5,-112(s0)
    3138:	fec42783          	lw	a5,-20(s0)
    313c:	00178793          	add	a5,a5,1
    3140:	fef42623          	sw	a5,-20(s0)
    3144:	fec42703          	lw	a4,-20(s0)
    3148:	00700793          	li	a5,7
    314c:	f8e7fae3          	bgeu	a5,a4,30e0 <core_bench_state+0x224>
    3150:	f9045783          	lhu	a5,-112(s0)
    3154:	00078513          	mv	a0,a5
    3158:	06c12083          	lw	ra,108(sp)
    315c:	06812403          	lw	s0,104(sp)
    3160:	07010113          	add	sp,sp,112
    3164:	00008067          	ret

00003168 <core_init_state>:
    3168:	fd010113          	add	sp,sp,-48
    316c:	02812623          	sw	s0,44(sp)
    3170:	03010413          	add	s0,sp,48
    3174:	fca42e23          	sw	a0,-36(s0)
    3178:	00058793          	mv	a5,a1
    317c:	fcc42a23          	sw	a2,-44(s0)
    3180:	fcf41d23          	sh	a5,-38(s0)
    3184:	fe042623          	sw	zero,-20(s0)
    3188:	fe042423          	sw	zero,-24(s0)
    318c:	fe042023          	sw	zero,-32(s0)
    3190:	fdc42783          	lw	a5,-36(s0)
    3194:	fff78793          	add	a5,a5,-1
    3198:	fcf42e23          	sw	a5,-36(s0)
    319c:	fe042423          	sw	zero,-24(s0)
    31a0:	1dc0006f          	j	337c <core_init_state+0x214>
    31a4:	fe842783          	lw	a5,-24(s0)
    31a8:	06078e63          	beqz	a5,3224 <core_init_state+0xbc>
    31ac:	fe042223          	sw	zero,-28(s0)
    31b0:	0380006f          	j	31e8 <core_init_state+0x80>
    31b4:	fe042703          	lw	a4,-32(s0)
    31b8:	fe442783          	lw	a5,-28(s0)
    31bc:	00f70733          	add	a4,a4,a5
    31c0:	fec42683          	lw	a3,-20(s0)
    31c4:	fe442783          	lw	a5,-28(s0)
    31c8:	00f687b3          	add	a5,a3,a5
    31cc:	fd442683          	lw	a3,-44(s0)
    31d0:	00f687b3          	add	a5,a3,a5
    31d4:	00074703          	lbu	a4,0(a4)
    31d8:	00e78023          	sb	a4,0(a5)
    31dc:	fe442783          	lw	a5,-28(s0)
    31e0:	00178793          	add	a5,a5,1
    31e4:	fef42223          	sw	a5,-28(s0)
    31e8:	fe442703          	lw	a4,-28(s0)
    31ec:	fe842783          	lw	a5,-24(s0)
    31f0:	fcf762e3          	bltu	a4,a5,31b4 <core_init_state+0x4c>
    31f4:	fec42703          	lw	a4,-20(s0)
    31f8:	fe442783          	lw	a5,-28(s0)
    31fc:	00f707b3          	add	a5,a4,a5
    3200:	fd442703          	lw	a4,-44(s0)
    3204:	00f707b3          	add	a5,a4,a5
    3208:	02c00713          	li	a4,44
    320c:	00e78023          	sb	a4,0(a5)
    3210:	fe842703          	lw	a4,-24(s0)
    3214:	fec42783          	lw	a5,-20(s0)
    3218:	00f707b3          	add	a5,a4,a5
    321c:	00178793          	add	a5,a5,1
    3220:	fef42623          	sw	a5,-20(s0)
    3224:	fda41783          	lh	a5,-38(s0)
    3228:	01079793          	sll	a5,a5,0x10
    322c:	0107d793          	srl	a5,a5,0x10
    3230:	00178793          	add	a5,a5,1
    3234:	01079793          	sll	a5,a5,0x10
    3238:	0107d793          	srl	a5,a5,0x10
    323c:	fcf41d23          	sh	a5,-38(s0)
    3240:	fda45783          	lhu	a5,-38(s0)
    3244:	0077f793          	and	a5,a5,7
    3248:	00700713          	li	a4,7
    324c:	0ee78863          	beq	a5,a4,333c <core_init_state+0x1d4>
    3250:	00700713          	li	a4,7
    3254:	12f74263          	blt	a4,a5,3378 <core_init_state+0x210>
    3258:	00600713          	li	a4,6
    325c:	10f74e63          	blt	a4,a5,3378 <core_init_state+0x210>
    3260:	00500713          	li	a4,5
    3264:	08e7de63          	bge	a5,a4,3300 <core_init_state+0x198>
    3268:	00200713          	li	a4,2
    326c:	00f74663          	blt	a4,a5,3278 <core_init_state+0x110>
    3270:	0007dc63          	bgez	a5,3288 <core_init_state+0x120>
    3274:	1040006f          	j	3378 <core_init_state+0x210>
    3278:	ffd78713          	add	a4,a5,-3
    327c:	00100793          	li	a5,1
    3280:	0ee7ec63          	bltu	a5,a4,3378 <core_init_state+0x210>
    3284:	0400006f          	j	32c4 <core_init_state+0x15c>
    3288:	fda41783          	lh	a5,-38(s0)
    328c:	4037d793          	sra	a5,a5,0x3
    3290:	01079793          	sll	a5,a5,0x10
    3294:	4107d793          	sra	a5,a5,0x10
    3298:	01079793          	sll	a5,a5,0x10
    329c:	0107d793          	srl	a5,a5,0x10
    32a0:	0037f793          	and	a5,a5,3
    32a4:	4a000713          	li	a4,1184
    32a8:	00279793          	sll	a5,a5,0x2
    32ac:	00f707b3          	add	a5,a4,a5
    32b0:	0007a783          	lw	a5,0(a5)
    32b4:	fef42023          	sw	a5,-32(s0)
    32b8:	00400793          	li	a5,4
    32bc:	fef42423          	sw	a5,-24(s0)
    32c0:	0bc0006f          	j	337c <core_init_state+0x214>
    32c4:	fda41783          	lh	a5,-38(s0)
    32c8:	4037d793          	sra	a5,a5,0x3
    32cc:	01079793          	sll	a5,a5,0x10
    32d0:	4107d793          	sra	a5,a5,0x10
    32d4:	01079793          	sll	a5,a5,0x10
    32d8:	0107d793          	srl	a5,a5,0x10
    32dc:	0037f793          	and	a5,a5,3
    32e0:	4b000713          	li	a4,1200
    32e4:	00279793          	sll	a5,a5,0x2
    32e8:	00f707b3          	add	a5,a4,a5
    32ec:	0007a783          	lw	a5,0(a5)
    32f0:	fef42023          	sw	a5,-32(s0)
    32f4:	00800793          	li	a5,8
    32f8:	fef42423          	sw	a5,-24(s0)
    32fc:	0800006f          	j	337c <core_init_state+0x214>
    3300:	fda41783          	lh	a5,-38(s0)
    3304:	4037d793          	sra	a5,a5,0x3
    3308:	01079793          	sll	a5,a5,0x10
    330c:	4107d793          	sra	a5,a5,0x10
    3310:	01079793          	sll	a5,a5,0x10
    3314:	0107d793          	srl	a5,a5,0x10
    3318:	0037f793          	and	a5,a5,3
    331c:	4c000713          	li	a4,1216
    3320:	00279793          	sll	a5,a5,0x2
    3324:	00f707b3          	add	a5,a4,a5
    3328:	0007a783          	lw	a5,0(a5)
    332c:	fef42023          	sw	a5,-32(s0)
    3330:	00800793          	li	a5,8
    3334:	fef42423          	sw	a5,-24(s0)
    3338:	0440006f          	j	337c <core_init_state+0x214>
    333c:	fda41783          	lh	a5,-38(s0)
    3340:	4037d793          	sra	a5,a5,0x3
    3344:	01079793          	sll	a5,a5,0x10
    3348:	4107d793          	sra	a5,a5,0x10
    334c:	01079793          	sll	a5,a5,0x10
    3350:	0107d793          	srl	a5,a5,0x10
    3354:	0037f793          	and	a5,a5,3
    3358:	4d000713          	li	a4,1232
    335c:	00279793          	sll	a5,a5,0x2
    3360:	00f707b3          	add	a5,a4,a5
    3364:	0007a783          	lw	a5,0(a5)
    3368:	fef42023          	sw	a5,-32(s0)
    336c:	00800793          	li	a5,8
    3370:	fef42423          	sw	a5,-24(s0)
    3374:	0080006f          	j	337c <core_init_state+0x214>
    3378:	00000013          	nop
    337c:	fec42703          	lw	a4,-20(s0)
    3380:	fe842783          	lw	a5,-24(s0)
    3384:	00f707b3          	add	a5,a4,a5
    3388:	00178793          	add	a5,a5,1
    338c:	fdc42703          	lw	a4,-36(s0)
    3390:	e0e7eae3          	bltu	a5,a4,31a4 <core_init_state+0x3c>
    3394:	fdc42783          	lw	a5,-36(s0)
    3398:	00178793          	add	a5,a5,1
    339c:	fcf42e23          	sw	a5,-36(s0)
    33a0:	0200006f          	j	33c0 <core_init_state+0x258>
    33a4:	fd442703          	lw	a4,-44(s0)
    33a8:	fec42783          	lw	a5,-20(s0)
    33ac:	00f707b3          	add	a5,a4,a5
    33b0:	00078023          	sb	zero,0(a5)
    33b4:	fec42783          	lw	a5,-20(s0)
    33b8:	00178793          	add	a5,a5,1
    33bc:	fef42623          	sw	a5,-20(s0)
    33c0:	fec42703          	lw	a4,-20(s0)
    33c4:	fdc42783          	lw	a5,-36(s0)
    33c8:	fcf76ee3          	bltu	a4,a5,33a4 <core_init_state+0x23c>
    33cc:	00000013          	nop
    33d0:	00000013          	nop
    33d4:	02c12403          	lw	s0,44(sp)
    33d8:	03010113          	add	sp,sp,48
    33dc:	00008067          	ret

000033e0 <ee_isdigit>:
    33e0:	fd010113          	add	sp,sp,-48
    33e4:	02812623          	sw	s0,44(sp)
    33e8:	03010413          	add	s0,sp,48
    33ec:	00050793          	mv	a5,a0
    33f0:	fcf40fa3          	sb	a5,-33(s0)
    33f4:	fdf44783          	lbu	a5,-33(s0)
    33f8:	0307b793          	sltiu	a5,a5,48
    33fc:	0017b793          	seqz	a5,a5
    3400:	0ff7f713          	zext.b	a4,a5
    3404:	fdf44783          	lbu	a5,-33(s0)
    3408:	03a7b793          	sltiu	a5,a5,58
    340c:	0ff7f793          	zext.b	a5,a5
    3410:	00f777b3          	and	a5,a4,a5
    3414:	0ff7f793          	zext.b	a5,a5
    3418:	fef407a3          	sb	a5,-17(s0)
    341c:	fef44783          	lbu	a5,-17(s0)
    3420:	00078513          	mv	a0,a5
    3424:	02c12403          	lw	s0,44(sp)
    3428:	03010113          	add	sp,sp,48
    342c:	00008067          	ret

00003430 <core_state_transition>:
    3430:	fd010113          	add	sp,sp,-48
    3434:	02112623          	sw	ra,44(sp)
    3438:	02812423          	sw	s0,40(sp)
    343c:	03010413          	add	s0,sp,48
    3440:	fca42e23          	sw	a0,-36(s0)
    3444:	fcb42c23          	sw	a1,-40(s0)
    3448:	fdc42783          	lw	a5,-36(s0)
    344c:	0007a783          	lw	a5,0(a5)
    3450:	fef42623          	sw	a5,-20(s0)
    3454:	fe042423          	sw	zero,-24(s0)
    3458:	3340006f          	j	378c <_stack_ptr+0x18c>
    345c:	fec42783          	lw	a5,-20(s0)
    3460:	0007c783          	lbu	a5,0(a5)
    3464:	fef403a3          	sb	a5,-25(s0)
    3468:	fe744703          	lbu	a4,-25(s0)
    346c:	02c00793          	li	a5,44
    3470:	00f71a63          	bne	a4,a5,3484 <core_state_transition+0x54>
    3474:	fec42783          	lw	a5,-20(s0)
    3478:	00178793          	add	a5,a5,1
    347c:	fef42623          	sw	a5,-20(s0)
    3480:	3240006f          	j	37a4 <_stack_ptr+0x1a4>
    3484:	fe842703          	lw	a4,-24(s0)
    3488:	00700793          	li	a5,7
    348c:	2ce7ec63          	bltu	a5,a4,3764 <_stack_ptr+0x164>
    3490:	fe842783          	lw	a5,-24(s0)
    3494:	00279713          	sll	a4,a5,0x2
    3498:	59000793          	li	a5,1424
    349c:	00f707b3          	add	a5,a4,a5
    34a0:	0007a783          	lw	a5,0(a5)
    34a4:	00078067          	jr	a5
    34a8:	fe744783          	lbu	a5,-25(s0)
    34ac:	00078513          	mv	a0,a5
    34b0:	f31ff0ef          	jal	33e0 <ee_isdigit>
    34b4:	00050793          	mv	a5,a0
    34b8:	00078863          	beqz	a5,34c8 <core_state_transition+0x98>
    34bc:	00400793          	li	a5,4
    34c0:	fef42423          	sw	a5,-24(s0)
    34c4:	05c0006f          	j	3520 <core_state_transition+0xf0>
    34c8:	fe744703          	lbu	a4,-25(s0)
    34cc:	02b00793          	li	a5,43
    34d0:	00f70863          	beq	a4,a5,34e0 <core_state_transition+0xb0>
    34d4:	fe744703          	lbu	a4,-25(s0)
    34d8:	02d00793          	li	a5,45
    34dc:	00f71863          	bne	a4,a5,34ec <core_state_transition+0xbc>
    34e0:	00200793          	li	a5,2
    34e4:	fef42423          	sw	a5,-24(s0)
    34e8:	0380006f          	j	3520 <core_state_transition+0xf0>
    34ec:	fe744703          	lbu	a4,-25(s0)
    34f0:	02e00793          	li	a5,46
    34f4:	00f71863          	bne	a4,a5,3504 <core_state_transition+0xd4>
    34f8:	00500793          	li	a5,5
    34fc:	fef42423          	sw	a5,-24(s0)
    3500:	0200006f          	j	3520 <core_state_transition+0xf0>
    3504:	00100793          	li	a5,1
    3508:	fef42423          	sw	a5,-24(s0)
    350c:	fd842783          	lw	a5,-40(s0)
    3510:	00478793          	add	a5,a5,4
    3514:	0007a703          	lw	a4,0(a5)
    3518:	00170713          	add	a4,a4,1
    351c:	00e7a023          	sw	a4,0(a5)
    3520:	fd842783          	lw	a5,-40(s0)
    3524:	0007a783          	lw	a5,0(a5)
    3528:	00178713          	add	a4,a5,1
    352c:	fd842783          	lw	a5,-40(s0)
    3530:	00e7a023          	sw	a4,0(a5)
    3534:	24c0006f          	j	3780 <_stack_ptr+0x180>
    3538:	fe744783          	lbu	a5,-25(s0)
    353c:	00078513          	mv	a0,a5
    3540:	ea1ff0ef          	jal	33e0 <ee_isdigit>
    3544:	00050793          	mv	a5,a0
    3548:	02078263          	beqz	a5,356c <core_state_transition+0x13c>
    354c:	00400793          	li	a5,4
    3550:	fef42423          	sw	a5,-24(s0)
    3554:	fd842783          	lw	a5,-40(s0)
    3558:	00878793          	add	a5,a5,8
    355c:	0007a703          	lw	a4,0(a5)
    3560:	00170713          	add	a4,a4,1
    3564:	00e7a023          	sw	a4,0(a5)
    3568:	2180006f          	j	3780 <_stack_ptr+0x180>
    356c:	fe744703          	lbu	a4,-25(s0)
    3570:	02e00793          	li	a5,46
    3574:	02f71263          	bne	a4,a5,3598 <core_state_transition+0x168>
    3578:	00500793          	li	a5,5
    357c:	fef42423          	sw	a5,-24(s0)
    3580:	fd842783          	lw	a5,-40(s0)
    3584:	00878793          	add	a5,a5,8
    3588:	0007a703          	lw	a4,0(a5)
    358c:	00170713          	add	a4,a4,1
    3590:	00e7a023          	sw	a4,0(a5)
    3594:	1ec0006f          	j	3780 <_stack_ptr+0x180>
    3598:	00100793          	li	a5,1
    359c:	fef42423          	sw	a5,-24(s0)
    35a0:	fd842783          	lw	a5,-40(s0)
    35a4:	00878793          	add	a5,a5,8
    35a8:	0007a703          	lw	a4,0(a5)
    35ac:	00170713          	add	a4,a4,1
    35b0:	00e7a023          	sw	a4,0(a5)
    35b4:	1cc0006f          	j	3780 <_stack_ptr+0x180>
    35b8:	fe744703          	lbu	a4,-25(s0)
    35bc:	02e00793          	li	a5,46
    35c0:	02f71263          	bne	a4,a5,35e4 <core_state_transition+0x1b4>
    35c4:	00500793          	li	a5,5
    35c8:	fef42423          	sw	a5,-24(s0)
    35cc:	fd842783          	lw	a5,-40(s0)
    35d0:	01078793          	add	a5,a5,16
    35d4:	0007a703          	lw	a4,0(a5)
    35d8:	00170713          	add	a4,a4,1
    35dc:	00e7a023          	sw	a4,0(a5)
    35e0:	18c0006f          	j	376c <_stack_ptr+0x16c>
    35e4:	fe744783          	lbu	a5,-25(s0)
    35e8:	00078513          	mv	a0,a5
    35ec:	df5ff0ef          	jal	33e0 <ee_isdigit>
    35f0:	00050793          	mv	a5,a0
    35f4:	16079c63          	bnez	a5,376c <_stack_ptr+0x16c>
    35f8:	00100793          	li	a5,1
    35fc:	fef42423          	sw	a5,-24(s0)
    3600:	fd842783          	lw	a5,-40(s0)
    3604:	01078793          	add	a5,a5,16
    3608:	0007a703          	lw	a4,0(a5)
    360c:	00170713          	add	a4,a4,1
    3610:	00e7a023          	sw	a4,0(a5)
    3614:	1580006f          	j	376c <_stack_ptr+0x16c>
    3618:	fe744703          	lbu	a4,-25(s0)
    361c:	04500793          	li	a5,69
    3620:	00f70863          	beq	a4,a5,3630 <_stack_ptr+0x30>
    3624:	fe744703          	lbu	a4,-25(s0)
    3628:	06500793          	li	a5,101
    362c:	02f71263          	bne	a4,a5,3650 <_stack_ptr+0x50>
    3630:	00300793          	li	a5,3
    3634:	fef42423          	sw	a5,-24(s0)
    3638:	fd842783          	lw	a5,-40(s0)
    363c:	01478793          	add	a5,a5,20
    3640:	0007a703          	lw	a4,0(a5)
    3644:	00170713          	add	a4,a4,1
    3648:	00e7a023          	sw	a4,0(a5)
    364c:	1280006f          	j	3774 <_stack_ptr+0x174>
    3650:	fe744783          	lbu	a5,-25(s0)
    3654:	00078513          	mv	a0,a5
    3658:	d89ff0ef          	jal	33e0 <ee_isdigit>
    365c:	00050793          	mv	a5,a0
    3660:	10079a63          	bnez	a5,3774 <_stack_ptr+0x174>
    3664:	00100793          	li	a5,1
    3668:	fef42423          	sw	a5,-24(s0)
    366c:	fd842783          	lw	a5,-40(s0)
    3670:	01478793          	add	a5,a5,20
    3674:	0007a703          	lw	a4,0(a5)
    3678:	00170713          	add	a4,a4,1
    367c:	00e7a023          	sw	a4,0(a5)
    3680:	0f40006f          	j	3774 <_stack_ptr+0x174>
    3684:	fe744703          	lbu	a4,-25(s0)
    3688:	02b00793          	li	a5,43
    368c:	00f70863          	beq	a4,a5,369c <_stack_ptr+0x9c>
    3690:	fe744703          	lbu	a4,-25(s0)
    3694:	02d00793          	li	a5,45
    3698:	02f71263          	bne	a4,a5,36bc <_stack_ptr+0xbc>
    369c:	00600793          	li	a5,6
    36a0:	fef42423          	sw	a5,-24(s0)
    36a4:	fd842783          	lw	a5,-40(s0)
    36a8:	00c78793          	add	a5,a5,12
    36ac:	0007a703          	lw	a4,0(a5)
    36b0:	00170713          	add	a4,a4,1
    36b4:	00e7a023          	sw	a4,0(a5)
    36b8:	0c80006f          	j	3780 <_stack_ptr+0x180>
    36bc:	00100793          	li	a5,1
    36c0:	fef42423          	sw	a5,-24(s0)
    36c4:	fd842783          	lw	a5,-40(s0)
    36c8:	00c78793          	add	a5,a5,12
    36cc:	0007a703          	lw	a4,0(a5)
    36d0:	00170713          	add	a4,a4,1
    36d4:	00e7a023          	sw	a4,0(a5)
    36d8:	0a80006f          	j	3780 <_stack_ptr+0x180>
    36dc:	fe744783          	lbu	a5,-25(s0)
    36e0:	00078513          	mv	a0,a5
    36e4:	cfdff0ef          	jal	33e0 <ee_isdigit>
    36e8:	00050793          	mv	a5,a0
    36ec:	02078263          	beqz	a5,3710 <_stack_ptr+0x110>
    36f0:	00700793          	li	a5,7
    36f4:	fef42423          	sw	a5,-24(s0)
    36f8:	fd842783          	lw	a5,-40(s0)
    36fc:	01878793          	add	a5,a5,24
    3700:	0007a703          	lw	a4,0(a5)
    3704:	00170713          	add	a4,a4,1
    3708:	00e7a023          	sw	a4,0(a5)
    370c:	0740006f          	j	3780 <_stack_ptr+0x180>
    3710:	00100793          	li	a5,1
    3714:	fef42423          	sw	a5,-24(s0)
    3718:	fd842783          	lw	a5,-40(s0)
    371c:	01878793          	add	a5,a5,24
    3720:	0007a703          	lw	a4,0(a5)
    3724:	00170713          	add	a4,a4,1
    3728:	00e7a023          	sw	a4,0(a5)
    372c:	0540006f          	j	3780 <_stack_ptr+0x180>
    3730:	fe744783          	lbu	a5,-25(s0)
    3734:	00078513          	mv	a0,a5
    3738:	ca9ff0ef          	jal	33e0 <ee_isdigit>
    373c:	00050793          	mv	a5,a0
    3740:	02079e63          	bnez	a5,377c <_stack_ptr+0x17c>
    3744:	00100793          	li	a5,1
    3748:	fef42423          	sw	a5,-24(s0)
    374c:	fd842783          	lw	a5,-40(s0)
    3750:	00478793          	add	a5,a5,4
    3754:	0007a703          	lw	a4,0(a5)
    3758:	00170713          	add	a4,a4,1
    375c:	00e7a023          	sw	a4,0(a5)
    3760:	01c0006f          	j	377c <_stack_ptr+0x17c>
    3764:	00000013          	nop
    3768:	0180006f          	j	3780 <_stack_ptr+0x180>
    376c:	00000013          	nop
    3770:	0100006f          	j	3780 <_stack_ptr+0x180>
    3774:	00000013          	nop
    3778:	0080006f          	j	3780 <_stack_ptr+0x180>
    377c:	00000013          	nop
    3780:	fec42783          	lw	a5,-20(s0)
    3784:	00178793          	add	a5,a5,1
    3788:	fef42623          	sw	a5,-20(s0)
    378c:	fec42783          	lw	a5,-20(s0)
    3790:	0007c783          	lbu	a5,0(a5)
    3794:	00078863          	beqz	a5,37a4 <_stack_ptr+0x1a4>
    3798:	fe842703          	lw	a4,-24(s0)
    379c:	00100793          	li	a5,1
    37a0:	caf71ee3          	bne	a4,a5,345c <core_state_transition+0x2c>
    37a4:	fdc42783          	lw	a5,-36(s0)
    37a8:	fec42703          	lw	a4,-20(s0)
    37ac:	00e7a023          	sw	a4,0(a5)
    37b0:	fe842783          	lw	a5,-24(s0)
    37b4:	00078513          	mv	a0,a5
    37b8:	02c12083          	lw	ra,44(sp)
    37bc:	02812403          	lw	s0,40(sp)
    37c0:	03010113          	add	sp,sp,48
    37c4:	00008067          	ret

000037c8 <get_seed_32>:
    37c8:	fd010113          	add	sp,sp,-48
    37cc:	02812623          	sw	s0,44(sp)
    37d0:	03010413          	add	s0,sp,48
    37d4:	fca42e23          	sw	a0,-36(s0)
    37d8:	fdc42703          	lw	a4,-36(s0)
    37dc:	00500793          	li	a5,5
    37e0:	06e7e263          	bltu	a5,a4,3844 <get_seed_32+0x7c>
    37e4:	fdc42783          	lw	a5,-36(s0)
    37e8:	00279713          	sll	a4,a5,0x2
    37ec:	5b000793          	li	a5,1456
    37f0:	00f707b3          	add	a5,a4,a5
    37f4:	0007a783          	lw	a5,0(a5)
    37f8:	00078067          	jr	a5
    37fc:	000017b7          	lui	a5,0x1
    3800:	9347a783          	lw	a5,-1740(a5) # 934 <seed1_volatile>
    3804:	fef42623          	sw	a5,-20(s0)
    3808:	0440006f          	j	384c <get_seed_32+0x84>
    380c:	000017b7          	lui	a5,0x1
    3810:	9387a783          	lw	a5,-1736(a5) # 938 <seed2_volatile>
    3814:	fef42623          	sw	a5,-20(s0)
    3818:	0340006f          	j	384c <get_seed_32+0x84>
    381c:	48802783          	lw	a5,1160(zero) # 488 <seed3_volatile>
    3820:	fef42623          	sw	a5,-20(s0)
    3824:	0280006f          	j	384c <get_seed_32+0x84>
    3828:	48c02783          	lw	a5,1164(zero) # 48c <seed4_volatile>
    382c:	fef42623          	sw	a5,-20(s0)
    3830:	01c0006f          	j	384c <get_seed_32+0x84>
    3834:	000017b7          	lui	a5,0x1
    3838:	93c7a783          	lw	a5,-1732(a5) # 93c <seed5_volatile>
    383c:	fef42623          	sw	a5,-20(s0)
    3840:	00c0006f          	j	384c <get_seed_32+0x84>
    3844:	fe042623          	sw	zero,-20(s0)
    3848:	00000013          	nop
    384c:	fec42783          	lw	a5,-20(s0)
    3850:	00078513          	mv	a0,a5
    3854:	02c12403          	lw	s0,44(sp)
    3858:	03010113          	add	sp,sp,48
    385c:	00008067          	ret

00003860 <crcu8>:
    3860:	fd010113          	add	sp,sp,-48
    3864:	02812623          	sw	s0,44(sp)
    3868:	03010413          	add	s0,sp,48
    386c:	00050793          	mv	a5,a0
    3870:	00058713          	mv	a4,a1
    3874:	fcf40fa3          	sb	a5,-33(s0)
    3878:	00070793          	mv	a5,a4
    387c:	fcf41e23          	sh	a5,-36(s0)
    3880:	fe0407a3          	sb	zero,-17(s0)
    3884:	fe0406a3          	sb	zero,-19(s0)
    3888:	fe040723          	sb	zero,-18(s0)
    388c:	fe0407a3          	sb	zero,-17(s0)
    3890:	0bc0006f          	j	394c <crcu8+0xec>
    3894:	fdc45783          	lhu	a5,-36(s0)
    3898:	01879713          	sll	a4,a5,0x18
    389c:	41875713          	sra	a4,a4,0x18
    38a0:	fdf40783          	lb	a5,-33(s0)
    38a4:	00f747b3          	xor	a5,a4,a5
    38a8:	01879793          	sll	a5,a5,0x18
    38ac:	4187d793          	sra	a5,a5,0x18
    38b0:	0ff7f793          	zext.b	a5,a5
    38b4:	0017f793          	and	a5,a5,1
    38b8:	fef406a3          	sb	a5,-19(s0)
    38bc:	fdf44783          	lbu	a5,-33(s0)
    38c0:	0017d793          	srl	a5,a5,0x1
    38c4:	fcf40fa3          	sb	a5,-33(s0)
    38c8:	fed44703          	lbu	a4,-19(s0)
    38cc:	00100793          	li	a5,1
    38d0:	02f71463          	bne	a4,a5,38f8 <crcu8+0x98>
    38d4:	fdc45783          	lhu	a5,-36(s0)
    38d8:	00078713          	mv	a4,a5
    38dc:	000047b7          	lui	a5,0x4
    38e0:	00278793          	add	a5,a5,2 # 4002 <_trap_stack_ptr+0x2>
    38e4:	00f747b3          	xor	a5,a4,a5
    38e8:	fcf41e23          	sh	a5,-36(s0)
    38ec:	00100793          	li	a5,1
    38f0:	fef40723          	sb	a5,-18(s0)
    38f4:	0080006f          	j	38fc <crcu8+0x9c>
    38f8:	fe040723          	sb	zero,-18(s0)
    38fc:	fdc45783          	lhu	a5,-36(s0)
    3900:	0017d793          	srl	a5,a5,0x1
    3904:	fcf41e23          	sh	a5,-36(s0)
    3908:	fee44783          	lbu	a5,-18(s0)
    390c:	00078e63          	beqz	a5,3928 <crcu8+0xc8>
    3910:	fdc45783          	lhu	a5,-36(s0)
    3914:	00078713          	mv	a4,a5
    3918:	ffff87b7          	lui	a5,0xffff8
    391c:	00f767b3          	or	a5,a4,a5
    3920:	fcf41e23          	sh	a5,-36(s0)
    3924:	01c0006f          	j	3940 <crcu8+0xe0>
    3928:	fdc45783          	lhu	a5,-36(s0)
    392c:	00078713          	mv	a4,a5
    3930:	000087b7          	lui	a5,0x8
    3934:	fff78793          	add	a5,a5,-1 # 7fff <__subdf3+0x41b>
    3938:	00f777b3          	and	a5,a4,a5
    393c:	fcf41e23          	sh	a5,-36(s0)
    3940:	fef44783          	lbu	a5,-17(s0)
    3944:	00178793          	add	a5,a5,1
    3948:	fef407a3          	sb	a5,-17(s0)
    394c:	fef44703          	lbu	a4,-17(s0)
    3950:	00700793          	li	a5,7
    3954:	f4e7f0e3          	bgeu	a5,a4,3894 <crcu8+0x34>
    3958:	fdc45783          	lhu	a5,-36(s0)
    395c:	00078513          	mv	a0,a5
    3960:	02c12403          	lw	s0,44(sp)
    3964:	03010113          	add	sp,sp,48
    3968:	00008067          	ret

0000396c <crcu16>:
    396c:	fe010113          	add	sp,sp,-32
    3970:	00112e23          	sw	ra,28(sp)
    3974:	00812c23          	sw	s0,24(sp)
    3978:	02010413          	add	s0,sp,32
    397c:	00050793          	mv	a5,a0
    3980:	00058713          	mv	a4,a1
    3984:	fef41723          	sh	a5,-18(s0)
    3988:	00070793          	mv	a5,a4
    398c:	fef41623          	sh	a5,-20(s0)
    3990:	fee45783          	lhu	a5,-18(s0)
    3994:	0ff7f793          	zext.b	a5,a5
    3998:	fec45703          	lhu	a4,-20(s0)
    399c:	00070593          	mv	a1,a4
    39a0:	00078513          	mv	a0,a5
    39a4:	ebdff0ef          	jal	3860 <crcu8>
    39a8:	00050793          	mv	a5,a0
    39ac:	fef41623          	sh	a5,-20(s0)
    39b0:	fee45783          	lhu	a5,-18(s0)
    39b4:	0087d793          	srl	a5,a5,0x8
    39b8:	01079793          	sll	a5,a5,0x10
    39bc:	0107d793          	srl	a5,a5,0x10
    39c0:	0ff7f793          	zext.b	a5,a5
    39c4:	fec45703          	lhu	a4,-20(s0)
    39c8:	00070593          	mv	a1,a4
    39cc:	00078513          	mv	a0,a5
    39d0:	e91ff0ef          	jal	3860 <crcu8>
    39d4:	00050793          	mv	a5,a0
    39d8:	fef41623          	sh	a5,-20(s0)
    39dc:	fec45783          	lhu	a5,-20(s0)
    39e0:	00078513          	mv	a0,a5
    39e4:	01c12083          	lw	ra,28(sp)
    39e8:	01812403          	lw	s0,24(sp)
    39ec:	02010113          	add	sp,sp,32
    39f0:	00008067          	ret

000039f4 <crcu32>:
    39f4:	fe010113          	add	sp,sp,-32
    39f8:	00112e23          	sw	ra,28(sp)
    39fc:	00812c23          	sw	s0,24(sp)
    3a00:	02010413          	add	s0,sp,32
    3a04:	fea42623          	sw	a0,-20(s0)
    3a08:	00058793          	mv	a5,a1
    3a0c:	fef41523          	sh	a5,-22(s0)
    3a10:	fec42783          	lw	a5,-20(s0)
    3a14:	01079793          	sll	a5,a5,0x10
    3a18:	4107d793          	sra	a5,a5,0x10
    3a1c:	fea45703          	lhu	a4,-22(s0)
    3a20:	00070593          	mv	a1,a4
    3a24:	00078513          	mv	a0,a5
    3a28:	04c000ef          	jal	3a74 <crc16>
    3a2c:	00050793          	mv	a5,a0
    3a30:	fef41523          	sh	a5,-22(s0)
    3a34:	fec42783          	lw	a5,-20(s0)
    3a38:	0107d793          	srl	a5,a5,0x10
    3a3c:	01079793          	sll	a5,a5,0x10
    3a40:	4107d793          	sra	a5,a5,0x10
    3a44:	fea45703          	lhu	a4,-22(s0)
    3a48:	00070593          	mv	a1,a4
    3a4c:	00078513          	mv	a0,a5
    3a50:	024000ef          	jal	3a74 <crc16>
    3a54:	00050793          	mv	a5,a0
    3a58:	fef41523          	sh	a5,-22(s0)
    3a5c:	fea45783          	lhu	a5,-22(s0)
    3a60:	00078513          	mv	a0,a5
    3a64:	01c12083          	lw	ra,28(sp)
    3a68:	01812403          	lw	s0,24(sp)
    3a6c:	02010113          	add	sp,sp,32
    3a70:	00008067          	ret

00003a74 <crc16>:
    3a74:	fe010113          	add	sp,sp,-32
    3a78:	00112e23          	sw	ra,28(sp)
    3a7c:	00812c23          	sw	s0,24(sp)
    3a80:	02010413          	add	s0,sp,32
    3a84:	00050793          	mv	a5,a0
    3a88:	00058713          	mv	a4,a1
    3a8c:	fef41723          	sh	a5,-18(s0)
    3a90:	00070793          	mv	a5,a4
    3a94:	fef41623          	sh	a5,-20(s0)
    3a98:	fee45783          	lhu	a5,-18(s0)
    3a9c:	fec45703          	lhu	a4,-20(s0)
    3aa0:	00070593          	mv	a1,a4
    3aa4:	00078513          	mv	a0,a5
    3aa8:	ec5ff0ef          	jal	396c <crcu16>
    3aac:	00050793          	mv	a5,a0
    3ab0:	00078513          	mv	a0,a5
    3ab4:	01c12083          	lw	ra,28(sp)
    3ab8:	01812403          	lw	s0,24(sp)
    3abc:	02010113          	add	sp,sp,32
    3ac0:	00008067          	ret

00003ac4 <check_data_types>:
    3ac4:	fe010113          	add	sp,sp,-32
    3ac8:	00112e23          	sw	ra,28(sp)
    3acc:	00812c23          	sw	s0,24(sp)
    3ad0:	02010413          	add	s0,sp,32
    3ad4:	fe0407a3          	sb	zero,-17(s0)
    3ad8:	fef44783          	lbu	a5,-17(s0)
    3adc:	00078663          	beqz	a5,3ae8 <check_data_types+0x24>
    3ae0:	5c800513          	li	a0,1480
    3ae4:	7ad010ef          	jal	5a90 <ee_printf>
    3ae8:	fef44783          	lbu	a5,-17(s0)
    3aec:	00078513          	mv	a0,a5
    3af0:	01c12083          	lw	ra,28(sp)
    3af4:	01812403          	lw	s0,24(sp)
    3af8:	02010113          	add	sp,sp,32
    3afc:	00008067          	ret

00003b00 <cvt>:
    3b00:	fb010113          	add	sp,sp,-80
    3b04:	04112623          	sw	ra,76(sp)
    3b08:	04812423          	sw	s0,72(sp)
    3b0c:	05212223          	sw	s2,68(sp)
    3b10:	05312023          	sw	s3,64(sp)
    3b14:	05010413          	add	s0,sp,80
    3b18:	fca42423          	sw	a0,-56(s0)
    3b1c:	fcb42623          	sw	a1,-52(s0)
    3b20:	fcc42223          	sw	a2,-60(s0)
    3b24:	fcd42023          	sw	a3,-64(s0)
    3b28:	fae42e23          	sw	a4,-68(s0)
    3b2c:	faf42c23          	sw	a5,-72(s0)
    3b30:	fb042a23          	sw	a6,-76(s0)
    3b34:	fc442783          	lw	a5,-60(s0)
    3b38:	0007d463          	bgez	a5,3b40 <cvt+0x40>
    3b3c:	fc042223          	sw	zero,-60(s0)
    3b40:	fc442703          	lw	a4,-60(s0)
    3b44:	04e00793          	li	a5,78
    3b48:	00e7d663          	bge	a5,a4,3b54 <cvt+0x54>
    3b4c:	04e00793          	li	a5,78
    3b50:	fcf42223          	sw	a5,-60(s0)
    3b54:	fe042623          	sw	zero,-20(s0)
    3b58:	fbc42783          	lw	a5,-68(s0)
    3b5c:	0007a023          	sw	zero,0(a5)
    3b60:	fb842783          	lw	a5,-72(s0)
    3b64:	fef42423          	sw	a5,-24(s0)
    3b68:	00000613          	li	a2,0
    3b6c:	00000693          	li	a3,0
    3b70:	fc842503          	lw	a0,-56(s0)
    3b74:	fcc42583          	lw	a1,-52(s0)
    3b78:	2cc030ef          	jal	6e44 <__ledf2>
    3b7c:	00050793          	mv	a5,a0
    3b80:	0207d463          	bgez	a5,3ba8 <cvt+0xa8>
    3b84:	fbc42783          	lw	a5,-68(s0)
    3b88:	00100713          	li	a4,1
    3b8c:	00e7a023          	sw	a4,0(a5)
    3b90:	fc842903          	lw	s2,-56(s0)
    3b94:	fcc42703          	lw	a4,-52(s0)
    3b98:	800007b7          	lui	a5,0x80000
    3b9c:	00f749b3          	xor	s3,a4,a5
    3ba0:	fd242423          	sw	s2,-56(s0)
    3ba4:	fd342623          	sw	s3,-52(s0)
    3ba8:	fd840793          	add	a5,s0,-40
    3bac:	00078613          	mv	a2,a5
    3bb0:	fc842503          	lw	a0,-56(s0)
    3bb4:	fcc42583          	lw	a1,-52(s0)
    3bb8:	635030ef          	jal	79ec <modf>
    3bbc:	fca42423          	sw	a0,-56(s0)
    3bc0:	fcb42623          	sw	a1,-52(s0)
    3bc4:	fb842783          	lw	a5,-72(s0)
    3bc8:	05078793          	add	a5,a5,80 # 80000050 <__subdf3+0x7fff846c>
    3bcc:	fef42223          	sw	a5,-28(s0)
    3bd0:	fd842703          	lw	a4,-40(s0)
    3bd4:	fdc42783          	lw	a5,-36(s0)
    3bd8:	00000613          	li	a2,0
    3bdc:	00000693          	li	a3,0
    3be0:	00070513          	mv	a0,a4
    3be4:	00078593          	mv	a1,a5
    3be8:	0d0030ef          	jal	6cb8 <__eqdf2>
    3bec:	00050793          	mv	a5,a0
    3bf0:	12078a63          	beqz	a5,3d24 <cvt+0x224>
    3bf4:	fb842783          	lw	a5,-72(s0)
    3bf8:	05078793          	add	a5,a5,80
    3bfc:	fef42223          	sw	a5,-28(s0)
    3c00:	0c80006f          	j	3cc8 <cvt+0x1c8>
    3c04:	fd842703          	lw	a4,-40(s0)
    3c08:	fdc42783          	lw	a5,-36(s0)
    3c0c:	60002603          	lw	a2,1536(zero) # 600 <_stack_size+0x100>
    3c10:	60402683          	lw	a3,1540(zero) # 604 <_stack_size+0x104>
    3c14:	00070513          	mv	a0,a4
    3c18:	00078593          	mv	a1,a5
    3c1c:	7f4020ef          	jal	6410 <__divdf3>
    3c20:	00050713          	mv	a4,a0
    3c24:	00058793          	mv	a5,a1
    3c28:	fd840693          	add	a3,s0,-40
    3c2c:	00068613          	mv	a2,a3
    3c30:	00070513          	mv	a0,a4
    3c34:	00078593          	mv	a1,a5
    3c38:	5b5030ef          	jal	79ec <modf>
    3c3c:	00050713          	mv	a4,a0
    3c40:	00058793          	mv	a5,a1
    3c44:	fce42823          	sw	a4,-48(s0)
    3c48:	fcf42a23          	sw	a5,-44(s0)
    3c4c:	fd042703          	lw	a4,-48(s0)
    3c50:	fd442783          	lw	a5,-44(s0)
    3c54:	60802603          	lw	a2,1544(zero) # 608 <_stack_size+0x108>
    3c58:	60c02683          	lw	a3,1548(zero) # 60c <_stack_size+0x10c>
    3c5c:	00070513          	mv	a0,a4
    3c60:	00078593          	mv	a1,a5
    3c64:	6e5010ef          	jal	5b48 <__adddf3>
    3c68:	00050713          	mv	a4,a0
    3c6c:	00058793          	mv	a5,a1
    3c70:	00070513          	mv	a0,a4
    3c74:	00078593          	mv	a1,a5
    3c78:	60002603          	lw	a2,1536(zero) # 600 <_stack_size+0x100>
    3c7c:	60402683          	lw	a3,1540(zero) # 604 <_stack_size+0x104>
    3c80:	2cc030ef          	jal	6f4c <__muldf3>
    3c84:	00050713          	mv	a4,a0
    3c88:	00058793          	mv	a5,a1
    3c8c:	00070513          	mv	a0,a4
    3c90:	00078593          	mv	a1,a5
    3c94:	249030ef          	jal	76dc <__fixdfsi>
    3c98:	00050793          	mv	a5,a0
    3c9c:	0ff7f793          	zext.b	a5,a5
    3ca0:	fe442703          	lw	a4,-28(s0)
    3ca4:	fff70713          	add	a4,a4,-1
    3ca8:	fee42223          	sw	a4,-28(s0)
    3cac:	03078793          	add	a5,a5,48
    3cb0:	0ff7f713          	zext.b	a4,a5
    3cb4:	fe442783          	lw	a5,-28(s0)
    3cb8:	00e78023          	sb	a4,0(a5)
    3cbc:	fec42783          	lw	a5,-20(s0)
    3cc0:	00178793          	add	a5,a5,1
    3cc4:	fef42623          	sw	a5,-20(s0)
    3cc8:	fd842703          	lw	a4,-40(s0)
    3ccc:	fdc42783          	lw	a5,-36(s0)
    3cd0:	00000613          	li	a2,0
    3cd4:	00000693          	li	a3,0
    3cd8:	00070513          	mv	a0,a4
    3cdc:	00078593          	mv	a1,a5
    3ce0:	7d9020ef          	jal	6cb8 <__eqdf2>
    3ce4:	00050793          	mv	a5,a0
    3ce8:	f0079ee3          	bnez	a5,3c04 <cvt+0x104>
    3cec:	0240006f          	j	3d10 <cvt+0x210>
    3cf0:	fe442703          	lw	a4,-28(s0)
    3cf4:	00170793          	add	a5,a4,1
    3cf8:	fef42223          	sw	a5,-28(s0)
    3cfc:	fe842783          	lw	a5,-24(s0)
    3d00:	00178693          	add	a3,a5,1
    3d04:	fed42423          	sw	a3,-24(s0)
    3d08:	00074703          	lbu	a4,0(a4)
    3d0c:	00e78023          	sb	a4,0(a5)
    3d10:	fb842783          	lw	a5,-72(s0)
    3d14:	05078793          	add	a5,a5,80
    3d18:	fe442703          	lw	a4,-28(s0)
    3d1c:	fcf76ae3          	bltu	a4,a5,3cf0 <cvt+0x1f0>
    3d20:	0880006f          	j	3da8 <cvt+0x2a8>
    3d24:	00000613          	li	a2,0
    3d28:	00000693          	li	a3,0
    3d2c:	fc842503          	lw	a0,-56(s0)
    3d30:	fcc42583          	lw	a1,-52(s0)
    3d34:	010030ef          	jal	6d44 <__gedf2>
    3d38:	00050793          	mv	a5,a0
    3d3c:	06f05663          	blez	a5,3da8 <cvt+0x2a8>
    3d40:	0200006f          	j	3d60 <cvt+0x260>
    3d44:	fd042703          	lw	a4,-48(s0)
    3d48:	fd442783          	lw	a5,-44(s0)
    3d4c:	fce42423          	sw	a4,-56(s0)
    3d50:	fcf42623          	sw	a5,-52(s0)
    3d54:	fec42783          	lw	a5,-20(s0)
    3d58:	fff78793          	add	a5,a5,-1
    3d5c:	fef42623          	sw	a5,-20(s0)
    3d60:	60002603          	lw	a2,1536(zero) # 600 <_stack_size+0x100>
    3d64:	60402683          	lw	a3,1540(zero) # 604 <_stack_size+0x104>
    3d68:	fc842503          	lw	a0,-56(s0)
    3d6c:	fcc42583          	lw	a1,-52(s0)
    3d70:	1dc030ef          	jal	6f4c <__muldf3>
    3d74:	00050713          	mv	a4,a0
    3d78:	00058793          	mv	a5,a1
    3d7c:	fce42823          	sw	a4,-48(s0)
    3d80:	fcf42a23          	sw	a5,-44(s0)
    3d84:	fd042703          	lw	a4,-48(s0)
    3d88:	fd442783          	lw	a5,-44(s0)
    3d8c:	61002603          	lw	a2,1552(zero) # 610 <_stack_size+0x110>
    3d90:	61402683          	lw	a3,1556(zero) # 614 <_stack_size+0x114>
    3d94:	00070513          	mv	a0,a4
    3d98:	00078593          	mv	a1,a5
    3d9c:	0a8030ef          	jal	6e44 <__ledf2>
    3da0:	00050793          	mv	a5,a0
    3da4:	fa07c0e3          	bltz	a5,3d44 <cvt+0x244>
    3da8:	fc442783          	lw	a5,-60(s0)
    3dac:	fb842703          	lw	a4,-72(s0)
    3db0:	00f707b3          	add	a5,a4,a5
    3db4:	fef42223          	sw	a5,-28(s0)
    3db8:	fb442783          	lw	a5,-76(s0)
    3dbc:	00079a63          	bnez	a5,3dd0 <cvt+0x2d0>
    3dc0:	fec42783          	lw	a5,-20(s0)
    3dc4:	fe442703          	lw	a4,-28(s0)
    3dc8:	00f707b3          	add	a5,a4,a5
    3dcc:	fef42223          	sw	a5,-28(s0)
    3dd0:	fc042783          	lw	a5,-64(s0)
    3dd4:	fec42703          	lw	a4,-20(s0)
    3dd8:	00e7a023          	sw	a4,0(a5)
    3ddc:	fe442703          	lw	a4,-28(s0)
    3de0:	fb842783          	lw	a5,-72(s0)
    3de4:	08f77463          	bgeu	a4,a5,3e6c <cvt+0x36c>
    3de8:	fb842783          	lw	a5,-72(s0)
    3dec:	00078023          	sb	zero,0(a5)
    3df0:	fb842783          	lw	a5,-72(s0)
    3df4:	1840006f          	j	3f78 <cvt+0x478>
    3df8:	60002603          	lw	a2,1536(zero) # 600 <_stack_size+0x100>
    3dfc:	60402683          	lw	a3,1540(zero) # 604 <_stack_size+0x104>
    3e00:	fc842503          	lw	a0,-56(s0)
    3e04:	fcc42583          	lw	a1,-52(s0)
    3e08:	144030ef          	jal	6f4c <__muldf3>
    3e0c:	00050713          	mv	a4,a0
    3e10:	00058793          	mv	a5,a1
    3e14:	fce42423          	sw	a4,-56(s0)
    3e18:	fcf42623          	sw	a5,-52(s0)
    3e1c:	fd040793          	add	a5,s0,-48
    3e20:	00078613          	mv	a2,a5
    3e24:	fc842503          	lw	a0,-56(s0)
    3e28:	fcc42583          	lw	a1,-52(s0)
    3e2c:	3c1030ef          	jal	79ec <modf>
    3e30:	fca42423          	sw	a0,-56(s0)
    3e34:	fcb42623          	sw	a1,-52(s0)
    3e38:	fd042703          	lw	a4,-48(s0)
    3e3c:	fd442783          	lw	a5,-44(s0)
    3e40:	00070513          	mv	a0,a4
    3e44:	00078593          	mv	a1,a5
    3e48:	095030ef          	jal	76dc <__fixdfsi>
    3e4c:	00050793          	mv	a5,a0
    3e50:	0ff7f713          	zext.b	a4,a5
    3e54:	fe842783          	lw	a5,-24(s0)
    3e58:	00178693          	add	a3,a5,1
    3e5c:	fed42423          	sw	a3,-24(s0)
    3e60:	03070713          	add	a4,a4,48
    3e64:	0ff77713          	zext.b	a4,a4
    3e68:	00e78023          	sb	a4,0(a5)
    3e6c:	fe842703          	lw	a4,-24(s0)
    3e70:	fe442783          	lw	a5,-28(s0)
    3e74:	00e7ea63          	bltu	a5,a4,3e88 <cvt+0x388>
    3e78:	fb842783          	lw	a5,-72(s0)
    3e7c:	05078793          	add	a5,a5,80
    3e80:	fe842703          	lw	a4,-24(s0)
    3e84:	f6f76ae3          	bltu	a4,a5,3df8 <cvt+0x2f8>
    3e88:	fb842783          	lw	a5,-72(s0)
    3e8c:	05078793          	add	a5,a5,80
    3e90:	fe442703          	lw	a4,-28(s0)
    3e94:	00f76c63          	bltu	a4,a5,3eac <cvt+0x3ac>
    3e98:	fb842783          	lw	a5,-72(s0)
    3e9c:	04f78793          	add	a5,a5,79
    3ea0:	00078023          	sb	zero,0(a5)
    3ea4:	fb842783          	lw	a5,-72(s0)
    3ea8:	0d00006f          	j	3f78 <cvt+0x478>
    3eac:	fe442783          	lw	a5,-28(s0)
    3eb0:	fef42423          	sw	a5,-24(s0)
    3eb4:	fe442783          	lw	a5,-28(s0)
    3eb8:	0007c783          	lbu	a5,0(a5)
    3ebc:	00578793          	add	a5,a5,5
    3ec0:	0ff7f713          	zext.b	a4,a5
    3ec4:	fe442783          	lw	a5,-28(s0)
    3ec8:	00e78023          	sb	a4,0(a5)
    3ecc:	0900006f          	j	3f5c <cvt+0x45c>
    3ed0:	fe442783          	lw	a5,-28(s0)
    3ed4:	03000713          	li	a4,48
    3ed8:	00e78023          	sb	a4,0(a5)
    3edc:	fe442703          	lw	a4,-28(s0)
    3ee0:	fb842783          	lw	a5,-72(s0)
    3ee4:	02e7f663          	bgeu	a5,a4,3f10 <cvt+0x410>
    3ee8:	fe442783          	lw	a5,-28(s0)
    3eec:	fff78793          	add	a5,a5,-1
    3ef0:	fef42223          	sw	a5,-28(s0)
    3ef4:	fe442783          	lw	a5,-28(s0)
    3ef8:	0007c783          	lbu	a5,0(a5)
    3efc:	00178793          	add	a5,a5,1
    3f00:	0ff7f713          	zext.b	a4,a5
    3f04:	fe442783          	lw	a5,-28(s0)
    3f08:	00e78023          	sb	a4,0(a5)
    3f0c:	0500006f          	j	3f5c <cvt+0x45c>
    3f10:	fe442783          	lw	a5,-28(s0)
    3f14:	03100713          	li	a4,49
    3f18:	00e78023          	sb	a4,0(a5)
    3f1c:	fc042783          	lw	a5,-64(s0)
    3f20:	0007a783          	lw	a5,0(a5)
    3f24:	00178713          	add	a4,a5,1
    3f28:	fc042783          	lw	a5,-64(s0)
    3f2c:	00e7a023          	sw	a4,0(a5)
    3f30:	fb442783          	lw	a5,-76(s0)
    3f34:	02079463          	bnez	a5,3f5c <cvt+0x45c>
    3f38:	fe842703          	lw	a4,-24(s0)
    3f3c:	fb842783          	lw	a5,-72(s0)
    3f40:	00e7f863          	bgeu	a5,a4,3f50 <cvt+0x450>
    3f44:	fe842783          	lw	a5,-24(s0)
    3f48:	03000713          	li	a4,48
    3f4c:	00e78023          	sb	a4,0(a5)
    3f50:	fe842783          	lw	a5,-24(s0)
    3f54:	00178793          	add	a5,a5,1
    3f58:	fef42423          	sw	a5,-24(s0)
    3f5c:	fe442783          	lw	a5,-28(s0)
    3f60:	0007c703          	lbu	a4,0(a5)
    3f64:	03900793          	li	a5,57
    3f68:	f6e7e4e3          	bltu	a5,a4,3ed0 <cvt+0x3d0>
    3f6c:	fe842783          	lw	a5,-24(s0)
    3f70:	00078023          	sb	zero,0(a5)
    3f74:	fb842783          	lw	a5,-72(s0)
    3f78:	00078513          	mv	a0,a5
    3f7c:	04c12083          	lw	ra,76(sp)
    3f80:	04812403          	lw	s0,72(sp)
    3f84:	04412903          	lw	s2,68(sp)
    3f88:	04012983          	lw	s3,64(sp)
    3f8c:	05010113          	add	sp,sp,80
    3f90:	00008067          	ret

00003f94 <ecvt>:
    3f94:	fd010113          	add	sp,sp,-48
    3f98:	02112623          	sw	ra,44(sp)
    3f9c:	02812423          	sw	s0,40(sp)
    3fa0:	03010413          	add	s0,sp,48
    3fa4:	fea42423          	sw	a0,-24(s0)
    3fa8:	feb42623          	sw	a1,-20(s0)
    3fac:	fec42223          	sw	a2,-28(s0)
    3fb0:	fed42023          	sw	a3,-32(s0)
    3fb4:	fce42e23          	sw	a4,-36(s0)
    3fb8:	00100813          	li	a6,1
    3fbc:	000017b7          	lui	a5,0x1
    3fc0:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    3fc4:	fdc42703          	lw	a4,-36(s0)
    3fc8:	fe042683          	lw	a3,-32(s0)
    3fcc:	fe442603          	lw	a2,-28(s0)
    3fd0:	fe842503          	lw	a0,-24(s0)
    3fd4:	fec42583          	lw	a1,-20(s0)
    3fd8:	b29ff0ef          	jal	3b00 <cvt>
    3fdc:	00050793          	mv	a5,a0
    3fe0:	00078513          	mv	a0,a5
    3fe4:	02c12083          	lw	ra,44(sp)
    3fe8:	02812403          	lw	s0,40(sp)
    3fec:	03010113          	add	sp,sp,48
    3ff0:	00008067          	ret

00003ff4 <ecvtbuf>:
    3ff4:	fd010113          	add	sp,sp,-48
    3ff8:	02112623          	sw	ra,44(sp)
    3ffc:	02812423          	sw	s0,40(sp)
    4000:	03010413          	add	s0,sp,48
    4004:	fea42423          	sw	a0,-24(s0)
    4008:	feb42623          	sw	a1,-20(s0)
    400c:	fec42223          	sw	a2,-28(s0)
    4010:	fed42023          	sw	a3,-32(s0)
    4014:	fce42e23          	sw	a4,-36(s0)
    4018:	fcf42c23          	sw	a5,-40(s0)
    401c:	00100813          	li	a6,1
    4020:	fd842783          	lw	a5,-40(s0)
    4024:	fdc42703          	lw	a4,-36(s0)
    4028:	fe042683          	lw	a3,-32(s0)
    402c:	fe442603          	lw	a2,-28(s0)
    4030:	fe842503          	lw	a0,-24(s0)
    4034:	fec42583          	lw	a1,-20(s0)
    4038:	ac9ff0ef          	jal	3b00 <cvt>
    403c:	00050793          	mv	a5,a0
    4040:	00078513          	mv	a0,a5
    4044:	02c12083          	lw	ra,44(sp)
    4048:	02812403          	lw	s0,40(sp)
    404c:	03010113          	add	sp,sp,48
    4050:	00008067          	ret

00004054 <fcvt>:
    4054:	fd010113          	add	sp,sp,-48
    4058:	02112623          	sw	ra,44(sp)
    405c:	02812423          	sw	s0,40(sp)
    4060:	03010413          	add	s0,sp,48
    4064:	fea42423          	sw	a0,-24(s0)
    4068:	feb42623          	sw	a1,-20(s0)
    406c:	fec42223          	sw	a2,-28(s0)
    4070:	fed42023          	sw	a3,-32(s0)
    4074:	fce42e23          	sw	a4,-36(s0)
    4078:	00000813          	li	a6,0
    407c:	000017b7          	lui	a5,0x1
    4080:	8e478793          	add	a5,a5,-1820 # 8e4 <CVTBUF>
    4084:	fdc42703          	lw	a4,-36(s0)
    4088:	fe042683          	lw	a3,-32(s0)
    408c:	fe442603          	lw	a2,-28(s0)
    4090:	fe842503          	lw	a0,-24(s0)
    4094:	fec42583          	lw	a1,-20(s0)
    4098:	a69ff0ef          	jal	3b00 <cvt>
    409c:	00050793          	mv	a5,a0
    40a0:	00078513          	mv	a0,a5
    40a4:	02c12083          	lw	ra,44(sp)
    40a8:	02812403          	lw	s0,40(sp)
    40ac:	03010113          	add	sp,sp,48
    40b0:	00008067          	ret

000040b4 <fcvtbuf>:
    40b4:	fd010113          	add	sp,sp,-48
    40b8:	02112623          	sw	ra,44(sp)
    40bc:	02812423          	sw	s0,40(sp)
    40c0:	03010413          	add	s0,sp,48
    40c4:	fea42423          	sw	a0,-24(s0)
    40c8:	feb42623          	sw	a1,-20(s0)
    40cc:	fec42223          	sw	a2,-28(s0)
    40d0:	fed42023          	sw	a3,-32(s0)
    40d4:	fce42e23          	sw	a4,-36(s0)
    40d8:	fcf42c23          	sw	a5,-40(s0)
    40dc:	00000813          	li	a6,0
    40e0:	fd842783          	lw	a5,-40(s0)
    40e4:	fdc42703          	lw	a4,-36(s0)
    40e8:	fe042683          	lw	a3,-32(s0)
    40ec:	fe442603          	lw	a2,-28(s0)
    40f0:	fe842503          	lw	a0,-24(s0)
    40f4:	fec42583          	lw	a1,-20(s0)
    40f8:	a09ff0ef          	jal	3b00 <cvt>
    40fc:	00050793          	mv	a5,a0
    4100:	00078513          	mv	a0,a5
    4104:	02c12083          	lw	ra,44(sp)
    4108:	02812403          	lw	s0,40(sp)
    410c:	03010113          	add	sp,sp,48
    4110:	00008067          	ret

00004114 <strnlen>:
    4114:	fd010113          	add	sp,sp,-48
    4118:	02812623          	sw	s0,44(sp)
    411c:	03010413          	add	s0,sp,48
    4120:	fca42e23          	sw	a0,-36(s0)
    4124:	fcb42c23          	sw	a1,-40(s0)
    4128:	fdc42783          	lw	a5,-36(s0)
    412c:	fef42623          	sw	a5,-20(s0)
    4130:	0100006f          	j	4140 <strnlen+0x2c>
    4134:	fec42783          	lw	a5,-20(s0)
    4138:	00178793          	add	a5,a5,1
    413c:	fef42623          	sw	a5,-20(s0)
    4140:	fec42783          	lw	a5,-20(s0)
    4144:	0007c783          	lbu	a5,0(a5)
    4148:	00078a63          	beqz	a5,415c <strnlen+0x48>
    414c:	fd842783          	lw	a5,-40(s0)
    4150:	fff78713          	add	a4,a5,-1
    4154:	fce42c23          	sw	a4,-40(s0)
    4158:	fc079ee3          	bnez	a5,4134 <strnlen+0x20>
    415c:	fec42703          	lw	a4,-20(s0)
    4160:	fdc42783          	lw	a5,-36(s0)
    4164:	40f707b3          	sub	a5,a4,a5
    4168:	00078513          	mv	a0,a5
    416c:	02c12403          	lw	s0,44(sp)
    4170:	03010113          	add	sp,sp,48
    4174:	00008067          	ret

00004178 <skip_atoi>:
    4178:	fd010113          	add	sp,sp,-48
    417c:	02812623          	sw	s0,44(sp)
    4180:	03010413          	add	s0,sp,48
    4184:	fca42e23          	sw	a0,-36(s0)
    4188:	fe042623          	sw	zero,-20(s0)
    418c:	0400006f          	j	41cc <skip_atoi+0x54>
    4190:	fec42703          	lw	a4,-20(s0)
    4194:	00070793          	mv	a5,a4
    4198:	00279793          	sll	a5,a5,0x2
    419c:	00e787b3          	add	a5,a5,a4
    41a0:	00179793          	sll	a5,a5,0x1
    41a4:	00078613          	mv	a2,a5
    41a8:	fdc42783          	lw	a5,-36(s0)
    41ac:	0007a783          	lw	a5,0(a5)
    41b0:	00178693          	add	a3,a5,1
    41b4:	fdc42703          	lw	a4,-36(s0)
    41b8:	00d72023          	sw	a3,0(a4)
    41bc:	0007c783          	lbu	a5,0(a5)
    41c0:	00f607b3          	add	a5,a2,a5
    41c4:	fd078793          	add	a5,a5,-48
    41c8:	fef42623          	sw	a5,-20(s0)
    41cc:	fdc42783          	lw	a5,-36(s0)
    41d0:	0007a783          	lw	a5,0(a5)
    41d4:	0007c703          	lbu	a4,0(a5)
    41d8:	02f00793          	li	a5,47
    41dc:	00e7fc63          	bgeu	a5,a4,41f4 <skip_atoi+0x7c>
    41e0:	fdc42783          	lw	a5,-36(s0)
    41e4:	0007a783          	lw	a5,0(a5)
    41e8:	0007c703          	lbu	a4,0(a5)
    41ec:	03900793          	li	a5,57
    41f0:	fae7f0e3          	bgeu	a5,a4,4190 <skip_atoi+0x18>
    41f4:	fec42783          	lw	a5,-20(s0)
    41f8:	00078513          	mv	a0,a5
    41fc:	02c12403          	lw	s0,44(sp)
    4200:	03010113          	add	sp,sp,48
    4204:	00008067          	ret

00004208 <number>:
    4208:	f8010113          	add	sp,sp,-128
    420c:	06112e23          	sw	ra,124(sp)
    4210:	06812c23          	sw	s0,120(sp)
    4214:	08010413          	add	s0,sp,128
    4218:	f8a42e23          	sw	a0,-100(s0)
    421c:	f8b42c23          	sw	a1,-104(s0)
    4220:	f8c42a23          	sw	a2,-108(s0)
    4224:	f8d42823          	sw	a3,-112(s0)
    4228:	f8e42623          	sw	a4,-116(s0)
    422c:	f8f42423          	sw	a5,-120(s0)
    4230:	79402783          	lw	a5,1940(zero) # 794 <digits>
    4234:	fef42423          	sw	a5,-24(s0)
    4238:	f8842783          	lw	a5,-120(s0)
    423c:	0407f793          	and	a5,a5,64
    4240:	00078663          	beqz	a5,424c <number+0x44>
    4244:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    4248:	fef42423          	sw	a5,-24(s0)
    424c:	f8842783          	lw	a5,-120(s0)
    4250:	0107f793          	and	a5,a5,16
    4254:	00078863          	beqz	a5,4264 <number+0x5c>
    4258:	f8842783          	lw	a5,-120(s0)
    425c:	ffe7f793          	and	a5,a5,-2
    4260:	f8f42423          	sw	a5,-120(s0)
    4264:	f9442703          	lw	a4,-108(s0)
    4268:	00100793          	li	a5,1
    426c:	00e7d863          	bge	a5,a4,427c <number+0x74>
    4270:	f9442703          	lw	a4,-108(s0)
    4274:	02400793          	li	a5,36
    4278:	00e7d663          	bge	a5,a4,4284 <number+0x7c>
    427c:	00000793          	li	a5,0
    4280:	30c0006f          	j	458c <number+0x384>
    4284:	f8842783          	lw	a5,-120(s0)
    4288:	0017f793          	and	a5,a5,1
    428c:	00078663          	beqz	a5,4298 <number+0x90>
    4290:	03000793          	li	a5,48
    4294:	0080006f          	j	429c <number+0x94>
    4298:	02000793          	li	a5,32
    429c:	fef401a3          	sb	a5,-29(s0)
    42a0:	fe0407a3          	sb	zero,-17(s0)
    42a4:	f8842783          	lw	a5,-120(s0)
    42a8:	0027f793          	and	a5,a5,2
    42ac:	06078a63          	beqz	a5,4320 <number+0x118>
    42b0:	f9842783          	lw	a5,-104(s0)
    42b4:	0207d463          	bgez	a5,42dc <number+0xd4>
    42b8:	02d00793          	li	a5,45
    42bc:	fef407a3          	sb	a5,-17(s0)
    42c0:	f9842783          	lw	a5,-104(s0)
    42c4:	40f007b3          	neg	a5,a5
    42c8:	f8f42c23          	sw	a5,-104(s0)
    42cc:	f9042783          	lw	a5,-112(s0)
    42d0:	fff78793          	add	a5,a5,-1
    42d4:	f8f42823          	sw	a5,-112(s0)
    42d8:	0480006f          	j	4320 <number+0x118>
    42dc:	f8842783          	lw	a5,-120(s0)
    42e0:	0047f793          	and	a5,a5,4
    42e4:	00078e63          	beqz	a5,4300 <number+0xf8>
    42e8:	02b00793          	li	a5,43
    42ec:	fef407a3          	sb	a5,-17(s0)
    42f0:	f9042783          	lw	a5,-112(s0)
    42f4:	fff78793          	add	a5,a5,-1
    42f8:	f8f42823          	sw	a5,-112(s0)
    42fc:	0240006f          	j	4320 <number+0x118>
    4300:	f8842783          	lw	a5,-120(s0)
    4304:	0087f793          	and	a5,a5,8
    4308:	00078c63          	beqz	a5,4320 <number+0x118>
    430c:	02000793          	li	a5,32
    4310:	fef407a3          	sb	a5,-17(s0)
    4314:	f9042783          	lw	a5,-112(s0)
    4318:	fff78793          	add	a5,a5,-1
    431c:	f8f42823          	sw	a5,-112(s0)
    4320:	f8842783          	lw	a5,-120(s0)
    4324:	0207f793          	and	a5,a5,32
    4328:	02078c63          	beqz	a5,4360 <number+0x158>
    432c:	f9442703          	lw	a4,-108(s0)
    4330:	01000793          	li	a5,16
    4334:	00f71a63          	bne	a4,a5,4348 <number+0x140>
    4338:	f9042783          	lw	a5,-112(s0)
    433c:	ffe78793          	add	a5,a5,-2
    4340:	f8f42823          	sw	a5,-112(s0)
    4344:	01c0006f          	j	4360 <number+0x158>
    4348:	f9442703          	lw	a4,-108(s0)
    434c:	00800793          	li	a5,8
    4350:	00f71863          	bne	a4,a5,4360 <number+0x158>
    4354:	f9042783          	lw	a5,-112(s0)
    4358:	fff78793          	add	a5,a5,-1
    435c:	f8f42823          	sw	a5,-112(s0)
    4360:	fe042223          	sw	zero,-28(s0)
    4364:	f9842783          	lw	a5,-104(s0)
    4368:	08079063          	bnez	a5,43e8 <number+0x1e0>
    436c:	fe442783          	lw	a5,-28(s0)
    4370:	00178713          	add	a4,a5,1
    4374:	fee42223          	sw	a4,-28(s0)
    4378:	ff078793          	add	a5,a5,-16
    437c:	008787b3          	add	a5,a5,s0
    4380:	03000713          	li	a4,48
    4384:	fae78823          	sb	a4,-80(a5)
    4388:	0680006f          	j	43f0 <number+0x1e8>
    438c:	f9842783          	lw	a5,-104(s0)
    4390:	f9442703          	lw	a4,-108(s0)
    4394:	00070593          	mv	a1,a4
    4398:	00078513          	mv	a0,a5
    439c:	570030ef          	jal	790c <__umodsi3>
    43a0:	00050793          	mv	a5,a0
    43a4:	00078713          	mv	a4,a5
    43a8:	fe842783          	lw	a5,-24(s0)
    43ac:	00e78733          	add	a4,a5,a4
    43b0:	fe442783          	lw	a5,-28(s0)
    43b4:	00178693          	add	a3,a5,1
    43b8:	fed42223          	sw	a3,-28(s0)
    43bc:	00074703          	lbu	a4,0(a4)
    43c0:	ff078793          	add	a5,a5,-16
    43c4:	008787b3          	add	a5,a5,s0
    43c8:	fae78823          	sb	a4,-80(a5)
    43cc:	f9842783          	lw	a5,-104(s0)
    43d0:	f9442703          	lw	a4,-108(s0)
    43d4:	00070593          	mv	a1,a4
    43d8:	00078513          	mv	a0,a5
    43dc:	4e8030ef          	jal	78c4 <__hidden___udivsi3>
    43e0:	00050793          	mv	a5,a0
    43e4:	f8f42c23          	sw	a5,-104(s0)
    43e8:	f9842783          	lw	a5,-104(s0)
    43ec:	fa0790e3          	bnez	a5,438c <number+0x184>
    43f0:	fe442703          	lw	a4,-28(s0)
    43f4:	f8c42783          	lw	a5,-116(s0)
    43f8:	00e7d663          	bge	a5,a4,4404 <number+0x1fc>
    43fc:	fe442783          	lw	a5,-28(s0)
    4400:	f8f42623          	sw	a5,-116(s0)
    4404:	f9042703          	lw	a4,-112(s0)
    4408:	f8c42783          	lw	a5,-116(s0)
    440c:	40f707b3          	sub	a5,a4,a5
    4410:	f8f42823          	sw	a5,-112(s0)
    4414:	f8842783          	lw	a5,-120(s0)
    4418:	0117f793          	and	a5,a5,17
    441c:	02079663          	bnez	a5,4448 <number+0x240>
    4420:	0180006f          	j	4438 <number+0x230>
    4424:	f9c42783          	lw	a5,-100(s0)
    4428:	00178713          	add	a4,a5,1
    442c:	f8e42e23          	sw	a4,-100(s0)
    4430:	02000713          	li	a4,32
    4434:	00e78023          	sb	a4,0(a5)
    4438:	f9042783          	lw	a5,-112(s0)
    443c:	fff78713          	add	a4,a5,-1
    4440:	f8e42823          	sw	a4,-112(s0)
    4444:	fef040e3          	bgtz	a5,4424 <number+0x21c>
    4448:	fef44783          	lbu	a5,-17(s0)
    444c:	00078c63          	beqz	a5,4464 <number+0x25c>
    4450:	f9c42783          	lw	a5,-100(s0)
    4454:	00178713          	add	a4,a5,1
    4458:	f8e42e23          	sw	a4,-100(s0)
    445c:	fef44703          	lbu	a4,-17(s0)
    4460:	00e78023          	sb	a4,0(a5)
    4464:	f8842783          	lw	a5,-120(s0)
    4468:	0207f793          	and	a5,a5,32
    446c:	06078063          	beqz	a5,44cc <number+0x2c4>
    4470:	f9442703          	lw	a4,-108(s0)
    4474:	00800793          	li	a5,8
    4478:	00f71e63          	bne	a4,a5,4494 <number+0x28c>
    447c:	f9c42783          	lw	a5,-100(s0)
    4480:	00178713          	add	a4,a5,1
    4484:	f8e42e23          	sw	a4,-100(s0)
    4488:	03000713          	li	a4,48
    448c:	00e78023          	sb	a4,0(a5)
    4490:	03c0006f          	j	44cc <number+0x2c4>
    4494:	f9442703          	lw	a4,-108(s0)
    4498:	01000793          	li	a5,16
    449c:	02f71863          	bne	a4,a5,44cc <number+0x2c4>
    44a0:	f9c42783          	lw	a5,-100(s0)
    44a4:	00178713          	add	a4,a5,1
    44a8:	f8e42e23          	sw	a4,-100(s0)
    44ac:	03000713          	li	a4,48
    44b0:	00e78023          	sb	a4,0(a5)
    44b4:	79402703          	lw	a4,1940(zero) # 794 <digits>
    44b8:	f9c42783          	lw	a5,-100(s0)
    44bc:	00178693          	add	a3,a5,1
    44c0:	f8d42e23          	sw	a3,-100(s0)
    44c4:	02174703          	lbu	a4,33(a4)
    44c8:	00e78023          	sb	a4,0(a5)
    44cc:	f8842783          	lw	a5,-120(s0)
    44d0:	0107f793          	and	a5,a5,16
    44d4:	04079263          	bnez	a5,4518 <number+0x310>
    44d8:	0180006f          	j	44f0 <number+0x2e8>
    44dc:	f9c42783          	lw	a5,-100(s0)
    44e0:	00178713          	add	a4,a5,1
    44e4:	f8e42e23          	sw	a4,-100(s0)
    44e8:	fe344703          	lbu	a4,-29(s0)
    44ec:	00e78023          	sb	a4,0(a5)
    44f0:	f9042783          	lw	a5,-112(s0)
    44f4:	fff78713          	add	a4,a5,-1
    44f8:	f8e42823          	sw	a4,-112(s0)
    44fc:	fef040e3          	bgtz	a5,44dc <number+0x2d4>
    4500:	0180006f          	j	4518 <number+0x310>
    4504:	f9c42783          	lw	a5,-100(s0)
    4508:	00178713          	add	a4,a5,1
    450c:	f8e42e23          	sw	a4,-100(s0)
    4510:	03000713          	li	a4,48
    4514:	00e78023          	sb	a4,0(a5)
    4518:	f8c42783          	lw	a5,-116(s0)
    451c:	fff78713          	add	a4,a5,-1
    4520:	f8e42623          	sw	a4,-116(s0)
    4524:	fe442703          	lw	a4,-28(s0)
    4528:	fcf74ee3          	blt	a4,a5,4504 <number+0x2fc>
    452c:	0240006f          	j	4550 <number+0x348>
    4530:	f9c42783          	lw	a5,-100(s0)
    4534:	00178713          	add	a4,a5,1
    4538:	f8e42e23          	sw	a4,-100(s0)
    453c:	fe442703          	lw	a4,-28(s0)
    4540:	ff070713          	add	a4,a4,-16
    4544:	00870733          	add	a4,a4,s0
    4548:	fb074703          	lbu	a4,-80(a4)
    454c:	00e78023          	sb	a4,0(a5)
    4550:	fe442783          	lw	a5,-28(s0)
    4554:	fff78713          	add	a4,a5,-1
    4558:	fee42223          	sw	a4,-28(s0)
    455c:	fcf04ae3          	bgtz	a5,4530 <number+0x328>
    4560:	0180006f          	j	4578 <number+0x370>
    4564:	f9c42783          	lw	a5,-100(s0)
    4568:	00178713          	add	a4,a5,1
    456c:	f8e42e23          	sw	a4,-100(s0)
    4570:	02000713          	li	a4,32
    4574:	00e78023          	sb	a4,0(a5)
    4578:	f9042783          	lw	a5,-112(s0)
    457c:	fff78713          	add	a4,a5,-1
    4580:	f8e42823          	sw	a4,-112(s0)
    4584:	fef040e3          	bgtz	a5,4564 <number+0x35c>
    4588:	f9c42783          	lw	a5,-100(s0)
    458c:	00078513          	mv	a0,a5
    4590:	07c12083          	lw	ra,124(sp)
    4594:	07812403          	lw	s0,120(sp)
    4598:	08010113          	add	sp,sp,128
    459c:	00008067          	ret

000045a0 <eaddr>:
    45a0:	fa010113          	add	sp,sp,-96
    45a4:	04812e23          	sw	s0,92(sp)
    45a8:	06010413          	add	s0,sp,96
    45ac:	faa42e23          	sw	a0,-68(s0)
    45b0:	fab42c23          	sw	a1,-72(s0)
    45b4:	fac42a23          	sw	a2,-76(s0)
    45b8:	fad42823          	sw	a3,-80(s0)
    45bc:	fae42623          	sw	a4,-84(s0)
    45c0:	79402783          	lw	a5,1940(zero) # 794 <digits>
    45c4:	fef42623          	sw	a5,-20(s0)
    45c8:	fac42783          	lw	a5,-84(s0)
    45cc:	0407f793          	and	a5,a5,64
    45d0:	00078663          	beqz	a5,45dc <eaddr+0x3c>
    45d4:	79802783          	lw	a5,1944(zero) # 798 <upper_digits>
    45d8:	fef42623          	sw	a5,-20(s0)
    45dc:	fe042223          	sw	zero,-28(s0)
    45e0:	fe042423          	sw	zero,-24(s0)
    45e4:	0ac0006f          	j	4690 <eaddr+0xf0>
    45e8:	fe842783          	lw	a5,-24(s0)
    45ec:	02078063          	beqz	a5,460c <eaddr+0x6c>
    45f0:	fe442783          	lw	a5,-28(s0)
    45f4:	00178713          	add	a4,a5,1
    45f8:	fee42223          	sw	a4,-28(s0)
    45fc:	ff078793          	add	a5,a5,-16
    4600:	008787b3          	add	a5,a5,s0
    4604:	03a00713          	li	a4,58
    4608:	fce78e23          	sb	a4,-36(a5)
    460c:	fe842783          	lw	a5,-24(s0)
    4610:	fb842703          	lw	a4,-72(s0)
    4614:	00f707b3          	add	a5,a4,a5
    4618:	0007c783          	lbu	a5,0(a5)
    461c:	0047d793          	srl	a5,a5,0x4
    4620:	0ff7f793          	zext.b	a5,a5
    4624:	00078713          	mv	a4,a5
    4628:	fec42783          	lw	a5,-20(s0)
    462c:	00e78733          	add	a4,a5,a4
    4630:	fe442783          	lw	a5,-28(s0)
    4634:	00178693          	add	a3,a5,1
    4638:	fed42223          	sw	a3,-28(s0)
    463c:	00074703          	lbu	a4,0(a4)
    4640:	ff078793          	add	a5,a5,-16
    4644:	008787b3          	add	a5,a5,s0
    4648:	fce78e23          	sb	a4,-36(a5)
    464c:	fe842783          	lw	a5,-24(s0)
    4650:	fb842703          	lw	a4,-72(s0)
    4654:	00f707b3          	add	a5,a4,a5
    4658:	0007c783          	lbu	a5,0(a5)
    465c:	00f7f793          	and	a5,a5,15
    4660:	fec42703          	lw	a4,-20(s0)
    4664:	00f70733          	add	a4,a4,a5
    4668:	fe442783          	lw	a5,-28(s0)
    466c:	00178693          	add	a3,a5,1
    4670:	fed42223          	sw	a3,-28(s0)
    4674:	00074703          	lbu	a4,0(a4)
    4678:	ff078793          	add	a5,a5,-16
    467c:	008787b3          	add	a5,a5,s0
    4680:	fce78e23          	sb	a4,-36(a5)
    4684:	fe842783          	lw	a5,-24(s0)
    4688:	00178793          	add	a5,a5,1
    468c:	fef42423          	sw	a5,-24(s0)
    4690:	fe842703          	lw	a4,-24(s0)
    4694:	00500793          	li	a5,5
    4698:	f4e7d8e3          	bge	a5,a4,45e8 <eaddr+0x48>
    469c:	fac42783          	lw	a5,-84(s0)
    46a0:	0107f793          	and	a5,a5,16
    46a4:	02079863          	bnez	a5,46d4 <eaddr+0x134>
    46a8:	0180006f          	j	46c0 <eaddr+0x120>
    46ac:	fbc42783          	lw	a5,-68(s0)
    46b0:	00178713          	add	a4,a5,1
    46b4:	fae42e23          	sw	a4,-68(s0)
    46b8:	02000713          	li	a4,32
    46bc:	00e78023          	sb	a4,0(a5)
    46c0:	fb442783          	lw	a5,-76(s0)
    46c4:	fff78713          	add	a4,a5,-1
    46c8:	fae42a23          	sw	a4,-76(s0)
    46cc:	fe442703          	lw	a4,-28(s0)
    46d0:	fcf74ee3          	blt	a4,a5,46ac <eaddr+0x10c>
    46d4:	fe042423          	sw	zero,-24(s0)
    46d8:	0300006f          	j	4708 <eaddr+0x168>
    46dc:	fbc42783          	lw	a5,-68(s0)
    46e0:	00178713          	add	a4,a5,1
    46e4:	fae42e23          	sw	a4,-68(s0)
    46e8:	fe842703          	lw	a4,-24(s0)
    46ec:	ff070713          	add	a4,a4,-16
    46f0:	00870733          	add	a4,a4,s0
    46f4:	fdc74703          	lbu	a4,-36(a4)
    46f8:	00e78023          	sb	a4,0(a5)
    46fc:	fe842783          	lw	a5,-24(s0)
    4700:	00178793          	add	a5,a5,1
    4704:	fef42423          	sw	a5,-24(s0)
    4708:	fe842703          	lw	a4,-24(s0)
    470c:	fe442783          	lw	a5,-28(s0)
    4710:	fcf746e3          	blt	a4,a5,46dc <eaddr+0x13c>
    4714:	0180006f          	j	472c <eaddr+0x18c>
    4718:	fbc42783          	lw	a5,-68(s0)
    471c:	00178713          	add	a4,a5,1
    4720:	fae42e23          	sw	a4,-68(s0)
    4724:	02000713          	li	a4,32
    4728:	00e78023          	sb	a4,0(a5)
    472c:	fb442783          	lw	a5,-76(s0)
    4730:	fff78713          	add	a4,a5,-1
    4734:	fae42a23          	sw	a4,-76(s0)
    4738:	fe442703          	lw	a4,-28(s0)
    473c:	fcf74ee3          	blt	a4,a5,4718 <eaddr+0x178>
    4740:	fbc42783          	lw	a5,-68(s0)
    4744:	00078513          	mv	a0,a5
    4748:	05c12403          	lw	s0,92(sp)
    474c:	06010113          	add	sp,sp,96
    4750:	00008067          	ret

00004754 <iaddr>:
    4754:	fa010113          	add	sp,sp,-96
    4758:	04112e23          	sw	ra,92(sp)
    475c:	04812c23          	sw	s0,88(sp)
    4760:	04912a23          	sw	s1,84(sp)
    4764:	06010413          	add	s0,sp,96
    4768:	faa42e23          	sw	a0,-68(s0)
    476c:	fab42c23          	sw	a1,-72(s0)
    4770:	fac42a23          	sw	a2,-76(s0)
    4774:	fad42823          	sw	a3,-80(s0)
    4778:	fae42623          	sw	a4,-84(s0)
    477c:	fe042223          	sw	zero,-28(s0)
    4780:	fe042623          	sw	zero,-20(s0)
    4784:	1a80006f          	j	492c <iaddr+0x1d8>
    4788:	fec42783          	lw	a5,-20(s0)
    478c:	02078063          	beqz	a5,47ac <iaddr+0x58>
    4790:	fe442783          	lw	a5,-28(s0)
    4794:	00178713          	add	a4,a5,1
    4798:	fee42223          	sw	a4,-28(s0)
    479c:	ff078793          	add	a5,a5,-16
    47a0:	008787b3          	add	a5,a5,s0
    47a4:	02e00713          	li	a4,46
    47a8:	fce78e23          	sb	a4,-36(a5)
    47ac:	fec42783          	lw	a5,-20(s0)
    47b0:	fb842703          	lw	a4,-72(s0)
    47b4:	00f707b3          	add	a5,a4,a5
    47b8:	0007c783          	lbu	a5,0(a5)
    47bc:	fef42423          	sw	a5,-24(s0)
    47c0:	fe842783          	lw	a5,-24(s0)
    47c4:	02079463          	bnez	a5,47ec <iaddr+0x98>
    47c8:	79402703          	lw	a4,1940(zero) # 794 <digits>
    47cc:	fe442783          	lw	a5,-28(s0)
    47d0:	00178693          	add	a3,a5,1
    47d4:	fed42223          	sw	a3,-28(s0)
    47d8:	00074703          	lbu	a4,0(a4)
    47dc:	ff078793          	add	a5,a5,-16
    47e0:	008787b3          	add	a5,a5,s0
    47e4:	fce78e23          	sb	a4,-36(a5)
    47e8:	1380006f          	j	4920 <iaddr+0x1cc>
    47ec:	fe842703          	lw	a4,-24(s0)
    47f0:	06300793          	li	a5,99
    47f4:	0ae7d463          	bge	a5,a4,489c <iaddr+0x148>
    47f8:	79402483          	lw	s1,1940(zero) # 794 <digits>
    47fc:	fe842783          	lw	a5,-24(s0)
    4800:	06400593          	li	a1,100
    4804:	00078513          	mv	a0,a5
    4808:	0b4030ef          	jal	78bc <__divsi3>
    480c:	00050793          	mv	a5,a0
    4810:	00f48733          	add	a4,s1,a5
    4814:	fe442783          	lw	a5,-28(s0)
    4818:	00178693          	add	a3,a5,1
    481c:	fed42223          	sw	a3,-28(s0)
    4820:	00074703          	lbu	a4,0(a4)
    4824:	ff078793          	add	a5,a5,-16
    4828:	008787b3          	add	a5,a5,s0
    482c:	fce78e23          	sb	a4,-36(a5)
    4830:	fe842783          	lw	a5,-24(s0)
    4834:	06400593          	li	a1,100
    4838:	00078513          	mv	a0,a5
    483c:	104030ef          	jal	7940 <__modsi3>
    4840:	00050793          	mv	a5,a0
    4844:	fef42423          	sw	a5,-24(s0)
    4848:	79402483          	lw	s1,1940(zero) # 794 <digits>
    484c:	fe842783          	lw	a5,-24(s0)
    4850:	00a00593          	li	a1,10
    4854:	00078513          	mv	a0,a5
    4858:	064030ef          	jal	78bc <__divsi3>
    485c:	00050793          	mv	a5,a0
    4860:	00f48733          	add	a4,s1,a5
    4864:	fe442783          	lw	a5,-28(s0)
    4868:	00178693          	add	a3,a5,1
    486c:	fed42223          	sw	a3,-28(s0)
    4870:	00074703          	lbu	a4,0(a4)
    4874:	ff078793          	add	a5,a5,-16
    4878:	008787b3          	add	a5,a5,s0
    487c:	fce78e23          	sb	a4,-36(a5)
    4880:	fe842783          	lw	a5,-24(s0)
    4884:	00a00593          	li	a1,10
    4888:	00078513          	mv	a0,a5
    488c:	0b4030ef          	jal	7940 <__modsi3>
    4890:	00050793          	mv	a5,a0
    4894:	fef42423          	sw	a5,-24(s0)
    4898:	0600006f          	j	48f8 <iaddr+0x1a4>
    489c:	fe842703          	lw	a4,-24(s0)
    48a0:	00900793          	li	a5,9
    48a4:	04e7da63          	bge	a5,a4,48f8 <iaddr+0x1a4>
    48a8:	79402483          	lw	s1,1940(zero) # 794 <digits>
    48ac:	fe842783          	lw	a5,-24(s0)
    48b0:	00a00593          	li	a1,10
    48b4:	00078513          	mv	a0,a5
    48b8:	004030ef          	jal	78bc <__divsi3>
    48bc:	00050793          	mv	a5,a0
    48c0:	00f48733          	add	a4,s1,a5
    48c4:	fe442783          	lw	a5,-28(s0)
    48c8:	00178693          	add	a3,a5,1
    48cc:	fed42223          	sw	a3,-28(s0)
    48d0:	00074703          	lbu	a4,0(a4)
    48d4:	ff078793          	add	a5,a5,-16
    48d8:	008787b3          	add	a5,a5,s0
    48dc:	fce78e23          	sb	a4,-36(a5)
    48e0:	fe842783          	lw	a5,-24(s0)
    48e4:	00a00593          	li	a1,10
    48e8:	00078513          	mv	a0,a5
    48ec:	054030ef          	jal	7940 <__modsi3>
    48f0:	00050793          	mv	a5,a0
    48f4:	fef42423          	sw	a5,-24(s0)
    48f8:	79402703          	lw	a4,1940(zero) # 794 <digits>
    48fc:	fe842783          	lw	a5,-24(s0)
    4900:	00f70733          	add	a4,a4,a5
    4904:	fe442783          	lw	a5,-28(s0)
    4908:	00178693          	add	a3,a5,1
    490c:	fed42223          	sw	a3,-28(s0)
    4910:	00074703          	lbu	a4,0(a4)
    4914:	ff078793          	add	a5,a5,-16
    4918:	008787b3          	add	a5,a5,s0
    491c:	fce78e23          	sb	a4,-36(a5)
    4920:	fec42783          	lw	a5,-20(s0)
    4924:	00178793          	add	a5,a5,1
    4928:	fef42623          	sw	a5,-20(s0)
    492c:	fec42703          	lw	a4,-20(s0)
    4930:	00300793          	li	a5,3
    4934:	e4e7dae3          	bge	a5,a4,4788 <iaddr+0x34>
    4938:	fac42783          	lw	a5,-84(s0)
    493c:	0107f793          	and	a5,a5,16
    4940:	02079863          	bnez	a5,4970 <iaddr+0x21c>
    4944:	0180006f          	j	495c <iaddr+0x208>
    4948:	fbc42783          	lw	a5,-68(s0)
    494c:	00178713          	add	a4,a5,1
    4950:	fae42e23          	sw	a4,-68(s0)
    4954:	02000713          	li	a4,32
    4958:	00e78023          	sb	a4,0(a5)
    495c:	fb442783          	lw	a5,-76(s0)
    4960:	fff78713          	add	a4,a5,-1
    4964:	fae42a23          	sw	a4,-76(s0)
    4968:	fe442703          	lw	a4,-28(s0)
    496c:	fcf74ee3          	blt	a4,a5,4948 <iaddr+0x1f4>
    4970:	fe042623          	sw	zero,-20(s0)
    4974:	0300006f          	j	49a4 <iaddr+0x250>
    4978:	fbc42783          	lw	a5,-68(s0)
    497c:	00178713          	add	a4,a5,1
    4980:	fae42e23          	sw	a4,-68(s0)
    4984:	fec42703          	lw	a4,-20(s0)
    4988:	ff070713          	add	a4,a4,-16
    498c:	00870733          	add	a4,a4,s0
    4990:	fdc74703          	lbu	a4,-36(a4)
    4994:	00e78023          	sb	a4,0(a5)
    4998:	fec42783          	lw	a5,-20(s0)
    499c:	00178793          	add	a5,a5,1
    49a0:	fef42623          	sw	a5,-20(s0)
    49a4:	fec42703          	lw	a4,-20(s0)
    49a8:	fe442783          	lw	a5,-28(s0)
    49ac:	fcf746e3          	blt	a4,a5,4978 <iaddr+0x224>
    49b0:	0180006f          	j	49c8 <iaddr+0x274>
    49b4:	fbc42783          	lw	a5,-68(s0)
    49b8:	00178713          	add	a4,a5,1
    49bc:	fae42e23          	sw	a4,-68(s0)
    49c0:	02000713          	li	a4,32
    49c4:	00e78023          	sb	a4,0(a5)
    49c8:	fb442783          	lw	a5,-76(s0)
    49cc:	fff78713          	add	a4,a5,-1
    49d0:	fae42a23          	sw	a4,-76(s0)
    49d4:	fe442703          	lw	a4,-28(s0)
    49d8:	fcf74ee3          	blt	a4,a5,49b4 <iaddr+0x260>
    49dc:	fbc42783          	lw	a5,-68(s0)
    49e0:	00078513          	mv	a0,a5
    49e4:	05c12083          	lw	ra,92(sp)
    49e8:	05812403          	lw	s0,88(sp)
    49ec:	05412483          	lw	s1,84(sp)
    49f0:	06010113          	add	sp,sp,96
    49f4:	00008067          	ret

000049f8 <ee_bufcpy>:
    49f8:	fd010113          	add	sp,sp,-48
    49fc:	02812623          	sw	s0,44(sp)
    4a00:	03010413          	add	s0,sp,48
    4a04:	fca42e23          	sw	a0,-36(s0)
    4a08:	fcb42c23          	sw	a1,-40(s0)
    4a0c:	fcc42a23          	sw	a2,-44(s0)
    4a10:	fd442783          	lw	a5,-44(s0)
    4a14:	fd842703          	lw	a4,-40(s0)
    4a18:	00f707b3          	add	a5,a4,a5
    4a1c:	fef42623          	sw	a5,-20(s0)
    4a20:	0240006f          	j	4a44 <ee_bufcpy+0x4c>
    4a24:	fd842703          	lw	a4,-40(s0)
    4a28:	00170793          	add	a5,a4,1
    4a2c:	fcf42c23          	sw	a5,-40(s0)
    4a30:	fdc42783          	lw	a5,-36(s0)
    4a34:	00178693          	add	a3,a5,1
    4a38:	fcd42e23          	sw	a3,-36(s0)
    4a3c:	00074703          	lbu	a4,0(a4)
    4a40:	00e78023          	sb	a4,0(a5)
    4a44:	fd842703          	lw	a4,-40(s0)
    4a48:	fec42783          	lw	a5,-20(s0)
    4a4c:	fcf71ce3          	bne	a4,a5,4a24 <ee_bufcpy+0x2c>
    4a50:	00000013          	nop
    4a54:	00000013          	nop
    4a58:	02c12403          	lw	s0,44(sp)
    4a5c:	03010113          	add	sp,sp,48
    4a60:	00008067          	ret

00004a64 <parse_float>:
    4a64:	f6010113          	add	sp,sp,-160
    4a68:	08112e23          	sw	ra,156(sp)
    4a6c:	08812c23          	sw	s0,152(sp)
    4a70:	0a010413          	add	s0,sp,160
    4a74:	f6a42c23          	sw	a0,-136(s0)
    4a78:	f6b42e23          	sw	a1,-132(s0)
    4a7c:	f6c42a23          	sw	a2,-140(s0)
    4a80:	00068793          	mv	a5,a3
    4a84:	f6e42623          	sw	a4,-148(s0)
    4a88:	f6f409a3          	sb	a5,-141(s0)
    4a8c:	fe042223          	sw	zero,-28(s0)
    4a90:	fe042023          	sw	zero,-32(s0)
    4a94:	f7344703          	lbu	a4,-141(s0)
    4a98:	04700793          	li	a5,71
    4a9c:	00f70863          	beq	a4,a5,4aac <parse_float+0x48>
    4aa0:	f7344703          	lbu	a4,-141(s0)
    4aa4:	04500793          	li	a5,69
    4aa8:	00f71c63          	bne	a4,a5,4ac0 <parse_float+0x5c>
    4aac:	00100793          	li	a5,1
    4ab0:	fef42023          	sw	a5,-32(s0)
    4ab4:	f7344783          	lbu	a5,-141(s0)
    4ab8:	02078793          	add	a5,a5,32
    4abc:	f6f409a3          	sb	a5,-141(s0)
    4ac0:	f7344703          	lbu	a4,-141(s0)
    4ac4:	06700793          	li	a5,103
    4ac8:	06f71c63          	bne	a4,a5,4b40 <parse_float+0xdc>
    4acc:	f8440793          	add	a5,s0,-124
    4ad0:	fd440713          	add	a4,s0,-44
    4ad4:	fd840693          	add	a3,s0,-40
    4ad8:	f6c42603          	lw	a2,-148(s0)
    4adc:	f7842503          	lw	a0,-136(s0)
    4ae0:	f7c42583          	lw	a1,-132(s0)
    4ae4:	d10ff0ef          	jal	3ff4 <ecvtbuf>
    4ae8:	fea42223          	sw	a0,-28(s0)
    4aec:	fd842783          	lw	a5,-40(s0)
    4af0:	fff78793          	add	a5,a5,-1
    4af4:	fcf42e23          	sw	a5,-36(s0)
    4af8:	fdc42703          	lw	a4,-36(s0)
    4afc:	ffc00793          	li	a5,-4
    4b00:	00f74863          	blt	a4,a5,4b10 <parse_float+0xac>
    4b04:	f6c42703          	lw	a4,-148(s0)
    4b08:	fdc42783          	lw	a5,-36(s0)
    4b0c:	00e7ce63          	blt	a5,a4,4b28 <parse_float+0xc4>
    4b10:	06500793          	li	a5,101
    4b14:	f6f409a3          	sb	a5,-141(s0)
    4b18:	f6c42783          	lw	a5,-148(s0)
    4b1c:	fff78793          	add	a5,a5,-1
    4b20:	f6f42623          	sw	a5,-148(s0)
    4b24:	01c0006f          	j	4b40 <parse_float+0xdc>
    4b28:	06600793          	li	a5,102
    4b2c:	f6f409a3          	sb	a5,-141(s0)
    4b30:	fd842783          	lw	a5,-40(s0)
    4b34:	f6c42703          	lw	a4,-148(s0)
    4b38:	40f707b3          	sub	a5,a4,a5
    4b3c:	f6f42623          	sw	a5,-148(s0)
    4b40:	f7344703          	lbu	a4,-141(s0)
    4b44:	06500793          	li	a5,101
    4b48:	20f71463          	bne	a4,a5,4d50 <parse_float+0x2ec>
    4b4c:	f6c42783          	lw	a5,-148(s0)
    4b50:	00178613          	add	a2,a5,1
    4b54:	f8440793          	add	a5,s0,-124
    4b58:	fd440713          	add	a4,s0,-44
    4b5c:	fd840693          	add	a3,s0,-40
    4b60:	f7842503          	lw	a0,-136(s0)
    4b64:	f7c42583          	lw	a1,-132(s0)
    4b68:	c8cff0ef          	jal	3ff4 <ecvtbuf>
    4b6c:	fea42223          	sw	a0,-28(s0)
    4b70:	fd442783          	lw	a5,-44(s0)
    4b74:	00078c63          	beqz	a5,4b8c <parse_float+0x128>
    4b78:	f7442783          	lw	a5,-140(s0)
    4b7c:	00178713          	add	a4,a5,1
    4b80:	f6e42a23          	sw	a4,-140(s0)
    4b84:	02d00713          	li	a4,45
    4b88:	00e78023          	sb	a4,0(a5)
    4b8c:	f7442783          	lw	a5,-140(s0)
    4b90:	00178713          	add	a4,a5,1
    4b94:	f6e42a23          	sw	a4,-140(s0)
    4b98:	fe442703          	lw	a4,-28(s0)
    4b9c:	00074703          	lbu	a4,0(a4)
    4ba0:	00e78023          	sb	a4,0(a5)
    4ba4:	f6c42783          	lw	a5,-148(s0)
    4ba8:	00f05c63          	blez	a5,4bc0 <parse_float+0x15c>
    4bac:	f7442783          	lw	a5,-140(s0)
    4bb0:	00178713          	add	a4,a5,1
    4bb4:	f6e42a23          	sw	a4,-140(s0)
    4bb8:	02e00713          	li	a4,46
    4bbc:	00e78023          	sb	a4,0(a5)
    4bc0:	fe442783          	lw	a5,-28(s0)
    4bc4:	00178793          	add	a5,a5,1
    4bc8:	f6c42603          	lw	a2,-148(s0)
    4bcc:	00078593          	mv	a1,a5
    4bd0:	f7442503          	lw	a0,-140(s0)
    4bd4:	e25ff0ef          	jal	49f8 <ee_bufcpy>
    4bd8:	f6c42783          	lw	a5,-148(s0)
    4bdc:	f7442703          	lw	a4,-140(s0)
    4be0:	00f707b3          	add	a5,a4,a5
    4be4:	f6f42a23          	sw	a5,-140(s0)
    4be8:	fe042783          	lw	a5,-32(s0)
    4bec:	00078663          	beqz	a5,4bf8 <parse_float+0x194>
    4bf0:	04500713          	li	a4,69
    4bf4:	0080006f          	j	4bfc <parse_float+0x198>
    4bf8:	06500713          	li	a4,101
    4bfc:	f7442783          	lw	a5,-140(s0)
    4c00:	00178693          	add	a3,a5,1
    4c04:	f6d42a23          	sw	a3,-140(s0)
    4c08:	00e78023          	sb	a4,0(a5)
    4c0c:	fd842783          	lw	a5,-40(s0)
    4c10:	02079a63          	bnez	a5,4c44 <parse_float+0x1e0>
    4c14:	00000613          	li	a2,0
    4c18:	00000693          	li	a3,0
    4c1c:	f7842503          	lw	a0,-136(s0)
    4c20:	f7c42583          	lw	a1,-132(s0)
    4c24:	094020ef          	jal	6cb8 <__eqdf2>
    4c28:	00050793          	mv	a5,a0
    4c2c:	00079663          	bnez	a5,4c38 <parse_float+0x1d4>
    4c30:	fe042623          	sw	zero,-20(s0)
    4c34:	01c0006f          	j	4c50 <parse_float+0x1ec>
    4c38:	fff00793          	li	a5,-1
    4c3c:	fef42623          	sw	a5,-20(s0)
    4c40:	0100006f          	j	4c50 <parse_float+0x1ec>
    4c44:	fd842783          	lw	a5,-40(s0)
    4c48:	fff78793          	add	a5,a5,-1
    4c4c:	fef42623          	sw	a5,-20(s0)
    4c50:	fec42783          	lw	a5,-20(s0)
    4c54:	0207d463          	bgez	a5,4c7c <parse_float+0x218>
    4c58:	f7442783          	lw	a5,-140(s0)
    4c5c:	00178713          	add	a4,a5,1
    4c60:	f6e42a23          	sw	a4,-140(s0)
    4c64:	02d00713          	li	a4,45
    4c68:	00e78023          	sb	a4,0(a5)
    4c6c:	fec42783          	lw	a5,-20(s0)
    4c70:	40f007b3          	neg	a5,a5
    4c74:	fef42623          	sw	a5,-20(s0)
    4c78:	0180006f          	j	4c90 <parse_float+0x22c>
    4c7c:	f7442783          	lw	a5,-140(s0)
    4c80:	00178713          	add	a4,a5,1
    4c84:	f6e42a23          	sw	a4,-140(s0)
    4c88:	02b00713          	li	a4,43
    4c8c:	00e78023          	sb	a4,0(a5)
    4c90:	fec42783          	lw	a5,-20(s0)
    4c94:	00a00593          	li	a1,10
    4c98:	00078513          	mv	a0,a5
    4c9c:	4a5020ef          	jal	7940 <__modsi3>
    4ca0:	00050793          	mv	a5,a0
    4ca4:	0ff7f713          	zext.b	a4,a5
    4ca8:	f7442783          	lw	a5,-140(s0)
    4cac:	00278793          	add	a5,a5,2
    4cb0:	03070713          	add	a4,a4,48
    4cb4:	0ff77713          	zext.b	a4,a4
    4cb8:	00e78023          	sb	a4,0(a5)
    4cbc:	fec42783          	lw	a5,-20(s0)
    4cc0:	00a00593          	li	a1,10
    4cc4:	00078513          	mv	a0,a5
    4cc8:	3f5020ef          	jal	78bc <__divsi3>
    4ccc:	00050793          	mv	a5,a0
    4cd0:	fef42623          	sw	a5,-20(s0)
    4cd4:	fec42783          	lw	a5,-20(s0)
    4cd8:	00a00593          	li	a1,10
    4cdc:	00078513          	mv	a0,a5
    4ce0:	461020ef          	jal	7940 <__modsi3>
    4ce4:	00050793          	mv	a5,a0
    4ce8:	0ff7f713          	zext.b	a4,a5
    4cec:	f7442783          	lw	a5,-140(s0)
    4cf0:	00178793          	add	a5,a5,1
    4cf4:	03070713          	add	a4,a4,48
    4cf8:	0ff77713          	zext.b	a4,a4
    4cfc:	00e78023          	sb	a4,0(a5)
    4d00:	fec42783          	lw	a5,-20(s0)
    4d04:	00a00593          	li	a1,10
    4d08:	00078513          	mv	a0,a5
    4d0c:	3b1020ef          	jal	78bc <__divsi3>
    4d10:	00050793          	mv	a5,a0
    4d14:	fef42623          	sw	a5,-20(s0)
    4d18:	fec42783          	lw	a5,-20(s0)
    4d1c:	00a00593          	li	a1,10
    4d20:	00078513          	mv	a0,a5
    4d24:	41d020ef          	jal	7940 <__modsi3>
    4d28:	00050793          	mv	a5,a0
    4d2c:	0ff7f793          	zext.b	a5,a5
    4d30:	03078793          	add	a5,a5,48
    4d34:	0ff7f713          	zext.b	a4,a5
    4d38:	f7442783          	lw	a5,-140(s0)
    4d3c:	00e78023          	sb	a4,0(a5)
    4d40:	f7442783          	lw	a5,-140(s0)
    4d44:	00378793          	add	a5,a5,3
    4d48:	f6f42a23          	sw	a5,-140(s0)
    4d4c:	1b80006f          	j	4f04 <parse_float+0x4a0>
    4d50:	f7344703          	lbu	a4,-141(s0)
    4d54:	06600793          	li	a5,102
    4d58:	1af71663          	bne	a4,a5,4f04 <parse_float+0x4a0>
    4d5c:	f8440793          	add	a5,s0,-124
    4d60:	fd440713          	add	a4,s0,-44
    4d64:	fd840693          	add	a3,s0,-40
    4d68:	f6c42603          	lw	a2,-148(s0)
    4d6c:	f7842503          	lw	a0,-136(s0)
    4d70:	f7c42583          	lw	a1,-132(s0)
    4d74:	b40ff0ef          	jal	40b4 <fcvtbuf>
    4d78:	fea42223          	sw	a0,-28(s0)
    4d7c:	fd442783          	lw	a5,-44(s0)
    4d80:	00078c63          	beqz	a5,4d98 <parse_float+0x334>
    4d84:	f7442783          	lw	a5,-140(s0)
    4d88:	00178713          	add	a4,a5,1
    4d8c:	f6e42a23          	sw	a4,-140(s0)
    4d90:	02d00713          	li	a4,45
    4d94:	00e78023          	sb	a4,0(a5)
    4d98:	fe442783          	lw	a5,-28(s0)
    4d9c:	0007c783          	lbu	a5,0(a5)
    4da0:	10078063          	beqz	a5,4ea0 <parse_float+0x43c>
    4da4:	fd842783          	lw	a5,-40(s0)
    4da8:	08f04c63          	bgtz	a5,4e40 <parse_float+0x3dc>
    4dac:	f7442783          	lw	a5,-140(s0)
    4db0:	00178713          	add	a4,a5,1
    4db4:	f6e42a23          	sw	a4,-140(s0)
    4db8:	03000713          	li	a4,48
    4dbc:	00e78023          	sb	a4,0(a5)
    4dc0:	f7442783          	lw	a5,-140(s0)
    4dc4:	00178713          	add	a4,a5,1
    4dc8:	f6e42a23          	sw	a4,-140(s0)
    4dcc:	02e00713          	li	a4,46
    4dd0:	00e78023          	sb	a4,0(a5)
    4dd4:	fe042423          	sw	zero,-24(s0)
    4dd8:	0240006f          	j	4dfc <parse_float+0x398>
    4ddc:	f7442783          	lw	a5,-140(s0)
    4de0:	00178713          	add	a4,a5,1
    4de4:	f6e42a23          	sw	a4,-140(s0)
    4de8:	03000713          	li	a4,48
    4dec:	00e78023          	sb	a4,0(a5)
    4df0:	fe842783          	lw	a5,-24(s0)
    4df4:	00178793          	add	a5,a5,1
    4df8:	fef42423          	sw	a5,-24(s0)
    4dfc:	fd842783          	lw	a5,-40(s0)
    4e00:	40f007b3          	neg	a5,a5
    4e04:	fe842703          	lw	a4,-24(s0)
    4e08:	fcf74ae3          	blt	a4,a5,4ddc <parse_float+0x378>
    4e0c:	0240006f          	j	4e30 <parse_float+0x3cc>
    4e10:	fe442703          	lw	a4,-28(s0)
    4e14:	00170793          	add	a5,a4,1
    4e18:	fef42223          	sw	a5,-28(s0)
    4e1c:	f7442783          	lw	a5,-140(s0)
    4e20:	00178693          	add	a3,a5,1
    4e24:	f6d42a23          	sw	a3,-140(s0)
    4e28:	00074703          	lbu	a4,0(a4)
    4e2c:	00e78023          	sb	a4,0(a5)
    4e30:	fe442783          	lw	a5,-28(s0)
    4e34:	0007c783          	lbu	a5,0(a5)
    4e38:	fc079ce3          	bnez	a5,4e10 <parse_float+0x3ac>
    4e3c:	0c80006f          	j	4f04 <parse_float+0x4a0>
    4e40:	fe042423          	sw	zero,-24(s0)
    4e44:	04c0006f          	j	4e90 <parse_float+0x42c>
    4e48:	fe842783          	lw	a5,-24(s0)
    4e4c:	00178713          	add	a4,a5,1
    4e50:	fee42423          	sw	a4,-24(s0)
    4e54:	fd842703          	lw	a4,-40(s0)
    4e58:	00e79c63          	bne	a5,a4,4e70 <parse_float+0x40c>
    4e5c:	f7442783          	lw	a5,-140(s0)
    4e60:	00178713          	add	a4,a5,1
    4e64:	f6e42a23          	sw	a4,-140(s0)
    4e68:	02e00713          	li	a4,46
    4e6c:	00e78023          	sb	a4,0(a5)
    4e70:	fe442703          	lw	a4,-28(s0)
    4e74:	00170793          	add	a5,a4,1
    4e78:	fef42223          	sw	a5,-28(s0)
    4e7c:	f7442783          	lw	a5,-140(s0)
    4e80:	00178693          	add	a3,a5,1
    4e84:	f6d42a23          	sw	a3,-140(s0)
    4e88:	00074703          	lbu	a4,0(a4)
    4e8c:	00e78023          	sb	a4,0(a5)
    4e90:	fe442783          	lw	a5,-28(s0)
    4e94:	0007c783          	lbu	a5,0(a5)
    4e98:	fa0798e3          	bnez	a5,4e48 <parse_float+0x3e4>
    4e9c:	0680006f          	j	4f04 <parse_float+0x4a0>
    4ea0:	f7442783          	lw	a5,-140(s0)
    4ea4:	00178713          	add	a4,a5,1
    4ea8:	f6e42a23          	sw	a4,-140(s0)
    4eac:	03000713          	li	a4,48
    4eb0:	00e78023          	sb	a4,0(a5)
    4eb4:	f6c42783          	lw	a5,-148(s0)
    4eb8:	04f05663          	blez	a5,4f04 <parse_float+0x4a0>
    4ebc:	f7442783          	lw	a5,-140(s0)
    4ec0:	00178713          	add	a4,a5,1
    4ec4:	f6e42a23          	sw	a4,-140(s0)
    4ec8:	02e00713          	li	a4,46
    4ecc:	00e78023          	sb	a4,0(a5)
    4ed0:	fe042423          	sw	zero,-24(s0)
    4ed4:	0240006f          	j	4ef8 <parse_float+0x494>
    4ed8:	f7442783          	lw	a5,-140(s0)
    4edc:	00178713          	add	a4,a5,1
    4ee0:	f6e42a23          	sw	a4,-140(s0)
    4ee4:	03000713          	li	a4,48
    4ee8:	00e78023          	sb	a4,0(a5)
    4eec:	fe842783          	lw	a5,-24(s0)
    4ef0:	00178793          	add	a5,a5,1
    4ef4:	fef42423          	sw	a5,-24(s0)
    4ef8:	fe842703          	lw	a4,-24(s0)
    4efc:	f6c42783          	lw	a5,-148(s0)
    4f00:	fcf74ce3          	blt	a4,a5,4ed8 <parse_float+0x474>
    4f04:	f7442783          	lw	a5,-140(s0)
    4f08:	00078023          	sb	zero,0(a5)
    4f0c:	00000013          	nop
    4f10:	09c12083          	lw	ra,156(sp)
    4f14:	09812403          	lw	s0,152(sp)
    4f18:	0a010113          	add	sp,sp,160
    4f1c:	00008067          	ret

00004f20 <decimal_point>:
    4f20:	fd010113          	add	sp,sp,-48
    4f24:	02112623          	sw	ra,44(sp)
    4f28:	02812423          	sw	s0,40(sp)
    4f2c:	03010413          	add	s0,sp,48
    4f30:	fca42e23          	sw	a0,-36(s0)
    4f34:	0400006f          	j	4f74 <decimal_point+0x54>
    4f38:	fdc42783          	lw	a5,-36(s0)
    4f3c:	0007c703          	lbu	a4,0(a5)
    4f40:	02e00793          	li	a5,46
    4f44:	0cf70463          	beq	a4,a5,500c <decimal_point+0xec>
    4f48:	fdc42783          	lw	a5,-36(s0)
    4f4c:	0007c703          	lbu	a4,0(a5)
    4f50:	06500793          	li	a5,101
    4f54:	02f70663          	beq	a4,a5,4f80 <decimal_point+0x60>
    4f58:	fdc42783          	lw	a5,-36(s0)
    4f5c:	0007c703          	lbu	a4,0(a5)
    4f60:	04500793          	li	a5,69
    4f64:	00f70e63          	beq	a4,a5,4f80 <decimal_point+0x60>
    4f68:	fdc42783          	lw	a5,-36(s0)
    4f6c:	00178793          	add	a5,a5,1
    4f70:	fcf42e23          	sw	a5,-36(s0)
    4f74:	fdc42783          	lw	a5,-36(s0)
    4f78:	0007c783          	lbu	a5,0(a5)
    4f7c:	fa079ee3          	bnez	a5,4f38 <decimal_point+0x18>
    4f80:	fdc42783          	lw	a5,-36(s0)
    4f84:	0007c783          	lbu	a5,0(a5)
    4f88:	06078263          	beqz	a5,4fec <decimal_point+0xcc>
    4f8c:	10000593          	li	a1,256
    4f90:	fdc42503          	lw	a0,-36(s0)
    4f94:	980ff0ef          	jal	4114 <strnlen>
    4f98:	00050793          	mv	a5,a0
    4f9c:	fef42623          	sw	a5,-20(s0)
    4fa0:	0340006f          	j	4fd4 <decimal_point+0xb4>
    4fa4:	fec42783          	lw	a5,-20(s0)
    4fa8:	fdc42703          	lw	a4,-36(s0)
    4fac:	00f70733          	add	a4,a4,a5
    4fb0:	fec42783          	lw	a5,-20(s0)
    4fb4:	00178793          	add	a5,a5,1
    4fb8:	fdc42683          	lw	a3,-36(s0)
    4fbc:	00f687b3          	add	a5,a3,a5
    4fc0:	00074703          	lbu	a4,0(a4)
    4fc4:	00e78023          	sb	a4,0(a5)
    4fc8:	fec42783          	lw	a5,-20(s0)
    4fcc:	fff78793          	add	a5,a5,-1
    4fd0:	fef42623          	sw	a5,-20(s0)
    4fd4:	fec42783          	lw	a5,-20(s0)
    4fd8:	fcf046e3          	bgtz	a5,4fa4 <decimal_point+0x84>
    4fdc:	fdc42783          	lw	a5,-36(s0)
    4fe0:	02e00713          	li	a4,46
    4fe4:	00e78023          	sb	a4,0(a5)
    4fe8:	0280006f          	j	5010 <decimal_point+0xf0>
    4fec:	fdc42783          	lw	a5,-36(s0)
    4ff0:	00178713          	add	a4,a5,1
    4ff4:	fce42e23          	sw	a4,-36(s0)
    4ff8:	02e00713          	li	a4,46
    4ffc:	00e78023          	sb	a4,0(a5)
    5000:	fdc42783          	lw	a5,-36(s0)
    5004:	00078023          	sb	zero,0(a5)
    5008:	0080006f          	j	5010 <decimal_point+0xf0>
    500c:	00000013          	nop
    5010:	02c12083          	lw	ra,44(sp)
    5014:	02812403          	lw	s0,40(sp)
    5018:	03010113          	add	sp,sp,48
    501c:	00008067          	ret

00005020 <cropzeros>:
    5020:	fd010113          	add	sp,sp,-48
    5024:	02812623          	sw	s0,44(sp)
    5028:	03010413          	add	s0,sp,48
    502c:	fca42e23          	sw	a0,-36(s0)
    5030:	0100006f          	j	5040 <cropzeros+0x20>
    5034:	fdc42783          	lw	a5,-36(s0)
    5038:	00178793          	add	a5,a5,1
    503c:	fcf42e23          	sw	a5,-36(s0)
    5040:	fdc42783          	lw	a5,-36(s0)
    5044:	0007c783          	lbu	a5,0(a5)
    5048:	00078a63          	beqz	a5,505c <cropzeros+0x3c>
    504c:	fdc42783          	lw	a5,-36(s0)
    5050:	0007c703          	lbu	a4,0(a5)
    5054:	02e00793          	li	a5,46
    5058:	fcf71ee3          	bne	a4,a5,5034 <cropzeros+0x14>
    505c:	fdc42783          	lw	a5,-36(s0)
    5060:	00178713          	add	a4,a5,1
    5064:	fce42e23          	sw	a4,-36(s0)
    5068:	0007c783          	lbu	a5,0(a5)
    506c:	0a078863          	beqz	a5,511c <cropzeros+0xfc>
    5070:	0100006f          	j	5080 <cropzeros+0x60>
    5074:	fdc42783          	lw	a5,-36(s0)
    5078:	00178793          	add	a5,a5,1
    507c:	fcf42e23          	sw	a5,-36(s0)
    5080:	fdc42783          	lw	a5,-36(s0)
    5084:	0007c783          	lbu	a5,0(a5)
    5088:	02078263          	beqz	a5,50ac <cropzeros+0x8c>
    508c:	fdc42783          	lw	a5,-36(s0)
    5090:	0007c703          	lbu	a4,0(a5)
    5094:	06500793          	li	a5,101
    5098:	00f70a63          	beq	a4,a5,50ac <cropzeros+0x8c>
    509c:	fdc42783          	lw	a5,-36(s0)
    50a0:	0007c703          	lbu	a4,0(a5)
    50a4:	04500793          	li	a5,69
    50a8:	fcf716e3          	bne	a4,a5,5074 <cropzeros+0x54>
    50ac:	fdc42783          	lw	a5,-36(s0)
    50b0:	fff78713          	add	a4,a5,-1
    50b4:	fce42e23          	sw	a4,-36(s0)
    50b8:	fef42623          	sw	a5,-20(s0)
    50bc:	0100006f          	j	50cc <cropzeros+0xac>
    50c0:	fdc42783          	lw	a5,-36(s0)
    50c4:	fff78793          	add	a5,a5,-1
    50c8:	fcf42e23          	sw	a5,-36(s0)
    50cc:	fdc42783          	lw	a5,-36(s0)
    50d0:	0007c703          	lbu	a4,0(a5)
    50d4:	03000793          	li	a5,48
    50d8:	fef704e3          	beq	a4,a5,50c0 <cropzeros+0xa0>
    50dc:	fdc42783          	lw	a5,-36(s0)
    50e0:	0007c703          	lbu	a4,0(a5)
    50e4:	02e00793          	li	a5,46
    50e8:	02f71463          	bne	a4,a5,5110 <cropzeros+0xf0>
    50ec:	fdc42783          	lw	a5,-36(s0)
    50f0:	fff78793          	add	a5,a5,-1
    50f4:	fcf42e23          	sw	a5,-36(s0)
    50f8:	0180006f          	j	5110 <cropzeros+0xf0>
    50fc:	fdc42783          	lw	a5,-36(s0)
    5100:	00178793          	add	a5,a5,1
    5104:	fcf42e23          	sw	a5,-36(s0)
    5108:	fdc42783          	lw	a5,-36(s0)
    510c:	00078023          	sb	zero,0(a5)
    5110:	fdc42703          	lw	a4,-36(s0)
    5114:	fec42783          	lw	a5,-20(s0)
    5118:	fef712e3          	bne	a4,a5,50fc <cropzeros+0xdc>
    511c:	00000013          	nop
    5120:	02c12403          	lw	s0,44(sp)
    5124:	03010113          	add	sp,sp,48
    5128:	00008067          	ret

0000512c <flt>:
    512c:	f7010113          	add	sp,sp,-144
    5130:	08112623          	sw	ra,140(sp)
    5134:	08812423          	sw	s0,136(sp)
    5138:	09212223          	sw	s2,132(sp)
    513c:	09312023          	sw	s3,128(sp)
    5140:	09010413          	add	s0,sp,144
    5144:	f8a42623          	sw	a0,-116(s0)
    5148:	f8b42023          	sw	a1,-128(s0)
    514c:	f8c42223          	sw	a2,-124(s0)
    5150:	f8d42423          	sw	a3,-120(s0)
    5154:	f6e42e23          	sw	a4,-132(s0)
    5158:	f7042a23          	sw	a6,-140(s0)
    515c:	f6f40da3          	sb	a5,-133(s0)
    5160:	f7442783          	lw	a5,-140(s0)
    5164:	0107f793          	and	a5,a5,16
    5168:	00078863          	beqz	a5,5178 <flt+0x4c>
    516c:	f7442783          	lw	a5,-140(s0)
    5170:	ffe7f793          	and	a5,a5,-2
    5174:	f6f42a23          	sw	a5,-140(s0)
    5178:	f7442783          	lw	a5,-140(s0)
    517c:	0017f793          	and	a5,a5,1
    5180:	00078663          	beqz	a5,518c <flt+0x60>
    5184:	03000793          	li	a5,48
    5188:	0080006f          	j	5190 <flt+0x64>
    518c:	02000793          	li	a5,32
    5190:	fef403a3          	sb	a5,-25(s0)
    5194:	fe0407a3          	sb	zero,-17(s0)
    5198:	f7442783          	lw	a5,-140(s0)
    519c:	0027f793          	and	a5,a5,2
    51a0:	08078a63          	beqz	a5,5234 <flt+0x108>
    51a4:	00000613          	li	a2,0
    51a8:	00000693          	li	a3,0
    51ac:	f8042503          	lw	a0,-128(s0)
    51b0:	f8442583          	lw	a1,-124(s0)
    51b4:	491010ef          	jal	6e44 <__ledf2>
    51b8:	00050793          	mv	a5,a0
    51bc:	0207da63          	bgez	a5,51f0 <flt+0xc4>
    51c0:	02d00793          	li	a5,45
    51c4:	fef407a3          	sb	a5,-17(s0)
    51c8:	f8042903          	lw	s2,-128(s0)
    51cc:	f8442703          	lw	a4,-124(s0)
    51d0:	800007b7          	lui	a5,0x80000
    51d4:	00f749b3          	xor	s3,a4,a5
    51d8:	f9242023          	sw	s2,-128(s0)
    51dc:	f9342223          	sw	s3,-124(s0)
    51e0:	f8842783          	lw	a5,-120(s0)
    51e4:	fff78793          	add	a5,a5,-1 # 7fffffff <__subdf3+0x7fff841b>
    51e8:	f8f42423          	sw	a5,-120(s0)
    51ec:	0480006f          	j	5234 <flt+0x108>
    51f0:	f7442783          	lw	a5,-140(s0)
    51f4:	0047f793          	and	a5,a5,4
    51f8:	00078e63          	beqz	a5,5214 <flt+0xe8>
    51fc:	02b00793          	li	a5,43
    5200:	fef407a3          	sb	a5,-17(s0)
    5204:	f8842783          	lw	a5,-120(s0)
    5208:	fff78793          	add	a5,a5,-1
    520c:	f8f42423          	sw	a5,-120(s0)
    5210:	0240006f          	j	5234 <flt+0x108>
    5214:	f7442783          	lw	a5,-140(s0)
    5218:	0087f793          	and	a5,a5,8
    521c:	00078c63          	beqz	a5,5234 <flt+0x108>
    5220:	02000793          	li	a5,32
    5224:	fef407a3          	sb	a5,-17(s0)
    5228:	f8842783          	lw	a5,-120(s0)
    522c:	fff78793          	add	a5,a5,-1
    5230:	f8f42423          	sw	a5,-120(s0)
    5234:	f7c42783          	lw	a5,-132(s0)
    5238:	0007d663          	bgez	a5,5244 <flt+0x118>
    523c:	00600793          	li	a5,6
    5240:	f6f42e23          	sw	a5,-132(s0)
    5244:	f7b44683          	lbu	a3,-133(s0)
    5248:	f9040793          	add	a5,s0,-112
    524c:	f7c42703          	lw	a4,-132(s0)
    5250:	00078613          	mv	a2,a5
    5254:	f8042503          	lw	a0,-128(s0)
    5258:	f8442583          	lw	a1,-124(s0)
    525c:	809ff0ef          	jal	4a64 <parse_float>
    5260:	f7442783          	lw	a5,-140(s0)
    5264:	0207f793          	and	a5,a5,32
    5268:	00078c63          	beqz	a5,5280 <flt+0x154>
    526c:	f7c42783          	lw	a5,-132(s0)
    5270:	00079863          	bnez	a5,5280 <flt+0x154>
    5274:	f9040793          	add	a5,s0,-112
    5278:	00078513          	mv	a0,a5
    527c:	ca5ff0ef          	jal	4f20 <decimal_point>
    5280:	f7b44703          	lbu	a4,-133(s0)
    5284:	06700793          	li	a5,103
    5288:	00f71e63          	bne	a4,a5,52a4 <flt+0x178>
    528c:	f7442783          	lw	a5,-140(s0)
    5290:	0207f793          	and	a5,a5,32
    5294:	00079863          	bnez	a5,52a4 <flt+0x178>
    5298:	f9040793          	add	a5,s0,-112
    529c:	00078513          	mv	a0,a5
    52a0:	d81ff0ef          	jal	5020 <cropzeros>
    52a4:	f9040793          	add	a5,s0,-112
    52a8:	10000593          	li	a1,256
    52ac:	00078513          	mv	a0,a5
    52b0:	e65fe0ef          	jal	4114 <strnlen>
    52b4:	00050793          	mv	a5,a0
    52b8:	fef42023          	sw	a5,-32(s0)
    52bc:	f8842703          	lw	a4,-120(s0)
    52c0:	fe042783          	lw	a5,-32(s0)
    52c4:	40f707b3          	sub	a5,a4,a5
    52c8:	f8f42423          	sw	a5,-120(s0)
    52cc:	f7442783          	lw	a5,-140(s0)
    52d0:	0117f793          	and	a5,a5,17
    52d4:	02079663          	bnez	a5,5300 <flt+0x1d4>
    52d8:	0180006f          	j	52f0 <flt+0x1c4>
    52dc:	f8c42783          	lw	a5,-116(s0)
    52e0:	00178713          	add	a4,a5,1
    52e4:	f8e42623          	sw	a4,-116(s0)
    52e8:	02000713          	li	a4,32
    52ec:	00e78023          	sb	a4,0(a5)
    52f0:	f8842783          	lw	a5,-120(s0)
    52f4:	fff78713          	add	a4,a5,-1
    52f8:	f8e42423          	sw	a4,-120(s0)
    52fc:	fef040e3          	bgtz	a5,52dc <flt+0x1b0>
    5300:	fef44783          	lbu	a5,-17(s0)
    5304:	00078c63          	beqz	a5,531c <flt+0x1f0>
    5308:	f8c42783          	lw	a5,-116(s0)
    530c:	00178713          	add	a4,a5,1
    5310:	f8e42623          	sw	a4,-116(s0)
    5314:	fef44703          	lbu	a4,-17(s0)
    5318:	00e78023          	sb	a4,0(a5)
    531c:	f7442783          	lw	a5,-140(s0)
    5320:	0107f793          	and	a5,a5,16
    5324:	02079663          	bnez	a5,5350 <flt+0x224>
    5328:	0180006f          	j	5340 <flt+0x214>
    532c:	f8c42783          	lw	a5,-116(s0)
    5330:	00178713          	add	a4,a5,1
    5334:	f8e42623          	sw	a4,-116(s0)
    5338:	fe744703          	lbu	a4,-25(s0)
    533c:	00e78023          	sb	a4,0(a5)
    5340:	f8842783          	lw	a5,-120(s0)
    5344:	fff78713          	add	a4,a5,-1
    5348:	f8e42423          	sw	a4,-120(s0)
    534c:	fef040e3          	bgtz	a5,532c <flt+0x200>
    5350:	fe042423          	sw	zero,-24(s0)
    5354:	0300006f          	j	5384 <flt+0x258>
    5358:	f8c42783          	lw	a5,-116(s0)
    535c:	00178713          	add	a4,a5,1
    5360:	f8e42623          	sw	a4,-116(s0)
    5364:	fe842703          	lw	a4,-24(s0)
    5368:	ff070713          	add	a4,a4,-16
    536c:	00870733          	add	a4,a4,s0
    5370:	fa074703          	lbu	a4,-96(a4)
    5374:	00e78023          	sb	a4,0(a5)
    5378:	fe842783          	lw	a5,-24(s0)
    537c:	00178793          	add	a5,a5,1
    5380:	fef42423          	sw	a5,-24(s0)
    5384:	fe842703          	lw	a4,-24(s0)
    5388:	fe042783          	lw	a5,-32(s0)
    538c:	fcf746e3          	blt	a4,a5,5358 <flt+0x22c>
    5390:	0180006f          	j	53a8 <flt+0x27c>
    5394:	f8c42783          	lw	a5,-116(s0)
    5398:	00178713          	add	a4,a5,1
    539c:	f8e42623          	sw	a4,-116(s0)
    53a0:	02000713          	li	a4,32
    53a4:	00e78023          	sb	a4,0(a5)
    53a8:	f8842783          	lw	a5,-120(s0)
    53ac:	fff78713          	add	a4,a5,-1
    53b0:	f8e42423          	sw	a4,-120(s0)
    53b4:	fef040e3          	bgtz	a5,5394 <flt+0x268>
    53b8:	f8c42783          	lw	a5,-116(s0)
    53bc:	00078513          	mv	a0,a5
    53c0:	08c12083          	lw	ra,140(sp)
    53c4:	08812403          	lw	s0,136(sp)
    53c8:	08412903          	lw	s2,132(sp)
    53cc:	08012983          	lw	s3,128(sp)
    53d0:	09010113          	add	sp,sp,144
    53d4:	00008067          	ret

000053d8 <ee_vsprintf>:
    53d8:	fb010113          	add	sp,sp,-80
    53dc:	04112623          	sw	ra,76(sp)
    53e0:	04812423          	sw	s0,72(sp)
    53e4:	05010413          	add	s0,sp,80
    53e8:	faa42e23          	sw	a0,-68(s0)
    53ec:	fab42c23          	sw	a1,-72(s0)
    53f0:	fac42a23          	sw	a2,-76(s0)
    53f4:	fbc42783          	lw	a5,-68(s0)
    53f8:	fef42023          	sw	a5,-32(s0)
    53fc:	5f40006f          	j	59f0 <ee_vsprintf+0x618>
    5400:	fb842783          	lw	a5,-72(s0)
    5404:	0007c703          	lbu	a4,0(a5)
    5408:	02500793          	li	a5,37
    540c:	02f70063          	beq	a4,a5,542c <ee_vsprintf+0x54>
    5410:	fb842703          	lw	a4,-72(s0)
    5414:	fe042783          	lw	a5,-32(s0)
    5418:	00178693          	add	a3,a5,1
    541c:	fed42023          	sw	a3,-32(s0)
    5420:	00074703          	lbu	a4,0(a4)
    5424:	00e78023          	sb	a4,0(a5)
    5428:	5bc0006f          	j	59e4 <ee_vsprintf+0x60c>
    542c:	fc042c23          	sw	zero,-40(s0)
    5430:	fb842783          	lw	a5,-72(s0)
    5434:	00178793          	add	a5,a5,1
    5438:	faf42c23          	sw	a5,-72(s0)
    543c:	fb842783          	lw	a5,-72(s0)
    5440:	0007c783          	lbu	a5,0(a5)
    5444:	fe078793          	add	a5,a5,-32
    5448:	01000713          	li	a4,16
    544c:	06f76463          	bltu	a4,a5,54b4 <ee_vsprintf+0xdc>
    5450:	00279713          	sll	a4,a5,0x2
    5454:	67000793          	li	a5,1648
    5458:	00f707b3          	add	a5,a4,a5
    545c:	0007a783          	lw	a5,0(a5)
    5460:	00078067          	jr	a5
    5464:	fd842783          	lw	a5,-40(s0)
    5468:	0107e793          	or	a5,a5,16
    546c:	fcf42c23          	sw	a5,-40(s0)
    5470:	fc1ff06f          	j	5430 <ee_vsprintf+0x58>
    5474:	fd842783          	lw	a5,-40(s0)
    5478:	0047e793          	or	a5,a5,4
    547c:	fcf42c23          	sw	a5,-40(s0)
    5480:	fb1ff06f          	j	5430 <ee_vsprintf+0x58>
    5484:	fd842783          	lw	a5,-40(s0)
    5488:	0087e793          	or	a5,a5,8
    548c:	fcf42c23          	sw	a5,-40(s0)
    5490:	fa1ff06f          	j	5430 <ee_vsprintf+0x58>
    5494:	fd842783          	lw	a5,-40(s0)
    5498:	0207e793          	or	a5,a5,32
    549c:	fcf42c23          	sw	a5,-40(s0)
    54a0:	f91ff06f          	j	5430 <ee_vsprintf+0x58>
    54a4:	fd842783          	lw	a5,-40(s0)
    54a8:	0017e793          	or	a5,a5,1
    54ac:	fcf42c23          	sw	a5,-40(s0)
    54b0:	f81ff06f          	j	5430 <ee_vsprintf+0x58>
    54b4:	fff00793          	li	a5,-1
    54b8:	fcf42a23          	sw	a5,-44(s0)
    54bc:	fb842783          	lw	a5,-72(s0)
    54c0:	0007c703          	lbu	a4,0(a5)
    54c4:	02f00793          	li	a5,47
    54c8:	02e7f463          	bgeu	a5,a4,54f0 <ee_vsprintf+0x118>
    54cc:	fb842783          	lw	a5,-72(s0)
    54d0:	0007c703          	lbu	a4,0(a5)
    54d4:	03900793          	li	a5,57
    54d8:	00e7ec63          	bltu	a5,a4,54f0 <ee_vsprintf+0x118>
    54dc:	fb840793          	add	a5,s0,-72
    54e0:	00078513          	mv	a0,a5
    54e4:	c95fe0ef          	jal	4178 <skip_atoi>
    54e8:	fca42a23          	sw	a0,-44(s0)
    54ec:	0540006f          	j	5540 <ee_vsprintf+0x168>
    54f0:	fb842783          	lw	a5,-72(s0)
    54f4:	0007c703          	lbu	a4,0(a5)
    54f8:	02a00793          	li	a5,42
    54fc:	04f71263          	bne	a4,a5,5540 <ee_vsprintf+0x168>
    5500:	fb842783          	lw	a5,-72(s0)
    5504:	00178793          	add	a5,a5,1
    5508:	faf42c23          	sw	a5,-72(s0)
    550c:	fb442783          	lw	a5,-76(s0)
    5510:	00478713          	add	a4,a5,4
    5514:	fae42a23          	sw	a4,-76(s0)
    5518:	0007a783          	lw	a5,0(a5)
    551c:	fcf42a23          	sw	a5,-44(s0)
    5520:	fd442783          	lw	a5,-44(s0)
    5524:	0007de63          	bgez	a5,5540 <ee_vsprintf+0x168>
    5528:	fd442783          	lw	a5,-44(s0)
    552c:	40f007b3          	neg	a5,a5
    5530:	fcf42a23          	sw	a5,-44(s0)
    5534:	fd842783          	lw	a5,-40(s0)
    5538:	0107e793          	or	a5,a5,16
    553c:	fcf42c23          	sw	a5,-40(s0)
    5540:	fff00793          	li	a5,-1
    5544:	fcf42823          	sw	a5,-48(s0)
    5548:	fb842783          	lw	a5,-72(s0)
    554c:	0007c703          	lbu	a4,0(a5)
    5550:	02e00793          	li	a5,46
    5554:	08f71063          	bne	a4,a5,55d4 <ee_vsprintf+0x1fc>
    5558:	fb842783          	lw	a5,-72(s0)
    555c:	00178793          	add	a5,a5,1
    5560:	faf42c23          	sw	a5,-72(s0)
    5564:	fb842783          	lw	a5,-72(s0)
    5568:	0007c703          	lbu	a4,0(a5)
    556c:	02f00793          	li	a5,47
    5570:	02e7f463          	bgeu	a5,a4,5598 <ee_vsprintf+0x1c0>
    5574:	fb842783          	lw	a5,-72(s0)
    5578:	0007c703          	lbu	a4,0(a5)
    557c:	03900793          	li	a5,57
    5580:	00e7ec63          	bltu	a5,a4,5598 <ee_vsprintf+0x1c0>
    5584:	fb840793          	add	a5,s0,-72
    5588:	00078513          	mv	a0,a5
    558c:	bedfe0ef          	jal	4178 <skip_atoi>
    5590:	fca42823          	sw	a0,-48(s0)
    5594:	0340006f          	j	55c8 <ee_vsprintf+0x1f0>
    5598:	fb842783          	lw	a5,-72(s0)
    559c:	0007c703          	lbu	a4,0(a5)
    55a0:	02a00793          	li	a5,42
    55a4:	02f71263          	bne	a4,a5,55c8 <ee_vsprintf+0x1f0>
    55a8:	fb842783          	lw	a5,-72(s0)
    55ac:	00178793          	add	a5,a5,1
    55b0:	faf42c23          	sw	a5,-72(s0)
    55b4:	fb442783          	lw	a5,-76(s0)
    55b8:	00478713          	add	a4,a5,4
    55bc:	fae42a23          	sw	a4,-76(s0)
    55c0:	0007a783          	lw	a5,0(a5)
    55c4:	fcf42823          	sw	a5,-48(s0)
    55c8:	fd042783          	lw	a5,-48(s0)
    55cc:	0007d463          	bgez	a5,55d4 <ee_vsprintf+0x1fc>
    55d0:	fc042823          	sw	zero,-48(s0)
    55d4:	fff00793          	li	a5,-1
    55d8:	fcf42623          	sw	a5,-52(s0)
    55dc:	fb842783          	lw	a5,-72(s0)
    55e0:	0007c703          	lbu	a4,0(a5)
    55e4:	06c00793          	li	a5,108
    55e8:	00f70a63          	beq	a4,a5,55fc <ee_vsprintf+0x224>
    55ec:	fb842783          	lw	a5,-72(s0)
    55f0:	0007c703          	lbu	a4,0(a5)
    55f4:	04c00793          	li	a5,76
    55f8:	00f71e63          	bne	a4,a5,5614 <ee_vsprintf+0x23c>
    55fc:	fb842783          	lw	a5,-72(s0)
    5600:	0007c783          	lbu	a5,0(a5)
    5604:	fcf42623          	sw	a5,-52(s0)
    5608:	fb842783          	lw	a5,-72(s0)
    560c:	00178793          	add	a5,a5,1
    5610:	faf42c23          	sw	a5,-72(s0)
    5614:	00a00793          	li	a5,10
    5618:	fef42223          	sw	a5,-28(s0)
    561c:	fb842783          	lw	a5,-72(s0)
    5620:	0007c783          	lbu	a5,0(a5)
    5624:	fbf78793          	add	a5,a5,-65
    5628:	03700713          	li	a4,55
    562c:	2cf76e63          	bltu	a4,a5,5908 <ee_vsprintf+0x530>
    5630:	00279713          	sll	a4,a5,0x2
    5634:	6b400793          	li	a5,1716
    5638:	00f707b3          	add	a5,a4,a5
    563c:	0007a783          	lw	a5,0(a5)
    5640:	00078067          	jr	a5
    5644:	fd842783          	lw	a5,-40(s0)
    5648:	0107f793          	and	a5,a5,16
    564c:	02079863          	bnez	a5,567c <ee_vsprintf+0x2a4>
    5650:	0180006f          	j	5668 <ee_vsprintf+0x290>
    5654:	fe042783          	lw	a5,-32(s0)
    5658:	00178713          	add	a4,a5,1
    565c:	fee42023          	sw	a4,-32(s0)
    5660:	02000713          	li	a4,32
    5664:	00e78023          	sb	a4,0(a5)
    5668:	fd442783          	lw	a5,-44(s0)
    566c:	fff78793          	add	a5,a5,-1
    5670:	fcf42a23          	sw	a5,-44(s0)
    5674:	fd442783          	lw	a5,-44(s0)
    5678:	fcf04ee3          	bgtz	a5,5654 <ee_vsprintf+0x27c>
    567c:	fb442783          	lw	a5,-76(s0)
    5680:	00478713          	add	a4,a5,4
    5684:	fae42a23          	sw	a4,-76(s0)
    5688:	0007a683          	lw	a3,0(a5)
    568c:	fe042783          	lw	a5,-32(s0)
    5690:	00178713          	add	a4,a5,1
    5694:	fee42023          	sw	a4,-32(s0)
    5698:	0ff6f713          	zext.b	a4,a3
    569c:	00e78023          	sb	a4,0(a5)
    56a0:	0180006f          	j	56b8 <ee_vsprintf+0x2e0>
    56a4:	fe042783          	lw	a5,-32(s0)
    56a8:	00178713          	add	a4,a5,1
    56ac:	fee42023          	sw	a4,-32(s0)
    56b0:	02000713          	li	a4,32
    56b4:	00e78023          	sb	a4,0(a5)
    56b8:	fd442783          	lw	a5,-44(s0)
    56bc:	fff78793          	add	a5,a5,-1
    56c0:	fcf42a23          	sw	a5,-44(s0)
    56c4:	fd442783          	lw	a5,-44(s0)
    56c8:	fcf04ee3          	bgtz	a5,56a4 <ee_vsprintf+0x2cc>
    56cc:	3180006f          	j	59e4 <ee_vsprintf+0x60c>
    56d0:	fb442783          	lw	a5,-76(s0)
    56d4:	00478713          	add	a4,a5,4
    56d8:	fae42a23          	sw	a4,-76(s0)
    56dc:	0007a783          	lw	a5,0(a5)
    56e0:	fcf42e23          	sw	a5,-36(s0)
    56e4:	fdc42783          	lw	a5,-36(s0)
    56e8:	00079663          	bnez	a5,56f4 <ee_vsprintf+0x31c>
    56ec:	66800793          	li	a5,1640
    56f0:	fcf42e23          	sw	a5,-36(s0)
    56f4:	fd042783          	lw	a5,-48(s0)
    56f8:	00078593          	mv	a1,a5
    56fc:	fdc42503          	lw	a0,-36(s0)
    5700:	a15fe0ef          	jal	4114 <strnlen>
    5704:	00050793          	mv	a5,a0
    5708:	fcf42423          	sw	a5,-56(s0)
    570c:	fd842783          	lw	a5,-40(s0)
    5710:	0107f793          	and	a5,a5,16
    5714:	02079863          	bnez	a5,5744 <ee_vsprintf+0x36c>
    5718:	0180006f          	j	5730 <ee_vsprintf+0x358>
    571c:	fe042783          	lw	a5,-32(s0)
    5720:	00178713          	add	a4,a5,1
    5724:	fee42023          	sw	a4,-32(s0)
    5728:	02000713          	li	a4,32
    572c:	00e78023          	sb	a4,0(a5)
    5730:	fd442783          	lw	a5,-44(s0)
    5734:	fff78713          	add	a4,a5,-1
    5738:	fce42a23          	sw	a4,-44(s0)
    573c:	fc842703          	lw	a4,-56(s0)
    5740:	fcf74ee3          	blt	a4,a5,571c <ee_vsprintf+0x344>
    5744:	fe042423          	sw	zero,-24(s0)
    5748:	0300006f          	j	5778 <ee_vsprintf+0x3a0>
    574c:	fdc42703          	lw	a4,-36(s0)
    5750:	00170793          	add	a5,a4,1
    5754:	fcf42e23          	sw	a5,-36(s0)
    5758:	fe042783          	lw	a5,-32(s0)
    575c:	00178693          	add	a3,a5,1
    5760:	fed42023          	sw	a3,-32(s0)
    5764:	00074703          	lbu	a4,0(a4)
    5768:	00e78023          	sb	a4,0(a5)
    576c:	fe842783          	lw	a5,-24(s0)
    5770:	00178793          	add	a5,a5,1
    5774:	fef42423          	sw	a5,-24(s0)
    5778:	fe842703          	lw	a4,-24(s0)
    577c:	fc842783          	lw	a5,-56(s0)
    5780:	fcf746e3          	blt	a4,a5,574c <ee_vsprintf+0x374>
    5784:	0180006f          	j	579c <ee_vsprintf+0x3c4>
    5788:	fe042783          	lw	a5,-32(s0)
    578c:	00178713          	add	a4,a5,1
    5790:	fee42023          	sw	a4,-32(s0)
    5794:	02000713          	li	a4,32
    5798:	00e78023          	sb	a4,0(a5)
    579c:	fd442783          	lw	a5,-44(s0)
    57a0:	fff78713          	add	a4,a5,-1
    57a4:	fce42a23          	sw	a4,-44(s0)
    57a8:	fc842703          	lw	a4,-56(s0)
    57ac:	fcf74ee3          	blt	a4,a5,5788 <ee_vsprintf+0x3b0>
    57b0:	2340006f          	j	59e4 <ee_vsprintf+0x60c>
    57b4:	fd442703          	lw	a4,-44(s0)
    57b8:	fff00793          	li	a5,-1
    57bc:	00f71c63          	bne	a4,a5,57d4 <ee_vsprintf+0x3fc>
    57c0:	00800793          	li	a5,8
    57c4:	fcf42a23          	sw	a5,-44(s0)
    57c8:	fd842783          	lw	a5,-40(s0)
    57cc:	0017e793          	or	a5,a5,1
    57d0:	fcf42c23          	sw	a5,-40(s0)
    57d4:	fb442783          	lw	a5,-76(s0)
    57d8:	00478713          	add	a4,a5,4
    57dc:	fae42a23          	sw	a4,-76(s0)
    57e0:	0007a783          	lw	a5,0(a5)
    57e4:	00078593          	mv	a1,a5
    57e8:	fd842783          	lw	a5,-40(s0)
    57ec:	fd042703          	lw	a4,-48(s0)
    57f0:	fd442683          	lw	a3,-44(s0)
    57f4:	01000613          	li	a2,16
    57f8:	fe042503          	lw	a0,-32(s0)
    57fc:	a0dfe0ef          	jal	4208 <number>
    5800:	fea42023          	sw	a0,-32(s0)
    5804:	1e00006f          	j	59e4 <ee_vsprintf+0x60c>
    5808:	fd842783          	lw	a5,-40(s0)
    580c:	0407e793          	or	a5,a5,64
    5810:	fcf42c23          	sw	a5,-40(s0)
    5814:	fcc42703          	lw	a4,-52(s0)
    5818:	06c00793          	li	a5,108
    581c:	02f71a63          	bne	a4,a5,5850 <ee_vsprintf+0x478>
    5820:	fb442783          	lw	a5,-76(s0)
    5824:	00478713          	add	a4,a5,4
    5828:	fae42a23          	sw	a4,-76(s0)
    582c:	0007a783          	lw	a5,0(a5)
    5830:	fd842703          	lw	a4,-40(s0)
    5834:	fd042683          	lw	a3,-48(s0)
    5838:	fd442603          	lw	a2,-44(s0)
    583c:	00078593          	mv	a1,a5
    5840:	fe042503          	lw	a0,-32(s0)
    5844:	d5dfe0ef          	jal	45a0 <eaddr>
    5848:	fea42023          	sw	a0,-32(s0)
    584c:	1980006f          	j	59e4 <ee_vsprintf+0x60c>
    5850:	fb442783          	lw	a5,-76(s0)
    5854:	00478713          	add	a4,a5,4
    5858:	fae42a23          	sw	a4,-76(s0)
    585c:	0007a783          	lw	a5,0(a5)
    5860:	fd842703          	lw	a4,-40(s0)
    5864:	fd042683          	lw	a3,-48(s0)
    5868:	fd442603          	lw	a2,-44(s0)
    586c:	00078593          	mv	a1,a5
    5870:	fe042503          	lw	a0,-32(s0)
    5874:	ee1fe0ef          	jal	4754 <iaddr>
    5878:	fea42023          	sw	a0,-32(s0)
    587c:	1680006f          	j	59e4 <ee_vsprintf+0x60c>
    5880:	00800793          	li	a5,8
    5884:	fef42223          	sw	a5,-28(s0)
    5888:	0e00006f          	j	5968 <ee_vsprintf+0x590>
    588c:	fd842783          	lw	a5,-40(s0)
    5890:	0407e793          	or	a5,a5,64
    5894:	fcf42c23          	sw	a5,-40(s0)
    5898:	01000793          	li	a5,16
    589c:	fef42223          	sw	a5,-28(s0)
    58a0:	0c80006f          	j	5968 <ee_vsprintf+0x590>
    58a4:	fd842783          	lw	a5,-40(s0)
    58a8:	0027e793          	or	a5,a5,2
    58ac:	fcf42c23          	sw	a5,-40(s0)
    58b0:	0b40006f          	j	5964 <ee_vsprintf+0x58c>
    58b4:	fb442783          	lw	a5,-76(s0)
    58b8:	00778793          	add	a5,a5,7
    58bc:	ff87f793          	and	a5,a5,-8
    58c0:	00878713          	add	a4,a5,8
    58c4:	fae42a23          	sw	a4,-76(s0)
    58c8:	0007a503          	lw	a0,0(a5)
    58cc:	0047a583          	lw	a1,4(a5)
    58d0:	fb842783          	lw	a5,-72(s0)
    58d4:	0007c703          	lbu	a4,0(a5)
    58d8:	fd842783          	lw	a5,-40(s0)
    58dc:	0027e793          	or	a5,a5,2
    58e0:	00078813          	mv	a6,a5
    58e4:	00070793          	mv	a5,a4
    58e8:	fd042703          	lw	a4,-48(s0)
    58ec:	fd442683          	lw	a3,-44(s0)
    58f0:	00058613          	mv	a2,a1
    58f4:	00050593          	mv	a1,a0
    58f8:	fe042503          	lw	a0,-32(s0)
    58fc:	831ff0ef          	jal	512c <flt>
    5900:	fea42023          	sw	a0,-32(s0)
    5904:	0e00006f          	j	59e4 <ee_vsprintf+0x60c>
    5908:	fb842783          	lw	a5,-72(s0)
    590c:	0007c703          	lbu	a4,0(a5)
    5910:	02500793          	li	a5,37
    5914:	00f70c63          	beq	a4,a5,592c <ee_vsprintf+0x554>
    5918:	fe042783          	lw	a5,-32(s0)
    591c:	00178713          	add	a4,a5,1
    5920:	fee42023          	sw	a4,-32(s0)
    5924:	02500713          	li	a4,37
    5928:	00e78023          	sb	a4,0(a5)
    592c:	fb842783          	lw	a5,-72(s0)
    5930:	0007c783          	lbu	a5,0(a5)
    5934:	02078063          	beqz	a5,5954 <ee_vsprintf+0x57c>
    5938:	fb842703          	lw	a4,-72(s0)
    593c:	fe042783          	lw	a5,-32(s0)
    5940:	00178693          	add	a3,a5,1
    5944:	fed42023          	sw	a3,-32(s0)
    5948:	00074703          	lbu	a4,0(a4)
    594c:	00e78023          	sb	a4,0(a5)
    5950:	0940006f          	j	59e4 <ee_vsprintf+0x60c>
    5954:	fb842783          	lw	a5,-72(s0)
    5958:	fff78793          	add	a5,a5,-1
    595c:	faf42c23          	sw	a5,-72(s0)
    5960:	0840006f          	j	59e4 <ee_vsprintf+0x60c>
    5964:	00000013          	nop
    5968:	fcc42703          	lw	a4,-52(s0)
    596c:	06c00793          	li	a5,108
    5970:	00f71e63          	bne	a4,a5,598c <ee_vsprintf+0x5b4>
    5974:	fb442783          	lw	a5,-76(s0)
    5978:	00478713          	add	a4,a5,4
    597c:	fae42a23          	sw	a4,-76(s0)
    5980:	0007a783          	lw	a5,0(a5)
    5984:	fef42623          	sw	a5,-20(s0)
    5988:	03c0006f          	j	59c4 <ee_vsprintf+0x5ec>
    598c:	fd842783          	lw	a5,-40(s0)
    5990:	0027f793          	and	a5,a5,2
    5994:	00078e63          	beqz	a5,59b0 <ee_vsprintf+0x5d8>
    5998:	fb442783          	lw	a5,-76(s0)
    599c:	00478713          	add	a4,a5,4
    59a0:	fae42a23          	sw	a4,-76(s0)
    59a4:	0007a783          	lw	a5,0(a5)
    59a8:	fef42623          	sw	a5,-20(s0)
    59ac:	0180006f          	j	59c4 <ee_vsprintf+0x5ec>
    59b0:	fb442783          	lw	a5,-76(s0)
    59b4:	00478713          	add	a4,a5,4
    59b8:	fae42a23          	sw	a4,-76(s0)
    59bc:	0007a783          	lw	a5,0(a5)
    59c0:	fef42623          	sw	a5,-20(s0)
    59c4:	fec42583          	lw	a1,-20(s0)
    59c8:	fd842783          	lw	a5,-40(s0)
    59cc:	fd042703          	lw	a4,-48(s0)
    59d0:	fd442683          	lw	a3,-44(s0)
    59d4:	fe442603          	lw	a2,-28(s0)
    59d8:	fe042503          	lw	a0,-32(s0)
    59dc:	82dfe0ef          	jal	4208 <number>
    59e0:	fea42023          	sw	a0,-32(s0)
    59e4:	fb842783          	lw	a5,-72(s0)
    59e8:	00178793          	add	a5,a5,1
    59ec:	faf42c23          	sw	a5,-72(s0)
    59f0:	fb842783          	lw	a5,-72(s0)
    59f4:	0007c783          	lbu	a5,0(a5)
    59f8:	a00794e3          	bnez	a5,5400 <ee_vsprintf+0x28>
    59fc:	fe042783          	lw	a5,-32(s0)
    5a00:	00078023          	sb	zero,0(a5)
    5a04:	fe042703          	lw	a4,-32(s0)
    5a08:	fbc42783          	lw	a5,-68(s0)
    5a0c:	40f707b3          	sub	a5,a4,a5
    5a10:	00078513          	mv	a0,a5
    5a14:	04c12083          	lw	ra,76(sp)
    5a18:	04812403          	lw	s0,72(sp)
    5a1c:	05010113          	add	sp,sp,80
    5a20:	00008067          	ret

00005a24 <uart_send_char>:
    5a24:	fd010113          	add	sp,sp,-48
    5a28:	02812623          	sw	s0,44(sp)
    5a2c:	03010413          	add	s0,sp,48
    5a30:	00050793          	mv	a5,a0
    5a34:	fcf40fa3          	sb	a5,-33(s0)
    5a38:	060007b7          	lui	a5,0x6000
    5a3c:	fef42623          	sw	a5,-20(s0)
    5a40:	00000013          	nop
    5a44:	fec42783          	lw	a5,-20(s0)
    5a48:	00878793          	add	a5,a5,8 # 6000008 <__subdf3+0x5ff8424>
    5a4c:	0007c783          	lbu	a5,0(a5)
    5a50:	0ff7f793          	zext.b	a5,a5
    5a54:	fe0798e3          	bnez	a5,5a44 <uart_send_char+0x20>
    5a58:	fec42783          	lw	a5,-20(s0)
    5a5c:	fdf44703          	lbu	a4,-33(s0)
    5a60:	00e78023          	sb	a4,0(a5)
    5a64:	00000013          	nop
    5a68:	fec42783          	lw	a5,-20(s0)
    5a6c:	00878793          	add	a5,a5,8
    5a70:	0007c783          	lbu	a5,0(a5)
    5a74:	0ff7f793          	zext.b	a5,a5
    5a78:	fe0798e3          	bnez	a5,5a68 <uart_send_char+0x44>
    5a7c:	00000013          	nop
    5a80:	00000013          	nop
    5a84:	02c12403          	lw	s0,44(sp)
    5a88:	03010113          	add	sp,sp,48
    5a8c:	00008067          	ret

00005a90 <ee_printf>:
    5a90:	bb010113          	add	sp,sp,-1104
    5a94:	42112623          	sw	ra,1068(sp)
    5a98:	42812423          	sw	s0,1064(sp)
    5a9c:	43010413          	add	s0,sp,1072
    5aa0:	bca42e23          	sw	a0,-1060(s0)
    5aa4:	00b42223          	sw	a1,4(s0)
    5aa8:	00c42423          	sw	a2,8(s0)
    5aac:	00d42623          	sw	a3,12(s0)
    5ab0:	00e42823          	sw	a4,16(s0)
    5ab4:	00f42a23          	sw	a5,20(s0)
    5ab8:	01042c23          	sw	a6,24(s0)
    5abc:	01142e23          	sw	a7,28(s0)
    5ac0:	fe042423          	sw	zero,-24(s0)
    5ac4:	02040793          	add	a5,s0,32
    5ac8:	bcf42c23          	sw	a5,-1064(s0)
    5acc:	bd842783          	lw	a5,-1064(s0)
    5ad0:	fe478793          	add	a5,a5,-28
    5ad4:	bef42223          	sw	a5,-1052(s0)
    5ad8:	be442703          	lw	a4,-1052(s0)
    5adc:	be840793          	add	a5,s0,-1048
    5ae0:	00070613          	mv	a2,a4
    5ae4:	bdc42583          	lw	a1,-1060(s0)
    5ae8:	00078513          	mv	a0,a5
    5aec:	8edff0ef          	jal	53d8 <ee_vsprintf>
    5af0:	be840793          	add	a5,s0,-1048
    5af4:	fef42623          	sw	a5,-20(s0)
    5af8:	02c0006f          	j	5b24 <ee_printf+0x94>
    5afc:	fec42783          	lw	a5,-20(s0)
    5b00:	0007c783          	lbu	a5,0(a5)
    5b04:	00078513          	mv	a0,a5
    5b08:	f1dff0ef          	jal	5a24 <uart_send_char>
    5b0c:	fe842783          	lw	a5,-24(s0)
    5b10:	00178793          	add	a5,a5,1
    5b14:	fef42423          	sw	a5,-24(s0)
    5b18:	fec42783          	lw	a5,-20(s0)
    5b1c:	00178793          	add	a5,a5,1
    5b20:	fef42623          	sw	a5,-20(s0)
    5b24:	fec42783          	lw	a5,-20(s0)
    5b28:	0007c783          	lbu	a5,0(a5)
    5b2c:	fc0798e3          	bnez	a5,5afc <ee_printf+0x6c>
    5b30:	fe842783          	lw	a5,-24(s0)
    5b34:	00078513          	mv	a0,a5
    5b38:	42c12083          	lw	ra,1068(sp)
    5b3c:	42812403          	lw	s0,1064(sp)
    5b40:	45010113          	add	sp,sp,1104
    5b44:	00008067          	ret

00005b48 <__adddf3>:
    5b48:	001007b7          	lui	a5,0x100
    5b4c:	fe010113          	add	sp,sp,-32
    5b50:	fff78e93          	add	t4,a5,-1 # fffff <__subdf3+0xf841b>
    5b54:	00bef833          	and	a6,t4,a1
    5b58:	00def7b3          	and	a5,t4,a3
    5b5c:	0146d313          	srl	t1,a3,0x14
    5b60:	01212823          	sw	s2,16(sp)
    5b64:	0145d913          	srl	s2,a1,0x14
    5b68:	00379793          	sll	a5,a5,0x3
    5b6c:	00812c23          	sw	s0,24(sp)
    5b70:	00381813          	sll	a6,a6,0x3
    5b74:	01f5d413          	srl	s0,a1,0x1f
    5b78:	01d55713          	srl	a4,a0,0x1d
    5b7c:	01d65893          	srl	a7,a2,0x1d
    5b80:	7ff97913          	and	s2,s2,2047
    5b84:	7ff37313          	and	t1,t1,2047
    5b88:	00112e23          	sw	ra,28(sp)
    5b8c:	00912a23          	sw	s1,20(sp)
    5b90:	01312623          	sw	s3,12(sp)
    5b94:	01f6d693          	srl	a3,a3,0x1f
    5b98:	00f8e8b3          	or	a7,a7,a5
    5b9c:	01076733          	or	a4,a4,a6
    5ba0:	00351593          	sll	a1,a0,0x3
    5ba4:	00361f13          	sll	t5,a2,0x3
    5ba8:	406907b3          	sub	a5,s2,t1
    5bac:	1ed40463          	beq	s0,a3,5d94 <__adddf3+0x24c>
    5bb0:	16f05263          	blez	a5,5d14 <__adddf3+0x1cc>
    5bb4:	28030663          	beqz	t1,5e40 <__adddf3+0x2f8>
    5bb8:	7ff00693          	li	a3,2047
    5bbc:	42d90663          	beq	s2,a3,5fe8 <__adddf3+0x4a0>
    5bc0:	03800693          	li	a3,56
    5bc4:	00100613          	li	a2,1
    5bc8:	02f6ce63          	blt	a3,a5,5c04 <__adddf3+0xbc>
    5bcc:	008006b7          	lui	a3,0x800
    5bd0:	00d8e8b3          	or	a7,a7,a3
    5bd4:	01f00693          	li	a3,31
    5bd8:	52f6ce63          	blt	a3,a5,6114 <__adddf3+0x5cc>
    5bdc:	02000693          	li	a3,32
    5be0:	40f686b3          	sub	a3,a3,a5
    5be4:	00d89633          	sll	a2,a7,a3
    5be8:	00ff5533          	srl	a0,t5,a5
    5bec:	00df16b3          	sll	a3,t5,a3
    5bf0:	00a66633          	or	a2,a2,a0
    5bf4:	00d036b3          	snez	a3,a3
    5bf8:	00f8d8b3          	srl	a7,a7,a5
    5bfc:	00d66633          	or	a2,a2,a3
    5c00:	41170733          	sub	a4,a4,a7
    5c04:	40c58633          	sub	a2,a1,a2
    5c08:	00c5b5b3          	sltu	a1,a1,a2
    5c0c:	00060493          	mv	s1,a2
    5c10:	40b709b3          	sub	s3,a4,a1
    5c14:	00899793          	sll	a5,s3,0x8
    5c18:	3207da63          	bgez	a5,5f4c <__adddf3+0x404>
    5c1c:	008007b7          	lui	a5,0x800
    5c20:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f841b>
    5c24:	00f9f9b3          	and	s3,s3,a5
    5c28:	2c098863          	beqz	s3,5ef8 <__adddf3+0x3b0>
    5c2c:	00098513          	mv	a0,s3
    5c30:	541010ef          	jal	7970 <__clzsi2>
    5c34:	ff850793          	add	a5,a0,-8
    5c38:	02000693          	li	a3,32
    5c3c:	40f68733          	sub	a4,a3,a5
    5c40:	00e4d733          	srl	a4,s1,a4
    5c44:	00f999b3          	sll	s3,s3,a5
    5c48:	01376733          	or	a4,a4,s3
    5c4c:	00f494b3          	sll	s1,s1,a5
    5c50:	4b27c863          	blt	a5,s2,6100 <__adddf3+0x5b8>
    5c54:	412787b3          	sub	a5,a5,s2
    5c58:	00178793          	add	a5,a5,1
    5c5c:	40f686b3          	sub	a3,a3,a5
    5c60:	00d49633          	sll	a2,s1,a3
    5c64:	00f4d9b3          	srl	s3,s1,a5
    5c68:	00c03633          	snez	a2,a2
    5c6c:	01366633          	or	a2,a2,s3
    5c70:	00d716b3          	sll	a3,a4,a3
    5c74:	00c6e4b3          	or	s1,a3,a2
    5c78:	00f759b3          	srl	s3,a4,a5
    5c7c:	00000913          	li	s2,0
    5c80:	0074f793          	and	a5,s1,7
    5c84:	02078063          	beqz	a5,5ca4 <__adddf3+0x15c>
    5c88:	00f4f793          	and	a5,s1,15
    5c8c:	00400713          	li	a4,4
    5c90:	00e78a63          	beq	a5,a4,5ca4 <__adddf3+0x15c>
    5c94:	00448793          	add	a5,s1,4
    5c98:	0097b633          	sltu	a2,a5,s1
    5c9c:	00c989b3          	add	s3,s3,a2
    5ca0:	00078493          	mv	s1,a5
    5ca4:	00899793          	sll	a5,s3,0x8
    5ca8:	6e07da63          	bgez	a5,639c <__adddf3+0x854>
    5cac:	00190793          	add	a5,s2,1
    5cb0:	7ff00713          	li	a4,2047
    5cb4:	00040e13          	mv	t3,s0
    5cb8:	2ae78663          	beq	a5,a4,5f64 <__adddf3+0x41c>
    5cbc:	ff800737          	lui	a4,0xff800
    5cc0:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f841b>
    5cc4:	00e9f733          	and	a4,s3,a4
    5cc8:	7ff7f793          	and	a5,a5,2047
    5ccc:	01d71813          	sll	a6,a4,0x1d
    5cd0:	0034d613          	srl	a2,s1,0x3
    5cd4:	00971713          	sll	a4,a4,0x9
    5cd8:	00c86833          	or	a6,a6,a2
    5cdc:	00c75713          	srl	a4,a4,0xc
    5ce0:	01c12083          	lw	ra,28(sp)
    5ce4:	01812403          	lw	s0,24(sp)
    5ce8:	01479793          	sll	a5,a5,0x14
    5cec:	00e7e7b3          	or	a5,a5,a4
    5cf0:	01fe1713          	sll	a4,t3,0x1f
    5cf4:	00e7e7b3          	or	a5,a5,a4
    5cf8:	01412483          	lw	s1,20(sp)
    5cfc:	01012903          	lw	s2,16(sp)
    5d00:	00c12983          	lw	s3,12(sp)
    5d04:	00080513          	mv	a0,a6
    5d08:	00078593          	mv	a1,a5
    5d0c:	02010113          	add	sp,sp,32
    5d10:	00008067          	ret
    5d14:	14078c63          	beqz	a5,5e6c <__adddf3+0x324>
    5d18:	412307b3          	sub	a5,t1,s2
    5d1c:	3c091263          	bnez	s2,60e0 <__adddf3+0x598>
    5d20:	00b76533          	or	a0,a4,a1
    5d24:	4c050463          	beqz	a0,61ec <__adddf3+0x6a4>
    5d28:	fff78513          	add	a0,a5,-1
    5d2c:	60050263          	beqz	a0,6330 <__adddf3+0x7e8>
    5d30:	7ff00813          	li	a6,2047
    5d34:	57078663          	beq	a5,a6,62a0 <__adddf3+0x758>
    5d38:	03800793          	li	a5,56
    5d3c:	00100613          	li	a2,1
    5d40:	02a7cc63          	blt	a5,a0,5d78 <__adddf3+0x230>
    5d44:	00050793          	mv	a5,a0
    5d48:	01f00613          	li	a2,31
    5d4c:	56f64c63          	blt	a2,a5,62c4 <__adddf3+0x77c>
    5d50:	02000513          	li	a0,32
    5d54:	40f50533          	sub	a0,a0,a5
    5d58:	00a71633          	sll	a2,a4,a0
    5d5c:	00f5d833          	srl	a6,a1,a5
    5d60:	00a59533          	sll	a0,a1,a0
    5d64:	01066633          	or	a2,a2,a6
    5d68:	00a03533          	snez	a0,a0
    5d6c:	00f75733          	srl	a4,a4,a5
    5d70:	00a66633          	or	a2,a2,a0
    5d74:	40e888b3          	sub	a7,a7,a4
    5d78:	40cf0633          	sub	a2,t5,a2
    5d7c:	00cf3733          	sltu	a4,t5,a2
    5d80:	00060493          	mv	s1,a2
    5d84:	40e889b3          	sub	s3,a7,a4
    5d88:	00030913          	mv	s2,t1
    5d8c:	00068413          	mv	s0,a3
    5d90:	e85ff06f          	j	5c14 <__adddf3+0xcc>
    5d94:	1ef05063          	blez	a5,5f74 <__adddf3+0x42c>
    5d98:	14031063          	bnez	t1,5ed8 <__adddf3+0x390>
    5d9c:	01e8e6b3          	or	a3,a7,t5
    5da0:	26068c63          	beqz	a3,6018 <__adddf3+0x4d0>
    5da4:	fff78693          	add	a3,a5,-1
    5da8:	48068063          	beqz	a3,6228 <__adddf3+0x6e0>
    5dac:	7ff00613          	li	a2,2047
    5db0:	22c78c63          	beq	a5,a2,5fe8 <__adddf3+0x4a0>
    5db4:	03800793          	li	a5,56
    5db8:	00100993          	li	s3,1
    5dbc:	02d7cc63          	blt	a5,a3,5df4 <__adddf3+0x2ac>
    5dc0:	00068793          	mv	a5,a3
    5dc4:	01f00693          	li	a3,31
    5dc8:	4af6c063          	blt	a3,a5,6268 <__adddf3+0x720>
    5dcc:	02000693          	li	a3,32
    5dd0:	40f686b3          	sub	a3,a3,a5
    5dd4:	00d899b3          	sll	s3,a7,a3
    5dd8:	00ff5633          	srl	a2,t5,a5
    5ddc:	00df16b3          	sll	a3,t5,a3
    5de0:	00c9e9b3          	or	s3,s3,a2
    5de4:	00d036b3          	snez	a3,a3
    5de8:	00f8d8b3          	srl	a7,a7,a5
    5dec:	00d9e9b3          	or	s3,s3,a3
    5df0:	01170733          	add	a4,a4,a7
    5df4:	00b985b3          	add	a1,s3,a1
    5df8:	0135b9b3          	sltu	s3,a1,s3
    5dfc:	00058493          	mv	s1,a1
    5e00:	00e989b3          	add	s3,s3,a4
    5e04:	00899793          	sll	a5,s3,0x8
    5e08:	1407d263          	bgez	a5,5f4c <__adddf3+0x404>
    5e0c:	00190913          	add	s2,s2,1
    5e10:	7ff00793          	li	a5,2047
    5e14:	36f90c63          	beq	s2,a5,618c <__adddf3+0x644>
    5e18:	ff8007b7          	lui	a5,0xff800
    5e1c:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f841b>
    5e20:	0014f613          	and	a2,s1,1
    5e24:	00f9f7b3          	and	a5,s3,a5
    5e28:	0014d713          	srl	a4,s1,0x1
    5e2c:	00c76733          	or	a4,a4,a2
    5e30:	01f79613          	sll	a2,a5,0x1f
    5e34:	00e664b3          	or	s1,a2,a4
    5e38:	0017d993          	srl	s3,a5,0x1
    5e3c:	e45ff06f          	j	5c80 <__adddf3+0x138>
    5e40:	01e8e6b3          	or	a3,a7,t5
    5e44:	1c068a63          	beqz	a3,6018 <__adddf3+0x4d0>
    5e48:	fff78693          	add	a3,a5,-1
    5e4c:	40068063          	beqz	a3,624c <__adddf3+0x704>
    5e50:	7ff00613          	li	a2,2047
    5e54:	18c78a63          	beq	a5,a2,5fe8 <__adddf3+0x4a0>
    5e58:	03800793          	li	a5,56
    5e5c:	00100613          	li	a2,1
    5e60:	dad7c2e3          	blt	a5,a3,5c04 <__adddf3+0xbc>
    5e64:	00068793          	mv	a5,a3
    5e68:	d6dff06f          	j	5bd4 <__adddf3+0x8c>
    5e6c:	00190813          	add	a6,s2,1
    5e70:	7fe87813          	and	a6,a6,2046
    5e74:	22081c63          	bnez	a6,60ac <__adddf3+0x564>
    5e78:	00b76333          	or	t1,a4,a1
    5e7c:	01e8e833          	or	a6,a7,t5
    5e80:	38091063          	bnez	s2,6200 <__adddf3+0x6b8>
    5e84:	46030e63          	beqz	t1,6300 <__adddf3+0x7b8>
    5e88:	40080663          	beqz	a6,6294 <__adddf3+0x74c>
    5e8c:	41e589b3          	sub	s3,a1,t5
    5e90:	0135b533          	sltu	a0,a1,s3
    5e94:	41170633          	sub	a2,a4,a7
    5e98:	40a60633          	sub	a2,a2,a0
    5e9c:	00861513          	sll	a0,a2,0x8
    5ea0:	50055e63          	bgez	a0,63bc <__adddf3+0x874>
    5ea4:	40bf05b3          	sub	a1,t5,a1
    5ea8:	40e88733          	sub	a4,a7,a4
    5eac:	00bf3f33          	sltu	t5,t5,a1
    5eb0:	41e70733          	sub	a4,a4,t5
    5eb4:	00871613          	sll	a2,a4,0x8
    5eb8:	00058493          	mv	s1,a1
    5ebc:	52065e63          	bgez	a2,63f8 <__adddf3+0x8b0>
    5ec0:	ff8007b7          	lui	a5,0xff800
    5ec4:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f841b>
    5ec8:	00f77733          	and	a4,a4,a5
    5ecc:	00068e13          	mv	t3,a3
    5ed0:	00100793          	li	a5,1
    5ed4:	df9ff06f          	j	5ccc <__adddf3+0x184>
    5ed8:	7ff00693          	li	a3,2047
    5edc:	10d90663          	beq	s2,a3,5fe8 <__adddf3+0x4a0>
    5ee0:	03800693          	li	a3,56
    5ee4:	00100993          	li	s3,1
    5ee8:	f0f6c6e3          	blt	a3,a5,5df4 <__adddf3+0x2ac>
    5eec:	008006b7          	lui	a3,0x800
    5ef0:	00d8e8b3          	or	a7,a7,a3
    5ef4:	ed1ff06f          	j	5dc4 <__adddf3+0x27c>
    5ef8:	00048513          	mv	a0,s1
    5efc:	275010ef          	jal	7970 <__clzsi2>
    5f00:	01850793          	add	a5,a0,24
    5f04:	01f00693          	li	a3,31
    5f08:	d2f6d8e3          	bge	a3,a5,5c38 <__adddf3+0xf0>
    5f0c:	ff850713          	add	a4,a0,-8
    5f10:	00e49733          	sll	a4,s1,a4
    5f14:	2327c663          	blt	a5,s2,6140 <__adddf3+0x5f8>
    5f18:	41278933          	sub	s2,a5,s2
    5f1c:	00190793          	add	a5,s2,1
    5f20:	48f6d663          	bge	a3,a5,63ac <__adddf3+0x864>
    5f24:	fe190913          	add	s2,s2,-31
    5f28:	02000693          	li	a3,32
    5f2c:	012754b3          	srl	s1,a4,s2
    5f30:	00d78c63          	beq	a5,a3,5f48 <__adddf3+0x400>
    5f34:	04000693          	li	a3,64
    5f38:	40f687b3          	sub	a5,a3,a5
    5f3c:	00f71733          	sll	a4,a4,a5
    5f40:	00e03733          	snez	a4,a4
    5f44:	00e4e4b3          	or	s1,s1,a4
    5f48:	00000913          	li	s2,0
    5f4c:	0074f793          	and	a5,s1,7
    5f50:	d2079ce3          	bnez	a5,5c88 <__adddf3+0x140>
    5f54:	00090793          	mv	a5,s2
    5f58:	0034d613          	srl	a2,s1,0x3
    5f5c:	00098713          	mv	a4,s3
    5f60:	0c00006f          	j	6020 <__adddf3+0x4d8>
    5f64:	7ff00793          	li	a5,2047
    5f68:	00000713          	li	a4,0
    5f6c:	00000813          	li	a6,0
    5f70:	d71ff06f          	j	5ce0 <__adddf3+0x198>
    5f74:	0c078a63          	beqz	a5,6048 <__adddf3+0x500>
    5f78:	412307b3          	sub	a5,t1,s2
    5f7c:	1e090263          	beqz	s2,6160 <__adddf3+0x618>
    5f80:	7ff00693          	li	a3,2047
    5f84:	32d30863          	beq	t1,a3,62b4 <__adddf3+0x76c>
    5f88:	03800693          	li	a3,56
    5f8c:	00100993          	li	s3,1
    5f90:	02f6ce63          	blt	a3,a5,5fcc <__adddf3+0x484>
    5f94:	008006b7          	lui	a3,0x800
    5f98:	00d76733          	or	a4,a4,a3
    5f9c:	01f00693          	li	a3,31
    5fa0:	3cf6c863          	blt	a3,a5,6370 <__adddf3+0x828>
    5fa4:	02000693          	li	a3,32
    5fa8:	40f686b3          	sub	a3,a3,a5
    5fac:	00d719b3          	sll	s3,a4,a3
    5fb0:	00f5d633          	srl	a2,a1,a5
    5fb4:	00d596b3          	sll	a3,a1,a3
    5fb8:	00c9e9b3          	or	s3,s3,a2
    5fbc:	00d036b3          	snez	a3,a3
    5fc0:	00f75733          	srl	a4,a4,a5
    5fc4:	00d9e9b3          	or	s3,s3,a3
    5fc8:	00e888b3          	add	a7,a7,a4
    5fcc:	01e98733          	add	a4,s3,t5
    5fd0:	013739b3          	sltu	s3,a4,s3
    5fd4:	00070493          	mv	s1,a4
    5fd8:	011989b3          	add	s3,s3,a7
    5fdc:	00030913          	mv	s2,t1
    5fe0:	e25ff06f          	j	5e04 <__adddf3+0x2bc>
    5fe4:	02081063          	bnez	a6,6004 <__adddf3+0x4bc>
    5fe8:	00351613          	sll	a2,a0,0x3
    5fec:	00365613          	srl	a2,a2,0x3
    5ff0:	01d71813          	sll	a6,a4,0x1d
    5ff4:	00c86833          	or	a6,a6,a2
    5ff8:	00375713          	srl	a4,a4,0x3
    5ffc:	01076733          	or	a4,a4,a6
    6000:	18070663          	beqz	a4,618c <__adddf3+0x644>
    6004:	00000e13          	li	t3,0
    6008:	7ff00793          	li	a5,2047
    600c:	00080737          	lui	a4,0x80
    6010:	00000813          	li	a6,0
    6014:	ccdff06f          	j	5ce0 <__adddf3+0x198>
    6018:	00351613          	sll	a2,a0,0x3
    601c:	00365613          	srl	a2,a2,0x3
    6020:	01d71813          	sll	a6,a4,0x1d
    6024:	7ff00693          	li	a3,2047
    6028:	00c86833          	or	a6,a6,a2
    602c:	00375713          	srl	a4,a4,0x3
    6030:	fcd786e3          	beq	a5,a3,5ffc <__adddf3+0x4b4>
    6034:	00c71713          	sll	a4,a4,0xc
    6038:	00c75713          	srl	a4,a4,0xc
    603c:	7ff7f793          	and	a5,a5,2047
    6040:	00040e13          	mv	t3,s0
    6044:	c9dff06f          	j	5ce0 <__adddf3+0x198>
    6048:	00190693          	add	a3,s2,1
    604c:	7fe6f813          	and	a6,a3,2046
    6050:	14081863          	bnez	a6,61a0 <__adddf3+0x658>
    6054:	00b766b3          	or	a3,a4,a1
    6058:	28091c63          	bnez	s2,62f0 <__adddf3+0x7a8>
    605c:	30068263          	beqz	a3,6360 <__adddf3+0x818>
    6060:	01e8e6b3          	or	a3,a7,t5
    6064:	22068863          	beqz	a3,6294 <__adddf3+0x74c>
    6068:	01e587b3          	add	a5,a1,t5
    606c:	00b7b5b3          	sltu	a1,a5,a1
    6070:	01170733          	add	a4,a4,a7
    6074:	00b70733          	add	a4,a4,a1
    6078:	0037d813          	srl	a6,a5,0x3
    607c:	00871793          	sll	a5,a4,0x8
    6080:	00040e13          	mv	t3,s0
    6084:	3407de63          	bgez	a5,63e0 <__adddf3+0x898>
    6088:	ff8007b7          	lui	a5,0xff800
    608c:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f841b>
    6090:	00f77733          	and	a4,a4,a5
    6094:	01d71793          	sll	a5,a4,0x1d
    6098:	00375713          	srl	a4,a4,0x3
    609c:	0107e833          	or	a6,a5,a6
    60a0:	01d77733          	and	a4,a4,t4
    60a4:	00100793          	li	a5,1
    60a8:	c39ff06f          	j	5ce0 <__adddf3+0x198>
    60ac:	41e58833          	sub	a6,a1,t5
    60b0:	0105b7b3          	sltu	a5,a1,a6
    60b4:	411709b3          	sub	s3,a4,a7
    60b8:	40f989b3          	sub	s3,s3,a5
    60bc:	00899793          	sll	a5,s3,0x8
    60c0:	00080493          	mv	s1,a6
    60c4:	1007c663          	bltz	a5,61d0 <__adddf3+0x688>
    60c8:	01386833          	or	a6,a6,s3
    60cc:	b4081ee3          	bnez	a6,5c28 <__adddf3+0xe0>
    60d0:	00000e13          	li	t3,0
    60d4:	00000793          	li	a5,0
    60d8:	00000713          	li	a4,0
    60dc:	c05ff06f          	j	5ce0 <__adddf3+0x198>
    60e0:	7ff00513          	li	a0,2047
    60e4:	1aa30e63          	beq	t1,a0,62a0 <__adddf3+0x758>
    60e8:	03800513          	li	a0,56
    60ec:	00100613          	li	a2,1
    60f0:	c8f544e3          	blt	a0,a5,5d78 <__adddf3+0x230>
    60f4:	00800637          	lui	a2,0x800
    60f8:	00c76733          	or	a4,a4,a2
    60fc:	c4dff06f          	j	5d48 <__adddf3+0x200>
    6100:	ff8009b7          	lui	s3,0xff800
    6104:	fff98993          	add	s3,s3,-1 # ff7fffff <__subdf3+0xff7f841b>
    6108:	40f90933          	sub	s2,s2,a5
    610c:	013779b3          	and	s3,a4,s3
    6110:	b71ff06f          	j	5c80 <__adddf3+0x138>
    6114:	fe078693          	add	a3,a5,-32
    6118:	02000613          	li	a2,32
    611c:	00d8d6b3          	srl	a3,a7,a3
    6120:	00c78a63          	beq	a5,a2,6134 <__adddf3+0x5ec>
    6124:	04000613          	li	a2,64
    6128:	40f607b3          	sub	a5,a2,a5
    612c:	00f897b3          	sll	a5,a7,a5
    6130:	00ff6f33          	or	t5,t5,a5
    6134:	01e03633          	snez	a2,t5
    6138:	00d66633          	or	a2,a2,a3
    613c:	ac9ff06f          	j	5c04 <__adddf3+0xbc>
    6140:	ff8006b7          	lui	a3,0xff800
    6144:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f841b>
    6148:	40f907b3          	sub	a5,s2,a5
    614c:	00d77733          	and	a4,a4,a3
    6150:	01d71813          	sll	a6,a4,0x1d
    6154:	01386833          	or	a6,a6,s3
    6158:	00375713          	srl	a4,a4,0x3
    615c:	ed9ff06f          	j	6034 <__adddf3+0x4ec>
    6160:	00b766b3          	or	a3,a4,a1
    6164:	1e068663          	beqz	a3,6350 <__adddf3+0x808>
    6168:	fff78693          	add	a3,a5,-1
    616c:	0a068e63          	beqz	a3,6228 <__adddf3+0x6e0>
    6170:	7ff00513          	li	a0,2047
    6174:	14a78063          	beq	a5,a0,62b4 <__adddf3+0x76c>
    6178:	03800793          	li	a5,56
    617c:	00100993          	li	s3,1
    6180:	e4d7c6e3          	blt	a5,a3,5fcc <__adddf3+0x484>
    6184:	00068793          	mv	a5,a3
    6188:	e15ff06f          	j	5f9c <__adddf3+0x454>
    618c:	00040e13          	mv	t3,s0
    6190:	7ff00793          	li	a5,2047
    6194:	00000713          	li	a4,0
    6198:	00000813          	li	a6,0
    619c:	b45ff06f          	j	5ce0 <__adddf3+0x198>
    61a0:	7ff00793          	li	a5,2047
    61a4:	fef684e3          	beq	a3,a5,618c <__adddf3+0x644>
    61a8:	01e58f33          	add	t5,a1,t5
    61ac:	00bf35b3          	sltu	a1,t5,a1
    61b0:	011707b3          	add	a5,a4,a7
    61b4:	00b787b3          	add	a5,a5,a1
    61b8:	01f79613          	sll	a2,a5,0x1f
    61bc:	001f5f13          	srl	t5,t5,0x1
    61c0:	01e664b3          	or	s1,a2,t5
    61c4:	0017d993          	srl	s3,a5,0x1
    61c8:	00068913          	mv	s2,a3
    61cc:	ab5ff06f          	j	5c80 <__adddf3+0x138>
    61d0:	40bf0633          	sub	a2,t5,a1
    61d4:	40e887b3          	sub	a5,a7,a4
    61d8:	00cf3733          	sltu	a4,t5,a2
    61dc:	00060493          	mv	s1,a2
    61e0:	40e789b3          	sub	s3,a5,a4
    61e4:	00068413          	mv	s0,a3
    61e8:	a41ff06f          	j	5c28 <__adddf3+0xe0>
    61ec:	00361613          	sll	a2,a2,0x3
    61f0:	00365613          	srl	a2,a2,0x3
    61f4:	00068413          	mv	s0,a3
    61f8:	00088713          	mv	a4,a7
    61fc:	e25ff06f          	j	6020 <__adddf3+0x4d8>
    6200:	de0312e3          	bnez	t1,5fe4 <__adddf3+0x49c>
    6204:	1c080663          	beqz	a6,63d0 <__adddf3+0x888>
    6208:	0038d713          	srl	a4,a7,0x3
    620c:	00361613          	sll	a2,a2,0x3
    6210:	01d89893          	sll	a7,a7,0x1d
    6214:	01176733          	or	a4,a4,a7
    6218:	00365613          	srl	a2,a2,0x3
    621c:	00c76733          	or	a4,a4,a2
    6220:	00068413          	mv	s0,a3
    6224:	dddff06f          	j	6000 <__adddf3+0x4b8>
    6228:	01e58f33          	add	t5,a1,t5
    622c:	011708b3          	add	a7,a4,a7
    6230:	00bf35b3          	sltu	a1,t5,a1
    6234:	00b889b3          	add	s3,a7,a1
    6238:	00899793          	sll	a5,s3,0x8
    623c:	000f0493          	mv	s1,t5
    6240:	0e07d463          	bgez	a5,6328 <__adddf3+0x7e0>
    6244:	00200913          	li	s2,2
    6248:	bd1ff06f          	j	5e18 <__adddf3+0x2d0>
    624c:	41e58f33          	sub	t5,a1,t5
    6250:	411708b3          	sub	a7,a4,a7
    6254:	01e5b5b3          	sltu	a1,a1,t5
    6258:	000f0493          	mv	s1,t5
    625c:	40b889b3          	sub	s3,a7,a1
    6260:	00100913          	li	s2,1
    6264:	9b1ff06f          	j	5c14 <__adddf3+0xcc>
    6268:	fe078693          	add	a3,a5,-32
    626c:	02000613          	li	a2,32
    6270:	00d8d6b3          	srl	a3,a7,a3
    6274:	00c78a63          	beq	a5,a2,6288 <__adddf3+0x740>
    6278:	04000613          	li	a2,64
    627c:	40f607b3          	sub	a5,a2,a5
    6280:	00f897b3          	sll	a5,a7,a5
    6284:	00ff6f33          	or	t5,t5,a5
    6288:	01e039b3          	snez	s3,t5
    628c:	00d9e9b3          	or	s3,s3,a3
    6290:	b65ff06f          	j	5df4 <__adddf3+0x2ac>
    6294:	00351613          	sll	a2,a0,0x3
    6298:	00365993          	srl	s3,a2,0x3
    629c:	eb5ff06f          	j	6150 <__adddf3+0x608>
    62a0:	00361613          	sll	a2,a2,0x3
    62a4:	00365613          	srl	a2,a2,0x3
    62a8:	00068413          	mv	s0,a3
    62ac:	00088713          	mv	a4,a7
    62b0:	d41ff06f          	j	5ff0 <__adddf3+0x4a8>
    62b4:	00361613          	sll	a2,a2,0x3
    62b8:	00365613          	srl	a2,a2,0x3
    62bc:	00088713          	mv	a4,a7
    62c0:	d31ff06f          	j	5ff0 <__adddf3+0x4a8>
    62c4:	fe078513          	add	a0,a5,-32
    62c8:	02000613          	li	a2,32
    62cc:	00a75533          	srl	a0,a4,a0
    62d0:	00c78a63          	beq	a5,a2,62e4 <__adddf3+0x79c>
    62d4:	04000613          	li	a2,64
    62d8:	40f607b3          	sub	a5,a2,a5
    62dc:	00f717b3          	sll	a5,a4,a5
    62e0:	00f5e5b3          	or	a1,a1,a5
    62e4:	00b03633          	snez	a2,a1
    62e8:	00a66633          	or	a2,a2,a0
    62ec:	a8dff06f          	j	5d78 <__adddf3+0x230>
    62f0:	fc0682e3          	beqz	a3,62b4 <__adddf3+0x76c>
    62f4:	01e8ef33          	or	t5,a7,t5
    62f8:	d00f16e3          	bnez	t5,6004 <__adddf3+0x4bc>
    62fc:	cedff06f          	j	5fe8 <__adddf3+0x4a0>
    6300:	dc0808e3          	beqz	a6,60d0 <__adddf3+0x588>
    6304:	00361813          	sll	a6,a2,0x3
    6308:	01d89793          	sll	a5,a7,0x1d
    630c:	00385813          	srl	a6,a6,0x3
    6310:	0038d713          	srl	a4,a7,0x3
    6314:	00f86833          	or	a6,a6,a5
    6318:	01d77733          	and	a4,a4,t4
    631c:	00068e13          	mv	t3,a3
    6320:	00000793          	li	a5,0
    6324:	9bdff06f          	j	5ce0 <__adddf3+0x198>
    6328:	00100793          	li	a5,1
    632c:	c2dff06f          	j	5f58 <__adddf3+0x410>
    6330:	40bf05b3          	sub	a1,t5,a1
    6334:	40e888b3          	sub	a7,a7,a4
    6338:	00bf3733          	sltu	a4,t5,a1
    633c:	00058493          	mv	s1,a1
    6340:	40e889b3          	sub	s3,a7,a4
    6344:	00068413          	mv	s0,a3
    6348:	00100913          	li	s2,1
    634c:	8c9ff06f          	j	5c14 <__adddf3+0xcc>
    6350:	00361613          	sll	a2,a2,0x3
    6354:	00365613          	srl	a2,a2,0x3
    6358:	00088713          	mv	a4,a7
    635c:	cc5ff06f          	j	6020 <__adddf3+0x4d8>
    6360:	00361613          	sll	a2,a2,0x3
    6364:	00365993          	srl	s3,a2,0x3
    6368:	00088713          	mv	a4,a7
    636c:	de5ff06f          	j	6150 <__adddf3+0x608>
    6370:	fe078693          	add	a3,a5,-32
    6374:	02000613          	li	a2,32
    6378:	00d756b3          	srl	a3,a4,a3
    637c:	00c78a63          	beq	a5,a2,6390 <__adddf3+0x848>
    6380:	04000613          	li	a2,64
    6384:	40f607b3          	sub	a5,a2,a5
    6388:	00f717b3          	sll	a5,a4,a5
    638c:	00f5e5b3          	or	a1,a1,a5
    6390:	00b039b3          	snez	s3,a1
    6394:	00d9e9b3          	or	s3,s3,a3
    6398:	c35ff06f          	j	5fcc <__adddf3+0x484>
    639c:	0034d613          	srl	a2,s1,0x3
    63a0:	00090793          	mv	a5,s2
    63a4:	00098713          	mv	a4,s3
    63a8:	c79ff06f          	j	6020 <__adddf3+0x4d8>
    63ac:	02000693          	li	a3,32
    63b0:	40f686b3          	sub	a3,a3,a5
    63b4:	00000613          	li	a2,0
    63b8:	8b5ff06f          	j	5c6c <__adddf3+0x124>
    63bc:	00c9e833          	or	a6,s3,a2
    63c0:	d00808e3          	beqz	a6,60d0 <__adddf3+0x588>
    63c4:	0039d993          	srl	s3,s3,0x3
    63c8:	00060713          	mv	a4,a2
    63cc:	d85ff06f          	j	6150 <__adddf3+0x608>
    63d0:	00000e13          	li	t3,0
    63d4:	7ff00793          	li	a5,2047
    63d8:	00080737          	lui	a4,0x80
    63dc:	905ff06f          	j	5ce0 <__adddf3+0x198>
    63e0:	01d71793          	sll	a5,a4,0x1d
    63e4:	00375713          	srl	a4,a4,0x3
    63e8:	0107e833          	or	a6,a5,a6
    63ec:	01d77733          	and	a4,a4,t4
    63f0:	00000793          	li	a5,0
    63f4:	8edff06f          	j	5ce0 <__adddf3+0x198>
    63f8:	01d71813          	sll	a6,a4,0x1d
    63fc:	0035d593          	srl	a1,a1,0x3
    6400:	00b86833          	or	a6,a6,a1
    6404:	00375713          	srl	a4,a4,0x3
    6408:	00068413          	mv	s0,a3
    640c:	c29ff06f          	j	6034 <__adddf3+0x4ec>

00006410 <__divdf3>:
    6410:	fb010113          	add	sp,sp,-80
    6414:	0145d793          	srl	a5,a1,0x14
    6418:	04812423          	sw	s0,72(sp)
    641c:	04912223          	sw	s1,68(sp)
    6420:	05212023          	sw	s2,64(sp)
    6424:	03412c23          	sw	s4,56(sp)
    6428:	03512a23          	sw	s5,52(sp)
    642c:	00c59493          	sll	s1,a1,0xc
    6430:	04112623          	sw	ra,76(sp)
    6434:	03312e23          	sw	s3,60(sp)
    6438:	03612823          	sw	s6,48(sp)
    643c:	03712623          	sw	s7,44(sp)
    6440:	03812423          	sw	s8,40(sp)
    6444:	7ff7f793          	and	a5,a5,2047
    6448:	00050413          	mv	s0,a0
    644c:	00060a13          	mv	s4,a2
    6450:	00068913          	mv	s2,a3
    6454:	00c4d493          	srl	s1,s1,0xc
    6458:	01f5da93          	srl	s5,a1,0x1f
    645c:	18078a63          	beqz	a5,65f0 <__divdf3+0x1e0>
    6460:	7ff00713          	li	a4,2047
    6464:	08e78863          	beq	a5,a4,64f4 <__divdf3+0xe4>
    6468:	01d55b13          	srl	s6,a0,0x1d
    646c:	00349493          	sll	s1,s1,0x3
    6470:	009b64b3          	or	s1,s6,s1
    6474:	00800737          	lui	a4,0x800
    6478:	00e4eb33          	or	s6,s1,a4
    647c:	00351b93          	sll	s7,a0,0x3
    6480:	c0178993          	add	s3,a5,-1023
    6484:	00000493          	li	s1,0
    6488:	00000c13          	li	s8,0
    648c:	01495793          	srl	a5,s2,0x14
    6490:	00c91413          	sll	s0,s2,0xc
    6494:	7ff7f793          	and	a5,a5,2047
    6498:	00c45413          	srl	s0,s0,0xc
    649c:	01f95913          	srl	s2,s2,0x1f
    64a0:	08078263          	beqz	a5,6524 <__divdf3+0x114>
    64a4:	7ff00713          	li	a4,2047
    64a8:	18e78a63          	beq	a5,a4,663c <__divdf3+0x22c>
    64ac:	00341413          	sll	s0,s0,0x3
    64b0:	01da5713          	srl	a4,s4,0x1d
    64b4:	00876733          	or	a4,a4,s0
    64b8:	c0178793          	add	a5,a5,-1023
    64bc:	00800437          	lui	s0,0x800
    64c0:	40f989b3          	sub	s3,s3,a5
    64c4:	00876433          	or	s0,a4,s0
    64c8:	003a1813          	sll	a6,s4,0x3
    64cc:	00000793          	li	a5,0
    64d0:	00f00713          	li	a4,15
    64d4:	012aca33          	xor	s4,s5,s2
    64d8:	24976463          	bltu	a4,s1,6720 <__divdf3+0x310>
    64dc:	79c00693          	li	a3,1948
    64e0:	00249493          	sll	s1,s1,0x2
    64e4:	00d484b3          	add	s1,s1,a3
    64e8:	0004a703          	lw	a4,0(s1)
    64ec:	00d70733          	add	a4,a4,a3
    64f0:	00070067          	jr	a4 # 800000 <__subdf3+0x7f841c>
    64f4:	00a4eb33          	or	s6,s1,a0
    64f8:	1c0b1e63          	bnez	s6,66d4 <__divdf3+0x2c4>
    64fc:	01495793          	srl	a5,s2,0x14
    6500:	00c91413          	sll	s0,s2,0xc
    6504:	7ff7f793          	and	a5,a5,2047
    6508:	00000b93          	li	s7,0
    650c:	00800493          	li	s1,8
    6510:	7ff00993          	li	s3,2047
    6514:	00200c13          	li	s8,2
    6518:	00c45413          	srl	s0,s0,0xc
    651c:	01f95913          	srl	s2,s2,0x1f
    6520:	f80792e3          	bnez	a5,64a4 <__divdf3+0x94>
    6524:	01446833          	or	a6,s0,s4
    6528:	1c080263          	beqz	a6,66ec <__divdf3+0x2dc>
    652c:	5c040663          	beqz	s0,6af8 <__divdf3+0x6e8>
    6530:	00040513          	mv	a0,s0
    6534:	43c010ef          	jal	7970 <__clzsi2>
    6538:	00050793          	mv	a5,a0
    653c:	ff550693          	add	a3,a0,-11
    6540:	01d00713          	li	a4,29
    6544:	ff878813          	add	a6,a5,-8
    6548:	40d70733          	sub	a4,a4,a3
    654c:	01041433          	sll	s0,s0,a6
    6550:	00ea5733          	srl	a4,s4,a4
    6554:	00876433          	or	s0,a4,s0
    6558:	010a1833          	sll	a6,s4,a6
    655c:	013787b3          	add	a5,a5,s3
    6560:	3f378993          	add	s3,a5,1011
    6564:	00000793          	li	a5,0
    6568:	f69ff06f          	j	64d0 <__divdf3+0xc0>
    656c:	40f70733          	sub	a4,a4,a5
    6570:	03800693          	li	a3,56
    6574:	60e6d063          	bge	a3,a4,6b74 <__divdf3+0x764>
    6578:	00000793          	li	a5,0
    657c:	00000693          	li	a3,0
    6580:	00000713          	li	a4,0
    6584:	04c12083          	lw	ra,76(sp)
    6588:	04812403          	lw	s0,72(sp)
    658c:	01479793          	sll	a5,a5,0x14
    6590:	00d7e7b3          	or	a5,a5,a3
    6594:	01fa1693          	sll	a3,s4,0x1f
    6598:	00d7e7b3          	or	a5,a5,a3
    659c:	04412483          	lw	s1,68(sp)
    65a0:	04012903          	lw	s2,64(sp)
    65a4:	03c12983          	lw	s3,60(sp)
    65a8:	03812a03          	lw	s4,56(sp)
    65ac:	03412a83          	lw	s5,52(sp)
    65b0:	03012b03          	lw	s6,48(sp)
    65b4:	02c12b83          	lw	s7,44(sp)
    65b8:	02812c03          	lw	s8,40(sp)
    65bc:	00070513          	mv	a0,a4
    65c0:	00078593          	mv	a1,a5
    65c4:	05010113          	add	sp,sp,80
    65c8:	00008067          	ret
    65cc:	7ff00793          	li	a5,2047
    65d0:	00000693          	li	a3,0
    65d4:	00000713          	li	a4,0
    65d8:	fadff06f          	j	6584 <__divdf3+0x174>
    65dc:	00000a13          	li	s4,0
    65e0:	7ff00793          	li	a5,2047
    65e4:	000806b7          	lui	a3,0x80
    65e8:	00000713          	li	a4,0
    65ec:	f99ff06f          	j	6584 <__divdf3+0x174>
    65f0:	00a4eb33          	or	s6,s1,a0
    65f4:	100b0c63          	beqz	s6,670c <__divdf3+0x2fc>
    65f8:	52048463          	beqz	s1,6b20 <__divdf3+0x710>
    65fc:	00048513          	mv	a0,s1
    6600:	370010ef          	jal	7970 <__clzsi2>
    6604:	00050713          	mv	a4,a0
    6608:	ff550793          	add	a5,a0,-11
    660c:	01d00b13          	li	s6,29
    6610:	ff870b93          	add	s7,a4,-8
    6614:	40fb0b33          	sub	s6,s6,a5
    6618:	017494b3          	sll	s1,s1,s7
    661c:	01645b33          	srl	s6,s0,s6
    6620:	009b6b33          	or	s6,s6,s1
    6624:	01741bb3          	sll	s7,s0,s7
    6628:	c0d00793          	li	a5,-1011
    662c:	40e789b3          	sub	s3,a5,a4
    6630:	00000493          	li	s1,0
    6634:	00000c13          	li	s8,0
    6638:	e55ff06f          	j	648c <__divdf3+0x7c>
    663c:	01446833          	or	a6,s0,s4
    6640:	80198993          	add	s3,s3,-2047
    6644:	0a081c63          	bnez	a6,66fc <__divdf3+0x2ec>
    6648:	0024e493          	or	s1,s1,2
    664c:	00000413          	li	s0,0
    6650:	00200793          	li	a5,2
    6654:	e7dff06f          	j	64d0 <__divdf3+0xc0>
    6658:	000a8913          	mv	s2,s5
    665c:	000b0413          	mv	s0,s6
    6660:	000b8813          	mv	a6,s7
    6664:	00200793          	li	a5,2
    6668:	60fc0863          	beq	s8,a5,6c78 <__divdf3+0x868>
    666c:	00300793          	li	a5,3
    6670:	f6fc06e3          	beq	s8,a5,65dc <__divdf3+0x1cc>
    6674:	00100793          	li	a5,1
    6678:	00090a13          	mv	s4,s2
    667c:	eefc0ee3          	beq	s8,a5,6578 <__divdf3+0x168>
    6680:	3ff98793          	add	a5,s3,1023
    6684:	3cf05263          	blez	a5,6a48 <__divdf3+0x638>
    6688:	00787713          	and	a4,a6,7
    668c:	5c071663          	bnez	a4,6c58 <__divdf3+0x848>
    6690:	00741713          	sll	a4,s0,0x7
    6694:	00075a63          	bgez	a4,66a8 <__divdf3+0x298>
    6698:	ff0007b7          	lui	a5,0xff000
    669c:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff841b>
    66a0:	00f47433          	and	s0,s0,a5
    66a4:	40098793          	add	a5,s3,1024
    66a8:	7fe00713          	li	a4,2046
    66ac:	f2f740e3          	blt	a4,a5,65cc <__divdf3+0x1bc>
    66b0:	00385813          	srl	a6,a6,0x3
    66b4:	01d41713          	sll	a4,s0,0x1d
    66b8:	00941693          	sll	a3,s0,0x9
    66bc:	01076733          	or	a4,a4,a6
    66c0:	00c6d693          	srl	a3,a3,0xc
    66c4:	7ff7f793          	and	a5,a5,2047
    66c8:	ebdff06f          	j	6584 <__divdf3+0x174>
    66cc:	00078c13          	mv	s8,a5
    66d0:	f95ff06f          	j	6664 <__divdf3+0x254>
    66d4:	00048b13          	mv	s6,s1
    66d8:	00050b93          	mv	s7,a0
    66dc:	00c00493          	li	s1,12
    66e0:	7ff00993          	li	s3,2047
    66e4:	00300c13          	li	s8,3
    66e8:	da5ff06f          	j	648c <__divdf3+0x7c>
    66ec:	0014e493          	or	s1,s1,1
    66f0:	00000413          	li	s0,0
    66f4:	00100793          	li	a5,1
    66f8:	dd9ff06f          	j	64d0 <__divdf3+0xc0>
    66fc:	0034e493          	or	s1,s1,3
    6700:	000a0813          	mv	a6,s4
    6704:	00300793          	li	a5,3
    6708:	dc9ff06f          	j	64d0 <__divdf3+0xc0>
    670c:	00000b93          	li	s7,0
    6710:	00400493          	li	s1,4
    6714:	00000993          	li	s3,0
    6718:	00100c13          	li	s8,1
    671c:	d71ff06f          	j	648c <__divdf3+0x7c>
    6720:	03912223          	sw	s9,36(sp)
    6724:	03a12023          	sw	s10,32(sp)
    6728:	01b12e23          	sw	s11,28(sp)
    672c:	3b646a63          	bltu	s0,s6,6ae0 <__divdf3+0x6d0>
    6730:	3a8b0663          	beq	s6,s0,6adc <__divdf3+0x6cc>
    6734:	fff98993          	add	s3,s3,-1
    6738:	000b8c13          	mv	s8,s7
    673c:	000b0493          	mv	s1,s6
    6740:	00000d13          	li	s10,0
    6744:	01885c93          	srl	s9,a6,0x18
    6748:	00841413          	sll	s0,s0,0x8
    674c:	01045913          	srl	s2,s0,0x10
    6750:	008cecb3          	or	s9,s9,s0
    6754:	00090593          	mv	a1,s2
    6758:	00048513          	mv	a0,s1
    675c:	010c9b13          	sll	s6,s9,0x10
    6760:	00881a93          	sll	s5,a6,0x8
    6764:	010b5b13          	srl	s6,s6,0x10
    6768:	15c010ef          	jal	78c4 <__hidden___udivsi3>
    676c:	00050593          	mv	a1,a0
    6770:	00050413          	mv	s0,a0
    6774:	000b0513          	mv	a0,s6
    6778:	120010ef          	jal	7898 <__mulsi3>
    677c:	00050793          	mv	a5,a0
    6780:	00090593          	mv	a1,s2
    6784:	00048513          	mv	a0,s1
    6788:	00078493          	mv	s1,a5
    678c:	180010ef          	jal	790c <__umodsi3>
    6790:	01051513          	sll	a0,a0,0x10
    6794:	010c5793          	srl	a5,s8,0x10
    6798:	00a7e7b3          	or	a5,a5,a0
    679c:	0097fa63          	bgeu	a5,s1,67b0 <__divdf3+0x3a0>
    67a0:	00fc87b3          	add	a5,s9,a5
    67a4:	fff40713          	add	a4,s0,-1 # 7fffff <__subdf3+0x7f841b>
    67a8:	3b97fe63          	bgeu	a5,s9,6b64 <__divdf3+0x754>
    67ac:	00070413          	mv	s0,a4
    67b0:	409784b3          	sub	s1,a5,s1
    67b4:	00090593          	mv	a1,s2
    67b8:	00048513          	mv	a0,s1
    67bc:	108010ef          	jal	78c4 <__hidden___udivsi3>
    67c0:	00050593          	mv	a1,a0
    67c4:	00050b93          	mv	s7,a0
    67c8:	000b0513          	mv	a0,s6
    67cc:	0cc010ef          	jal	7898 <__mulsi3>
    67d0:	00050793          	mv	a5,a0
    67d4:	00090593          	mv	a1,s2
    67d8:	00048513          	mv	a0,s1
    67dc:	00078493          	mv	s1,a5
    67e0:	12c010ef          	jal	790c <__umodsi3>
    67e4:	010c1793          	sll	a5,s8,0x10
    67e8:	01051513          	sll	a0,a0,0x10
    67ec:	0107d793          	srl	a5,a5,0x10
    67f0:	00a7e7b3          	or	a5,a5,a0
    67f4:	0097fa63          	bgeu	a5,s1,6808 <__divdf3+0x3f8>
    67f8:	00fc87b3          	add	a5,s9,a5
    67fc:	fffb8713          	add	a4,s7,-1
    6800:	3597fa63          	bgeu	a5,s9,6b54 <__divdf3+0x744>
    6804:	00070b93          	mv	s7,a4
    6808:	00010337          	lui	t1,0x10
    680c:	01041413          	sll	s0,s0,0x10
    6810:	01746433          	or	s0,s0,s7
    6814:	fff30d93          	add	s11,t1,-1 # ffff <__subdf3+0x841b>
    6818:	01b478b3          	and	a7,s0,s11
    681c:	01bafdb3          	and	s11,s5,s11
    6820:	40978bb3          	sub	s7,a5,s1
    6824:	010adc13          	srl	s8,s5,0x10
    6828:	01045793          	srl	a5,s0,0x10
    682c:	00088513          	mv	a0,a7
    6830:	000d8593          	mv	a1,s11
    6834:	064010ef          	jal	7898 <__mulsi3>
    6838:	00050813          	mv	a6,a0
    683c:	000c0593          	mv	a1,s8
    6840:	00088513          	mv	a0,a7
    6844:	054010ef          	jal	7898 <__mulsi3>
    6848:	00050893          	mv	a7,a0
    684c:	000d8593          	mv	a1,s11
    6850:	00078513          	mv	a0,a5
    6854:	044010ef          	jal	7898 <__mulsi3>
    6858:	00050e13          	mv	t3,a0
    685c:	000c0593          	mv	a1,s8
    6860:	00078513          	mv	a0,a5
    6864:	034010ef          	jal	7898 <__mulsi3>
    6868:	01085793          	srl	a5,a6,0x10
    686c:	01c888b3          	add	a7,a7,t3
    6870:	011787b3          	add	a5,a5,a7
    6874:	01c7f463          	bgeu	a5,t3,687c <__divdf3+0x46c>
    6878:	00650533          	add	a0,a0,t1
    687c:	00010637          	lui	a2,0x10
    6880:	fff60613          	add	a2,a2,-1 # ffff <__subdf3+0x841b>
    6884:	00c7f4b3          	and	s1,a5,a2
    6888:	0107d693          	srl	a3,a5,0x10
    688c:	01049493          	sll	s1,s1,0x10
    6890:	00c87833          	and	a6,a6,a2
    6894:	00a687b3          	add	a5,a3,a0
    6898:	010484b3          	add	s1,s1,a6
    689c:	20fbea63          	bltu	s7,a5,6ab0 <__divdf3+0x6a0>
    68a0:	20fb8663          	beq	s7,a5,6aac <__divdf3+0x69c>
    68a4:	409d04b3          	sub	s1,s10,s1
    68a8:	40fb8bb3          	sub	s7,s7,a5
    68ac:	009d3d33          	sltu	s10,s10,s1
    68b0:	41ab8bb3          	sub	s7,s7,s10
    68b4:	377c8a63          	beq	s9,s7,6c28 <__divdf3+0x818>
    68b8:	00090593          	mv	a1,s2
    68bc:	000b8513          	mv	a0,s7
    68c0:	004010ef          	jal	78c4 <__hidden___udivsi3>
    68c4:	00050593          	mv	a1,a0
    68c8:	00a12623          	sw	a0,12(sp)
    68cc:	00050d13          	mv	s10,a0
    68d0:	000b0513          	mv	a0,s6
    68d4:	7c5000ef          	jal	7898 <__mulsi3>
    68d8:	00050793          	mv	a5,a0
    68dc:	00090593          	mv	a1,s2
    68e0:	000b8513          	mv	a0,s7
    68e4:	00078b93          	mv	s7,a5
    68e8:	024010ef          	jal	790c <__umodsi3>
    68ec:	01051513          	sll	a0,a0,0x10
    68f0:	0104d793          	srl	a5,s1,0x10
    68f4:	00a7e7b3          	or	a5,a5,a0
    68f8:	0377f063          	bgeu	a5,s7,6918 <__divdf3+0x508>
    68fc:	00fc87b3          	add	a5,s9,a5
    6900:	fffd0693          	add	a3,s10,-1
    6904:	3797e263          	bltu	a5,s9,6c68 <__divdf3+0x858>
    6908:	3777f063          	bgeu	a5,s7,6c68 <__divdf3+0x858>
    690c:	ffed0713          	add	a4,s10,-2
    6910:	00e12623          	sw	a4,12(sp)
    6914:	019787b3          	add	a5,a5,s9
    6918:	41778bb3          	sub	s7,a5,s7
    691c:	00090593          	mv	a1,s2
    6920:	000b8513          	mv	a0,s7
    6924:	7a1000ef          	jal	78c4 <__hidden___udivsi3>
    6928:	00050593          	mv	a1,a0
    692c:	00050d13          	mv	s10,a0
    6930:	000b0513          	mv	a0,s6
    6934:	765000ef          	jal	7898 <__mulsi3>
    6938:	00050793          	mv	a5,a0
    693c:	00090593          	mv	a1,s2
    6940:	000b8513          	mv	a0,s7
    6944:	00078913          	mv	s2,a5
    6948:	01049493          	sll	s1,s1,0x10
    694c:	7c1000ef          	jal	790c <__umodsi3>
    6950:	01051513          	sll	a0,a0,0x10
    6954:	0104d493          	srl	s1,s1,0x10
    6958:	00a4e4b3          	or	s1,s1,a0
    695c:	0124fe63          	bgeu	s1,s2,6978 <__divdf3+0x568>
    6960:	009c84b3          	add	s1,s9,s1
    6964:	fffd0793          	add	a5,s10,-1
    6968:	3194e463          	bltu	s1,s9,6c70 <__divdf3+0x860>
    696c:	3124f263          	bgeu	s1,s2,6c70 <__divdf3+0x860>
    6970:	ffed0d13          	add	s10,s10,-2
    6974:	019484b3          	add	s1,s1,s9
    6978:	00c12783          	lw	a5,12(sp)
    697c:	412484b3          	sub	s1,s1,s2
    6980:	000d8593          	mv	a1,s11
    6984:	01079813          	sll	a6,a5,0x10
    6988:	01a86833          	or	a6,a6,s10
    698c:	01081313          	sll	t1,a6,0x10
    6990:	01035313          	srl	t1,t1,0x10
    6994:	01085793          	srl	a5,a6,0x10
    6998:	00030513          	mv	a0,t1
    699c:	6fd000ef          	jal	7898 <__mulsi3>
    69a0:	00050893          	mv	a7,a0
    69a4:	000c0593          	mv	a1,s8
    69a8:	00030513          	mv	a0,t1
    69ac:	6ed000ef          	jal	7898 <__mulsi3>
    69b0:	00050313          	mv	t1,a0
    69b4:	000d8593          	mv	a1,s11
    69b8:	00078513          	mv	a0,a5
    69bc:	6dd000ef          	jal	7898 <__mulsi3>
    69c0:	00050e13          	mv	t3,a0
    69c4:	000c0593          	mv	a1,s8
    69c8:	00078513          	mv	a0,a5
    69cc:	6cd000ef          	jal	7898 <__mulsi3>
    69d0:	0108d793          	srl	a5,a7,0x10
    69d4:	01c30333          	add	t1,t1,t3
    69d8:	006787b3          	add	a5,a5,t1
    69dc:	01c7f663          	bgeu	a5,t3,69e8 <__divdf3+0x5d8>
    69e0:	00010737          	lui	a4,0x10
    69e4:	00e50533          	add	a0,a0,a4
    69e8:	000106b7          	lui	a3,0x10
    69ec:	fff68693          	add	a3,a3,-1 # ffff <__subdf3+0x841b>
    69f0:	0107d713          	srl	a4,a5,0x10
    69f4:	00d7f7b3          	and	a5,a5,a3
    69f8:	01079793          	sll	a5,a5,0x10
    69fc:	00d8f8b3          	and	a7,a7,a3
    6a00:	00a70733          	add	a4,a4,a0
    6a04:	011787b3          	add	a5,a5,a7
    6a08:	02e4e063          	bltu	s1,a4,6a28 <__divdf3+0x618>
    6a0c:	00e48c63          	beq	s1,a4,6a24 <__divdf3+0x614>
    6a10:	02412c83          	lw	s9,36(sp)
    6a14:	02012d03          	lw	s10,32(sp)
    6a18:	01c12d83          	lw	s11,28(sp)
    6a1c:	00186813          	or	a6,a6,1
    6a20:	c61ff06f          	j	6680 <__divdf3+0x270>
    6a24:	1c078a63          	beqz	a5,6bf8 <__divdf3+0x7e8>
    6a28:	009c84b3          	add	s1,s9,s1
    6a2c:	fff80613          	add	a2,a6,-1
    6a30:	00048693          	mv	a3,s1
    6a34:	1b94ec63          	bltu	s1,s9,6bec <__divdf3+0x7dc>
    6a38:	24e4ea63          	bltu	s1,a4,6c8c <__divdf3+0x87c>
    6a3c:	26e48863          	beq	s1,a4,6cac <__divdf3+0x89c>
    6a40:	00060813          	mv	a6,a2
    6a44:	fcdff06f          	j	6a10 <__divdf3+0x600>
    6a48:	00100713          	li	a4,1
    6a4c:	b20790e3          	bnez	a5,656c <__divdf3+0x15c>
    6a50:	41e98793          	add	a5,s3,1054
    6a54:	00f816b3          	sll	a3,a6,a5
    6a58:	00d036b3          	snez	a3,a3
    6a5c:	00f417b3          	sll	a5,s0,a5
    6a60:	00f6e7b3          	or	a5,a3,a5
    6a64:	00e85833          	srl	a6,a6,a4
    6a68:	00f86833          	or	a6,a6,a5
    6a6c:	00787793          	and	a5,a6,7
    6a70:	00e45433          	srl	s0,s0,a4
    6a74:	02078063          	beqz	a5,6a94 <__divdf3+0x684>
    6a78:	00f87793          	and	a5,a6,15
    6a7c:	00400713          	li	a4,4
    6a80:	00e78a63          	beq	a5,a4,6a94 <__divdf3+0x684>
    6a84:	00480793          	add	a5,a6,4
    6a88:	0107b833          	sltu	a6,a5,a6
    6a8c:	01040433          	add	s0,s0,a6
    6a90:	00078813          	mv	a6,a5
    6a94:	00841613          	sll	a2,s0,0x8
    6a98:	00100793          	li	a5,1
    6a9c:	00000693          	li	a3,0
    6aa0:	00000713          	li	a4,0
    6aa4:	ae0640e3          	bltz	a2,6584 <__divdf3+0x174>
    6aa8:	1280006f          	j	6bd0 <__divdf3+0x7c0>
    6aac:	de9d7ce3          	bgeu	s10,s1,68a4 <__divdf3+0x494>
    6ab0:	015d06b3          	add	a3,s10,s5
    6ab4:	01a6b633          	sltu	a2,a3,s10
    6ab8:	019605b3          	add	a1,a2,s9
    6abc:	00bb8bb3          	add	s7,s7,a1
    6ac0:	00068d13          	mv	s10,a3
    6ac4:	fff40593          	add	a1,s0,-1
    6ac8:	077cfe63          	bgeu	s9,s7,6b44 <__divdf3+0x734>
    6acc:	14fbe063          	bltu	s7,a5,6c0c <__divdf3+0x7fc>
    6ad0:	13778c63          	beq	a5,s7,6c08 <__divdf3+0x7f8>
    6ad4:	00058413          	mv	s0,a1
    6ad8:	dcdff06f          	j	68a4 <__divdf3+0x494>
    6adc:	c50bece3          	bltu	s7,a6,6734 <__divdf3+0x324>
    6ae0:	01fb1c13          	sll	s8,s6,0x1f
    6ae4:	001bd713          	srl	a4,s7,0x1
    6ae8:	001b5493          	srl	s1,s6,0x1
    6aec:	00ec6c33          	or	s8,s8,a4
    6af0:	01fb9d13          	sll	s10,s7,0x1f
    6af4:	c51ff06f          	j	6744 <__divdf3+0x334>
    6af8:	000a0513          	mv	a0,s4
    6afc:	675000ef          	jal	7970 <__clzsi2>
    6b00:	01550693          	add	a3,a0,21
    6b04:	01c00713          	li	a4,28
    6b08:	02050793          	add	a5,a0,32
    6b0c:	a2d75ae3          	bge	a4,a3,6540 <__divdf3+0x130>
    6b10:	ff850513          	add	a0,a0,-8
    6b14:	00000813          	li	a6,0
    6b18:	00aa1433          	sll	s0,s4,a0
    6b1c:	a41ff06f          	j	655c <__divdf3+0x14c>
    6b20:	651000ef          	jal	7970 <__clzsi2>
    6b24:	01550793          	add	a5,a0,21
    6b28:	01c00693          	li	a3,28
    6b2c:	02050713          	add	a4,a0,32
    6b30:	acf6dee3          	bge	a3,a5,660c <__divdf3+0x1fc>
    6b34:	ff850493          	add	s1,a0,-8
    6b38:	00941b33          	sll	s6,s0,s1
    6b3c:	00000b93          	li	s7,0
    6b40:	ae9ff06f          	j	6628 <__divdf3+0x218>
    6b44:	f97c98e3          	bne	s9,s7,6ad4 <__divdf3+0x6c4>
    6b48:	f80602e3          	beqz	a2,6acc <__divdf3+0x6bc>
    6b4c:	00058413          	mv	s0,a1
    6b50:	d55ff06f          	j	68a4 <__divdf3+0x494>
    6b54:	ca97f8e3          	bgeu	a5,s1,6804 <__divdf3+0x3f4>
    6b58:	ffeb8b93          	add	s7,s7,-2
    6b5c:	019787b3          	add	a5,a5,s9
    6b60:	ca9ff06f          	j	6808 <__divdf3+0x3f8>
    6b64:	c497f4e3          	bgeu	a5,s1,67ac <__divdf3+0x39c>
    6b68:	ffe40413          	add	s0,s0,-2
    6b6c:	019787b3          	add	a5,a5,s9
    6b70:	c41ff06f          	j	67b0 <__divdf3+0x3a0>
    6b74:	01f00693          	li	a3,31
    6b78:	ece6dce3          	bge	a3,a4,6a50 <__divdf3+0x640>
    6b7c:	fe100693          	li	a3,-31
    6b80:	40f686b3          	sub	a3,a3,a5
    6b84:	02000793          	li	a5,32
    6b88:	00d456b3          	srl	a3,s0,a3
    6b8c:	00f70863          	beq	a4,a5,6b9c <__divdf3+0x78c>
    6b90:	43e98793          	add	a5,s3,1086
    6b94:	00f417b3          	sll	a5,s0,a5
    6b98:	00f86833          	or	a6,a6,a5
    6b9c:	01003833          	snez	a6,a6
    6ba0:	00d86833          	or	a6,a6,a3
    6ba4:	00787713          	and	a4,a6,7
    6ba8:	00000693          	li	a3,0
    6bac:	02070863          	beqz	a4,6bdc <__divdf3+0x7cc>
    6bb0:	00f87793          	and	a5,a6,15
    6bb4:	00400713          	li	a4,4
    6bb8:	00000413          	li	s0,0
    6bbc:	00e78a63          	beq	a5,a4,6bd0 <__divdf3+0x7c0>
    6bc0:	00480793          	add	a5,a6,4
    6bc4:	0107b833          	sltu	a6,a5,a6
    6bc8:	01003433          	snez	s0,a6
    6bcc:	00078813          	mv	a6,a5
    6bd0:	00941693          	sll	a3,s0,0x9
    6bd4:	01d41713          	sll	a4,s0,0x1d
    6bd8:	00c6d693          	srl	a3,a3,0xc
    6bdc:	00385813          	srl	a6,a6,0x3
    6be0:	00e86733          	or	a4,a6,a4
    6be4:	00000793          	li	a5,0
    6be8:	99dff06f          	j	6584 <__divdf3+0x174>
    6bec:	00060813          	mv	a6,a2
    6bf0:	e2e690e3          	bne	a3,a4,6a10 <__divdf3+0x600>
    6bf4:	e1579ee3          	bne	a5,s5,6a10 <__divdf3+0x600>
    6bf8:	02412c83          	lw	s9,36(sp)
    6bfc:	02012d03          	lw	s10,32(sp)
    6c00:	01c12d83          	lw	s11,28(sp)
    6c04:	a7dff06f          	j	6680 <__divdf3+0x270>
    6c08:	ec96f6e3          	bgeu	a3,s1,6ad4 <__divdf3+0x6c4>
    6c0c:	00da86b3          	add	a3,s5,a3
    6c10:	0156b633          	sltu	a2,a3,s5
    6c14:	01960633          	add	a2,a2,s9
    6c18:	ffe40413          	add	s0,s0,-2
    6c1c:	00068d13          	mv	s10,a3
    6c20:	00cb8bb3          	add	s7,s7,a2
    6c24:	c81ff06f          	j	68a4 <__divdf3+0x494>
    6c28:	c0200713          	li	a4,-1022
    6c2c:	02412c83          	lw	s9,36(sp)
    6c30:	02012d03          	lw	s10,32(sp)
    6c34:	01c12d83          	lw	s11,28(sp)
    6c38:	3ff98793          	add	a5,s3,1023
    6c3c:	fff00813          	li	a6,-1
    6c40:	e0e9c4e3          	blt	s3,a4,6a48 <__divdf3+0x638>
    6c44:	00480713          	add	a4,a6,4
    6c48:	01073833          	sltu	a6,a4,a6
    6c4c:	01040433          	add	s0,s0,a6
    6c50:	00070813          	mv	a6,a4
    6c54:	a3dff06f          	j	6690 <__divdf3+0x280>
    6c58:	00f87713          	and	a4,a6,15
    6c5c:	00400693          	li	a3,4
    6c60:	a2d708e3          	beq	a4,a3,6690 <__divdf3+0x280>
    6c64:	fe1ff06f          	j	6c44 <__divdf3+0x834>
    6c68:	00d12623          	sw	a3,12(sp)
    6c6c:	cadff06f          	j	6918 <__divdf3+0x508>
    6c70:	00078d13          	mv	s10,a5
    6c74:	d05ff06f          	j	6978 <__divdf3+0x568>
    6c78:	00090a13          	mv	s4,s2
    6c7c:	7ff00793          	li	a5,2047
    6c80:	00000693          	li	a3,0
    6c84:	00000713          	li	a4,0
    6c88:	8fdff06f          	j	6584 <__divdf3+0x174>
    6c8c:	001a9613          	sll	a2,s5,0x1
    6c90:	015636b3          	sltu	a3,a2,s5
    6c94:	019686b3          	add	a3,a3,s9
    6c98:	00d486b3          	add	a3,s1,a3
    6c9c:	ffe80813          	add	a6,a6,-2
    6ca0:	00060a93          	mv	s5,a2
    6ca4:	f4e688e3          	beq	a3,a4,6bf4 <__divdf3+0x7e4>
    6ca8:	d69ff06f          	j	6a10 <__divdf3+0x600>
    6cac:	fefae0e3          	bltu	s5,a5,6c8c <__divdf3+0x87c>
    6cb0:	00060813          	mv	a6,a2
    6cb4:	f41ff06f          	j	6bf4 <__divdf3+0x7e4>

00006cb8 <__eqdf2>:
    6cb8:	0145d713          	srl	a4,a1,0x14
    6cbc:	001007b7          	lui	a5,0x100
    6cc0:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf841b>
    6cc4:	0146d813          	srl	a6,a3,0x14
    6cc8:	7ff77713          	and	a4,a4,2047
    6ccc:	7ff00313          	li	t1,2047
    6cd0:	00b7fe33          	and	t3,a5,a1
    6cd4:	00050893          	mv	a7,a0
    6cd8:	00d7f7b3          	and	a5,a5,a3
    6cdc:	01f5d593          	srl	a1,a1,0x1f
    6ce0:	7ff87813          	and	a6,a6,2047
    6ce4:	01f6d693          	srl	a3,a3,0x1f
    6ce8:	00100513          	li	a0,1
    6cec:	00670c63          	beq	a4,t1,6d04 <__eqdf2+0x4c>
    6cf0:	00680863          	beq	a6,t1,6d00 <__eqdf2+0x48>
    6cf4:	01071463          	bne	a4,a6,6cfc <__eqdf2+0x44>
    6cf8:	02fe0663          	beq	t3,a5,6d24 <__eqdf2+0x6c>
    6cfc:	00008067          	ret
    6d00:	00008067          	ret
    6d04:	fee81ce3          	bne	a6,a4,6cfc <__eqdf2+0x44>
    6d08:	00fe67b3          	or	a5,t3,a5
    6d0c:	00c7e7b3          	or	a5,a5,a2
    6d10:	0117e7b3          	or	a5,a5,a7
    6d14:	fe0794e3          	bnez	a5,6cfc <__eqdf2+0x44>
    6d18:	40d585b3          	sub	a1,a1,a3
    6d1c:	00b03533          	snez	a0,a1
    6d20:	00008067          	ret
    6d24:	fcc89ce3          	bne	a7,a2,6cfc <__eqdf2+0x44>
    6d28:	00d58a63          	beq	a1,a3,6d3c <__eqdf2+0x84>
    6d2c:	fc0718e3          	bnez	a4,6cfc <__eqdf2+0x44>
    6d30:	011e6e33          	or	t3,t3,a7
    6d34:	01c03533          	snez	a0,t3
    6d38:	00008067          	ret
    6d3c:	00000513          	li	a0,0
    6d40:	00008067          	ret

00006d44 <__gedf2>:
    6d44:	0145d893          	srl	a7,a1,0x14
    6d48:	001007b7          	lui	a5,0x100
    6d4c:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf841b>
    6d50:	0146d713          	srl	a4,a3,0x14
    6d54:	7ff8f893          	and	a7,a7,2047
    6d58:	7ff00e13          	li	t3,2047
    6d5c:	00b7f333          	and	t1,a5,a1
    6d60:	00050813          	mv	a6,a0
    6d64:	00050e93          	mv	t4,a0
    6d68:	00d7f7b3          	and	a5,a5,a3
    6d6c:	01f5d593          	srl	a1,a1,0x1f
    6d70:	00060f13          	mv	t5,a2
    6d74:	7ff77513          	and	a0,a4,2047
    6d78:	01f6d693          	srl	a3,a3,0x1f
    6d7c:	05c88863          	beq	a7,t3,6dcc <__gedf2+0x88>
    6d80:	03c50463          	beq	a0,t3,6da8 <__gedf2+0x64>
    6d84:	06089a63          	bnez	a7,6df8 <__gedf2+0xb4>
    6d88:	01036833          	or	a6,t1,a6
    6d8c:	06051063          	bnez	a0,6dec <__gedf2+0xa8>
    6d90:	00c7e633          	or	a2,a5,a2
    6d94:	08060c63          	beqz	a2,6e2c <__gedf2+0xe8>
    6d98:	0a081263          	bnez	a6,6e3c <__gedf2+0xf8>
    6d9c:	00100513          	li	a0,1
    6da0:	08068263          	beqz	a3,6e24 <__gedf2+0xe0>
    6da4:	00008067          	ret
    6da8:	00c7e633          	or	a2,a5,a2
    6dac:	08061463          	bnez	a2,6e34 <__gedf2+0xf0>
    6db0:	00089663          	bnez	a7,6dbc <__gedf2+0x78>
    6db4:	01036333          	or	t1,t1,a6
    6db8:	fe0302e3          	beqz	t1,6d9c <__gedf2+0x58>
    6dbc:	06d58063          	beq	a1,a3,6e1c <__gedf2+0xd8>
    6dc0:	06059263          	bnez	a1,6e24 <__gedf2+0xe0>
    6dc4:	00100513          	li	a0,1
    6dc8:	00008067          	ret
    6dcc:	01036333          	or	t1,t1,a6
    6dd0:	06031263          	bnez	t1,6e34 <__gedf2+0xf0>
    6dd4:	ff1516e3          	bne	a0,a7,6dc0 <__gedf2+0x7c>
    6dd8:	00c7e7b3          	or	a5,a5,a2
    6ddc:	04079c63          	bnez	a5,6e34 <__gedf2+0xf0>
    6de0:	fed590e3          	bne	a1,a3,6dc0 <__gedf2+0x7c>
    6de4:	00000513          	li	a0,0
    6de8:	00008067          	ret
    6dec:	fa0808e3          	beqz	a6,6d9c <__gedf2+0x58>
    6df0:	fcd598e3          	bne	a1,a3,6dc0 <__gedf2+0x7c>
    6df4:	0280006f          	j	6e1c <__gedf2+0xd8>
    6df8:	fc0504e3          	beqz	a0,6dc0 <__gedf2+0x7c>
    6dfc:	fcd592e3          	bne	a1,a3,6dc0 <__gedf2+0x7c>
    6e00:	fd1540e3          	blt	a0,a7,6dc0 <__gedf2+0x7c>
    6e04:	00a8cc63          	blt	a7,a0,6e1c <__gedf2+0xd8>
    6e08:	fa67ece3          	bltu	a5,t1,6dc0 <__gedf2+0x7c>
    6e0c:	00f31863          	bne	t1,a5,6e1c <__gedf2+0xd8>
    6e10:	fbdf68e3          	bltu	t5,t4,6dc0 <__gedf2+0x7c>
    6e14:	00000513          	li	a0,0
    6e18:	f9eef6e3          	bgeu	t4,t5,6da4 <__gedf2+0x60>
    6e1c:	00100513          	li	a0,1
    6e20:	f80592e3          	bnez	a1,6da4 <__gedf2+0x60>
    6e24:	fff00513          	li	a0,-1
    6e28:	00008067          	ret
    6e2c:	f8081ae3          	bnez	a6,6dc0 <__gedf2+0x7c>
    6e30:	00008067          	ret
    6e34:	ffe00513          	li	a0,-2
    6e38:	00008067          	ret
    6e3c:	fcd586e3          	beq	a1,a3,6e08 <__gedf2+0xc4>
    6e40:	f81ff06f          	j	6dc0 <__gedf2+0x7c>

00006e44 <__ledf2>:
    6e44:	0145d893          	srl	a7,a1,0x14
    6e48:	001007b7          	lui	a5,0x100
    6e4c:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf841b>
    6e50:	0146d713          	srl	a4,a3,0x14
    6e54:	7ff8f893          	and	a7,a7,2047
    6e58:	7ff00313          	li	t1,2047
    6e5c:	00b7fe33          	and	t3,a5,a1
    6e60:	00050813          	mv	a6,a0
    6e64:	00050e93          	mv	t4,a0
    6e68:	00d7f7b3          	and	a5,a5,a3
    6e6c:	01f5d593          	srl	a1,a1,0x1f
    6e70:	00060f13          	mv	t5,a2
    6e74:	7ff77513          	and	a0,a4,2047
    6e78:	01f6d693          	srl	a3,a3,0x1f
    6e7c:	04688a63          	beq	a7,t1,6ed0 <__ledf2+0x8c>
    6e80:	02650463          	beq	a0,t1,6ea8 <__ledf2+0x64>
    6e84:	06089863          	bnez	a7,6ef4 <__ledf2+0xb0>
    6e88:	010e6833          	or	a6,t3,a6
    6e8c:	08051e63          	bnez	a0,6f28 <__ledf2+0xe4>
    6e90:	00c7e633          	or	a2,a5,a2
    6e94:	0a060463          	beqz	a2,6f3c <__ledf2+0xf8>
    6e98:	0a081663          	bnez	a6,6f44 <__ledf2+0x100>
    6e9c:	00100513          	li	a0,1
    6ea0:	08068063          	beqz	a3,6f20 <__ledf2+0xdc>
    6ea4:	00008067          	ret
    6ea8:	00c7e633          	or	a2,a5,a2
    6eac:	00200513          	li	a0,2
    6eb0:	fe061ae3          	bnez	a2,6ea4 <__ledf2+0x60>
    6eb4:	00089663          	bnez	a7,6ec0 <__ledf2+0x7c>
    6eb8:	010e6e33          	or	t3,t3,a6
    6ebc:	fe0e00e3          	beqz	t3,6e9c <__ledf2+0x58>
    6ec0:	04d58c63          	beq	a1,a3,6f18 <__ledf2+0xd4>
    6ec4:	04059e63          	bnez	a1,6f20 <__ledf2+0xdc>
    6ec8:	00100513          	li	a0,1
    6ecc:	00008067          	ret
    6ed0:	010e6e33          	or	t3,t3,a6
    6ed4:	060e1063          	bnez	t3,6f34 <__ledf2+0xf0>
    6ed8:	ff1516e3          	bne	a0,a7,6ec4 <__ledf2+0x80>
    6edc:	00c7e7b3          	or	a5,a5,a2
    6ee0:	00200513          	li	a0,2
    6ee4:	fc0790e3          	bnez	a5,6ea4 <__ledf2+0x60>
    6ee8:	fcd59ee3          	bne	a1,a3,6ec4 <__ledf2+0x80>
    6eec:	00000513          	li	a0,0
    6ef0:	00008067          	ret
    6ef4:	fc0508e3          	beqz	a0,6ec4 <__ledf2+0x80>
    6ef8:	fcd596e3          	bne	a1,a3,6ec4 <__ledf2+0x80>
    6efc:	fd1544e3          	blt	a0,a7,6ec4 <__ledf2+0x80>
    6f00:	00a8cc63          	blt	a7,a0,6f18 <__ledf2+0xd4>
    6f04:	fdc7e0e3          	bltu	a5,t3,6ec4 <__ledf2+0x80>
    6f08:	00fe1863          	bne	t3,a5,6f18 <__ledf2+0xd4>
    6f0c:	fbdf6ce3          	bltu	t5,t4,6ec4 <__ledf2+0x80>
    6f10:	00000513          	li	a0,0
    6f14:	f9eef8e3          	bgeu	t4,t5,6ea4 <__ledf2+0x60>
    6f18:	00100513          	li	a0,1
    6f1c:	f80594e3          	bnez	a1,6ea4 <__ledf2+0x60>
    6f20:	fff00513          	li	a0,-1
    6f24:	00008067          	ret
    6f28:	f6080ae3          	beqz	a6,6e9c <__ledf2+0x58>
    6f2c:	f8d59ce3          	bne	a1,a3,6ec4 <__ledf2+0x80>
    6f30:	fe9ff06f          	j	6f18 <__ledf2+0xd4>
    6f34:	00200513          	li	a0,2
    6f38:	00008067          	ret
    6f3c:	f80814e3          	bnez	a6,6ec4 <__ledf2+0x80>
    6f40:	00008067          	ret
    6f44:	fcd580e3          	beq	a1,a3,6f04 <__ledf2+0xc0>
    6f48:	f7dff06f          	j	6ec4 <__ledf2+0x80>

00006f4c <__muldf3>:
    6f4c:	fd010113          	add	sp,sp,-48
    6f50:	0145d793          	srl	a5,a1,0x14
    6f54:	02812423          	sw	s0,40(sp)
    6f58:	02912223          	sw	s1,36(sp)
    6f5c:	03212023          	sw	s2,32(sp)
    6f60:	01312e23          	sw	s3,28(sp)
    6f64:	01512a23          	sw	s5,20(sp)
    6f68:	00c59493          	sll	s1,a1,0xc
    6f6c:	02112623          	sw	ra,44(sp)
    6f70:	01412c23          	sw	s4,24(sp)
    6f74:	01612823          	sw	s6,16(sp)
    6f78:	01712623          	sw	s7,12(sp)
    6f7c:	01812423          	sw	s8,8(sp)
    6f80:	7ff7f793          	and	a5,a5,2047
    6f84:	00050413          	mv	s0,a0
    6f88:	00060a93          	mv	s5,a2
    6f8c:	00068993          	mv	s3,a3
    6f90:	00c4d493          	srl	s1,s1,0xc
    6f94:	01f5d913          	srl	s2,a1,0x1f
    6f98:	4e078063          	beqz	a5,7478 <__muldf3+0x52c>
    6f9c:	7ff00713          	li	a4,2047
    6fa0:	0ae78663          	beq	a5,a4,704c <__muldf3+0x100>
    6fa4:	00349693          	sll	a3,s1,0x3
    6fa8:	01d55713          	srl	a4,a0,0x1d
    6fac:	00d76733          	or	a4,a4,a3
    6fb0:	008006b7          	lui	a3,0x800
    6fb4:	00d764b3          	or	s1,a4,a3
    6fb8:	00351a13          	sll	s4,a0,0x3
    6fbc:	c0178c13          	add	s8,a5,-1023
    6fc0:	00000b13          	li	s6,0
    6fc4:	00000b93          	li	s7,0
    6fc8:	0149d793          	srl	a5,s3,0x14
    6fcc:	00c99713          	sll	a4,s3,0xc
    6fd0:	7ff7f793          	and	a5,a5,2047
    6fd4:	000a8e13          	mv	t3,s5
    6fd8:	00c75413          	srl	s0,a4,0xc
    6fdc:	01f9d993          	srl	s3,s3,0x1f
    6fe0:	0a078063          	beqz	a5,7080 <__muldf3+0x134>
    6fe4:	7ff00713          	li	a4,2047
    6fe8:	14e78e63          	beq	a5,a4,7144 <__muldf3+0x1f8>
    6fec:	00341713          	sll	a4,s0,0x3
    6ff0:	01dad693          	srl	a3,s5,0x1d
    6ff4:	00e6e6b3          	or	a3,a3,a4
    6ff8:	c0178793          	add	a5,a5,-1023
    6ffc:	00800737          	lui	a4,0x800
    7000:	00e6e433          	or	s0,a3,a4
    7004:	003a9e13          	sll	t3,s5,0x3
    7008:	01878333          	add	t1,a5,s8
    700c:	00000693          	li	a3,0
    7010:	00a00793          	li	a5,10
    7014:	00130893          	add	a7,t1,1
    7018:	0b67cc63          	blt	a5,s6,70d0 <__muldf3+0x184>
    701c:	013945b3          	xor	a1,s2,s3
    7020:	00200793          	li	a5,2
    7024:	00058813          	mv	a6,a1
    7028:	1567c663          	blt	a5,s6,7174 <__muldf3+0x228>
    702c:	fffb0b13          	add	s6,s6,-1
    7030:	00100713          	li	a4,1
    7034:	17676063          	bltu	a4,s6,7194 <__muldf3+0x248>
    7038:	48f68663          	beq	a3,a5,74c4 <__muldf3+0x578>
    703c:	00040493          	mv	s1,s0
    7040:	000e0a13          	mv	s4,t3
    7044:	00068b93          	mv	s7,a3
    7048:	09c0006f          	j	70e4 <__muldf3+0x198>
    704c:	00a4ea33          	or	s4,s1,a0
    7050:	480a1463          	bnez	s4,74d8 <__muldf3+0x58c>
    7054:	0149d793          	srl	a5,s3,0x14
    7058:	00c99713          	sll	a4,s3,0xc
    705c:	7ff7f793          	and	a5,a5,2047
    7060:	00000493          	li	s1,0
    7064:	00800b13          	li	s6,8
    7068:	7ff00c13          	li	s8,2047
    706c:	00200b93          	li	s7,2
    7070:	000a8e13          	mv	t3,s5
    7074:	00c75413          	srl	s0,a4,0xc
    7078:	01f9d993          	srl	s3,s3,0x1f
    707c:	f60794e3          	bnez	a5,6fe4 <__muldf3+0x98>
    7080:	015467b3          	or	a5,s0,s5
    7084:	46078e63          	beqz	a5,7500 <__muldf3+0x5b4>
    7088:	54040c63          	beqz	s0,75e0 <__muldf3+0x694>
    708c:	00040513          	mv	a0,s0
    7090:	0e1000ef          	jal	7970 <__clzsi2>
    7094:	00050313          	mv	t1,a0
    7098:	ff550713          	add	a4,a0,-11
    709c:	01d00793          	li	a5,29
    70a0:	ff830e13          	add	t3,t1,-8
    70a4:	40e787b3          	sub	a5,a5,a4
    70a8:	00fad7b3          	srl	a5,s5,a5
    70ac:	01c41733          	sll	a4,s0,t3
    70b0:	00e7e433          	or	s0,a5,a4
    70b4:	01ca9e33          	sll	t3,s5,t3
    70b8:	406c0333          	sub	t1,s8,t1
    70bc:	c0d30313          	add	t1,t1,-1011
    70c0:	00a00793          	li	a5,10
    70c4:	00000693          	li	a3,0
    70c8:	00130893          	add	a7,t1,1
    70cc:	f567d8e3          	bge	a5,s6,701c <__muldf3+0xd0>
    70d0:	00090593          	mv	a1,s2
    70d4:	00200793          	li	a5,2
    70d8:	3efb8663          	beq	s7,a5,74c4 <__muldf3+0x578>
    70dc:	00300793          	li	a5,3
    70e0:	54fb8863          	beq	s7,a5,7630 <__muldf3+0x6e4>
    70e4:	00100793          	li	a5,1
    70e8:	00058813          	mv	a6,a1
    70ec:	52fb9663          	bne	s7,a5,7618 <__muldf3+0x6cc>
    70f0:	00000793          	li	a5,0
    70f4:	00000693          	li	a3,0
    70f8:	00000713          	li	a4,0
    70fc:	02c12083          	lw	ra,44(sp)
    7100:	02812403          	lw	s0,40(sp)
    7104:	01479793          	sll	a5,a5,0x14
    7108:	00d7e7b3          	or	a5,a5,a3
    710c:	01f81813          	sll	a6,a6,0x1f
    7110:	0107e7b3          	or	a5,a5,a6
    7114:	02412483          	lw	s1,36(sp)
    7118:	02012903          	lw	s2,32(sp)
    711c:	01c12983          	lw	s3,28(sp)
    7120:	01812a03          	lw	s4,24(sp)
    7124:	01412a83          	lw	s5,20(sp)
    7128:	01012b03          	lw	s6,16(sp)
    712c:	00c12b83          	lw	s7,12(sp)
    7130:	00812c03          	lw	s8,8(sp)
    7134:	00070513          	mv	a0,a4
    7138:	00078593          	mv	a1,a5
    713c:	03010113          	add	sp,sp,48
    7140:	00008067          	ret
    7144:	01546733          	or	a4,s0,s5
    7148:	7ffc0313          	add	t1,s8,2047
    714c:	3c070663          	beqz	a4,7518 <__muldf3+0x5cc>
    7150:	00001737          	lui	a4,0x1
    7154:	01394833          	xor	a6,s2,s3
    7158:	80070713          	add	a4,a4,-2048 # 800 <_gbl_ptr>
    715c:	003b6b13          	or	s6,s6,3
    7160:	00a00693          	li	a3,10
    7164:	00080593          	mv	a1,a6
    7168:	00ec08b3          	add	a7,s8,a4
    716c:	4366cc63          	blt	a3,s6,75a4 <__muldf3+0x658>
    7170:	00300693          	li	a3,3
    7174:	00100613          	li	a2,1
    7178:	01661633          	sll	a2,a2,s6
    717c:	53067713          	and	a4,a2,1328
    7180:	f4071ae3          	bnez	a4,70d4 <__muldf3+0x188>
    7184:	24067793          	and	a5,a2,576
    7188:	48079063          	bnez	a5,7608 <__muldf3+0x6bc>
    718c:	08867613          	and	a2,a2,136
    7190:	38061e63          	bnez	a2,752c <__muldf3+0x5e0>
    7194:	00010fb7          	lui	t6,0x10
    7198:	ffff8293          	add	t0,t6,-1 # ffff <__subdf3+0x841b>
    719c:	005a7f33          	and	t5,s4,t0
    71a0:	005e72b3          	and	t0,t3,t0
    71a4:	010a5a13          	srl	s4,s4,0x10
    71a8:	010e5e13          	srl	t3,t3,0x10
    71ac:	000f0513          	mv	a0,t5
    71b0:	00028593          	mv	a1,t0
    71b4:	6e4000ef          	jal	7898 <__mulsi3>
    71b8:	00050713          	mv	a4,a0
    71bc:	000e0593          	mv	a1,t3
    71c0:	000f0513          	mv	a0,t5
    71c4:	6d4000ef          	jal	7898 <__mulsi3>
    71c8:	00050793          	mv	a5,a0
    71cc:	00028593          	mv	a1,t0
    71d0:	000a0513          	mv	a0,s4
    71d4:	6c4000ef          	jal	7898 <__mulsi3>
    71d8:	00050e93          	mv	t4,a0
    71dc:	000e0593          	mv	a1,t3
    71e0:	000a0513          	mv	a0,s4
    71e4:	6b4000ef          	jal	7898 <__mulsi3>
    71e8:	01d786b3          	add	a3,a5,t4
    71ec:	01075393          	srl	t2,a4,0x10
    71f0:	00d383b3          	add	t2,t2,a3
    71f4:	00050793          	mv	a5,a0
    71f8:	01d3f463          	bgeu	t2,t4,7200 <__muldf3+0x2b4>
    71fc:	01f507b3          	add	a5,a0,t6
    7200:	000109b7          	lui	s3,0x10
    7204:	fff98913          	add	s2,s3,-1 # ffff <__subdf3+0x841b>
    7208:	0123feb3          	and	t4,t2,s2
    720c:	01277733          	and	a4,a4,s2
    7210:	010e9e93          	sll	t4,t4,0x10
    7214:	01247933          	and	s2,s0,s2
    7218:	0103d393          	srl	t2,t2,0x10
    721c:	00ee8eb3          	add	t4,t4,a4
    7220:	01045413          	srl	s0,s0,0x10
    7224:	000f0513          	mv	a0,t5
    7228:	00090593          	mv	a1,s2
    722c:	66c000ef          	jal	7898 <__mulsi3>
    7230:	00050f93          	mv	t6,a0
    7234:	00040593          	mv	a1,s0
    7238:	000f0513          	mv	a0,t5
    723c:	65c000ef          	jal	7898 <__mulsi3>
    7240:	00050713          	mv	a4,a0
    7244:	00090593          	mv	a1,s2
    7248:	000a0513          	mv	a0,s4
    724c:	64c000ef          	jal	7898 <__mulsi3>
    7250:	00050f13          	mv	t5,a0
    7254:	00040593          	mv	a1,s0
    7258:	000a0513          	mv	a0,s4
    725c:	63c000ef          	jal	7898 <__mulsi3>
    7260:	010fd693          	srl	a3,t6,0x10
    7264:	01e70733          	add	a4,a4,t5
    7268:	00e686b3          	add	a3,a3,a4
    726c:	01e6f463          	bgeu	a3,t5,7274 <__muldf3+0x328>
    7270:	01350533          	add	a0,a0,s3
    7274:	00010a37          	lui	s4,0x10
    7278:	fffa0f13          	add	t5,s4,-1 # ffff <__subdf3+0x841b>
    727c:	01e6f733          	and	a4,a3,t5
    7280:	01efffb3          	and	t6,t6,t5
    7284:	01071713          	sll	a4,a4,0x10
    7288:	01f70733          	add	a4,a4,t6
    728c:	01e4ff33          	and	t5,s1,t5
    7290:	0106d693          	srl	a3,a3,0x10
    7294:	00a68fb3          	add	t6,a3,a0
    7298:	00e383b3          	add	t2,t2,a4
    729c:	0104d493          	srl	s1,s1,0x10
    72a0:	000f0513          	mv	a0,t5
    72a4:	00028593          	mv	a1,t0
    72a8:	5f0000ef          	jal	7898 <__mulsi3>
    72ac:	00050a93          	mv	s5,a0
    72b0:	000e0593          	mv	a1,t3
    72b4:	000f0513          	mv	a0,t5
    72b8:	5e0000ef          	jal	7898 <__mulsi3>
    72bc:	00050993          	mv	s3,a0
    72c0:	00028593          	mv	a1,t0
    72c4:	00048513          	mv	a0,s1
    72c8:	5d0000ef          	jal	7898 <__mulsi3>
    72cc:	00050293          	mv	t0,a0
    72d0:	000e0593          	mv	a1,t3
    72d4:	00048513          	mv	a0,s1
    72d8:	5c0000ef          	jal	7898 <__mulsi3>
    72dc:	010ad613          	srl	a2,s5,0x10
    72e0:	005989b3          	add	s3,s3,t0
    72e4:	01360633          	add	a2,a2,s3
    72e8:	00567463          	bgeu	a2,t0,72f0 <__muldf3+0x3a4>
    72ec:	01450533          	add	a0,a0,s4
    72f0:	00010a37          	lui	s4,0x10
    72f4:	fffa0693          	add	a3,s4,-1 # ffff <__subdf3+0x841b>
    72f8:	00d672b3          	and	t0,a2,a3
    72fc:	00dafab3          	and	s5,s5,a3
    7300:	01065613          	srl	a2,a2,0x10
    7304:	01029293          	sll	t0,t0,0x10
    7308:	00a60e33          	add	t3,a2,a0
    730c:	015282b3          	add	t0,t0,s5
    7310:	000f0513          	mv	a0,t5
    7314:	00090593          	mv	a1,s2
    7318:	580000ef          	jal	7898 <__mulsi3>
    731c:	00050993          	mv	s3,a0
    7320:	00040593          	mv	a1,s0
    7324:	000f0513          	mv	a0,t5
    7328:	570000ef          	jal	7898 <__mulsi3>
    732c:	00050f13          	mv	t5,a0
    7330:	00090593          	mv	a1,s2
    7334:	00048513          	mv	a0,s1
    7338:	560000ef          	jal	7898 <__mulsi3>
    733c:	00050913          	mv	s2,a0
    7340:	00040593          	mv	a1,s0
    7344:	00048513          	mv	a0,s1
    7348:	550000ef          	jal	7898 <__mulsi3>
    734c:	012f06b3          	add	a3,t5,s2
    7350:	0109d593          	srl	a1,s3,0x10
    7354:	00d58433          	add	s0,a1,a3
    7358:	00050f13          	mv	t5,a0
    735c:	01247463          	bgeu	s0,s2,7364 <__muldf3+0x418>
    7360:	01450f33          	add	t5,a0,s4
    7364:	00010637          	lui	a2,0x10
    7368:	fff60613          	add	a2,a2,-1 # ffff <__subdf3+0x841b>
    736c:	00c476b3          	and	a3,s0,a2
    7370:	00c9f9b3          	and	s3,s3,a2
    7374:	01069693          	sll	a3,a3,0x10
    7378:	007787b3          	add	a5,a5,t2
    737c:	013686b3          	add	a3,a3,s3
    7380:	01f685b3          	add	a1,a3,t6
    7384:	00e7b733          	sltu	a4,a5,a4
    7388:	00e58733          	add	a4,a1,a4
    738c:	005782b3          	add	t0,a5,t0
    7390:	01c70633          	add	a2,a4,t3
    7394:	00f2b7b3          	sltu	a5,t0,a5
    7398:	00f607b3          	add	a5,a2,a5
    739c:	00d5b6b3          	sltu	a3,a1,a3
    73a0:	00b735b3          	sltu	a1,a4,a1
    73a4:	00b6e6b3          	or	a3,a3,a1
    73a8:	00e63733          	sltu	a4,a2,a4
    73ac:	01045593          	srl	a1,s0,0x10
    73b0:	00c7b633          	sltu	a2,a5,a2
    73b4:	00b686b3          	add	a3,a3,a1
    73b8:	00929a13          	sll	s4,t0,0x9
    73bc:	00c76733          	or	a4,a4,a2
    73c0:	00d70733          	add	a4,a4,a3
    73c4:	01da6a33          	or	s4,s4,t4
    73c8:	01e70733          	add	a4,a4,t5
    73cc:	01403a33          	snez	s4,s4
    73d0:	0172d293          	srl	t0,t0,0x17
    73d4:	00971713          	sll	a4,a4,0x9
    73d8:	0177d693          	srl	a3,a5,0x17
    73dc:	005a6a33          	or	s4,s4,t0
    73e0:	00979793          	sll	a5,a5,0x9
    73e4:	00fa6a33          	or	s4,s4,a5
    73e8:	00771793          	sll	a5,a4,0x7
    73ec:	00d764b3          	or	s1,a4,a3
    73f0:	0207d063          	bgez	a5,7410 <__muldf3+0x4c4>
    73f4:	001a5793          	srl	a5,s4,0x1
    73f8:	001a7a13          	and	s4,s4,1
    73fc:	01f49713          	sll	a4,s1,0x1f
    7400:	0147e7b3          	or	a5,a5,s4
    7404:	00e7ea33          	or	s4,a5,a4
    7408:	0014d493          	srl	s1,s1,0x1
    740c:	00088313          	mv	t1,a7
    7410:	3ff30793          	add	a5,t1,1023
    7414:	12f05663          	blez	a5,7540 <__muldf3+0x5f4>
    7418:	007a7713          	and	a4,s4,7
    741c:	02070063          	beqz	a4,743c <__muldf3+0x4f0>
    7420:	00fa7713          	and	a4,s4,15
    7424:	00400693          	li	a3,4
    7428:	00d70a63          	beq	a4,a3,743c <__muldf3+0x4f0>
    742c:	004a0713          	add	a4,s4,4
    7430:	01473a33          	sltu	s4,a4,s4
    7434:	014484b3          	add	s1,s1,s4
    7438:	00070a13          	mv	s4,a4
    743c:	00749713          	sll	a4,s1,0x7
    7440:	00075a63          	bgez	a4,7454 <__muldf3+0x508>
    7444:	ff0007b7          	lui	a5,0xff000
    7448:	fff78793          	add	a5,a5,-1 # feffffff <__subdf3+0xfeff841b>
    744c:	00f4f4b3          	and	s1,s1,a5
    7450:	40030793          	add	a5,t1,1024
    7454:	7fe00713          	li	a4,2046
    7458:	1cf74463          	blt	a4,a5,7620 <__muldf3+0x6d4>
    745c:	003a5a13          	srl	s4,s4,0x3
    7460:	01d49713          	sll	a4,s1,0x1d
    7464:	00949693          	sll	a3,s1,0x9
    7468:	01476733          	or	a4,a4,s4
    746c:	00c6d693          	srl	a3,a3,0xc
    7470:	7ff7f793          	and	a5,a5,2047
    7474:	c89ff06f          	j	70fc <__muldf3+0x1b0>
    7478:	00a4ea33          	or	s4,s1,a0
    747c:	060a0863          	beqz	s4,74ec <__muldf3+0x5a0>
    7480:	12048e63          	beqz	s1,75bc <__muldf3+0x670>
    7484:	00048513          	mv	a0,s1
    7488:	4e8000ef          	jal	7970 <__clzsi2>
    748c:	00050713          	mv	a4,a0
    7490:	ff550693          	add	a3,a0,-11
    7494:	01d00793          	li	a5,29
    7498:	ff870a13          	add	s4,a4,-8
    749c:	40d787b3          	sub	a5,a5,a3
    74a0:	00f457b3          	srl	a5,s0,a5
    74a4:	014496b3          	sll	a3,s1,s4
    74a8:	00d7e4b3          	or	s1,a5,a3
    74ac:	01441a33          	sll	s4,s0,s4
    74b0:	c0d00793          	li	a5,-1011
    74b4:	40e78c33          	sub	s8,a5,a4
    74b8:	00000b13          	li	s6,0
    74bc:	00000b93          	li	s7,0
    74c0:	b09ff06f          	j	6fc8 <__muldf3+0x7c>
    74c4:	00058813          	mv	a6,a1
    74c8:	7ff00793          	li	a5,2047
    74cc:	00000693          	li	a3,0
    74d0:	00000713          	li	a4,0
    74d4:	c29ff06f          	j	70fc <__muldf3+0x1b0>
    74d8:	00050a13          	mv	s4,a0
    74dc:	00c00b13          	li	s6,12
    74e0:	7ff00c13          	li	s8,2047
    74e4:	00300b93          	li	s7,3
    74e8:	ae1ff06f          	j	6fc8 <__muldf3+0x7c>
    74ec:	00000493          	li	s1,0
    74f0:	00400b13          	li	s6,4
    74f4:	00000c13          	li	s8,0
    74f8:	00100b93          	li	s7,1
    74fc:	acdff06f          	j	6fc8 <__muldf3+0x7c>
    7500:	001b6b13          	or	s6,s6,1
    7504:	000c0313          	mv	t1,s8
    7508:	00000413          	li	s0,0
    750c:	00000e13          	li	t3,0
    7510:	00100693          	li	a3,1
    7514:	afdff06f          	j	7010 <__muldf3+0xc4>
    7518:	002b6b13          	or	s6,s6,2
    751c:	00000413          	li	s0,0
    7520:	00000e13          	li	t3,0
    7524:	00200693          	li	a3,2
    7528:	ae9ff06f          	j	7010 <__muldf3+0xc4>
    752c:	00040493          	mv	s1,s0
    7530:	000e0a13          	mv	s4,t3
    7534:	00068b93          	mv	s7,a3
    7538:	00098593          	mv	a1,s3
    753c:	b99ff06f          	j	70d4 <__muldf3+0x188>
    7540:	00100713          	li	a4,1
    7544:	10079063          	bnez	a5,7644 <__muldf3+0x6f8>
    7548:	41e30313          	add	t1,t1,1054
    754c:	006a1633          	sll	a2,s4,t1
    7550:	00c03633          	snez	a2,a2
    7554:	00649333          	sll	t1,s1,t1
    7558:	00ea5a33          	srl	s4,s4,a4
    755c:	00666633          	or	a2,a2,t1
    7560:	01466633          	or	a2,a2,s4
    7564:	00767793          	and	a5,a2,7
    7568:	00e4d5b3          	srl	a1,s1,a4
    756c:	02078063          	beqz	a5,758c <__muldf3+0x640>
    7570:	00f67793          	and	a5,a2,15
    7574:	00400713          	li	a4,4
    7578:	00e78a63          	beq	a5,a4,758c <__muldf3+0x640>
    757c:	00460793          	add	a5,a2,4
    7580:	00c7b633          	sltu	a2,a5,a2
    7584:	00c585b3          	add	a1,a1,a2
    7588:	00078613          	mv	a2,a5
    758c:	00859513          	sll	a0,a1,0x8
    7590:	00100793          	li	a5,1
    7594:	00000693          	li	a3,0
    7598:	00000713          	li	a4,0
    759c:	b60540e3          	bltz	a0,70fc <__muldf3+0x1b0>
    75a0:	10c0006f          	j	76ac <__muldf3+0x760>
    75a4:	00f00713          	li	a4,15
    75a8:	12eb1063          	bne	s6,a4,76c8 <__muldf3+0x77c>
    75ac:	00000813          	li	a6,0
    75b0:	000806b7          	lui	a3,0x80
    75b4:	00000713          	li	a4,0
    75b8:	b45ff06f          	j	70fc <__muldf3+0x1b0>
    75bc:	3b4000ef          	jal	7970 <__clzsi2>
    75c0:	01550693          	add	a3,a0,21
    75c4:	01c00793          	li	a5,28
    75c8:	02050713          	add	a4,a0,32
    75cc:	ecd7d4e3          	bge	a5,a3,7494 <__muldf3+0x548>
    75d0:	ff850513          	add	a0,a0,-8
    75d4:	00000a13          	li	s4,0
    75d8:	00a414b3          	sll	s1,s0,a0
    75dc:	ed5ff06f          	j	74b0 <__muldf3+0x564>
    75e0:	000a8513          	mv	a0,s5
    75e4:	38c000ef          	jal	7970 <__clzsi2>
    75e8:	01550713          	add	a4,a0,21
    75ec:	01c00793          	li	a5,28
    75f0:	02050313          	add	t1,a0,32
    75f4:	aae7d4e3          	bge	a5,a4,709c <__muldf3+0x150>
    75f8:	ff850513          	add	a0,a0,-8
    75fc:	00000e13          	li	t3,0
    7600:	00aa9433          	sll	s0,s5,a0
    7604:	ab5ff06f          	j	70b8 <__muldf3+0x16c>
    7608:	00000813          	li	a6,0
    760c:	7ff00793          	li	a5,2047
    7610:	000806b7          	lui	a3,0x80
    7614:	ae9ff06f          	j	70fc <__muldf3+0x1b0>
    7618:	00088313          	mv	t1,a7
    761c:	df5ff06f          	j	7410 <__muldf3+0x4c4>
    7620:	7ff00793          	li	a5,2047
    7624:	00000693          	li	a3,0
    7628:	00000713          	li	a4,0
    762c:	ad1ff06f          	j	70fc <__muldf3+0x1b0>
    7630:	00000813          	li	a6,0
    7634:	7ff00793          	li	a5,2047
    7638:	000806b7          	lui	a3,0x80
    763c:	00000713          	li	a4,0
    7640:	abdff06f          	j	70fc <__muldf3+0x1b0>
    7644:	40f70733          	sub	a4,a4,a5
    7648:	03800693          	li	a3,56
    764c:	aae6c2e3          	blt	a3,a4,70f0 <__muldf3+0x1a4>
    7650:	01f00693          	li	a3,31
    7654:	eee6dae3          	bge	a3,a4,7548 <__muldf3+0x5fc>
    7658:	fe100693          	li	a3,-31
    765c:	40f687b3          	sub	a5,a3,a5
    7660:	02000693          	li	a3,32
    7664:	00f4d7b3          	srl	a5,s1,a5
    7668:	00d70863          	beq	a4,a3,7678 <__muldf3+0x72c>
    766c:	43e30313          	add	t1,t1,1086
    7670:	00649333          	sll	t1,s1,t1
    7674:	006a6a33          	or	s4,s4,t1
    7678:	01403633          	snez	a2,s4
    767c:	00f66633          	or	a2,a2,a5
    7680:	00767713          	and	a4,a2,7
    7684:	00000693          	li	a3,0
    7688:	02070863          	beqz	a4,76b8 <__muldf3+0x76c>
    768c:	00f67793          	and	a5,a2,15
    7690:	00400713          	li	a4,4
    7694:	00000593          	li	a1,0
    7698:	00e78a63          	beq	a5,a4,76ac <__muldf3+0x760>
    769c:	00460793          	add	a5,a2,4
    76a0:	00c7b633          	sltu	a2,a5,a2
    76a4:	00c035b3          	snez	a1,a2
    76a8:	00078613          	mv	a2,a5
    76ac:	00959693          	sll	a3,a1,0x9
    76b0:	01d59713          	sll	a4,a1,0x1d
    76b4:	00c6d693          	srl	a3,a3,0xc
    76b8:	00365613          	srl	a2,a2,0x3
    76bc:	00e66733          	or	a4,a2,a4
    76c0:	00000793          	li	a5,0
    76c4:	a39ff06f          	j	70fc <__muldf3+0x1b0>
    76c8:	00040493          	mv	s1,s0
    76cc:	000a8a13          	mv	s4,s5
    76d0:	00300b93          	li	s7,3
    76d4:	00098593          	mv	a1,s3
    76d8:	9fdff06f          	j	70d4 <__muldf3+0x188>

000076dc <__fixdfsi>:
    76dc:	0145d793          	srl	a5,a1,0x14
    76e0:	001006b7          	lui	a3,0x100
    76e4:	fff68713          	add	a4,a3,-1 # fffff <__subdf3+0xf841b>
    76e8:	7ff7f793          	and	a5,a5,2047
    76ec:	3fe00613          	li	a2,1022
    76f0:	00b77733          	and	a4,a4,a1
    76f4:	01f5d593          	srl	a1,a1,0x1f
    76f8:	00f65e63          	bge	a2,a5,7714 <__fixdfsi+0x38>
    76fc:	41d00613          	li	a2,1053
    7700:	00f65e63          	bge	a2,a5,771c <__fixdfsi+0x40>
    7704:	80000537          	lui	a0,0x80000
    7708:	fff50513          	add	a0,a0,-1 # 7fffffff <__subdf3+0x7fff841b>
    770c:	00a58533          	add	a0,a1,a0
    7710:	00008067          	ret
    7714:	00000513          	li	a0,0
    7718:	00008067          	ret
    771c:	43300613          	li	a2,1075
    7720:	40f60633          	sub	a2,a2,a5
    7724:	01f00813          	li	a6,31
    7728:	00d76733          	or	a4,a4,a3
    772c:	02c85063          	bge	a6,a2,774c <__fixdfsi+0x70>
    7730:	41300693          	li	a3,1043
    7734:	40f687b3          	sub	a5,a3,a5
    7738:	00f75733          	srl	a4,a4,a5
    773c:	40e00533          	neg	a0,a4
    7740:	fc059ce3          	bnez	a1,7718 <__fixdfsi+0x3c>
    7744:	00070513          	mv	a0,a4
    7748:	00008067          	ret
    774c:	bed78793          	add	a5,a5,-1043
    7750:	00f71733          	sll	a4,a4,a5
    7754:	00c55533          	srl	a0,a0,a2
    7758:	00a76733          	or	a4,a4,a0
    775c:	fe1ff06f          	j	773c <__fixdfsi+0x60>

00007760 <__fixunsdfsi>:
    7760:	0145d793          	srl	a5,a1,0x14
    7764:	00100637          	lui	a2,0x100
    7768:	fff60713          	add	a4,a2,-1 # fffff <__subdf3+0xf841b>
    776c:	7ff7f793          	and	a5,a5,2047
    7770:	3fe00813          	li	a6,1022
    7774:	00050693          	mv	a3,a0
    7778:	00b77733          	and	a4,a4,a1
    777c:	00000513          	li	a0,0
    7780:	01f5d593          	srl	a1,a1,0x1f
    7784:	00f85463          	bge	a6,a5,778c <__fixunsdfsi+0x2c>
    7788:	00058463          	beqz	a1,7790 <__fixunsdfsi+0x30>
    778c:	00008067          	ret
    7790:	41e00593          	li	a1,1054
    7794:	fff00513          	li	a0,-1
    7798:	fef5cae3          	blt	a1,a5,778c <__fixunsdfsi+0x2c>
    779c:	43300593          	li	a1,1075
    77a0:	40f585b3          	sub	a1,a1,a5
    77a4:	01f00513          	li	a0,31
    77a8:	00c76733          	or	a4,a4,a2
    77ac:	00b54c63          	blt	a0,a1,77c4 <__fixunsdfsi+0x64>
    77b0:	bed78793          	add	a5,a5,-1043
    77b4:	00f71733          	sll	a4,a4,a5
    77b8:	00b6d533          	srl	a0,a3,a1
    77bc:	00a76533          	or	a0,a4,a0
    77c0:	00008067          	ret
    77c4:	41300513          	li	a0,1043
    77c8:	40f50533          	sub	a0,a0,a5
    77cc:	00a75533          	srl	a0,a4,a0
    77d0:	00008067          	ret

000077d4 <__floatunsidf>:
    77d4:	ff010113          	add	sp,sp,-16
    77d8:	00812423          	sw	s0,8(sp)
    77dc:	00112623          	sw	ra,12(sp)
    77e0:	00050413          	mv	s0,a0
    77e4:	04050c63          	beqz	a0,783c <__floatunsidf+0x68>
    77e8:	188000ef          	jal	7970 <__clzsi2>
    77ec:	41e00793          	li	a5,1054
    77f0:	40a787b3          	sub	a5,a5,a0
    77f4:	00a00713          	li	a4,10
    77f8:	7ff7f793          	and	a5,a5,2047
    77fc:	06a74463          	blt	a4,a0,7864 <__floatunsidf+0x90>
    7800:	00b00713          	li	a4,11
    7804:	40a70733          	sub	a4,a4,a0
    7808:	01550513          	add	a0,a0,21
    780c:	00e45733          	srl	a4,s0,a4
    7810:	00a41433          	sll	s0,s0,a0
    7814:	00c12083          	lw	ra,12(sp)
    7818:	00040513          	mv	a0,s0
    781c:	00c71713          	sll	a4,a4,0xc
    7820:	00812403          	lw	s0,8(sp)
    7824:	00c75713          	srl	a4,a4,0xc
    7828:	01479793          	sll	a5,a5,0x14
    782c:	00e7e7b3          	or	a5,a5,a4
    7830:	00078593          	mv	a1,a5
    7834:	01010113          	add	sp,sp,16
    7838:	00008067          	ret
    783c:	00c12083          	lw	ra,12(sp)
    7840:	00040513          	mv	a0,s0
    7844:	00000793          	li	a5,0
    7848:	00812403          	lw	s0,8(sp)
    784c:	00000713          	li	a4,0
    7850:	01479793          	sll	a5,a5,0x14
    7854:	00e7e7b3          	or	a5,a5,a4
    7858:	00078593          	mv	a1,a5
    785c:	01010113          	add	sp,sp,16
    7860:	00008067          	ret
    7864:	ff550513          	add	a0,a0,-11
    7868:	00a41733          	sll	a4,s0,a0
    786c:	00000413          	li	s0,0
    7870:	00c12083          	lw	ra,12(sp)
    7874:	00040513          	mv	a0,s0
    7878:	00c71713          	sll	a4,a4,0xc
    787c:	00812403          	lw	s0,8(sp)
    7880:	00c75713          	srl	a4,a4,0xc
    7884:	01479793          	sll	a5,a5,0x14
    7888:	00e7e7b3          	or	a5,a5,a4
    788c:	00078593          	mv	a1,a5
    7890:	01010113          	add	sp,sp,16
    7894:	00008067          	ret

00007898 <__mulsi3>:
    7898:	00050613          	mv	a2,a0
    789c:	00000513          	li	a0,0
    78a0:	0015f693          	and	a3,a1,1
    78a4:	00068463          	beqz	a3,78ac <__mulsi3+0x14>
    78a8:	00c50533          	add	a0,a0,a2
    78ac:	0015d593          	srl	a1,a1,0x1
    78b0:	00161613          	sll	a2,a2,0x1
    78b4:	fe0596e3          	bnez	a1,78a0 <__mulsi3+0x8>
    78b8:	00008067          	ret

000078bc <__divsi3>:
    78bc:	06054063          	bltz	a0,791c <__umodsi3+0x10>
    78c0:	0605c663          	bltz	a1,792c <__umodsi3+0x20>

000078c4 <__hidden___udivsi3>:
    78c4:	00058613          	mv	a2,a1
    78c8:	00050593          	mv	a1,a0
    78cc:	fff00513          	li	a0,-1
    78d0:	02060c63          	beqz	a2,7908 <__hidden___udivsi3+0x44>
    78d4:	00100693          	li	a3,1
    78d8:	00b67a63          	bgeu	a2,a1,78ec <__hidden___udivsi3+0x28>
    78dc:	00c05863          	blez	a2,78ec <__hidden___udivsi3+0x28>
    78e0:	00161613          	sll	a2,a2,0x1
    78e4:	00169693          	sll	a3,a3,0x1
    78e8:	feb66ae3          	bltu	a2,a1,78dc <__hidden___udivsi3+0x18>
    78ec:	00000513          	li	a0,0
    78f0:	00c5e663          	bltu	a1,a2,78fc <__hidden___udivsi3+0x38>
    78f4:	40c585b3          	sub	a1,a1,a2
    78f8:	00d56533          	or	a0,a0,a3
    78fc:	0016d693          	srl	a3,a3,0x1
    7900:	00165613          	srl	a2,a2,0x1
    7904:	fe0696e3          	bnez	a3,78f0 <__hidden___udivsi3+0x2c>
    7908:	00008067          	ret

0000790c <__umodsi3>:
    790c:	00008293          	mv	t0,ra
    7910:	fb5ff0ef          	jal	78c4 <__hidden___udivsi3>
    7914:	00058513          	mv	a0,a1
    7918:	00028067          	jr	t0
    791c:	40a00533          	neg	a0,a0
    7920:	00b04863          	bgtz	a1,7930 <__umodsi3+0x24>
    7924:	40b005b3          	neg	a1,a1
    7928:	f9dff06f          	j	78c4 <__hidden___udivsi3>
    792c:	40b005b3          	neg	a1,a1
    7930:	00008293          	mv	t0,ra
    7934:	f91ff0ef          	jal	78c4 <__hidden___udivsi3>
    7938:	40a00533          	neg	a0,a0
    793c:	00028067          	jr	t0

00007940 <__modsi3>:
    7940:	00008293          	mv	t0,ra
    7944:	0005ca63          	bltz	a1,7958 <__modsi3+0x18>
    7948:	00054c63          	bltz	a0,7960 <__modsi3+0x20>
    794c:	f79ff0ef          	jal	78c4 <__hidden___udivsi3>
    7950:	00058513          	mv	a0,a1
    7954:	00028067          	jr	t0
    7958:	40b005b3          	neg	a1,a1
    795c:	fe0558e3          	bgez	a0,794c <__modsi3+0xc>
    7960:	40a00533          	neg	a0,a0
    7964:	f61ff0ef          	jal	78c4 <__hidden___udivsi3>
    7968:	40b00533          	neg	a0,a1
    796c:	00028067          	jr	t0

00007970 <__clzsi2>:
    7970:	000107b7          	lui	a5,0x10
    7974:	02f57863          	bgeu	a0,a5,79a4 <__clzsi2+0x34>
    7978:	10053793          	sltiu	a5,a0,256
    797c:	0017b793          	seqz	a5,a5
    7980:	00379793          	sll	a5,a5,0x3
    7984:	02000713          	li	a4,32
    7988:	40f70733          	sub	a4,a4,a5
    798c:	00f55533          	srl	a0,a0,a5
    7990:	7dc00793          	li	a5,2012
    7994:	00a787b3          	add	a5,a5,a0
    7998:	0007c503          	lbu	a0,0(a5) # 10000 <__subdf3+0x841c>
    799c:	40a70533          	sub	a0,a4,a0
    79a0:	00008067          	ret
    79a4:	010007b7          	lui	a5,0x1000
    79a8:	02f57263          	bgeu	a0,a5,79cc <__clzsi2+0x5c>
    79ac:	01000793          	li	a5,16
    79b0:	00f55533          	srl	a0,a0,a5
    79b4:	7dc00793          	li	a5,2012
    79b8:	00a787b3          	add	a5,a5,a0
    79bc:	0007c503          	lbu	a0,0(a5) # 1000000 <__subdf3+0xff841c>
    79c0:	01000713          	li	a4,16
    79c4:	40a70533          	sub	a0,a4,a0
    79c8:	00008067          	ret
    79cc:	01800793          	li	a5,24
    79d0:	00f55533          	srl	a0,a0,a5
    79d4:	7dc00793          	li	a5,2012
    79d8:	00a787b3          	add	a5,a5,a0
    79dc:	0007c503          	lbu	a0,0(a5)
    79e0:	00800713          	li	a4,8
    79e4:	40a70533          	sub	a0,a4,a0
    79e8:	00008067          	ret

000079ec <modf>:
    79ec:	4145d793          	sra	a5,a1,0x14
    79f0:	ff010113          	add	sp,sp,-16
    79f4:	7ff7f793          	and	a5,a5,2047
    79f8:	00812423          	sw	s0,8(sp)
    79fc:	00912223          	sw	s1,4(sp)
    7a00:	01212023          	sw	s2,0(sp)
    7a04:	00112623          	sw	ra,12(sp)
    7a08:	c0178713          	add	a4,a5,-1023
    7a0c:	01300693          	li	a3,19
    7a10:	00058413          	mv	s0,a1
    7a14:	00050493          	mv	s1,a0
    7a18:	00060913          	mv	s2,a2
    7a1c:	04e6cc63          	blt	a3,a4,7a74 <modf+0x88>
    7a20:	10074a63          	bltz	a4,7b34 <modf+0x148>
    7a24:	001007b7          	lui	a5,0x100
    7a28:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf841b>
    7a2c:	40e7d7b3          	sra	a5,a5,a4
    7a30:	00b7f733          	and	a4,a5,a1
    7a34:	00a76733          	or	a4,a4,a0
    7a38:	06071a63          	bnez	a4,7aac <modf+0xc0>
    7a3c:	00040793          	mv	a5,s0
    7a40:	800006b7          	lui	a3,0x80000
    7a44:	00992023          	sw	s1,0(s2)
    7a48:	0086f433          	and	s0,a3,s0
    7a4c:	00f92223          	sw	a5,4(s2)
    7a50:	00000493          	li	s1,0
    7a54:	00c12083          	lw	ra,12(sp)
    7a58:	00040593          	mv	a1,s0
    7a5c:	00812403          	lw	s0,8(sp)
    7a60:	00012903          	lw	s2,0(sp)
    7a64:	00048513          	mv	a0,s1
    7a68:	00412483          	lw	s1,4(sp)
    7a6c:	01010113          	add	sp,sp,16
    7a70:	00008067          	ret
    7a74:	03300693          	li	a3,51
    7a78:	08e6c263          	blt	a3,a4,7afc <modf+0x110>
    7a7c:	fff00713          	li	a4,-1
    7a80:	bed78793          	add	a5,a5,-1043
    7a84:	00f757b3          	srl	a5,a4,a5
    7a88:	00a7f733          	and	a4,a5,a0
    7a8c:	fa0708e3          	beqz	a4,7a3c <modf+0x50>
    7a90:	fff7c793          	not	a5,a5
    7a94:	00a7f7b3          	and	a5,a5,a0
    7a98:	00078813          	mv	a6,a5
    7a9c:	00078613          	mv	a2,a5
    7aa0:	00058893          	mv	a7,a1
    7aa4:	00058693          	mv	a3,a1
    7aa8:	0200006f          	j	7ac8 <modf+0xdc>
    7aac:	fff7c793          	not	a5,a5
    7ab0:	00000713          	li	a4,0
    7ab4:	00b7f7b3          	and	a5,a5,a1
    7ab8:	00070813          	mv	a6,a4
    7abc:	00070613          	mv	a2,a4
    7ac0:	00078893          	mv	a7,a5
    7ac4:	00078693          	mv	a3,a5
    7ac8:	01092023          	sw	a6,0(s2)
    7acc:	01192223          	sw	a7,4(s2)
    7ad0:	114000ef          	jal	7be4 <__subdf3>
    7ad4:	00058413          	mv	s0,a1
    7ad8:	00c12083          	lw	ra,12(sp)
    7adc:	00040593          	mv	a1,s0
    7ae0:	00812403          	lw	s0,8(sp)
    7ae4:	00050493          	mv	s1,a0
    7ae8:	00012903          	lw	s2,0(sp)
    7aec:	00048513          	mv	a0,s1
    7af0:	00412483          	lw	s1,4(sp)
    7af4:	01010113          	add	sp,sp,16
    7af8:	00008067          	ret
    7afc:	00a92023          	sw	a0,0(s2)
    7b00:	00b92223          	sw	a1,4(s2)
    7b04:	070000ef          	jal	7b74 <__fpclassifyd>
    7b08:	04051e63          	bnez	a0,7b64 <modf+0x178>
    7b0c:	00048613          	mv	a2,s1
    7b10:	00048513          	mv	a0,s1
    7b14:	00040693          	mv	a3,s0
    7b18:	00040593          	mv	a1,s0
    7b1c:	82cfe0ef          	jal	5b48 <__adddf3>
    7b20:	00050493          	mv	s1,a0
    7b24:	00058413          	mv	s0,a1
    7b28:	00a92023          	sw	a0,0(s2)
    7b2c:	00b92223          	sw	a1,4(s2)
    7b30:	f25ff06f          	j	7a54 <modf+0x68>
    7b34:	800007b7          	lui	a5,0x80000
    7b38:	00c12083          	lw	ra,12(sp)
    7b3c:	00b7f7b3          	and	a5,a5,a1
    7b40:	00040593          	mv	a1,s0
    7b44:	00812403          	lw	s0,8(sp)
    7b48:	00062023          	sw	zero,0(a2)
    7b4c:	00f62223          	sw	a5,4(a2)
    7b50:	00012903          	lw	s2,0(sp)
    7b54:	00048513          	mv	a0,s1
    7b58:	00412483          	lw	s1,4(sp)
    7b5c:	01010113          	add	sp,sp,16
    7b60:	00008067          	ret
    7b64:	800007b7          	lui	a5,0x80000
    7b68:	0087f433          	and	s0,a5,s0
    7b6c:	00000493          	li	s1,0
    7b70:	ee5ff06f          	j	7a54 <modf+0x68>

00007b74 <__fpclassifyd>:
    7b74:	00b56733          	or	a4,a0,a1
    7b78:	00050793          	mv	a5,a0
    7b7c:	04070c63          	beqz	a4,7bd4 <__fpclassifyd+0x60>
    7b80:	80000737          	lui	a4,0x80000
    7b84:	04e58263          	beq	a1,a4,7bc8 <__fpclassifyd+0x54>
    7b88:	fff70693          	add	a3,a4,-1 # 7fffffff <__subdf3+0x7fff841b>
    7b8c:	00b6f6b3          	and	a3,a3,a1
    7b90:	fff00837          	lui	a6,0xfff00
    7b94:	01068833          	add	a6,a3,a6
    7b98:	7fe008b7          	lui	a7,0x7fe00
    7b9c:	00400513          	li	a0,4
    7ba0:	03186263          	bltu	a6,a7,7bc4 <__fpclassifyd+0x50>
    7ba4:	00100837          	lui	a6,0x100
    7ba8:	00300513          	li	a0,3
    7bac:	0105ec63          	bltu	a1,a6,7bc4 <__fpclassifyd+0x50>
    7bb0:	00b70733          	add	a4,a4,a1
    7bb4:	01076863          	bltu	a4,a6,7bc4 <__fpclassifyd+0x50>
    7bb8:	7ff00737          	lui	a4,0x7ff00
    7bbc:	00000513          	li	a0,0
    7bc0:	00e68e63          	beq	a3,a4,7bdc <__fpclassifyd+0x68>
    7bc4:	00008067          	ret
    7bc8:	00a03533          	snez	a0,a0
    7bcc:	00250513          	add	a0,a0,2
    7bd0:	00008067          	ret
    7bd4:	00200513          	li	a0,2
    7bd8:	00008067          	ret
    7bdc:	0017b513          	seqz	a0,a5
    7be0:	00008067          	ret

00007be4 <__subdf3>:
    7be4:	001007b7          	lui	a5,0x100
    7be8:	fff78793          	add	a5,a5,-1 # fffff <__subdf3+0xf841b>
    7bec:	fe010113          	add	sp,sp,-32
    7bf0:	00b7f8b3          	and	a7,a5,a1
    7bf4:	00d7f833          	and	a6,a5,a3
    7bf8:	0146d793          	srl	a5,a3,0x14
    7bfc:	00389893          	sll	a7,a7,0x3
    7c00:	00812c23          	sw	s0,24(sp)
    7c04:	01312623          	sw	s3,12(sp)
    7c08:	01f5d413          	srl	s0,a1,0x1f
    7c0c:	0145d993          	srl	s3,a1,0x14
    7c10:	01d55713          	srl	a4,a0,0x1d
    7c14:	00381813          	sll	a6,a6,0x3
    7c18:	01d65593          	srl	a1,a2,0x1d
    7c1c:	00112e23          	sw	ra,28(sp)
    7c20:	00912a23          	sw	s1,20(sp)
    7c24:	01212823          	sw	s2,16(sp)
    7c28:	7ff7ff13          	and	t5,a5,2047
    7c2c:	7ff00313          	li	t1,2047
    7c30:	01176733          	or	a4,a4,a7
    7c34:	7ff9f993          	and	s3,s3,2047
    7c38:	00040e13          	mv	t3,s0
    7c3c:	00351893          	sll	a7,a0,0x3
    7c40:	01f6d693          	srl	a3,a3,0x1f
    7c44:	0105e5b3          	or	a1,a1,a6
    7c48:	00361e93          	sll	t4,a2,0x3
    7c4c:	206f0c63          	beq	t5,t1,7e64 <__subdf3+0x280>
    7c50:	0016c693          	xor	a3,a3,1
    7c54:	41e987b3          	sub	a5,s3,t5
    7c58:	16d40263          	beq	s0,a3,7dbc <__subdf3+0x1d8>
    7c5c:	00f05ae3          	blez	a5,8470 <__subdf3+0x88c>
    7c60:	240f0a63          	beqz	t5,7eb4 <__subdf3+0x2d0>
    7c64:	3c698463          	beq	s3,t1,802c <__subdf3+0x448>
    7c68:	03800693          	li	a3,56
    7c6c:	00100513          	li	a0,1
    7c70:	02f6ce63          	blt	a3,a5,7cac <__subdf3+0xc8>
    7c74:	008006b7          	lui	a3,0x800
    7c78:	00d5e5b3          	or	a1,a1,a3
    7c7c:	01f00693          	li	a3,31
    7c80:	4ef6c463          	blt	a3,a5,8168 <__subdf3+0x584>
    7c84:	02000693          	li	a3,32
    7c88:	40f686b3          	sub	a3,a3,a5
    7c8c:	00d59533          	sll	a0,a1,a3
    7c90:	00fed633          	srl	a2,t4,a5
    7c94:	00de96b3          	sll	a3,t4,a3
    7c98:	00c56533          	or	a0,a0,a2
    7c9c:	00d036b3          	snez	a3,a3
    7ca0:	00f5d7b3          	srl	a5,a1,a5
    7ca4:	00d56533          	or	a0,a0,a3
    7ca8:	40f70733          	sub	a4,a4,a5
    7cac:	40a88533          	sub	a0,a7,a0
    7cb0:	00a8b633          	sltu	a2,a7,a0
    7cb4:	00050493          	mv	s1,a0
    7cb8:	40c70933          	sub	s2,a4,a2
    7cbc:	00891793          	sll	a5,s2,0x8
    7cc0:	3407d863          	bgez	a5,8010 <__subdf3+0x42c>
    7cc4:	008007b7          	lui	a5,0x800
    7cc8:	fff78793          	add	a5,a5,-1 # 7fffff <__subdf3+0x7f841b>
    7ccc:	00f97933          	and	s2,s2,a5
    7cd0:	2e090663          	beqz	s2,7fbc <__subdf3+0x3d8>
    7cd4:	00090513          	mv	a0,s2
    7cd8:	c99ff0ef          	jal	7970 <__clzsi2>
    7cdc:	ff850793          	add	a5,a0,-8
    7ce0:	02000693          	li	a3,32
    7ce4:	40f68733          	sub	a4,a3,a5
    7ce8:	00e4d733          	srl	a4,s1,a4
    7cec:	00f91933          	sll	s2,s2,a5
    7cf0:	01276733          	or	a4,a4,s2
    7cf4:	00f494b3          	sll	s1,s1,a5
    7cf8:	3f37c463          	blt	a5,s3,80e0 <__subdf3+0x4fc>
    7cfc:	413787b3          	sub	a5,a5,s3
    7d00:	00178793          	add	a5,a5,1
    7d04:	40f686b3          	sub	a3,a3,a5
    7d08:	00d49633          	sll	a2,s1,a3
    7d0c:	00f4d933          	srl	s2,s1,a5
    7d10:	00c03633          	snez	a2,a2
    7d14:	00c96633          	or	a2,s2,a2
    7d18:	00d716b3          	sll	a3,a4,a3
    7d1c:	00c6e4b3          	or	s1,a3,a2
    7d20:	00f75933          	srl	s2,a4,a5
    7d24:	00000993          	li	s3,0
    7d28:	0074f793          	and	a5,s1,7
    7d2c:	02078063          	beqz	a5,7d4c <__subdf3+0x168>
    7d30:	00f4f793          	and	a5,s1,15
    7d34:	00400713          	li	a4,4
    7d38:	00e78a63          	beq	a5,a4,7d4c <__subdf3+0x168>
    7d3c:	00448793          	add	a5,s1,4
    7d40:	0097b533          	sltu	a0,a5,s1
    7d44:	00a90933          	add	s2,s2,a0
    7d48:	00078493          	mv	s1,a5
    7d4c:	00891793          	sll	a5,s2,0x8
    7d50:	6c07d063          	bgez	a5,8410 <__subdf3+0x82c>
    7d54:	00198793          	add	a5,s3,1
    7d58:	7ff00713          	li	a4,2047
    7d5c:	24e78663          	beq	a5,a4,7fa8 <__subdf3+0x3c4>
    7d60:	ff800737          	lui	a4,0xff800
    7d64:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f841b>
    7d68:	00e97733          	and	a4,s2,a4
    7d6c:	7ff7f793          	and	a5,a5,2047
    7d70:	01d71813          	sll	a6,a4,0x1d
    7d74:	0034d513          	srl	a0,s1,0x3
    7d78:	00971713          	sll	a4,a4,0x9
    7d7c:	00a86833          	or	a6,a6,a0
    7d80:	00c75713          	srl	a4,a4,0xc
    7d84:	00147e13          	and	t3,s0,1
    7d88:	01c12083          	lw	ra,28(sp)
    7d8c:	01812403          	lw	s0,24(sp)
    7d90:	01479793          	sll	a5,a5,0x14
    7d94:	00e7e7b3          	or	a5,a5,a4
    7d98:	01fe1713          	sll	a4,t3,0x1f
    7d9c:	00e7e7b3          	or	a5,a5,a4
    7da0:	01412483          	lw	s1,20(sp)
    7da4:	01012903          	lw	s2,16(sp)
    7da8:	00c12983          	lw	s3,12(sp)
    7dac:	00080513          	mv	a0,a6
    7db0:	00078593          	mv	a1,a5
    7db4:	02010113          	add	sp,sp,32
    7db8:	00008067          	ret
    7dbc:	70f05263          	blez	a5,84c0 <__subdf3+0x8dc>
    7dc0:	1c0f1663          	bnez	t5,7f8c <__subdf3+0x3a8>
    7dc4:	01d5e6b3          	or	a3,a1,t4
    7dc8:	26068e63          	beqz	a3,8044 <__subdf3+0x460>
    7dcc:	fff78693          	add	a3,a5,-1
    7dd0:	46068863          	beqz	a3,8240 <__subdf3+0x65c>
    7dd4:	24678c63          	beq	a5,t1,802c <__subdf3+0x448>
    7dd8:	03800793          	li	a5,56
    7ddc:	00100913          	li	s2,1
    7de0:	02d7cc63          	blt	a5,a3,7e18 <__subdf3+0x234>
    7de4:	00068793          	mv	a5,a3
    7de8:	01f00693          	li	a3,31
    7dec:	48f6ca63          	blt	a3,a5,8280 <__subdf3+0x69c>
    7df0:	02000693          	li	a3,32
    7df4:	40f686b3          	sub	a3,a3,a5
    7df8:	00d59933          	sll	s2,a1,a3
    7dfc:	00fed633          	srl	a2,t4,a5
    7e00:	00de96b3          	sll	a3,t4,a3
    7e04:	00c96933          	or	s2,s2,a2
    7e08:	00d036b3          	snez	a3,a3
    7e0c:	00f5d7b3          	srl	a5,a1,a5
    7e10:	00d96933          	or	s2,s2,a3
    7e14:	00f70733          	add	a4,a4,a5
    7e18:	01190633          	add	a2,s2,a7
    7e1c:	01263933          	sltu	s2,a2,s2
    7e20:	00060493          	mv	s1,a2
    7e24:	00e90933          	add	s2,s2,a4
    7e28:	00891793          	sll	a5,s2,0x8
    7e2c:	1e07d263          	bgez	a5,8010 <__subdf3+0x42c>
    7e30:	00198993          	add	s3,s3,1
    7e34:	7ff00793          	li	a5,2047
    7e38:	16f98863          	beq	s3,a5,7fa8 <__subdf3+0x3c4>
    7e3c:	ff8007b7          	lui	a5,0xff800
    7e40:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f841b>
    7e44:	0014f513          	and	a0,s1,1
    7e48:	00f977b3          	and	a5,s2,a5
    7e4c:	0014d713          	srl	a4,s1,0x1
    7e50:	00a76733          	or	a4,a4,a0
    7e54:	01f79513          	sll	a0,a5,0x1f
    7e58:	00e564b3          	or	s1,a0,a4
    7e5c:	0017d913          	srl	s2,a5,0x1
    7e60:	ec9ff06f          	j	7d28 <__subdf3+0x144>
    7e64:	01d5e833          	or	a6,a1,t4
    7e68:	80198313          	add	t1,s3,-2047
    7e6c:	06080863          	beqz	a6,7edc <__subdf3+0x2f8>
    7e70:	06d40a63          	beq	s0,a3,7ee4 <__subdf3+0x300>
    7e74:	0e030463          	beqz	t1,7f5c <__subdf3+0x378>
    7e78:	26098e63          	beqz	s3,80f4 <__subdf3+0x510>
    7e7c:	00361513          	sll	a0,a2,0x3
    7e80:	00355513          	srl	a0,a0,0x3
    7e84:	00068413          	mv	s0,a3
    7e88:	00058713          	mv	a4,a1
    7e8c:	01d71813          	sll	a6,a4,0x1d
    7e90:	00a86833          	or	a6,a6,a0
    7e94:	00375713          	srl	a4,a4,0x3
    7e98:	01076733          	or	a4,a4,a6
    7e9c:	10070663          	beqz	a4,7fa8 <__subdf3+0x3c4>
    7ea0:	00000e13          	li	t3,0
    7ea4:	7ff00793          	li	a5,2047
    7ea8:	00080737          	lui	a4,0x80
    7eac:	00000813          	li	a6,0
    7eb0:	ed9ff06f          	j	7d88 <__subdf3+0x1a4>
    7eb4:	01d5e6b3          	or	a3,a1,t4
    7eb8:	18068663          	beqz	a3,8044 <__subdf3+0x460>
    7ebc:	fff78693          	add	a3,a5,-1
    7ec0:	3a068263          	beqz	a3,8264 <__subdf3+0x680>
    7ec4:	16678463          	beq	a5,t1,802c <__subdf3+0x448>
    7ec8:	03800793          	li	a5,56
    7ecc:	00100513          	li	a0,1
    7ed0:	dcd7cee3          	blt	a5,a3,7cac <__subdf3+0xc8>
    7ed4:	00068793          	mv	a5,a3
    7ed8:	da5ff06f          	j	7c7c <__subdf3+0x98>
    7edc:	0016c693          	xor	a3,a3,1
    7ee0:	f8d41ae3          	bne	s0,a3,7e74 <__subdf3+0x290>
    7ee4:	18030863          	beqz	t1,8074 <__subdf3+0x490>
    7ee8:	2c099063          	bnez	s3,81a8 <__subdf3+0x5c4>
    7eec:	7ff00793          	li	a5,2047
    7ef0:	011766b3          	or	a3,a4,a7
    7ef4:	48068863          	beqz	a3,8384 <__subdf3+0x7a0>
    7ef8:	fff78693          	add	a3,a5,-1
    7efc:	34068263          	beqz	a3,8240 <__subdf3+0x65c>
    7f00:	7ff00513          	li	a0,2047
    7f04:	2aa78263          	beq	a5,a0,81a8 <__subdf3+0x5c4>
    7f08:	03800793          	li	a5,56
    7f0c:	00100913          	li	s2,1
    7f10:	02d7ca63          	blt	a5,a3,7f44 <__subdf3+0x360>
    7f14:	01f00793          	li	a5,31
    7f18:	4cd7c663          	blt	a5,a3,83e4 <__subdf3+0x800>
    7f1c:	02000793          	li	a5,32
    7f20:	40d787b3          	sub	a5,a5,a3
    7f24:	00f71933          	sll	s2,a4,a5
    7f28:	00d8d633          	srl	a2,a7,a3
    7f2c:	00f897b3          	sll	a5,a7,a5
    7f30:	00c96933          	or	s2,s2,a2
    7f34:	00f037b3          	snez	a5,a5
    7f38:	00d756b3          	srl	a3,a4,a3
    7f3c:	00f96933          	or	s2,s2,a5
    7f40:	00d585b3          	add	a1,a1,a3
    7f44:	01d90733          	add	a4,s2,t4
    7f48:	01273933          	sltu	s2,a4,s2
    7f4c:	00070493          	mv	s1,a4
    7f50:	00b90933          	add	s2,s2,a1
    7f54:	000f0993          	mv	s3,t5
    7f58:	ed1ff06f          	j	7e28 <__subdf3+0x244>
    7f5c:	00198793          	add	a5,s3,1
    7f60:	7fe7f793          	and	a5,a5,2046
    7f64:	14079463          	bnez	a5,80ac <__subdf3+0x4c8>
    7f68:	01d5e833          	or	a6,a1,t4
    7f6c:	011767b3          	or	a5,a4,a7
    7f70:	2a099463          	bnez	s3,8218 <__subdf3+0x634>
    7f74:	38078e63          	beqz	a5,8310 <__subdf3+0x72c>
    7f78:	3c081063          	bnez	a6,8338 <__subdf3+0x754>
    7f7c:	00351513          	sll	a0,a0,0x3
    7f80:	00355913          	srl	s2,a0,0x3
    7f84:	00000793          	li	a5,0
    7f88:	1140006f          	j	809c <__subdf3+0x4b8>
    7f8c:	0a698063          	beq	s3,t1,802c <__subdf3+0x448>
    7f90:	03800693          	li	a3,56
    7f94:	00100913          	li	s2,1
    7f98:	e8f6c0e3          	blt	a3,a5,7e18 <__subdf3+0x234>
    7f9c:	008006b7          	lui	a3,0x800
    7fa0:	00d5e5b3          	or	a1,a1,a3
    7fa4:	e45ff06f          	j	7de8 <__subdf3+0x204>
    7fa8:	00147e13          	and	t3,s0,1
    7fac:	7ff00793          	li	a5,2047
    7fb0:	00000713          	li	a4,0
    7fb4:	00000813          	li	a6,0
    7fb8:	dd1ff06f          	j	7d88 <__subdf3+0x1a4>
    7fbc:	00048513          	mv	a0,s1
    7fc0:	9b1ff0ef          	jal	7970 <__clzsi2>
    7fc4:	01850793          	add	a5,a0,24
    7fc8:	01f00693          	li	a3,31
    7fcc:	d0f6dae3          	bge	a3,a5,7ce0 <__subdf3+0xfc>
    7fd0:	ff850713          	add	a4,a0,-8
    7fd4:	00e49733          	sll	a4,s1,a4
    7fd8:	1b37ce63          	blt	a5,s3,8194 <__subdf3+0x5b0>
    7fdc:	413789b3          	sub	s3,a5,s3
    7fe0:	00198793          	add	a5,s3,1
    7fe4:	42f6de63          	bge	a3,a5,8420 <__subdf3+0x83c>
    7fe8:	fe198993          	add	s3,s3,-31
    7fec:	02000693          	li	a3,32
    7ff0:	013754b3          	srl	s1,a4,s3
    7ff4:	00d78c63          	beq	a5,a3,800c <__subdf3+0x428>
    7ff8:	04000693          	li	a3,64
    7ffc:	40f687b3          	sub	a5,a3,a5
    8000:	00f71733          	sll	a4,a4,a5
    8004:	00e03733          	snez	a4,a4
    8008:	00e4e4b3          	or	s1,s1,a4
    800c:	00000993          	li	s3,0
    8010:	0074f793          	and	a5,s1,7
    8014:	d0079ee3          	bnez	a5,7d30 <__subdf3+0x14c>
    8018:	00098793          	mv	a5,s3
    801c:	0034d513          	srl	a0,s1,0x3
    8020:	00090713          	mv	a4,s2
    8024:	0280006f          	j	804c <__subdf3+0x468>
    8028:	e6081ce3          	bnez	a6,7ea0 <__subdf3+0x2bc>
    802c:	00351513          	sll	a0,a0,0x3
    8030:	01d71813          	sll	a6,a4,0x1d
    8034:	00355513          	srl	a0,a0,0x3
    8038:	00a86833          	or	a6,a6,a0
    803c:	00375713          	srl	a4,a4,0x3
    8040:	e59ff06f          	j	7e98 <__subdf3+0x2b4>
    8044:	00351513          	sll	a0,a0,0x3
    8048:	00355513          	srl	a0,a0,0x3
    804c:	01d71813          	sll	a6,a4,0x1d
    8050:	7ff00693          	li	a3,2047
    8054:	00a86833          	or	a6,a6,a0
    8058:	00375713          	srl	a4,a4,0x3
    805c:	e2d78ee3          	beq	a5,a3,7e98 <__subdf3+0x2b4>
    8060:	00c71713          	sll	a4,a4,0xc
    8064:	00c75713          	srl	a4,a4,0xc
    8068:	7ff7f793          	and	a5,a5,2047
    806c:	00147e13          	and	t3,s0,1
    8070:	d19ff06f          	j	7d88 <__subdf3+0x1a4>
    8074:	00198693          	add	a3,s3,1
    8078:	7fe6f793          	and	a5,a3,2046
    807c:	12079e63          	bnez	a5,81b8 <__subdf3+0x5d4>
    8080:	011767b3          	or	a5,a4,a7
    8084:	24099a63          	bnez	s3,82d8 <__subdf3+0x6f4>
    8088:	30078663          	beqz	a5,8394 <__subdf3+0x7b0>
    808c:	01d5e7b3          	or	a5,a1,t4
    8090:	30079a63          	bnez	a5,83a4 <__subdf3+0x7c0>
    8094:	00351513          	sll	a0,a0,0x3
    8098:	00355913          	srl	s2,a0,0x3
    809c:	01d71813          	sll	a6,a4,0x1d
    80a0:	01286833          	or	a6,a6,s2
    80a4:	00375713          	srl	a4,a4,0x3
    80a8:	fb9ff06f          	j	8060 <__subdf3+0x47c>
    80ac:	41d88833          	sub	a6,a7,t4
    80b0:	0108b7b3          	sltu	a5,a7,a6
    80b4:	40b70933          	sub	s2,a4,a1
    80b8:	40f90933          	sub	s2,s2,a5
    80bc:	00891793          	sll	a5,s2,0x8
    80c0:	00080493          	mv	s1,a6
    80c4:	1207c263          	bltz	a5,81e8 <__subdf3+0x604>
    80c8:	01286833          	or	a6,a6,s2
    80cc:	c00812e3          	bnez	a6,7cd0 <__subdf3+0xec>
    80d0:	00000e13          	li	t3,0
    80d4:	00000793          	li	a5,0
    80d8:	00000713          	li	a4,0
    80dc:	cadff06f          	j	7d88 <__subdf3+0x1a4>
    80e0:	ff800937          	lui	s2,0xff800
    80e4:	fff90913          	add	s2,s2,-1 # ff7fffff <__subdf3+0xff7f841b>
    80e8:	40f989b3          	sub	s3,s3,a5
    80ec:	01277933          	and	s2,a4,s2
    80f0:	c39ff06f          	j	7d28 <__subdf3+0x144>
    80f4:	7ff00793          	li	a5,2047
    80f8:	01176533          	or	a0,a4,a7
    80fc:	10050463          	beqz	a0,8204 <__subdf3+0x620>
    8100:	fff78813          	add	a6,a5,-1
    8104:	1e080263          	beqz	a6,82e8 <__subdf3+0x704>
    8108:	7ff00513          	li	a0,2047
    810c:	d6a788e3          	beq	a5,a0,7e7c <__subdf3+0x298>
    8110:	03800793          	li	a5,56
    8114:	00068413          	mv	s0,a3
    8118:	00100513          	li	a0,1
    811c:	0307ca63          	blt	a5,a6,8150 <__subdf3+0x56c>
    8120:	01f00793          	li	a5,31
    8124:	1907c463          	blt	a5,a6,82ac <__subdf3+0x6c8>
    8128:	02000793          	li	a5,32
    812c:	410787b3          	sub	a5,a5,a6
    8130:	00f71533          	sll	a0,a4,a5
    8134:	0108d6b3          	srl	a3,a7,a6
    8138:	00f897b3          	sll	a5,a7,a5
    813c:	00d56533          	or	a0,a0,a3
    8140:	00f037b3          	snez	a5,a5
    8144:	01075833          	srl	a6,a4,a6
    8148:	00f56533          	or	a0,a0,a5
    814c:	410585b3          	sub	a1,a1,a6
    8150:	40ae8533          	sub	a0,t4,a0
    8154:	00aeb733          	sltu	a4,t4,a0
    8158:	00050493          	mv	s1,a0
    815c:	40e58933          	sub	s2,a1,a4
    8160:	000f0993          	mv	s3,t5
    8164:	b59ff06f          	j	7cbc <__subdf3+0xd8>
    8168:	fe078693          	add	a3,a5,-32
    816c:	02000613          	li	a2,32
    8170:	00d5d6b3          	srl	a3,a1,a3
    8174:	00c78a63          	beq	a5,a2,8188 <__subdf3+0x5a4>
    8178:	04000613          	li	a2,64
    817c:	40f607b3          	sub	a5,a2,a5
    8180:	00f597b3          	sll	a5,a1,a5
    8184:	00feeeb3          	or	t4,t4,a5
    8188:	01d03533          	snez	a0,t4
    818c:	00d56533          	or	a0,a0,a3
    8190:	b1dff06f          	j	7cac <__subdf3+0xc8>
    8194:	ff8006b7          	lui	a3,0xff800
    8198:	fff68693          	add	a3,a3,-1 # ff7fffff <__subdf3+0xff7f841b>
    819c:	40f987b3          	sub	a5,s3,a5
    81a0:	00d77733          	and	a4,a4,a3
    81a4:	ef9ff06f          	j	809c <__subdf3+0x4b8>
    81a8:	00361513          	sll	a0,a2,0x3
    81ac:	00355513          	srl	a0,a0,0x3
    81b0:	00058713          	mv	a4,a1
    81b4:	cd9ff06f          	j	7e8c <__subdf3+0x2a8>
    81b8:	7ff00793          	li	a5,2047
    81bc:	def686e3          	beq	a3,a5,7fa8 <__subdf3+0x3c4>
    81c0:	01d88eb3          	add	t4,a7,t4
    81c4:	011eb633          	sltu	a2,t4,a7
    81c8:	00b707b3          	add	a5,a4,a1
    81cc:	00c787b3          	add	a5,a5,a2
    81d0:	01f79513          	sll	a0,a5,0x1f
    81d4:	001ede93          	srl	t4,t4,0x1
    81d8:	01d564b3          	or	s1,a0,t4
    81dc:	0017d913          	srl	s2,a5,0x1
    81e0:	00068993          	mv	s3,a3
    81e4:	b45ff06f          	j	7d28 <__subdf3+0x144>
    81e8:	411e8633          	sub	a2,t4,a7
    81ec:	40e587b3          	sub	a5,a1,a4
    81f0:	00ceb733          	sltu	a4,t4,a2
    81f4:	00060493          	mv	s1,a2
    81f8:	40e78933          	sub	s2,a5,a4
    81fc:	00068413          	mv	s0,a3
    8200:	ad1ff06f          	j	7cd0 <__subdf3+0xec>
    8204:	00361613          	sll	a2,a2,0x3
    8208:	00365513          	srl	a0,a2,0x3
    820c:	00068413          	mv	s0,a3
    8210:	00058713          	mv	a4,a1
    8214:	e39ff06f          	j	804c <__subdf3+0x468>
    8218:	e00798e3          	bnez	a5,8028 <__subdf3+0x444>
    821c:	22080663          	beqz	a6,8448 <__subdf3+0x864>
    8220:	0035d713          	srl	a4,a1,0x3
    8224:	00361613          	sll	a2,a2,0x3
    8228:	01d59593          	sll	a1,a1,0x1d
    822c:	00b76733          	or	a4,a4,a1
    8230:	00365613          	srl	a2,a2,0x3
    8234:	00c76733          	or	a4,a4,a2
    8238:	00068413          	mv	s0,a3
    823c:	c61ff06f          	j	7e9c <__subdf3+0x2b8>
    8240:	01d88eb3          	add	t4,a7,t4
    8244:	00b705b3          	add	a1,a4,a1
    8248:	011eb633          	sltu	a2,t4,a7
    824c:	00c58933          	add	s2,a1,a2
    8250:	00891793          	sll	a5,s2,0x8
    8254:	000e8493          	mv	s1,t4
    8258:	0a07d863          	bgez	a5,8308 <__subdf3+0x724>
    825c:	00200993          	li	s3,2
    8260:	bddff06f          	j	7e3c <__subdf3+0x258>
    8264:	41d88eb3          	sub	t4,a7,t4
    8268:	40b705b3          	sub	a1,a4,a1
    826c:	01d8b633          	sltu	a2,a7,t4
    8270:	000e8493          	mv	s1,t4
    8274:	40c58933          	sub	s2,a1,a2
    8278:	00100993          	li	s3,1
    827c:	a41ff06f          	j	7cbc <__subdf3+0xd8>
    8280:	fe078693          	add	a3,a5,-32
    8284:	02000613          	li	a2,32
    8288:	00d5d6b3          	srl	a3,a1,a3
    828c:	00c78a63          	beq	a5,a2,82a0 <__subdf3+0x6bc>
    8290:	04000613          	li	a2,64
    8294:	40f607b3          	sub	a5,a2,a5
    8298:	00f597b3          	sll	a5,a1,a5
    829c:	00feeeb3          	or	t4,t4,a5
    82a0:	01d03933          	snez	s2,t4
    82a4:	00d96933          	or	s2,s2,a3
    82a8:	b71ff06f          	j	7e18 <__subdf3+0x234>
    82ac:	fe080793          	add	a5,a6,-32 # fffe0 <__subdf3+0xf83fc>
    82b0:	02000693          	li	a3,32
    82b4:	00f757b3          	srl	a5,a4,a5
    82b8:	00d80a63          	beq	a6,a3,82cc <__subdf3+0x6e8>
    82bc:	04000693          	li	a3,64
    82c0:	410686b3          	sub	a3,a3,a6
    82c4:	00d71733          	sll	a4,a4,a3
    82c8:	00e8e8b3          	or	a7,a7,a4
    82cc:	01103533          	snez	a0,a7
    82d0:	00f56533          	or	a0,a0,a5
    82d4:	e7dff06f          	j	8150 <__subdf3+0x56c>
    82d8:	ec0788e3          	beqz	a5,81a8 <__subdf3+0x5c4>
    82dc:	01d5eeb3          	or	t4,a1,t4
    82e0:	bc0e90e3          	bnez	t4,7ea0 <__subdf3+0x2bc>
    82e4:	d49ff06f          	j	802c <__subdf3+0x448>
    82e8:	411e8633          	sub	a2,t4,a7
    82ec:	40e585b3          	sub	a1,a1,a4
    82f0:	00ceb733          	sltu	a4,t4,a2
    82f4:	00060493          	mv	s1,a2
    82f8:	40e58933          	sub	s2,a1,a4
    82fc:	00068413          	mv	s0,a3
    8300:	00100993          	li	s3,1
    8304:	9b9ff06f          	j	7cbc <__subdf3+0xd8>
    8308:	00100793          	li	a5,1
    830c:	d11ff06f          	j	801c <__subdf3+0x438>
    8310:	dc0800e3          	beqz	a6,80d0 <__subdf3+0x4ec>
    8314:	00361613          	sll	a2,a2,0x3
    8318:	00365793          	srl	a5,a2,0x3
    831c:	01d59813          	sll	a6,a1,0x1d
    8320:	00959713          	sll	a4,a1,0x9
    8324:	00f86833          	or	a6,a6,a5
    8328:	00c75713          	srl	a4,a4,0xc
    832c:	00068e13          	mv	t3,a3
    8330:	00000793          	li	a5,0
    8334:	a55ff06f          	j	7d88 <__subdf3+0x1a4>
    8338:	41d88933          	sub	s2,a7,t4
    833c:	0128b7b3          	sltu	a5,a7,s2
    8340:	40b70633          	sub	a2,a4,a1
    8344:	40f60633          	sub	a2,a2,a5
    8348:	00861793          	sll	a5,a2,0x8
    834c:	0e07d263          	bgez	a5,8430 <__subdf3+0x84c>
    8350:	411e8633          	sub	a2,t4,a7
    8354:	40e58733          	sub	a4,a1,a4
    8358:	00cebeb3          	sltu	t4,t4,a2
    835c:	41d70733          	sub	a4,a4,t4
    8360:	00871793          	sll	a5,a4,0x8
    8364:	00060493          	mv	s1,a2
    8368:	1207de63          	bgez	a5,84a4 <__subdf3+0x8c0>
    836c:	ff8007b7          	lui	a5,0xff800
    8370:	fff78793          	add	a5,a5,-1 # ff7fffff <__subdf3+0xff7f841b>
    8374:	00f77733          	and	a4,a4,a5
    8378:	00068413          	mv	s0,a3
    837c:	00100793          	li	a5,1
    8380:	9f1ff06f          	j	7d70 <__subdf3+0x18c>
    8384:	00361613          	sll	a2,a2,0x3
    8388:	00365513          	srl	a0,a2,0x3
    838c:	00058713          	mv	a4,a1
    8390:	cbdff06f          	j	804c <__subdf3+0x468>
    8394:	00361613          	sll	a2,a2,0x3
    8398:	00365913          	srl	s2,a2,0x3
    839c:	00058713          	mv	a4,a1
    83a0:	cfdff06f          	j	809c <__subdf3+0x4b8>
    83a4:	01d886b3          	add	a3,a7,t4
    83a8:	00b707b3          	add	a5,a4,a1
    83ac:	0116b633          	sltu	a2,a3,a7
    83b0:	00c787b3          	add	a5,a5,a2
    83b4:	00879713          	sll	a4,a5,0x8
    83b8:	0036d813          	srl	a6,a3,0x3
    83bc:	08075e63          	bgez	a4,8458 <__subdf3+0x874>
    83c0:	ff800737          	lui	a4,0xff800
    83c4:	fff70713          	add	a4,a4,-1 # ff7fffff <__subdf3+0xff7f841b>
    83c8:	00e7f7b3          	and	a5,a5,a4
    83cc:	01d79713          	sll	a4,a5,0x1d
    83d0:	00979793          	sll	a5,a5,0x9
    83d4:	01076833          	or	a6,a4,a6
    83d8:	00c7d713          	srl	a4,a5,0xc
    83dc:	00100793          	li	a5,1
    83e0:	9a9ff06f          	j	7d88 <__subdf3+0x1a4>
    83e4:	fe068793          	add	a5,a3,-32
    83e8:	02000613          	li	a2,32
    83ec:	00f757b3          	srl	a5,a4,a5
    83f0:	00c68a63          	beq	a3,a2,8404 <__subdf3+0x820>
    83f4:	04000613          	li	a2,64
    83f8:	40d606b3          	sub	a3,a2,a3
    83fc:	00d71733          	sll	a4,a4,a3
    8400:	00e8e8b3          	or	a7,a7,a4
    8404:	01103933          	snez	s2,a7
    8408:	00f96933          	or	s2,s2,a5
    840c:	b39ff06f          	j	7f44 <__subdf3+0x360>
    8410:	0034d513          	srl	a0,s1,0x3
    8414:	00098793          	mv	a5,s3
    8418:	00090713          	mv	a4,s2
    841c:	c31ff06f          	j	804c <__subdf3+0x468>
    8420:	02000693          	li	a3,32
    8424:	40f686b3          	sub	a3,a3,a5
    8428:	00000613          	li	a2,0
    842c:	8e9ff06f          	j	7d14 <__subdf3+0x130>
    8430:	00c96833          	or	a6,s2,a2
    8434:	c8080ee3          	beqz	a6,80d0 <__subdf3+0x4ec>
    8438:	00395913          	srl	s2,s2,0x3
    843c:	00000793          	li	a5,0
    8440:	00060713          	mv	a4,a2
    8444:	c59ff06f          	j	809c <__subdf3+0x4b8>
    8448:	00000e13          	li	t3,0
    844c:	7ff00793          	li	a5,2047
    8450:	00080737          	lui	a4,0x80
    8454:	935ff06f          	j	7d88 <__subdf3+0x1a4>
    8458:	01d79713          	sll	a4,a5,0x1d
    845c:	00979793          	sll	a5,a5,0x9
    8460:	01076833          	or	a6,a4,a6
    8464:	00c7d713          	srl	a4,a5,0xc
    8468:	00000793          	li	a5,0
    846c:	91dff06f          	j	7d88 <__subdf3+0x1a4>
    8470:	ae0786e3          	beqz	a5,7f5c <__subdf3+0x378>
    8474:	413f0833          	sub	a6,t5,s3
    8478:	00080793          	mv	a5,a6
    847c:	c6098ee3          	beqz	s3,80f8 <__subdf3+0x514>
    8480:	03800793          	li	a5,56
    8484:	0107ca63          	blt	a5,a6,8498 <__subdf3+0x8b4>
    8488:	008007b7          	lui	a5,0x800
    848c:	00f76733          	or	a4,a4,a5
    8490:	00068413          	mv	s0,a3
    8494:	c8dff06f          	j	8120 <__subdf3+0x53c>
    8498:	00068413          	mv	s0,a3
    849c:	00100513          	li	a0,1
    84a0:	cb1ff06f          	j	8150 <__subdf3+0x56c>
    84a4:	01d71813          	sll	a6,a4,0x1d
    84a8:	00365613          	srl	a2,a2,0x3
    84ac:	00c86833          	or	a6,a6,a2
    84b0:	00375713          	srl	a4,a4,0x3
    84b4:	00000793          	li	a5,0
    84b8:	00068413          	mv	s0,a3
    84bc:	ba5ff06f          	j	8060 <__subdf3+0x47c>
    84c0:	ba078ae3          	beqz	a5,8074 <__subdf3+0x490>
    84c4:	413f06b3          	sub	a3,t5,s3
    84c8:	00099663          	bnez	s3,84d4 <__subdf3+0x8f0>
    84cc:	00068793          	mv	a5,a3
    84d0:	a21ff06f          	j	7ef0 <__subdf3+0x30c>
    84d4:	03800793          	li	a5,56
    84d8:	00100913          	li	s2,1
    84dc:	a6d7c4e3          	blt	a5,a3,7f44 <__subdf3+0x360>
    84e0:	008007b7          	lui	a5,0x800
    84e4:	00f76733          	or	a4,a4,a5
    84e8:	a2dff06f          	j	7f14 <__subdf3+0x330>

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
  54:	72206563          	bltu	zero,sp,77e <_stack_size+0x27e>
  58:	6e75                	.insn	2, 0x6e75
  5a:	7020                	.insn	2, 0x7020
  5c:	7261                	.insn	2, 0x7261
  5e:	6d61                	.insn	2, 0x6d61
  60:	7465                	.insn	2, 0x7465
  62:	7265                	.insn	2, 0x7265
  64:	6f662073          	.insn	4, 0x6f662073
  68:	2072                	.insn	2, 0x2072
  6a:	65726f63          	bltu	tp,s7,6c8 <_stack_size+0x1c8>
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
  96:	6320726f          	jal	tp,76c8 <__muldf3+0x77c>
  9a:	6d65726f          	jal	tp,57770 <__subdf3+0x4fb8c>
  9e:	7261                	.insn	2, 0x7261
  a0:	000a2e6b          	.insn	4, 0x000a2e6b
  a4:	7250                	.insn	2, 0x7250
  a6:	6c69666f          	jal	a2,9676c <__subdf3+0x8eb88>
  aa:	2065                	.insn	2, 0x2065
  ac:	656e6567          	.insn	4, 0x656e6567
  b0:	6172                	.insn	2, 0x6172
  b2:	6974                	.insn	2, 0x6974
  b4:	72206e6f          	jal	t3,67d6 <__divdf3+0x3c6>
  b8:	6e75                	.insn	2, 0x6e75
  ba:	7020                	.insn	2, 0x7020
  bc:	7261                	.insn	2, 0x7261
  be:	6d61                	.insn	2, 0x6d61
  c0:	7465                	.insn	2, 0x7465
  c2:	7265                	.insn	2, 0x7265
  c4:	6f662073          	.insn	4, 0x6f662073
  c8:	2072                	.insn	2, 0x2072
  ca:	65726f63          	bltu	tp,s7,728 <_stack_size+0x228>
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
  fa:	65726f63          	bltu	tp,s7,758 <_stack_size+0x258>
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
 126:	6320726f          	jal	tp,7758 <__fixdfsi+0x7c>
 12a:	6d65726f          	jal	tp,57800 <__subdf3+0x4fc1c>
 12e:	7261                	.insn	2, 0x7261
 130:	000a2e6b          	.insn	4, 0x000a2e6b
 134:	5d75255b          	.insn	4, 0x5d75255b
 138:	5245                	.insn	2, 0x5245
 13a:	4f52                	.insn	2, 0x4f52
 13c:	2152                	.insn	2, 0x2152
 13e:	6c20                	.insn	2, 0x6c20
 140:	7369                	.insn	2, 0x7369
 142:	2074                	.insn	2, 0x2074
 144:	20637263          	bgeu	t1,t1,348 <cmp_complex+0x20>
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
 176:	20637263          	bgeu	t1,t1,37a <cmp_complex+0x52>
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
 1e8:	20736b63          	bltu	t1,t2,3fe <cmp_idx+0x6a>
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
 252:	6120726f          	jal	tp,7864 <__floatunsidf+0x90>
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
 2ec:	7461636f          	jal	t1,16a32 <__subdf3+0xee4e>
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
 390:	7265706f          	j	57ab6 <__subdf3+0x4fed2>
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
 3b4:	7220726f          	jal	tp,7ad6 <modf+0xea>
 3b8:	6e75                	.insn	2, 0x6e75
 3ba:	6120                	.insn	2, 0x6120
 3bc:	646e                	.insn	2, 0x646e
 3be:	7220                	.insn	2, 0x7220
 3c0:	7065                	.insn	2, 0x7065
 3c2:	6974726f          	jal	tp,48258 <__subdf3+0x40674>
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
 414:	7620746f          	jal	s0,7b76 <__fpclassifyd+0x2>
 418:	6c61                	.insn	2, 0x6c61
 41a:	6469                	.insn	2, 0x6469
 41c:	7461                	.insn	2, 0x7461
 41e:	2065                	.insn	2, 0x2065
 420:	7265706f          	j	57b46 <__subdf3+0x4ff62>
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
 448:	706d6f63          	bltu	s10,t1,b66 <core_list_insert_new+0xca>
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

00000488 <seed3_volatile>:
 488:	0066                	.insn	2, 0x0066
	...

0000048c <seed4_volatile>:
 48c:	0001                	.insn	2, 0x0001
	...

00000490 <default_num_contexts>:
 490:	0001                	.insn	2, 0x0001
	...
 49a:	0000                	.insn	2, 0x
 49c:	12d0                	.insn	2, 0x12d0
 49e:	          	bgtz	a4,4e0 <errpat+0x10>

000004a0 <intpat>:
 4a0:	04e0                	.insn	2, 0x04e0
 4a2:	0000                	.insn	2, 0x
 4a4:	04e8                	.insn	2, 0x04e8
 4a6:	0000                	.insn	2, 0x
 4a8:	04f0                	.insn	2, 0x04f0
 4aa:	0000                	.insn	2, 0x
 4ac:	04f8                	.insn	2, 0x04f8
	...

000004b0 <floatpat>:
 4b0:	0500                	.insn	2, 0x0500
 4b2:	0000                	.insn	2, 0x
 4b4:	050c                	.insn	2, 0x050c
 4b6:	0000                	.insn	2, 0x
 4b8:	0518                	.insn	2, 0x0518
 4ba:	0000                	.insn	2, 0x
 4bc:	0524                	.insn	2, 0x0524
	...

000004c0 <scipat>:
 4c0:	0530                	.insn	2, 0x0530
 4c2:	0000                	.insn	2, 0x
 4c4:	053c                	.insn	2, 0x053c
 4c6:	0000                	.insn	2, 0x
 4c8:	0548                	.insn	2, 0x0548
 4ca:	0000                	.insn	2, 0x
 4cc:	0554                	.insn	2, 0x0554
	...

000004d0 <errpat>:
 4d0:	0560                	.insn	2, 0x0560
 4d2:	0000                	.insn	2, 0x
 4d4:	056c                	.insn	2, 0x056c
 4d6:	0000                	.insn	2, 0x
 4d8:	0578                	.insn	2, 0x0578
 4da:	0000                	.insn	2, 0x
 4dc:	0584                	.insn	2, 0x0584
 4de:	0000                	.insn	2, 0x
 4e0:	3035                	.insn	2, 0x3035
 4e2:	3231                	.insn	2, 0x3231
 4e4:	0000                	.insn	2, 0x
 4e6:	0000                	.insn	2, 0x
 4e8:	3231                	.insn	2, 0x3231
 4ea:	00003433          	snez	s0,zero
 4ee:	0000                	.insn	2, 0x
 4f0:	382d                	.insn	2, 0x382d
 4f2:	00003437          	lui	s0,0x3
 4f6:	0000                	.insn	2, 0x
 4f8:	3232312b          	.insn	4, 0x3232312b
 4fc:	0000                	.insn	2, 0x
 4fe:	0000                	.insn	2, 0x
 500:	352e3533          	.insn	4, 0x352e3533
 504:	3434                	.insn	2, 0x3434
 506:	3030                	.insn	2, 0x3030
 508:	0000                	.insn	2, 0x
 50a:	0000                	.insn	2, 0x
 50c:	312e                	.insn	2, 0x312e
 50e:	3332                	.insn	2, 0x3332
 510:	3534                	.insn	2, 0x3534
 512:	3030                	.insn	2, 0x3030
 514:	0000                	.insn	2, 0x
 516:	0000                	.insn	2, 0x
 518:	312d                	.insn	2, 0x312d
 51a:	3031                	.insn	2, 0x3031
 51c:	372e                	.insn	2, 0x372e
 51e:	3030                	.insn	2, 0x3030
 520:	0000                	.insn	2, 0x
 522:	0000                	.insn	2, 0x
 524:	362e302b          	.insn	4, 0x362e302b
 528:	3434                	.insn	2, 0x3434
 52a:	3030                	.insn	2, 0x3030
 52c:	0000                	.insn	2, 0x
 52e:	0000                	.insn	2, 0x
 530:	2e35                	.insn	2, 0x2e35
 532:	3035                	.insn	2, 0x3035
 534:	6530                	.insn	2, 0x6530
 536:	0000332b          	.insn	4, 0x332b
 53a:	0000                	.insn	2, 0x
 53c:	2e2d                	.insn	2, 0x2e2d
 53e:	3231                	.insn	2, 0x3231
 540:	322d6533          	.insn	4, 0x322d6533
 544:	0000                	.insn	2, 0x
 546:	0000                	.insn	2, 0x
 548:	382d                	.insn	2, 0x382d
 54a:	382b6537          	lui	a0,0x382b6
 54e:	00003233          	snez	tp,zero
 552:	0000                	.insn	2, 0x
 554:	362e302b          	.insn	4, 0x362e302b
 558:	2d65                	.insn	2, 0x2d65
 55a:	3231                	.insn	2, 0x3231
 55c:	0000                	.insn	2, 0x
 55e:	0000                	.insn	2, 0x
 560:	3054                	.insn	2, 0x3054
 562:	332e                	.insn	2, 0x332e
 564:	2d65                	.insn	2, 0x2d65
 566:	4631                	.insn	2, 0x4631
 568:	0000                	.insn	2, 0x
 56a:	0000                	.insn	2, 0x
 56c:	542d                	.insn	2, 0x542d
 56e:	542e                	.insn	2, 0x542e
 570:	71542b2b          	.insn	4, 0x71542b2b
 574:	0000                	.insn	2, 0x
 576:	0000                	.insn	2, 0x
 578:	5431                	.insn	2, 0x5431
 57a:	65342e33          	.insn	4, 0x65342e33
 57e:	7a34                	.insn	2, 0x7a34
 580:	0000                	.insn	2, 0x
 582:	0000                	.insn	2, 0x
 584:	302e3433          	.insn	4, 0x302e3433
 588:	2d65                	.insn	2, 0x2d65
 58a:	5e54                	.insn	2, 0x5e54
 58c:	0000                	.insn	2, 0x
 58e:	0000                	.insn	2, 0x
 590:	34a8                	.insn	2, 0x34a8
 592:	0000                	.insn	2, 0x
 594:	3764                	.insn	2, 0x3764
 596:	0000                	.insn	2, 0x
 598:	3538                	.insn	2, 0x3538
 59a:	0000                	.insn	2, 0x
 59c:	3684                	.insn	2, 0x3684
 59e:	0000                	.insn	2, 0x
 5a0:	35b8                	.insn	2, 0x35b8
 5a2:	0000                	.insn	2, 0x
 5a4:	3618                	.insn	2, 0x3618
 5a6:	0000                	.insn	2, 0x
 5a8:	36dc                	.insn	2, 0x36dc
 5aa:	0000                	.insn	2, 0x
 5ac:	3730                	.insn	2, 0x3730
 5ae:	0000                	.insn	2, 0x
 5b0:	3844                	.insn	2, 0x3844
 5b2:	0000                	.insn	2, 0x
 5b4:	37fc                	.insn	2, 0x37fc
 5b6:	0000                	.insn	2, 0x
 5b8:	380c                	.insn	2, 0x380c
 5ba:	0000                	.insn	2, 0x
 5bc:	381c                	.insn	2, 0x381c
 5be:	0000                	.insn	2, 0x
 5c0:	3828                	.insn	2, 0x3828
 5c2:	0000                	.insn	2, 0x
 5c4:	3834                	.insn	2, 0x3834
 5c6:	0000                	.insn	2, 0x
 5c8:	5245                	.insn	2, 0x5245
 5ca:	4f52                	.insn	2, 0x4f52
 5cc:	3a52                	.insn	2, 0x3a52
 5ce:	5020                	.insn	2, 0x5020
 5d0:	656c                	.insn	2, 0x656c
 5d2:	7361                	.insn	2, 0x7361
 5d4:	2065                	.insn	2, 0x2065
 5d6:	6f6d                	.insn	2, 0x6f6d
 5d8:	6964                	.insn	2, 0x6964
 5da:	7966                	.insn	2, 0x7966
 5dc:	7420                	.insn	2, 0x7420
 5de:	6568                	.insn	2, 0x6568
 5e0:	6420                	.insn	2, 0x6420
 5e2:	7461                	.insn	2, 0x7461
 5e4:	7461                	.insn	2, 0x7461
 5e6:	7079                	.insn	2, 0x7079
 5e8:	7365                	.insn	2, 0x7365
 5ea:	6920                	.insn	2, 0x6920
 5ec:	206e                	.insn	2, 0x206e
 5ee:	65726f63          	bltu	tp,s7,c4c <core_list_undo_remove+0x50>
 5f2:	705f 726f 6d74      	.insn	6, 0x6d74726f705f
 5f8:	2e65                	.insn	2, 0x2e65
 5fa:	2168                	.insn	2, 0x2168
 5fc:	000a                	.insn	2, 0x000a
	...
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
 624:	66656463          	bltu	a0,t1,c8c <core_list_find+0x24>
 628:	6a696867          	.insn	4, 0x6a696867
 62c:	6e6d6c6b          	.insn	4, 0x6e6d6c6b
 630:	7271706f          	j	18556 <__subdf3+0x10972>
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
 670:	5484                	.insn	2, 0x5484
 672:	0000                	.insn	2, 0x
 674:	54b4                	.insn	2, 0x54b4
 676:	0000                	.insn	2, 0x
 678:	54b4                	.insn	2, 0x54b4
 67a:	0000                	.insn	2, 0x
 67c:	5494                	.insn	2, 0x5494
 67e:	0000                	.insn	2, 0x
 680:	54b4                	.insn	2, 0x54b4
 682:	0000                	.insn	2, 0x
 684:	54b4                	.insn	2, 0x54b4
 686:	0000                	.insn	2, 0x
 688:	54b4                	.insn	2, 0x54b4
 68a:	0000                	.insn	2, 0x
 68c:	54b4                	.insn	2, 0x54b4
 68e:	0000                	.insn	2, 0x
 690:	54b4                	.insn	2, 0x54b4
 692:	0000                	.insn	2, 0x
 694:	54b4                	.insn	2, 0x54b4
 696:	0000                	.insn	2, 0x
 698:	54b4                	.insn	2, 0x54b4
 69a:	0000                	.insn	2, 0x
 69c:	5474                	.insn	2, 0x5474
 69e:	0000                	.insn	2, 0x
 6a0:	54b4                	.insn	2, 0x54b4
 6a2:	0000                	.insn	2, 0x
 6a4:	5464                	.insn	2, 0x5464
 6a6:	0000                	.insn	2, 0x
 6a8:	54b4                	.insn	2, 0x54b4
 6aa:	0000                	.insn	2, 0x
 6ac:	54b4                	.insn	2, 0x54b4
 6ae:	0000                	.insn	2, 0x
 6b0:	54a4                	.insn	2, 0x54a4
 6b2:	0000                	.insn	2, 0x
 6b4:	5808                	.insn	2, 0x5808
 6b6:	0000                	.insn	2, 0x
 6b8:	5908                	.insn	2, 0x5908
 6ba:	0000                	.insn	2, 0x
 6bc:	5908                	.insn	2, 0x5908
 6be:	0000                	.insn	2, 0x
 6c0:	5908                	.insn	2, 0x5908
 6c2:	0000                	.insn	2, 0x
 6c4:	5908                	.insn	2, 0x5908
 6c6:	0000                	.insn	2, 0x
 6c8:	5908                	.insn	2, 0x5908
 6ca:	0000                	.insn	2, 0x
 6cc:	5908                	.insn	2, 0x5908
 6ce:	0000                	.insn	2, 0x
 6d0:	5908                	.insn	2, 0x5908
 6d2:	0000                	.insn	2, 0x
 6d4:	5908                	.insn	2, 0x5908
 6d6:	0000                	.insn	2, 0x
 6d8:	5908                	.insn	2, 0x5908
 6da:	0000                	.insn	2, 0x
 6dc:	5908                	.insn	2, 0x5908
 6de:	0000                	.insn	2, 0x
 6e0:	5908                	.insn	2, 0x5908
 6e2:	0000                	.insn	2, 0x
 6e4:	5908                	.insn	2, 0x5908
 6e6:	0000                	.insn	2, 0x
 6e8:	5908                	.insn	2, 0x5908
 6ea:	0000                	.insn	2, 0x
 6ec:	5908                	.insn	2, 0x5908
 6ee:	0000                	.insn	2, 0x
 6f0:	5908                	.insn	2, 0x5908
 6f2:	0000                	.insn	2, 0x
 6f4:	5908                	.insn	2, 0x5908
 6f6:	0000                	.insn	2, 0x
 6f8:	5908                	.insn	2, 0x5908
 6fa:	0000                	.insn	2, 0x
 6fc:	5908                	.insn	2, 0x5908
 6fe:	0000                	.insn	2, 0x
 700:	5908                	.insn	2, 0x5908
 702:	0000                	.insn	2, 0x
 704:	5908                	.insn	2, 0x5908
 706:	0000                	.insn	2, 0x
 708:	5908                	.insn	2, 0x5908
 70a:	0000                	.insn	2, 0x
 70c:	5908                	.insn	2, 0x5908
 70e:	0000                	.insn	2, 0x
 710:	588c                	.insn	2, 0x588c
 712:	0000                	.insn	2, 0x
 714:	5908                	.insn	2, 0x5908
 716:	0000                	.insn	2, 0x
 718:	5908                	.insn	2, 0x5908
 71a:	0000                	.insn	2, 0x
 71c:	5908                	.insn	2, 0x5908
 71e:	0000                	.insn	2, 0x
 720:	5908                	.insn	2, 0x5908
 722:	0000                	.insn	2, 0x
 724:	5908                	.insn	2, 0x5908
 726:	0000                	.insn	2, 0x
 728:	5908                	.insn	2, 0x5908
 72a:	0000                	.insn	2, 0x
 72c:	5908                	.insn	2, 0x5908
 72e:	0000                	.insn	2, 0x
 730:	5908                	.insn	2, 0x5908
 732:	0000                	.insn	2, 0x
 734:	5814                	.insn	2, 0x5814
 736:	0000                	.insn	2, 0x
 738:	5908                	.insn	2, 0x5908
 73a:	0000                	.insn	2, 0x
 73c:	5644                	.insn	2, 0x5644
 73e:	0000                	.insn	2, 0x
 740:	58a4                	.insn	2, 0x58a4
 742:	0000                	.insn	2, 0x
 744:	5908                	.insn	2, 0x5908
 746:	0000                	.insn	2, 0x
 748:	58b4                	.insn	2, 0x58b4
 74a:	0000                	.insn	2, 0x
 74c:	5908                	.insn	2, 0x5908
 74e:	0000                	.insn	2, 0x
 750:	5908                	.insn	2, 0x5908
 752:	0000                	.insn	2, 0x
 754:	58a4                	.insn	2, 0x58a4
 756:	0000                	.insn	2, 0x
 758:	5908                	.insn	2, 0x5908
 75a:	0000                	.insn	2, 0x
 75c:	5908                	.insn	2, 0x5908
 75e:	0000                	.insn	2, 0x
 760:	5908                	.insn	2, 0x5908
 762:	0000                	.insn	2, 0x
 764:	5908                	.insn	2, 0x5908
 766:	0000                	.insn	2, 0x
 768:	5908                	.insn	2, 0x5908
 76a:	0000                	.insn	2, 0x
 76c:	5880                	.insn	2, 0x5880
 76e:	0000                	.insn	2, 0x
 770:	57b4                	.insn	2, 0x57b4
 772:	0000                	.insn	2, 0x
 774:	5908                	.insn	2, 0x5908
 776:	0000                	.insn	2, 0x
 778:	5908                	.insn	2, 0x5908
 77a:	0000                	.insn	2, 0x
 77c:	56d0                	.insn	2, 0x56d0
 77e:	0000                	.insn	2, 0x
 780:	5908                	.insn	2, 0x5908
 782:	0000                	.insn	2, 0x
 784:	5964                	.insn	2, 0x5964
 786:	0000                	.insn	2, 0x
 788:	5908                	.insn	2, 0x5908
 78a:	0000                	.insn	2, 0x
 78c:	5908                	.insn	2, 0x5908
 78e:	0000                	.insn	2, 0x
 790:	5898                	.insn	2, 0x5898
	...

00000794 <digits>:
 794:	0618                	.insn	2, 0x0618
	...

00000798 <upper_digits>:
 798:	0640                	.insn	2, 0x0640
 79a:	0000                	.insn	2, 0x
 79c:	5f84                	.insn	2, 0x5f84
 79e:	0000                	.insn	2, 0x
 7a0:	5e30                	.insn	2, 0x5e30
 7a2:	0000                	.insn	2, 0x
 7a4:	5ddc                	.insn	2, 0x5ddc
 7a6:	0000                	.insn	2, 0x
 7a8:	5f30                	.insn	2, 0x5f30
 7aa:	0000                	.insn	2, 0x
 7ac:	5ddc                	.insn	2, 0x5ddc
 7ae:	0000                	.insn	2, 0x
 7b0:	5e40                	.insn	2, 0x5e40
 7b2:	0000                	.insn	2, 0x
 7b4:	5ddc                	.insn	2, 0x5ddc
 7b6:	0000                	.insn	2, 0x
 7b8:	5f30                	.insn	2, 0x5f30
 7ba:	0000                	.insn	2, 0x
 7bc:	5e30                	.insn	2, 0x5e30
 7be:	0000                	.insn	2, 0x
 7c0:	5e30                	.insn	2, 0x5e30
 7c2:	0000                	.insn	2, 0x
 7c4:	5e40                	.insn	2, 0x5e40
 7c6:	0000                	.insn	2, 0x
 7c8:	5f30                	.insn	2, 0x5f30
 7ca:	0000                	.insn	2, 0x
 7cc:	5ebc                	.insn	2, 0x5ebc
 7ce:	0000                	.insn	2, 0x
 7d0:	5ebc                	.insn	2, 0x5ebc
 7d2:	0000                	.insn	2, 0x
 7d4:	5ebc                	.insn	2, 0x5ebc
 7d6:	0000                	.insn	2, 0x
 7d8:	5e40                	.insn	2, 0x5e40
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
  1e:	32727363          	bgeu	tp,t2,344 <cmp_complex+0x1c>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

