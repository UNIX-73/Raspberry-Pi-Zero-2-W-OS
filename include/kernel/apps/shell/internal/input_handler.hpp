#pragma once
#include <kernel/apps/shell/shell.hpp>

namespace kernel::apps::shell::internal::input_handler
{
    bool char_is_letter(uint8_t c);
    bool char_is_digit(uint8_t c);
    bool char_is_allowed_symbol(uint8_t c);
    bool buffer_is_full();
    void push_char(uint8_t c);

    void handle_input_char(uint8_t c);
} // namespace kernel::apps::shell::internal
