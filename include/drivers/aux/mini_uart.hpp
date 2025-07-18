#pragma once
#include "aux.hpp"
#include "../gpio.hpp"
#include <stdint.h>

namespace AUX::MINI_UART
{
    void init();

    inline uint8_t read()
    {
        return *MU_IO_REG_ADDR_PTR; // TODO: Verificar
    };

    // If bit 5 is not 1 FIFO cant accept new data because it is full
    inline bool write_fifo_is_full()
    {
        return ((*MU_LSR_REG_ADDR_PTR & (0b1 << 5)) == 0b0);
    }

    inline void write(uint8_t byte)
    {
        *MU_IO_REG_ADDR_PTR = byte;
    };
}