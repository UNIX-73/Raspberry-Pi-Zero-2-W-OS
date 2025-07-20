
build/src/kernel/apps/shell/internal/command_executor.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel4apps5shell8internal16command_executor15execute_commandEv>:
   0:	a9bf7bfd 	stp	x29, x30, [sp, #-16]!
   4:	52800140 	mov	w0, #0xa                   	// #10
   8:	910003fd 	mov	x29, sp
   c:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler16send_to_frontendEh>
  10:	a8c17bfd 	ldp	x29, x30, [sp], #16
  14:	90000001 	adrp	x1, 0 <_ZN6kernel4apps5shell8internal5state9input_idxE>
  18:	528007c0 	mov	w0, #0x3e                  	// #62
  1c:	f900003f 	str	xzr, [x1]
  20:	14000000 	b	0 <_ZN6kernel4apps5shell8internal13input_handler16send_to_frontendEh>
