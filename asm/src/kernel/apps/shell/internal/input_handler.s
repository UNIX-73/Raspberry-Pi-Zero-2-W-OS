
build/src/kernel/apps/shell/internal/input_handler.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <_ZN6kernel4apps5shell8internal13input_handler14char_is_letterEh>:
   0:	12001c00 	and	w0, w0, #0xff
   4:	121a7800 	and	w0, w0, #0xffffffdf
   8:	51010400 	sub	w0, w0, #0x41
   c:	12001c00 	and	w0, w0, #0xff
  10:	7100641f 	cmp	w0, #0x19
  14:	1a9f87e0 	cset	w0, ls	// ls = plast
  18:	d65f03c0 	ret
  1c:	d503201f 	nop

0000000000000020 <_ZN6kernel4apps5shell8internal13input_handler13char_is_digitEh>:
  20:	12001c00 	and	w0, w0, #0xff
  24:	5100c000 	sub	w0, w0, #0x30
  28:	12001c00 	and	w0, w0, #0xff
  2c:	7100241f 	cmp	w0, #0x9
  30:	1a9f87e0 	cset	w0, ls	// ls = plast
  34:	d65f03c0 	ret
  38:	d503201f 	nop
  3c:	d503201f 	nop

0000000000000040 <_ZN6kernel4apps5shell8internal13input_handler22char_is_allowed_symbolEh>:
  40:	12001c00 	and	w0, w0, #0xff
  44:	7101e81f 	cmp	w0, #0x7a
  48:	54000268 	b.hi	94 <_ZN6kernel4apps5shell8internal13input_handler22char_is_allowed_symbolEh+0x54>  // b.pmore
  4c:	7101001f 	cmp	w0, #0x40
  50:	540000c8 	b.hi	68 <_ZN6kernel4apps5shell8internal13input_handler22char_is_allowed_symbolEh+0x28>  // b.pmore
  54:	7100b81f 	cmp	w0, #0x2e
  58:	54000148 	b.hi	80 <_ZN6kernel4apps5shell8internal13input_handler22char_is_allowed_symbolEh+0x40>  // b.pmore
  5c:	7100b01f 	cmp	w0, #0x2c
  60:	1a9f97e0 	cset	w0, hi	// hi = pmore
  64:	d65f03c0 	ret
  68:	51010400 	sub	w0, w0, #0x41
  6c:	92b78001 	mov	x1, #0xffffffff43ffffff    	// #-3154116609
  70:	f2e07fe1 	movk	x1, #0x3ff, lsl #48
  74:	9ac02420 	lsr	x0, x1, x0
  78:	12000000 	and	w0, w0, #0x1
  7c:	d65f03c0 	ret
  80:	5100c000 	sub	w0, w0, #0x30
  84:	12001c00 	and	w0, w0, #0xff
  88:	7100241f 	cmp	w0, #0x9
  8c:	1a9f87e0 	cset	w0, ls	// ls = plast
  90:	d65f03c0 	ret
  94:	52800000 	mov	w0, #0x0                   	// #0
  98:	d65f03c0 	ret
  9c:	d503201f 	nop

00000000000000a0 <_ZN6kernel4apps5shell8internal13input_handler14buffer_is_fullEv>:
  a0:	90000000 	adrp	x0, 0 <_ZN6kernel4apps5shell8internal5state9input_idxE>
  a4:	f9400000 	ldr	x0, [x0]
  a8:	f103f81f 	cmp	x0, #0xfe
  ac:	1a9f97e0 	cset	w0, hi	// hi = pmore
  b0:	d65f03c0 	ret
  b4:	d503201f 	nop
  b8:	d503201f 	nop
  bc:	d503201f 	nop

00000000000000c0 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh>:
  c0:	90000002 	adrp	x2, 0 <_ZN6kernel4apps5shell8internal5state9input_idxE>
  c4:	12001c00 	and	w0, w0, #0xff
  c8:	f9400041 	ldr	x1, [x2]
  cc:	f103f83f 	cmp	x1, #0xfe
  d0:	540000c8 	b.hi	e8 <_ZN6kernel4apps5shell8internal13input_handler9push_charEh+0x28>  // b.pmore
  d4:	90000003 	adrp	x3, 0 <_ZN6kernel4apps5shell8internal5state12input_bufferE>
  d8:	91000063 	add	x3, x3, #0x0
  dc:	91000424 	add	x4, x1, #0x1
  e0:	f9000044 	str	x4, [x2]
  e4:	38216860 	strb	w0, [x3, x1]
  e8:	d65f03c0 	ret
