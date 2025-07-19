#pragma once
#include <stdint.h>

extern "C"
{
    uint32_t read_el(void);
    void irq_enable(void);
    void irq_disable(void);
}
