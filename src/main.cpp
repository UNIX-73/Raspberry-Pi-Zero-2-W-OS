#include <drivers/gpio.hpp>
#include <drivers/aux/mini_uart.hpp>
#include <kernel/io/uart_io.hpp>
#include <boot/exception_level/exception_level.hpp>
#include <boot/exception_level/el1/el1_core.hpp>
#include <drivers/irq.hpp>
#include <boot/exception_level/el1/handle_irq.hpp>

extern "C" void kernel_main(void)
{
    if (read_el() == 1)
    {
        irq_enable(); // msr daifclr, #2
        IRQ::enable_irq(IRQ::IRQ_OPTIONS::MINI_UART);
        AUX::MINI_UART::init();
    }

    GPIO::set_function_select(21, GPIO::FSEL_OPTIONS::OUTPUT);
    GPIO::set_pin(21);

    bool pin = false;
    int x = 0;

    while (1)
    {
        if (*IRQ::IRQ_PENDING_1 & (1 << 29))
        {
            kernel::io::uart_io::sendln("Mini UART IRQ pending bit is SET");
        }
        kernel::io::uart_io::send("Hello world! - EL");

        kernel::io::uart_io::putchar(kernel::io::uart_io::uint32_to_char(read_el()));
        kernel::io::uart_io::new_line();
        kernel::io::uart_io::return_carriage();

        pin = !pin;

        for (uint32_t i = 0; i < 2000000; i++)
        {
            asm("nop");
        }

        if (x++ > 2 && read_el() != 1)
            switch_to_el1();
    }
}