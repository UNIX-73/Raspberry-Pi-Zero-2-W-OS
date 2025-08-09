#pragma once
#include <cstdint>

namespace drivers::mailbox
{
    namespace rpi_power_domain_const
    {
        constexpr uint32_t I2C0 = 0;
        constexpr uint32_t I2C1 = 1;
        constexpr uint32_t I2C2 = 2;
        constexpr uint32_t VIDEO_SCALER = 3;
        constexpr uint32_t VPU1 = 4;
        constexpr uint32_t HDMI = 5;
        constexpr uint32_t USB = 6;
        constexpr uint32_t VEC = 7;
        constexpr uint32_t JPEG = 8;
        constexpr uint32_t H264 = 9;
        constexpr uint32_t V3D = 10;
        constexpr uint32_t ISP = 11;
        constexpr uint32_t UNICAM0 = 12;
        constexpr uint32_t UNICAM1 = 13;
        constexpr uint32_t CCP2RX = 14;
        constexpr uint32_t CSI2 = 15;
        constexpr uint32_t CPI = 16;
        constexpr uint32_t DSI0 = 17;
        constexpr uint32_t DSI1 = 18;
        constexpr uint32_t TRANSPOSER = 19;
        constexpr uint32_t CCP2TX = 20;
        constexpr uint32_t CDP = 21;
        constexpr uint32_t ARM = 22;

        constexpr uint32_t COUNT = 23;
    }

    namespace rpi_firmware_property_status_const
    {
        constexpr uint32_t RPI_FIRMWARE_STATUS_REQUEST = 0;
        constexpr uint32_t RPI_FIRMWARE_STATUS_SUCCESS = 0x80000000;
        constexpr uint32_t RPI_FIRMWARE_STATUS_ERROR = 0x80000001;
    }

}