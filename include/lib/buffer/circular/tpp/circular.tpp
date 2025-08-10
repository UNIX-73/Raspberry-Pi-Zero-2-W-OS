#pragma once
#include <lib/buffer/circular/circular.hpp>

#ifdef SAFE
#include <kernel/lib/debug/debug.hpp>
#endif

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE> inline size_t CircularBuffer<T, SIZE>::snapshot_write_idx()
	{
		return this->write_idx.load(std::memory_order_acquire);
	}

	template <typename T, size_t SIZE> inline T CircularBuffer<T, SIZE>::get(size_t idx)
	{
		return data[idx & mask];
	}

	template <typename T, size_t SIZE>
	inline void CircularBuffer<T, SIZE>::get_block(size_t idx, T *out, size_t count) const
	{
#ifdef SAFE
		if (!out)
			return;
		// Opcional: si quieres limitar aquí y no arriba:
		if (count > SIZE)
			count = SIZE;
#endif

		for (size_t i = 0; i < count; ++i)
		{
			out[i] = data[(idx + i) & mask];
		}
	}

	template <typename T, size_t SIZE> inline void CircularBuffer<T, SIZE>::push(T data)
	{
		size_t idx = this->write_idx.load(std::memory_order_relaxed);
		this->data[idx & this->mask] = data;
		this->write_idx.store(idx, std::memory_order_release);
	};
} // namespace lib::buffer::circular