#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from a05s device
$(call inherit-product, device/samsung/a05s/device.mk)

# This tree targets both Galaxy A05s regional variants (SM-A057F and SM-A057G/DSN).
# The recovery ramdisk and prebuilt kernel are shared across A057 variants;
# only the model string is overridden here.
PRODUCT_DEVICE := a05s
PRODUCT_NAME := twrp_a05s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A057G/DSN
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss

# Fingerprint kept from the A057F source firmware (a05snsdxx): the A057G
# recovery image does not depend on it, and no A057G recovery fingerprint
# has been recorded for this tree.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="a05snsdxx-user 13 TP1A.220624.014 A057FXXS2BXC3 release-keys"

BUILD_FINGERPRINT := samsung/a05snsdxx/a05s:13/TP1A.220624.014/A057FXXS2BXC3:user/release-keys
