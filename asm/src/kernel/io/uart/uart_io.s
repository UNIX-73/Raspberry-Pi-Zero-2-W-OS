
build/src/kernel/io/uart/uart_io.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel2io4uart7uart_io7putcharEc>:
   0:	d28a0a82 	mov	x2, #0x5054                	// #20564
   4:	12001c00 	and	w0, w0, #0xff
   8:	f2a7e422 	movk	x2, #0x3f21, lsl #16
   c:	b9400041 	ldr	w1, [x2]
  10:	372800e1 	tbnz	w1, #5, 2c <_ZN6kernel2io4uart7uart_io7putcharEc+0x2c>
  14:	d503201f 	nop
  18:	d503201f 	nop
  1c:	d503201f 	nop
  20:	d503201f 	nop
  24:	b9400041 	ldr	w1, [x2]
  28:	362fffc1 	tbz	w1, #5, 20 <_ZN6kernel2io4uart7uart_io7putcharEc+0x20>
  2c:	d28a0801 	mov	x1, #0x5040                	// #20544
  30:	f2a7e421 	movk	x1, #0x3f21, lsl #16
  34:	b9000020 	str	w0, [x1]
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <_ZN6kernel2io4uart7uart_io7newlineEv>:
  40:	d28a0a81 	mov	x1, #0x5054                	// #20564
  44:	f2a7e421 	movk	x1, #0x3f21, lsl #16
  48:	b9400020 	ldr	w0, [x1]
  4c:	37280080 	tbnz	w0, #5, 5c <_ZN6kernel2io4uart7uart_io7newlineEv+0x1c>
  50:	d503201f 	nop
  54:	b9400020 	ldr	w0, [x1]
  58:	362fffc0 	tbz	w0, #5, 50 <_ZN6kernel2io4uart7uart_io7newlineEv+0x10>
  5c:	d28a0800 	mov	x0, #0x5040                	// #20544
  60:	52800141 	mov	w1, #0xa                   	// #10
  64:	f2a7e420 	movk	x0, #0x3f21, lsl #16
  68:	b9000001 	str	w1, [x0]
  6c:	d65f03c0 	ret

0000000000000070 <_ZN6kernel2io4uart7uart_io15return_carriageEv>:
  70:	d28a0a81 	mov	x1, #0x5054                	// #20564
  74:	f2a7e421 	movk	x1, #0x3f21, lsl #16
  78:	b9400020 	ldr	w0, [x1]
  7c:	37280080 	tbnz	w0, #5, 8c <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x1c>
  80:	d503201f 	nop
  84:	b9400020 	ldr	w0, [x1]
  88:	362fffc0 	tbz	w0, #5, 80 <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x10>
  8c:	d28a0800 	mov	x0, #0x5040                	// #20544
  90:	528001a1 	mov	w1, #0xd                   	// #13
  94:	f2a7e420 	movk	x0, #0x3f21, lsl #16
  98:	b9000001 	str	w1, [x0]
  9c:	d65f03c0 	ret

00000000000000a0 <_ZN6kernel2io4uart7uart_io4sendEPKc>:
  a0:	39400003 	ldrb	w3, [x0]
  a4:	34000203 	cbz	w3, e4 <_ZN6kernel2io4uart7uart_io4sendEPKc+0x44>
  a8:	d28a0a82 	mov	x2, #0x5054                	// #20564
  ac:	f2a7e422 	movk	x2, #0x3f21, lsl #16
  b0:	d1005044 	sub	x4, x2, #0x14
  b4:	d503201f 	nop
  b8:	d503201f 	nop
  bc:	d503201f 	nop
  c0:	b9400041 	ldr	w1, [x2]
  c4:	91000400 	add	x0, x0, #0x1
  c8:	37280081 	tbnz	w1, #5, d8 <_ZN6kernel2io4uart7uart_io4sendEPKc+0x38>
  cc:	d503201f 	nop
  d0:	b9400041 	ldr	w1, [x2]
  d4:	362fffc1 	tbz	w1, #5, cc <_ZN6kernel2io4uart7uart_io4sendEPKc+0x2c>
  d8:	b9000083 	str	w3, [x4]
  dc:	39400003 	ldrb	w3, [x0]
  e0:	35ffff03 	cbnz	w3, c0 <_ZN6kernel2io4uart7uart_io4sendEPKc+0x20>
  e4:	d65f03c0 	ret

00000000000000e8 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>:
  e8:	39400003 	ldrb	w3, [x0]
  ec:	340001c3 	cbz	w3, 124 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x3c>
  f0:	d28a0a82 	mov	x2, #0x5054                	// #20564
  f4:	f2a7e422 	movk	x2, #0x3f21, lsl #16
  f8:	d1005044 	sub	x4, x2, #0x14
  fc:	d503201f 	nop
 100:	b9400041 	ldr	w1, [x2]
 104:	91000400 	add	x0, x0, #0x1
 108:	37280081 	tbnz	w1, #5, 118 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x30>
 10c:	d503201f 	nop
 110:	b9400041 	ldr	w1, [x2]
 114:	362fffc1 	tbz	w1, #5, 10c <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x24>
 118:	b9000083 	str	w3, [x4]
 11c:	39400003 	ldrb	w3, [x0]
 120:	35ffff03 	cbnz	w3, 100 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x18>
 124:	d28a0a81 	mov	x1, #0x5054                	// #20564
 128:	f2a7e421 	movk	x1, #0x3f21, lsl #16
 12c:	b9400020 	ldr	w0, [x1]
 130:	372800e0 	tbnz	w0, #5, 14c <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x64>
 134:	d503201f 	nop
 138:	d503201f 	nop
 13c:	d503201f 	nop
 140:	d503201f 	nop
 144:	b9400020 	ldr	w0, [x1]
 148:	362fffc0 	tbz	w0, #5, 140 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x58>
 14c:	d28a0801 	mov	x1, #0x5040                	// #20544
 150:	52800140 	mov	w0, #0xa                   	// #10
 154:	f2a7e421 	movk	x1, #0x3f21, lsl #16
 158:	b9000020 	str	w0, [x1]
 15c:	b9401420 	ldr	w0, [x1, #20]
 160:	372800a0 	tbnz	w0, #5, 174 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x8c>
 164:	91005021 	add	x1, x1, #0x14
 168:	d503201f 	nop
 16c:	b9400020 	ldr	w0, [x1]
 170:	362fffc0 	tbz	w0, #5, 168 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x80>
 174:	d28a0800 	mov	x0, #0x5040                	// #20544
 178:	528001a1 	mov	w1, #0xd                   	// #13
 17c:	f2a7e420 	movk	x0, #0x3f21, lsl #16
 180:	b9000001 	str	w1, [x0]
 184:	d65f03c0 	ret

0000000000000188 <_ZN6kernel2io4uart7uart_io14uint32_to_charEj>:
 188:	1100c001 	add	w1, w0, #0x30
 18c:	7100281f 	cmp	w0, #0xa
 190:	12001c20 	and	w0, w1, #0xff
 194:	528007e2 	mov	w2, #0x3f                  	// #63
 198:	1a823000 	csel	w0, w0, w2, cc	// cc = lo, ul, last
 19c:	d65f03c0 	ret
