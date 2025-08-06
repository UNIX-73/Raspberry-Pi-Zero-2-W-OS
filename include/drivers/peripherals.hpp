#pragma once
#include <stdint.h>
#include <drivers/utils/mapped_reg.hpp>

#define PERIPHERAL_PTR(offset) ((reg32_ptr_t)((PERIPHERAL_BASE) + (offset)))

constexpr uintptr_t PERIPHERAL_BASE = 0x3F000000;
constexpr uintptr_t DEVICE_START = 0x3B400000;