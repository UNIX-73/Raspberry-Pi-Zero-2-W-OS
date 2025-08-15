#include <boot/exception_level/el1/el1_core.hpp>
#include <boot/exception_level/el1/mmu/mmu.hpp>
#include <boot/exception_level/exception_level.hpp>
#include <drivers/aux/mini_uart.hpp>
#include <drivers/gpio.hpp>
#include <drivers/irq.hpp>
#include <drivers/mailbox/clock.hpp>
#include <drivers/mailbox/temperature.hpp>
#include <kernel/init.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/lib/debug/debug.hpp>
#include <kernel/programs/program_registry.hpp>
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

		kernel::io::uart::sendln("entered init_el1 from cpp");

		static bool mmu_init = false;
		if (!mmu_init)
		{
			mmu_init = true;
			__init_el1_mmu();
		}

		kernel::io::uart::sendln("exited init_el1 from cpp");
	}
}

void kernel::start()
{
	while (1)
	{
		kernel::io::uart::clr_screen();

		kernel::io::uart::sendln("OS STARTED - (EL1)");

		kernel::programs::registry::find_by_name("shell")->entry(0x00000001, "");

		for (int i = 0; i < 20000000; i++)
		{
			asm("nop");
		}
	}
}
