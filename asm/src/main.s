
build/src/main.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <kernel_main>:
   0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   4:	910003fd 	mov	x29, sp
   8:	a90153f3 	stp	x19, x20, [sp, #16]
   c:	a9025bf5 	stp	x21, x22, [sp, #32]
  10:	94000000 	bl	0 <read_el>
  14:	7100041f 	cmp	w0, #0x1
  18:	54000540 	b.eq	c0 <kernel_main+0xc0>  // b.none
  1c:	52800021 	mov	w1, #0x1                   	// #1
  20:	528002a0 	mov	w0, #0x15                  	// #21
  24:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
  28:	d2964095 	mov	x21, #0xb204                	// #45572
  2c:	d2800380 	mov	x0, #0x1c                  	// #28
  30:	52a00401 	mov	w1, #0x200000              	// #2097152
  34:	f2a7e400 	movk	x0, #0x3f20, lsl #16
  38:	f2a7e015 	movk	x21, #0x3f00, lsl #16
  3c:	90000016 	adrp	x22, 0 <kernel_main>
  40:	90000014 	adrp	x20, 0 <kernel_main>
  44:	b9000001 	str	w1, [x0]
  48:	910002d6 	add	x22, x22, #0x0
  4c:	91000294 	add	x20, x20, #0x0
  50:	52800013 	mov	w19, #0x0                   	// #0
  54:	b94002a0 	ldr	w0, [x21]
  58:	37e802e0 	tbnz	w0, #29, b4 <kernel_main+0xb4>
  5c:	d503201f 	nop
  60:	aa1403e0 	mov	x0, x20
  64:	94000000 	bl	0 <_ZN6kernel2io7uart_io4sendEPKc>
  68:	94000000 	bl	0 <read_el>
  6c:	94000000 	bl	0 <_ZN6kernel2io7uart_io14uint32_to_charEj>
  70:	94000000 	bl	0 <_ZN6kernel2io7uart_io7putcharEc>
  74:	94000000 	bl	0 <_ZN6kernel2io7uart_io8new_lineEv>
  78:	94000000 	bl	0 <_ZN6kernel2io7uart_io15return_carriageEv>
  7c:	52909000 	mov	w0, #0x8480                	// #33920
  80:	72a003c0 	movk	w0, #0x1e, lsl #16
  84:	d503201f 	nop
  88:	71000400 	subs	w0, w0, #0x1
  8c:	54ffffc1 	b.ne	84 <kernel_main+0x84>  // b.any
  90:	71000a7f 	cmp	w19, #0x2
  94:	540000a9 	b.ls	a8 <kernel_main+0xa8>  // b.plast
  98:	94000000 	bl	0 <read_el>
  9c:	7100041f 	cmp	w0, #0x1
  a0:	54000040 	b.eq	a8 <kernel_main+0xa8>  // b.none
  a4:	94000000 	bl	0 <switch_to_el1>
  a8:	b94002a0 	ldr	w0, [x21]
  ac:	11000673 	add	w19, w19, #0x1
  b0:	36effd80 	tbz	w0, #29, 60 <kernel_main+0x60>
  b4:	aa1603e0 	mov	x0, x22
  b8:	94000000 	bl	0 <_ZN6kernel2io7uart_io6sendlnEPKc>
  bc:	17ffffe9 	b	60 <kernel_main+0x60>
  c0:	94000000 	bl	0 <irq_enable>
  c4:	52a40000 	mov	w0, #0x20000000            	// #536870912
  c8:	94000000 	bl	0 <_ZN3IRQ10enable_irqENS_11IRQ_OPTIONSE>
  cc:	94000000 	bl	0 <_ZN3AUX9MINI_UART4initEv>
  d0:	17ffffd3 	b	1c <kernel_main+0x1c>
  d4:	d503201f 	nop
  d8:	d503201f 	nop
  dc:	d503201f 	nop

00000000000000e0 <irq_main>:
  e0:	90000000 	adrp	x0, 0 <kernel_main>
  e4:	91000000 	add	x0, x0, #0x0
  e8:	14000000 	b	0 <_ZN6kernel2io7uart_io6sendlnEPKc>
