
build/src/boot/boot.o:     file format elf64-littleaarch64


Disassembly of section .text.boot:

0000000000000000 <_start>:
   0:	580001c0 	ldr	x0, 38 <hang+0xc>
   4:	9100001f 	mov	sp, x0
   8:	580001c0 	ldr	x0, 40 <hang+0x14>
   c:	d51c4100 	msr	sp_el1, x0
  10:	580001c1 	ldr	x1, 48 <hang+0x1c>
  14:	580001e2 	ldr	x2, 50 <hang+0x24>
  18:	eb02003f 	cmp	x1, x2
  1c:	54000060 	b.eq	28 <_start+0x28>  // b.none
  20:	f800843f 	str	xzr, [x1], #8
  24:	17fffffd 	b	18 <_start+0x18>
  28:	94000000 	bl	0 <kernel_main>

000000000000002c <hang>:
  2c:	d503205f 	wfe
  30:	17ffffff 	b	2c <hang>
	...
