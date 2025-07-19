#pragma once
#include <drivers/utils/mapped_reg.hpp>

#define GPIO_PTR(offset) (REG32_PTR(GPIO::GPIO_BASE, offset))

namespace GPIO
{
    constexpr uintptr_t GPIO_BASE = 0x3F200000;

    // Does not use the same names as the BCM2835 documentation
    constexpr uint32_t FSEL_OFFSET = 0x0;
    constexpr uint32_t SET_OFFSET = 0x1c;
    constexpr uint32_t CLR_OFFSET = 0x28;
    constexpr uint32_t LEV_OFFSET = 0x34;
    constexpr uint32_t PUD_OFFSET = 0x94;
    constexpr uint32_t PUDLOCK_OFFSET = 0x98;

    reg32_ptr_t FSEL_ADDR_PTR = GPIO_PTR(FSEL_OFFSET);
    reg32_ptr_t SET_ADDR_PTR = GPIO_PTR(SET_OFFSET);
    reg32_ptr_t CLR_ADDR_PTR = GPIO_PTR(CLR_OFFSET);
    reg32_ptr_t LEV_ADDR_PTR = GPIO_PTR(LEV_OFFSET);
    reg32_ptr_t PUD_ADDR_PTR = GPIO_PTR(PUD_OFFSET);
    reg32_ptr_t PUDLOCK_ADDR_PTR = GPIO_PTR(PUDLOCK_OFFSET);

    enum class FSEL_OPTIONS
    {
        INPUT = 0b000,
        OUTPUT = 0b001,
        ALT0 = 0b100,
        ALT1 = 0b101,
        ALT2 = 0b110,
        ALT3 = 0b111,
        ALT4 = 0b011,
        ALT5 = 0b010
    };

    enum class PUD_OPTIONS
    {
        OFF = 0b00,
        PULL_DOWN = 0b01,
        PULL_UP = 0b10,
    };

    // FUNCTIONS
    void set_function_select(uint32_t pin, FSEL_OPTIONS fn);
    void set_pull_up_down(uint32_t pin, PUD_OPTIONS pud);

    inline void set_pin(uint32_t pin)
    {
#ifdef __SAFE__
        if (pin > 39)
            return; // TODO: panic()
#endif
        uint32_t set_reg = pin / 32;
        uint32_t bit_pos = pin % 32;

        SET_ADDR_PTR[set_reg] = (0b1 << bit_pos); // No es necesario el |= porque el registro no guarda el valor
    }

    inline void clear_pin(uint32_t pin)
    {
#ifdef __SAFE__
        if (pin > 39)
            return; // TODO: panic()
#endif
        uint32_t set_reg = pin / 32;
        uint32_t bit_pos = pin % 32;

        CLR_ADDR_PTR[set_reg] = (0b1 << bit_pos);
    }

    inline bool read_pin(uint32_t pin)
    {
#ifdef __SAFE__
        if (pin > 39)
            return false; // TODO: panic()
#endif
        uint32_t lev_reg = pin / 32;
        uint32_t bit_pos = pin % 32;

        bool result = ((LEV_ADDR_PTR[lev_reg] >> bit_pos) & 0b1);

        return result;
    }
}