#include <drivers/gpio.hpp>
#define GPIO_PTR(offset) (REG32_PTR(GPIO::GPIO_BASE, offset))

namespace GPIO
{
    reg32_ptr_t FSEL_ADDR_PTR = GPIO_PTR(FSEL_OFFSET);
    reg32_ptr_t SET_ADDR_PTR = GPIO_PTR(SET_OFFSET);
    reg32_ptr_t CLR_ADDR_PTR = GPIO_PTR(CLR_OFFSET);
    reg32_ptr_t LEV_ADDR_PTR = GPIO_PTR(LEV_OFFSET);
    reg32_ptr_t PUD_ADDR_PTR = GPIO_PTR(PUD_OFFSET);
    reg32_ptr_t PUDLOCK_ADDR_PTR = GPIO_PTR(PUDLOCK_OFFSET);

    void set_function_select(uint32_t pin, FSEL_OPTIONS fn)
    {
#ifdef __SAFE__
        if (pin > 39)
            return; // TODO: panic
#endif

        uint32_t fsel_reg = pin / 10;    // FSEL0, FSEL1...
        uint32_t shift = (pin % 10) * 3; // 3 porque usa 3 bits para cada pin

        FSEL_ADDR_PTR[fsel_reg] &= ~(0b111 << shift);
        FSEL_ADDR_PTR[fsel_reg] |= ((static_cast<uint32_t>(fn) & 0b111) << shift);
    }

    void set_pull_up_down(uint32_t pin, PUD_OPTIONS pud)
    {
#ifdef __SAFE__
        if (pin > 39)
            return;
#endif
        uint32_t clk_reg = pin / 32;
        uint32_t bit_pos = pin % 32;

        *PUD_ADDR_PTR = static_cast<uint32_t>(pud) & 0b11;

        // Broadcom recomienda esperar unos ciclos
        for (volatile int i = 0; i < 300; i++)
        {
            __asm__("nop");
        };

        PUDLOCK_ADDR_PTR[clk_reg] = (1 << bit_pos);

        for (volatile int i = 0; i < 300; i++)
        {
            __asm__("nop");
        };

        *PUD_ADDR_PTR = 0;
        PUDLOCK_ADDR_PTR[clk_reg] = 0;
    }

}
