#pragma once
#include <lib/buffer/circular/buffer_reader.hpp>

#ifdef DEBUG
#include <kernel/lib/debug/debug.hpp>
#endif

namespace lib::buffer::circular::reader
{
	// build
	template <typename T, size_t SIZE>
	CircularBufferReader<T, SIZE>
	CircularBufferReader<T, SIZE>::build(CircularBuffer<T, SIZE> const *buff)
	{
		CircularBufferReader<T, SIZE> r{};

		r.buffer = buff;
		r.read_idx = buff->snapshot_write_idx();

		return r;
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::available() const
	{
		if (!buffer)
			return 0;

		size_t w = buffer->snapshot_write_idx();
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
		size_t unread_count = write_idx - read_idx;

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

	template <typename T, size_t SIZE>
	void CircularBufferReader<T, SIZE>::reset()
	{
		read_idx = buffer->snapshot_write_idx();
	}
} // namespace lib::buffer::circular::reader