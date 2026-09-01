
uart_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	00000293          	li	t0,0
  10:	00100313          	li	t1,1

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
  48:	234000ef          	jal	27c <main>

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
  b8:	190000ef          	jal	248 <int_handler>
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

00000120 <init_uart_rx>:
 120:	fe010113          	add	sp,sp,-32
 124:	00812e23          	sw	s0,28(sp)
 128:	02010413          	add	s0,sp,32
 12c:	fea42623          	sw	a0,-20(s0)
 130:	feb42423          	sw	a1,-24(s0)
 134:	fec42223          	sw	a2,-28(s0)
 138:	050007b7          	lui	a5,0x5000
 13c:	fec42703          	lw	a4,-20(s0)
 140:	00e7a623          	sw	a4,12(a5) # 500000c <_gbl_ptr+0x4fff80c>
 144:	050007b7          	lui	a5,0x5000
 148:	fe842703          	lw	a4,-24(s0)
 14c:	00e7a823          	sw	a4,16(a5) # 5000010 <_gbl_ptr+0x4fff810>
 150:	050007b7          	lui	a5,0x5000
 154:	fe442703          	lw	a4,-28(s0)
 158:	00e7aa23          	sw	a4,20(a5) # 5000014 <_gbl_ptr+0x4fff814>
 15c:	00000013          	nop
 160:	01c12403          	lw	s0,28(sp)
 164:	02010113          	add	sp,sp,32
 168:	00008067          	ret

0000016c <init_uart_tx>:
 16c:	fe010113          	add	sp,sp,-32
 170:	00812e23          	sw	s0,28(sp)
 174:	02010413          	add	s0,sp,32
 178:	fea42623          	sw	a0,-20(s0)
 17c:	feb42423          	sw	a1,-24(s0)
 180:	fec42223          	sw	a2,-28(s0)
 184:	060007b7          	lui	a5,0x6000
 188:	fec42703          	lw	a4,-20(s0)
 18c:	00e7a623          	sw	a4,12(a5) # 600000c <_gbl_ptr+0x5fff80c>
 190:	060007b7          	lui	a5,0x6000
 194:	fe842703          	lw	a4,-24(s0)
 198:	00e7a823          	sw	a4,16(a5) # 6000010 <_gbl_ptr+0x5fff810>
 19c:	060007b7          	lui	a5,0x6000
 1a0:	fe442703          	lw	a4,-28(s0)
 1a4:	00e7aa23          	sw	a4,20(a5) # 6000014 <_gbl_ptr+0x5fff814>
 1a8:	00000013          	nop
 1ac:	01c12403          	lw	s0,28(sp)
 1b0:	02010113          	add	sp,sp,32
 1b4:	00008067          	ret

000001b8 <uart_rcv_char>:
 1b8:	fe010113          	add	sp,sp,-32
 1bc:	00812e23          	sw	s0,28(sp)
 1c0:	02010413          	add	s0,sp,32
 1c4:	00000013          	nop
 1c8:	050007b7          	lui	a5,0x5000
 1cc:	0087a783          	lw	a5,8(a5) # 5000008 <_gbl_ptr+0x4fff808>
 1d0:	fe079ce3          	bnez	a5,1c8 <uart_rcv_char+0x10>
 1d4:	050007b7          	lui	a5,0x5000
 1d8:	0007a783          	lw	a5,0(a5) # 5000000 <_gbl_ptr+0x4fff800>
 1dc:	fef407a3          	sb	a5,-17(s0)
 1e0:	fef44783          	lbu	a5,-17(s0)
 1e4:	00078513          	mv	a0,a5
 1e8:	01c12403          	lw	s0,28(sp)
 1ec:	02010113          	add	sp,sp,32
 1f0:	00008067          	ret

000001f4 <uart_send_char>:
 1f4:	fe010113          	add	sp,sp,-32
 1f8:	00812e23          	sw	s0,28(sp)
 1fc:	02010413          	add	s0,sp,32
 200:	00050793          	mv	a5,a0
 204:	fef407a3          	sb	a5,-17(s0)
 208:	00000013          	nop
 20c:	060007b7          	lui	a5,0x6000
 210:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 214:	fe079ce3          	bnez	a5,20c <uart_send_char+0x18>
 218:	060007b7          	lui	a5,0x6000
 21c:	fef44703          	lbu	a4,-17(s0)
 220:	00e7a023          	sw	a4,0(a5) # 6000000 <_gbl_ptr+0x5fff800>
 224:	00000013          	nop
 228:	060007b7          	lui	a5,0x6000
 22c:	0087a783          	lw	a5,8(a5) # 6000008 <_gbl_ptr+0x5fff808>
 230:	fe079ce3          	bnez	a5,228 <uart_send_char+0x34>
 234:	00000013          	nop
 238:	00000013          	nop
 23c:	01c12403          	lw	s0,28(sp)
 240:	02010113          	add	sp,sp,32
 244:	00008067          	ret

00000248 <int_handler>:
 248:	ff010113          	add	sp,sp,-16
 24c:	00112623          	sw	ra,12(sp)
 250:	00812423          	sw	s0,8(sp)
 254:	01010413          	add	s0,sp,16
 258:	f61ff0ef          	jal	1b8 <uart_rcv_char>
 25c:	00050793          	mv	a5,a0
 260:	00078713          	mv	a4,a5
 264:	00e00023          	sb	a4,0(zero) # 0 <_start>
 268:	00000013          	nop
 26c:	00c12083          	lw	ra,12(sp)
 270:	00812403          	lw	s0,8(sp)
 274:	01010113          	add	sp,sp,16
 278:	00008067          	ret

0000027c <main>:
 27c:	ff010113          	add	sp,sp,-16
 280:	00112623          	sw	ra,12(sp)
 284:	00812423          	sw	s0,8(sp)
 288:	01010413          	add	s0,sp,16
 28c:	00100613          	li	a2,1
 290:	00100593          	li	a1,1
 294:	0001c7b7          	lui	a5,0x1c
 298:	20078513          	add	a0,a5,512 # 1c200 <_gbl_ptr+0x1ba00>
 29c:	e85ff0ef          	jal	120 <init_uart_rx>
 2a0:	00100613          	li	a2,1
 2a4:	00100593          	li	a1,1
 2a8:	0001c7b7          	lui	a5,0x1c
 2ac:	20078513          	add	a0,a5,512 # 1c200 <_gbl_ptr+0x1ba00>
 2b0:	ebdff0ef          	jal	16c <init_uart_tx>
 2b4:	050007b7          	lui	a5,0x5000
 2b8:	0047a783          	lw	a5,4(a5) # 5000004 <_gbl_ptr+0x4fff804>
 2bc:	fe078ce3          	beqz	a5,2b4 <_stack_size+0x34>
 2c0:	00004783          	lbu	a5,0(zero) # 0 <_start>
 2c4:	00078513          	mv	a0,a5
 2c8:	f2dff0ef          	jal	1f4 <uart_send_char>
 2cc:	fe9ff06f          	j	2b4 <_stack_size+0x34>

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

