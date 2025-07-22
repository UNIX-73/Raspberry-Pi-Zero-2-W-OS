
build/src/kernel/lib/string.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel3lib6string6strcmpEPKcS3_>:
   0:	39400002 	ldrb	w2, [x0]
   4:	350000a2 	cbnz	w2, 18 <_ZN6kernel3lib6string6strcmpEPKcS3_+0x18>
   8:	1400000d 	b	3c <_ZN6kernel3lib6string6strcmpEPKcS3_+0x3c>
   c:	38401c02 	ldrb	w2, [x0, #1]!
  10:	34000102 	cbz	w2, 30 <_ZN6kernel3lib6string6strcmpEPKcS3_+0x30>
  14:	aa0403e1 	mov	x1, x4
  18:	39400023 	ldrb	w3, [x1]
  1c:	91000424 	add	x4, x1, #0x1
  20:	6b02007f 	cmp	w3, w2
  24:	54ffff40 	b.eq	c <_ZN6kernel3lib6string6strcmpEPKcS3_+0xc>  // b.none
  28:	4b030040 	sub	w0, w2, w3
  2c:	d65f03c0 	ret
  30:	39400423 	ldrb	w3, [x1, #1]
  34:	4b030040 	sub	w0, w2, w3
  38:	d65f03c0 	ret
  3c:	39400023 	ldrb	w3, [x1]
  40:	17fffffa 	b	28 <_ZN6kernel3lib6string6strcmpEPKcS3_+0x28>
  44:	d503201f 	nop
  48:	d503201f 	nop
  4c:	d503201f 	nop

0000000000000050 <_ZN6kernel3lib6string5equalEPKcS3_>:
  50:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
  54:	910003fd 	mov	x29, sp
  58:	b4000220 	cbz	x0, 9c <_ZN6kernel3lib6string5equalEPKcS3_+0x4c>
  5c:	b4000301 	cbz	x1, bc <_ZN6kernel3lib6string5equalEPKcS3_+0x6c>
  60:	39400002 	ldrb	w2, [x0]
  64:	350000c2 	cbnz	w2, 7c <_ZN6kernel3lib6string5equalEPKcS3_+0x2c>
  68:	1400001a 	b	d0 <_ZN6kernel3lib6string5equalEPKcS3_+0x80>
  6c:	540001e1 	b.ne	a8 <_ZN6kernel3lib6string5equalEPKcS3_+0x58>  // b.any
  70:	38401c02 	ldrb	w2, [x0, #1]!
  74:	34000202 	cbz	w2, b4 <_ZN6kernel3lib6string5equalEPKcS3_+0x64>
  78:	aa0403e1 	mov	x1, x4
  7c:	39400023 	ldrb	w3, [x1]
  80:	91000424 	add	x4, x1, #0x1
  84:	6b02007f 	cmp	w3, w2
  88:	35ffff23 	cbnz	w3, 6c <_ZN6kernel3lib6string5equalEPKcS3_+0x1c>
  8c:	6b03005f 	cmp	w2, w3
  90:	1a9f17e0 	cset	w0, eq	// eq = none
  94:	a8c17bfd 	ldp	x29, x30, [sp], #16
  98:	d65f03c0 	ret
  9c:	90000000 	adrp	x0, 0 <_ZN6kernel3lib6string6strcmpEPKcS3_>
  a0:	91000000 	add	x0, x0, #0x0
  a4:	94000000 	bl	0 <_ZN6kernel3lib5debug12debug_sendlnEPKc>
  a8:	52800000 	mov	w0, #0x0                   	// #0
  ac:	a8c17bfd 	ldp	x29, x30, [sp], #16
  b0:	d65f03c0 	ret
  b4:	39400423 	ldrb	w3, [x1, #1]
  b8:	17fffff5 	b	8c <_ZN6kernel3lib6string5equalEPKcS3_+0x3c>
  bc:	90000000 	adrp	x0, 0 <_ZN6kernel3lib6string6strcmpEPKcS3_>
  c0:	91000000 	add	x0, x0, #0x0
  c4:	94000000 	bl	0 <_ZN6kernel3lib5debug12debug_sendlnEPKc>
  c8:	52800000 	mov	w0, #0x0                   	// #0
  cc:	17fffff8 	b	ac <_ZN6kernel3lib6string5equalEPKcS3_+0x5c>
  d0:	39400023 	ldrb	w3, [x1]
  d4:	17ffffee 	b	8c <_ZN6kernel3lib6string5equalEPKcS3_+0x3c>
  d8:	d503201f 	nop
  dc:	d503201f 	nop

00000000000000e0 <_ZN6kernel3lib6string24char_is_undercase_letterEh>:
  e0:	12001c00 	and	w0, w0, #0xff
  e4:	51018400 	sub	w0, w0, #0x61
  e8:	12001c00 	and	w0, w0, #0xff
  ec:	7100641f 	cmp	w0, #0x19
  f0:	1a9f87e0 	cset	w0, ls	// ls = plast
  f4:	d65f03c0 	ret
  f8:	d503201f 	nop
  fc:	d503201f 	nop

0000000000000100 <_ZN6kernel3lib6string24char_is_uppercase_letterEh>:
 100:	12001c00 	and	w0, w0, #0xff
 104:	51010400 	sub	w0, w0, #0x41
 108:	12001c00 	and	w0, w0, #0xff
 10c:	7100641f 	cmp	w0, #0x19
 110:	1a9f87e0 	cset	w0, ls	// ls = plast
 114:	d65f03c0 	ret
 118:	d503201f 	nop
 11c:	d503201f 	nop

0000000000000120 <_ZN6kernel3lib6string14char_is_letterEh>:
 120:	12001c00 	and	w0, w0, #0xff
 124:	121a7800 	and	w0, w0, #0xffffffdf
 128:	51010400 	sub	w0, w0, #0x41
 12c:	12001c00 	and	w0, w0, #0xff
 130:	7100641f 	cmp	w0, #0x19
 134:	1a9f87e0 	cset	w0, ls	// ls = plast
 138:	d65f03c0 	ret
 13c:	d503201f 	nop

0000000000000140 <_ZN6kernel3lib6string13char_is_digitEh>:
 140:	12001c00 	and	w0, w0, #0xff
 144:	5100c000 	sub	w0, w0, #0x30
 148:	12001c00 	and	w0, w0, #0xff
 14c:	7100241f 	cmp	w0, #0x9
 150:	1a9f87e0 	cset	w0, ls	// ls = plast
 154:	d65f03c0 	ret
 158:	d503201f 	nop
 15c:	d503201f 	nop

0000000000000160 <_ZN6kernel3lib6string14ascii_to_uint8Ec>:
 160:	12001c00 	and	w0, w0, #0xff
 164:	5100c000 	sub	w0, w0, #0x30
 168:	12001c00 	and	w0, w0, #0xff
 16c:	7100281f 	cmp	w0, #0xa
 170:	1a9f3000 	csel	w0, w0, wzr, cc	// cc = lo, ul, last
 174:	d65f03c0 	ret
 178:	d503201f 	nop
 17c:	d503201f 	nop

0000000000000180 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE>:
 180:	b900003f 	str	wzr, [x1]
 184:	d503201f 	nop
 188:	39400002 	ldrb	w2, [x0]
 18c:	34000362 	cbz	w2, 1f8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x78>
 190:	b9400023 	ldr	w3, [x1]
 194:	71001c7f 	cmp	w3, #0x7
 198:	54000308 	b.hi	1f8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x78>  // b.pmore
 19c:	7100805f 	cmp	w2, #0x20
 1a0:	540000c1 	b.ne	1b8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x38>  // b.any
 1a4:	d503201f 	nop
 1a8:	38401c02 	ldrb	w2, [x0, #1]!
 1ac:	7100805f 	cmp	w2, #0x20
 1b0:	54ffffc0 	b.eq	1a8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x28>  // b.none
 1b4:	34000222 	cbz	w2, 1f8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x78>
 1b8:	8b234c22 	add	x2, x1, w3, uxtw #3
 1bc:	11000463 	add	w3, w3, #0x1
 1c0:	b9000023 	str	w3, [x1]
 1c4:	f9000440 	str	x0, [x2, #8]
 1c8:	39400002 	ldrb	w2, [x0]
 1cc:	121a7843 	and	w3, w2, #0xffffffdf
 1d0:	340000a3 	cbz	w3, 1e4 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x64>
 1d4:	d503201f 	nop
 1d8:	38401c02 	ldrb	w2, [x0, #1]!
 1dc:	121a7843 	and	w3, w2, #0xffffffdf
 1e0:	35ffffc3 	cbnz	w3, 1d8 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x58>
 1e4:	7100805f 	cmp	w2, #0x20
 1e8:	54fffd01 	b.ne	188 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x8>  // b.any
 1ec:	3800141f 	strb	wzr, [x0], #1
 1f0:	39400002 	ldrb	w2, [x0]
 1f4:	35fffce2 	cbnz	w2, 190 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE+0x10>
 1f8:	d65f03c0 	ret
