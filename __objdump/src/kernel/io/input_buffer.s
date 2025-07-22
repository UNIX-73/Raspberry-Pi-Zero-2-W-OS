
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
  54:	3100049f 	cmn	w4, #0x1
  58:	2a0203e7 	mov	w7, w2
  5c:	54fffec1 	b.ne	34 <_ZN6kernel2io12input_buffer9subscribeEm+0x34>  // b.any
  60:	f100001f 	cmp	x0, #0x0
  64:	1a821084 	csel	w4, w4, w2, ne	// ne = any
  68:	91000442 	add	x2, x2, #0x1
  6c:	91006021 	add	x1, x1, #0x18
  70:	f100205f 	cmp	x2, #0x8
  74:	54fffe81 	b.ne	44 <_ZN6kernel2io12input_buffer9subscribeEm+0x44>  // b.any
  78:	310004ff 	cmn	w7, #0x1
  7c:	54000281 	b.ne	cc <_ZN6kernel2io12input_buffer9subscribeEm+0xcc>  // b.any
  80:	394300c7 	ldrb	w7, [x6, #192]
  84:	3100049f 	cmn	w4, #0x1
  88:	54000241 	b.ne	d0 <_ZN6kernel2io12input_buffer9subscribeEm+0xd0>  // b.any
  8c:	d2800001 	mov	x1, #0x0                   	// #0
  90:	d2800002 	mov	x2, #0x0                   	// #0
  94:	d2800004 	mov	x4, #0x0                   	// #0
  98:	b84184a3 	ldr	w3, [x5], #24
  9c:	eb02007f 	cmp	x3, x2
  a0:	9a842024 	csel	x4, x1, x4, cs	// cs = hs, nlast
  a4:	91000421 	add	x1, x1, #0x1
  a8:	9a822062 	csel	x2, x3, x2, cs	// cs = hs, nlast
  ac:	f100203f 	cmp	x1, #0x8
  b0:	54ffff41 	b.ne	98 <_ZN6kernel2io12input_buffer9subscribeEm+0x98>  // b.any
  b4:	d2800301 	mov	x1, #0x18                  	// #24
  b8:	9b017c84 	mul	x4, x4, x1
  bc:	8b0400c1 	add	x1, x6, x4
  c0:	f82468c0 	str	x0, [x6, x4]
  c4:	b900083f 	str	wzr, [x1, #8]
  c8:	f9000827 	str	x7, [x1, #16]
  cc:	d65f03c0 	ret
  d0:	93407c81 	sxtw	x1, w4
  d4:	d2800302 	mov	x2, #0x18                  	// #24
  d8:	9b027c21 	mul	x1, x1, x2
  dc:	8b0100c2 	add	x2, x6, x1
  e0:	f82168c0 	str	x0, [x6, x1]
  e4:	b900085f 	str	wzr, [x2, #8]
  e8:	f9000847 	str	x7, [x2, #16]
  ec:	d65f03c0 	ret

00000000000000f0 <_ZN6kernel2io12input_buffer12ib_push_charEh>:
  f0:	90000001 	adrp	x1, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
  f4:	91000021 	add	x1, x1, #0x0
  f8:	91034023 	add	x3, x1, #0xd0
  fc:	39430022 	ldrb	w2, [x1, #192]
 100:	11000444 	add	w4, w2, #0x1
 104:	39030024 	strb	w4, [x1, #192]
 108:	38224860 	strb	w0, [x3, w2, uxtw]
 10c:	d65f03c0 	ret

0000000000000110 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm>:
 110:	f120003f 	cmp	x1, #0x800
 114:	54000208 	b.hi	154 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x44>  // b.pmore
 118:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 11c:	91000042 	add	x2, x2, #0x0
 120:	91034044 	add	x4, x2, #0xd0
 124:	8b010003 	add	x3, x0, x1
 128:	39430042 	ldrb	w2, [x2, #192]
 12c:	cb010042 	sub	x2, x2, x1
 130:	92402842 	and	x2, x2, #0x7ff
 134:	b40000e1 	cbz	x1, 150 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x40>
 138:	38626881 	ldrb	w1, [x4, x2]
 13c:	91000442 	add	x2, x2, #0x1
 140:	38001401 	strb	w1, [x0], #1
 144:	92402842 	and	x2, x2, #0x7ff
 148:	eb03001f 	cmp	x0, x3
 14c:	54ffff61 	b.ne	138 <_ZN6kernel2io12input_buffer11ib_get_dataEPhm+0x28>  // b.any
 150:	d65f03c0 	ret
 154:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 158:	91000000 	add	x0, x0, #0x0
 15c:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>

0000000000000160 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>:
 160:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 164:	f120005f 	cmp	x2, #0x800
 168:	910003fd 	mov	x29, sp
 16c:	540006e8 	b.hi	248 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xe8>  // b.pmore
 170:	90000005 	adrp	x5, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 174:	910000a5 	add	x5, x5, #0x0
 178:	aa0503e3 	mov	x3, x5
 17c:	a90153f3 	stp	x19, x20, [sp, #16]
 180:	aa0203f4 	mov	x20, x2
 184:	aa0103f3 	mov	x19, x1
 188:	d2800001 	mov	x1, #0x0                   	// #0
 18c:	d503201f 	nop
 190:	f9400064 	ldr	x4, [x3]
 194:	91006063 	add	x3, x3, #0x18
 198:	eb04001f 	cmp	x0, x4
 19c:	54000240 	b.eq	1e4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x84>  // b.none
 1a0:	91000421 	add	x1, x1, #0x1
 1a4:	f100203f 	cmp	x1, #0x8
 1a8:	54ffff41 	b.ne	190 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x30>  // b.any
 1ac:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 1b0:	91000000 	add	x0, x0, #0x0
 1b4:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 1b8:	aa1303e1 	mov	x1, x19
 1bc:	8b140260 	add	x0, x19, x20
 1c0:	b40000b4 	cbz	x20, 1d4 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x74>
 1c4:	d503201f 	nop
 1c8:	3800143f 	strb	wzr, [x1], #1
 1cc:	eb00003f 	cmp	x1, x0
 1d0:	54ffffc1 	b.ne	1c8 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x68>  // b.any
 1d4:	a94153f3 	ldp	x19, x20, [sp, #16]
 1d8:	d2800000 	mov	x0, #0x0                   	// #0
 1dc:	a8c27bfd 	ldp	x29, x30, [sp], #32
 1e0:	d65f03c0 	ret
 1e4:	93407c20 	sxtw	x0, w1
 1e8:	d2800307 	mov	x7, #0x18                  	// #24
 1ec:	394300a3 	ldrb	w3, [x5, #192]
 1f0:	9b071400 	madd	x0, x0, x7, x5
 1f4:	f9400806 	ldr	x6, [x0, #16]
 1f8:	eb06007f 	cmp	x3, x6
 1fc:	540001e0 	b.eq	238 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xd8>  // b.none
 200:	93407c20 	sxtw	x0, w1
 204:	910340a4 	add	x4, x5, #0xd0
 208:	aa1303e1 	mov	x1, x19
 20c:	aa0603e2 	mov	x2, x6
 210:	9b071400 	madd	x0, x0, x7, x5
 214:	d503201f 	nop
 218:	38626882 	ldrb	w2, [x4, x2]
 21c:	38001422 	strb	w2, [x1], #1
 220:	f9400802 	ldr	x2, [x0, #16]
 224:	91000442 	add	x2, x2, #0x1
 228:	92402842 	and	x2, x2, #0x7ff
 22c:	f9000802 	str	x2, [x0, #16]
 230:	eb02007f 	cmp	x3, x2
 234:	54ffff21 	b.ne	218 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0xb8>  // b.any
 238:	cb060060 	sub	x0, x3, x6
 23c:	a94153f3 	ldp	x19, x20, [sp, #16]
 240:	92402800 	and	x0, x0, #0x7ff
 244:	17ffffe6 	b	1dc <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x7c>
 248:	90000000 	adrp	x0, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 24c:	91000000 	add	x0, x0, #0x0
 250:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 254:	17ffffe1 	b	1d8 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm+0x78>
 258:	d503201f 	nop
 25c:	d503201f 	nop

0000000000000260 <_ZN6kernel2io12input_buffer8ib_resetEv>:
 260:	90000002 	adrp	x2, 0 <_ZN6kernel2io12input_buffer9subscribeEm>
 264:	91000042 	add	x2, x2, #0x0
 268:	91034044 	add	x4, x2, #0xd0
 26c:	d2800000 	mov	x0, #0x0                   	// #0
 270:	d2800303 	mov	x3, #0x18                  	// #24
 274:	d503201f 	nop
 278:	2a0003e1 	mov	w1, w0
 27c:	3824681f 	strb	wzr, [x0, x4]
 280:	91000400 	add	x0, x0, #0x1
 284:	f100201f 	cmp	x0, #0x8
 288:	9b030821 	madd	x1, x1, x3, x2
 28c:	a9007c3f 	stp	xzr, xzr, [x1]
 290:	f900083f 	str	xzr, [x1, #16]
 294:	54ffff21 	b.ne	278 <_ZN6kernel2io12input_buffer8ib_resetEv+0x18>  // b.any
 298:	d65f03c0 	ret
