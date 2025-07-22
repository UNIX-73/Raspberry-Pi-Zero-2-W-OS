
build/src/kernel/programs/shell/internal/command_executor.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>:
   0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   4:	52800140 	mov	w0, #0xa                   	// #10
   8:	910003fd 	mov	x29, sp
   c:	a90153f3 	stp	x19, x20, [sp, #16]
  10:	a9025bf5 	stp	x21, x22, [sp, #32]
  14:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
  18:	90000013 	adrp	x19, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  1c:	f9400266 	ldr	x6, [x19]
  20:	910040c1 	add	x1, x6, #0x10
  24:	f10000df 	cmp	x6, #0x0
  28:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  2c:	cb2163ff 	sub	sp, sp, x1
  30:	910003e0 	mov	x0, sp
  34:	910003f5 	mov	x21, sp
  38:	3800141f 	strb	wzr, [x0], #1
  3c:	54000a8d 	b.le	18c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x18c>
  40:	910004c2 	add	x2, x6, #0x1
  44:	8b2263e1 	add	x1, sp, x2
  48:	3800141f 	strb	wzr, [x0], #1
  4c:	eb01001f 	cmp	x0, x1
  50:	54ffffc1 	b.ne	48 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x48>  // b.any
  54:	91003c40 	add	x0, x2, #0xf
  58:	927cec00 	and	x0, x0, #0xfffffffffffffff0
  5c:	cb2063ff 	sub	sp, sp, x0
  60:	910003e0 	mov	x0, sp
  64:	8b2263e2 	add	x2, sp, x2
  68:	910003f6 	mov	x22, sp
  6c:	3800141f 	strb	wzr, [x0], #1
  70:	3800141f 	strb	wzr, [x0], #1
  74:	eb02001f 	cmp	x0, x2
  78:	54ffffc1 	b.ne	70 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x70>  // b.any
  7c:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
  80:	91000000 	add	x0, x0, #0x0
  84:	8b0000c6 	add	x6, x6, x0
  88:	52800005 	mov	w5, #0x0                   	// #0
  8c:	d2800008 	mov	x8, #0x0                   	// #0
  90:	d2800007 	mov	x7, #0x0                   	// #0
  94:	14000006 	b	ac <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xac>
  98:	38276aa3 	strb	w3, [x21, x7]
  9c:	910004e7 	add	x7, x7, #0x1
  a0:	91000400 	add	x0, x0, #0x1
  a4:	eb0000df 	cmp	x6, x0
  a8:	54000200 	b.eq	e8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe8>  // b.none
  ac:	39400003 	ldrb	w3, [x0]
  b0:	520000a4 	eor	w4, w5, #0x1
  b4:	7100807f 	cmp	w3, #0x20
  b8:	1a9f17e2 	cset	w2, eq	// eq = none
  bc:	34000163 	cbz	w3, e8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe8>
  c0:	6a04005f 	tst	w2, w4
  c4:	0a040042 	and	w2, w2, w4
  c8:	540003a1 	b.ne	13c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x13c>  // b.any
  cc:	34fffe65 	cbz	w5, 98 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x98>
  d0:	38286ac3 	strb	w3, [x22, x8]
  d4:	91000400 	add	x0, x0, #0x1
  d8:	91000508 	add	x8, x8, #0x1
  dc:	eb0000df 	cmp	x6, x0
  e0:	54fffe61 	b.ne	ac <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xac>  // b.any
  e4:	d503201f 	nop
  e8:	aa1503e0 	mov	x0, x21
  ec:	94000000 	bl	0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  f0:	aa0003f4 	mov	x20, x0
  f4:	b4000280 	cbz	x0, 144 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x144>
  f8:	39406000 	ldrb	w0, [x0, #24]
  fc:	37000240 	tbnz	w0, #0, 144 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x144>
 100:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>
 104:	91000000 	add	x0, x0, #0x0
 108:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>
 10c:	f9400a82 	ldr	x2, [x20, #16]
 110:	aa1603e1 	mov	x1, x22
 114:	d2809a40 	mov	x0, #0x4d2                 	// #1234
 118:	d63f0040 	blr	x2
 11c:	f900027f 	str	xzr, [x19]
 120:	528007c0 	mov	w0, #0x3e                  	// #62
 124:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 128:	910003bf 	mov	sp, x29
 12c:	a94153f3 	ldp	x19, x20, [sp, #16]
 130:	a9425bf5 	ldp	x21, x22, [sp, #32]
 134:	a8c37bfd 	ldp	x29, x30, [sp], #48
 138:	d65f03c0 	ret
 13c:	2a0203e5 	mov	w5, w2
 140:	17ffffd8 	b	a0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xa0>
 144:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
 148:	39400000 	ldrb	w0, [x0]
 14c:	34fffda0 	cbz	w0, 100 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x100>
 150:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>
 154:	91000000 	add	x0, x0, #0x0
 158:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>
 15c:	aa1503e0 	mov	x0, x21
 160:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>
 164:	52800140 	mov	w0, #0xa                   	// #10
 168:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 16c:	528007c0 	mov	w0, #0x3e                  	// #62
 170:	f900027f 	str	xzr, [x19]
 174:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 178:	910003bf 	mov	sp, x29
 17c:	a94153f3 	ldp	x19, x20, [sp, #16]
 180:	a9425bf5 	ldp	x21, x22, [sp, #32]
 184:	a8c37bfd 	ldp	x29, x30, [sp], #48
 188:	d65f03c0 	ret
 18c:	cb2163ff 	sub	sp, sp, x1
 190:	910003f6 	mov	x22, sp
 194:	390003ff 	strb	wzr, [sp]
 198:	54fff721 	b.ne	7c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x7c>  // b.any
 19c:	17ffffd3 	b	e8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe8>
