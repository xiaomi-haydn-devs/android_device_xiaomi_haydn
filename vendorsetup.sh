echo 'Starting to clone stuffs needed to build for Haydn'

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera.git -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

# Leica patch
echo 'Adding Leica camera patch'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/14/Leicamera/0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
patch -p1 <0001-Add-backwards-compatible-CaptureResultExtras-constructor.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
