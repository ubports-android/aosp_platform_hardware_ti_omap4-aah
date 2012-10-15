ifeq ($(TARGET_BOARD_PLATFORM),omap4)
ifeq ($(TARGET_BOARD_PLATFORM_VARIANT),aah)
ifeq ($(BOARD_USES_SECURE_SERVICES),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

-include $(TOP)/vendor/widevine/proprietary/cryptoPlugin/decrypt-core.mk

LOCAL_C_INCLUDES:= \
        $(TOP)/frameworks/native/include/media/hardware \
        $(TOP)/vendor/widevine/proprietary/cryptoPlugin \

LOCAL_STATIC_LIBRARIES += \
        libtee_client_api_driver        \

LOCAL_SHARED_LIBRARIES := \
        libstagefright_foundation       \
        liblog                          \
        libcutils                       \
        libcrypto

LOCAL_MODULE_OWNER := ti

LOCAL_MODULE := libdrmdecrypt

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

endif # ifeq ($(BOARD_USES_SECURE_SERVICES),true)
endif # ifeq ($(strip $(TARGET_BOARD_PLATFORM_VARIANT)),)
endif # ifeq ($(TARGET_BOARD_PLATFORM),omap4)
