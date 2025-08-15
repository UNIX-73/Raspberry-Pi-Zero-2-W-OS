#include <drivers/aux/mini_uart.hpp>

namespace kernel::io::uart
{
	extern void send(const char *s);
	extern void sendln(const char *s);

	inline void putchar(char c)
	{
		while (!AUX::MINI_UART::write_fifo_has_space())
		{
			asm volatile("nop");
		}
		AUX::MINI_UART::write(c);
	}

	inline void clr_screen()
	{
		send("\033[2J\033[H");
	};

	inline void hide_cursor()
	{
		kernel::io::uart::send("\x1b[?25l");
	}

	inline void show_cursor()
	{
		kernel::io::uart::send("\x1b[?25h");
	}

	inline void newline()
	{
		putchar('\n');
	}

	inline void return_carriage()
	{
		putchar('\r');
	}

	inline char uint32_to_char(uint32_t v)
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