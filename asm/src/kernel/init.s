
build/src/kernel/init.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel12init_devicesEv>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000000 	bl	0 <read_el>
   c:	7100041f 	cmp	w0, #0x1
  10:	54000040 	b.eq	18 <_ZN6kernel12init_devicesEv+0x18>  // b.none
  14:	94000000 	bl	0 <switch_to_el1>
  18:	94000000 	bl	0 <read_el>
  1c:	7100041f 	cmp	w0, #0x1
  20:	54000060 	b.eq	2c <_ZN6kernel12init_devicesEv+0x2c>  // b.none
  24:	a8c17bfd 	ldp	x29, x30, [sp], #16
  28:	d65f03c0 	ret
  2c:	94000000 	bl	0 <irq_enable>
  30:	52a40000 	mov	w0, #0x20000000            	// #536870912
  34:	94000000 	bl	0 <_ZN3IRQ10enable_irqENS_11IRQ_OPTIONSE>
  38:	a8c17bfd 	ldp	x29, x30, [sp], #16
  3c:	14000000 	b	0 <_ZN3AUX9MINI_UART4initEv>

0000000000000040 <_ZN6kernel5startEv>:
  40:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  44:	910003fd 	mov	x29, sp
  48:	a90153f3 	stp	x19, x20, [sp, #16]
  4c:	90000014 	adrp	x20, 0 <_ZN6kernel12init_devicesEv>
  50:	90000013 	adrp	x19, 0 <_ZN6kernel12init_devicesEv>
  54:	91000294 	add	x20, x20, #0x0
  58:	91000273 	add	x19, x19, #0x0
  5c:	f90013f5 	str	x21, [sp, #32]
  60:	90000015 	adrp	x21, 0 <_ZN6kernel12init_devicesEv>
  64:	910002b5 	add	x21, x21, #0x0
  68:	aa1503e0 	mov	x0, x21
  6c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  70:	aa1403e0 	mov	x0, x20
  74:	94000000 	bl	0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  78:	aa0003e2 	mov	x2, x0
  7c:	aa1303e1 	mov	x1, x19
  80:	d2800020 	mov	x0, #0x1                   	// #1
  84:	f9400842 	ldr	x2, [x2, #16]
  88:	d63f0040 	blr	x2
  8c:	5285a000 	mov	w0, #0x2d00                	// #11520
  90:	72a02620 	movk	w0, #0x131, lsl #16
  94:	d503201f 	nop
  98:	d503201f 	nop
  9c:	d503201f 	nop
  a0:	d503201f 	nop
  a4:	71000400 	subs	w0, w0, #0x1
  a8:	54ffffc1 	b.ne	a0 <_ZN6kernel5startEv+0x60>  // b.any
  ac:	17ffffef 	b	68 <_ZN6kernel5startEv+0x28>
