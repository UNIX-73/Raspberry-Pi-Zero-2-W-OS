
build/src/kernel/programs/shell/internal/input_handler.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>:
   0:	12001c00 	and	w0, w0, #0xff
   4:	121a7800 	and	w0, w0, #0xffffffdf
   8:	51010400 	sub	w0, w0, #0x41
   c:	12001c00 	and	w0, w0, #0xff
  10:	7100641f 	cmp	w0, #0x19
  14:	1a9f87e0 	cset	w0, ls	// ls = plast
  18:	d65f03c0 	ret
  1c:	d503201f 	nop

0000000000000020 <_ZN6kernel8programs5shell8internal13input_handler13char_is_digitEh>:
  20:	12001c00 	and	w0, w0, #0xff
  24:	5100c000 	sub	w0, w0, #0x30
  28:	12001c00 	and	w0, w0, #0xff
  2c:	7100241f 	cmp	w0, #0x9
  30:	1a9f87e0 	cset	w0, ls	// ls = plast
  34:	d65f03c0 	ret
  38:	d503201f 	nop
  3c:	d503201f 	nop

0000000000000040 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>:
  40:	12001c01 	and	w1, w0, #0xff
  44:	7101e83f 	cmp	w1, #0x7a
  48:	54000228 	b.hi	8c <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x4c>  // b.pmore
  4c:	7101003f 	cmp	w1, #0x40
  50:	54000128 	b.hi	74 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x34>  // b.pmore
  54:	52800020 	mov	w0, #0x1                   	// #1
  58:	7100b43f 	cmp	w1, #0x2d
  5c:	540000a0 	b.eq	70 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x30>  // b.none
  60:	5100c022 	sub	w2, w1, #0x30
  64:	12001c42 	and	w2, w2, #0xff
  68:	7100245f 	cmp	w2, #0x9
  6c:	54000108 	b.hi	8c <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x4c>  // b.pmore
  70:	d65f03c0 	ret
  74:	51010420 	sub	w0, w1, #0x41
  78:	92b78002 	mov	x2, #0xffffffff43ffffff    	// #-3154116609
  7c:	f2e07fe2 	movk	x2, #0x3ff, lsl #48
  80:	9ac02442 	lsr	x2, x2, x0
  84:	12000040 	and	w0, w2, #0x1
  88:	3707ff42 	tbnz	w2, #0, 70 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x30>
  8c:	7100b83f 	cmp	w1, #0x2e
  90:	52800400 	mov	w0, #0x20                  	// #32
  94:	7a401024 	ccmp	w1, w0, #0x4, ne	// ne = any
  98:	1a9f17e0 	cset	w0, eq	// eq = none
  9c:	d65f03c0 	ret

00000000000000a0 <_ZN6kernel8programs5shell8internal13input_handler14buffer_is_fullEv>:
  a0:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  a4:	f9400000 	ldr	x0, [x0]
  a8:	f103f81f 	cmp	x0, #0xfe
  ac:	1a9f97e0 	cset	w0, hi	// hi = pmore
  b0:	d65f03c0 	ret
  b4:	d503201f 	nop
  b8:	d503201f 	nop
  bc:	d503201f 	nop

00000000000000c0 <_ZN6kernel8programs5shell8internal13input_handler10handle_delEv>:
  c0:	90000001 	adrp	x1, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  c4:	f9400020 	ldr	x0, [x1]
  c8:	b5000040 	cbnz	x0, d0 <_ZN6kernel8programs5shell8internal13input_handler10handle_delEv+0x10>
  cc:	d65f03c0 	ret
  d0:	d1000400 	sub	x0, x0, #0x1
  d4:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>
  d8:	f9000020 	str	x0, [x1]
  dc:	91000040 	add	x0, x2, #0x0
  e0:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>

00000000000000e4 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv>:
  e4:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  e8:	910003fd 	mov	x29, sp
  ec:	a90153f3 	stp	x19, x20, [sp, #16]
  f0:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  f4:	f9400281 	ldr	x1, [x20]
  f8:	f103e83f 	cmp	x1, #0xfa
  fc:	540002a8 	b.hi	150 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x6c>  // b.pmore
 100:	a9025bf5 	stp	x21, x22, [sp, #32]
 104:	52800093 	mov	w19, #0x4                   	// #4
 108:	90000015 	adrp	x21, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 10c:	52800416 	mov	w22, #0x20                  	// #32
 110:	910002b5 	add	x21, x21, #0x0
 114:	f103f83f 	cmp	x1, #0xfe
 118:	540000c8 	b.hi	130 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x4c>  // b.pmore
 11c:	91000422 	add	x2, x1, #0x1
 120:	52800400 	mov	w0, #0x20                  	// #32
 124:	f9000282 	str	x2, [x20]
 128:	38216ab6 	strb	w22, [x21, x1]
 12c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 130:	71000673 	subs	w19, w19, #0x1
 134:	540000c0 	b.eq	14c <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x68>  // b.none
 138:	f9400281 	ldr	x1, [x20]
 13c:	f103f83f 	cmp	x1, #0xfe
 140:	54fffee9 	b.ls	11c <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x38>  // b.plast
 144:	71000673 	subs	w19, w19, #0x1
 148:	54ffff81 	b.ne	138 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x54>  // b.any
 14c:	a9425bf5 	ldp	x21, x22, [sp, #32]
 150:	a94153f3 	ldp	x19, x20, [sp, #16]
 154:	a8c37bfd 	ldp	x29, x30, [sp], #48
 158:	d65f03c0 	ret
 15c:	d503201f 	nop

0000000000000160 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh>:
 160:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 164:	f9400041 	ldr	x1, [x2]
 168:	f103f83f 	cmp	x1, #0xfe
 16c:	54000049 	b.ls	174 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x14>  // b.plast
 170:	d65f03c0 	ret
 174:	90000003 	adrp	x3, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 178:	91000063 	add	x3, x3, #0x0
 17c:	12001c00 	and	w0, w0, #0xff
 180:	91000424 	add	x4, x1, #0x1
 184:	f9000044 	str	x4, [x2]
 188:	38216860 	strb	w0, [x3, x1]
 18c:	7100201f 	cmp	w0, #0x8
 190:	54000140 	b.eq	1b8 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x58>  // b.none
 194:	7100281f 	cmp	w0, #0xa
 198:	7a4d1804 	ccmp	w0, #0xd, #0x4, ne	// ne = any
 19c:	54000040 	b.eq	1a4 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x44>  // b.none
 1a0:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 1a4:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1a8:	910003fd 	mov	x29, sp
 1ac:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 1b0:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1b4:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 1b8:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>
 1bc:	91000000 	add	x0, x0, #0x0
 1c0:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>

00000000000001c4 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>:
 1c4:	12001c00 	and	w0, w0, #0xff
 1c8:	7100201f 	cmp	w0, #0x8
 1cc:	54000140 	b.eq	1f4 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh+0x30>  // b.none
 1d0:	7100281f 	cmp	w0, #0xa
 1d4:	7a4d1804 	ccmp	w0, #0xd, #0x4, ne	// ne = any
 1d8:	54000040 	b.eq	1e0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh+0x1c>  // b.none
 1dc:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 1e0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1e4:	910003fd 	mov	x29, sp
 1e8:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 1ec:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1f0:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 1f4:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>
 1f8:	91000000 	add	x0, x0, #0x0
 1fc:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>

0000000000000200 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>:
 200:	39400001 	ldrb	w1, [x0]
 204:	34000361 	cbz	w1, 270 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x70>
 208:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 20c:	910003fd 	mov	x29, sp
 210:	a90153f3 	stp	x19, x20, [sp, #16]
 214:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>
 218:	aa0003f3 	mov	x19, x0
 21c:	91000294 	add	x20, x20, #0x0
 220:	14000004 	b	230 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x30>
 224:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 228:	38401e61 	ldrb	w1, [x19, #1]!
 22c:	34000161 	cbz	w1, 258 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x58>
 230:	7100203f 	cmp	w1, #0x8
 234:	54000180 	b.eq	264 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x64>  // b.none
 238:	7100283f 	cmp	w1, #0xa
 23c:	2a0103e0 	mov	w0, w1
 240:	7a4d1824 	ccmp	w1, #0xd, #0x4, ne	// ne = any
 244:	54ffff01 	b.ne	224 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x24>  // b.any
 248:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 24c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 250:	38401e61 	ldrb	w1, [x19, #1]!
 254:	35fffee1 	cbnz	w1, 230 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x30>
 258:	a94153f3 	ldp	x19, x20, [sp, #16]
 25c:	a8c27bfd 	ldp	x29, x30, [sp], #32
 260:	d65f03c0 	ret
 264:	aa1403e0 	mov	x0, x20
 268:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 26c:	17ffffef 	b	228 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x28>
 270:	d65f03c0 	ret
 274:	d503201f 	nop
 278:	d503201f 	nop
 27c:	d503201f 	nop

0000000000000280 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh>:
 280:	12001c00 	and	w0, w0, #0xff
 284:	7101e81f 	cmp	w0, #0x7a
 288:	54000488 	b.hi	318 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x98>  // b.pmore
 28c:	7101001f 	cmp	w0, #0x40
 290:	54000108 	b.hi	2b0 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x30>  // b.pmore
 294:	7100b41f 	cmp	w0, #0x2d
 298:	540000a0 	b.eq	2ac <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x2c>  // b.none
 29c:	5100c001 	sub	w1, w0, #0x30
 2a0:	12001c21 	and	w1, w1, #0xff
 2a4:	7100243f 	cmp	w1, #0x9
 2a8:	540001a8 	b.hi	2dc <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x5c>  // b.pmore
 2ac:	14000000 	b	160 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh>
 2b0:	51010402 	sub	w2, w0, #0x41
 2b4:	92b78001 	mov	x1, #0xffffffff43ffffff    	// #-3154116609
 2b8:	f2e07fe1 	movk	x1, #0x3ff, lsl #48
 2bc:	9ac22421 	lsr	x1, x1, x2
 2c0:	3707ff61 	tbnz	w1, #0, 2ac <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x2c>
 2c4:	7100241f 	cmp	w0, #0x9
 2c8:	540002e0 	b.eq	324 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xa4>  // b.none
 2cc:	7100281f 	cmp	w0, #0xa
 2d0:	7a4d1804 	ccmp	w0, #0xd, #0x4, ne	// ne = any
 2d4:	54000200 	b.eq	314 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x94>  // b.none
 2d8:	d65f03c0 	ret
 2dc:	7100b81f 	cmp	w0, #0x2e
 2e0:	52800401 	mov	w1, #0x20                  	// #32
 2e4:	7a411004 	ccmp	w0, w1, #0x4, ne	// ne = any
 2e8:	54fffe20 	b.eq	2ac <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x2c>  // b.none
 2ec:	7100201f 	cmp	w0, #0x8
 2f0:	54fffea1 	b.ne	2c4 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x44>  // b.any
 2f4:	90000001 	adrp	x1, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 2f8:	f9400020 	ldr	x0, [x1]
 2fc:	b4fffee0 	cbz	x0, 2d8 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x58>
 300:	d1000400 	sub	x0, x0, #0x1
 304:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal13input_handler14char_is_letterEh>
 308:	f9000020 	str	x0, [x1]
 30c:	91000040 	add	x0, x2, #0x0
 310:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 314:	14000000 	b	0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>
 318:	7101fc1f 	cmp	w0, #0x7f
 31c:	54fffec0 	b.eq	2f4 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x74>  // b.none
 320:	d65f03c0 	ret
 324:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 328:	910003fd 	mov	x29, sp
 32c:	a90153f3 	stp	x19, x20, [sp, #16]
 330:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 334:	f9400281 	ldr	x1, [x20]
 338:	f103e83f 	cmp	x1, #0xfa
 33c:	54000288 	b.hi	38c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x10c>  // b.pmore
 340:	a9025bf5 	stp	x21, x22, [sp, #32]
 344:	52800093 	mov	w19, #0x4                   	// #4
 348:	90000015 	adrp	x21, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 34c:	52800416 	mov	w22, #0x20                  	// #32
 350:	910002b5 	add	x21, x21, #0x0
 354:	f103f83f 	cmp	x1, #0xfe
 358:	540000c8 	b.hi	370 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xf0>  // b.pmore
 35c:	91000422 	add	x2, x1, #0x1
 360:	52800400 	mov	w0, #0x20                  	// #32
 364:	f9000282 	str	x2, [x20]
 368:	38216ab6 	strb	w22, [x21, x1]
 36c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 370:	71000673 	subs	w19, w19, #0x1
 374:	540000a0 	b.eq	388 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x108>  // b.none
 378:	f9400281 	ldr	x1, [x20]
 37c:	f103f83f 	cmp	x1, #0xfe
 380:	54ffff88 	b.hi	370 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xf0>  // b.pmore
 384:	17fffff6 	b	35c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xdc>
 388:	a9425bf5 	ldp	x21, x22, [sp, #32]
 38c:	a94153f3 	ldp	x19, x20, [sp, #16]
 390:	a8c37bfd 	ldp	x29, x30, [sp], #48
 394:	d65f03c0 	ret
