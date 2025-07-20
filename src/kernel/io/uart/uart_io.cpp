#include <kernel/io/uart/uart_io.hpp>
#include <drivers/aux/mini_uart.hpp>

namespace kernel::io::uart::uart_io
{
    void putchar(char c)
    {
        while (AUX::MINI_UART::write_fifo_is_full())
        {
            asm("nop");
        }
        AUX::MINI_UART::write(c);
    }

    void newline()
    {
        putchar('\n');
    }

    void return_carriage()
    {
        putchar('\r');
    }

    void send(const char *s)
    {
        while (*s)
            putchar(*s++);
    }

    void sendln(const char *s)
    {
        send(s);
        newline();
        return_carriage();
    }

    char uint32_to_char(uint32_t v)
    {
        if (v <= 9)
        {
            return '0' + v;
        }
        else
        {
            return '?';
        }
    }
}
