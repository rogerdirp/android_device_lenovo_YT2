#
# Copyright 2013 The Android Open-Source Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## We are a tablet, not a phone
PRODUCT_CHARACTERISTICS := tablet

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Boot animation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Audio
PRODUCT_PACKAGES += \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/asound.conf:system/etc/asound.conf \
    $(LOCAL_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/rootdir/system/vendor/etc/route_criteria.conf:system/vendor/etc/route_criteria.conf

# Bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/camera3_profiles.xml:system/etc/camera3_profiles.xml \
    $(LOCAL_PATH)/rootdir/system/etc/cms_device_config.xml:system/etc/cms_device_config.xml \
    $(LOCAL_PATH)/rootdir/system/etc/cms_throttle_config.xml:system/etc/cms_throttle_config.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

ADDITIONAL_DEFAULT_PROPERTIES += ro.sys.powerctl.no.shutdown=1

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Display
PRODUCT_PACKAGES += \
    pvr_drv_video

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/rootdir/system/etc/gps.xml:system/etc/gps.xml

ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# Key layout files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/usr/keylayout/baytrailaudio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/baytrailaudio_Intel_MID_Audio_Jack.kl \
    $(LOCAL_PATH)/rootdir/system/usr/keychars/mrst_keypad.kl:system/usr/keychars/mrst_keypad.kl

# Lights
PRODUCT_PACKAGES += \
    lights.baytrail

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/rootdir/system/etc/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    $(LOCAL_PATH)/rootdir/system/etc/video_isv_profile.xml:system/etc/video_isv_profile.xml \
    $(LOCAL_PATH)/rootdir/system/etc/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Media: SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# Media: libva
#PRODUCT_PACKAGES += \
#    libva \
#    libva-android \
#    libva-tpi \
#    vainfo

# Media: libstagefrighthw
#PRODUCT_PACKAGES += libstagefrighthw

# Media: libmix
#PRODUCT_PACKAGES += \
#    libmixvbp_mpeg4 \
#    libmixvbp_h264 \
#    libmixvbp_h264secure \
#    libmixvbp_vc1 \
#    libmixvbp_vp8 \
#    libva_videodecoder \
#    libva_videoencoder

#PRODUCT_PACKAGES += \
#    libwrs_omxil_common \
#    libwrs_omxil_core_pvwrapped \
#    libOMXVideoDecoderAVC \
#    libOMXVideoDecoderH263 \
#    libOMXVideoDecoderMPEG4 \
#    libOMXVideoDecoderWMV \
#    libOMXVideoDecoderVP8 \
#    libOMXVideoDecoderVP9HWR \
#    libOMXVideoDecoderVP9Hybrid \
#    libOMXVideoEncoderAVC \
#    libOMXVideoEncoderH263 \
#    libOMXVideoEncoderMPEG4 \
#    libOMXVideoEncoderVP8

# Media: libISV
#PRODUCT_PACKAGES += libisv_omx_core

# MTP
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

# PowerHAL
PRODUCT_PACKAGES += \
    power.baytrail

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.byt_t_ffrd8 \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.byt_t_ffrd8.rc \
    init.common.rc \
    init.debug.rc \
    init.diag.rc \
    init.firmware.rc \
    init.gps.rc \
    init.modem.rc \
    init.net.eth0.sh \
    init.platform.gengfx.rc \
    init.platform.usb.rc \
    init.recovery.byt_t_ffrd8.rc \
    init.watchdog.rc \
    init.watchdog.sh \
    init.wifi.rc \
    init.wifi.vendor.rc \
    intel_prop \
    intel_prop.cfg \
    rfkill_bt.sh \
    thermald \
    uefivar \
    uefivar_nolog \
    ueventd.byt_t_ffrd8.rc

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sensor_hal_config_default.xml:system/etc/sensor_hal_config_default.xml

# Thermal itux
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

# IMG graphics
#PRODUCT_PACKAGES += hwcomposer.baytrail

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    libdrm_intel \
    libpciaccess

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm43341/device-bcm.mk)
