
build/src/boot/exception_level/el1/el1_core.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <switch_to_el1>:
   0:	580002c0 	ldr	x0, 58 <el1_entry+0x28>
   4:	d51c4100 	msr	sp_el1, x0
   8:	580002c0 	ldr	x0, 60 <el1_entry+0x30>
   c:	d5184100 	msr	sp_el0, x0
  10:	d2b00000 	mov	x0, #0x80000000            	// #2147483648
  14:	d51c1100 	msr	hcr_el2, x0
  18:	d28078a0 	mov	x0, #0x3c5                 	// #965
  1c:	d51c4000 	msr	spsr_el2, x0
  20:	58000240 	ldr	x0, 68 <el1_entry+0x38>
  24:	d51c4020 	msr	elr_el2, x0
  28:	94000000 	bl	0 <el1_irq_init_vectors>
  2c:	d69f03e0 	eret

0000000000000030 <el1_entry>:
  30:	d2800020 	mov	x0, #0x1                   	// #1
  34:	d5184200 	msr	spsel, x0
  38:	58000100 	ldr	x0, 58 <el1_entry+0x28>
  3c:	d1400400 	sub	x0, x0, #0x1, lsl #12
  40:	9100001f 	mov	sp, x0
  44:	910003e1 	mov	x1, sp
  48:	927cec21 	and	x1, x1, #0xfffffffffffffff0
  4c:	9100003f 	mov	sp, x1
  50:	94000000 	bl	0 <kernel_main>
	...
