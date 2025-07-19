#include <kernel/init.hpp>

extern "C" void kernel_main(void)
{
    kernel::init_devices();
    kernel::start();
}
