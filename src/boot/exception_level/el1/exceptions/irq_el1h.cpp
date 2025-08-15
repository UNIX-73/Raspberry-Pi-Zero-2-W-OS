#include <drivers/aux/aux.hpp>
#include <drivers/irq.hpp>
#include <kernel/io/input_buffer.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <lib/ascii.hpp>

static kernel::io::input_buffer::UartCircular *input_buffer_ptr = nullptr;
extern "C" void irq_el1h(void)
{
	*AUX::MU_IER_REG_ADDR_PTR = 0x1;

	if (!input_buffer_ptr)
	{
		input_buffer_ptr = kernel::io::input_buffer::get_input_buffer();
	}

	if ((*IRQ::IRQ_PENDING_1 & (1u << 29)) == 0)
		return; // AUX pending?

	// Opcional: consumir IIR para saber causas pendientes (se repite hasta no pendiente)
	for (;;)
	{
		uint32_t iir = *AUX::MU_IIR_REG_ADDR_PTR;
		if ((iir & 0x1))
			break; // bit0=1 => no pending

		// Si la causa es RX: drenar FIFO
		if (((iir >> 1) & 0x3) == 0x2 /* Receive */ || (*AUX::MU_LSR_REG_ADDR_PTR & 1u))
		{
			while ((*AUX::MU_LSR_REG_ADDR_PTR & 1u) != 0u)
			{
				uint8_t b = *AUX::MU_IO_REG_ADDR_PTR;
				input_buffer_ptr->push(b);
			}

			asm volatile("dmb ish");
		}
		// Si no manejas TX por IRQ, ignora/máscala. No escribas aquí al IO REG.
	}
}
