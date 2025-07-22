#include <kernel/lib/debug/debug.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <kernel/lib/buffer/buffer.hpp>

namespace kernel::lib::debug
{
    void debug_stack_alineation()
    {
#ifdef DEBUG
        uint64_t sp;
        asm volatile("mov %0, sp" : "=r"(sp));

        if (sp % 16 == 0)
        {
            io::uart::uart_io::send("stack alineado\n\r");
        }
        else
        {
            io::uart::uart_io::send("stack desalineado!\n\r");
        }
#endif
    }

    void debug_send(const char *msg)
    {
#ifdef DEBUG
        io::uart::uart_io::send("[DEBUG]=");
        io::uart::uart_io::send(msg);
#endif
    }

    void debug_sendln(const char *msg)
    {
#ifdef DEBUG
        debug_send(msg);
        io::uart::uart_io::newline();
        io::uart::uart_io::return_carriage();
#endif
    }

    void debug_print_hex_u64(uint64_t value)
    {
#ifdef DEBUG
        static const char hex_digits[] = "0123456789ABCDEF";

        debug_stack_alineation();

        alignas(16) char buffer[19];
        lib::buffer::fill_char_buffer(buffer, 19, "0x0000000000000000");

        for (int i = 0; i < 16; ++i)
        {
            buffer[17 - i] = hex_digits[value & 0xF];
            value >>= 4;
        }

        buffer[18] = '\0';

        io::uart::uart_io::send(reinterpret_cast<char *>(buffer));
        io::uart::uart_io::send("\n\r");
#endif
    }

    void debug_ptr_address(const void *ptr)
    {
#ifdef DEBUG
        uintptr_t val = reinterpret_cast<uintptr_t>(ptr);

        alignas(16) char hex[19];
        lib::buffer::fill_char_buffer(hex, 19, "0x0000000000000000");
        
        const char *digits = "0123456789ABCDEF";

        for (int i = 0; i < 16; ++i)
        {
            hex[17 - i] = digits[val & 0xF];
            val >>= 4;
        }

        io::uart::uart_io::sendln(hex);
#endif
    }

    void debug_print_sp()
    {
#ifdef DEBUG
        uint64_t sp;
        asm volatile("mov %0, sp" : "=r"(sp));
        debug_send("SP:");
        debug_ptr_address(reinterpret_cast<void *>(sp));
#endif
    }

    extern "C" uint64_t _stack_el1_top;
    extern "C" uint64_t _stack_el1_bottom;

    void check_sp_bounds()
    {
        uint64_t sp;
        asm volatile("mov %0, sp" : "=r"(sp));

        if (sp < reinterpret_cast<uint64_t>(&_stack_el1_bottom) || sp >= reinterpret_cast<uint64_t>(&_stack_el1_top))
        {
            kernel::io::uart::uart_io::sendln("SP fuera de rango del stack EL1");
        }
        else
        {
            kernel::io::uart::uart_io::sendln("SP dentro del rango del stack EL1");
        }
    }

}