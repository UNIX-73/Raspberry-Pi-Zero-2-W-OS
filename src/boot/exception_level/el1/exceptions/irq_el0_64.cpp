#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <kernel/io/uart/uart_io.hpp>

extern "C" void irq_el0_64(void)
{
    kernel::io::uart::uart_io::sendln("irq_el0_64 exception not implemented!");
}