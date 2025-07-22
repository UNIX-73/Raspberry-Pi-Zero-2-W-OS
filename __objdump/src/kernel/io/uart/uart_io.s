
build/src/kernel/io/uart/uart_io.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel2io4uart7uart_io7putcharEc>:
   0:	90000001 	adrp	x1, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
   4:	f9400022 	ldr	x2, [x1]
   8:	12001c00 	and	w0, w0, #0xff
   c:	b9400042 	ldr	w2, [x2]
  10:	372800a2 	tbnz	w2, #5, 24 <_ZN6kernel2io4uart7uart_io7putcharEc+0x24>
  14:	f9400022 	ldr	x2, [x1]
  18:	d503201f 	nop
  1c:	b9400041 	ldr	w1, [x2]
  20:	362fffc1 	tbz	w1, #5, 18 <_ZN6kernel2io4uart7uart_io7putcharEc+0x18>
  24:	90000001 	adrp	x1, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  28:	f9400021 	ldr	x1, [x1]
  2c:	b9000020 	str	w0, [x1]
  30:	d65f03c0 	ret
  34:	d503201f 	nop
  38:	d503201f 	nop
  3c:	d503201f 	nop

0000000000000040 <_ZN6kernel2io4uart7uart_io7newlineEv>:
  40:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
  44:	f9400001 	ldr	x1, [x0]
  48:	b9400021 	ldr	w1, [x1]
  4c:	372800c1 	tbnz	w1, #5, 64 <_ZN6kernel2io4uart7uart_io7newlineEv+0x24>
  50:	f9400001 	ldr	x1, [x0]
  54:	d503201f 	nop
  58:	d503201f 	nop
  5c:	b9400020 	ldr	w0, [x1]
  60:	362fffc0 	tbz	w0, #5, 58 <_ZN6kernel2io4uart7uart_io7newlineEv+0x18>
  64:	90000000 	adrp	x0, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  68:	f9400000 	ldr	x0, [x0]
  6c:	52800141 	mov	w1, #0xa                   	// #10
  70:	b9000001 	str	w1, [x0]
  74:	d65f03c0 	ret
  78:	d503201f 	nop
  7c:	d503201f 	nop

0000000000000080 <_ZN6kernel2io4uart7uart_io15return_carriageEv>:
  80:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
  84:	f9400001 	ldr	x1, [x0]
  88:	b9400021 	ldr	w1, [x1]
  8c:	372800c1 	tbnz	w1, #5, a4 <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x24>
  90:	f9400001 	ldr	x1, [x0]
  94:	d503201f 	nop
  98:	d503201f 	nop
  9c:	b9400020 	ldr	w0, [x1]
  a0:	362fffc0 	tbz	w0, #5, 98 <_ZN6kernel2io4uart7uart_io15return_carriageEv+0x18>
  a4:	90000000 	adrp	x0, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  a8:	f9400000 	ldr	x0, [x0]
  ac:	528001a1 	mov	w1, #0xd                   	// #13
  b0:	b9000001 	str	w1, [x0]
  b4:	d65f03c0 	ret
  b8:	d503201f 	nop
  bc:	d503201f 	nop

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
 118:	f94000a3 	ldr	x3, [x5]
 11c:	90000007 	adrp	x7, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
 120:	910000e6 	add	x6, x7, #0x0
 124:	340001a4 	cbz	w4, 158 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x48>
 128:	b9400061 	ldr	w1, [x3]
 12c:	91000400 	add	x0, x0, #0x1
 130:	372800c1 	tbnz	w1, #5, 148 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x38>
 134:	f94000a1 	ldr	x1, [x5]
 138:	d503201f 	nop
 13c:	b9400022 	ldr	w2, [x1]
 140:	aa0103e3 	mov	x3, x1
 144:	362fffa2 	tbz	w2, #5, 138 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x28>
 148:	f94000c1 	ldr	x1, [x6]
 14c:	b9000024 	str	w4, [x1]
 150:	39400004 	ldrb	w4, [x0]
 154:	35fffea4 	cbnz	w4, 128 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x18>
 158:	b9400060 	ldr	w0, [x3]
 15c:	372800e0 	tbnz	w0, #5, 178 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x68>
 160:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 164:	f9400000 	ldr	x0, [x0]
 168:	d503201f 	nop
 16c:	b9400001 	ldr	w1, [x0]
 170:	aa0003e3 	mov	x3, x0
 174:	362fffa1 	tbz	w1, #5, 168 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x58>
 178:	f94000e0 	ldr	x0, [x7]
 17c:	52800141 	mov	w1, #0xa                   	// #10
 180:	b9000001 	str	w1, [x0]
 184:	b9400061 	ldr	w1, [x3]
 188:	37280101 	tbnz	w1, #5, 1a8 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x98>
 18c:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_LSR_REG_ADDR_PTRE>
 190:	f9400001 	ldr	x1, [x0]
 194:	d503201f 	nop
 198:	d503201f 	nop
 19c:	b9400020 	ldr	w0, [x1]
 1a0:	362fffc0 	tbz	w0, #5, 198 <_ZN6kernel2io4uart7uart_io6sendlnEPKc+0x88>
 1a4:	f94000e0 	ldr	x0, [x7]
 1a8:	528001a1 	mov	w1, #0xd                   	// #13
 1ac:	b9000001 	str	w1, [x0]
 1b0:	d65f03c0 	ret
 1b4:	d503201f 	nop
 1b8:	d503201f 	nop
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
 1ec:	91000042 	add	x2, x2, #0x0
 1f0:	90000005 	adrp	x5, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
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
