.global switch_to_el1
.type switch_to_el1, %function
switch_to_el1:
    // Configura SP_EL1 con el stack superior reservado
    ldr x0, =__stack_el1_top
    msr SP_EL1, x0

    // Configura SP_EL0 también (aunque no lo usamos de momento)
    ldr x0, =__stack_el0_top
    msr SP_EL0, x0

    // Habilita AArch64 en EL1 (RW = 1 en HCR_EL2)
    mov x0, #(1 << 31)
    msr HCR_EL2, x0

    // Configura SPSR_EL2 para retornar a EL1h (modo EL1 con SP_EL1, DAIF enmascarado)
    mov x0, #0x3c5
    msr SPSR_EL2, x0

    // Dirección de retorno: saltamos a el1_entry tras el eret
    ldr x0, =el1_entry
    msr ELR_EL2, x0

    // Configura VBAR_EL1 con la tabla de vectores
    bl el1_irq_init_vectors

    // Saltamos a EL1
    eret


.global el1_entry
.type el1_entry, %function
el1_entry:
    // Selecciona SP_EL1 como stack pointer activo
    mov x0, #1
    msr spsel, x0

    // Inicializa SP a __stack_el1_top (por si no está correctamente puesto)
    ldr x0, =__stack_el1_top
    sub x0, x0, #0x1000     // Deja 4 KiB de margen de seguridad (guard area)
    mov sp, x0

    // Alinea a 16 bytes por seguridad
    mov x1, sp
    and x1, x1, #-16
    mov sp, x1
    // Salta al kernel C++
    bl kernel_main
