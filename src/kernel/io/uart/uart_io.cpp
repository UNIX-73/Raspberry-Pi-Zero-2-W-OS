#include <kernel/io/uart/uart_io.hpp>

namespace kernel::io::uart
{
	void send(const char *s)
	{
		while (*s)
			putchar(*s++);
	}

	void sendln(const char *s)
	{
		send(s);
		return_carriage();
		newline();
	}
} // namespace kernel::io::uart