#include <kernel/programs/program_registry.hpp>
#include <kernel/lib/string.hpp>
#include <kernel/programs/shell/shell.hpp>
#include <kernel/programs/clear/clear.hpp>
#include <kernel/programs/gpio/gpio.hpp>
#include <kernel/programs/sysmon/sysmon.hpp>

namespace kernel::programs::registry
{
    static ProgramDefinition kernel_programs[] = {
        {"shell", "", shell::run, false},
        {"clear", "Clears the screen", clear::run, false},
        {"gpio", "Allows control of the GPIO pins", gpio::run, false},
        {"sysmon",
         "System Monitor - Shows the system information and status", sysmon::run, false}};

    ProgramDefinition *find_by_name(const char *name)
    {
        for (size_t i = 0; i < sizeof(kernel_programs) / sizeof(kernel_programs[0]); ++i)
        {
            if (kernel::lib::string::strcmp(kernel_programs[i].name, name) == 0)
                return &kernel_programs[i];
        }

        return nullptr;
    }

    ProgramDefinition *get_all()
    {
        return kernel_programs;
    }

    size_t count()
    {
        return sizeof(kernel_programs) / sizeof(kernel_programs[0]);
    }

}
