# Copyright 2014 The Android Open Source Project
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

# Device path
DEVICE_PATH := device/sony/maple

DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay

PRODUCT_COPY_FILES := \
    $(DEVICE_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/sensor_def_qcomdev.conf:system/etc/sensors/sensor_def_qcomdev.conf \
    $(DEVICE_PATH)/rootdir/system/etc/thermanager.xml:system/etc/thermanager.xml \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(DEVICE_PATH)/rootdir/system/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(DEVICE_PATH)/rootdir/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

# Camera Configuration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/camera/camera_config.xml:system/etc/camera/camera_config.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx258_chromatix.xml:system/etc/camera/imx258_chromatix.xml \
    $(DEVICE_PATH)/rootdir/system/etc/camera/imx400_chromatix.xml:system/etc/camera/imx400_chromatix.xml

# Audio calibration
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Bluetooth_cal.acdb:system/etc/acdbdata/Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/General_cal.acdb:system/etc/acdbdata/General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Global_cal.acdb:system/etc/acdbdata/Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Handset_cal.acdb:system/etc/acdbdata/Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Hdmi_cal.acdb:system/etc/acdbdata/Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Headset_cal.acdb:system/etc/acdbdata/Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Bluetooth_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Bluetooth_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_General_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_General_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Global_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Global_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Handset_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Handset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Hdmi_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Hdmi_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Headset_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Headset_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/Sony_yoshino_Speaker_cal.acdb:system/etc/acdbdata/Sony/Sony_yoshino_Speaker_cal.acdb \
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Sony/workspaceFile_Sony_yoshino.qwsp:system/etc/acdbdata/Sony/workspaceFile_Sony_yoshino.qwsp

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Lowi
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_client.so:system/vendor/lib64/liblowi_client.so \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_wifihal.so:system/vendor/lib64/liblowi_wifihal.so \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_wifihal_nl.so:system/vendor/lib64/liblowi_wifihal_nl.so \
    $(DEVICE_PATH)/rootdir/vendor/lib64/libquipc_os_api.so:system/vendor/lib64/libquipc_os_api.so

# tof
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/lib/sensors.hal.tof.so:system/lib/sensors.hal.tof.so \
    $(DEVICE_PATH)/rootdir/system/etc/sensors/hals.conf:system/etc/sensors/hals.conf

# soundfx
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/system/lib/soundfx/libsonypostprocbundle.so:system/lib/soundfx/libsonypostprocbundle.so \
    $(DEVICE_PATH)/rootdir/system/lib/soundfx/libsonysweffect.so:system/lib/soundfx/libsonysweffect.so

# Device Init
PRODUCT_PACKAGES += \
    init.recovery.maple \
    init.maple \
    ueventd.maple

# Lights
PRODUCT_PACKAGES += \
    lights.maple

# Simple PowerHAL
PRODUCT_PACKAGES += \
    power.maple

# Fingerprint HAL
PRODUCT_PACKAGES += \
    fingerprintd \
    fingerprint.maple

# NFC config
PRODUCT_PACKAGES += \
    nfc_nci.pn54x.default

# Telephony Packages (AOSP)
PRODUCT_PACKAGES += \
    InCallUI \
    Stk

# Snap camera
PRODUCT_PACKAGES += \
    Snap

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=420 \
    ro.usb.pid_suffix=1F1

# 4K for Youtube
PRODUCT_PROPERTY_OVERRIDES += \
    sys.display-size=3840x2160

# HDR
PRODUCT_PROPERTY_OVERRIDES += \
    sdm.disable_hdr_lut_gen=1

#Set cutoff voltage to 3200mV
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cutoff_voltage_mv=3200

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yoshino/platform.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)

# include board vendor blobs
$(call inherit-product-if-exists, vendor/sony/yoshino-common/yoshino-partial.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
