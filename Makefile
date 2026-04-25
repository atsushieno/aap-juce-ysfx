PWD=$(shell pwd)
AAP_JUCE_DIR=$(PWD)/external/aap-juce

APP_NAME=ysfx

APP_BUILD_DIR=$(PWD)
APP_SRC_DIR=$(PWD)/external/ysfx
JUCE_DIR=$(PWD)/external/JUCE

# CMake target name for the instrument plugin; SharedCode lib follows JUCE convention.
APP_SHARED_CODE_LIBS="ysfx_plugin_instrument_artefacts/libysfx_plugin_instrument_SharedCode.a"

PATCH_FILE=$(PWD)/aap-juce-support.patch
PATCH_DEPTH=1

# JUCE patches are applied to external/JUCE by Makefile.cmake-common.
# ysfx fetches JUCE via CMake FetchContent, so we redirect FetchContent to
# our pre-checked-out external/JUCE via -DFETCHCONTENT_SOURCE_DIR_JUCE in
# app/build.gradle.
AAP_JUCE_CMAKE_SKIP_DEFAULT_PATCHES=1

JUCE_PATCHES= \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/export-jni-symbols.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/disable-detach-current-thread.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/support-plugin-ui.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/embedded-peer-window-guard.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/juce-component-peer-view-touch.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/popup-menu-android.patch \
	$(AAP_JUCE_DIR)/juce-patches/8.0.12/standalone-aap-factory-weak-fallback.patch

JUCE_PATCH_DEPTH=1

include $(AAP_JUCE_DIR)/Makefile.cmake-common
