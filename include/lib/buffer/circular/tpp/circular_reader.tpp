#pragma once
#include <lib/buffer/circular/circular_reader.hpp>

#ifdef DEBUG
#include <kernel/lib/debug/debug.hpp>
#endif

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE>
	inline void CircularBufferReader<T, SIZE>::build(CircularBuffer<T, SIZE> const *buff,
													 CircularBufferReader<T, SIZE> *out)
	{
		if (!buff || !out)
			return;
		out->buffer = buff;
		out->read_idx.store(buff->snapshot_write_idx(), std::memory_order_relaxed);
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::snapshot_read_idx() const
	{
		return read_idx.load(std::memory_order_acquire);
	}

	template <typename T, size_t SIZE> inline size_t CircularBufferReader<T, SIZE>::w_idx_debug()
	{
		return buffer ? buffer->snapshot_write_idx() : 0;
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::available() const
	{
		if (!buffer)
			return 0;

		const size_t r = snapshot_read_idx();
		const size_t w = buffer->snapshot_write_idx();
		size_t unread = (w >= r) ? (w - r) : 0;
		if (unread > SIZE)
			unread = SIZE;
		return unread;
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::unsafe_available() const
	{
		if (!buffer)
			return 0;

		const size_t r = snapshot_read_idx();
		const size_t w = buffer->snapshot_write_idx();

		return (w >= r) ? (w - r) : 0;
	}

	template <typename T, size_t SIZE> inline bool CircularBufferReader<T, SIZE>::pop(T *result)
	{
		if (!buffer || !result)
			return false;

		size_t r = snapshot_read_idx();
		size_t w = buffer->snapshot_write_idx();

		size_t unread = (w >= r) ? (w - r) : 0;
		if (unread == 0)
			return false;

		if (unread > SIZE)
		{
			r = w - SIZE;
			read_idx.store(r, std::memory_order_release);
			unread = SIZE;
		}

		*result = buffer->get(r);
		read_idx.store(r + 1, std::memory_order_release);
		return true;
	}

	template <typename T, size_t SIZE>
	inline size_t CircularBufferReader<T, SIZE>::read_unread(T *out_buf, size_t out_size)
	{
		if (!buffer || !out_buf || out_size == 0)
			return 0;

		size_t r = snapshot_read_idx();
		size_t w = buffer->snapshot_write_idx();

		size_t unread = (w >= r) ? (w - r) : 0;
		if (unread == 0)
			return 0;

		if (unread > SIZE)
		{
			r = w - SIZE;
			unread = SIZE;
		}

		const size_t n = (unread < out_size) ? unread : out_size;

		buffer->get_block(r, out_buf, n);
		read_idx.store(r + n, std::memory_order_release);
		return n;
	}

	template <typename T, size_t SIZE> inline void CircularBufferReader<T, SIZE>::reset()
	{
		if (!buffer)
			return;
		read_idx.store(buffer->snapshot_write_idx(), std::memory_order_relaxed);
	}
} // namespace lib::buffer::circular
