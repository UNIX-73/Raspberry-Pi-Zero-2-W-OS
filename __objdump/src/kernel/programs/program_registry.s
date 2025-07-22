
build/src/kernel/programs/program_registry.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs8registry12find_by_nameEPKc>:
   0:	a9bd7bfd 	stp	x29, x30, [sp, #-48]!
   4:	910003fd 	mov	x29, sp
   8:	a9025bf5 	stp	x21, x22, [sp, #32]
   c:	90000015 	adrp	x21, 0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  10:	910002b5 	add	x21, x21, #0x0
  14:	aa0003f6 	mov	x22, x0
  18:	a90153f3 	stp	x19, x20, [sp, #16]
  1c:	aa1503f4 	mov	x20, x21
  20:	d2800013 	mov	x19, #0x0                   	// #0
  24:	f9400280 	ldr	x0, [x20]
  28:	aa1603e1 	mov	x1, x22
  2c:	94000000 	bl	0 <_ZN6kernel3lib6string6strcmpEPKcS3_>
  30:	34000140 	cbz	w0, 58 <_ZN6kernel8programs8registry12find_by_nameEPKc+0x58>
  34:	91000673 	add	x19, x19, #0x1
  38:	91008294 	add	x20, x20, #0x20
  3c:	f1000e7f 	cmp	x19, #0x3
  40:	54ffff21 	b.ne	24 <_ZN6kernel8programs8registry12find_by_nameEPKc+0x24>  // b.any
  44:	a94153f3 	ldp	x19, x20, [sp, #16]
  48:	d2800000 	mov	x0, #0x0                   	// #0
  4c:	a9425bf5 	ldp	x21, x22, [sp, #32]
  50:	a8c37bfd 	ldp	x29, x30, [sp], #48
  54:	d65f03c0 	ret
  58:	d37b7e73 	ubfiz	x19, x19, #5, #32
  5c:	8b1302a0 	add	x0, x21, x19
  60:	a94153f3 	ldp	x19, x20, [sp, #16]
  64:	a9425bf5 	ldp	x21, x22, [sp, #32]
  68:	a8c37bfd 	ldp	x29, x30, [sp], #48
  6c:	d65f03c0 	ret

0000000000000070 <_ZN6kernel8programs8registry7get_allEv>:
  70:	90000000 	adrp	x0, 0 <_ZN6kernel8programs8registry12find_by_nameEPKc>
  74:	91000000 	add	x0, x0, #0x0
  78:	d65f03c0 	ret
  7c:	d503201f 	nop

0000000000000080 <_ZN6kernel8programs8registry5countEv>:
  80:	d2800060 	mov	x0, #0x3                   	// #3
  84:	d65f03c0 	ret
