#include <kernel/init.hpp>
#include <boot/exception_level/exception_level.hpp>
#include <drivers/irq.hpp>
#include <drivers/aux/mini_uart.hpp>
#include <boot/exception_level/el1/el1_core.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/programs/program_registry.hpp>
#include <drivers/gpio.hpp>
#include <boot/exception_level/el1/mmu/mmu.hpp>
#include <kernel/lib/debug/debug.hpp>
#include <drivers/mailbox/clock.hpp>
#include <drivers/mailbox/temperature.hpp>
#include <lib/ascii.hpp>

void kernel::init_devices()
{
    if (read_el() != 1)
    {
        AUX::MINI_UART::init();

        __setup_init_el1_mmu();
        switch_to_el1(); // Sale de esta fn y vuelve a kernel main
    }

    if (read_el() == 1)
    {
        kernel::lib::debug::debug_ptr_address((uint64_t *)&init_devices);

        irq_enable(); // msr daifclr, #2
        IRQ::enable_irq(IRQ::IRQ_OPTIONS::MINI_UART);

        kernel::io::uart::uart_io::sendln("entered init_el1 from cpp");

        static bool mmu_init = false;
        if (!mmu_init)
        {
            mmu_init = true;
            __init_el1_mmu();
        }

        kernel::io::uart::uart_io::sendln("exited init_el1 from cpp");

        kernel::lib::debug::mmu_test_all();
    }
}

void kernel::start()
{
    while (1)
    {
        kernel::io::uart::uart_io::clear_screen();

        uint32_t hz = drivers::mailbox::clock::read_clock_rate(drivers::mailbox::clock::ClockType::CT_ARM);

        uint32_t ghz_int = hz / 1000000000;               // Parte entera: 1
        uint32_t ghz_frac = (hz % 1000000000) / 10000000; // 2 decimales: 50

        char ghz_int_text[20];
        char ghz_frac_text[20];

        kernel::io::uart::uart_io::send("CPU RATE - ");
        kernel::io::uart::uart_io::send(::lib::ascii::u64_to_ascii(ghz_int, ghz_int_text, 20));
        kernel::io::uart::uart_io::send(".");
        kernel::io::uart::uart_io::send(::lib::ascii::u64_to_ascii(ghz_frac, ghz_frac_text, 20));
        kernel::io::uart::uart_io::sendln(" GHz");

        kernel::io::uart::uart_io::sendln("OS STARTED - (EL1)");

        while (1)
        {
            kernel::io::uart::uart_io::clear_screen();
            uint32_t temp = drivers::mailbox::temperature::read_firmware_temperature(drivers::mailbox::temperature::TemperatureSensor::CPU_SENSOR) / 1000;

            kernel::io::uart::uart_io::send(::lib::ascii::u64_to_ascii(temp, ghz_frac_text, 20));
            kernel::io::uart::uart_io::sendln("°C");

            // MAX TEMP
            uint32_t max_temp = drivers::mailbox::temperature::read_firmware_max_temperature(drivers::mailbox::temperature::TemperatureSensor::CPU_SENSOR) / 1000;

            kernel::io::uart::uart_io::send("MAX ");
            kernel::io::uart::uart_io::send(::lib::ascii::u64_to_ascii(max_temp, ghz_frac_text, 20));
            kernel::io::uart::uart_io::sendln("°C");

            for (int i = 0; i < 2000000; i++)
            {
                asm("nop");
            }
        }

        kernel::programs::registry::find_by_name("shell")->entry(0x00000001, "");

        for (int i = 0; i < 20000000; i++)
        {
            asm("nop");
        }
    }
}
