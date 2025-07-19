
build/src/kernel/init.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel12init_devicesEv>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000000 	bl	0 <read_el>
   c:	7100041f 	cmp	w0, #0x1
  10:	54000060 	b.eq	1c <_ZN6kernel12init_devicesEv+0x1c>  // b.none
  14:	a8c17bfd 	ldp	x29, x30, [sp], #16
  18:	14000000 	b	0 <switch_to_el1>
  1c:	94000000 	bl	0 <irq_enable>
  20:	52a40000 	mov	w0, #0x20000000            	// #536870912
  24:	94000000 	bl	0 <_ZN3IRQ10enable_irqENS_11IRQ_OPTIONSE>
  28:	a8c17bfd 	ldp	x29, x30, [sp], #16
  2c:	14000000 	b	0 <_ZN3AUX9MINI_UART4initEv>

0000000000000030 <_ZN6kernel5startEv>:
  30:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
  34:	910003fd 	mov	x29, sp
  38:	f9000bf3 	str	x19, [sp, #16]
  3c:	90000013 	adrp	x19, 0 <_ZN6kernel12init_devicesEv>
  40:	91000273 	add	x19, x19, #0x0
  44:	aa1303e0 	mov	x0, x19
  48:	94000000 	bl	0 <_ZN6kernel2io7uart_io6sendlnEPKc>
  4c:	5285a000 	mov	w0, #0x2d00                	// #11520
  50:	72a02620 	movk	w0, #0x131, lsl #16
  54:	d503201f 	nop
  58:	d503201f 	nop
  5c:	d503201f 	nop
  60:	d503201f 	nop
  64:	71000400 	subs	w0, w0, #0x1
  68:	54ffffc1 	b.ne	60 <_ZN6kernel5startEv+0x30>  // b.any
  6c:	17fffff6 	b	44 <_ZN6kernel5startEv+0x14>
