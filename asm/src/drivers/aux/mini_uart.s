
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
  38:	90000003 	adrp	x3, 0 <_ZN3AUX16ENABLES_ADDR_PTRE>
  3c:	90000002 	adrp	x2, 0 <_ZN3AUX20MU_CNTL_REG_ADDR_PTRE>
  40:	90000001 	adrp	x1, 0 <_ZN3AUX19MU_IER_REG_ADDR_PTRE>
  44:	90000000 	adrp	x0, 0 <_ZN3AUX19MU_IIR_REG_ADDR_PTRE>
  48:	f9400066 	ldr	x6, [x3]
  4c:	90000005 	adrp	x5, 0 <_ZN3AUX19MU_LCR_REG_ADDR_PTRE>
  50:	f9400043 	ldr	x3, [x2]
  54:	90000004 	adrp	x4, 0 <_ZN3AUX19MU_MCR_REG_ADDR_PTRE>
  58:	f9400021 	ldr	x1, [x1]
  5c:	52800022 	mov	w2, #0x1                   	// #1
  60:	f9400007 	ldr	x7, [x0]
  64:	90000000 	adrp	x0, 0 <_ZN3AUX20MU_BAUD_REG_ADDR_PTRE>
  68:	a8c17bfd 	ldp	x29, x30, [sp], #16
  6c:	b90000c2 	str	w2, [x6]
  70:	f94000a5 	ldr	x5, [x5]
  74:	b900007f 	str	wzr, [x3]
  78:	f9400086 	ldr	x6, [x4]
  7c:	b900003f 	str	wzr, [x1]
  80:	f9400004 	ldr	x4, [x0]
  84:	52800060 	mov	w0, #0x3                   	// #3
  88:	b90000e0 	str	w0, [x7]
  8c:	b90000a0 	str	w0, [x5]
  90:	528021c5 	mov	w5, #0x10e                 	// #270
  94:	b90000df 	str	wzr, [x6]
  98:	b9000085 	str	w5, [x4]
  9c:	b9000060 	str	w0, [x3]
  a0:	b9000022 	str	w2, [x1]
  a4:	d65f03c0 	ret
