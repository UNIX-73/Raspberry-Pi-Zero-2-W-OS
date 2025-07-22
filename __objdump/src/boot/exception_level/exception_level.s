
build/src/boot/exception_level/exception_level.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <read_el>:
   0:	d5384240 	mrs	x0, currentel
   4:	d342fc00 	lsr	x0, x0, #2
   8:	d65f03c0 	ret

000000000000000c <irq_enable>:
   c:	d50342ff 	msr	daifclr, #0x2
  10:	d65f03c0 	ret

0000000000000014 <irq_disable>:
  14:	d50342df 	msr	daifset, #0x2
  18:	d65f03c0 	ret
