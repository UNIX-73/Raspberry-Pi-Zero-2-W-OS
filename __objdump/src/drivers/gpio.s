
build/src/drivers/gpio.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>:
   0:	529999a2 	mov	w2, #0xcccd                	// #52429
   4:	72b99982 	movk	w2, #0xcccc, lsl #16
   8:	52800146 	mov	w6, #0xa                   	// #10
   c:	d2a7e404 	mov	x4, #0x3f200000            	// #1059061760
  10:	9ba27c02 	umull	x2, w0, w2
  14:	528000e3 	mov	w3, #0x7                   	// #7
  18:	0a030021 	and	w1, w1, w3
  1c:	d363fc42 	lsr	x2, x2, #35
  20:	2a0203e5 	mov	w5, w2
  24:	1b068040 	msub	w0, w2, w6, w0
  28:	b8657882 	ldr	w2, [x4, x5, lsl #2]
  2c:	0b000400 	add	w0, w0, w0, lsl #1
  30:	1ac02063 	lsl	w3, w3, w0
  34:	0a230043 	bic	w3, w2, w3
  38:	b8257883 	str	w3, [x4, x5, lsl #2]
  3c:	1ac02021 	lsl	w1, w1, w0
  40:	b8657880 	ldr	w0, [x4, x5, lsl #2]
  44:	2a000021 	orr	w1, w1, w0
  48:	b8257881 	str	w1, [x4, x5, lsl #2]
  4c:	d65f03c0 	ret

0000000000000050 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE>:
  50:	d10043ff 	sub	sp, sp, #0x10
  54:	d2801282 	mov	x2, #0x94                  	// #148
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
  9c:	d2801302 	mov	x2, #0x98                  	// #152
  a0:	f2a7e402 	movk	x2, #0x3f20, lsl #16
  a4:	52800020 	mov	w0, #0x1                   	// #1
  a8:	1ac32000 	lsl	w0, w0, w3
  ac:	b8217840 	str	w0, [x2, x1, lsl #2]
  b0:	b9000fff 	str	wzr, [sp, #12]
  b4:	b9400fe0 	ldr	w0, [sp, #12]
  b8:	7104ac1f 	cmp	w0, #0x12b
  bc:	5400010c 	b.gt	dc <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x8c>
  c0:	d503201f 	nop
  c4:	b9400fe0 	ldr	w0, [sp, #12]
  c8:	11000400 	add	w0, w0, #0x1
  cc:	b9000fe0 	str	w0, [sp, #12]
  d0:	b9400fe0 	ldr	w0, [sp, #12]
  d4:	7104ac1f 	cmp	w0, #0x12b
  d8:	54ffff4d 	b.le	c0 <_ZN4GPIO16set_pull_up_downEjNS_11PUD_OPTIONSE+0x70>
  dc:	d2801280 	mov	x0, #0x94                  	// #148
  e0:	f2a7e400 	movk	x0, #0x3f20, lsl #16
  e4:	b900001f 	str	wzr, [x0]
  e8:	b821785f 	str	wzr, [x2, x1, lsl #2]
  ec:	910043ff 	add	sp, sp, #0x10
  f0:	d65f03c0 	ret
