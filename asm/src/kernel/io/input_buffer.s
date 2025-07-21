
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
 108:	91034023 	add	x3, x1, #0xd0
 10c:	39430022 	ldrb	w2, [x1, #192]
 110:	11000444 	add	w4, w2, #0x1
 114:	39030024 	strb	w4, [x1, #192]
 118:	38224860 	strb	w0, [x3, w2, uxtw]
 11c:	d65f03c0 	ret

0000000000000120 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm>:
 120:	f120003f 	cmp	x1, #0x800
 124:	54000208 	b.hi	164 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x44>  // b.pmore
 128:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 12c:	91000042 	add	x2, x2, #0x0
 130:	91034044 	add	x4, x2, #0xd0
 134:	8b010003 	add	x3, x0, x1
 138:	39430042 	ldrb	w2, [x2, #192]
 13c:	cb010042 	sub	x2, x2, x1
 140:	92402842 	and	x2, x2, #0x7ff
 144:	b40000e1 	cbz	x1, 160 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x40>
 148:	38626881 	ldrb	w1, [x4, x2]
 14c:	91000442 	add	x2, x2, #0x1
 150:	38001401 	strb	w1, [x0], #1
 154:	92402842 	and	x2, x2, #0x7ff
 158:	eb03001f 	cmp	x0, x3
 15c:	54ffff61 	b.ne	148 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x28>  // b.any
 160:	d65f03c0 	ret
 164:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 168:	91000000 	add	x0, x0, #0x0
 16c:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>

0000000000000170 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>:
 170:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 174:	910003fd 	mov	x29, sp
 178:	f120005f 	cmp	x2, #0x800
 17c:	540006e8 	b.hi	258 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xe8>  // b.pmore
 180:	90000005 	adrp	x5, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 184:	910000a5 	add	x5, x5, #0x0
 188:	aa0503e3 	mov	x3, x5
 18c:	a90153f3 	stp	x19, x20, [sp, #16]
 190:	aa0203f4 	mov	x20, x2
 194:	aa0103f3 	mov	x19, x1
 198:	d2800001 	mov	x1, #0x0                   	// #0
 19c:	d503201f 	nop
 1a0:	f9400064 	ldr	x4, [x3]
 1a4:	91006063 	add	x3, x3, #0x18
 1a8:	eb04001f 	cmp	x0, x4
 1ac:	54000280 	b.eq	1fc <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x8c>  // b.none
 1b0:	91000421 	add	x1, x1, #0x1
 1b4:	f100203f 	cmp	x1, #0x8
 1b8:	54ffff41 	b.ne	1a0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x30>  // b.any
 1bc:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 1c0:	91000000 	add	x0, x0, #0x0
 1c4:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 1c8:	aa1303e1 	mov	x1, x19
 1cc:	8b140260 	add	x0, x19, x20
 1d0:	b40000f4 	cbz	x20, 1ec <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x7c>
 1d4:	d503201f 	nop
 1d8:	d503201f 	nop
 1dc:	d503201f 	nop
 1e0:	3800143f 	strb	wzr, [x1], #1
 1e4:	eb00003f 	cmp	x1, x0
 1e8:	54ffffc1 	b.ne	1e0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x70>  // b.any
 1ec:	a94153f3 	ldp	x19, x20, [sp, #16]
 1f0:	d2800000 	mov	x0, #0x0                   	// #0
 1f4:	a8c27bfd 	ldp	x29, x30, [sp], #32
 1f8:	d65f03c0 	ret
 1fc:	937f7c20 	sbfiz	x0, x1, #1, #32
 200:	394300a3 	ldrb	w3, [x5, #192]
 204:	8b21c000 	add	x0, x0, w1, sxtw
 208:	910340a4 	add	x4, x5, #0xd0
 20c:	aa1303e1 	mov	x1, x19
 210:	8b000ca0 	add	x0, x5, x0, lsl #3
 214:	aa0003e2 	mov	x2, x0
 218:	f9400805 	ldr	x5, [x0, #16]
 21c:	aa0503e0 	mov	x0, x5
 220:	eb05007f 	cmp	x3, x5
 224:	54000120 	b.eq	248 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xd8>  // b.none
 228:	38606880 	ldrb	w0, [x4, x0]
 22c:	38001420 	strb	w0, [x1], #1
 230:	f9400840 	ldr	x0, [x2, #16]
 234:	91000400 	add	x0, x0, #0x1
 238:	92402800 	and	x0, x0, #0x7ff
 23c:	f9000840 	str	x0, [x2, #16]
 240:	eb00007f 	cmp	x3, x0
 244:	54ffff21 	b.ne	228 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xb8>  // b.any
 248:	cb050060 	sub	x0, x3, x5
 24c:	a94153f3 	ldp	x19, x20, [sp, #16]
 250:	92402800 	and	x0, x0, #0x7ff
 254:	17ffffe8 	b	1f4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x84>
 258:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 25c:	91000000 	add	x0, x0, #0x0
 260:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 264:	17ffffe3 	b	1f0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x80>

0000000000000268 <_ZN6kernel2io12input_buffer8ib_resetEv>:
 268:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 26c:	91000042 	add	x2, x2, #0x0
 270:	91034043 	add	x3, x2, #0xd0
 274:	d2800001 	mov	x1, #0x0                   	// #0
 278:	d503201f 	nop
 27c:	d503201f 	nop
 280:	d37f7c20 	ubfiz	x0, x1, #1, #32
 284:	3823683f 	strb	wzr, [x1, x3]
 288:	8b214000 	add	x0, x0, w1, uxtw
 28c:	91000421 	add	x1, x1, #0x1
 290:	8b000c40 	add	x0, x2, x0, lsl #3
 294:	a9007c1f 	stp	xzr, xzr, [x0]
 298:	f900081f 	str	xzr, [x0, #16]
 29c:	f100203f 	cmp	x1, #0x8
 2a0:	54ffff01 	b.ne	280 <_ZN6kernel2io12input_buffer8ib_resetEv+0x18>  // b.any
 2a4:	d65f03c0 	ret
