
build/src/drivers/irq.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN3IRQ10enable_irqENS_11IRQ_OPTIONSE>:
   0:	d2964201 	mov	x1, #0xb210                	// #45584
   4:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   8:	b9400022 	ldr	w2, [x1]
   c:	2a020000 	orr	w0, w0, w2
  10:	b9000020 	str	w0, [x1]
  14:	d65f03c0 	ret
  18:	d503201f 	nop
  1c:	d503201f 	nop

0000000000000020 <_ZN3IRQ11disable_irqENS_11IRQ_OPTIONSE>:
  20:	d2964381 	mov	x1, #0xb21c                	// #45596
  24:	f2a7e001 	movk	x1, #0x3f00, lsl #16
  28:	b9400022 	ldr	w2, [x1]
  2c:	2a020000 	orr	w0, w0, w2
  30:	b9000020 	str	w0, [x1]
  34:	d65f03c0 	ret
