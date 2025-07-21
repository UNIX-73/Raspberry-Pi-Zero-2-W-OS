
build/src/kernel/init.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel12init_devicesEv>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	910003fd 	mov	x29, sp
   8:	f9000bf3 	str	x19, [sp, #16]
   c:	94000000 	bl	0 <read_el>
  10:	7100041f 	cmp	w0, #0x1
  14:	54000040 	b.eq	1c <_ZN6kernel12init_devicesEv+0x1c>  // b.none
  18:	94000000 	bl	0 <switch_to_el1>
  1c:	94000000 	bl	0 <read_el>
  20:	2a0003f3 	mov	w19, w0
  24:	7100041f 	cmp	w0, #0x1
  28:	54000080 	b.eq	38 <_ZN6kernel12init_devicesEv+0x38>  // b.none
  2c:	f9400bf3 	ldr	x19, [sp, #16]
  30:	a8c27bfd 	ldp	x29, x30, [sp], #32
  34:	d65f03c0 	ret
  38:	94000000 	bl	0 <irq_enable>
  3c:	52a40000 	mov	w0, #0x20000000            	// #536870912
  40:	94000000 	bl	0 <_ZN3IRQ10enable_irqENS_11IRQ_OPTIONSE>
  44:	94000000 	bl	0 <_ZN3AUX9MINI_UART4initEv>
  48:	2a1303e1 	mov	w1, w19
  4c:	528002a0 	mov	w0, #0x15                  	// #21
  50:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
  54:	90000000 	adrp	x0, 0 <_ZN4GPIO12SET_ADDR_PTRE>
  58:	52a00401 	mov	w1, #0x200000              	// #2097152
  5c:	f9400bf3 	ldr	x19, [sp, #16]
  60:	f9400000 	ldr	x0, [x0]
  64:	a8c27bfd 	ldp	x29, x30, [sp], #32
  68:	b9000001 	str	w1, [x0]
  6c:	d65f03c0 	ret

0000000000000070 <_ZN6kernel5startEv>:
  70:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
  74:	910003fd 	mov	x29, sp
  78:	a90153f3 	stp	x19, x20, [sp, #16]
  7c:	90000014 	adrp	x20, 0 <_ZN6kernel12init_devicesEv>
  80:	90000013 	adrp	x19, 0 <_ZN6kernel12init_devicesEv>
  84:	91000294 	add	x20, x20, #0x0
  88:	91000273 	add	x19, x19, #0x0
  8c:	f90013f5 	str	x21, [sp, #32]
  90:	90000015 	adrp	x21, 0 <_ZN6kernel12init_devicesEv>
  94:	910002b5 	add	x21, x21, #0x0
  98:	d503201f 	nop
  9c:	d503201f 	nop
  a0:	aa1503e0 	mov	x0, x21
  a4:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  a8:	aa1403e0 	mov	x0, x20
  ac:	94000000 	bl	0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  b0:	aa0003e2 	mov	x2, x0
  b4:	aa1303e1 	mov	x1, x19
  b8:	d2800020 	mov	x0, #0x1                   	// #1
  bc:	f9400842 	ldr	x2, [x2, #16]
  c0:	d63f0040 	blr	x2
  c4:	5285a000 	mov	w0, #0x2d00                	// #11520
  c8:	72a02620 	movk	w0, #0x131, lsl #16
  cc:	d503201f 	nop
  d0:	71000400 	subs	w0, w0, #0x1
  d4:	54ffffc1 	b.ne	cc <_ZN6kernel5startEv+0x5c>  // b.any
  d8:	17fffff2 	b	a0 <_ZN6kernel5startEv+0x30>
