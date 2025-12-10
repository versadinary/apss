
result.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	80018193          	add	gp,gp,-2048 # 800 <_gbl_ptr>
   8:	58000113          	li	sp,1408
   c:	0c400293          	li	t0,196
  10:	0c800313          	li	t1,200

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
  48:	378000ef          	jal	3c0 <main>

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
 134:	0ce02223          	sw	a4,196(zero) # c4 <sc>
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
 15c:	fea78793          	add	a5,a5,-22
 160:	03000713          	li	a4,48
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
 214:	00812e23          	sw	s0,28(sp)
 218:	02010413          	add	s0,sp,32
 21c:	fea42623          	sw	a0,-20(s0)
 220:	0c002223          	sw	zero,196(zero) # c4 <sc>
 224:	00000013          	nop
 228:	0c402783          	lw	a5,196(zero) # c4 <sc>
 22c:	fe078ee3          	beqz	a5,228 <scan+0x18>
 230:	00000013          	nop
 234:	0c402703          	lw	a4,196(zero) # c4 <sc>
 238:	0f000793          	li	a5,240
 23c:	fef71ce3          	bne	a4,a5,234 <scan+0x24>
 240:	00000013          	nop
 244:	0c402703          	lw	a4,196(zero) # c4 <sc>
 248:	0f000793          	li	a5,240
 24c:	fef70ce3          	beq	a4,a5,244 <scan+0x34>
 250:	0c402703          	lw	a4,196(zero) # c4 <sc>
 254:	05a00793          	li	a5,90
 258:	00f71663          	bne	a4,a5,264 <scan+0x54>
 25c:	00100793          	li	a5,1
 260:	0280006f          	j	288 <_stack_size+0x8>
 264:	0c402703          	lw	a4,196(zero) # c4 <sc>
 268:	07600793          	li	a5,118
 26c:	00f71663          	bne	a4,a5,278 <scan+0x68>
 270:	00200793          	li	a5,2
 274:	0140006f          	j	288 <_stack_size+0x8>
 278:	0c402703          	lw	a4,196(zero) # c4 <sc>
 27c:	fec42783          	lw	a5,-20(s0)
 280:	00e7a023          	sw	a4,0(a5)
 284:	00000793          	li	a5,0
 288:	00078513          	mv	a0,a5
 28c:	01c12403          	lw	s0,28(sp)
 290:	02010113          	add	sp,sp,32
 294:	00008067          	ret

00000298 <print>:
 298:	fe010113          	add	sp,sp,-32
 29c:	00812e23          	sw	s0,28(sp)
 2a0:	02010413          	add	s0,sp,32
 2a4:	fea42623          	sw	a0,-20(s0)
 2a8:	feb42423          	sw	a1,-24(s0)
 2ac:	fe842783          	lw	a5,-24(s0)
 2b0:	00079a63          	bnez	a5,2c4 <print+0x2c>
 2b4:	040007b7          	lui	a5,0x4000
 2b8:	fec42703          	lw	a4,-20(s0)
 2bc:	00072703          	lw	a4,0(a4)
 2c0:	00e7a023          	sw	a4,0(a5) # 4000000 <_gbl_ptr+0x3fff800>
 2c4:	fe842703          	lw	a4,-24(s0)
 2c8:	00100793          	li	a5,1
 2cc:	00f71a63          	bne	a4,a5,2e0 <print+0x48>
 2d0:	040007b7          	lui	a5,0x4000
 2d4:	fec42703          	lw	a4,-20(s0)
 2d8:	00072703          	lw	a4,0(a4)
 2dc:	00e7a223          	sw	a4,4(a5) # 4000004 <_gbl_ptr+0x3fff804>
 2e0:	fe842703          	lw	a4,-24(s0)
 2e4:	00200793          	li	a5,2
 2e8:	00f71a63          	bne	a4,a5,2fc <print+0x64>
 2ec:	040007b7          	lui	a5,0x4000
 2f0:	fec42703          	lw	a4,-20(s0)
 2f4:	00072703          	lw	a4,0(a4)
 2f8:	00e7a423          	sw	a4,8(a5) # 4000008 <_gbl_ptr+0x3fff808>
 2fc:	fe842703          	lw	a4,-24(s0)
 300:	00300793          	li	a5,3
 304:	00f71a63          	bne	a4,a5,318 <print+0x80>
 308:	040007b7          	lui	a5,0x4000
 30c:	fec42703          	lw	a4,-20(s0)
 310:	00072703          	lw	a4,0(a4)
 314:	00e7a623          	sw	a4,12(a5) # 400000c <_gbl_ptr+0x3fff80c>
 318:	fe842703          	lw	a4,-24(s0)
 31c:	00400793          	li	a5,4
 320:	00f71a63          	bne	a4,a5,334 <print+0x9c>
 324:	040007b7          	lui	a5,0x4000
 328:	fec42703          	lw	a4,-20(s0)
 32c:	00072703          	lw	a4,0(a4)
 330:	00e7a823          	sw	a4,16(a5) # 4000010 <_gbl_ptr+0x3fff810>
 334:	fe842703          	lw	a4,-24(s0)
 338:	00500793          	li	a5,5
 33c:	00f71a63          	bne	a4,a5,350 <print+0xb8>
 340:	040007b7          	lui	a5,0x4000
 344:	fec42703          	lw	a4,-20(s0)
 348:	00072703          	lw	a4,0(a4)
 34c:	00e7aa23          	sw	a4,20(a5) # 4000014 <_gbl_ptr+0x3fff814>
 350:	fe842703          	lw	a4,-24(s0)
 354:	00600793          	li	a5,6
 358:	00f71a63          	bne	a4,a5,36c <print+0xd4>
 35c:	040007b7          	lui	a5,0x4000
 360:	fec42703          	lw	a4,-20(s0)
 364:	00072703          	lw	a4,0(a4)
 368:	00e7ac23          	sw	a4,24(a5) # 4000018 <_gbl_ptr+0x3fff818>
 36c:	fe842703          	lw	a4,-24(s0)
 370:	00700793          	li	a5,7
 374:	00f71a63          	bne	a4,a5,388 <print+0xf0>
 378:	040007b7          	lui	a5,0x4000
 37c:	fec42703          	lw	a4,-20(s0)
 380:	00072703          	lw	a4,0(a4)
 384:	00e7ae23          	sw	a4,28(a5) # 400001c <_gbl_ptr+0x3fff81c>
 388:	040007b7          	lui	a5,0x4000
 38c:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 390:	040007b7          	lui	a5,0x4000
 394:	00171713          	sll	a4,a4,0x1
 398:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 39c:	040007b7          	lui	a5,0x4000
 3a0:	0207a703          	lw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 3a4:	040007b7          	lui	a5,0x4000
 3a8:	00170713          	add	a4,a4,1
 3ac:	02e7a023          	sw	a4,32(a5) # 4000020 <_gbl_ptr+0x3fff820>
 3b0:	00000013          	nop
 3b4:	01c12403          	lw	s0,28(sp)
 3b8:	02010113          	add	sp,sp,32
 3bc:	00008067          	ret

000003c0 <main>:
 3c0:	fe010113          	add	sp,sp,-32
 3c4:	00112e23          	sw	ra,28(sp)
 3c8:	00812c23          	sw	s0,24(sp)
 3cc:	02010413          	add	s0,sp,32
 3d0:	fe042423          	sw	zero,-24(s0)
 3d4:	fe042623          	sw	zero,-20(s0)
 3d8:	0240006f          	j	3fc <main+0x3c>
 3dc:	fec42783          	lw	a5,-20(s0)
 3e0:	00178713          	add	a4,a5,1
 3e4:	fee42623          	sw	a4,-20(s0)
 3e8:	00078713          	mv	a4,a5
 3ec:	fe840793          	add	a5,s0,-24
 3f0:	00070593          	mv	a1,a4
 3f4:	00078513          	mv	a0,a5
 3f8:	ea1ff0ef          	jal	298 <print>
 3fc:	fe840793          	add	a5,s0,-24
 400:	00078513          	mv	a0,a5
 404:	e0dff0ef          	jal	210 <scan>
 408:	00050793          	mv	a5,a0
 40c:	fcf058e3          	blez	a5,3dc <main+0x1c>
 410:	00000793          	li	a5,0
 414:	00078513          	mv	a0,a5
 418:	01c12083          	lw	ra,28(sp)
 41c:	01812403          	lw	s0,24(sp)
 420:	02010113          	add	sp,sp,32
 424:	00008067          	ret

Disassembly of section .data:

00000000 <_gbl_ptr-0x800>:
   0:	0184                	.insn	2, 0x0184
   2:	0000                	.insn	2, 0x
   4:	01fc                	.insn	2, 0x01fc
   6:	0000                	.insn	2, 0x
   8:	01fc                	.insn	2, 0x01fc
   a:	0000                	.insn	2, 0x
   c:	01fc                	.insn	2, 0x01fc
   e:	0000                	.insn	2, 0x
  10:	01fc                	.insn	2, 0x01fc
  12:	0000                	.insn	2, 0x
  14:	01fc                	.insn	2, 0x01fc
  16:	0000                	.insn	2, 0x
  18:	01cc                	.insn	2, 0x01cc
  1a:	0000                	.insn	2, 0x
  1c:	01fc                	.insn	2, 0x01fc
  1e:	0000                	.insn	2, 0x
  20:	018c                	.insn	2, 0x018c
  22:	0000                	.insn	2, 0x
  24:	01fc                	.insn	2, 0x01fc
  26:	0000                	.insn	2, 0x
  28:	01fc                	.insn	2, 0x01fc
  2a:	0000                	.insn	2, 0x
  2c:	01dc                	.insn	2, 0x01dc
  2e:	0000                	.insn	2, 0x
  30:	01fc                	.insn	2, 0x01fc
  32:	0000                	.insn	2, 0x
  34:	01e4                	.insn	2, 0x01e4
  36:	0000                	.insn	2, 0x
  38:	01ec                	.insn	2, 0x01ec
  3a:	0000                	.insn	2, 0x
  3c:	019c                	.insn	2, 0x019c
  3e:	0000                	.insn	2, 0x
  40:	0194                	.insn	2, 0x0194
  42:	0000                	.insn	2, 0x
  44:	01fc                	.insn	2, 0x01fc
  46:	0000                	.insn	2, 0x
  48:	01fc                	.insn	2, 0x01fc
  4a:	0000                	.insn	2, 0x
  4c:	01fc                	.insn	2, 0x01fc
  4e:	0000                	.insn	2, 0x
  50:	01fc                	.insn	2, 0x01fc
  52:	0000                	.insn	2, 0x
  54:	01f4                	.insn	2, 0x01f4
  56:	0000                	.insn	2, 0x
  58:	01fc                	.insn	2, 0x01fc
  5a:	0000                	.insn	2, 0x
  5c:	01fc                	.insn	2, 0x01fc
  5e:	0000                	.insn	2, 0x
  60:	01a4                	.insn	2, 0x01a4
  62:	0000                	.insn	2, 0x
  64:	01fc                	.insn	2, 0x01fc
  66:	0000                	.insn	2, 0x
  68:	01fc                	.insn	2, 0x01fc
  6a:	0000                	.insn	2, 0x
  6c:	01fc                	.insn	2, 0x01fc
  6e:	0000                	.insn	2, 0x
  70:	01d4                	.insn	2, 0x01d4
  72:	0000                	.insn	2, 0x
  74:	01fc                	.insn	2, 0x01fc
  76:	0000                	.insn	2, 0x
  78:	01fc                	.insn	2, 0x01fc
  7a:	0000                	.insn	2, 0x
  7c:	01fc                	.insn	2, 0x01fc
  7e:	0000                	.insn	2, 0x
  80:	01ac                	.insn	2, 0x01ac
  82:	0000                	.insn	2, 0x
  84:	01fc                	.insn	2, 0x01fc
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
  9c:	01b4                	.insn	2, 0x01b4
  9e:	0000                	.insn	2, 0x
  a0:	01bc                	.insn	2, 0x01bc
  a2:	0000                	.insn	2, 0x
  a4:	01fc                	.insn	2, 0x01fc
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
  bc:	017c                	.insn	2, 0x017c
  be:	0000                	.insn	2, 0x
  c0:	01c4                	.insn	2, 0x01c4
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
  1e:	32727363          	bgeu	tp,t2,344 <print+0xac>
  22:	3070                	.insn	2, 0x3070
  24:	0800                	.insn	2, 0x0800
  26:	0a01                	.insn	2, 0x0a01
  28:	Address 0x28 is out of bounds.

