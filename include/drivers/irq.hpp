#pragma once
#include <stdint.h>
#include <drivers/peripherals.hpp>

namespace IRQ
{
    // REGISTERS
    extern reg32_ptr_t IRQ_BASIC_PENDING;
    extern reg32_ptr_t IRQ_PENDING_1;
    extern reg32_ptr_t IRQ_PENDING_2;
    extern reg32_ptr_t FIQ_CONTROL;
    extern reg32_ptr_t ENABLE_IRQS_1;
    extern reg32_ptr_t ENABLE_IRQS_2;
    extern reg32_ptr_t ENABLE_BASIC_IRQS;
    extern reg32_ptr_t DISABLE_IRQS_1;
    extern reg32_ptr_t DISABLE_IRQS_2;
    extern reg32_ptr_t DISABLE_BASIC_IRQS;

    // FUNCTIONS
    enum class IRQ_OPTIONS
    {
        MINI_UART = 1 << 29
    };

    void enable_irq(IRQ_OPTIONS option);
    void disable_irq(IRQ_OPTIONS option);
}