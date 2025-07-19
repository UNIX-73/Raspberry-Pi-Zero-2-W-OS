#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <kernel/io/uart_io.hpp>

extern "C" void sync_el1t(void)
{
    kernel::io::uart_io::sendln("sync_el1t exception not implemented!");
}