#include "boot/exception_level/exception_level.hpp"

#include <drivers/aux/mini_uart.hpp>
#include <drivers/irq.hpp>
#include <kernel/io/uart/uart_io.hpp>

namespace kernel::io::uart
{
	void putchar(char c)
	{
		while (!AUX::MINI_UART::write_fifo_has_space())
		{
			asm volatile("nop");
		}
		asm volatile("dmb ish"); // Asegura orden de lecturas previas
		AUX::MINI_UART::write(c);
		asm volatile("dmb ish"); // Asegura que la write salga
	}

	void newline()
	{
		putchar('\n');
	}

	void return_carriage()
	{
		putchar('\r');
	}

	void send(const char *s)
	{
		while (*s)
			putchar(*s++);
	}

	void sendln(const char *s)
	{
		send(s);
		newline();
		return_carriage();
	}

	char uint32_to_char(uint32_t v)
	{
		if (v <= 9)
		{
			return '0' + v;
		}
		else
		{
			return '?';
		}
	}
} // namespace kernel::io::uart
