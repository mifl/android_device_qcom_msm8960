#
# Copyright (C) 2011 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL msm8960 devices, and
# are also specific to msm8960 devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/qcom/msm8960/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES := \
	lights.msm8960

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	device/qcom/msm8960/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	device/qcom/msm8960/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3 \
	device/qcom/msm8960/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/thermald-msm8960.conf:system/etc/thermald.conf

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/init.msm8960.rc:root/init.msm8960.rc \
	device/qcom/msm8960/init.msm8960.usb.rc:root/init.msm8960.usb.rc \
	device/qcom/msm8960/fstab.msm8960:root/fstab.msm8960 \
	device/qcom/msm8960/ueventd.msm8960.rc:root/ueventd.msm8960.rc \
	device/qcom/msm8960/media_profiles.xml:system/etc/media_profiles.xml \
	device/qcom/msm8960/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/kickstart_checker.sh:system/etc/kickstart_checker.sh

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
	device/qcom/msm8960/apq8064-tabla-snd-card_Button_Jack.kl:system/usr/keylayout/apq8064-tabla-snd-card_Button_Jack.kl \
	device/qcom/msm8960/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
	device/qcom/msm8960/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
	device/qcom/msm8960/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	device/qcom/msm8960/apq8064-tabla-snd-card_Button_Jack.kcm:system/usr/keychars/apq8064-tabla-snd-card_Button_Jack.kcm \
	device/qcom/msm8960/hs_detect.kcm:system/usr/keychars/hs_detect.kcm \
	device/qcom/msm8960/keypad_8064.kcm:system/usr/keychars/keypad_8064.kcm \
	device/qcom/msm8960/pmic8xxx_pwrkey.kcm:system/usr/keychars/pmic8xxx_pwrkey.kcm

# Prebuilt input device calibration files
PRODUCT_COPY_FILES += \
	device/qcom/msm8960/touch_dev.idc:system/usr/idc/touch_dev.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	device/qcom/msm8960/gps.conf:system/etc/gps.conf

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
	persist.audio.lowlatency.rec=false \
	af.resampler.quality=4


# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += debug.mdpcomp.maxlayer=3

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960

PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio_policy.msm8960 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler

PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_COPY_FILES += \
	device/qcom/msm8960/init.msm8960.bt.sh:system/etc/init.msm8960.bt.sh

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

PRODUCT_PACKAGES += \
	camera.msm8960 \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
	mm-vdec-omx-test \
	mm-venc-omx-test720p \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init \
	charger_touch

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=0

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.prerotation.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
	system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
	system/extras/bugmailer/send_bug:system/bin/send_bug

$(call inherit-product, frameworks/native/build/phone-hdpi-dalvik-heap.mk)

PRODUCT_LOCALES := en_US es_US de_DE zh_CN

PRODUCT_PACKAGES += \
	ks \
	qcks \
	efsks
