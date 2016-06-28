#
# Copyright 2015 The Android Open-Source Project
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
#

TARGET_ARCH := x86
TARGET_ARCH_VARIANT := silvermont
TARGET_CPU_ABI := x86
TARGET_CPU_ABI2 := armeabi-v7a
TARGET_CPU_ABI_LIST := x86,armeabi-v7a,armeabi
TARGET_CPU_ABI_LIST_32_BIT := x86,armeabi-v7a,armeabi
TARGET_KERNEL_CROSS_COMPILE_PREFIX := x86_64-linux-android-
TARGET_BOARD_PLATFORM := baytrail
TARGET_BOOTLOADER_BOARD_NAME := baytrail
TARGET_USERIMAGES_USE_EXT4 := true

TARGET_DROIDBOOT_LIBS := libintel_droidboot

# Adb
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_TINY_ALSA_AUDIO := true

# Binder
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/YT2/bluetooth

# Bootloader
TARGET_OTA_ASSERT_DEVICE := YT2,yt2

# Camera
INTEL_USE_CAMERA_UVC := true
INTEL_VIDEO_XPROC_SHARING := true

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Dex-preoptimization: Speeds up initial boot (if we ever o a user build, which we don't)
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# EGL config
BOARD_EGL_CFG := device/lenovo/YT2/rootdir/system/etc/egl.cfg

# Houdini: enable ARM codegen for x86
BUILD_ARM_FOR_X86 := true

# IMG graphics
BOARD_GFX_REV := RGX6400
ENABLE_IMG_GRAPHICS := true
ENABLE_MRFL_GRAPHICS := true
INTEL_HWC_MOOREFIELD := true
HWUI_IMG_FBO_CACHE_OPTIM := true
TARGET_INTEL_HWCOMPOSER_FORCE_ONLY_ONE_RGB_LAYER := true

# IMG Graphics: System's VSYNC phase offsets in nanoseconds
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.opengles.version = 196608

MAX_EGL_CACHE_ENTRY_SIZE := 65536
MAX_EGL_CACHE_SIZE := 1048576

INTEL_VA := true
BUILD_WITH_FULL_STAGEFRIGHT := true
BOARD_USES_VIDEO := true

# Disable IMG RS GPU driver
# OVERRIDE_RS_DRIVER := libPVRRS.so

# enabled to carry out all drawing operations performed on a View's canvas with GPU for 2D rendering pipeline.
USE_OPENGL_RENDERER := true

# Init
TARGET_IGNORE_RO_BOOT_SERIALNO := true

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/lenovo/baytrail
TARGET_KERNEL_ARCH := x86_64
BOARD_KERNEL_IMAGE_NAME := bzImage
TARGET_KERNEL_CONFIG := cyanogenmod_YT2_8_defconfig

# Kernel cmdline
BOARD_KERNEL_CMDLINE := loglevel=4 console=logk0 earlyprintk=nologger androidboot.bootmedia=sdcard androidboot.hardware=byt_t_ffrd8 watchdog.watchdog_thresh=60 androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx androidboot.serialno=01234567890123456789 oops=panic panic=40 vmalloc=172M debug_locks=0 bootboost=1 vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor i915.mipi_panel_id=3 androidboot.selinux=permissive

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Logd
TARGET_USES_LOGD := false

# Media
BOARD_USES_WRS_OMXIL_CORE := true
BOARD_USES_MRST_OMX := true
USE_HW_VP8 := true

# Media: DRM Protected Video
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1
USE_INTEL_SECURE_AVC := true

# Settings for the Media SDK library and plug-ins:
# - USE_MEDIASDK: use Media SDK support or not
# - MFX_IPP: sets IPP library optimization to use
USE_MEDIASDK := true
MFX_IPP := p8

# Video Post Processing
TARGET_HAS_ISV := true
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.intel.isv.vpp = 1 \
    persist.intel.isv.frc = 1

COMMON_GLOBAL_CFLAGS += -DGFX_BUF_EXT

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_FLASH_BLOCK_SIZE := 2048
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12256784384

# PowerHAL
TARGET_POWERHAL_VARIANT := baytrail

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := device/lenovo/YT2/rootdir/fstab.byt_t_ffrd8

# Security
BUILD_WITH_SECURITY_FRAMEWORK := chaabi_token
BUILD_WITH_CHAABI_SUPPORT := true

# Wifi
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
WIFI_DRIVER_MODULE_NAME     := "bcm43241"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcm43241/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin_43241_b4"
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm43241.ko"

# inherit from the proprietary version
-include vendor/lenovo/YT2/BoardConfigVendor.mk
