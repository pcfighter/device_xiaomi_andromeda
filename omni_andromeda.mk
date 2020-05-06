#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

VENDOR_EXCEPTION_PATHS += omni \
    xiaomi

VENDOR_EXCEPTION_MODULES += FM2 \
    qcom.fmradio \
    libqcomfm_jni \
    libqcomfm_jni_32

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += device/xiaomi/andromeda/overlay
# CarrierConfig
DEVICE_PACKAGE_OVERLAYS += vendor/omni/overlay/CarrierConfig

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/xiaomi/andromeda/device.mk)

# Inherit aosp mainline system configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline_system_arm64.mk)

# Inherit from andromeda device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := omni_andromeda
PRODUCT_DEVICE := andromeda
PRODUCT_MODEL := Mi MIX 3 5G
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME="andromeda" \
    TARGET_DEVICE="andromeda"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
