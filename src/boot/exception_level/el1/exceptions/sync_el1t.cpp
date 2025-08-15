#include <boot/exception_level/el1/exceptions/irq_el1.hpp>
#include <kernel/io/uart/uart_io.hpp>

extern "C" void sync_el1t(void)
{
	kernel::io::uart::sendln("sync_el1t exception not implemented!");
}