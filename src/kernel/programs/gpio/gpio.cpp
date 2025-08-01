#include <kernel/programs/gpio/gpio.hpp>
#include <kernel/lib/string.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <drivers/gpio.hpp>
#include <kernel/lib/debug/debug.hpp>
#include <kernel/lib/buffer/buffer.hpp>

namespace kernel::programs::gpio
{
    static const char *allowed_args[6] = {
        "-s",
        "--status",
        "-i",
        "--input",
        "-o",
        "--output",
    };

    static constexpr size_t ALLOWED_ARGS_SIZE = sizeof(allowed_args) / sizeof(allowed_args[0]);

    static uint64_t status(uint32_t pin)
    {
        return 0;
    }

    static uint64_t input(uint32_t pin)
    {
        GPIO::set_function_select(pin, GPIO::FSEL_OPTIONS::INPUT);
        return 0;
    }

    static uint64_t output(uint32_t pin)
    {
        GPIO::set_function_select(pin, GPIO::FSEL_OPTIONS::OUTPUT);
        GPIO::set_pin(pin);
        return 0;
    }

    static uint64_t run_arg(const char *arg, uint32_t pin)
    {
        for (size_t i = 0; i < 2; i++)
        {
            if (arg == allowed_args[0 + i])
            {
                return status(pin);
            }
            if (arg == allowed_args[2 + i])
            {
                return input(pin);
            }
            if (arg == allowed_args[4 + i])
            {
                return output(pin);
            }
        }

        // TODO: panic()
        return 1;
    }

    using namespace lib::string::args;
    uint64_t run(uint64_t program_id, char *args)
    {
        alignas(16) ParsedArgs parsed_args;
        parsed_args.argc = 0;
        lib::buffer::fill_buffer<char *>(nullptr, parsed_args.argv, PARSED_ARGS_MAX_COUNT);
        // Hay que usar parse into en vez de un return en copia porque en copia salta error sync el1h por copiar datos desalineados entiendo yo
        // TODO: cuando haga la mmu hacer esto más bonito
        parse_into(args, &parsed_args);

        // Check if arguments provided
        if (parsed_args.argc == 0)
        {
            io::uart::uart_io::sendln("Error: no arguments provided.");
            io::uart::uart_io::sendln("Usage: gpio [-i | --input] <pin> | [-o | --output] <pin> | [-s | status] <pin>");
            return 1;
        }

        // Check if argument is valid
        const char *valid_arg = nullptr;
        for (size_t i = 0; i < ALLOWED_ARGS_SIZE; i++)
        {
            if (lib::string::equal(parsed_args.argv[0], allowed_args[i]))
            {
                valid_arg = allowed_args[i];
                break;
            }
        }

        if (valid_arg == nullptr)
        {
            io::uart::uart_io::sendln("Error: unknown argument.");
            io::uart::uart_io::sendln("Usage: gpio [-i | --input] <pin> | [-o | --output] <pin> | [-s | status] <pin>");
            return 1;
        }

        if (parsed_args.argc < 2)
        {
            io::uart::uart_io::sendln("Error: missing pin number.");
            return 1;
        }

        // Check if pin number is valid
        char *arg2 = parsed_args.argv[1];
        uint32_t pin = 0;

        for (size_t i = 0; arg2[i] != '\0'; i++)
        {
            if (!lib::string::char_is_digit(arg2[i]))
            {
                io::uart::uart_io::sendln("Error: pin must be a number.");
                return 1;
            }
            pin = pin * 10 + lib::string::ascii_to_uint8(arg2[i]);
        }

        // If pin > 39 does not exist
        if (pin > 39)
        {
            io::uart::uart_io::sendln("Error: pin number must be between 0 and 39.");
            return 1;
        }

        return run_arg(valid_arg, pin);
    };
}