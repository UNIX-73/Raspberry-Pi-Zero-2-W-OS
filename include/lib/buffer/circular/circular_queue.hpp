#pragma once

#include <lib/buffer/circular/circular_reader.hpp>

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE> struct CircularQueue
	{
	  private:
		CircularBuffer<T, SIZE> buffer;
		CircularBufferReader<T, SIZE> reader;

		inline bool valid_instance();

	  public:
		CircularQueue<T, SIZE>();
		void override_push(T value);
		bool try_push(T value);
		bool pop(T *result);
	};
} // namespace lib::buffer::circular

#include <lib/buffer/circular/tpp/circular_queue.tpp>