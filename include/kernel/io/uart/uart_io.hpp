#pragma once
#include <stdint.h>

namespace kernel::io::uart
{
    void putchar(char c);

    void newline();
    void return_carriage();

    extern "C"
    {
        void send(const char *s);
        void sendln(const char *s);
    }

    char uint32_to_char(uint32_t v);

    inline void clr_screen() { send("\033[2J\033[H"); };
    inline void hide_cursor() { kernel::io::uart::send("\x1b[?25l"); }
    inline void show_cursor() { kernel::io::uart::send("\x1b[?25h"); }

}