#include <boot/exception_level/el1/exceptions/irq_el1.hpp>
#include <kernel/io/uart/uart_io.hpp>

extern "C" void serror_el0_32(void)
{
	kernel::io::uart::sendln("serror_el0_32 exception not implemented!");
}