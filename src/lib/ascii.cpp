#include <lib/ascii.hpp>

namespace lib::ascii
{
    char *u64_to_ascii(uint64_t val, char *out, size_t len)
    {
        if (len == 0)
            return out; // No hay espacio ni para '\0'

        char buffer[21]; // Máximo 20 dígitos en u64 + '\0'
        int i = 0;

        if (val == 0)
        {
            if (len > 1)
            {
                out[0] = '0';
                out[1] = '\0';
            }
            else
            {
                out[0] = '\0'; // Solo cabe el null
            }

            return out;
        }

        while (val > 0 && i < (int)(sizeof(buffer) - 1)) // No más de 20 dígitos
        {
            buffer[i++] = '0' + (val % 10);
            val /= 10;
        }

        int out_len = (i < (int)(len - 1)) ? i : (int)(len - 1);

        for (int j = 0; j < out_len; ++j)
        {
            out[j] = buffer[i - j - 1];
        }

        out[out_len] = '\0';

        return out;
    }

    char *u64_to_hex_ascii(uint64_t value, char *out, size_t len)
    {
        static const char *hex_chars = "0123456789ABCDEF";

        if (len == 0)
            return out;

        size_t max_chars = (len - 1 < 16) ? (len - 1) : 16; // máx 16 dígitos hex en u64

        for (size_t i = 0; i < max_chars; ++i)
        {
            int shift = (15 - i) * 4;
            out[i] = hex_chars[(value >> shift) & 0xF];
        }

        out[max_chars] = '\0';

        return out;
    }
}