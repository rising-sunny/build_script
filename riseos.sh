# Clone RisingOS

rm -rf .repo/local_manifests/

repo init -u repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs

# Clone local_manifests repository

git clone https://github.com/dpenra/sunny_manifest.git --depth 1 -b main .repo/local_manifests

# repo sync

/opt/crave/resync.sh

# removing and adding source
# Set up build environment
# initialize build environment
source build/envsetup.sh

# build
Riseup sunny user

# make
rise b
