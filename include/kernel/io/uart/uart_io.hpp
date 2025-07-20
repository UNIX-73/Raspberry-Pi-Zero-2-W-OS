#pragma once
#include <stdint.h>

namespace kernel::io::uart::uart_io
{
    void putchar(char c);

    void new_line();
    void return_carriage();

    void send(const char *s);
    void sendln(const char *s);

    char uint32_to_char(uint32_t v);
}