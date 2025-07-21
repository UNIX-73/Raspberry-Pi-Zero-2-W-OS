#include <boot/exception_level/el1/exceptions/irq_el1h.hpp>
#include <kernel/io/uart/uart_io.hpp>

static bool sent = false;
extern "C" void sync_el1h(void)
{
    if (!sent)
    {
        kernel::io::uart::uart_io::sendln("sync_el1h exception not implemented!");
        sent = true;
    }
}