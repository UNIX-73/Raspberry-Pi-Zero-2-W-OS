#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <kernel/io/uart_io.hpp>
#include <drivers/irq.hpp>

extern "C" void irq_el1h(void)
{
    // Lee (lo que limpia la irq creo) y además guarda todo el estado para validar si hay varias irq que han saltado
    const uint32_t irq_pending_1 = *IRQ::IRQ_PENDING_1;

    if ((irq_pending_1 & (0b1 << 29)) != 0)
    {
        uint8_t data = *AUX::MU_IO_REG_ADDR_PTR;
        kernel::io::uart_io::send("\n\rArrived irq data=");
        kernel::io::uart_io::putchar(data);
        kernel::io::uart_io::new_line();
        kernel::io::uart_io::return_carriage();
    }
}
