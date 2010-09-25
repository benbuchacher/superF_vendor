# Generic cyanogenmod product
PRODUCT_NAME := superF
PRODUCT_BRAND := superF
PRODUCT_DEVICE := generic


# Add ROMManager build property
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=DonMessWivIt.ogg

ifdef SUPERF_NIGHTLY
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=SuperF-nightly
PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=SuperF
endif

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

# Enable Windows Media if supported by the board
WITH_WINDOWS_MEDIA:=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

# CyanogenMod specific product packages
PRODUCT_PACKAGES += \
    Superuser

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/superF/overlay/common

# Bring in some audio files
include frameworks/base/data/sounds/AudioPackage4.mk

PRODUCT_COPY_FILES += \
    vendor/superF/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/superF/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/superF/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/superF/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/superF/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/superF/prebuilt/common/etc/profile:system/etc/profile \
    vendor/superF/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/superF/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/superF/prebuilt/common/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    vendor/superF/prebuilt/common/etc/init.d/03firstboot:system/etc/init.d/03firstboot \
    vendor/superF/prebuilt/common/etc/init.d/04modules:system/etc/init.d/04modules \
    vendor/superF/prebuilt/common/etc/init.d/20userinit:system/etc/init.d/20userinit \
    vendor/superF/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/superF/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/superF/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/superF/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/superF/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/superF/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/superF/prebuilt/common/xbin/lsof:system/xbin/lsof \
    vendor/superF/prebuilt/common/xbin/powertop:system/xbin/powertop \
    vendor/superF/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh

PRODUCT_COPY_FILES += \
    vendor/superF/prebuilt/common/etc/init.d/05mountsd:system/etc/init.d/05mountsd
#    vendor/superF/prebuilt/common/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd

PRODUCT_COPY_FILES +=  \
    vendor/superF/proprietary/RomManager.apk:system/app/RomManager.apk \

# Always run in insecure mode, enables root on user build variants
#ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

ifdef SUPERF_WITH_GOOGLE
    PRODUCT_COPY_FILES += \
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
else
    PRODUCT_PACKAGES += \
        Provision \
        GoogleSearch \
        LatinIME
endif
