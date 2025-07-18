.section .text.boot
.global _start

_start:
    // Inicializa el stack
    ldr x0, =__stack_el2_top
    mov sp, x0

    // Limpia la BSS
    ldr x1, =_bss_start
    ldr x2, =_bss_end
1:
    cmp x1, x2
    b.eq 2f
    str xzr, [x1], #8
    b 1b
2:

    // Llama al kernel en C
    bl kernel_main

hang:
    wfe
    b hang
