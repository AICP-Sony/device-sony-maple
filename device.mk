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
    $(DEVICE_PATH)/rootdir/system/etc/acdbdata/Speaker_cal.acdb:system/etc/acdbdata/Speaker_cal.acdb

# Device Specific Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml

# Lowi
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_client.so:vendor/lib64/liblowi_client.so \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_wifihal.so:vendor/lib64/liblowi_wifihal.so \
    $(DEVICE_PATH)/rootdir/vendor/lib64/liblowi_wifihal_nl.so:vendor/lib64/liblowi_wifihal_nl.so

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

# Hardware Info
PRODUCT_PROPERTY_OVERRIDES += \
    ro.device.chipset=Qualcomm MSM8998 Snapdragon 835 \
    ro.device.cpu=Octa-core (4x2.45 GHz Kryo & 4x1.9 GHz Kryo) \
    ro.device.gpu=Adreno 540 \
    ro.device.rear_cam=19 MP, f/2.0, 25mm \
    ro.device.front_cam=13 MP, f/2.0, 22mm \
    ro.device.screen_res=3840 x 2160 pixels (~807 ppi pixel density)

#Set cutoff voltage to 3200mV
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cutoff_voltage_mv=3200

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/yoshino/platform.mk)

# copy NFC firmware
$(call inherit-product-if-exists, vendor/nxp/nxp-vendor.mk)

# include board vendor blobs
$(call inherit-product, vendor/sony/yoshino-common/yoshino-partial.mk)

# include optional vendor configuration
$(call inherit-product-if-exists, vendor/qcom/proprietary/common/build/qcom-packages.mk)
