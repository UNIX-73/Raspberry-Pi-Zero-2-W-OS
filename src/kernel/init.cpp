#include <kernel/init.hpp>
#include <boot/exception_level/exception_level.hpp>
#include <drivers/irq.hpp>
#include <drivers/aux/mini_uart.hpp>
#include <boot/exception_level/el1/el1_core.hpp>
#include <kernel/io/uart_io.hpp>

namespace kernel
{
    void init_devices()
    {
        if (read_el() != 1)
        {
            switch_to_el1(); // Sale de esta fn y vuelve a kernel main
        }
        else
        {
            irq_enable(); // msr daifclr, #2
            IRQ::enable_irq(IRQ::IRQ_OPTIONS::MINI_UART);
            AUX::MINI_UART::init();
        }
    }

    void start()
    {
        while (1)
        {
            kernel::io::uart_io::sendln("Hello world");

            for (int i = 0; i < 20000000; i++)
            {
                asm("nop");
            }
        }
    }
}
