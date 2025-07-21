
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
 124:	540001e8 	b.hi	160 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x40>  // b.pmore
 128:	90000004 	adrp	x4, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 12c:	91000084 	add	x4, x4, #0x0
 130:	39430082 	ldrb	w2, [x4, #192]
 134:	cb010042 	sub	x2, x2, x1
 138:	92402842 	and	x2, x2, #0x7ff
 13c:	b4000121 	cbz	x1, 160 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x40>
 140:	91034084 	add	x4, x4, #0xd0
 144:	8b010001 	add	x1, x0, x1
 148:	38626883 	ldrb	w3, [x4, x2]
 14c:	91000442 	add	x2, x2, #0x1
 150:	38001403 	strb	w3, [x0], #1
 154:	92402842 	and	x2, x2, #0x7ff
 158:	eb01001f 	cmp	x0, x1
 15c:	54ffff61 	b.ne	148 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x28>  // b.any
 160:	d65f03c0 	ret

0000000000000164 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>:
 164:	f120005f 	cmp	x2, #0x800
 168:	54000248 	b.hi	1b0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x4c>  // b.pmore
 16c:	90000006 	adrp	x6, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 170:	910000c6 	add	x6, x6, #0x0
 174:	aa0603e4 	mov	x4, x6
 178:	d2800003 	mov	x3, #0x0                   	// #0
 17c:	d503201f 	nop
 180:	f9400085 	ldr	x5, [x4]
 184:	91006084 	add	x4, x4, #0x18
 188:	eb05001f 	cmp	x0, x5
 18c:	54000160 	b.eq	1b8 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x54>  // b.none
 190:	91000463 	add	x3, x3, #0x1
 194:	f100207f 	cmp	x3, #0x8
 198:	54ffff41 	b.ne	180 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x1c>  // b.any
 19c:	b40000a2 	cbz	x2, 1b0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x4c>
 1a0:	8b020020 	add	x0, x1, x2
 1a4:	3800143f 	strb	wzr, [x1], #1
 1a8:	eb00003f 	cmp	x1, x0
 1ac:	54ffffc1 	b.ne	1a4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x40>  // b.any
 1b0:	d2800000 	mov	x0, #0x0                   	// #0
 1b4:	d65f03c0 	ret
 1b8:	937f7c60 	sbfiz	x0, x3, #1, #32
 1bc:	394300c5 	ldrb	w5, [x6, #192]
 1c0:	8b23c003 	add	x3, x0, w3, sxtw
 1c4:	910340c7 	add	x7, x6, #0xd0
 1c8:	8b030cc3 	add	x3, x6, x3, lsl #3
 1cc:	aa0303e4 	mov	x4, x3
 1d0:	f9400862 	ldr	x2, [x3, #16]
 1d4:	cb0200a0 	sub	x0, x5, x2
 1d8:	92402800 	and	x0, x0, #0x7ff
 1dc:	eb0200bf 	cmp	x5, x2
 1e0:	54fffea0 	b.eq	1b4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x50>  // b.none
 1e4:	386268e2 	ldrb	w2, [x7, x2]
 1e8:	38001422 	strb	w2, [x1], #1
 1ec:	f9400882 	ldr	x2, [x4, #16]
 1f0:	91000442 	add	x2, x2, #0x1
 1f4:	92402842 	and	x2, x2, #0x7ff
 1f8:	f9000882 	str	x2, [x4, #16]
 1fc:	eb0200bf 	cmp	x5, x2
 200:	54fffda0 	b.eq	1b4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x50>  // b.none
 204:	386268e2 	ldrb	w2, [x7, x2]
 208:	38001422 	strb	w2, [x1], #1
 20c:	f9400882 	ldr	x2, [x4, #16]
 210:	91000442 	add	x2, x2, #0x1
 214:	92402842 	and	x2, x2, #0x7ff
 218:	f9000882 	str	x2, [x4, #16]
 21c:	eb0200bf 	cmp	x5, x2
 220:	54fffe21 	b.ne	1e4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x80>  // b.any
 224:	17ffffe4 	b	1b4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x50>

0000000000000228 <_ZN6kernel2io12input_buffer8ib_resetEv>:
 228:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 22c:	91000042 	add	x2, x2, #0x0
 230:	91034043 	add	x3, x2, #0xd0
 234:	d2800001 	mov	x1, #0x0                   	// #0
 238:	d503201f 	nop
 23c:	d503201f 	nop
 240:	d37f7c20 	ubfiz	x0, x1, #1, #32
 244:	3823683f 	strb	wzr, [x1, x3]
 248:	8b214000 	add	x0, x0, w1, uxtw
 24c:	91000421 	add	x1, x1, #0x1
 250:	8b000c40 	add	x0, x2, x0, lsl #3
 254:	a9007c1f 	stp	xzr, xzr, [x0]
 258:	f900081f 	str	xzr, [x0, #16]
 25c:	f100203f 	cmp	x1, #0x8
 260:	54ffff01 	b.ne	240 <_ZN6kernel2io12input_buffer8ib_resetEv+0x18>  // b.any
 264:	d65f03c0 	ret
