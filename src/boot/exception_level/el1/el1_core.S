.global switch_to_el1
.type switch_to_el1, %function
switch_to_el1:
    // Configura el stack de EL1
    ldr x0, =__stack_el1_top
    msr SP_EL1, x0
    mov sp, x0

    // Habilita AArch64 en EL1 (RW=1 en HCR_EL2)
    mov     x0, #(1 << 31)
    msr     HCR_EL2, x0

    // Configura SPSR_EL2 para retornar a EL1h (modo EL1 con SP_EL1, DAIF enmascarado)
    mov x0, #0x3c5
    msr SPSR_EL2, x0

    // Dirección de retorno (kernel_main)
    ldr x0, =kernel_main
    msr ELR_EL2, x0

    // Configura VBAR_EL1 con la tabla de vectores
    // bl el1_irq_init_vectors

    // Habilita interrupciones IRQ
    // bl irq_enable

    // Salta a EL1
    eret
