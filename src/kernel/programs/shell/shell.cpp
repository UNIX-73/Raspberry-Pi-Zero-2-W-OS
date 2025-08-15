#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/programs/shell/internal/input_handler.hpp>
#include <kernel/programs/shell/internal/state.hpp>
#include <kernel/programs/shell/shell.hpp>
#include <lib/ascii.hpp>

static bool init = false;
static const size_t UNREAD_INPUT_BUFFER_SIZE = 32;
static kernel::io::input_buffer::UartReader uart_reader{};

namespace kernel::programs::shell
{
	using namespace kernel::programs::shell::internal;
	uint64_t run(uint64_t program_id, char *args)
	{
		kernel::io::input_buffer::build_input_buffer_reader(&uart_reader);

		init = true;

		kernel::io::uart::send("\n\r>");
		kernel::io::uart::show_cursor();

		uint8_t unread_input[UNREAD_INPUT_BUFFER_SIZE] = {};

		while (init)
		{
			size_t n = uart_reader.read_unread(unread_input, UNREAD_INPUT_BUFFER_SIZE);

			if (n)
			{
				for (size_t i = 0; i < n; ++i)
				{
					input_handler::handle_input_char(unread_input[i]);
				}
			}

	
		}

		return 0;
	}

	void reset()
	{
	}
} // namespace kernel::programs::shell