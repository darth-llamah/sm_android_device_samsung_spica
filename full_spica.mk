# Inherit AOSP device configuration for passion.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/spica/prelink-linux-arm-spica.map

DEVICE_PACKAGE_OVERLAYS += device/samsung/spica/overlay

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160

# Repeat ring tone on incoming calls
PRODUCT_PROPERTY_OVERRIDES += \
ro.telephony.call_ring.multiple=false

#
# GPS config & application from sucka
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/gps/gps.conf:system/etc/gps.conf \
    device/samsung/spica/prebuilt/spica/gps/LBSModeApp.apk:system/app/LBSModeApp.apk

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml 

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/spica/media_profiles.xml:system/etc/media_profiles.xml

#
# Wifi
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/wifi/libwlmlogger.so:system/lib/libwlmlogger.so \
    device/samsung/spica/prebuilt/spica/wifi/libwlservice.so:system/lib/libwlservice.so \
    device/samsung/spica/prebuilt/spica/wifi/nvram.txt:system/etc/nvram.txt \
    device/samsung/spica/prebuilt/spica/wifi/rtecdc.bin:system/etc/rtecdc.bin \
    device/samsung/spica/prebuilt/spica/wifi/rtecdc_apsta.bin:system/etc/rtecdc_apsta.bin \
    device/samsung/spica/prebuilt/spica/wifi/nvram_mfg.txt:system/etc/nvram_mfg.txt \
    device/samsung/spica/prebuilt/spica/wifi/rtecdc_mfg.bin:system/etc/rtecdc_mfg.bin \
    device/samsung/spica/prebuilt/spica/wifi/bcm_supp.conf:system/etc/bcm_supp.conf \
    device/samsung/spica/prebuilt/spica/wifi/wifi.conf:system/etc/wifi.conf \
    device/samsung/spica/prebuilt/spica/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/spica/prebuilt/spica/wifi/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/spica/prebuilt/spica/wifi/wlservice:system/bin/wlservice

#
# Display (2D)
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/gralloc-libs/libs3c2drender.so:system/lib/libs3c2drender.so \
    device/samsung/spica/prebuilt/spica/gralloc-libs/libsavscmn.so:system/lib/libsavscmn.so \
    device/samsung/spica/prebuilt/spica/gralloc-libs/hw/gralloc.GT-I5700.so:system/lib/hw/gralloc.GT-I5700.so

#
# Display (3D)
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/fimg-libs/egl.cfg:system/lib/egl/egl.cfg

#
# 3D GFX
#
ifdef SPICA_WITH_3D
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_download.so:system/lib/libopencore_download.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_downloadreg.so:system/lib/libopencore_downloadreg.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_mp4local.so:system/lib/libopencore_mp4local.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_mp4localreg.so:system/lib/libopencore_mp4localreg.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_player.so:system/lib/libopencore_player.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_rtsp.so:system/lib/libopencore_rtsp.so \
    device/samsung/spica/prebuilt/spica/3dpack/libopencore_rtspreg.so:system/lib/libopencore_rtspreg.so \
    device/samsung/spica/prebuilt/spica/3dpack/libskia.so:system/lib/libskia.so \
    device/samsung/spica/prebuilt/spica/3dpack/libskiagl.so:system/lib/libskiagl.so \
    device/samsung/spica/prebuilt/spica/3dpack/libstagefright_color_conversion.so:system/lib/libstagefright_color_conversion.so \
    device/samsung/spica/prebuilt/spica/3dpack/libsurfaceflinger.so:system/lib/libsurfaceflinger.so \
    device/samsung/spica/prebuilt/spica/3dpack/libsurfaceflinger_client.so:system/lib/libsurfaceflinger_client.so \
    device/samsung/spica/prebuilt/spica/3dpack/egl/libChunkAlloc.so:system/lib/egl/libChunkAlloc.so \
    device/samsung/spica/prebuilt/spica/3dpack/egl/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/spica/prebuilt/spica/3dpack/egl/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/spica/prebuilt/spica/3dpack/egl/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so
else
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/fimg-libs/libChunkAlloc.so:system/lib/egl/libChunkAlloc.so \
    device/samsung/spica/prebuilt/spica/fimg-libs/libEGL_fimg.so:system/lib/egl/libEGL_fimg.so \
    device/samsung/spica/prebuilt/spica/fimg-libs/libGLESv1_CM_fimg.so:system/lib/egl/libGLESv1_CM_fimg.so \
    device/samsung/spica/prebuilt/spica/fimg-libs/libGLESv2_fimg.so:system/lib/egl/libGLESv2_fimg.so
endif

#
# Keys
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/keys/s3c-keypad-rev0020.kl:system/usr/keylayout/s3c-keypad-rev0020.kl \
    device/samsung/spica/prebuilt/spica/keys/sec_headset.kl:system/usr/keylayout/sec_headset.kl \
    device/samsung/spica/prebuilt/spica/keys/s3c-keypad-rev0020.kcm.bin:system/usr/keychars/s3c-keypad-rev0020.kcm.bin

#
# Only one left: copybit
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/hw/copybit.GT-I5700.so:system/lib/hw/copybit.GT-I5700.so

#
# akmd
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/akmd/akmd:system/bin/akmd

#
# Vold
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/vold/vold.fstab:system/etc/vold.fstab

#
# RIL
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/ril/drexe:system/bin/drexe \
    device/samsung/spica/prebuilt/spica/ril/efsd:system/bin/efsd \
    device/samsung/spica/prebuilt/spica/ril/rilclient-test:system/bin/rilclient-test \
    device/samsung/spica/prebuilt/spica/ril/libsec-ril.so:system/lib/libsec-ril.so

#
# GSM APN list
#
PRODUCT_COPY_FILES += \
    vendor/spica/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

#
# Audio
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/audio/asound.conf:system/etc/asound.conf

#
# SamdroidTools
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/samdroidtools/SamdroidTools.apk:system/app/SamdroidTools.apk \
    device/samsung/spica/prebuilt/spica/samdroidtools/libsamdroidtools.so:system/lib/libsamdroidtools.so

#
# RockPlayer for temporary DivX
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/rockplayer/RockPlayer.apk:system/app/RockPlayer.apk \
    device/samsung/spica/prebuilt/spica/rockplayer/libcmplayer.so:system/bin/rockplayer/libcmplayer.so \
    device/samsung/spica/prebuilt/spica/rockplayer/libcmplayer_7.so:system/bin/rockplayer/libcmplayer_7.so \
    device/samsung/spica/prebuilt/spica/rockplayer/libffmpeg.so:system/bin/rockplayer/libffmpeg.so

#
# dirty hack for OpenVPN
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/vpn/openvpn.apk:system/app/OpenVPN.apk

#
# serviceModeApp
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/servicemodeapp/serviceModeApp.apk:system/app/serviceModeApp.apk

# Java Esmertec Application
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/java/Java.apk:system/app/Java.apk

#
# Bluetooth
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/bt/BCM4325D1_004.002.004.0153.0173.hcd:system/bin/BCM4325D1_004.002.004.0153.0173.hcd

#
# system/sd
#
PRODUCT_COPY_FILES += \
    device/samsung/spica/prebuilt/spica/placeholder/.placeholder:system/sd/.placeholder

#
# Setup device specific product configuration.
#
PRODUCT_NAME := full_spica
PRODUCT_DEVICE := GT-I5700
PRODUCT_MODEL := GT-I5700
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
