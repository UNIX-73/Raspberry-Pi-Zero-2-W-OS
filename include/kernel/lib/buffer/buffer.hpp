#pragma once
#include <stdint.h>
#include <stddef.h>

namespace kernel::lib::buffer
{
    template <typename T>
    void fill_buffer(T filler, T *buffer, size_t len)
    {
        for (size_t i = 0; i < len; i++)
        {
            buffer[i] = filler;
        }
    };
}