# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from Sony common
include device/sony/common/BoardConfigCommon.mk

# inherit from qcom-common
include device/sony/qcom-common/BoardConfigCommon.mk

TARGET_SPECIFIC_HEADER_PATH := device/sony/msm8226-common/include

BOARD_EGL_CFG := device/sony/msm8226-common/rootdir/system/lib/egl/egl.cfg

# Kernel properties
TARGET_KERNEL_SOURCE := kernel/sony/msm8226

# Platform
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_BOARD_PLATFORM := msm8226
BOARD_VENDOR_PLATFORM := msm8226

# Architecture
TARGET_CPU_VARIANT := krait

# Flags
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Kernel information
BOARD_KERNEL_BASE     := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M build_variant=user
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000 --tags_offset 0x01E00000
BOARD_CUSTOM_BOOTIMG_MK := device/sony/msm8226-common/custombootimg.mk
BOARD_KERNEL_SEPARATED_DT := true

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_USE_SONY_MACUPDATE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# GPS
TARGET_PROVIDES_GPS_LOC_API := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Needed for blobs
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# QCOM/CAF hardware
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
#TARGET_QCOM_AUDIO_VARIANT := caf
#TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_QCOM_MEDIA_VARIANT := caf

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
BOARD_HAVE_NEW_QCOM_CSDCLIENT := true

# QCOM enhanced A/V
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm8226

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/sony/msm8226-common/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    qmux.te \
    rild.te \
    rmt.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    vold.te \
    wpa_supplicant.te

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USERIMAGES_USE_EXT4 := true

# Recovery
TARGET_NO_SEPARATE_RECOVERY := true
TARGET_RECOVERY_FSTAB := device/sony/msm8226-common/rootdir/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"

# TWRP flags
DEVICE_RESOLUTION := 720x1280
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_HAS_NO_RECOVERY_PARTITION := true
TW_FLASH_FROM_STORAGE := true
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
# TW_INCLUDE_CRYPTO := true
TW_INCLUDE_JB_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
TW_CRYPTO_FS_FLAGS := "0x00000406"
TW_CRYPTO_KEY_LOC := "footer"
TW_INCLUDE_FUSE_EXFAT := true
TW_BOARD_CUSTOM_GRAPHICS := ../../../device/sony/msm8226-common/recovery/twrpgraphics.c
TW_BRIGHTNESS_PATH := /sys/class/leds/lm3630-lcd-bl/brightness
TW_MAX_BRIGHTNESS := 255
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/sony/msm8226-common

# Use retire fence from MDP driver
TARGET_DISPLAY_USE_RETIRE_FENCE := true

# inherit from the proprietary version
-include vendor/sony/msm8226-common/BoardConfigVendor.mk
