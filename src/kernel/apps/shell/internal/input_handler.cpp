#include <kernel/apps/shell/internal/input_handler.hpp>
#include <kernel/apps/shell/internal/state.hpp>

namespace kernel::apps::shell::internal::input_handler
{
    bool char_is_letter(uint8_t c)
    {
        return (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z');
    }

    bool char_is_digit(uint8_t c)
    {
        return (c >= '0' && c <= '9');
    }

    bool char_is_allowed_symbol(uint8_t c)
    {
        return char_is_letter(c) || char_is_digit(c) || c == '_' || c == '-' || c == '.';
    }

    bool buffer_is_full()
    {
        return (state::input_idx >= state::INPUT_BUFFER_SIZE);
    }

    void push_char(uint8_t c)
    {
        if (buffer_is_full())
            return;

        state::input_buffer[state::input_idx++] = c;
    }
}