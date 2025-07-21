#pragma once
#include <kernel/programs/shell/shell.hpp>

namespace kernel::programs::shell::internal::input_handler
{
    void handle_input_char(uint8_t c);

    bool char_is_letter(uint8_t c);
    bool char_is_digit(uint8_t c);
    bool char_is_allowed_symbol(uint8_t c);
    bool buffer_is_full();

    void handle_del();
    void handle_tab();
    void push_char(uint8_t c);

    void send_to_frontend(uint8_t c);
    void send_to_frontend(const char *str);

} // namespace kernel::programs::shell::internal
