
build/src/drivers/aux/mini_uart.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN3AUX9MINI_UART4initEv>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	52800041 	mov	w1, #0x2                   	// #2
   8:	528001c0 	mov	w0, #0xe                   	// #14
   c:	910003fd 	mov	x29, sp
  10:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
  14:	52800041 	mov	w1, #0x2                   	// #2
  18:	528001e0 	mov	w0, #0xf                   	// #15
  1c:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
  20:	52800001 	mov	w1, #0x0                   	// #0
  24:	528001c0 	mov	w0, #0xe                   	// #14
  28:	94000000 	bl	0 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE>
  2c:	52800001 	mov	w1, #0x0                   	// #0
  30:	528001e0 	mov	w0, #0xf                   	// #15
  34:	94000000 	bl	0 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE>
  38:	d28a0081 	mov	x1, #0x5004                	// #20484
  3c:	52800023 	mov	w3, #0x1                   	// #1
  40:	f2a7e421 	movk	x1, #0x3f21, lsl #16
  44:	aa0103e0 	mov	x0, x1
  48:	a8c17bfd 	ldp	x29, x30, [sp], #16
  4c:	52800062 	mov	w2, #0x3                   	// #3
  50:	b805c403 	str	w3, [x0], #92
  54:	528021c4 	mov	w4, #0x10e                 	// #270
  58:	b9005c3f 	str	wzr, [x1, #92]
  5c:	b81e401f 	stur	wzr, [x0, #-28]
  60:	b81e8002 	stur	w2, [x0, #-24]
  64:	b81ec002 	stur	w2, [x0, #-20]
  68:	b81f001f 	stur	wzr, [x0, #-16]
  6c:	b9000804 	str	w4, [x0, #8]
  70:	b9005c22 	str	w2, [x1, #92]
  74:	b81e4003 	stur	w3, [x0, #-28]
  78:	d65f03c0 	ret
