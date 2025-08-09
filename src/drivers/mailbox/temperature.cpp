#include <drivers/mailbox/temperature.hpp>
#include <drivers/mailbox/mailbox.hpp>
#include <drivers/mailbox/core/mailbox_tags.hpp>

namespace drivers::mailbox::temperature
{
    uint32_t read_firmware_temperature(TemperatureSensor sensor)
    {
        uint32_t temp = 0;

        bool result = mailbox_generic_command(tags::RPI_FIRMWARE_GET_TEMPERATURE, (uint32_t)sensor, &temp);

        if (!result)
        {
            return 0; // TODO: panic!()
        }

        return temp;
    }

    uint32_t read_firmware_max_temperature(TemperatureSensor sensor)
    {
        uint32_t temp = 0;

        bool result = mailbox_generic_command(tags::RPI_FIRMWARE_GET_MAX_TEMPERATURE, (uint32_t)sensor, &temp);

        if (!result)
        {
            return 0; // TODO: panic!()
        }

        return temp;
    }

}
