
build/src/kernel/programs/gpio/gpio.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs4gpio3runEmPc>:
   0:	a9b87bfd 	stp	x29, x30, [sp, #-128]!
   4:	aa0103e0 	mov	x0, x1
   8:	910003fd 	mov	x29, sp
   c:	9100e3e2 	add	x2, sp, #0x38
  10:	9101e3e3 	add	x3, sp, #0x78
  14:	b90033ff 	str	wzr, [sp, #48]
  18:	f800845f 	str	xzr, [x2], #8
  1c:	eb02007f 	cmp	x3, x2
  20:	54ffffc1 	b.ne	18 <_ZN6kernel8programs4gpio3runEmPc+0x18>  // b.any
  24:	9100c3e1 	add	x1, sp, #0x30
  28:	94000000 	bl	0 <_ZN6kernel3lib6string4args10parse_intoEPcPNS2_10ParsedArgsE>
  2c:	b94033e0 	ldr	w0, [sp, #48]
  30:	340009e0 	cbz	w0, 16c <_ZN6kernel8programs4gpio3runEmPc+0x16c>
  34:	a90153f3 	stp	x19, x20, [sp, #16]
  38:	90000014 	adrp	x20, 0 <_ZN6kernel8programs4gpio3runEmPc>
  3c:	91000294 	add	x20, x20, #0x0
  40:	d2800013 	mov	x19, #0x0                   	// #0
  44:	a9025bf5 	stp	x21, x22, [sp, #32]
  48:	f9401fe0 	ldr	x0, [sp, #56]
  4c:	f8737a95 	ldr	x21, [x20, x19, lsl #3]
  50:	91000673 	add	x19, x19, #0x1
  54:	aa1503e1 	mov	x1, x21
  58:	94000000 	bl	0 <_ZN6kernel3lib6string5equalEPKcS3_>
  5c:	370001c0 	tbnz	w0, #0, 94 <_ZN6kernel8programs4gpio3runEmPc+0x94>
  60:	f1001a7f 	cmp	x19, #0x6
  64:	54ffff21 	b.ne	48 <_ZN6kernel8programs4gpio3runEmPc+0x48>  // b.any
  68:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
  6c:	91000000 	add	x0, x0, #0x0
  70:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  74:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
  78:	91000000 	add	x0, x0, #0x0
  7c:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  80:	a94153f3 	ldp	x19, x20, [sp, #16]
  84:	a9425bf5 	ldp	x21, x22, [sp, #32]
  88:	d2800020 	mov	x0, #0x1                   	// #1
  8c:	a8c87bfd 	ldp	x29, x30, [sp], #128
  90:	d65f03c0 	ret
  94:	b4fffeb5 	cbz	x21, 68 <_ZN6kernel8programs4gpio3runEmPc+0x68>
  98:	b94033e0 	ldr	w0, [sp, #48]
  9c:	7100041f 	cmp	w0, #0x1
  a0:	54000809 	b.ls	1a0 <_ZN6kernel8programs4gpio3runEmPc+0x1a0>  // b.plast
  a4:	f94023f4 	ldr	x20, [sp, #64]
  a8:	52800013 	mov	w19, #0x0                   	// #0
  ac:	39400281 	ldrb	w1, [x20]
  b0:	34000281 	cbz	w1, 100 <_ZN6kernel8programs4gpio3runEmPc+0x100>
  b4:	52800156 	mov	w22, #0xa                   	// #10
  b8:	14000006 	b	d0 <_ZN6kernel8programs4gpio3runEmPc+0xd0>
  bc:	39400280 	ldrb	w0, [x20]
  c0:	94000000 	bl	0 <_ZN6kernel3lib6string14ascii_to_uint8Ec>
  c4:	0b200273 	add	w19, w19, w0, uxtb
  c8:	38401e81 	ldrb	w1, [x20, #1]!
  cc:	34000161 	cbz	w1, f8 <_ZN6kernel8programs4gpio3runEmPc+0xf8>
  d0:	2a0103e0 	mov	w0, w1
  d4:	1b167e73 	mul	w19, w19, w22
  d8:	94000000 	bl	0 <_ZN6kernel3lib6string13char_is_digitEh>
  dc:	3707ff00 	tbnz	w0, #0, bc <_ZN6kernel8programs4gpio3runEmPc+0xbc>
  e0:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
  e4:	91000000 	add	x0, x0, #0x0
  e8:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
  ec:	a94153f3 	ldp	x19, x20, [sp, #16]
  f0:	a9425bf5 	ldp	x21, x22, [sp, #32]
  f4:	17ffffe5 	b	88 <_ZN6kernel8programs4gpio3runEmPc+0x88>
  f8:	71009e7f 	cmp	w19, #0x27
  fc:	54000468 	b.hi	188 <_ZN6kernel8programs4gpio3runEmPc+0x188>  // b.pmore
 100:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 104:	91000000 	add	x0, x0, #0x0
 108:	eb0002bf 	cmp	x21, x0
 10c:	540005c0 	b.eq	1c4 <_ZN6kernel8programs4gpio3runEmPc+0x1c4>  // b.none
 110:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 114:	91000000 	add	x0, x0, #0x0
 118:	eb0002bf 	cmp	x21, x0
 11c:	540004e0 	b.eq	1b8 <_ZN6kernel8programs4gpio3runEmPc+0x1b8>  // b.none
 120:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 124:	91000000 	add	x0, x0, #0x0
 128:	eb0002bf 	cmp	x21, x0
 12c:	54000540 	b.eq	1d4 <_ZN6kernel8programs4gpio3runEmPc+0x1d4>  // b.none
 130:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 134:	91000000 	add	x0, x0, #0x0
 138:	eb0002bf 	cmp	x21, x0
 13c:	54000440 	b.eq	1c4 <_ZN6kernel8programs4gpio3runEmPc+0x1c4>  // b.none
 140:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 144:	91000000 	add	x0, x0, #0x0
 148:	eb0002bf 	cmp	x21, x0
 14c:	54000360 	b.eq	1b8 <_ZN6kernel8programs4gpio3runEmPc+0x1b8>  // b.none
 150:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 154:	91000000 	add	x0, x0, #0x0
 158:	eb0002bf 	cmp	x21, x0
 15c:	540003c0 	b.eq	1d4 <_ZN6kernel8programs4gpio3runEmPc+0x1d4>  // b.none
 160:	a94153f3 	ldp	x19, x20, [sp, #16]
 164:	a9425bf5 	ldp	x21, x22, [sp, #32]
 168:	17ffffc8 	b	88 <_ZN6kernel8programs4gpio3runEmPc+0x88>
 16c:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 170:	91000000 	add	x0, x0, #0x0
 174:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 178:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 17c:	91000000 	add	x0, x0, #0x0
 180:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 184:	17ffffc1 	b	88 <_ZN6kernel8programs4gpio3runEmPc+0x88>
 188:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 18c:	91000000 	add	x0, x0, #0x0
 190:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io4sendEPKc>
 194:	a94153f3 	ldp	x19, x20, [sp, #16]
 198:	a9425bf5 	ldp	x21, x22, [sp, #32]
 19c:	17ffffbb 	b	88 <_ZN6kernel8programs4gpio3runEmPc+0x88>
 1a0:	90000000 	adrp	x0, 0 <_ZN6kernel8programs4gpio3runEmPc>
 1a4:	91000000 	add	x0, x0, #0x0
 1a8:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io6sendlnEPKc>
 1ac:	a94153f3 	ldp	x19, x20, [sp, #16]
 1b0:	a9425bf5 	ldp	x21, x22, [sp, #32]
 1b4:	17ffffb5 	b	88 <_ZN6kernel8programs4gpio3runEmPc+0x88>
 1b8:	2a1303e0 	mov	w0, w19
 1bc:	52800001 	mov	w1, #0x0                   	// #0
 1c0:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
 1c4:	a94153f3 	ldp	x19, x20, [sp, #16]
 1c8:	d2800000 	mov	x0, #0x0                   	// #0
 1cc:	a9425bf5 	ldp	x21, x22, [sp, #32]
 1d0:	17ffffaf 	b	8c <_ZN6kernel8programs4gpio3runEmPc+0x8c>
 1d4:	2a1303e0 	mov	w0, w19
 1d8:	52800021 	mov	w1, #0x1                   	// #1
 1dc:	94000000 	bl	0 <_ZN4GPIO19set_function_selectEjNS_12FSEL_OPTIONSE>
 1e0:	90000001 	adrp	x1, 0 <_ZN4GPIO12SET_ADDR_PTRE>
 1e4:	53057e62 	lsr	w2, w19, #5
 1e8:	52800020 	mov	w0, #0x1                   	// #1
 1ec:	f9400021 	ldr	x1, [x1]
 1f0:	1ad32000 	lsl	w0, w0, w19
 1f4:	b8227820 	str	w0, [x1, x2, lsl #2]
 1f8:	17fffff3 	b	1c4 <_ZN6kernel8programs4gpio3runEmPc+0x1c4>
