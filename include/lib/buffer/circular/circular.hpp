#pragma once
#include <cstddef>
#include <atomic>

namespace lib::buffer::circular
{
    template <typename T, size_t SIZE>
    struct CircularBuffer
    {
        static_assert(SIZE > 0, "SIZE must be > 0");
        static_assert(((SIZE & (SIZE - 1)) == 0), "SIZE must be power of two");
        static_assert(std::is_trivially_copyable_v<T>,
                      "T should be trivially copyable");

        static constexpr size_t mask = SIZE - 1;
        static constexpr bool is_power_of_two = ((SIZE - 1) & SIZE) == 0;
        static constexpr size_t size = SIZE;        
    private:
        alignas(64) std::atomic<size_t> write_idx{0};
        T data[SIZE];

    public:
        inline size_t snapshot_write_idx(CircularBuffer<T, SIZE> *buff)
        {
            return buff->write_idx.load(std::memory_order_acquire);
        }

        inline T get_data(size_t idx)
        {
            data[idx & this->mask];
        }

        void push(T data);

        static_assert(is_power_of_two, "SIZE must be power of 2");
    };
}