OUTPUT_FORMAT("elf64-littleaarch64")
ENTRY(_start)

SECTIONS {
    /* Dirección de carga del kernel (Raspberry Pi 3 / Zero 2 W) */
    . = 0x80000;

    /* Código ejecutable */
    .text : ALIGN(4K) {
        KEEP(*(.text.boot))  /* entrada en boot.S */
        *(.text*)
    }

    /* Datos solo lectura */
    .rodata : ALIGN(4K) {
        *(.rodata*)
    }

    /* Datos inicializados */
    .data : ALIGN(4K) {
        *(.data*)
    }

    /* Datos no inicializados */
    .bss : ALIGN(4K) {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        __bss_end = .;
    }

    /* === STACKS POR NIVEL DE EXCEPCIÓN (cada uno 16 KiB) === */
    . = ALIGN(16);

    __stack_el0_bottom = .;
    . += 0x500000;
    __stack_el0_top = .;

    __stack_el1_bottom = .;
    . += 0x500000;
    __stack_el1_top = .;

    __stack_el2_bottom = .;
    . += 0x500000;
    __stack_el2_top = .;

    __stack_el3_bottom = .;
    . += 0x4000;
    __stack_el3_top = .;

    /* === EXPORTAMOS SÍMBOLOS PARA C Y ASM === */
    PROVIDE(_bss_start         = __bss_start);
    PROVIDE(_bss_end           = __bss_end);

    PROVIDE(_stack_el0_top     = __stack_el0_top);
    PROVIDE(_stack_el0_bottom  = __stack_el0_bottom);
    PROVIDE(_stack_el1_top     = __stack_el1_top);
    PROVIDE(_stack_el1_bottom  = __stack_el1_bottom);
    PROVIDE(_stack_el2_top     = __stack_el2_top);
    PROVIDE(_stack_el2_bottom  = __stack_el2_bottom);
    PROVIDE(_stack_el3_top     = __stack_el3_top);
    PROVIDE(_stack_el3_bottom  = __stack_el3_bottom);
}
