#pragma once
#include <stdint.h>
#include <stddef.h>
#include <kernel/lib/debug/debug.hpp>
#include <kernel/lib/buffer/buffer.hpp>

namespace kernel::lib::string
{
    int32_t strcmp(const char *s1, const char *s2);
    bool equal(const char *s1, const char *s2);

    bool char_is_undercase_letter(uint8_t c);
    bool char_is_uppercase_letter(uint8_t c);
    bool char_is_letter(uint8_t c);
    bool char_is_digit(uint8_t c);

    uint8_t ascii_to_uint8(char c);

    // string::args
    namespace args
    {
        constexpr size_t PARSED_ARGS_MAX_COUNT = 8;
        struct ParsedArgs
        {
            uint32_t argc;
            char *argv[PARSED_ARGS_MAX_COUNT];
        };

        void parse_into(char *raw, ParsedArgs *out);

        ParsedArgs parse_args(char *raw);
    }
}