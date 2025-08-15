#include <boot/exception_level/el1/exceptions/irq_el1.hpp>
#include <kernel/io/uart/uart_io.hpp>

extern "C" void fiq_el1h(void)
{
	kernel::io::uart::sendln("fiq_el1h exception not implemented!");
}