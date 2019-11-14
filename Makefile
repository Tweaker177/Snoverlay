ARCHS = armv7 arm64 arm64e armv7s
TARGET = iphone:clang:11.2:7.0
DEBUG = 0
FINALPACKAGE = 1
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Snoverlay
Snoverlay_FILES = Tweak.xm ./FallingSnow/UIView+XMASFallingSnow.m ./FallingSnow/XMASFallingSnowView.m

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

SUBPROJECTS += snoverlaypreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
