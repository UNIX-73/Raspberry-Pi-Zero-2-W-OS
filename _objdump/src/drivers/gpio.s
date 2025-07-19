
build/src/drivers/gpio.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>:
   0:	529999a2 	mov	w2, #0xcccd                	// #52429
   4:	d2a7e405 	mov	x5, #0x3f200000            	// #1059061760
   8:	72b99982 	movk	w2, #0xcccc, lsl #16
   c:	528000e4 	mov	w4, #0x7                   	// #7
  10:	0a040021 	and	w1, w1, w4
  14:	9ba27c02 	umull	x2, w0, w2
  18:	d363fc42 	lsr	x2, x2, #35
  1c:	0b020843 	add	w3, w2, w2, lsl #2
  20:	d37e7042 	ubfiz	x2, x2, #2, #29
  24:	4b030400 	sub	w0, w0, w3, lsl #1
  28:	b8656843 	ldr	w3, [x2, x5]
  2c:	0b000400 	add	w0, w0, w0, lsl #1
  30:	1ac02084 	lsl	w4, w4, w0
  34:	0a240064 	bic	w4, w3, w4
  38:	b8256844 	str	w4, [x2, x5]
  3c:	1ac02021 	lsl	w1, w1, w0
  40:	b8656840 	ldr	w0, [x2, x5]
  44:	2a000021 	orr	w1, w1, w0
  48:	b8256841 	str	w1, [x2, x5]
  4c:	d65f03c0 	ret

0000000000000050 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE>:
  50:	d2801282 	mov	x2, #0x94                  	// #148
  54:	d10043ff 	sub	sp, sp, #0x10
  58:	f2a7e402 	movk	x2, #0x3f20, lsl #16
  5c:	12000421 	and	w1, w1, #0x3
  60:	12001003 	and	w3, w0, #0x1f
  64:	b9000041 	str	w1, [x2]
  68:	53057c01 	lsr	w1, w0, #5
  6c:	b9000bff 	str	wzr, [sp, #8]
  70:	b9400be0 	ldr	w0, [sp, #8]
  74:	7104ac1f 	cmp	w0, #0x12b
  78:	5400012c 	b.gt	9c <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x4c>
  7c:	d503201f 	nop
  80:	d503201f 	nop
  84:	b9400be0 	ldr	w0, [sp, #8]
  88:	11000400 	add	w0, w0, #0x1
  8c:	b9000be0 	str	w0, [sp, #8]
  90:	b9400be0 	ldr	w0, [sp, #8]
  94:	7104ac1f 	cmp	w0, #0x12b
  98:	54ffff4d 	b.le	80 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x30>
  9c:	d37e6821 	ubfiz	x1, x1, #2, #27
  a0:	d2801302 	mov	x2, #0x98                  	// #152
  a4:	f2a7e402 	movk	x2, #0x3f20, lsl #16
  a8:	52800020 	mov	w0, #0x1                   	// #1
  ac:	1ac32000 	lsl	w0, w0, w3
  b0:	b8226820 	str	w0, [x1, x2]
  b4:	b9000fff 	str	wzr, [sp, #12]
  b8:	b9400fe0 	ldr	w0, [sp, #12]
  bc:	7104ac1f 	cmp	w0, #0x12b
  c0:	5400010c 	b.gt	e0 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x90>
  c4:	d503201f 	nop
  c8:	b9400fe0 	ldr	w0, [sp, #12]
  cc:	11000400 	add	w0, w0, #0x1
  d0:	b9000fe0 	str	w0, [sp, #12]
  d4:	b9400fe0 	ldr	w0, [sp, #12]
  d8:	7104ac1f 	cmp	w0, #0x12b
  dc:	54ffff4d 	b.le	c4 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x74>
  e0:	d2801280 	mov	x0, #0x94                  	// #148
  e4:	f2a7e400 	movk	x0, #0x3f20, lsl #16
  e8:	b900001f 	str	wzr, [x0]
  ec:	b822683f 	str	wzr, [x1, x2]
  f0:	910043ff 	add	sp, sp, #0x10
  f4:	d65f03c0 	ret
