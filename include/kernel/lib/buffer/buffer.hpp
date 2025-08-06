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

    // Inicializa un buffer sin que salte el error de sync el1h por rodata desalineada
    inline void fill_char_buffer(char *buffer, size_t size, const char *filler)
    {
        size_t i = 0;
        for (; i < size - 1 && filler[i] != '\0'; ++i)
        {
            buffer[i] = filler[i];
        }
        buffer[i] = '\0'; // null-terminación segura
    }



}