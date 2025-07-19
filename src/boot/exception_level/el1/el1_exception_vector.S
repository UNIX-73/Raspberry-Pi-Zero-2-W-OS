#include "../el_macros.S"

.global el1_irq_init_vectors
el1_irq_init_vectors:
    adr x0, el1_vectors
    msr VBAR_EL1, x0
    ret


//Exception vectors table
.macro	ventry	label
.align	7
    b	\label
.endm

.align	11
.globl el1_vectors 
el1_vectors:
	ventry	handle_invalid_el1_irq			// Synchronous EL1t
	ventry	handle_invalid_el1_irq			// IRQ EL1t
	ventry	handle_invalid_el1_irq			// FIQ EL1t
	ventry	handle_invalid_el1_irq			// Error EL1t

	ventry	handle_invalid_el1_irq			// Synchronous EL1h
	ventry	handle_irq_el1h		       		// IRQ EL1h
	ventry	handle_invalid_el1_irq			// FIQ EL1h
	ventry	handle_invalid_el1_irq			// Error EL1h

	ventry	handle_invalid_el1_irq			// Synchronous 64-bit EL0
	ventry	handle_invalid_el1_irq			// IRQ 64-bit EL0
	ventry	handle_invalid_el1_irq			// FIQ 64-bit EL0
	ventry	handle_invalid_el1_irq			// Error 64-bit EL0

	ventry	handle_invalid_el1_irq			// Synchronous 32-bit EL0
	ventry	handle_invalid_el1_irq			// IRQ 32-bit EL0
	ventry	handle_invalid_el1_irq			// FIQ 32-bit EL0
	ventry	handle_invalid_el1_irq			// Error 32-bit EL0

handle_irq_el1h:
	// Solo para test: escribe una 'X' por miniuart
	save_stack_64
    ldr x0, =0x3F215040         // MU_IO_REG (dirección física)
    mov x1, #'X'
    str x1, [x0]                
	
	ldr x0, =0x3F215040
	mov x1, #'1'
	str x1, [x0]

	bl handle_irq_el1h

	ldr x0, =0x3F215040
	mov x1, #'2'
	str x1, [x0]

	load_stack_64
	eret

handle_invalid_el1_irq:
    wfe
    b handle_invalid_el1_irq