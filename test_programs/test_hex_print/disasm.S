
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	02000293          	li	t0,32
  10:	02400313          	li	t1,36

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
  48:	224000ef          	jal	26c <main>

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
 12c:	02002783          	lw	a5,32(zero) # 20 <int_count>
 130:	00178713          	add	a4,a5,1
 134:	02e02023          	sw	a4,32(zero) # 20 <int_count>
 138:	08000737          	lui	a4,0x8000
 13c:	040007b7          	lui	a5,0x4000
 140:	00072703          	lw	a4,0(a4) # 8000000 <_gbl_ptr+0x7fff800>
 144:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 148:	00000013          	nop
 14c:	00c12403          	lw	s0,12(sp)
 150:	01010113          	add	sp,sp,16
 154:	00008067          	ret

00000158 <timer_init>:
 158:	ff010113          	add	sp,sp,-16
 15c:	00812623          	sw	s0,12(sp)
 160:	01010413          	add	s0,sp,16
 164:	080007b7          	lui	a5,0x8000
 168:	00100713          	li	a4,1
 16c:	02e7a223          	sw	a4,36(a5) # 8000024 <_gbl_ptr+0x7fff824>
 170:	080007b7          	lui	a5,0x8000
 174:	0207a223          	sw	zero,36(a5) # 8000024 <_gbl_ptr+0x7fff824>
 178:	080007b7          	lui	a5,0x8000
 17c:	00200713          	li	a4,2
 180:	00e7a823          	sw	a4,16(a5) # 8000010 <_gbl_ptr+0x7fff810>
 184:	080007b7          	lui	a5,0x8000
 188:	00018737          	lui	a4,0x18
 18c:	6a070713          	add	a4,a4,1696 # 186a0 <_gbl_ptr+0x17ea0>
 190:	00e7a423          	sw	a4,8(a5) # 8000008 <_gbl_ptr+0x7fff808>
 194:	00000013          	nop
 198:	00c12403          	lw	s0,12(sp)
 19c:	01010113          	add	sp,sp,16
 1a0:	00008067          	ret

000001a4 <print>:
 1a4:	fe010113          	add	sp,sp,-32
 1a8:	00812e23          	sw	s0,28(sp)
 1ac:	02010413          	add	s0,sp,32
 1b0:	fea42623          	sw	a0,-20(s0)
 1b4:	feb42423          	sw	a1,-24(s0)
 1b8:	fe842703          	lw	a4,-24(s0)
 1bc:	00700793          	li	a5,7
 1c0:	08e7ee63          	bltu	a5,a4,25c <print+0xb8>
 1c4:	fe842783          	lw	a5,-24(s0)
 1c8:	00279713          	sll	a4,a5,0x2
 1cc:	00000793          	li	a5,0
 1d0:	00f707b3          	add	a5,a4,a5
 1d4:	0007a783          	lw	a5,0(a5)
 1d8:	00078067          	jr	a5
 1dc:	040007b7          	lui	a5,0x4000
 1e0:	fec42703          	lw	a4,-20(s0)
 1e4:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 1e8:	0740006f          	j	25c <print+0xb8>
 1ec:	040007b7          	lui	a5,0x4000
 1f0:	fec42703          	lw	a4,-20(s0)
 1f4:	00e7a223          	sw	a4,4(a5) # 4000004 <_gbl_ptr+0x3fff804>
 1f8:	0640006f          	j	25c <print+0xb8>
 1fc:	040007b7          	lui	a5,0x4000
 200:	fec42703          	lw	a4,-20(s0)
 204:	00e7a423          	sw	a4,8(a5) # 4000008 <_gbl_ptr+0x3fff808>
 208:	0540006f          	j	25c <print+0xb8>
 20c:	040007b7          	lui	a5,0x4000
 210:	fec42703          	lw	a4,-20(s0)
 214:	00e7a623          	sw	a4,12(a5) # 400000c <_gbl_ptr+0x3fff80c>
 218:	0440006f          	j	25c <print+0xb8>
 21c:	040007b7          	lui	a5,0x4000
 220:	fec42703          	lw	a4,-20(s0)
 224:	00e7a823          	sw	a4,16(a5) # 4000010 <_gbl_ptr+0x3fff810>
 228:	0340006f          	j	25c <print+0xb8>
 22c:	040007b7          	lui	a5,0x4000
 230:	fec42703          	lw	a4,-20(s0)
 234:	00e7aa23          	sw	a4,20(a5) # 4000014 <_gbl_ptr+0x3fff814>
 238:	0240006f          	j	25c <print+0xb8>
 23c:	040007b7          	lui	a5,0x4000
 240:	fec42703          	lw	a4,-20(s0)
 244:	00e7ac23          	sw	a4,24(a5) # 4000018 <_gbl_ptr+0x3fff818>
 248:	0140006f          	j	25c <print+0xb8>
 24c:	040007b7          	lui	a5,0x4000
 250:	fec42703          	lw	a4,-20(s0)
 254:	00e7ae23          	sw	a4,28(a5) # 400001c <_gbl_ptr+0x3fff81c>
 258:	00000013          	nop
 25c:	00000013          	nop
 260:	01c12403          	lw	s0,28(sp)
 264:	02010113          	add	sp,sp,32
 268:	00008067          	ret

0000026c <main>:
 26c:	ff010113          	add	sp,sp,-16
 270:	00112623          	sw	ra,12(sp)
 274:	00812423          	sw	s0,8(sp)
 278:	01010413          	add	s0,sp,16
 27c:	eddff0ef          	jal	158 <timer_init>
 280:	040007b7          	lui	a5,0x4000
 284:	0ff00713          	li	a4,255
 288:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 28c:	00300593          	li	a1,3
 290:	00100513          	li	a0,1
 294:	f11ff0ef          	jal	1a4 <print>
 298:	00200593          	li	a1,2
 29c:	00e00513          	li	a0,14
 2a0:	f05ff0ef          	jal	1a4 <print>
 2a4:	00100593          	li	a1,1
 2a8:	00a00513          	li	a0,10
 2ac:	ef9ff0ef          	jal	1a4 <print>
 2b0:	00000593          	li	a1,0
 2b4:	00d00513          	li	a0,13
 2b8:	eedff0ef          	jal	1a4 <print>
 2bc:	080007b7          	lui	a5,0x8000
 2c0:	0087a783          	lw	a5,8(a5) # 8000008 <_gbl_ptr+0x7fff808>
 2c4:	00500593          	li	a1,5
 2c8:	00078513          	mv	a0,a5
 2cc:	ed9ff0ef          	jal	1a4 <print>
 2d0:	080007b7          	lui	a5,0x8000
 2d4:	0107a783          	lw	a5,16(a5) # 8000010 <_gbl_ptr+0x7fff810>
 2d8:	00600593          	li	a1,6
 2dc:	00078513          	mv	a0,a5
 2e0:	ec5ff0ef          	jal	1a4 <print>
 2e4:	080007b7          	lui	a5,0x8000
 2e8:	0007a783          	lw	a5,0(a5) # 8000000 <_gbl_ptr+0x7fff800>
 2ec:	00700593          	li	a1,7
 2f0:	00078513          	mv	a0,a5
 2f4:	eb1ff0ef          	jal	1a4 <print>
 2f8:	0000006f          	j	2f8 <_stack_size+0x78>

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	01dc                	.insn	2, 0x01dc
   2:	0000                	.insn	2, 0x
   4:	01ec                	.insn	2, 0x01ec
   6:	0000                	.insn	2, 0x
   8:	01fc                	.insn	2, 0x01fc
   a:	0000                	.insn	2, 0x
   c:	020c                	.insn	2, 0x020c
   e:	0000                	.insn	2, 0x
  10:	021c                	.insn	2, 0x021c
  12:	0000                	.insn	2, 0x
  14:	022c                	.insn	2, 0x022c
  16:	0000                	.insn	2, 0x
  18:	023c                	.insn	2, 0x023c
  1a:	0000                	.insn	2, 0x
  1c:	024c                	.insn	2, 0x024c
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

