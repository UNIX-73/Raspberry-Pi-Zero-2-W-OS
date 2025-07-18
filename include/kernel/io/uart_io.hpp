#pragma once
#include <drivers/aux/mini_uart.hpp>

namespace kernel::io::uart_io
{
    void putchar(char c);

    void new_line();
    void return_carriage();

    void send(const char *s);
    void sendln(const char *s);

    char uint32_to_char(uint32_t v);

}