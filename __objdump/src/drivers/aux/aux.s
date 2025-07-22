
build/src/drivers/aux/aux.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN3AUX4initEv>:
   0:	d2964201 	mov	x1, #0xb210                	// #45584
   4:	f2a7e001 	movk	x1, #0x3f00, lsl #16
   8:	b9400020 	ldr	w0, [x1]
   c:	32030000 	orr	w0, w0, #0x20000000
  10:	b9000020 	str	w0, [x1]
  14:	d65f03c0 	ret
