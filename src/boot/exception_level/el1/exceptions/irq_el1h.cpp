#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <drivers/irq.hpp>
#include <drivers/aux/aux.hpp>

#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>

extern "C" void irq_el1h(void)
{
    // Lee (lo que limpia la irq creo) y además guarda todo el estado para validar si hay varias irq que han saltado
    const uint32_t irq_pending_1 = *IRQ::IRQ_PENDING_1;

    // el bit 29 indica de si hay irq de aux
    if ((irq_pending_1 & (0b1 << 29)) != 0)
    {
        uint8_t data = *AUX::MU_IO_REG_ADDR_PTR;

        kernel::io::input_buffer::ib_push_char(data);
    }
}
