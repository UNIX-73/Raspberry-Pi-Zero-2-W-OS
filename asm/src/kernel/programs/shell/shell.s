
build/src/kernel/programs/shell/shell.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5shell3runEmPKc>:
   0:	a9ba7bfd 	stp	x29, x30, [sp, #-96]!
   4:	910003fd 	mov	x29, sp
   8:	a9025bf5 	stp	x21, x22, [sp, #32]
   c:	90000016 	adrp	x22, 0 <_ZN6kernel8programs5shell3runEmPKc>
  10:	f9001bf7 	str	x23, [sp, #48]
  14:	aa0003f7 	mov	x23, x0
  18:	94000000 	bl	0 <_ZN6kernel2io12input_buffer9subscribeEm>
  1c:	52800021 	mov	w1, #0x1                   	// #1
  20:	90000000 	adrp	x0, 0 <_ZN6kernel8programs5shell3runEmPKc>
  24:	390002c1 	strb	w1, [x22]
  28:	91000000 	add	x0, x0, #0x0
  2c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  30:	a9047fff 	stp	xzr, xzr, [sp, #64]
  34:	394002c0 	ldrb	w0, [x22]
  38:	a9057fff 	stp	xzr, xzr, [sp, #80]
  3c:	360002e0 	tbz	w0, #0, 98 <_ZN6kernel8programs5shell3runEmPKc+0x98>
  40:	910002d6 	add	x22, x22, #0x0
  44:	910103f5 	add	x21, sp, #0x40
  48:	a90153f3 	stp	x19, x20, [sp, #16]
  4c:	aa1503e1 	mov	x1, x21
  50:	aa1703e0 	mov	x0, x23
  54:	d2800402 	mov	x2, #0x20                  	// #32
  58:	94000000 	bl	0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>
  5c:	b40000e0 	cbz	x0, 78 <_ZN6kernel8programs5shell3runEmPKc+0x78>
  60:	8b0002b4 	add	x20, x21, x0
  64:	aa1503f3 	mov	x19, x21
  68:	38401660 	ldrb	w0, [x19], #1
  6c:	94000000 	bl	0 <_ZN6kernel8programs5shell8internal13input_handler17handle_input_charEh>
  70:	eb14027f 	cmp	x19, x20
  74:	54ffffa1 	b.ne	68 <_ZN6kernel8programs5shell3runEmPKc+0x68>  // b.any
  78:	5289c400 	mov	w0, #0x4e20                	// #20000
  7c:	d503201f 	nop
  80:	d503201f 	nop
  84:	71000400 	subs	w0, w0, #0x1
  88:	54ffffc1 	b.ne	80 <_ZN6kernel8programs5shell3runEmPKc+0x80>  // b.any
  8c:	394002c0 	ldrb	w0, [x22]
  90:	3707fde0 	tbnz	w0, #0, 4c <_ZN6kernel8programs5shell3runEmPKc+0x4c>
  94:	a94153f3 	ldp	x19, x20, [sp, #16]
  98:	d2800000 	mov	x0, #0x0                   	// #0
  9c:	f9401bf7 	ldr	x23, [sp, #48]
  a0:	a9425bf5 	ldp	x21, x22, [sp, #32]
  a4:	a8c67bfd 	ldp	x29, x30, [sp], #96
  a8:	d65f03c0 	ret

00000000000000ac <_ZN6kernel8programs5shell5resetEv>:
  ac:	d65f03c0 	ret
