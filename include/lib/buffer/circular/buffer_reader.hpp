#pragma once
#include <lib/buffer/circular/circular.hpp>

namespace lib::buffer::circular::reader
{

    template <typename T, size_t SIZE>
    struct CircularBufferReader
    {
        CircularBuffer<T, SIZE> const *buffer;
        size_t read_idx;
    };

    template <typename T, size_t SIZE>
    CircularBufferReader<T, SIZE> build(CircularBuffer<T, SIZE> *buff)
    {
        return CircularBufferReader{
            .buffer = buff,
            .read_idx = snapshot_write_idx(buff),
        };
    }

    template <typename T, size_t SIZE>
    size_t available_count(CircularBufferReader<T, SIZE> *buff_reader);

    template <typename T, size_t SIZE>
    bool pop(T[]);
}
