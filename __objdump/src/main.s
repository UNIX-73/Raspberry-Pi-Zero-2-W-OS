
build/src/main.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <kernel_main>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000000 	bl	0 <_ZN6kernel12init_devicesEv>
   c:	a8c17bfd 	ldp	x29, x30, [sp], #16
  10:	14000000 	b	0 <_ZN6kernel5startEv>
