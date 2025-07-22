
build/src/kernel/lib/debug/debug.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel3lib5debug22debug_stack_alineationEv>:
   0:	910003e0 	mov	x0, sp
   4:	92400c00 	and	x0, x0, #0xf
   8:	b5000080 	cbnz	x0, 18 <_ZN6kernel3lib5debug22debug_stack_alineationEv+0x18>
   c:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  10:	91000000 	add	x0, x0, #0x0
  14:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  18:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  1c:	91000000 	add	x0, x0, #0x0
  20:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  24:	d503201f 	nop
  28:	d503201f 	nop
  2c:	d503201f 	nop

0000000000000030 <_ZN6kernel3lib5debug10debug_sendEPKc>:
  30:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  34:	910003fd 	mov	x29, sp
  38:	f9000bf3 	str	x19, [sp, #16]
  3c:	aa0003f3 	mov	x19, x0
  40:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  44:	91000000 	add	x0, x0, #0x0
  48:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  4c:	aa1303e0 	mov	x0, x19
  50:	f9400bf3 	ldr	x19, [sp, #16]
  54:	a8c27bfd 	ldp	x29, x30, [sp], #32
  58:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  5c:	d503201f 	nop

0000000000000060 <_ZN6kernel3lib5debug12debug_sendlnEPKc>:
  60:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  64:	910003fd 	mov	x29, sp
  68:	f9000bf3 	str	x19, [sp, #16]
  6c:	aa0003f3 	mov	x19, x0
  70:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  74:	91000000 	add	x0, x0, #0x0
  78:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  7c:	aa1303e0 	mov	x0, x19
  80:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  84:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io7newlineEv>
  88:	f9400bf3 	ldr	x19, [sp, #16]
  8c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  90:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io15return_carriageEv>
  94:	d503201f 	nop
  98:	d503201f 	nop
  9c:	d503201f 	nop

00000000000000a0 <_ZN6kernel3lib5debug19debug_print_hex_u64Em>:
  a0:	a9bc7bfd 	stp	x29, x30, [sp, #-64]!
  a4:	910003fd 	mov	x29, sp
  a8:	f9000bf3 	str	x19, [sp, #16]
  ac:	aa0003f3 	mov	x19, x0
  b0:	910003e0 	mov	x0, sp
  b4:	92400c00 	and	x0, x0, #0xf
  b8:	b5000480 	cbnz	x0, 148 <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0xa8>
  bc:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  c0:	91000000 	add	x0, x0, #0x0
  c4:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  c8:	90000004 	adrp	x4, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
  cc:	91000084 	add	x4, x4, #0x0
  d0:	910083e0 	add	x0, sp, #0x20
  d4:	d2800021 	mov	x1, #0x1                   	// #1
  d8:	8b010082 	add	x2, x4, x1
  dc:	8b010003 	add	x3, x0, x1
  e0:	385ff042 	ldurb	w2, [x2, #-1]
  e4:	340003a2 	cbz	w2, 158 <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0xb8>
  e8:	381ff062 	sturb	w2, [x3, #-1]
  ec:	91000421 	add	x1, x1, #0x1
  f0:	f1004c3f 	cmp	x1, #0x13
  f4:	54ffff21 	b.ne	d8 <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0x38>  // b.any
  f8:	d2800242 	mov	x2, #0x12                  	// #18
  fc:	90000003 	adrp	x3, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 100:	91000063 	add	x3, x3, #0x0
 104:	9100c7e1 	add	x1, sp, #0x31
 108:	910087e4 	add	x4, sp, #0x21
 10c:	3822681f 	strb	wzr, [x0, x2]
 110:	92400e62 	and	x2, x19, #0xf
 114:	d344fe73 	lsr	x19, x19, #4
 118:	38626862 	ldrb	w2, [x3, x2]
 11c:	381ff422 	strb	w2, [x1], #-1
 120:	eb04003f 	cmp	x1, x4
 124:	54ffff61 	b.ne	110 <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0x70>  // b.any
 128:	3900cbff 	strb	wzr, [sp, #50]
 12c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 130:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 134:	91000000 	add	x0, x0, #0x0
 138:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 13c:	f9400bf3 	ldr	x19, [sp, #16]
 140:	a8c47bfd 	ldp	x29, x30, [sp], #64
 144:	d65f03c0 	ret
 148:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 14c:	91000000 	add	x0, x0, #0x0
 150:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 154:	17ffffdd 	b	c8 <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0x28>
 158:	d1000422 	sub	x2, x1, #0x1
 15c:	17ffffe8 	b	fc <_ZN6kernel3lib5debug19debug_print_hex_u64Em+0x5c>

0000000000000160 <_ZN6kernel3lib5debug17debug_ptr_addressEPKv>:
 160:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
 164:	aa0003e2 	mov	x2, x0
 168:	90000005 	adrp	x5, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 16c:	910000a5 	add	x5, x5, #0x0
 170:	910043e0 	add	x0, sp, #0x10
 174:	d2800021 	mov	x1, #0x1                   	// #1
 178:	910003fd 	mov	x29, sp
 17c:	d503201f 	nop
 180:	8b0100a3 	add	x3, x5, x1
 184:	8b010004 	add	x4, x0, x1
 188:	385ff063 	ldurb	w3, [x3, #-1]
 18c:	34000283 	cbz	w3, 1dc <_ZN6kernel3lib5debug17debug_ptr_addressEPKv+0x7c>
 190:	381ff083 	sturb	w3, [x4, #-1]
 194:	91000421 	add	x1, x1, #0x1
 198:	f1004c3f 	cmp	x1, #0x13
 19c:	54ffff21 	b.ne	180 <_ZN6kernel3lib5debug17debug_ptr_addressEPKv+0x20>  // b.any
 1a0:	d2800241 	mov	x1, #0x12                  	// #18
 1a4:	90000004 	adrp	x4, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 1a8:	91000084 	add	x4, x4, #0x0
 1ac:	910087e3 	add	x3, sp, #0x21
 1b0:	910047e5 	add	x5, sp, #0x11
 1b4:	3821681f 	strb	wzr, [x0, x1]
 1b8:	92400c41 	and	x1, x2, #0xf
 1bc:	d344fc42 	lsr	x2, x2, #4
 1c0:	38616881 	ldrb	w1, [x4, x1]
 1c4:	381ff461 	strb	w1, [x3], #-1
 1c8:	eb05007f 	cmp	x3, x5
 1cc:	54ffff61 	b.ne	1b8 <_ZN6kernel3lib5debug17debug_ptr_addressEPKv+0x58>  // b.any
 1d0:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 1d4:	a8c37bfd 	ldp	x29, x30, [sp], #48
 1d8:	d65f03c0 	ret
 1dc:	d1000421 	sub	x1, x1, #0x1
 1e0:	17fffff1 	b	1a4 <_ZN6kernel3lib5debug17debug_ptr_addressEPKv+0x44>
 1e4:	d503201f 	nop
 1e8:	d503201f 	nop
 1ec:	d503201f 	nop

00000000000001f0 <_ZN6kernel3lib5debug14debug_print_spEv>:
 1f0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
 1f4:	910003fd 	mov	x29, sp
 1f8:	f9000bf3 	str	x19, [sp, #16]
 1fc:	910003f3 	mov	x19, sp
 200:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 204:	91000000 	add	x0, x0, #0x0
 208:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 20c:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 210:	91000000 	add	x0, x0, #0x0
 214:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 218:	aa1303e0 	mov	x0, x19
 21c:	f9400bf3 	ldr	x19, [sp, #16]
 220:	a8c27bfd 	ldp	x29, x30, [sp], #32
 224:	14000000 	b	160 <_ZN6kernel3lib5debug17debug_ptr_addressEPKv>
 228:	d503201f 	nop
 22c:	d503201f 	nop

0000000000000230 <_ZN6kernel3lib5debug15check_sp_boundsEv>:
 230:	910003e1 	mov	x1, sp
 234:	90000000 	adrp	x0, 0 <_stack_el1_bottom>
 238:	91000000 	add	x0, x0, #0x0
 23c:	eb00003f 	cmp	x1, x0
 240:	540000a3 	b.cc	254 <_ZN6kernel3lib5debug15check_sp_boundsEv+0x24>  // b.lo, b.ul, b.last
 244:	90000000 	adrp	x0, 0 <_stack_el1_top>
 248:	91000000 	add	x0, x0, #0x0
 24c:	eb00003f 	cmp	x1, x0
 250:	54000083 	b.cc	260 <_ZN6kernel3lib5debug15check_sp_boundsEv+0x30>  // b.lo, b.ul, b.last
 254:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 258:	91000000 	add	x0, x0, #0x0
 25c:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 260:	90000000 	adrp	x0, 0 <_ZN6kernel3lib5debug22debug_stack_alineationEv>
 264:	91000000 	add	x0, x0, #0x0
 268:	14000000 	b	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
