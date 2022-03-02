ARCHS = arm64 arm64e
TARGET = iphone:clang:14.8:13.0
PREFIX = $(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/
SYSROOT = $(THEOS)/sdks/iPhoneOS14.5.sdk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SpringliciousPrefs

SpringliciousPrefs_FILES = ZLPRootListController.m
SpringliciousPrefs_FRAMEWORKS = UIKit
SpringliciousPrefs_PRIVATE_FRAMEWORKS = Preferences
SpringliciousPrefs_INSTALL_PATH = /Library/PreferenceBundles
SpringliciousPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
