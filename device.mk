#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
PRODUCT_SHIPPING_API_LEVEL := 30

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    engineer_vendor_shell.sh \

PRODUCT_PACKAGES += \
    fstab.s9863a1h10 \
    init.RMX3231.rc \
    init.RMX3231.usb.rc \
    init.RMX3235.rc \
    init.RMX3235.usb.rc \
    init.cali.rc \
    init.factorytest.rc \
    init.ram.rc \
    init.rio.rc \
    init.rio.usb.rc \
    init.rio_go.rc \
    init.rio_go.usb.rc \
    init.s9863a1c10.rc \
    init.s9863a1c10.usb.rc \
    init.s9863a1h10.rc \
    init.s9863a1h10.usb.rc \
    init.s9863a1h10_go.rc \
    init.s9863a1h10_go.usb.rc \
    init.s9863a1h10_go_32b.rc \
    init.s9863a1h10_go_32b.usb.rc \
    init.s9863a2h10.rc \
    init.s9863a2h10.usb.rc \
    init.s9863a3c10.rc \
    init.s9863a3c10.usb.rc \
    init.s9863a3h10.rc \
    init.s9863a3h10.usb.rc \
    init.storage.rc \
    init.recovery.RMX3231.rc \
    init.recovery.RMX3235.rc \
    init.recovery.common.rc \
    init.recovery.rio.rc \
    init.recovery.rio_go.rc \
    init.recovery.s9863a1c10.rc \
    init.recovery.s9863a1h10.rc \
    init.recovery.s9863a1h10_go.rc \
    init.recovery.s9863a1h10_go_32b.rc \
    init.recovery.s9863a2h10.rc \
    init.recovery.s9863a3c10.rc \
    init.recovery.s9863a3h10.rc \
    ueventd.RMX3231.rc \
    ueventd.RMX3235.rc \
    ueventd.rio.rc \
    ueventd.rio_go.rc \
    ueventd.s9863a1c10.rc \
    ueventd.s9863a1h10.rc \
    ueventd.s9863a1h10_go.rc \
    ueventd.s9863a1h10_go_32b.rc \
    ueventd.s9863a2h10.rc \
    ueventd.s9863a3c10.rc \
    ueventd.s9863a3h10.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.s9863a1h10:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.s9863a1h10

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/realme/RMX3231/RMX3231-vendor.mk)