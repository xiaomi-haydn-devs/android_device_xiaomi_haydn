echo 'Starting to clone stuffs needed to build for Haydn'

# Device common
echo 'Cloning common device tree'
git clone https://github.com/xiaomi-haydn-devs/android_device_xiaomi_sm8350-common -b Rising-14 device/xiaomi/sm8350-common

# Kernel
echo 'Cloning kernel tree'
git clone https://github.com/xiaomi-haydn-devs/android_kernel_xiaomi_sm8350.git --recursive --depth=1 -b lineage-21 kernel/xiaomi/sm8350

# Vendor
echo 'Cloning vendor tree'
git clone https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_haydn -b lineage-21 vendor/xiaomi/haydn

# Vendor common
echo 'Cloning common vendor tree'
git clone https://github.com/xiaomi-haydn-devs/proprietary_vendor_xiaomi_sm8350-common -b lineage-21 vendor/xiaomi/sm8350-common

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

# Dolby audio
echo 'Adding Dolby patch'
cd frameworks/av
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0004-Import-Dolby-Effects-initialization.patch
patch -p1 <0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
patch -p1 <0004-Import-Dolby-Effects-initialization.patch
cd ../..

echo 'Removing USB charging notification'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0004-Remove-USB-charging-notification.patch
patch -p1 <0004-Remove-USB-charging-notification.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
