#include <kernel/init.hpp>
#include <boot/exception_level/exception_level.hpp>
#include <drivers/irq.hpp>
#include <drivers/aux/mini_uart.hpp>
#include <boot/exception_level/el1/el1_core.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/programs/program_registry.hpp>
#include <drivers/gpio.hpp>

namespace kernel
{
    void init_devices()
    {
        if (read_el() != 1)
        {
            switch_to_el1(); // Sale de esta fn y vuelve a kernel main
        }

        if (read_el() == 1)
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
            kernel::io::uart::uart_io::clear_screen();
            kernel::io::uart::uart_io::sendln("OS STARTED - (EL1)");

            kernel::programs::registry::find_by_name("shell")->entry(0x00000001, "");

            for (int i = 0; i < 20000000; i++)
            {
                asm("nop");
            }
        }
    }
}
