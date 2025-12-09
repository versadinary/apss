
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	0c800293          	li	t0,200
  10:	0cc00313          	li	t1,204

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
  48:	2d4000ef          	jal	31c <main>

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
 12c:	030007b7          	lui	a5,0x3000
 130:	0007a783          	lw	a5,0(a5) # 3000000 <_gbl_ptr+0x2fff800>
 134:	00078713          	mv	a4,a5
 138:	0ce02423          	sw	a4,200(zero) # c8 <sc>
 13c:	00000013          	nop
 140:	00c12403          	lw	s0,12(sp)
 144:	01010113          	add	sp,sp,16
 148:	00008067          	ret

0000014c <ps2_to_int>:
 14c:	fe010113          	add	sp,sp,-32
 150:	00812e23          	sw	s0,28(sp)
 154:	02010413          	add	s0,sp,32
 158:	fea42623          	sw	a0,-20(s0)
 15c:	fec42783          	lw	a5,-20(s0)
 160:	feb78793          	add	a5,a5,-21
 164:	03100713          	li	a4,49
 168:	08f76c63          	bltu	a4,a5,200 <ps2_to_int+0xb4>
 16c:	00279713          	sll	a4,a5,0x2
 170:	00000793          	li	a5,0
 174:	00f707b3          	add	a5,a4,a5
 178:	0007a783          	lw	a5,0(a5)
 17c:	00078067          	jr	a5
 180:	00000793          	li	a5,0
 184:	0800006f          	j	204 <ps2_to_int+0xb8>
 188:	00100793          	li	a5,1
 18c:	0780006f          	j	204 <ps2_to_int+0xb8>
 190:	00200793          	li	a5,2
 194:	0700006f          	j	204 <ps2_to_int+0xb8>
 198:	00300793          	li	a5,3
 19c:	0680006f          	j	204 <ps2_to_int+0xb8>
 1a0:	00400793          	li	a5,4
 1a4:	0600006f          	j	204 <ps2_to_int+0xb8>
 1a8:	00500793          	li	a5,5
 1ac:	0580006f          	j	204 <ps2_to_int+0xb8>
 1b0:	00600793          	li	a5,6
 1b4:	0500006f          	j	204 <ps2_to_int+0xb8>
 1b8:	00700793          	li	a5,7
 1bc:	0480006f          	j	204 <ps2_to_int+0xb8>
 1c0:	00800793          	li	a5,8
 1c4:	0400006f          	j	204 <ps2_to_int+0xb8>
 1c8:	00900793          	li	a5,9
 1cc:	0380006f          	j	204 <ps2_to_int+0xb8>
 1d0:	00a00793          	li	a5,10
 1d4:	0300006f          	j	204 <ps2_to_int+0xb8>
 1d8:	00b00793          	li	a5,11
 1dc:	0280006f          	j	204 <ps2_to_int+0xb8>
 1e0:	00c00793          	li	a5,12
 1e4:	0200006f          	j	204 <ps2_to_int+0xb8>
 1e8:	00d00793          	li	a5,13
 1ec:	0180006f          	j	204 <ps2_to_int+0xb8>
 1f0:	00e00793          	li	a5,14
 1f4:	0100006f          	j	204 <ps2_to_int+0xb8>
 1f8:	00f00793          	li	a5,15
 1fc:	0080006f          	j	204 <ps2_to_int+0xb8>
 200:	00000793          	li	a5,0
 204:	00078513          	mv	a0,a5
 208:	01c12403          	lw	s0,28(sp)
 20c:	02010113          	add	sp,sp,32
 210:	00008067          	ret

00000214 <scan>:
 214:	fe010113          	add	sp,sp,-32
 218:	00112e23          	sw	ra,28(sp)
 21c:	00812c23          	sw	s0,24(sp)
 220:	02010413          	add	s0,sp,32
 224:	fea42623          	sw	a0,-20(s0)
 228:	0c002423          	sw	zero,200(zero) # c8 <sc>
 22c:	00000013          	nop
 230:	0c802783          	lw	a5,200(zero) # c8 <sc>
 234:	fe078ee3          	beqz	a5,230 <scan+0x1c>
 238:	00000013          	nop
 23c:	0c802703          	lw	a4,200(zero) # c8 <sc>
 240:	0f000793          	li	a5,240
 244:	fef71ce3          	bne	a4,a5,23c <scan+0x28>
 248:	00000013          	nop
 24c:	0c802703          	lw	a4,200(zero) # c8 <sc>
 250:	0f000793          	li	a5,240
 254:	fef70ce3          	beq	a4,a5,24c <scan+0x38>
 258:	0c802703          	lw	a4,200(zero) # c8 <sc>
 25c:	05a00793          	li	a5,90
 260:	00f71663          	bne	a4,a5,26c <scan+0x58>
 264:	00100793          	li	a5,1
 268:	0340006f          	j	29c <_stack_size+0x1c>
 26c:	0c802703          	lw	a4,200(zero) # c8 <sc>
 270:	07600793          	li	a5,118
 274:	00f71663          	bne	a4,a5,280 <_stack_size>
 278:	00200793          	li	a5,2
 27c:	0200006f          	j	29c <_stack_size+0x1c>
 280:	0c802783          	lw	a5,200(zero) # c8 <sc>
 284:	00078513          	mv	a0,a5
 288:	ec5ff0ef          	jal	14c <ps2_to_int>
 28c:	00050713          	mv	a4,a0
 290:	fec42783          	lw	a5,-20(s0)
 294:	00e7a023          	sw	a4,0(a5)
 298:	00000793          	li	a5,0
 29c:	00078513          	mv	a0,a5
 2a0:	01c12083          	lw	ra,28(sp)
 2a4:	01812403          	lw	s0,24(sp)
 2a8:	02010113          	add	sp,sp,32
 2ac:	00008067          	ret

000002b0 <print>:
 2b0:	fe010113          	add	sp,sp,-32
 2b4:	00812e23          	sw	s0,28(sp)
 2b8:	02010413          	add	s0,sp,32
 2bc:	fea42623          	sw	a0,-20(s0)
 2c0:	feb42423          	sw	a1,-24(s0)
 2c4:	040007b7          	lui	a5,0x4000
 2c8:	00078713          	mv	a4,a5
 2cc:	fe842783          	lw	a5,-24(s0)
 2d0:	00279793          	sll	a5,a5,0x2
 2d4:	00f707b3          	add	a5,a4,a5
 2d8:	fec42703          	lw	a4,-20(s0)
 2dc:	00072703          	lw	a4,0(a4)
 2e0:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 2e4:	040007b7          	lui	a5,0x4000
 2e8:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 2ec:	040007b7          	lui	a5,0x4000
 2f0:	00171713          	sll	a4,a4,0x1
 2f4:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 2f8:	040007b7          	lui	a5,0x4000
 2fc:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 300:	040007b7          	lui	a5,0x4000
 304:	00170713          	add	a4,a4,1
 308:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 30c:	00000013          	nop
 310:	01c12403          	lw	s0,28(sp)
 314:	02010113          	add	sp,sp,32
 318:	00008067          	ret

0000031c <main>:
 31c:	fe010113          	add	sp,sp,-32
 320:	00112e23          	sw	ra,28(sp)
 324:	00812c23          	sw	s0,24(sp)
 328:	02010413          	add	s0,sp,32
 32c:	fe042423          	sw	zero,-24(s0)
 330:	fe042623          	sw	zero,-20(s0)
 334:	0240006f          	j	358 <main+0x3c>
 338:	fec42783          	lw	a5,-20(s0)
 33c:	00178713          	add	a4,a5,1
 340:	fee42623          	sw	a4,-20(s0)
 344:	00078713          	mv	a4,a5
 348:	fe840793          	add	a5,s0,-24
 34c:	00070593          	mv	a1,a4
 350:	00078513          	mv	a0,a5
 354:	f5dff0ef          	jal	2b0 <print>
 358:	fe840793          	add	a5,s0,-24
 35c:	00078513          	mv	a0,a5
 360:	eb5ff0ef          	jal	214 <scan>
 364:	00050793          	mv	a5,a0
 368:	fcf058e3          	blez	a5,338 <main+0x1c>
 36c:	00000793          	li	a5,0
 370:	00078513          	mv	a0,a5
 374:	01c12083          	lw	ra,28(sp)
 378:	01812403          	lw	s0,24(sp)
 37c:	02010113          	add	sp,sp,32
 380:	00008067          	ret

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	01f8                	.insn	2, 0x01f8
   2:	0000                	.insn	2, 0x
   4:	0188                	.insn	2, 0x0188
   6:	0000                	.insn	2, 0x
   8:	0200                	.insn	2, 0x0200
   a:	0000                	.insn	2, 0x
   c:	0200                	.insn	2, 0x0200
   e:	0000                	.insn	2, 0x
  10:	0200                	.insn	2, 0x0200
  12:	0000                	.insn	2, 0x
  14:	0200                	.insn	2, 0x0200
  16:	0000                	.insn	2, 0x
  18:	0200                	.insn	2, 0x0200
  1a:	0000                	.insn	2, 0x
  1c:	01d0                	.insn	2, 0x01d0
  1e:	0000                	.insn	2, 0x
  20:	0200                	.insn	2, 0x0200
  22:	0000                	.insn	2, 0x
  24:	0190                	.insn	2, 0x0190
  26:	0000                	.insn	2, 0x
  28:	0200                	.insn	2, 0x0200
  2a:	0000                	.insn	2, 0x
  2c:	0200                	.insn	2, 0x0200
  2e:	0000                	.insn	2, 0x
  30:	01e0                	.insn	2, 0x01e0
  32:	0000                	.insn	2, 0x
  34:	0200                	.insn	2, 0x0200
  36:	0000                	.insn	2, 0x
  38:	01e8                	.insn	2, 0x01e8
  3a:	0000                	.insn	2, 0x
  3c:	01f0                	.insn	2, 0x01f0
  3e:	0000                	.insn	2, 0x
  40:	01a0                	.insn	2, 0x01a0
  42:	0000                	.insn	2, 0x
  44:	0198                	.insn	2, 0x0198
  46:	0000                	.insn	2, 0x
  48:	0200                	.insn	2, 0x0200
  4a:	0000                	.insn	2, 0x
  4c:	0200                	.insn	2, 0x0200
  4e:	0000                	.insn	2, 0x
  50:	0200                	.insn	2, 0x0200
  52:	0000                	.insn	2, 0x
  54:	0200                	.insn	2, 0x0200
  56:	0000                	.insn	2, 0x
  58:	0200                	.insn	2, 0x0200
  5a:	0000                	.insn	2, 0x
  5c:	0200                	.insn	2, 0x0200
  5e:	0000                	.insn	2, 0x
  60:	0200                	.insn	2, 0x0200
  62:	0000                	.insn	2, 0x
  64:	01a8                	.insn	2, 0x01a8
  66:	0000                	.insn	2, 0x
  68:	0200                	.insn	2, 0x0200
  6a:	0000                	.insn	2, 0x
  6c:	0200                	.insn	2, 0x0200
  6e:	0000                	.insn	2, 0x
  70:	0200                	.insn	2, 0x0200
  72:	0000                	.insn	2, 0x
  74:	01d8                	.insn	2, 0x01d8
  76:	0000                	.insn	2, 0x
  78:	0200                	.insn	2, 0x0200
  7a:	0000                	.insn	2, 0x
  7c:	0200                	.insn	2, 0x0200
  7e:	0000                	.insn	2, 0x
  80:	0200                	.insn	2, 0x0200
  82:	0000                	.insn	2, 0x
  84:	01b0                	.insn	2, 0x01b0
  86:	0000                	.insn	2, 0x
  88:	0200                	.insn	2, 0x0200
  8a:	0000                	.insn	2, 0x
  8c:	0200                	.insn	2, 0x0200
  8e:	0000                	.insn	2, 0x
  90:	0200                	.insn	2, 0x0200
  92:	0000                	.insn	2, 0x
  94:	0200                	.insn	2, 0x0200
  96:	0000                	.insn	2, 0x
  98:	0200                	.insn	2, 0x0200
  9a:	0000                	.insn	2, 0x
  9c:	0200                	.insn	2, 0x0200
  9e:	0000                	.insn	2, 0x
  a0:	01b8                	.insn	2, 0x01b8
  a2:	0000                	.insn	2, 0x
  a4:	01c0                	.insn	2, 0x01c0
  a6:	0000                	.insn	2, 0x
  a8:	0200                	.insn	2, 0x0200
  aa:	0000                	.insn	2, 0x
  ac:	0200                	.insn	2, 0x0200
  ae:	0000                	.insn	2, 0x
  b0:	0200                	.insn	2, 0x0200
  b2:	0000                	.insn	2, 0x
  b4:	0200                	.insn	2, 0x0200
  b6:	0000                	.insn	2, 0x
  b8:	0200                	.insn	2, 0x0200
  ba:	0000                	.insn	2, 0x
  bc:	0200                	.insn	2, 0x0200
  be:	0000                	.insn	2, 0x
  c0:	0180                	.insn	2, 0x0180
  c2:	0000                	.insn	2, 0x
  c4:	01c8                	.insn	2, 0x01c8
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
  1e:	32727363          	bgeu	tp,t2,344 <main+0x28>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

