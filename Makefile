INSTALL_TARGET_PROCESSES = SpringBoard
ARCHS = arm64 arm64e

include $(THEOS_MAKE_PATH)/common.mk

TWEAK_NAME = Goodnight

Goodnight_FILES = Tweak.x
Goodnight_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
