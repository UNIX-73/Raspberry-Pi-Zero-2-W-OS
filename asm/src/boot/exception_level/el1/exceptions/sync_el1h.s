
build/src/boot/exception_level/el1/exceptions/sync_el1h.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <sync_el1h>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	910003fd 	mov	x29, sp
   8:	f9000bf3 	str	x19, [sp, #16]
   c:	90000013 	adrp	x19, 0 <sync_el1h>
  10:	39400260 	ldrb	w0, [x19]
  14:	36000080 	tbz	w0, #0, 24 <sync_el1h+0x24>
  18:	f9400bf3 	ldr	x19, [sp, #16]
  1c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  20:	d65f03c0 	ret
  24:	90000000 	adrp	x0, 0 <sync_el1h>
  28:	91000000 	add	x0, x0, #0x0
  2c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  30:	52800020 	mov	w0, #0x1                   	// #1
  34:	39000260 	strb	w0, [x19]
  38:	f9400bf3 	ldr	x19, [sp, #16]
  3c:	a8c27bfd 	ldp	x29, x30, [sp], #32
  40:	d65f03c0 	ret
