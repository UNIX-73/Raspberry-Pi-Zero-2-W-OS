
build/src/kernel/lib/string/strcmp.o:     file format elf64-littleaarch64


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
