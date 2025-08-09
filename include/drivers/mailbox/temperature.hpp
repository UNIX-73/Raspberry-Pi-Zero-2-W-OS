#pragma once

#include <cstdint>

namespace drivers::mailbox::temperature
{
    enum class TemperatureSensor : uint32_t
    {
        SOC_SENSOR = 0,
        PCB_SENSOR = 1,
    };

    uint32_t read_firmware_temperature(TemperatureSensor sensor);
    uint32_t read_firmware_max_temperature(TemperatureSensor sensor);
}
