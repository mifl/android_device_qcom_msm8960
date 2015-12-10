DEVICE_PACKAGE_OVERLAYS := device/qcom/msm8960/overlay

TARGET_USES_QCOM_BSP := true

ifeq ($(TARGET_USES_QCOM_BSP),true)
    TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
    TARGET_ENABLE_QC_TVINPUT_HAL_EXTENSIONS := true
PRODUCT_COPY_FILES += \
                      device/qcom/msm8960/media/media_profiles_8960.xml:system/etc/media_profiles.xml
PRODUCT_COPY_FILES += \
                      device/qcom/msm8960/media/media_codecs_8960.xml:system/etc/media_codecs.xml \
                      device/qcom/msm8960/media/media_codecs_performance_8960.xml:system/etc/media_codecs_performance.xml \
                      device/qcom/msm8960/media/media_codecs_google_performance.xml:system/etc/media_codecs_google_performance.xml
else
    TARGET_ENABLE_QC_AV_ENHANCEMENTS := false
    TARGET_ENABLE_QC_TVINPUT_HAL_EXTENSIONS := false
endif #TARGET_USES_QCOM_BSP

$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := msm8960
PRODUCT_DEVICE := msm8960

ifdef QCPATH
PRODUCT_BOOT_JARS += iviaidl
PRODUCT_BOOT_JARS += vehiclefwk
PRODUCT_BOOT_JARS += ivifwk
PRODUCT_BOOT_JARS += distraction-service
endif

PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += WfdCommon

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \

# Bluetooth configuration files
#PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \

# Audio configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8960/audio_policy.conf:system/etc/audio_policy.conf \

# audio UCM files
PRODUCT_COPY_FILES += device/qcom/msm8960/mixer_paths.xml:system/etc/mixer_paths.xml

# gps/location secuity configuration file
PRODUCT_COPY_FILES += \
    device/qcom/msm8960/sec_config:system/etc/sec_config

PRODUCT_PACKAGES += \
    battery_monitor \
    battery_shutdown

#NativeHMI
PRODUCT_PACKAGES += boot \
    disclaimer.bmp \
    new_welcome_screen.bmp \
    new_welcome_screen_loading.bmp

# Wallpapers
PRODUCT_PACKAGES += Galaxy4
PRODUCT_PACKAGES += HoloSpiralWallpaper
PRODUCT_PACKAGES += MagicSmokeWallpapers
PRODUCT_PACKAGES += NoiseField
PRODUCT_PACKAGES += PhaseBeam

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

#wlan driver, wifi_concurrency_cfg
PRODUCT_COPY_FILES += \
    device/qcom/msm8960/WCNSS_cfg.dat:system/etc/firmware/wlan/qca_cld/WCNSS_cfg.dat \
    device/qcom/msm8960/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/qcom/msm8960/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
    device/qcom/msm8960/wifi_concurrency_cfg.txt:system/etc/wifi/wifi_concurrency_cfg.txt

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += wcnss_service

PRODUCT_COPY_FILES += \
   device/qcom/msm8960/package_scan_list.conf:system/etc/package_scan_list.conf

#ANT+ stack
PRODUCT_PACKAGES += \
AntHalService \
libantradio \
antradio_app

# TV Input Framework (TIF)
PRODUCT_PACKAGES += \
    TvProvider \
    tv_input.default

PRODUCT_AAPT_CONFIG += xlarge large
