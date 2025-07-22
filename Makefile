# ============================
# Toolchain
# ============================

CROSS    := aarch64-none-elf-
CPP      := $(CROSS)g++
CC       := $(CROSS)gcc
LD       := $(CROSS)ld
AS       := $(CROSS)as
OBJCOPY  := $(CROSS)objcopy
OBJDUMP  := $(CROSS)objdump

# ============================
# Flags
# ============================

DEFINES := -DDEBUG -DSAFE

CFLAGS   := $(DEFINES) -Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers -ffreestanding -O2 -nostdlib -nostartfiles -mabi=lp64 -march=armv8-a -mtune=cortex-a53
CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -fno-threadsafe-statics -fno-use-cxa-atexit
INCLUDE_DIRS := -Iinclude

# ============================
# Paths
# ============================
SRC_DIR    := src
BUILD_DIR  := build
BIN_DIR    := bin
ASM_DIR    := __objdump
MAP_DIR	   := $(ASM_DIR)


# ============================
# Files
# ============================

ASM_FILES := $(shell find $(SRC_DIR) -name '*.S')
CPP_FILES := $(shell find $(SRC_DIR) -name '*.cpp')

OBJ_FILES := $(ASM_FILES:%.S=$(BUILD_DIR)/%.o) \
             $(CPP_FILES:%.cpp=$(BUILD_DIR)/%.o)

ASM_OUTPUTS := $(OBJ_FILES:$(BUILD_DIR)/%.o=$(ASM_DIR)/%.s)

KERNEL_ELF := $(BIN_DIR)/kernel.elf
KERNEL_IMG := $(BIN_DIR)/kernel8.img

# ============================
# Build Rules
# ============================

all: $(KERNEL_IMG)

$(KERNEL_IMG): $(KERNEL_ELF)
	@mkdir -p $(BIN_DIR)
	$(OBJCOPY) $< -O binary $@

$(KERNEL_ELF): $(OBJ_FILES)
	@mkdir -p $(BIN_DIR)
	@mkdir -p $(MAP_DIR)
	$(LD) -T linker.ld -Map=$(MAP_DIR)/kernel.map -o $@ $^

$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CPP) $(CXXFLAGS) $(INCLUDE_DIRS) -c $< -o $@

$(BUILD_DIR)/%.o: %.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDE_DIRS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(ASM_DIR)

# ============================
# ASM objdump
# ============================

objdump: $(OBJ_FILES) $(ASM_OUTPUTS)

$(ASM_DIR)/%.s: $(BUILD_DIR)/%.o
	@mkdir -p $(dir $@)
	$(OBJDUMP) -d -S $< > $@