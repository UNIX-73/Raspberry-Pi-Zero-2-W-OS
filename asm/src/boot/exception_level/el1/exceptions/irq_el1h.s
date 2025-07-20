
build/src/boot/exception_level/el1/exceptions/irq_el1h.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <irq_el1h>:
   0:	d2964080 	mov	x0, #0xb204                	// #45572
   4:	f2a7e000 	movk	x0, #0x3f00, lsl #16
   8:	b9400000 	ldr	w0, [x0]
   c:	37e80040 	tbnz	w0, #29, 14 <irq_el1h+0x14>
  10:	d65f03c0 	ret
  14:	d28a0800 	mov	x0, #0x5040                	// #20544
  18:	f2a7e420 	movk	x0, #0x3f21, lsl #16
  1c:	b9400000 	ldr	w0, [x0]
  20:	14000000 	b	0 <_ZN6kernel2io12input_buffer12ib_push_charEh>
