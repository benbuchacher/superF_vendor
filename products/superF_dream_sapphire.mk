# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/superF/products/common.mk)

# Include GSM-only stuff
$(call inherit-product, vendor/superF/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := superF_dream_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Dream/Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRF91 BUILD_DISPLAY_ID=FRF91 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2/FRF91/43546:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2 FRF91 43546 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/superF/prelink-linux-arm-ds.map

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=superF_msm_defconfig

# Extra DS overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/superF/overlay/dream_sapphire

# This file is used to install the correct audio profile when booted
PRODUCT_COPY_FILES += \
    vendor/superF/prebuilt/dream_sapphire/etc/init.d/02audio_profile:system/etc/init.d/02audio_profile

# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=1

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=SuperF-1.0-$(shell date +%m%d%Y)-NIGHTLY-DS
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=SuperF-1.0-DS
endif

# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

#
# Copy DS specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/htc/dream_sapphire/proprietary/akmd:system/bin/akmd \
    vendor/superF/prebuilt/dream_sapphire/etc/AudioPara_dream.csv:system/etc/AudioPara_dream.csv \
    vendor/superF/prebuilt/dream_sapphire/etc/AudioPara_sapphire.csv:system/etc/AudioPara_sapphire.csv \
    vendor/htc/dream_sapphire/proprietary/AudioPreProcess.csv:system/etc/AudioPreProcess.csv \
    vendor/htc/dream_sapphire/proprietary/brf6300.bin:system/etc/firmware/brf6300.bin \
    vendor/htc/dream_sapphire/proprietary/Fw1251r1c.bin:system/etc/wifi/Fw1251r1c.bin \
    vendor/htc/dream_sapphire/proprietary/libGLES_qcom.so:system/lib/egl/libGLES_qcom.so \
    vendor/htc/dream_sapphire/proprietary/libaudioeq.so:system/lib/libaudioeq.so \
    vendor/htc/dream_sapphire/proprietary/libgps.so:system/lib/libgps.so \
    vendor/htc/dream_sapphire/proprietary/libhtc_acoustic.so:system/lib/libhtc_acoustic.so \
    vendor/htc/dream_sapphire/proprietary/libhtc_ril.so:system/lib/libhtc_ril.so \
    vendor/htc/dream_sapphire/proprietary/liblvmxipc.so:system/lib/liblvmxipc.so \
    vendor/htc/dream_sapphire/proprietary/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    vendor/htc/dream_sapphire/proprietary/liboemcamera.so:system/lib/liboemcamera.so \
    vendor/htc/dream_sapphire/proprietary/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    vendor/htc/dream_sapphire/proprietary/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    vendor/htc/dream_sapphire/proprietary/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    vendor/htc/dream_sapphire/proprietary/libomx_wmadec_sharedlibrary.so:system/lib/libomx_wmadec_sharedlibrary.so \
    vendor/htc/dream_sapphire/proprietary/:system/lib/libomx_wmvdec_sharedlibrary.so \
    vendor/htc/dream_sapphire/proprietary/libpvasfcommon.so:system/lib/libpvasfcommon.so \
    vendor/htc/dream_sapphire/proprietary/libpvasflocalpbreg.so:system/lib/libpvasflocalpbreg.so \
    vendor/htc/dream_sapphire/proprietary/libpvasflocalpb.so:system/lib/libpvasflocalpb.so \
    vendor/htc/dream_sapphire/proprietary/pvasflocal.cfg:system/etc/pvasflocal.cfg \
    vendor/superF/proprietary/CarHomeGoogle.apk:./system/app/CarHomeGoogle.apk \
    vendor/superF/proprietary/CarHomeLauncher.apk:./system/app/CarHomeLauncher.apk \
    vendor/superF/proprietary/Facebook.apk:./system/app/Facebook.apk \
    vendor/superF/proprietary/GenieWidget.apk:./system/app/GenieWidget.apk \
    vendor/superF/proprietary/Gmail.apk:./system/app/Gmail.apk \
    vendor/superF/proprietary/GoogleBackupTransport.apk:./system/app/GoogleBackupTransport.apk \
    vendor/superF/proprietary/GoogleCalendarSyncAdapter.apk:./system/app/GoogleCalendarSyncAdapter.apk \
    vendor/superF/proprietary/GoogleContactsSyncAdapter.apk:./system/app/GoogleContactsSyncAdapter.apk \
    vendor/superF/proprietary/GoogleFeedback.apk:./system/app/GoogleFeedback.apk \
    vendor/superF/proprietary/GooglePartnerSetup.apk:./system/app/GooglePartnerSetup.apk \
    vendor/superF/proprietary/GoogleQuickSearchBox.apk:./system/app/GoogleQuickSearchBox.apk \
    vendor/superF/proprietary/GoogleServicesFramework.apk:./system/app/GoogleServicesFramework.apk \
    vendor/superF/proprietary/HtcCopyright.apk:./system/app/HtcCopyright.apk \
    vendor/superF/proprietary/HtcEmailPolicy.apk:./system/app/HtcEmailPolicy.apk \
    vendor/superF/proprietary/HtcSettings.apk:./system/app/HtcSettings.apk \
    vendor/superF/proprietary/LatinImeTutorial.apk:./system/app/LatinImeTutorial.apk \
    vendor/superF/proprietary/Maps.apk:./system/app/Maps.apk \
    vendor/superF/proprietary/MarketUpdater.apk:./system/app/MarketUpdater.apk \
    vendor/superF/proprietary/MediaUploader.apk:./system/app/MediaUploader.apk \
    vendor/superF/proprietary/NetworkLocation.apk:./system/app/NetworkLocation.apk \
    vendor/superF/proprietary/OneTimeInitializer.apk:./system/app/OneTimeInitializer.apk \
    vendor/superF/proprietary/PassionQuickOffice.apk:./system/app/PassionQuickOffice.apk \
    vendor/superF/proprietary/SetupWizard.apk:./system/app/SetupWizard.apk \
    vendor/superF/proprietary/Street.apk:./system/app/Street.apk \
    vendor/superF/proprietary/Talk.apk:./system/app/Talk.apk \
    vendor/superF/proprietary/Twitter.apk:./system/app/Twitter.apk \
    vendor/superF/proprietary/Vending.apk:./system/app/Vending.apk \
    vendor/superF/proprietary/VoiceSearch.apk:./system/app/VoiceSearch.apk \
    vendor/superF/proprietary/YouTube.apk:./system/app/YouTube.apk \
    vendor/superF/proprietary/com.amazon.mp3.apk:./system/app/com.amazon.mp3.apk \
    vendor/superF/proprietary/googlevoice.apk:./system/app/googlevoice.apk \
    vendor/superF/proprietary/kickback.apk:./system/app/kickback.apk \
    vendor/superF/proprietary/soundback.apk:./system/app/soundback.apk \
    vendor/superF/proprietary/talkback.apk:./system/app/talkback.apk \
    vendor/superF/proprietary/com.google.android.maps.xml:./system/etc/permissions/com.google.android.maps.xml \
    vendor/superF/proprietary/features.xml:./system/etc/permissions/features.xml \
    vendor/superF/proprietary/com.google.android.maps.jar:./system/framework/com.google.android.maps.jar \
    vendor/superF/proprietary/libinterstitial.so:./system/lib/libinterstitial.so \
    vendor/superF/proprietary/libspeech.so:./system/lib/libspeech.so
       
