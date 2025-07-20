
build/src/kernel/apps/shell/shell.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel4apps5shell3runEv>:
   0:	52800000 	mov	w0, #0x0                   	// #0
   4:	d65f03c0 	ret

0000000000000008 <_ZN6kernel4apps5shell17handle_input_charEh>:
   8:	a9be7bfd 	stp	x29, x30, [sp, #-32]!
   c:	90000001 	adrp	x1, 0 <_ZN6kernel4apps5shell8internal5state15running_programE>
  10:	910003fd 	mov	x29, sp
  14:	f9000bf3 	str	x19, [sp, #16]
  18:	12001c13 	and	w19, w0, #0xff
  1c:	f9400020 	ldr	x0, [x1]
  20:	b4000080 	cbz	x0, 30 <_ZN6kernel4apps5shell17handle_input_charEh+0x28>
  24:	f9400bf3 	ldr	x19, [sp, #16]
  28:	a8c27bfd 	ldp	x29, x30, [sp], #32
  2c:	d65f03c0 	ret
  30:	2a1303e0 	mov	w0, w19
  34:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler22char_is_allowed_symbolEh>
  38:	37000140 	tbnz	w0, #0, 60 <_ZN6kernel4apps5shell17handle_input_charEh+0x58>
  3c:	7100827f 	cmp	w19, #0x20
  40:	54000100 	b.eq	60 <_ZN6kernel4apps5shell17handle_input_charEh+0x58>  // b.none
  44:	7100267f 	cmp	w19, #0x9
  48:	54000140 	b.eq	70 <_ZN6kernel4apps5shell17handle_input_charEh+0x68>  // b.none
  4c:	71002a7f 	cmp	w19, #0xa
  50:	54fffea1 	b.ne	24 <_ZN6kernel4apps5shell17handle_input_charEh+0x1c>  // b.any
  54:	f9400bf3 	ldr	x19, [sp, #16]
  58:	a8c27bfd 	ldp	x29, x30, [sp], #32
  5c:	14000000 	b	0 <_ZN6kernel4apps5shell8internal16command_executor15execute_commandEv>
  60:	2a1303e0 	mov	w0, w19
  64:	f9400bf3 	ldr	x19, [sp, #16]
  68:	a8c27bfd 	ldp	x29, x30, [sp], #32
  6c:	14000000 	b	0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>
  70:	90000000 	adrp	x0, 0 <_ZN6kernel4apps5shell8internal5state9input_idxE>
  74:	f9400000 	ldr	x0, [x0]
  78:	f103e81f 	cmp	x0, #0xfa
  7c:	54fffd48 	b.hi	24 <_ZN6kernel4apps5shell17handle_input_charEh+0x1c>  // b.pmore
  80:	52800400 	mov	w0, #0x20                  	// #32
  84:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>
  88:	52800400 	mov	w0, #0x20                  	// #32
  8c:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>
  90:	52800400 	mov	w0, #0x20                  	// #32
  94:	94000000 	bl	0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>
  98:	f9400bf3 	ldr	x19, [sp, #16]
  9c:	52800400 	mov	w0, #0x20                  	// #32
  a0:	a8c27bfd 	ldp	x29, x30, [sp], #32
  a4:	14000000 	b	0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>

00000000000000a8 <_ZN6kernel4apps5shell5resetEv>:
  a8:	d65f03c0 	ret
