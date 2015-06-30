LOCAL_PATH := $(call my-dir)

OPENCV_PATH := /home/pragyan/NVPACK/OpenCV-2.4.8.2-Tegra-sdk/sdk/native/jni
OPENCV_MK_PATH := $(OPENCV_PATH)/OpenCV.mk
OPENCV_INC_PATH := $(OPENCV_PATH)/include
include $(CLEAR_VARS)

#OpenCV Flags
OPENCV_INSTALL_MODULES := on
OPENCV_CAMERA_MODULES := off
OPENCV_LIB_TYPE := STATIC
include $(OPENCV_MK_PATH)

DS_NDK_ROOT := /home/pragyan/NVPACK/android-ndk-r10d

DS_NDK_ROOT_INC1 := $(DS_NDK_ROOT)/platforms/$(APP_PLATFORM)/arch-arm/usr/include
DS_NDK_ROOT_INC2 := $(DS_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.6/include
DS_NDK_ROOT_INC3 := $(DS_NDK_ROOT)/sources/cxx-stl/gnu-libstdc++/4.6/libs/armeabi-v7a/include

LOCAL_MODULE := AndroidJNI
LOCAL_ARM_MODE := arm

ifeq ($(APP_ABI), armeabi-v7a)
	TARGET_ARCH_ABI := $(APP_ABI)
	LOCAL_ARM_NEON := true
endif

LOCAL_C_INCLUDES := \
	$(DS_NDK_ROOT_INC1) \
	$(DS_NDK_ROOT_INC2) \
	$(DS_NDK_ROOT_INC3) \
	$(OPENCV_INC_PATH)

OPENCV_CFLAGS := -fPIC -DANDROID -fsigned-char
LOCAL_CPPFLAGS += -Wno-format-security -fpermissive -Wno-non-virtual-dtor -Wno-write-strings $(OPENCV_CFLAGS)
LOCAL_CPPFLAGS += -fexceptions -frtti -pthread -D_LINUX -D_ANDROID_NDK -D_STLPORT_RTTI
LOCAL_CFLAGS += -mfloat-abi=softfp  -DARM_SIMUL -DHAVE_NEON -std=gnu++11
LOCAL_LDLIBS += -llog

LOCAL_SRC_FILES := com_onestep_pragyan_androidjni_MainActivity.cpp

include $(BUILD_SHARED_LIBRARY)
