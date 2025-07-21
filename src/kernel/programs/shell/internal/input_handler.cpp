#include <kernel/programs/shell/internal/input_handler.hpp>
#include <kernel/programs/shell/internal/state.hpp>
#include <kernel/programs/shell/internal/command_executor.hpp>
#include <kernel/io/uart/uart_io.hpp>

namespace kernel::programs::shell::internal::input_handler
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
        return char_is_letter(c) || char_is_digit(c) || c == '_' || c == '-' || c == '.' || c == ' ';
    }

    bool buffer_is_full()
    {
        return (state::command_buffer_idx >= state::COMMAND_BUFFER_SIZE);
    }

    void handle_del()
    {
        if (state::command_buffer_idx != 0)
        {
            --state::command_buffer_idx;
            send_to_frontend('\b');
        }
    }

    void handle_tab()
    {
        if (state::command_buffer_idx < (state::COMMAND_BUFFER_SIZE - state::TAB_SPACE_SIZE))
        {
            for (int i = 0; i < 4; i++)
            {
                input_handler::push_char(' ');
            }
        }
    }

    void push_char(uint8_t c)
    {
        if (buffer_is_full())
            return;

        state::command_buffer[state::command_buffer_idx++] = c;

        send_to_frontend(c);
    }

    void send_to_frontend(uint8_t c)
    {
        // TODO: hacerlo según frontend, mejor filtrado etc.

        if (c == '\b')
        {
            kernel::io::uart::uart_io::send("\b \b");
            return;
        }

        if (c == '\n' || c == '\r')
        {
            kernel::io::uart::uart_io::newline();
            kernel::io::uart::uart_io::return_carriage();
            return;
        }

        kernel::io::uart::uart_io::putchar(c);
    }

    void send_to_frontend(const char *str)
    {
        while (*str != '\0')
        {
            send_to_frontend(static_cast<uint8_t>(*str));
            ++str;
        }
    }

    void handle_input_char(uint8_t c)
    {
        using namespace kernel::programs::shell::internal;

        if (input_handler::char_is_allowed_symbol(c))
        {
            input_handler::push_char(c);
            return;
        }
        if (c == '\b' || c == 0x7F)
        {
            input_handler::handle_del();
            return;
        }
        if (c == '\t')
        {
            input_handler::handle_tab();
            return;
        }
        if (c == '\n' || c == '\r')
        {
            command_executor::execute_command();
            return;
        }
    }
}