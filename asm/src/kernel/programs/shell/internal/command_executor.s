
build/src/kernel/programs/shell/internal/command_executor.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	52800140 	mov	w0, #0xa                   	// #10
   8:	910003fd 	mov	x29, sp
   c:	a90153f3 	stp	x19, x20, [sp, #16]
  10:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
  14:	9000000a 	adrp	x10, 0 <_ZN6kernel8programs5shell8internal5state18command_buffer_idxE>
  18:	f9400146 	ldr	x6, [x10]
  1c:	910040c1 	add	x1, x6, #0x10
  20:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  24:	cb2163ff 	sub	sp, sp, x1
  28:	910003e0 	mov	x0, sp
  2c:	910003f3 	mov	x19, sp
  30:	3800141f 	strb	wzr, [x0], #1
  34:	f10000df 	cmp	x6, #0x0
  38:	5400092d 	b.le	15c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x15c>
  3c:	910004c2 	add	x2, x6, #0x1
  40:	8b2263e1 	add	x1, sp, x2
  44:	3800141f 	strb	wzr, [x0], #1
  48:	eb01001f 	cmp	x0, x1
  4c:	54ffffc1 	b.ne	44 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x44>  // b.any
  50:	91003c40 	add	x0, x2, #0xf
  54:	927cec00 	and	x0, x0, #0xfffffffffffffff0
  58:	cb2063ff 	sub	sp, sp, x0
  5c:	910003e0 	mov	x0, sp
  60:	8b2263e2 	add	x2, sp, x2
  64:	910003f4 	mov	x20, sp
  68:	3800141f 	strb	wzr, [x0], #1
  6c:	3800141f 	strb	wzr, [x0], #1
  70:	eb02001f 	cmp	x0, x2
  74:	54ffffc1 	b.ne	6c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x6c>  // b.any
  78:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal5state14command_bufferE>
  7c:	91000000 	add	x0, x0, #0x0
  80:	8b0000c6 	add	x6, x6, x0
  84:	52800005 	mov	w5, #0x0                   	// #0
  88:	d2800009 	mov	x9, #0x0                   	// #0
  8c:	d2800008 	mov	x8, #0x0                   	// #0
  90:	14000006 	b	a8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xa8>
  94:	38286a62 	strb	w2, [x19, x8]
  98:	91000508 	add	x8, x8, #0x1
  9c:	91000400 	add	x0, x0, #0x1
  a0:	eb0000df 	cmp	x6, x0
  a4:	540001e0 	b.eq	e0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe0>  // b.none
  a8:	39400002 	ldrb	w2, [x0]
  ac:	520000a3 	eor	w3, w5, #0x1
  b0:	7100805f 	cmp	w2, #0x20
  b4:	1a9f17e4 	cset	w4, eq	// eq = none
  b8:	34000142 	cbz	w2, e0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe0>
  bc:	0a030087 	and	w7, w4, w3
  c0:	6a03009f 	tst	w4, w3
  c4:	54000341 	b.ne	12c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x12c>  // b.any
  c8:	34fffe65 	cbz	w5, 94 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x94>
  cc:	91000400 	add	x0, x0, #0x1
  d0:	38296a82 	strb	w2, [x20, x9]
  d4:	91000529 	add	x9, x9, #0x1
  d8:	eb0000df 	cmp	x6, x0
  dc:	54fffe61 	b.ne	a8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xa8>  // b.any
  e0:	aa1303e0 	mov	x0, x19
  e4:	f900015f 	str	xzr, [x10]
  e8:	94000000 	bl	0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  ec:	b4000060 	cbz	x0, f8 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xf8>
  f0:	39406001 	ldrb	w1, [x0, #24]
  f4:	36000201 	tbz	w1, #0, 134 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x134>
  f8:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv>
  fc:	91000000 	add	x0, x0, #0x0
 100:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>
 104:	aa1303e0 	mov	x0, x19
 108:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEPKc>
 10c:	52800140 	mov	w0, #0xa                   	// #10
 110:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 114:	528007c0 	mov	w0, #0x3e                  	// #62
 118:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 11c:	910003bf 	mov	sp, x29
 120:	a94153f3 	ldp	x19, x20, [sp, #16]
 124:	a8c27bfd 	ldp	x29, x30, [sp], #32
 128:	d65f03c0 	ret
 12c:	2a0703e5 	mov	w5, w7
 130:	17ffffdb 	b	9c <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x9c>
 134:	f9400802 	ldr	x2, [x0, #16]
 138:	aa1403e1 	mov	x1, x20
 13c:	d2809a40 	mov	x0, #0x4d2                 	// #1234
 140:	d63f0040 	blr	x2
 144:	528007c0 	mov	w0, #0x3e                  	// #62
 148:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler16send_to_frontendEh>
 14c:	910003bf 	mov	sp, x29
 150:	a94153f3 	ldp	x19, x20, [sp, #16]
 154:	a8c27bfd 	ldp	x29, x30, [sp], #32
 158:	d65f03c0 	ret
 15c:	cb2163ff 	sub	sp, sp, x1
 160:	910003f4 	mov	x20, sp
 164:	390003ff 	strb	wzr, [sp]
 168:	54fff881 	b.ne	78 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0x78>  // b.any
 16c:	17ffffdd 	b	e0 <_ZN6kernel8programs5shell8internal16command_executor15execute_commandEv+0xe0>
