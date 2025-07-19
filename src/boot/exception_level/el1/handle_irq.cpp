#include <boot/exception_level/el1/handle_irq.hpp>
#include <kernel/io/uart_io.hpp>
#include <drivers/aux/mini_uart.hpp>

void handle_invalid_el1_irq(void)
{

    *AUX::MU_IO_REG_ADDR_PTR = 'X';
    kernel::io::uart_io::sendln("INVALID IRQ ARRIVED");
}

extern "C" void __attribute__((naked, noinline)) handle_irq_el1h(void)
{
    *AUX::MU_IO_REG_ADDR_PTR = 'C';

    /* reg32_ptr_t clear = (reg32_ptr_t)0x3F215048;

    *clear = 0b11;

    *AUX::MU_IO_REG_ADDR_PTR = 'X';
    kernel::io::uart_io::sendln("IRQ ARRIVED");
    */
    // return;
}