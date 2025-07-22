#include <kernel/lib/string.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/lib/buffer/buffer.hpp>
#include <kernel/lib/debug/debug.hpp>

namespace kernel::lib::string
{
    int32_t strcmp(const char *s1, const char *s2)
    {
        while (*s1 && (*s1 == *s2))
        {
            s1++;
            s2++;
        }
        return *(const unsigned char *)s1 - *(const unsigned char *)s2;
    }

    bool equal(const char *s1, const char *s2)
    {
#ifdef SAFE
        if (s1 == nullptr)
        {
            lib::debug::debug_sendln("s1 is nullptr");
            return false;
        }
        if (s2 == nullptr)
        {
            lib::debug::debug_sendln("s2 is nullptr");
            return false;
        }
#endif

        while (*s1 != '\0' && *s2 != '\0')
        {
            if (*s1 != *s2)
                return false;
            s1++;
            s2++;
        }

        return *s1 == *s2;
    }

    bool char_is_undercase_letter(uint8_t c)
    {
        return (c >= 'a' && c <= 'z');
    }

    bool char_is_uppercase_letter(uint8_t c)
    {
        return (c >= 'A' && c <= 'Z');
    }

    bool char_is_letter(uint8_t c)
    {
        return char_is_undercase_letter(c) || char_is_uppercase_letter(c);
    }

    bool char_is_digit(uint8_t c)
    {
        return (c >= '0' && c <= '9');
    }

    uint8_t ascii_to_uint8(char c)
    {
        if (char_is_digit(c))
        {
            return c - '0';
        }
        return 0;
    };

    namespace args
    {
        void parse_into(char *raw, ParsedArgs *out)
        {
            out->argc = 0;

            while (*raw != '\0' && out->argc < 8)
            {
                while (*raw == ' ')
                    raw++;

                if (*raw == '\0')
                    break;

                out->argv[out->argc++] = raw;

                while (*raw != '\0' && *raw != ' ')
                    raw++;

                if (*raw == ' ')
                {
                    *raw = '\0';
                    raw++;
                }
            }
        }
    }
}