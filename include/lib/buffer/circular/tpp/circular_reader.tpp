#pragma once
#include <lib/buffer/circular/buffer_reader.hpp>

#ifdef DEBUG
#include <kernel/lib/debug/debug.hpp>
#endif

namespace lib::buffer::circular::reader
{
	// build
	template <typename T, size_t SIZE>
	inline void CircularBufferReader<T, SIZE>::build(CircularBuffer<T, SIZE> const *buff,
													 CircularBufferReader<T, SIZE> *out)
	{
		out->buffer = buff;
		out->read_idx = buff->snapshot_write_idx();
	};

	template <typename T, size_t SIZE> inline size_t CircularBufferReader<T, SIZE>::w_idx_debug()
	{
		return buffer->snapshot_write_idx();
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::available() const
	{
		if (!buffer)
			return 0;

		size_t w = buffer->snapshot_write_idx();

		if (w < read_idx)
			return 0;

		size_t unread = w - read_idx;

		if (unread > SIZE)
			unread = SIZE;

		return unread;
	};

	template <typename T, size_t SIZE>
	size_t CircularBufferReader<T, SIZE>::read_unread(T *out_buf, size_t out_size)
	{
		if (!buffer || !out_buf || out_size == 0)
		{
			return 0;
		}

		size_t write_idx = buffer->snapshot_write_idx();

		size_t unread_count = (write_idx >= read_idx) ? (write_idx - read_idx) : 0;

		if (unread_count > SIZE)
		{
			read_idx = write_idx - SIZE;
			unread_count = SIZE;
		}

		size_t n = (unread_count < out_size) ? unread_count : out_size;

		buffer->get_block(read_idx, out_buf, n);
		read_idx += n;

		return n;
	}

	template <typename T, size_t SIZE> void CircularBufferReader<T, SIZE>::reset()
	{
		read_idx = buffer->snapshot_write_idx();
	}
} // namespace lib::buffer::circular::reader