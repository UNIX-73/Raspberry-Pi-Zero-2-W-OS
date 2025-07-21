
build/src/kernel/programs/clear/clear.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel8programs5clear3runEmPKc>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	910003fd 	mov	x29, sp
   8:	94000000 	bl	0 <_ZN6kernel2io4uart7uart_io12clear_screenEv>
   c:	d2800000 	mov	x0, #0x0                   	// #0
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	d65f03c0 	ret
