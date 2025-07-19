
build/src/boot/exception_level/el1/exceptions/irq_el1h.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <irq_el1h>:
   0:	d2964080 	mov	x0, #0xb204                	// #45572
   4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   8:	b9400000 	ldr	w0, [x0]
   c:	37e80040 	tbnz	w0, #29, 14 <irq_el1h+0x14>
  10:	d65f03c0 	ret
  14:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  18:	d28a0801 	mov	x1, #0x5040                	// #20544
  1c:	f2a7e421 	movk	x1, #0x3f21, lsl #16
  20:	910003fd 	mov	x29, sp
  24:	90000000 	adrp	x0, 0 <irq_el1h>
  28:	f9000bf3 	str	x19, [sp, #16]
  2c:	91000000 	add	x0, x0, #0x0
  30:	b9400033 	ldr	w19, [x1]
  34:	94000000 	bl	0 <_ZN6kernel2io7uart_io4sendEPKc>
  38:	2a1303e0 	mov	w0, w19
  3c:	94000000 	bl	0 <_ZN6kernel2io7uart_io7putcharEc>
  40:	94000000 	bl	0 <_ZN6kernel2io7uart_io8new_lineEv>
  44:	f9400bf3 	ldr	x19, [sp, #16]
  48:	a8c27bfd 	ldp	x29, x30, [sp], #32
  4c:	14000000 	b	0 <_ZN6kernel2io7uart_io15return_carriageEv>
