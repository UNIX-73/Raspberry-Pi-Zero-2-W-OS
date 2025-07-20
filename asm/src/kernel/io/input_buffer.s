
build/src/kernel/io/input_buffer.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel2io12input_buffer9subscribeEm>:
   0:	90000006 	adrp	x6, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
   4:	910000c6 	add	x6, x6, #0x0
   8:	910020c5 	add	x5, x6, #0x8
   c:	12800004 	mov	w4, #0xffffffff            	// #-1
  10:	aa0503e1 	mov	x1, x5
  14:	2a0403e7 	mov	w7, w4
  18:	d2800002 	mov	x2, #0x0                   	// #0
  1c:	1400000a 	b	44 <_ZN6kernel2io12input_buffer9subscribeEm+0x44>
  20:	3100049f 	cmn	w4, #0x1
  24:	b4000203 	cbz	x3, 64 <_ZN6kernel2io12input_buffer9subscribeEm+0x64>
  28:	b9400023 	ldr	w3, [x1]
  2c:	11000463 	add	w3, w3, #0x1
  30:	b9000023 	str	w3, [x1]
  34:	91000442 	add	x2, x2, #0x1
  38:	91006021 	add	x1, x1, #0x18
  3c:	f100205f 	cmp	x2, #0x8
  40:	540001c0 	b.eq	78 <_ZN6kernel2io12input_buffer9subscribeEm+0x78>  // b.none
  44:	f85f8023 	ldur	x3, [x1, #-8]
  48:	eb00007f 	cmp	x3, x0
  4c:	54fffea1 	b.ne	20 <_ZN6kernel2io12input_buffer9subscribeEm+0x20>  // b.any
  50:	b900003f 	str	wzr, [x1]
  54:	2a0203e7 	mov	w7, w2
  58:	3100049f 	cmn	w4, #0x1
  5c:	54fffec1 	b.ne	34 <_ZN6kernel2io12input_buffer9subscribeEm+0x34>  // b.any
  60:	f100001f 	cmp	x0, #0x0
  64:	1a821084 	csel	w4, w4, w2, ne	// ne = any
  68:	91000442 	add	x2, x2, #0x1
  6c:	91006021 	add	x1, x1, #0x18
  70:	f100205f 	cmp	x2, #0x8
  74:	54fffe81 	b.ne	44 <_ZN6kernel2io12input_buffer9subscribeEm+0x44>  // b.any
  78:	310004ff 	cmn	w7, #0x1
  7c:	540002a1 	b.ne	d0 <_ZN6kernel2io12input_buffer9subscribeEm+0xd0>  // b.any
  80:	394300c7 	ldrb	w7, [x6, #192]
  84:	3100049f 	cmn	w4, #0x1
  88:	54000261 	b.ne	d4 <_ZN6kernel2io12input_buffer9subscribeEm+0xd4>  // b.any
  8c:	d2800001 	mov	x1, #0x0                   	// #0
  90:	d2800002 	mov	x2, #0x0                   	// #0
  94:	d2800004 	mov	x4, #0x0                   	// #0
  98:	d503201f 	nop
  9c:	d503201f 	nop
  a0:	b84184a3 	ldr	w3, [x5], #24
  a4:	eb02007f 	cmp	x3, x2
  a8:	9a842024 	csel	x4, x1, x4, cs	// cs = hs, nlast
  ac:	91000421 	add	x1, x1, #0x1
  b0:	9a822062 	csel	x2, x3, x2, cs	// cs = hs, nlast
  b4:	f100203f 	cmp	x1, #0x8
  b8:	54ffff41 	b.ne	a0 <_ZN6kernel2io12input_buffer9subscribeEm+0xa0>  // b.any
  bc:	8b040484 	add	x4, x4, x4, lsl #1
  c0:	8b040cc1 	add	x1, x6, x4, lsl #3
  c4:	f82478c0 	str	x0, [x6, x4, lsl #3]
  c8:	b900083f 	str	wzr, [x1, #8]
  cc:	f9000827 	str	x7, [x1, #16]
  d0:	d65f03c0 	ret
  d4:	937f7c81 	sbfiz	x1, x4, #1, #32
  d8:	8b24c021 	add	x1, x1, w4, sxtw
  dc:	d37df021 	lsl	x1, x1, #3
  e0:	8b0100c2 	add	x2, x6, x1
  e4:	f82168c0 	str	x0, [x6, x1]
  e8:	b900085f 	str	wzr, [x2, #8]
  ec:	f9000847 	str	x7, [x2, #16]
  f0:	d65f03c0 	ret
  f4:	d503201f 	nop
  f8:	d503201f 	nop
  fc:	d503201f 	nop

0000000000000100 <_ZN6kernel2io12input_buffer12ib_push_charEh>:
 100:	90000001 	adrp	x1, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 104:	91000021 	add	x1, x1, #0x0
 108:	91034024 	add	x4, x1, #0xd0
 10c:	90000003 	adrp	x3, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 110:	39430022 	ldrb	w2, [x1, #192]
 114:	11000445 	add	w5, w2, #0x1
 118:	39030025 	strb	w5, [x1, #192]
 11c:	38224880 	strb	w0, [x4, w2, uxtw]
 120:	91000060 	add	x0, x3, #0x0
 124:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>

0000000000000128 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm>:
 128:	f120003f 	cmp	x1, #0x800
 12c:	54000208 	b.hi	16c <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x44>  // b.pmore
 130:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 134:	91000042 	add	x2, x2, #0x0
 138:	91034044 	add	x4, x2, #0xd0
 13c:	8b010003 	add	x3, x0, x1
 140:	39430042 	ldrb	w2, [x2, #192]
 144:	cb010042 	sub	x2, x2, x1
 148:	92402842 	and	x2, x2, #0x7ff
 14c:	b40000e1 	cbz	x1, 168 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x40>
 150:	38626881 	ldrb	w1, [x4, x2]
 154:	91000442 	add	x2, x2, #0x1
 158:	38001401 	strb	w1, [x0], #1
 15c:	92402842 	and	x2, x2, #0x7ff
 160:	eb03001f 	cmp	x0, x3
 164:	54ffff61 	b.ne	150 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x28>  // b.any
 168:	d65f03c0 	ret
 16c:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 170:	91000000 	add	x0, x0, #0x0
 174:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 178:	d503201f 	nop
 17c:	d503201f 	nop

0000000000000180 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>:
 180:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 184:	910003fd 	mov	x29, sp
 188:	f120005f 	cmp	x2, #0x800
 18c:	54000628 	b.hi	250 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xd0>  // b.pmore
 190:	a90153f3 	stp	x19, x20, [sp, #16]
 194:	aa0203f4 	mov	x20, x2
 198:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 19c:	91000042 	add	x2, x2, #0x0
 1a0:	aa0103f3 	mov	x19, x1
 1a4:	aa0203e3 	mov	x3, x2
 1a8:	d2800001 	mov	x1, #0x0                   	// #0
 1ac:	f9400064 	ldr	x4, [x3]
 1b0:	91006063 	add	x3, x3, #0x18
 1b4:	eb04001f 	cmp	x0, x4
 1b8:	54000220 	b.eq	1fc <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x7c>  // b.none
 1bc:	91000421 	add	x1, x1, #0x1
 1c0:	f100203f 	cmp	x1, #0x8
 1c4:	54ffff41 	b.ne	1ac <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x2c>  // b.any
 1c8:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 1cc:	91000000 	add	x0, x0, #0x0
 1d0:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 1d4:	aa1303e1 	mov	x1, x19
 1d8:	8b140260 	add	x0, x19, x20
 1dc:	b4000094 	cbz	x20, 1ec <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x6c>
 1e0:	3800143f 	strb	wzr, [x1], #1
 1e4:	eb00003f 	cmp	x1, x0
 1e8:	54ffffc1 	b.ne	1e0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x60>  // b.any
 1ec:	a94153f3 	ldp	x19, x20, [sp, #16]
 1f0:	d2800000 	mov	x0, #0x0                   	// #0
 1f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
 1f8:	d65f03c0 	ret
 1fc:	8b010420 	add	x0, x1, x1, lsl #1
 200:	39430043 	ldrb	w3, [x2, #192]
 204:	91034044 	add	x4, x2, #0xd0
 208:	aa1303e1 	mov	x1, x19
 20c:	8b000c40 	add	x0, x2, x0, lsl #3
 210:	f9400805 	ldr	x5, [x0, #16]
 214:	aa0503e2 	mov	x2, x5
 218:	eb05007f 	cmp	x3, x5
 21c:	54000120 	b.eq	240 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xc0>  // b.none
 220:	38626882 	ldrb	w2, [x4, x2]
 224:	38001422 	strb	w2, [x1], #1
 228:	f9400802 	ldr	x2, [x0, #16]
 22c:	91000442 	add	x2, x2, #0x1
 230:	92402842 	and	x2, x2, #0x7ff
 234:	f9000802 	str	x2, [x0, #16]
 238:	eb02007f 	cmp	x3, x2
 23c:	54ffff21 	b.ne	220 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xa0>  // b.any
 240:	cb050060 	sub	x0, x3, x5
 244:	a94153f3 	ldp	x19, x20, [sp, #16]
 248:	92402800 	and	x0, x0, #0x7ff
 24c:	17ffffea 	b	1f4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x74>
 250:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 254:	91000000 	add	x0, x0, #0x0
 258:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 25c:	17ffffe5 	b	1f0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x70>

0000000000000260 <_ZN6kernel2io12input_buffer8ib_resetEv>:
 260:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 264:	91000042 	add	x2, x2, #0x0
 268:	91034043 	add	x3, x2, #0xd0
 26c:	d2800001 	mov	x1, #0x0                   	// #0
 270:	d37f7c20 	ubfiz	x0, x1, #1, #32
 274:	3823683f 	strb	wzr, [x1, x3]
 278:	8b214000 	add	x0, x0, w1, uxtw
 27c:	91000421 	add	x1, x1, #0x1
 280:	8b000c40 	add	x0, x2, x0, lsl #3
 284:	a9007c1f 	stp	xzr, xzr, [x0]
 288:	f900081f 	str	xzr, [x0, #16]
 28c:	f120003f 	cmp	x1, #0x800
 290:	54ffff01 	b.ne	270 <_ZN6kernel2io12input_buffer8ib_resetEv+0x10>  // b.any
 294:	d65f03c0 	ret
