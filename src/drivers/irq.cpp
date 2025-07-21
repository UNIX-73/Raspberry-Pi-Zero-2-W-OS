#include <drivers/irq.hpp>
#include <drivers/utils/mapped_reg.hpp>

#define IRQ_PTR(offset) (REG32_PTR((PERIPHERAL_BASE), ((0xB000) + (offset))))

namespace IRQ
{
    reg32_ptr_t IRQ_BASIC_PENDING = IRQ_PTR(0x200);
    reg32_ptr_t IRQ_PENDING_1 = IRQ_PTR(0x204);
    reg32_ptr_t IRQ_PENDING_2 = IRQ_PTR(0x208);
    reg32_ptr_t FIQ_CONTROL = IRQ_PTR(0x20c);
    reg32_ptr_t ENABLE_IRQS_1 = IRQ_PTR(0x210);
    reg32_ptr_t ENABLE_IRQS_2 = IRQ_PTR(0x214);
    reg32_ptr_t ENABLE_BASIC_IRQS = IRQ_PTR(0x218);
    reg32_ptr_t DISABLE_IRQS_1 = IRQ_PTR(0x21c);
    reg32_ptr_t DISABLE_IRQS_2 = IRQ_PTR(0x220);
    reg32_ptr_t DISABLE_BASIC_IRQS = IRQ_PTR(0x224);

    void enable_irq(IRQ_OPTIONS option)
    {
        *ENABLE_IRQS_1 |= static_cast<uint32_t>(option);
    }
    void disable_irq(IRQ_OPTIONS option)
    {
        *DISABLE_IRQS_1 |= static_cast<uint32_t>(option);
    }
} // namespace IRQ
