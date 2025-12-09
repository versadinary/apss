
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
 130:	0007a703          	lw	a4,0(a5) # 3000000 <_gbl_ptr+0x2fff800>
 134:	0ce02423          	sw	a4,200(zero) # c8 <sc>
 138:	00000013          	nop
 13c:	00c12403          	lw	s0,12(sp)
 140:	01010113          	add	sp,sp,16
 144:	00008067          	ret

00000148 <ps2_to_int>:
 148:	fe010113          	add	sp,sp,-32
 14c:	00812e23          	sw	s0,28(sp)
 150:	02010413          	add	s0,sp,32
 154:	fea42623          	sw	a0,-20(s0)
 158:	fec42783          	lw	a5,-20(s0)
 15c:	feb78793          	add	a5,a5,-21
 160:	03100713          	li	a4,49
 164:	08f76c63          	bltu	a4,a5,1fc <ps2_to_int+0xb4>
 168:	00279713          	sll	a4,a5,0x2
 16c:	00000793          	li	a5,0
 170:	00f707b3          	add	a5,a4,a5
 174:	0007a783          	lw	a5,0(a5)
 178:	00078067          	jr	a5
 17c:	00000793          	li	a5,0
 180:	0800006f          	j	200 <ps2_to_int+0xb8>
 184:	00100793          	li	a5,1
 188:	0780006f          	j	200 <ps2_to_int+0xb8>
 18c:	00200793          	li	a5,2
 190:	0700006f          	j	200 <ps2_to_int+0xb8>
 194:	00300793          	li	a5,3
 198:	0680006f          	j	200 <ps2_to_int+0xb8>
 19c:	00400793          	li	a5,4
 1a0:	0600006f          	j	200 <ps2_to_int+0xb8>
 1a4:	00500793          	li	a5,5
 1a8:	0580006f          	j	200 <ps2_to_int+0xb8>
 1ac:	00600793          	li	a5,6
 1b0:	0500006f          	j	200 <ps2_to_int+0xb8>
 1b4:	00700793          	li	a5,7
 1b8:	0480006f          	j	200 <ps2_to_int+0xb8>
 1bc:	00800793          	li	a5,8
 1c0:	0400006f          	j	200 <ps2_to_int+0xb8>
 1c4:	00900793          	li	a5,9
 1c8:	0380006f          	j	200 <ps2_to_int+0xb8>
 1cc:	00a00793          	li	a5,10
 1d0:	0300006f          	j	200 <ps2_to_int+0xb8>
 1d4:	00b00793          	li	a5,11
 1d8:	0280006f          	j	200 <ps2_to_int+0xb8>
 1dc:	00c00793          	li	a5,12
 1e0:	0200006f          	j	200 <ps2_to_int+0xb8>
 1e4:	00d00793          	li	a5,13
 1e8:	0180006f          	j	200 <ps2_to_int+0xb8>
 1ec:	00e00793          	li	a5,14
 1f0:	0100006f          	j	200 <ps2_to_int+0xb8>
 1f4:	00f00793          	li	a5,15
 1f8:	0080006f          	j	200 <ps2_to_int+0xb8>
 1fc:	00000793          	li	a5,0
 200:	00078513          	mv	a0,a5
 204:	01c12403          	lw	s0,28(sp)
 208:	02010113          	add	sp,sp,32
 20c:	00008067          	ret

00000210 <scan>:
 210:	fe010113          	add	sp,sp,-32
 214:	00112e23          	sw	ra,28(sp)
 218:	00812c23          	sw	s0,24(sp)
 21c:	02010413          	add	s0,sp,32
 220:	fea42623          	sw	a0,-20(s0)
 224:	0c002423          	sw	zero,200(zero) # c8 <sc>
 228:	00000013          	nop
 22c:	0c802783          	lw	a5,200(zero) # c8 <sc>
 230:	fe078ee3          	beqz	a5,22c <scan+0x1c>
 234:	00000013          	nop
 238:	0c802703          	lw	a4,200(zero) # c8 <sc>
 23c:	0f000793          	li	a5,240
 240:	fef71ce3          	bne	a4,a5,238 <scan+0x28>
 244:	00000013          	nop
 248:	0c802703          	lw	a4,200(zero) # c8 <sc>
 24c:	0f000793          	li	a5,240
 250:	fef70ce3          	beq	a4,a5,248 <scan+0x38>
 254:	0c802703          	lw	a4,200(zero) # c8 <sc>
 258:	05a00793          	li	a5,90
 25c:	00f71663          	bne	a4,a5,268 <scan+0x58>
 260:	00100793          	li	a5,1
 264:	0380006f          	j	29c <_stack_size+0x1c>
 268:	0c802703          	lw	a4,200(zero) # c8 <sc>
 26c:	07600793          	li	a5,118
 270:	00f71663          	bne	a4,a5,27c <scan+0x6c>
 274:	00200793          	li	a5,2
 278:	0240006f          	j	29c <_stack_size+0x1c>
 27c:	0c802783          	lw	a5,200(zero) # c8 <sc>
 280:	00078513          	mv	a0,a5
 284:	ec5ff0ef          	jal	148 <ps2_to_int>
 288:	00050713          	mv	a4,a0
 28c:	fec42783          	lw	a5,-20(s0)
 290:	00e7a023          	sw	a4,0(a5)
 294:	0c002423          	sw	zero,200(zero) # c8 <sc>
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
 360:	eb1ff0ef          	jal	210 <scan>
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
   0:	01f4                	.insn	2, 0x01f4
   2:	0000                	.insn	2, 0x
   4:	0184                	.insn	2, 0x0184
   6:	0000                	.insn	2, 0x
   8:	01fc                	.insn	2, 0x01fc
   a:	0000                	.insn	2, 0x
   c:	01fc                	.insn	2, 0x01fc
   e:	0000                	.insn	2, 0x
  10:	01fc                	.insn	2, 0x01fc
  12:	0000                	.insn	2, 0x
  14:	01fc                	.insn	2, 0x01fc
  16:	0000                	.insn	2, 0x
  18:	01fc                	.insn	2, 0x01fc
  1a:	0000                	.insn	2, 0x
  1c:	01cc                	.insn	2, 0x01cc
  1e:	0000                	.insn	2, 0x
  20:	01fc                	.insn	2, 0x01fc
  22:	0000                	.insn	2, 0x
  24:	018c                	.insn	2, 0x018c
  26:	0000                	.insn	2, 0x
  28:	01fc                	.insn	2, 0x01fc
  2a:	0000                	.insn	2, 0x
  2c:	01fc                	.insn	2, 0x01fc
  2e:	0000                	.insn	2, 0x
  30:	01dc                	.insn	2, 0x01dc
  32:	0000                	.insn	2, 0x
  34:	01fc                	.insn	2, 0x01fc
  36:	0000                	.insn	2, 0x
  38:	01e4                	.insn	2, 0x01e4
  3a:	0000                	.insn	2, 0x
  3c:	01ec                	.insn	2, 0x01ec
  3e:	0000                	.insn	2, 0x
  40:	019c                	.insn	2, 0x019c
  42:	0000                	.insn	2, 0x
  44:	0194                	.insn	2, 0x0194
  46:	0000                	.insn	2, 0x
  48:	01fc                	.insn	2, 0x01fc
  4a:	0000                	.insn	2, 0x
  4c:	01fc                	.insn	2, 0x01fc
  4e:	0000                	.insn	2, 0x
  50:	01fc                	.insn	2, 0x01fc
  52:	0000                	.insn	2, 0x
  54:	01fc                	.insn	2, 0x01fc
  56:	0000                	.insn	2, 0x
  58:	01fc                	.insn	2, 0x01fc
  5a:	0000                	.insn	2, 0x
  5c:	01fc                	.insn	2, 0x01fc
  5e:	0000                	.insn	2, 0x
  60:	01fc                	.insn	2, 0x01fc
  62:	0000                	.insn	2, 0x
  64:	01a4                	.insn	2, 0x01a4
  66:	0000                	.insn	2, 0x
  68:	01fc                	.insn	2, 0x01fc
  6a:	0000                	.insn	2, 0x
  6c:	01fc                	.insn	2, 0x01fc
  6e:	0000                	.insn	2, 0x
  70:	01fc                	.insn	2, 0x01fc
  72:	0000                	.insn	2, 0x
  74:	01d4                	.insn	2, 0x01d4
  76:	0000                	.insn	2, 0x
  78:	01fc                	.insn	2, 0x01fc
  7a:	0000                	.insn	2, 0x
  7c:	01fc                	.insn	2, 0x01fc
  7e:	0000                	.insn	2, 0x
  80:	01fc                	.insn	2, 0x01fc
  82:	0000                	.insn	2, 0x
  84:	01ac                	.insn	2, 0x01ac
  86:	0000                	.insn	2, 0x
  88:	01fc                	.insn	2, 0x01fc
  8a:	0000                	.insn	2, 0x
  8c:	01fc                	.insn	2, 0x01fc
  8e:	0000                	.insn	2, 0x
  90:	01fc                	.insn	2, 0x01fc
  92:	0000                	.insn	2, 0x
  94:	01fc                	.insn	2, 0x01fc
  96:	0000                	.insn	2, 0x
  98:	01fc                	.insn	2, 0x01fc
  9a:	0000                	.insn	2, 0x
  9c:	01fc                	.insn	2, 0x01fc
  9e:	0000                	.insn	2, 0x
  a0:	01b4                	.insn	2, 0x01b4
  a2:	0000                	.insn	2, 0x
  a4:	01bc                	.insn	2, 0x01bc
  a6:	0000                	.insn	2, 0x
  a8:	01fc                	.insn	2, 0x01fc
  aa:	0000                	.insn	2, 0x
  ac:	01fc                	.insn	2, 0x01fc
  ae:	0000                	.insn	2, 0x
  b0:	01fc                	.insn	2, 0x01fc
  b2:	0000                	.insn	2, 0x
  b4:	01fc                	.insn	2, 0x01fc
  b6:	0000                	.insn	2, 0x
  b8:	01fc                	.insn	2, 0x01fc
  ba:	0000                	.insn	2, 0x
  bc:	01fc                	.insn	2, 0x01fc
  be:	0000                	.insn	2, 0x
  c0:	017c                	.insn	2, 0x017c
  c2:	0000                	.insn	2, 0x
  c4:	01c4                	.insn	2, 0x01c4
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

