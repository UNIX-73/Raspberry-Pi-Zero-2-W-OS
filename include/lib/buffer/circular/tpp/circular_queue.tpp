#pragma once

#include <lib/buffer/circular/circular_queue.hpp>

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE> inline bool CircularQueue<T, SIZE>::valid_instance()
	{
		if (reader.buffer == nullptr || reader.buffer != &buffer)
			return false;

		return true;
	}

	template <typename T, size_t SIZE> CircularQueue<T, SIZE>::CircularQueue()
	{
		buffer.write_idx.store(0, std::memory_order_relaxed);

		for (size_t i = 0; i < SIZE; i++)
		{
			buffer.data[i] = T{};
		}

		reader.read_idx.store(0, std::memory_order_relaxed);
		reader.buffer = &buffer;
	}

	template <typename T, size_t SIZE> void CircularQueue<T, SIZE>::override_push(T value)
	{
		if (!valid_instance())
			return;

		buffer.push(value);
	}

	template <typename T, size_t SIZE> bool CircularQueue<T, SIZE>::try_push(T value)
	{
		if (!valid_instance())
			return false;

		const size_t w = buffer.snapshot_write_idx();
		const size_t r = reader.snapshot_read_idx();
		const size_t used = (w >= r) ? (w - r) : 0;

		if (used >= SIZE) // lleno
			return false;

		buffer.push(value);
		return true;
	}

	template <typename T, size_t SIZE> bool CircularQueue<T, SIZE>::pop(T *result)
	{
		return reader.pop(result);
	}
} // namespace lib::buffer::circular