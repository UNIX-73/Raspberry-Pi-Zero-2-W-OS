
build/src/boot/exception_level/el1/handle_irq.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <handle_invalid_el1_irq>:
   0:	d28a0801 	mov	x1, #0x5040                	// #20544
   4:	52800b02 	mov	w2, #0x58                  	// #88
   8:	f2a7e421 	movk	x1, #0x3f21, lsl #16
   c:	90000000 	adrp	x0, 0 <handle_invalid_el1_irq>
  10:	91000000 	add	x0, x0, #0x0
  14:	b9000022 	str	w2, [x1]
  18:	14000000 	b	0 <_ZN6kernel2io7uart_io6sendlnEPKc>
  1c:	d503201f 	nop

0000000000000020 <handle_irq_el1h>:
  20:	d28a0800 	mov	x0, #0x5040                	// #20544
  24:	52800861 	mov	w1, #0x43                  	// #67
  28:	f2a7e420 	movk	x0, #0x3f21, lsl #16
  2c:	b9000001 	str	w1, [x0]
  30:	d65f03c0 	ret
