#pragma once
#include <lib/buffer/circular/circular.hpp>

namespace lib::buffer::circular::reader
{
	template <typename T, size_t SIZE> struct CircularBufferReader
	{
	  private:
		CircularBuffer<T, SIZE> const *buffer{nullptr};
		size_t read_idx;

	  public:
		static inline void build(CircularBuffer<T, SIZE> const *buff,
								 CircularBufferReader<T, SIZE> *out);
		inline size_t available() const;
		inline size_t w_idx_debug();
		size_t read_unread(T *out_buf, size_t buf_len);
		void reset(); // Sets read idx to write idx
	};
} // namespace lib::buffer::circular::reader

#include <lib/buffer/circular/tpp/circular_reader.tpp>