# config.mk
#
# Product-specific compile-time definitions.
#

ifeq ($(QC_PROP),true)
    BOARD_USES_QCOM_HARDWARE := true
    DYNAMIC_SHARED_LIBV8SO := true
    BOARD_USES_ADRENO_200 := true
    HAVE_ADRENO200_SOURCE := true
    HAVE_ADRENO200_SC_SOURCE := true
    HAVE_ADRENO200_FIRMWARE := true
    BOARD_USES_ALSA_AUDIO := true
    BOARD_USE_QCOM_TESTONLY := true
    TARGET_USES_C2D_COMPOSITION := true
    TARGET_USES_SF_BYPASS := true
    TARGET_USES_ION := true
    USE_OPENGL_RENDERER := true
    TARGET_AVOID_DRAW_TEXTURE_EXTENSION := true
    BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := default
    BOARD_USES_SRS_TRUEMEDIA := true
    BOARD_USES_QCNE := true
    TARGET_HAVE_BYPASS := true
    TARGET_MAX_BYPASS := 3
    TARGET_HAS_S3D_SUPPORT := true
    BOARD_USE_QCOM_LLVM_CLANG_RS := true
    TARGET_USES_POST_PROCESSING := true
    PROTEUS_DEVICE_API := true
    ENABLE_WEBGL := true
    BOARD_USES_QCOM_RESAMPLER := true

    ifneq ($(BUILD_TINY_ANDROID), true)
    BOARD_HAS_QCOM_WLAN := true
    BOARD_HAS_ATH_WLAN_AR6004 := true
    BOARD_HAVE_QCOM_FM := true
    BOARD_HAVE_BLUETOOTH := true
    HAVE_QC_TIME_SERVICES := true

    ifeq ($(findstring true,$(BOARD_HAS_ATH_WLAN_AR6004) $(BOARD_HAS_QCOM_WLAN)),true)
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_HOSTAPD_DRIVER := NL80211
    WPA_SUPPLICANT_VERSION := VER_2_0_DEV
    HOSTAPD_VERSION := VER_2_0_DEV
    WIFI_CFG80211_DRIVER_MODULE_PATH := "/system/lib/modules/cfg80211.ko"
    WIFI_CFG80211_DRIVER_MODULE_NAME := "cfg80211"
    WIFI_CFG80211_DRIVER_MODULE_ARG  := ""
    WIFI_DRIVER_FW_PATH_STA := "sta"
    WIFI_DRIVER_FW_PATH_AP  := "ap"
    WIFI_DRIVER_FW_PATH_P2P := "p2p"
    endif

    ifeq ($(BOARD_HAS_QCOM_WLAN), true)
    WIFI_DRIVER_DEF_CONF_FILE := "/persist/WCNSS_qcom_cfg.ini"
    WIFI_DRIVER_CONF_FILE := "/data/misc/wifi/WCNSS_qcom_cfg.ini"
    BOARD_WLAN_DEVICE := qcwcn
    endif

    endif   # !BUILD_TINY_ANDROID
else
    BOARD_USES_GENERIC_AUDIO := true
    USE_CAMERA_STUB := true

endif # QC_PROP

BOARD_USES_ADRENO_200 := true
HAVE_ADRENO200_SOURCE := true
HAVE_ADRENO200_SC_SOURCE := true
HAVE_ADRENO200_FIRMWARE := true
TARGET_HAVE_TSLIB := false
TARGET_USE_HDMI_AS_PRIMARY := false

ifeq ($(TARGET_USE_HDMI_AS_PRIMARY),true)
    TARGET_HAVE_HDMI_OUT := false
else
    TARGET_HAVE_HDMI_OUT := true
endif # TARGET_USE_HDMI_AS_PRIMARY
TARGET_USES_OVERLAY := true
TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RPC := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := msm8960
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

BOARD_KERNEL_BASE    := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_USERIMAGES_USE_EXT4 := true

BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 vmalloc=400M maxcpus=2
BOARD_EGL_CFG := device/qcom/$(TARGET_PRODUCT)/egl.cfg

BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1073741824
BOARD_PERSISTIMAGE_PARTITION_SIZE := 5242880
BOARD_CACHEIMAGE_PARTITION_SIZE := 33554432
BOARD_TOMBSTONESIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# Use signed boot and recovery image
TARGET_BOOTIMG_SIGNED := true

TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64

HAVE_CYTTSP_FW_UPGRADE := true
HAVE_MXT_FW_UPGRADE := true
HAVE_MXT_CFG := true

# Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES ?= false

# Add building support AR8151 ALX ethernet driver
BOARD_HAS_ATH_ETH_ALX := true

TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_qcom


