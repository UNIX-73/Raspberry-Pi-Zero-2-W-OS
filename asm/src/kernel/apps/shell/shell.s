
build/src/kernel/apps/shell/shell.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel4apps5shell3runEm>:
   0:	a9bb7bfd 	stp	x29, x30, [sp, #-80]!
   4:	910003fd 	mov	x29, sp
   8:	a90153f3 	stp	x19, x20, [sp, #16]
   c:	a9025bf5 	stp	x21, x22, [sp, #32]
  10:	aa0003f6 	mov	x22, x0
  14:	9100c3f5 	add	x21, sp, #0x30
  18:	94000000 	bl	0 <_ZN6kernel2io12input_buffer9subscribeEm>
  1c:	90000000 	adrp	x0, 0 <_ZN6kernel4apps5shell3runEm>
  20:	91000000 	add	x0, x0, #0x0
  24:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
  28:	a9037fff 	stp	xzr, xzr, [sp, #48]
  2c:	a9047fff 	stp	xzr, xzr, [sp, #64]
  30:	aa1503e1 	mov	x1, x21
  34:	aa1603e0 	mov	x0, x22
  38:	d2800402 	mov	x2, #0x20                  	// #32
  3c:	94000000 	bl	0 <_ZN6kernel2io12input_buffer14ib_read_unreadEmPhm>
  40:	b40000e0 	cbz	x0, 5c <_ZN6kernel4apps5shell3runEm+0x5c>
  44:	8b0002b4 	add	x20, x21, x0
  48:	aa1503f3 	mov	x19, x21
  4c:	38401660 	ldrb	w0, [x19], #1
  50:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler17handle_input_charEh>
  54:	eb14027f 	cmp	x19, x20
  58:	54ffffa1 	b.ne	4c <_ZN6kernel4apps5shell3runEm+0x4c>  // b.any
  5c:	5289c400 	mov	w0, #0x4e20                	// #20000
  60:	d503201f 	nop
  64:	71000400 	subs	w0, w0, #0x1
  68:	54ffffc1 	b.ne	60 <_ZN6kernel4apps5shell3runEm+0x60>  // b.any
  6c:	17fffff1 	b	30 <_ZN6kernel4apps5shell3runEm+0x30>

0000000000000070 <_ZN6kernel4apps5shell5resetEv>:
  70:	d65f03c0 	ret
