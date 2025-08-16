#include <kernel/io/output_buffer.hpp>
#include <lib/buffer/circular/circular.hpp>

namespace kernel::io::output_buffer
{
	static ::lib::buffer::circular::CircularBuffer<uint8_t, OUTPUT_BUFFER_SIZE> output_buffer;


    
}