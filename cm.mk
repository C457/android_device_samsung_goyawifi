# Release name
PRODUCT_RELEASE_NAME := lt02wifiue

# Boot animation
TARGET_SCREEN_HEIGHT := 1024
TARGET_SCREEN_WIDTH := 600

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/lt02wifiue/full_lt02wifiue.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lt02wifiue
PRODUCT_NAME := cm_lt02wifiue
PRODUCT_BRAND := Samsung
PRODUCT_MODEL := SM-T210R
PRODUCT_MANUFACTURER := samsung
