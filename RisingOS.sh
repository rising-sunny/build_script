#!/bin/bash

# Remove the local manifests directory if it exists (cleanup before repo initialization)
rm -rf .repo/local_manifests/

# Remove device trees (cleanup old device-specific configurations)
rm -rf device/xiaomi/sunny
rm -rf device/xiaomi/sunny-kernel
rm -rf device/qcom/qssi
rm -rf device/qcom/common

# Remove the kernel tree for Xiaomi Sunny device
rm -rf kernel/xiaomi/sunny

# Remove vendor trees (vendor-specific files for Xiaomi, Qualcomm, and others)
rm -rf vendor/xiaomi/sunny
rm -rf vendor/qcom/common
rm -rf vendor/qcom/opensource/core-utils
rm -rf vendor/lineage-priv/keys
rm -rf vendor/bcr
rm -rf vendor/xiaomi/mojito-leicacamera
rm -rf vendor/xiaomi/miuiapps

# Remove hardware-specific files for Xiaomi devices
rm -rf hardware/xiaomi

# Remove prebuilt GCC compilers (used for building the kernel)
rm -rf prebuilts/gcc/linux-x86/aarch64/aarch64-elf
rm -rf prebuilts/gcc/linux-x86/arm/arm-eabi

# Remove additional packages (DisplayFeatures, KProfiles, and ViPER4AndroidFX)
rm -rf packages/apps/DisplayFeatures
rm -rf packages/apps/KProfiles
rm -rf packages/apps/ViPER4AndroidFX

# Remove specific source modifications (clean up custom hardware and package sources)
rm -rf hardware/qcom-caf/sm8150/media
rm -rf packages/apps/Updater
rm -rf vendor/lineage

# Initialize the ROM manifest from the RisingTechOSS repository
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs

# Synchronize the repo using a custom resync script
/opt/crave/resync.sh

# Remove outdated or unneeded directories after syncing
rm -rf hardware/qcom-caf/sm8150/media
rm -rf vendor/lineage
rm -rf packages/apps/Updater

# Clone the device tree repositories for Xiaomi Sunny and related kernel and common configurations
git clone https://github.com/rising-sunny/device_xiaomi_sunny.git --depth 1 -b fourteen device/xiaomi/sunny
git clone https://github.com/dpenra-sunny/device_xiaomi_sunny-kernel.git --depth 1 -b fourteen device/xiaomi/sunny-kernel
git clone https://github.com/AOSPA/android_device_qcom_qssi.git --depth 1 -b uvite device/qcom/qssi
git clone https://github.com/yaap/device_qcom_common.git --depth 1 -b fourteen device/qcom/common

# (Optional) Clone the kernel tree for Xiaomi Sunny (commented out for now)
# git clone https://github.com/dpenra-sunny/kernel_xiaomi_sunny.git --depth 1 kernel/xiaomi/sunny

# Clone vendor repositories for Xiaomi Sunny, Qualcomm, and other components
git clone https://github.com/rising-sunny/vendor_xiaomi_sunny.git --depth 1 -b fourteen vendor/xiaomi/sunny
git clone https://gitlab.com/yaosp/vendor_qcom_common.git --depth 1 -b fourteen vendor/qcom/common
git clone https://github.com/yaap/vendor_qcom_opensource_core-utils.git --depth 1 -b fourteen vendor/qcom/opensource/core-utils
git clone https://github.com/sunny-keys/lineage-priv-risingos.git --depth 1 -b master vendor/lineage-priv/keys
git clone https://github.com/Chaitanyakm/vendor_bcr.git --depth 1 -b main vendor/bcr
git clone https://gitlab.com/dpenra/android_vendor_xiaomi_mojito-leicacamera.git --depth 1 -b main vendor/xiaomi/mojito-leicacamera
git clone https://github.com/dpenra-apps/android_vendor_xiaomi_miuiapps.git --depth 1 -b main vendor/xiaomi/miuiapps

# Clone the hardware-specific files for Xiaomi devices
git clone https://github.com/dpenra-sunny/hardware_xiaomi.git --depth 1 -b fourteen hardware/xiaomi

# Clone prebuilt GCC compilers for ARM and AArch64 architecture
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_aarch64_aarch64-elf.git --depth 1 -b 14.0.0 prebuilts/gcc/linux-x86/aarch64/aarch64-elf
git clone https://github.com/StatiXOS/android_prebuilts_gcc_linux-x86_arm_arm-eabi.git --depth 1 -b 12.0.0 prebuilts/gcc/linux-x86/arm/arm-eabi

# Clone specific packages for DisplayFeatures, KProfiles, and ViPER4AndroidFX
git clone https://github.com/cyberknight777/android_packages_apps_DisplayFeatures.git --depth 1 -b master packages/apps/DisplayFeatures
git clone https://github.com/KProfiles/android_packages_apps_Kprofiles.git --depth 1 -b main packages/apps/KProfiles
git clone https://github.com/xiaomi-begonia-dev/android_packages_apps_ViPER4AndroidFX.git --depth 1 -b fourteen packages/apps/ViPER4AndroidFX

# Clone source modifications for hardware and vendor trees specific to Qualcomm and RisingOS
git clone https://github.com/yaap/hardware_qcom-caf_sm8150_media.git --depth 1 -b fourteen hardware/qcom-caf/sm8150/media
git clone https://github.com/rising-sunny/android_packages_apps_Updater.git --depth 1 -b fourteen packages/apps/Updater
git clone https://github.com/dpenra-sunny/android_vendor_lineage.git --depth 1 -b fourteen vendor/lineage

# Set up the build environment by sourcing the envsetup script
. build/envsetup.sh

# Choose the build configuration (lunch target) for Xiaomi Sunny device
riseup sunny user

# Start the build process for RisingOS (build the 'bacon' target)
rise b
