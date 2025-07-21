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
DEFINES := -DDEBUG

CFLAGS   := $(DEFINES) -Wall -Wextra  -ffreestanding -O2 -nostdlib -nostartfiles
CXXFLAGS := $(CFLAGS) -fno-rtti -fno-exceptions -fno-threadsafe-statics -fno-use-cxa-atexit
INCLUDE_DIRS := -Iinclude

# ============================
# Paths
# ============================
SRC_DIR    := src
BUILD_DIR  := build
BIN_DIR    := bin
ASM_DIR    := asm

# ============================
# Files
# ============================
ASM_FILES := $(shell find $(SRC_DIR) -name '*.S')
CPP_FILES := $(shell find $(SRC_DIR) -name '*.cpp')

OBJ_FILES := $(ASM_FILES:%.S=$(BUILD_DIR)/%.o) \
             $(CPP_FILES:%.cpp=$(BUILD_DIR)/%.o)

ASM_OUTPUTS := $(CPP_FILES:%.cpp=$(ASM_DIR)/%.s)

KERNEL_ELF := $(BIN_DIR)/kernel.elf
KERNEL_IMG := $(BIN_DIR)/kernel8.img

# ============================
# Build Rules
# ============================

all: clean $(KERNEL_IMG)

$(KERNEL_IMG): $(KERNEL_ELF)
	@mkdir -p $(BIN_DIR)
	$(OBJCOPY) $< -O binary $@

$(KERNEL_ELF): $(OBJ_FILES)
	@mkdir -p $(BIN_DIR)
	$(LD) -T linker.ld -o $@ $^

$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	@mkdir -p $(dir $(ASM_DIR)/$*)
	$(CPP) $(CXXFLAGS) $(INCLUDE_DIRS) -c $< -o $@
	$(OBJDUMP) -d -S $@ > $(ASM_DIR)/$*.s

$(BUILD_DIR)/%.o: %.S
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDE_DIRS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR) $(ASM_DIR)

.PHONY: all clean
