#pragma once
#include <lib/buffer/circular/circular.hpp>

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE> struct CircularQueue;

	template <typename T, size_t SIZE> struct CircularBufferReader
	{
	  private:
		CircularBuffer<T, SIZE> const *buffer{nullptr};
		std::atomic<size_t> read_idx;

	  public:
		static inline void build(CircularBuffer<T, SIZE> const *buff,
								 CircularBufferReader<T, SIZE> *out);
		inline size_t snapshot_read_idx() const;
		inline size_t available() const;
		inline size_t unsafe_available() const;
		inline size_t w_idx_debug();
		inline bool pop(T *result);
		size_t read_unread(T *out_buf, size_t buf_len);
		void reset(); // Sets read idx to write idx

		friend struct CircularQueue<T, SIZE>;
	};
} // namespace lib::buffer::circular
#include <lib/buffer/circular/tpp/circular_reader.tpp>