#include <boot/sysregs.h>
#include <boot/exception_level/el1/mmu/mmu.hpp>
#include <boot/exception_level/el1/mmu/mmu_values.h>
#include "../../../asm_debug.S"

.global memzero
memzero:
    str xzr, [x0], #8
    subs x1, x1, #8
    b.gt memzero
    ret

// Se tiene que llamar antes de cambiar a el1
.global __setup_init_el1_mmu
__setup_init_el1_mmu:
    ldr x0, =CPACR_EL1_VAL
    msr CPACR_EL1, x0

    ldr x0, =TCR_EL1_VAL
    msr TCR_EL1, x0

    ldr x0, =MAIR_VALUE
    msr MAIR_EL1, x0
    ret

// Se llama desde cpp después de pasar a el1
.set SCTRL_MMU_ENABLED, 0x1
.global __init_el1_mmu
__init_el1_mmu:
    __sendln msg_before

    mov x0, lr
    bl debug_ptr_address


    bl init_el1_mmu_table // Fn de cpp

    __sendln msg_tables

    adrp x0, id_pgd
    add  x0, x0, :lo12:id_pgd
    msr  ttbr0_el1, x0

    __sendln msg_ttbr

    mrs x0, sctlr_el1
    mov x1, #(1 << 0)
    orr x0, x0, x1
    msr sctlr_el1, x0

    __sendln msg_done

    dsb sy
    isb

    __sendln msg_exit

    mov x0, lr
    bl debug_ptr_address

    bl kernel_main

.global __id_pgd_addr
__id_pgd_addr:
    adrp x0, id_pgd
    ret

.section .rodata
msg_before:
    .asciz "MMU INIT: Antes de crear tabla"
msg_tables:
    .asciz "MMU INIT: Tabla creada"
msg_ttbr:
    .asciz "MMU INIT: ttbr0_el1 escrito"
msg_done:
    .asciz "MMU INIT: sctlr_el1 escrito y MMU activada"
msg_exit:
    .asciz "MMU INIT: exit"