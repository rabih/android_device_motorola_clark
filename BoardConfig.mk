#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

-include vendor/motorola/clark/BoardConfigVendor.mk

DEVICE_PATH := device/motorola/clark

BOARD_VENDOR := motorola-qcom

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8992
TARGET_BOARD_PLATFORM_GPU := qcom-adreno418

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8992
TARGET_NO_BOOTLOADER := true

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_ARCH_VARIANT := armv7-a-neon

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 earlyprintk=msm_hsl_uart,0xf991e000 utags.blkdev=/dev/block/mmcblk0p10 utags.backup=/dev/block/mmcblk0p16 enforcing=0 androidboot.selinux=permissive
BOARD_KERNEL_BASE         := 0x00000000
BOARD_KERNEL_PAGESIZE     := 4096
BOARD_KERNEL_SEPARATED_DT := true
BOARD_KERNEL_OFFSET       := 0x8000
BOARD_RAMDISK_OFFSET      := 0x1000000
BOARD_TAGS_OFFSET         := 0x100
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_SOURCE := kernel/motorola/msm8992 
TARGET_KERNEL_CONFIG := clark_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Audio
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_HAVE_NEW_GRALLOC := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
USE_OPENGL_RENDERER := true

# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_clark.c

# Lights
# Placeholder

# Motorola
TARGET_USES_MOTOROLA_LOG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 41943040
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 42024960
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296 # 4194304 * 1024 p46
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10322051072 # 16 gb model
BOARD_PERSISTIMAGE_PARTITION_SIZE := 8388608 # 8192 * 1024 mmcblk0p29

# Power
TARGET_POWERHAL_VARIANT := qcom

# QCOM hardware
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    akmd09912.te \
    atfwd.te \
    atvc.te \
    batt_health.te \
    bluetooth_loader.te \
    device.te \
    file.te \
    file_contexts \
    healthd.te \
    init.te \
    init_shell.te \
    mm-qcamerad.te \
    property.te \
    property_contexts \
    qseecomd.te \
    rild.te \
    rmt_storage.te \
    stml0xx.te \
    surfaceflinger.te \
    system_server.te \
    tee.te \
    ueventd.te \
    vold.te \
    wcnss_service.te

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Crap to remove
TARGET_USES_OVERLAY := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
# BOARD_EGL_CFG := device/motorola/clark/egl.cfg
# MAX_EGL_CACHE_KEY_SIZE := 12*1024
# MAX_EGL_CACHE_SIZE := 2048*1024
# HAVE_ADRENO_SOURCE:= false
TARGET_CPU_CORTEX_A53 := true
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true
# BOARD_NFC_CHIPSET := pn547
EXTENDED_FONT_FOOTPRINT := true
# BOARD_USE_LEGACY_UI := true
# Added to indicate that protobuf-c is supported in this build
# PROTOBUF_SUPPORTED := true
TARGET_PER_MGR_ENABLED := true
# BOARD_SUPPORTS_SOUND_TRIGGER := false
# AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
# AUDIO_FEATURE_ENABLED_COMPRESS_CAPTURE := true
# AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
# AUDIO_FEATURE_ENABLED_DS2_DOLBY_DAP := true
# AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
# AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
# AUDIO_FEATURE_ENABLED_FLUENCE := true
# AUDIO_FEATURE_ENABLED_FM := true
# AUDIO_FEATURE_ENABLED_HFP := true
# AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
# AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
# AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
# AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
# AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
# AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
# AUDIO_FEATURE_ENABLED_PCM_OFFLOAD := true
# AUDIO_FEATURE_ENABLED_PCM_OFFLOAD_24 := true
# AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
BOARD_DT_SIZE             := 4280320

