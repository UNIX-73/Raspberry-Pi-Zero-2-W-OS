#include <drivers/aux/mini_uart.hpp>
#include <core.hpp>

void AUX::MINI_UART::init()
{
    // Set pin 14 and 15 as function ALT5 for miniuart
    GPIO::set_function_select(14, GPIO::FSEL_OPTIONS::ALT5);
    GPIO::set_function_select(15, GPIO::FSEL_OPTIONS::ALT5);

    // Set pin 14 and 15 with PUD disabled (are under use)
    GPIO::set_pull_up_down(14, GPIO::PUD_OPTIONS::OFF);
    GPIO::set_pull_up_down(15, GPIO::PUD_OPTIONS::OFF);

    // Auxiliary enable
    *ENABLES_ADDR_PTR = 0b1;

    // Disable io while configuring
    *MU_CNTL_REG_ADDR_PTR = 0b00;

    // Disable interrupts
    *MU_IER_REG_ADDR_PTR = 0b0;

    // Clear FIFOs (TX & RX)
    *MU_IIR_REG_ADDR_PTR = 0b11;

    // Set 8 bit transmision
    *MU_LCR_REG_ADDR_PTR = 0b11; // 8-bit + DLAB = 1

    // Disable modem signals
    *MU_MCR_REG_ADDR_PTR = 0;

    // 0:15 bits are the baudrate, in this case is 115200
    uint16_t baud_rate = (SYSTEM_CLOCK_FREQ / (8 * MINI_UART_BAUDRATE)) - 1; // TODO: read the clock freq from registers if possible
    *MU_BAUD_REG_ADDR_PTR = baud_rate;

    // Enable IO again
    *MU_CNTL_REG_ADDR_PTR = 0b11;

    // Enable interrupts
    *MU_IER_REG_ADDR_PTR = 0b1;

    
}