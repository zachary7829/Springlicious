ARCHS = arm64 arm64e
TARGET = iphone:clang:14.8.1:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Springlicious

Springlicious_FILES = Tweak.xm
Springlicious_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += springliciousprefs
include $(THEOS_MAKE_PATH)/aggregate.mk