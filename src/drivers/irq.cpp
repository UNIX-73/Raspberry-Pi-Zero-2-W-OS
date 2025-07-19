#include <drivers/irq.hpp>

void IRQ::enable_irq(IRQ_OPTIONS option)
{
    *ENABLE_IRQS_1 |= static_cast<uint32_t>(option);
}
void IRQ::disable_irq(IRQ_OPTIONS option)
{
    *DISABLE_IRQS_1 |= static_cast<uint32_t>(option);
}