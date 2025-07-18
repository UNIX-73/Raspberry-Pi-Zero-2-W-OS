#include <kernel/io/uart_io.hpp>

void kernel::io::uart_io::putchar(char c)
{
    while (AUX::MINI_UART::write_fifo_is_full())
    {
        asm("nop");
    }
    AUX::MINI_UART::write(c);
}

void kernel::io::uart_io::new_line()
{
    putchar('\n');
}

void kernel::io::uart_io::return_carriage()
{
    putchar('\r');
}

void kernel::io::uart_io::send(const char *s)
{
    while (*s)
        putchar(*s++);
}

void kernel::io::uart_io::sendln(const char *s)
{
    send(s);
    new_line();
    return_carriage();
}

char kernel::io::uart_io::uint32_to_char(uint32_t v)
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