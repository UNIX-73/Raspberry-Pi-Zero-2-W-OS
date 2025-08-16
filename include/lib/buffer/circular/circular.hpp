#pragma once
#include <atomic>
#include <cstddef>

namespace lib::buffer::circular
{
	template <typename T, size_t SIZE> struct CircularQueue;

	template <typename T, size_t SIZE> struct CircularBuffer
	{
		static_assert(SIZE > 0, "SIZE must be > 0");
		static_assert(((SIZE & (SIZE - 1)) == 0), "SIZE must be power of two");
		static_assert(std::is_trivially_copyable_v<T>, "T should be trivially copyable");

		static constexpr size_t mask = SIZE - 1;
		static constexpr bool is_power_of_two = ((SIZE - 1) & SIZE) == 0;
		static constexpr size_t size = SIZE;

	  private:
		alignas(64) std::atomic<size_t> write_idx{0};
		alignas(64) T data[SIZE];

	  public:
		void init();
		inline size_t snapshot_write_idx() const;
		inline T get(size_t idx) const;
		inline void get_block(size_t idx, T *out, size_t count) const;
		inline void push(T value);

		static_assert(is_power_of_two, "SIZE must be power of 2");

		friend struct CircularQueue<T, SIZE>;
	};
} // namespace lib::buffer::circular

#include <lib/buffer/circular/tpp/circular.tpp>
