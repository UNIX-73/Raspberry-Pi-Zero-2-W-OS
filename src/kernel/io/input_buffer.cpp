#include <kernel/io/input_buffer.hpp>

namespace kernel::io::input_buffer
{
	static ::lib::buffer::circular::CircularBuffer<uint8_t, INPUT_BUFFER_SIZE> input_buffer;

	void build_input_buffer_reader(UartReader *out)
	{
		static bool ib_init = false;

		if (!ib_init)
		{
			input_buffer.init();
			ib_init = true;
		}

		UartReader::build(&input_buffer, out);
	}

	UartCircular *get_input_buffer()
	{
		return &input_buffer;
	}
} // namespace kernel::io::input_buffer
