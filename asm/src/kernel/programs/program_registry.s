
build/src/kernel/programs/program_registry.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs8registry12find_by_nameEPKc>:
   0:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   4:	90000001 	adrp	x1, 0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
   8:	910003fd 	mov	x29, sp
   c:	a90153f3 	stp	x19, x20, [sp, #16]
  10:	aa0003f4 	mov	x20, x0
  14:	91000033 	add	x19, x1, #0x0
  18:	f9400020 	ldr	x0, [x1]
  1c:	aa1403e1 	mov	x1, x20
  20:	94000000 	bl	0 <_ZN6kernel3lib6string6strcmpEPKcS3_>
  24:	34000120 	cbz	w0, 48 <_ZN6kernel8programs8registry12find_by_nameEPKc+0x48>
  28:	f8420e60 	ldr	x0, [x19, #32]!
  2c:	aa1403e1 	mov	x1, x20
  30:	94000000 	bl	0 <_ZN6kernel3lib6string6strcmpEPKcS3_>
  34:	7100001f 	cmp	w0, #0x0
  38:	9a9f0260 	csel	x0, x19, xzr, eq	// eq = none
  3c:	a94153f3 	ldp	x19, x20, [sp, #16]
  40:	a8c27bfd 	ldp	x29, x30, [sp], #32
  44:	d65f03c0 	ret
  48:	aa1303e0 	mov	x0, x19
  4c:	17fffffc 	b	3c <_ZN6kernel8programs8registry12find_by_nameEPKc+0x3c>

0000000000000050 <_ZN6kernel8programs8registry7get_allEv>:
  50:	90000000 	adrp	x0, 0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  54:	91000000 	add	x0, x0, #0x0
  58:	d65f03c0 	ret
  5c:	d503201f 	nop

0000000000000060 <_ZN6kernel8programs8registry5countEv>:
  60:	d2800040 	mov	x0, #0x2                   	// #2
  64:	d65f03c0 	ret
