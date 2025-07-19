#include <drivers/aux/aux.hpp>

void AUX::init()
{
    constexpr uintptr_t IRQ_ENABLE1 = 0x3F00B210;
    reg32_ptr_t irq_enable1 = reinterpret_cast<reg32_ptr_t>(IRQ_ENABLE1);
    *irq_enable1 |= (1 << 29);
}