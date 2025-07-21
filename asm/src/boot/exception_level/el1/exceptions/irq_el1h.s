
build/src/boot/exception_level/el1/exceptions/irq_el1h.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <irq_el1h>:
   0:	90000000 	adrp	x0, 0 <_ZN3IRQ13IRQ_PENDING_1E>
   4:	f9400000 	ldr	x0, [x0]
   8:	b9400000 	ldr	w0, [x0]
   c:	37e80040 	tbnz	w0, #29, 14 <irq_el1h+0x14>
  10:	d65f03c0 	ret
  14:	90000000 	adrp	x0, 0 <_ZN3AUX18MU_IO_REG_ADDR_PTRE>
  18:	f9400000 	ldr	x0, [x0]
  1c:	b9400000 	ldr	w0, [x0]
  20:	14000000 	b	0 <_ZN6kernel2io12input_buffer12ib_push_charEh>
