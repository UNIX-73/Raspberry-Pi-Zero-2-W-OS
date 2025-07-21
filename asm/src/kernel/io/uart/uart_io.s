
build/src/kernel/io/uart/uart_io.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel2io4uart7uart_io7putcharEc>:
   0:	90000001 	adrp	x1, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
   4:	12001c00 	and	w0, w0, #0xff
   8:	f9400022 	ldr	x2, [x1]
   c:	b9400042 	ldr	w2, [x2]
  10:	372800e2 	tbnz	w2, #5, 2c <_ZN6kernel2io4uart7uart_io7putcharEc+0x2c>
  14:	f9400022 	ldr	x2, [x1]
  18:	d503201f 	nop
  1c:	d503201f 	nop
  20:	d503201f 	nop
  24:	b9400041 	ldr	w1, [x2]
  28:	362fffc1 	tbz	w1, #5, 20 <_ZN6kernel2io4uart7uart_io7putcharEc+0x20>
  2c:	90000001 	adrp	x1, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  30:	f9400021 	ldr	x1, [x1]
  34:	b9000020 	str	w0, [x1]
  38:	d65f03c0 	ret
  3c:	d503201f 	nop

0000000000000040 <_ZN6kernel2io4uart7uart_io7newlineEv>:
  40:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
  44:	f9400001 	ldr	x1, [x0]
  48:	b9400021 	ldr	w1, [x1]
  4c:	37280101 	tbnz	w1, #5, 6c <_ZN6kernel2io4uart7uart_io7newlineEv+0x2c>
  50:	f9400001 	ldr	x1, [x0]
  54:	d503201f 	nop
  58:	d503201f 	nop
  5c:	d503201f 	nop
  60:	d503201f 	nop
  64:	b9400020 	ldr	w0, [x1]
  68:	362fffc0 	tbz	w0, #5, 60 <_ZN6kernel2io4uart7uart_io7newlineEv+0x20>
  6c:	90000000 	adrp	x0, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  70:	52800141 	mov	w1, #0xa                   	// #10
  74:	f9400000 	ldr	x0, [x0]
  78:	b9000001 	str	w1, [x0]
  7c:	d65f03c0 	ret

0000000000000080 <_ZN6kernel2io4uart7uart_io15return_carriageEv>:
  80:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
  84:	f9400001 	ldr	x1, [x0]
  88:	b9400021 	ldr	w1, [x1]
  8c:	37280101 	tbnz	w1, #5, ac <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x2c>
  90:	f9400001 	ldr	x1, [x0]
  94:	d503201f 	nop
  98:	d503201f 	nop
  9c:	d503201f 	nop
  a0:	d503201f 	nop
  a4:	b9400020 	ldr	w0, [x1]
  a8:	362fffc0 	tbz	w0, #5, a0 <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x20>
  ac:	90000000 	adrp	x0, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  b0:	528001a1 	mov	w1, #0xd                   	// #13
  b4:	f9400000 	ldr	x0, [x0]
  b8:	b9000001 	str	w1, [x0]
  bc:	d65f03c0 	ret

00000000000000c0 <_ZN6kernel2io4uart7uart_io4sendEPKc>:
  c0:	39400003 	ldrb	w3, [x0]
  c4:	34000243 	cbz	w3, 10c <_ZN6kernel2io4uart7uart_io4sendEPKc+0x4c>
  c8:	90000005 	adrp	x5, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
  cc:	910000a5 	add	x5, x5, #0x0
  d0:	90000004 	adrp	x4, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  d4:	91000084 	add	x4, x4, #0x0
  d8:	f94000a6 	ldr	x6, [x5]
  dc:	d503201f 	nop
  e0:	91000400 	add	x0, x0, #0x1
  e4:	b94000c1 	ldr	w1, [x6]
  e8:	372800a1 	tbnz	w1, #5, fc <_ZN6kernel2io4uart7uart_io4sendEPKc+0x3c>
  ec:	f94000a2 	ldr	x2, [x5]
  f0:	d503201f 	nop
  f4:	b9400041 	ldr	w1, [x2]
  f8:	362fffc1 	tbz	w1, #5, f0 <_ZN6kernel2io4uart7uart_io4sendEPKc+0x30>
  fc:	f9400081 	ldr	x1, [x4]
 100:	b9000023 	str	w3, [x1]
 104:	39400003 	ldrb	w3, [x0]
 108:	35fffec3 	cbnz	w3, e0 <_ZN6kernel2io4uart7uart_io4sendEPKc+0x20>
 10c:	d65f03c0 	ret

0000000000000110 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>:
 110:	39400004 	ldrb	w4, [x0]
 114:	90000005 	adrp	x5, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 118:	90000007 	adrp	x7, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
 11c:	910000e6 	add	x6, x7, #0x0
 120:	f94000a3 	ldr	x3, [x5]
 124:	340001e4 	cbz	w4, 160 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x50>
 128:	b9400061 	ldr	w1, [x3]
 12c:	91000400 	add	x0, x0, #0x1
 130:	37280101 	tbnz	w1, #5, 150 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x40>
 134:	f94000a1 	ldr	x1, [x5]
 138:	d503201f 	nop
 13c:	d503201f 	nop
 140:	d503201f 	nop
 144:	b9400022 	ldr	w2, [x1]
 148:	aa0103e3 	mov	x3, x1
 14c:	362fffa2 	tbz	w2, #5, 140 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x30>
 150:	f94000c1 	ldr	x1, [x6]
 154:	b9000024 	str	w4, [x1]
 158:	39400004 	ldrb	w4, [x0]
 15c:	35fffe64 	cbnz	w4, 128 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x18>
 160:	b9400060 	ldr	w0, [x3]
 164:	372800e0 	tbnz	w0, #5, 180 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x70>
 168:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 16c:	f9400000 	ldr	x0, [x0]
 170:	d503201f 	nop
 174:	b9400001 	ldr	w1, [x0]
 178:	aa0003e3 	mov	x3, x0
 17c:	362fffa1 	tbz	w1, #5, 170 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x60>
 180:	f94000e0 	ldr	x0, [x7]
 184:	52800141 	mov	w1, #0xa                   	// #10
 188:	b9000001 	str	w1, [x0]
 18c:	b9400061 	ldr	w1, [x3]
 190:	37280101 	tbnz	w1, #5, 1b0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0xa0>
 194:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 198:	f9400001 	ldr	x1, [x0]
 19c:	d503201f 	nop
 1a0:	d503201f 	nop
 1a4:	b9400020 	ldr	w0, [x1]
 1a8:	362fffc0 	tbz	w0, #5, 1a0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x90>
 1ac:	f94000e0 	ldr	x0, [x7]
 1b0:	528001a1 	mov	w1, #0xd                   	// #13
 1b4:	b9000001 	str	w1, [x0]
 1b8:	d65f03c0 	ret
 1bc:	d503201f 	nop

00000000000001c0 <_ZN6kernel2io4uart7uart_io14uint32_to_charEj>:
 1c0:	1100c001 	add	w1, w0, #0x30
 1c4:	7100281f 	cmp	w0, #0xa
 1c8:	12001c20 	and	w0, w1, #0xff
 1cc:	528007e2 	mov	w2, #0x3f                  	// #63
 1d0:	1a823000 	csel	w0, w0, w2, cc	// cc = lo, ul, last
 1d4:	d65f03c0 	ret
 1d8:	d503201f 	nop
 1dc:	d503201f 	nop

00000000000001e0 <_ZN6kernel2io4uart7uart_io12clear_screenEv>:
 1e0:	90000004 	adrp	x4, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 1e4:	91000084 	add	x4, x4, #0x0
 1e8:	90000002 	adrp	x2, 0 <_ZN6kernel2io4uart7uart_io7putcharEc>
 1ec:	90000005 	adrp	x5, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
 1f0:	91000042 	add	x2, x2, #0x0
 1f4:	910000a5 	add	x5, x5, #0x0
 1f8:	f9400086 	ldr	x6, [x4]
 1fc:	52800363 	mov	w3, #0x1b                  	// #27
 200:	b94000c0 	ldr	w0, [x6]
 204:	91000442 	add	x2, x2, #0x1
 208:	372800a0 	tbnz	w0, #5, 21c <_ZN6kernel2io4uart7uart_io12clear_screenEv+0x3c>
 20c:	f9400081 	ldr	x1, [x4]
 210:	d503201f 	nop
 214:	b9400020 	ldr	w0, [x1]
 218:	362fffc0 	tbz	w0, #5, 210 <_ZN6kernel2io4uart7uart_io12clear_screenEv+0x30>
 21c:	f94000a0 	ldr	x0, [x5]
 220:	b9000003 	str	w3, [x0]
 224:	39400043 	ldrb	w3, [x2]
 228:	35fffec3 	cbnz	w3, 200 <_ZN6kernel2io4uart7uart_io12clear_screenEv+0x20>
 22c:	d65f03c0 	ret
