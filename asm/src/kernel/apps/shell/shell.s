
build/src/kernel/apps/shell/shell.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel4apps5shell3runEv>:
   0:	52800000 	mov	w0, #0x0                   	// #0
   4:	d65f03c0 	ret

0000000000000008 <_ZN6kernel4apps5shell17handle_input_charEh>:
   8:	12001c00 	and	w0, w0, #0xff
   c:	7101e81f 	cmp	w0, #0x7a
  10:	540001a8 	b.hi	44 <_ZN6kernel4apps5shell17handle_input_charEh+0x3c>  // b.pmore
  14:	7101001f 	cmp	w0, #0x40
  18:	54000188 	b.hi	48 <_ZN6kernel4apps5shell17handle_input_charEh+0x40>  // b.pmore
  1c:	7100b81f 	cmp	w0, #0x2e
  20:	54000208 	b.hi	60 <_ZN6kernel4apps5shell17handle_input_charEh+0x58>  // b.pmore
  24:	7100b01f 	cmp	w0, #0x2c
  28:	54000269 	b.ls	74 <_ZN6kernel4apps5shell17handle_input_charEh+0x6c>  // b.plast
  2c:	90000001 	adrp	x1, 0 <_ZN6kernel4apps5shell3runEv>
  30:	f9400020 	ldr	x0, [x1]
  34:	f103f81f 	cmp	x0, #0xfe
  38:	54000068 	b.hi	44 <_ZN6kernel4apps5shell17handle_input_charEh+0x3c>  // b.pmore
  3c:	91000400 	add	x0, x0, #0x1
  40:	f9000020 	str	x0, [x1]
  44:	d65f03c0 	ret
  48:	51010400 	sub	w0, w0, #0x41
  4c:	92b78001 	mov	x1, #0xffffffff43ffffff    	// #-3154116609
  50:	f2e07fe1 	movk	x1, #0x3ff, lsl #48
  54:	9ac02420 	lsr	x0, x1, x0
  58:	3707fea0 	tbnz	w0, #0, 2c <_ZN6kernel4apps5shell17handle_input_charEh+0x24>
  5c:	d65f03c0 	ret
  60:	5100c000 	sub	w0, w0, #0x30
  64:	12001c00 	and	w0, w0, #0xff
  68:	7100241f 	cmp	w0, #0x9
  6c:	54fffe09 	b.ls	2c <_ZN6kernel4apps5shell17handle_input_charEh+0x24>  // b.plast
  70:	d65f03c0 	ret
  74:	7100801f 	cmp	w0, #0x20
  78:	54fffda0 	b.eq	2c <_ZN6kernel4apps5shell17handle_input_charEh+0x24>  // b.none
  7c:	7100241f 	cmp	w0, #0x9
  80:	54fffe21 	b.ne	44 <_ZN6kernel4apps5shell17handle_input_charEh+0x3c>  // b.any
  84:	90000002 	adrp	x2, 0 <_ZN6kernel4apps5shell3runEv>
  88:	f9400040 	ldr	x0, [x2]
  8c:	f103e81f 	cmp	x0, #0xfa
  90:	54fffda8 	b.hi	44 <_ZN6kernel4apps5shell17handle_input_charEh+0x3c>  // b.pmore
  94:	52800003 	mov	w3, #0x0                   	// #0
  98:	52800081 	mov	w1, #0x4                   	// #4
  9c:	f103f81f 	cmp	x0, #0xfe
  a0:	54000068 	b.hi	ac <_ZN6kernel4apps5shell17handle_input_charEh+0xa4>  // b.pmore
  a4:	91000400 	add	x0, x0, #0x1
  a8:	52800023 	mov	w3, #0x1                   	// #1
  ac:	71000421 	subs	w1, w1, #0x1
  b0:	54ffff61 	b.ne	9c <_ZN6kernel4apps5shell17handle_input_charEh+0x94>  // b.any
  b4:	34fffc83 	cbz	w3, 44 <_ZN6kernel4apps5shell17handle_input_charEh+0x3c>
  b8:	f9000040 	str	x0, [x2]
  bc:	d65f03c0 	ret

00000000000000c0 <_ZN6kernel4apps5shell5resetEv>:
  c0:	d65f03c0 	ret
