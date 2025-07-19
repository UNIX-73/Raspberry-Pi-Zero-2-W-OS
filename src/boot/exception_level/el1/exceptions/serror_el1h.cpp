#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <kernel/io/uart_io.hpp>

extern "C" void serror_el1h(void)
{
    kernel::io::uart_io::sendln("serror_el1h exception not implemented!");
}