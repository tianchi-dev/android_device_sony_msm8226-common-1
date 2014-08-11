LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_VENDOR_PLATFORM),msm8226)
    include $(call all-subdir-makefiles,$(LOCAL_PATH))

    $(shell mkdir -p $(TARGET_OUT_ETC)/firmware/wcd9306; \
        ln -sf /data/misc/audio/wcd9320_anc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_anc.bin; \
        ln -sf /data/misc/audio/mbhc.bin \
        $(TARGET_OUT_ETC)/firmware/wcd9306/wcd9306_mbhc.bin)
endif
