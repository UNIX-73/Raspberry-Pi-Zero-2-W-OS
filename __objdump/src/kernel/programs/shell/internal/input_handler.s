
build/src/kernel/programs/shell/internal/input_handler.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	910003fd 	mov	x29, sp
   8:	f9000bf3 	str	x19, [sp, #16]
   c:	12001c13 	and	w19, w0, #0xff
  10:	2a1303e0 	mov	w0, w19
  14:	94000000 	bl	0 <_ZN6kernel3lib6string14char_is_letterEh>
  18:	360000a0 	tbz	w0, #0, 2c <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x2c>
  1c:	52800020 	mov	w0, #0x1                   	// #1
  20:	f9400bf3 	ldr	x19, [sp, #16]
  24:	a8c27bfd 	ldp	x29, x30, [sp], #32
  28:	d65f03c0 	ret
  2c:	2a1303e0 	mov	w0, w19
  30:	94000000 	bl	0 <_ZN6kernel3lib6string13char_is_digitEh>
  34:	3707ff40 	tbnz	w0, #0, 1c <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x1c>
  38:	7100ba7f 	cmp	w19, #0x2e
  3c:	540000c8 	b.hi	54 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x54>  // b.pmore
  40:	7100827f 	cmp	w19, #0x20
  44:	52800580 	mov	w0, #0x2c                  	// #44
  48:	7a401262 	ccmp	w19, w0, #0x2, ne	// ne = any
  4c:	1a9f97e0 	cset	w0, hi	// hi = pmore
  50:	17fffff4 	b	20 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x20>
  54:	71017e7f 	cmp	w19, #0x5f
  58:	1a9f17e0 	cset	w0, eq	// eq = none
  5c:	17fffff1 	b	20 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh+0x20>

0000000000000060 <_ZN6kernel8programs5shell8internal13input_handler14buffer_is_fullEv>:
  60:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  64:	f9400000 	ldr	x0, [x0]
  68:	f103f81f 	cmp	x0, #0xfe
  6c:	1a9f97e0 	cset	w0, hi	// hi = pmore
  70:	d65f03c0 	ret
  74:	d503201f 	nop
  78:	d503201f 	nop
  7c:	d503201f 	nop

0000000000000080 <_ZN6kernel8programs5shell8internal13input_handler10handle_delEv>:
  80:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  84:	f9400040 	ldr	x0, [x2]
  88:	b5000040 	cbnz	x0, 90 <_ZN6kernel8programs5shell8internal13input_handler10handle_delEv+0x10>
  8c:	d65f03c0 	ret
  90:	d1000401 	sub	x1, x0, #0x1
  94:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
  98:	91000000 	add	x0, x0, #0x0
  9c:	f9000041 	str	x1, [x2]
  a0:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  a4:	d503201f 	nop
  a8:	d503201f 	nop
  ac:	d503201f 	nop

00000000000000b0 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv>:
  b0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  b4:	910003fd 	mov	x29, sp
  b8:	a90153f3 	stp	x19, x20, [sp, #16]
  bc:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  c0:	f9400281 	ldr	x1, [x20]
  c4:	f103e83f 	cmp	x1, #0xfa
  c8:	540002a8 	b.hi	11c <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x6c>  // b.pmore
  cc:	a9025bf5 	stp	x21, x22, [sp, #32]
  d0:	f103f83f 	cmp	x1, #0xfe
  d4:	90000015 	adrp	x21, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
  d8:	910002b5 	add	x21, x21, #0x0
  dc:	52800093 	mov	w19, #0x4                   	// #4
  e0:	52800416 	mov	w22, #0x20                  	// #32
  e4:	540000c8 	b.hi	fc <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x4c>  // b.pmore
  e8:	91000422 	add	x2, x1, #0x1
  ec:	52800400 	mov	w0, #0x20                  	// #32
  f0:	f9000282 	str	x2, [x20]
  f4:	38216ab6 	strb	w22, [x21, x1]
  f8:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
  fc:	71000673 	subs	w19, w19, #0x1
 100:	540000c0 	b.eq	118 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x68>  // b.none
 104:	f9400281 	ldr	x1, [x20]
 108:	f103f83f 	cmp	x1, #0xfe
 10c:	54fffee9 	b.ls	e8 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x38>  // b.plast
 110:	71000673 	subs	w19, w19, #0x1
 114:	54ffff81 	b.ne	104 <_ZN6kernel8programs5shell8internal13input_handler10handle_tabEv+0x54>  // b.any
 118:	a9425bf5 	ldp	x21, x22, [sp, #32]
 11c:	a94153f3 	ldp	x19, x20, [sp, #16]
 120:	a8c37bfd 	ldp	x29, x30, [sp], #48
 124:	d65f03c0 	ret
 128:	d503201f 	nop
 12c:	d503201f 	nop

0000000000000130 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh>:
 130:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 134:	f9400041 	ldr	x1, [x2]
 138:	f103f83f 	cmp	x1, #0xfe
 13c:	54000049 	b.ls	144 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x14>  // b.plast
 140:	d65f03c0 	ret
 144:	90000003 	adrp	x3, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 148:	91000063 	add	x3, x3, #0x0
 14c:	12001c00 	and	w0, w0, #0xff
 150:	91000424 	add	x4, x1, #0x1
 154:	f9000044 	str	x4, [x2]
 158:	7100201f 	cmp	w0, #0x8
 15c:	38216860 	strb	w0, [x3, x1]
 160:	54000140 	b.eq	188 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x58>  // b.none
 164:	7100281f 	cmp	w0, #0xa
 168:	7a4d1804 	ccmp	w0, #0xd, #0x4, ne	// ne = any
 16c:	54000040 	b.eq	174 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh+0x44>  // b.none
 170:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 174:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 178:	910003fd 	mov	x29, sp
 17c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 180:	a8c17bfd 	ldp	x29, x30, [sp], #16
 184:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 188:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
 18c:	91000000 	add	x0, x0, #0x0
 190:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 194:	d503201f 	nop
 198:	d503201f 	nop
 19c:	d503201f 	nop

00000000000001a0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>:
 1a0:	12001c00 	and	w0, w0, #0xff
 1a4:	7100201f 	cmp	w0, #0x8
 1a8:	54000140 	b.eq	1d0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh+0x30>  // b.none
 1ac:	7100281f 	cmp	w0, #0xa
 1b0:	7a4d1804 	ccmp	w0, #0xd, #0x4, ne	// ne = any
 1b4:	54000040 	b.eq	1bc <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh+0x1c>  // b.none
 1b8:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 1bc:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
 1c0:	910003fd 	mov	x29, sp
 1c4:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 1c8:	a8c17bfd 	ldp	x29, x30, [sp], #16
 1cc:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 1d0:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
 1d4:	91000000 	add	x0, x0, #0x0
 1d8:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 1dc:	d503201f 	nop

00000000000001e0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>:
 1e0:	39400001 	ldrb	w1, [x0]
 1e4:	34000361 	cbz	w1, 250 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x70>
 1e8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 1ec:	910003fd 	mov	x29, sp
 1f0:	a90153f3 	stp	x19, x20, [sp, #16]
 1f4:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
 1f8:	91000294 	add	x20, x20, #0x0
 1fc:	aa0003f3 	mov	x19, x0
 200:	14000004 	b	210 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x30>
 204:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 208:	38401e61 	ldrb	w1, [x19, #1]!
 20c:	34000161 	cbz	w1, 238 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x58>
 210:	7100203f 	cmp	w1, #0x8
 214:	54000180 	b.eq	244 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x64>  // b.none
 218:	7100283f 	cmp	w1, #0xa
 21c:	2a0103e0 	mov	w0, w1
 220:	7a4d1824 	ccmp	w1, #0xd, #0x4, ne	// ne = any
 224:	54ffff01 	b.ne	204 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x24>  // b.any
 228:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
 22c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
 230:	38401e61 	ldrb	w1, [x19, #1]!
 234:	35fffee1 	cbnz	w1, 210 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x30>
 238:	a94153f3 	ldp	x19, x20, [sp, #16]
 23c:	a8c27bfd 	ldp	x29, x30, [sp], #32
 240:	d65f03c0 	ret
 244:	aa1403e0 	mov	x0, x20
 248:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 24c:	17ffffef 	b	208 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc+0x28>
 250:	d65f03c0 	ret
 254:	d503201f 	nop
 258:	d503201f 	nop
 25c:	d503201f 	nop

0000000000000260 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh>:
 260:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 264:	910003fd 	mov	x29, sp
 268:	a90153f3 	stp	x19, x20, [sp, #16]
 26c:	12001c13 	and	w19, w0, #0xff
 270:	2a1303e0 	mov	w0, w19
 274:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
 278:	37000180 	tbnz	w0, #0, 2a8 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x48>
 27c:	7101fe7f 	cmp	w19, #0x7f
 280:	7a481a64 	ccmp	w19, #0x8, #0x4, ne	// ne = any
 284:	54000200 	b.eq	2c4 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x64>  // b.none
 288:	7100267f 	cmp	w19, #0x9
 28c:	54000300 	b.eq	2ec <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x8c>  // b.none
 290:	71002a7f 	cmp	w19, #0xa
 294:	7a4d1a64 	ccmp	w19, #0xd, #0x4, ne	// ne = any
 298:	54000100 	b.eq	2b8 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x58>  // b.none
 29c:	a94153f3 	ldp	x19, x20, [sp, #16]
 2a0:	a8c37bfd 	ldp	x29, x30, [sp], #48
 2a4:	d65f03c0 	ret
 2a8:	2a1303e0 	mov	w0, w19
 2ac:	a94153f3 	ldp	x19, x20, [sp, #16]
 2b0:	a8c37bfd 	ldp	x29, x30, [sp], #48
 2b4:	14000000 	b	130 <_ZN6kernel8programs5shell8internal13input_handler9push_charEh>
 2b8:	a94153f3 	ldp	x19, x20, [sp, #16]
 2bc:	a8c37bfd 	ldp	x29, x30, [sp], #48
 2c0:	14000000 	b	0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>
 2c4:	90000002 	adrp	x2, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 2c8:	f9400040 	ldr	x0, [x2]
 2cc:	b4fffe80 	cbz	x0, 29c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x3c>
 2d0:	a94153f3 	ldp	x19, x20, [sp, #16]
 2d4:	d1000401 	sub	x1, x0, #0x1
 2d8:	a8c37bfd 	ldp	x29, x30, [sp], #48
 2dc:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal13input_handler22char_is_allowed_symbolEh>
 2e0:	91000000 	add	x0, x0, #0x0
 2e4:	f9000041 	str	x1, [x2]
 2e8:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 2ec:	90000014 	adrp	x20, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
 2f0:	f9400281 	ldr	x1, [x20]
 2f4:	f103e83f 	cmp	x1, #0xfa
 2f8:	54fffd28 	b.hi	29c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x3c>  // b.pmore
 2fc:	a9025bf5 	stp	x21, x22, [sp, #32]
 300:	f103f83f 	cmp	x1, #0xfe
 304:	90000015 	adrp	x21, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 308:	910002b5 	add	x21, x21, #0x0
 30c:	52800093 	mov	w19, #0x4                   	// #4
 310:	52800416 	mov	w22, #0x20                  	// #32
 314:	540000c8 	b.hi	32c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xcc>  // b.pmore
 318:	91000422 	add	x2, x1, #0x1
 31c:	52800400 	mov	w0, #0x20                  	// #32
 320:	f9000282 	str	x2, [x20]
 324:	38216ab6 	strb	w22, [x21, x1]
 328:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 32c:	71000673 	subs	w19, w19, #0x1
 330:	540000a0 	b.eq	344 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xe4>  // b.none
 334:	f9400281 	ldr	x1, [x20]
 338:	f103f83f 	cmp	x1, #0xfe
 33c:	54ffff88 	b.hi	32c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xcc>  // b.pmore
 340:	17fffff6 	b	318 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0xb8>
 344:	a9425bf5 	ldp	x21, x22, [sp, #32]
 348:	17ffffd5 	b	29c <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh+0x3c>
