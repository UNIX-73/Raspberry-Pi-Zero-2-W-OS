#pragma once
#include <lib/buffer/circular/circular_reader.hpp>
#include <stddef.h>

namespace kernel::io::input_buffer
{
	constexpr size_t INPUT_BUFFER_SIZE = 1024;

	using UartCircular = ::lib::buffer::circular::CircularBuffer<uint8_t, INPUT_BUFFER_SIZE>;
	using UartReader = ::lib::buffer::circular::CircularBufferReader<uint8_t, INPUT_BUFFER_SIZE>;

	void build_input_buffer_reader(UartReader *out);

	UartCircular *get_input_buffer();
} // namespace kernel::io::input_buffer
