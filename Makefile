THEOS_PACKAGE_SCHEME = rootless
ARCHS = arm64
TARGET := iphone:clang:16.5:17.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CarParkApps
CarParkApps_FILES = Tweak.x
CarParkApps_CFLAGS = -fobjc-arc
CarParkApps_FRAMEWORKS = UIKit CarPlay CoreLocation

include $(THEOS_MAKE_PATH)/tweak.mk
