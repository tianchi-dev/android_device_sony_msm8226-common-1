# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

TARGET_PROVIDES_ADRENO_DRIVER := true
# qcom common
$(call inherit-product, device/sony/qcom-common/qcom-common.mk)

COMMON_PATH := device/sony/msm8226-common

DEVICE_PACKAGE_OVERLAYS += $(COMMON_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    $(COMMON_PATH)/rootdir/init.qcom.sh:root/init.qcom.sh \
    $(COMMON_PATH)/rootdir/init.qcom.rc:root/init.qcom.rc \
    $(COMMON_PATH)/rootdir/init.sony.rc:root/init.sony.rc \
    $(COMMON_PATH)/rootdir/init.target.rc:root/init.target.rc \
    $(COMMON_PATH)/rootdir/init.sony-device.rc:root/init.sony-device.rc \
    $(COMMON_PATH)/rootdir/init.sony-platform.rc:root/init.sony-platform.rc \
    $(COMMON_PATH)/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    $(COMMON_PATH)/rootdir/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
    $(COMMON_PATH)/rootdir/fstab.qcom:root/fstab.qcom \
    $(COMMON_PATH)/rootdir/fstab.qcom:recovery/root/fstab.qcom \
    $(COMMON_PATH)/rootdir/init.recovery.qcom.rc:root/init.recovery.qcom.rc \
    $(COMMON_PATH)/rootdir/system/etc/init.sony.bt.sh:system/etc/init.sony.bt.sh \
    $(COMMON_PATH)/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Additional sbin stuff
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/sbin/wait4tad_static:root/sbin/wait4tad_static \
    $(LOCAL_PATH)/rootdir/sbin/tad_static:root/sbin/tad_static

# Keys
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/msm8226-tapan-snd-card_Button_Jack.kl:system/usr/keylayout/msm8226-tapan-snd-card_Button_Jack.kl \
    $(COMMON_PATH)/rootdir/system/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# FM Radio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/audio_policy.conf:system/etc/audio_policy.conf

# Media
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/media_profiles.xml:system/etc/media_profiles.xml

# GPS
PRODUCT_COPY_FILES += \
   $(COMMON_PATH)/rootdir/system/etc/gps.conf:system/etc/gps.conf

# WPA supplicant config
PRODUCT_COPY_FILES += \
   $(COMMON_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
   $(COMMON_PATH)/rootdir/system/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Prima wifi config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(COMMON_PATH)/rootdir/system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Post recovery script
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/postrecoveryboot.sh:recovery/root/sbin/postrecoveryboot.sh

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/D5x22.sh:D5x22.sh

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sap.conf:system/etc/sap.conf

# SEC Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/sec_config:system/etc/sec_config

# Thermal monitor configuration
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/rootdir/system/etc/thermal-engine-8226.conf:system/etc/thermal-engine-8226.conf

# NFC Support
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# Recovery
PRODUCT_PACKAGES += \
    extract_elf_ramdisk

# NFCEE access control
    NFCEE_ACCESS_PATH := $(COMMON_PATH)/rootdir/system/etc/nfcee_access.xml
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml

# QCOM Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8226 \
    gralloc.msm8226 \
    copybit.msm8226 \
    memtrack.msm8226

# Audio
PRODUCT_PACKAGES += \
    audio_policy.msm8226 \
    libaudio-resampler \
    libaudioparameter \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing \
    tinycap \
    tinymix \
    tinypcminfo \
    tinyplay

# Camera
PRODUCT_PACKAGES += \
    camera.sony \
    camera.msm8226 \
    libmmcamera_interface \
    libmmcamera_interface2

# Sensors
PRODUCT_PACKAGES += \
    sensors.msm8226

# Wifi services
#PRODUCT_PACKAGES += \
#    libwfcu \
#    mac-update \
#    wcnss_service

# Misc
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Radio and Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libargs=-d /dev/smd0 \
    persist.rild.nitz_plmn= \
    persist.rild.nitz_long_ons_0= \
    persist.rild.nitz_long_ons_1= \
    persist.rild.nitz_long_ons_2= \
    persist.rild.nitz_long_ons_3= \
    persist.rild.nitz_short_ons_0= \
    persist.rild.nitz_short_ons_1= \
    persist.rild.nitz_short_ons_2= \
    persist.rild.nitz_short_ons_3= \
    ril.subscription.types=NV,RUIM \
    DEVICE_PROVISIONED=1 \
    persist.radio.msgtunnel.start=false

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib/libril-qc-qmi-1.so

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.audio.fluencetype=none \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicerec=false \
    persist.audio.fluence.speaker=true \
    af.resampler.quality=4

# Audio offload
PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=false \
    av.offload.enable=true

# QCOM Location
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.izat.premium_enabled=1 \
    ro.qc.sdk.izat.service_mask=0x0 \
    persist.gps.qc_nlp_in_use=1 \
    ro.gps.agps_provider=1 \
    ro.service.swiqi2.supported=true \
    persist.service.swiqi2.enable=1

# aDSP sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.sensors.qmd=true \
    debug.qualcomm.sns.hal=w \
    ro.qc.sdk.sensors.gestures=false \
    ro.qc.sensors.max_accel_rate=false \
    ro.qc.sensors.max_gyro_rate=false \
    ro.qc.sensors.max_mag_rate=false \
    ro.qualcomm.sensors.pedometer=true \
    ro.qualcomm.sensors.pam=false \
    ro.qualcomm.sensors.scrn_ortn=false \
    ro.qc.sensors.step_detector=true \
    ro.qc.sensors.step_counter=true \
    ro.qualcomm.sensors.georv=true

#MDP
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true \
    debug.mdpcomp.logs=0

#WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.multiple=0

# OpenGL ES 3.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=19660

# Include non-opensource parts
$(call inherit-product, vendor/sony/msm8226-common/msm8226-common-vendor.mk)
