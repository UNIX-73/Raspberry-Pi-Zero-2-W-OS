
build/src/boot/exception_level/el1/exceptions/fiq_el0_64.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <fiq_el0_64>:
   0:	90000000 	adrp	x0, 0 <fiq_el0_64>
   4:	91000000 	add	x0, x0, #0x0
   8:	14000000 	b	0 <_ZN6kernel2io7uart_io6sendlnEPKc>
