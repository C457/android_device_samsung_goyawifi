$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Enable higher-res drawables while keeping mdpi as primary source
PRODUCT_AAPT_CONFIG := large mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += mdpi

PRODUCT_PROPERTY_OVERRIDES := \
    ro.carrier=wifi-only

# Init files
PRODUCT_PACKAGES += \
    fstab.pxa988 \
    init.pxa988.rc \
    init.pxa988.tel.rc \
    init_bsp.rc \
    init_bsp.pxa988.tel.rc \
    init_bsp.pxa988.rc \
    init.pxa988.usb.rc \
    init_charging.rc \
    ueventd.pxa988.rc \
    poweroff_charging_power_save.sh \
    lpm.rc

# Recovery rootdir
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/recovery/init.recovery.pxa988.rc:root/init.recovery.pxa988.rc \
    $(COMMON_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# Wifi
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=30

# GPS
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/sirfgps.conf:system/etc/sirfgps.conf

# Graphics config
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/gfx.cfg:system/etc/gfx.cfg \
    $(COMMON_PATH)/configs/dms.cfg:system/etc/dms.cfg

# Prebuilt Keylayout
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(COMMON_PATH)/keylayout/88pm80x_on.kl:system/usr/keylayout/88pm80x_on.kl \
    $(COMMON_PATH)/keylayout/88pm800_hook_vol.kl:system/usr/keylayout/88pm800_hook_vol.kl \
    $(COMMON_PATH)/keylayout/pxa27x-keypad.kl:system/usr/keylayout/pxa27x-keypad.kl \
    $(COMMON_PATH)/keylayout/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl\
    $(COMMON_PATH)/keylayout/Vendor_04e8_Product_7021.kl:system/usr/keylayout/Vendor_04e8_Product_7021.kl \
    $(COMMON_PATH)/keylayout/vnc-kbd.kl:system/usr/keylayout/vnc-kbd.kl

# Prebuilt Keychars
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/keychars/vnc-kbd.kcm:system/usr/keychars/vnc-kbd.kcm \
    $(COMMON_PATH)/keychars/pxa27x-keypad.kcm:system/usr/keychars/pxa27x-keypad.kcm \

# Prebuilt idc file
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/idc/elan-ts.idc:system/usr/idc/elan-ts.idc \
    $(COMMON_PATH)/idc/ft5306-ts.idc:system/usr/idc/ft5306-ts.idc \
    $(COMMON_PATH)/idc/vnc-ts.idc:system/usr/idc/vnc-ts.idc

# Audio
PRODUCT_COPY_FILES += \
    $(COMMON_PATH)/configs/asound.conf:system/etc/asound.conf \
    $(COMMON_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(COMMON_PATH)/configs/Volume.db:system/etc/Volume.db

# Alsa Libs
PRODUCT_COPY_FILES += $(foreach alsa,\
    $(wildcard device/samsung/lt02wifiue/audio/*.so),\
    $(alsa):system/usr/lib/alsa-lib/$(notdir $(alsa)))

# Audio Config
PRODUCT_COPY_FILES += $(foreach config,\
    $(wildcard device/samsung/lt02wifiue/audio/*.xml),\
    $(config):system/etc/$(notdir $(config)))

# Marvell Hardware
PRODUCT_PACKAGES += \
    powerdaemon \
    delegate_cpu \
    delegate_ddr \
    delegate_gpu \
    delegate_shcmd \
    plugin_android \
    plugin_coda \
    plugin_thermal \
    plugin_input \
    plugin_camera \
    iwconfig \
    iwevent \
    iwgetid \
    iwlist \
    iwpriv \
    iwspy \
    mrvl_dut \
    libsysfs \
    libcpufreq \
    i2cdetect \
    i2cdump \
    i2cget \
    i2cset

# Power Daemon configs
PRODUCT_COPY_FILES += $(foreach power,\
    $(wildcard device/samsung/lt02wifiue/power/*.xml),\
    $(power):system/etc/$(notdir $(power)))

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \

# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/lt02wifiue/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_CHARACTERISTICS := tablet

# Device specific packages
#PRODUCT_PACKAGES += \
#    lights.mrvl

PRODUCT_PACKAGES += \
    system_server \
    libxml2

# Enable repeatable keys in cwm
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# No SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.boot.selinux=disabled

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    drm.service.enabled=true
# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Audio
PRODUCT_PACKAGES += \
	audio.a2dp.default \
	audio.usb.default

# Misc
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.adb.enable=1 \
	persist.sys.usb.config=mtp,adb

# Keylayouts
PRODUCT_COPY_FILES += \
    device/samsung/lt02wifiue/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/lt02wifiue/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \

# Keychars
PRODUCT_COPY_FILES += \
    device/samsung/lt02wifiue/keychars/Generic.kcm:system/usr/keychars/Generic.kcm \
    device/samsung/lt02wifiue/keychars/Virtual.kcm:system/usr/keychars/Virtual.kcm

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    setup_fs

# Marvell modules
PRODUCT_COPY_FILES += $(foreach module,\
    $(wildcard device/samsung/lt02wifiue/modules/*.ko),\
    $(module):system/lib/modules/$(notdir $(module)))

# Charger
PRODUCT_PACKAGES += \
    charger_res_images \
    charger

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/samsung/lt02wifiue/lt02wifiue-vendor.mk)
