#pragma once
#include <drivers/irq.hpp>
#include <stdint.h>

namespace kernel::io::uart
{
	extern "C"
	{
		void send(const char *s);
		void sendln(const char *s);
	}

	inline void putchar(char c);
	inline void clr_screen();
	inline void hide_cursor();
	inline void show_cursor();
	inline void newline();
	inline void return_carriage();

	inline char uint32_to_char(uint32_t v);

} // namespace kernel::io::uart

#include <kernel/io/uart/uart_io.ipp>