#
# Copyright (C) 2012 The CyanogenMod Project
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

COMMON_PATH := device/samsung/novel-common

# Screen
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Flat device tree for boot image
PRODUCT_HOST_PACKAGES += \
    dtbhtoolExynos


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Init files
PRODUCT_PACKAGES += \
    $(COMMON_PATH)/rootdir/init.universal3475.rc:root/init.universal3475.rc \
    $(COMMON_PATH)/rootdir/init.universal3475.usb.rc:root/init.universal3475.usb.rc \
    $(COMMON_PATH)/rootdir/ueventd.universal3475.rc:root/ueventd.universal3475.rc \
    $(COMMON_PATH)/rootdir/ueventd.universal3475.rc:recovery/ueventd.universal3475.rc

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/audio/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf


# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/universal3475-keypad.kl:system/usr/keylayout/universal3475-keypad.kl

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(COMMON_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Samsung
PRODUCT_PACKAGES += \
    SamsungServiceMode

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.arch=exynos3475 \
    debug.hwui.render_dirty_regions=false \
    ro.opengles.version=196608

# Include non-opensource parts
$(call inherit-product, vendor/samsung/novel-common/novel-vendor.mk)
