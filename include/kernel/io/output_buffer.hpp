#pragma once

#include <cstddef>

namespace kernel::io::output_buffer
{
	constexpr size_t OUTPUT_BUFFER_SIZE = 256;

	inline void putchar_async(char c);

} // namespace kernel::io::output_buffer