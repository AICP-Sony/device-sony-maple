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

# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080
-include vendor/aicp/configs/bootanimation.mk

TARGET_KERNEL_SOURCE := kernel/sony/msm
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_CONFIG := aosp_yoshino_maple_defconfig

# Encryption / Keymaster
TARGET_HW_DISK_ENCRYPTION := true
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

AUDIO_FINE_TUNED_OPTIMIZATIONS := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/sony/maple/aosp_g8142.mk)
$(call inherit-product, device/sony/yoshino/platform.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit AICP GSM telephony parts
$(call inherit-product, vendor/aicp/configs/gsm.mk)
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnGSMDevice=1

# Override Product Name for AICP
PRODUCT_NAME := aicp_maple
PRODUCT_DEVICE := maple
PRODUCT_MODEL := Xperia XZ Premium
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony
TARGET_VENDOR := sony

# Assert
TARGET_OTA_ASSERT_DEVICE := G8142,maple

# AICP Device Maintainers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DEVICE_MAINTAINERS="AndroPlus"
