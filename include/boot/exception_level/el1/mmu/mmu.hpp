#pragma once

#ifndef __ASSEMBLER__
#include <cstdint>

extern "C" void memzero(unsigned long src, unsigned int n);

// Se tiene que llamar antes de cambiar a el1
extern "C" void __setup_init_el1_mmu(void);

// Llamada después de pasar a el1

// Función llamada desde cpp en init
extern "C" void __init_el1_mmu(void);

extern "C" uint64_t __id_pgd_addr(void);

// Función llamada desde asm
extern "C" void init_el1_mmu_table(void);

#endif
