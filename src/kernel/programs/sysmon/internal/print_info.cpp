#include <kernel/programs/sysmon/internal/print_info.hpp>
#include <drivers/mailbox/clock.hpp>
#include <drivers/mailbox/temperature.hpp>
#include <kernel/io/uart/uart_io.hpp>
#include <lib/ascii.hpp>

namespace kernel::programs::sysmon::internal
{
    struct SysInfo
    {
        // Clock frequencies (in Hz)
        uint32_t core_clock_rate; // CT_CORE clock rate
        uint32_t arm_clock_rate;  // CT_ARM (CPU) clock rate
        uint32_t uart_clock_rate; // CT_UART clock rate
        uint32_t emmc_clock_rate; // CT_EMMC clock rate

        // Temperatures (in millidegrees Celsius)
        uint32_t soc_temp;     // SoC (CPU/GPU) temperature
        uint32_t pcb_temp;     // SoC (CPU/GPU) temperature
        uint32_t soc_max_temp; // Maximum allowed temperature
        uint32_t pcb_max_temp; // Maximum allowed temperature

        // Voltages (in microvolts)
        uint32_t core_voltage;  // Core voltage
        uint32_t sdram_voltage; // SDRAM voltage

        // Memory sizes (in bytes)
        uint32_t arm_mem_size; // ARM (CPU) accessible memory size
        uint32_t vc_mem_size;  // VideoCore (GPU) accessible memory size

        // Board information
        uint32_t board_model;    // Raspberry Pi model identifier
        uint32_t board_revision; // Hardware revision code
        uint64_t board_serial;   // Unique board serial number
    };

    static SysInfo get_sys_info()
    {
        SysInfo sys_info{};

        using namespace drivers::mailbox;
        // Clock frequencies (in Hz)
        sys_info.core_clock_rate = clock::read_clock_rate(clock::ClockType::CT_CORE);
        sys_info.arm_clock_rate = clock::read_clock_rate(clock::ClockType::CT_ARM);
        sys_info.uart_clock_rate = clock::read_clock_rate(clock::ClockType::CT_UART);
        sys_info.emmc_clock_rate = clock::read_clock_rate(clock::ClockType::CT_EMMC);

        // Temperatures (in millidegrees Celsius)
        sys_info.soc_temp = temperature::read_firmware_temperature(temperature::TemperatureSensor::SOC_SENSOR);
        sys_info.pcb_temp = temperature::read_firmware_temperature(temperature::TemperatureSensor::PCB_SENSOR);
        sys_info.soc_max_temp = temperature::read_firmware_max_temperature(temperature::TemperatureSensor::SOC_SENSOR);
        sys_info.pcb_max_temp = temperature::read_firmware_max_temperature(temperature::TemperatureSensor::PCB_SENSOR);

        // Voltages
        // TODO: los demas datos

        return sys_info;
    }

    void print_info()
    {
        SysInfo info = get_sys_info();

        char text_buff[21] = {'\0'};

        using namespace kernel::io::uart;
        using namespace ::lib::ascii;

        clr_screen();

        sendln("==== Raspberry Pi Zero 2 W - System Monitor ====");

        // Clocks
        send("Core Clock: ");
        u64_to_ascii(info.core_clock_rate / 1000000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" MHz");
        send("ARM Clock:  ");
        u64_to_ascii(info.arm_clock_rate / 1000000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" MHz");
        send("UART Clock: ");
        u64_to_ascii(info.uart_clock_rate / 1000000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" MHz");
        send("eMMC Clock: ");
        u64_to_ascii(info.emmc_clock_rate / 1000000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" MHz");

        // Temperatures
        send("SoC Temp:  ");
        u64_to_ascii(info.soc_temp / 1000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" °C");
        send("PCB Temp:  ");
        u64_to_ascii(info.pcb_temp / 1000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" °C");
        send("SoC Max:   ");
        u64_to_ascii(info.soc_max_temp / 1000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" °C");
        send("PCB Max:   ");
        u64_to_ascii(info.pcb_max_temp / 1000, text_buff, sizeof(text_buff));
        send(text_buff);
        sendln(" °C");

        sendln("===============================================");
    };
}
