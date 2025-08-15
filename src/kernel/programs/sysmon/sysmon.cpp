#include <cstddef>
#include <drivers/mailbox/temperature.hpp>
#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/programs/sysmon/internal/print_info.hpp>
#include <kernel/programs/sysmon/sysmon.hpp>
#include <lib/ascii.hpp>

static bool init = false;
static uint32_t loop_count = 0;

static const size_t UNREAD_INPUT_BUFFER_SIZE = 32;
static uint8_t unread_input[UNREAD_INPUT_BUFFER_SIZE] = {};

static kernel::io::input_buffer::UartReader uart_reader{};

namespace kernel::programs::sysmon
{
	uint64_t run(uint64_t program_id, char *args)
	{
		kernel::io::input_buffer::build_input_buffer_reader(&uart_reader);

		init = true;

		kernel::io::uart::hide_cursor();
		internal::print_info();

		while (init)
		{
			size_t unread_len = uart_reader.read_unread(unread_input, UNREAD_INPUT_BUFFER_SIZE);

			// Procesa bytes
			for (size_t i = 0; i < unread_len; ++i)
			{
				if (unread_input[i] == 0x03) // Ctrl+C
					return exit();
				else
				{
					kernel::io::uart::putchar(unread_input[i]);
				}
			}

			// Log ocasional (no cada iter)
			// if (++loop_count >= 2000000)
			{
				char temp[21] = {};
				kernel::io::uart::sendln(::lib::ascii::u64_to_ascii(unread_len, temp, sizeof temp));
				internal::print_info();
				loop_count = 0;
			}
		}

		return exit();
	}

	uint64_t exit()
	{
		loop_count = 0;
		init = false;
		kernel::io::uart::clr_screen();

		return 0;
	};
} // namespace kernel::programs::sysmon