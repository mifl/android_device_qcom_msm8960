$(call inherit-product, device/qcom/common/common.mk)

PRODUCT_NAME := msm8960
PRODUCT_DEVICE := msm8960

PRODUCT_PROPERTY_OVERRIDES += \
 ro.com.google.clientidbase=android-qualcomm

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/audio.conf:system/etc/bluetooth/audio.conf \
    system/bluetooth/data/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
    system/bluetooth/data/blacklist.conf:system/etc/bluetooth/blacklist.conf \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf \

PRODUCT_PACKAGES += \
    battery_monitor \
    battery_shutdown
