#!/bin/bash

# Remove local manifests if they exist
rm -rf .repo/local_manifests/
# remove device
rm -rf device/xiaomi/sunny
rm -rf device/xiaomi/sunny-kernel
rm -rf device/qcom/qssi
rm -rf device/qcom/common
# remove kernel
rm -rf kernel/xiaomi/sunny
# remove vendor
rm -rf vendor/xiaomi/sunny
rm -rf vendor/qcom/common
rm -rf vendor/qcom/opensource/core-utils
rm -rf vendor/lineage-priv/keys
rm -rf vendor/bcr
rm -rf vendor/xiaomi/mojito-leicacamera
rm -rf vendor/xiaomi/miuiapps
# remove hardware
rm -rf hardware/xiaomi
# remove prebuilts
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi
# remove packages
rm -rf packages/apps/DisplayFeatures
rm -rf packages/apps/KProfiles
rm -rf packages/apps/ViPER4AndroidFX
# remove source mod
rm -rf hardware/qcom-caf/sm8150/media
rm -rf packages/apps/Updater
rm -rf vendor/lineage
# Initialize ROM manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
# repo sync
/opt/crave/resync.sh
# remove directory
rm -rf hardware/qcom-caf/sm8150/media
rm -rf vendor/lineage
rm -rf packages/apps/Updater
rm -rf frameworks/base
# cloning DT
# device tree
git clone https://github.com/dpenra-sunny/device_xiaomi_sunny.git --depth 1 -b fourteen device/xiaomi/sunny
git clone https://github.com/dpenra-sunny/device_xiaomi_sunny-kernel.git --depth 1 -b fourteen device/xiaomi/sunny-kernel
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b uvite device/qcom/qssi
git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fourteen device/qcom/common
# kernel tree
git clone https://github.com/dpenra-sunny/kernel_xiaomi_sunny.git --depth 1 kernel/xiaomi/sunny
# vendor tree
git clone https://github.com/dpenra-sunny/vendor_xiaomi_sunny.git --depth 1 -b fourteen vendor/xiaomi/sunny
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fourteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fourteen vendor/qcom/opensource/core-utils
# git clone https://github.com/dpenra-sunny/vendor_lineage-priv_keys.git --depth 1 -b master vendor/lineage-priv/keys
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
git clone https://gitlab.com/dpenra/android_vendor_xiaomi_mojito-leicacamera.git --depth 1 -b main vendor/xiaomi/mojito-leicacamera
git clone https://github.com/dpenra-apps/android_vendor_xiaomi_miuiapps.git --depth 1 -b main vendor/xiaomi/miuiapps
# hardware tree
git clone https://github.com/dpenra-sunny/hardware_xiaomi.git --depth 1 -b main hardware/xiaomi
# prebuilts
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi
# packages
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures.git --depth 1 -b master packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX
# source mods
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fourteen hardware/qcom-caf/sm8150/media
git clone https://github.com/dpenra-sunny/android_packages_apps_Updater.git --depth 1 -b fourteen packages/apps/Updater
git clone https://github.com/dpenra-sunny/android_vendor_lineage.git --depth 1 -b fourteen vendor/lineage
git clone https://github.com/dpenra-sunny/android_frameworks_base.git --depth 1 -b fourteen frameworks/base
# set build environment
. build/envsetup.sh
# lunch
riseup sunny user
# make
rise b
