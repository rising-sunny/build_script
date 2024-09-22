# Clone RisingOS

# Remove local manifests if they exist
rm -rf .repo/local_manifests/

# Initialize ROM manifest (with --git-lfs for large file support)
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs

# Clone your custom local_manifests repository
git clone https://github.com/dpenra/sunny_manifest --depth 1 -b main .repo/local_manifests

# Sync the repository
/opt/crave/resync.sh

# Set up build environment
. build/envsetup.sh

# Set up the build target (RisingOS specific command)
riseup sunny user

# Build the ROM (RisingOS-specific build command)
rise b

# Alternative Android build system command
# mka bacon
