echo 'Starting to clone stuffs needed to build for Haydn'

# Firmware
echo 'Cloning firmware'
git clone --depth=1 https://gitlab.com/Alucard_Storm/vendor_xiaomi_haydn-firmware -b thirteen vendor/xiaomi/haydn-firmware

# Camera
echo 'Cloning Leica camera'
git clone --depth=1 https://gitlab.com/Alucard_Storm/haydn-miuicamera -b fourteen-leica vendor/xiaomi/haydn-miuicamera
rm -rf hardware/xiaomi/megvii

# Audio
echo 'Adding audio-app support'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Audio-app-main/0001-Add-audio-app-support.patch
patch -p1 <0001-Add-audio-app-support.patch
cd ../..

echo 'Enabling VoNR by default'
cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/VoNR/0001-Enable-VoNR-by-default.patch
patch -p1 <0001-Enable-VoNR-by-default.patch
cd ../..

# Dolby audio
echo 'Adding Dolby patch'
cd frameworks/av
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Dolby/0004-Import-Dolby-Effects-initialization.patch
patch -p1 <0002-OMX-Remove-support-for-prebuilt-ac4-decoder.patch
patch -p1 <0003-media-OMXStore-Import-loading-libstagefrightdolby.patch
patch -p1 <0004-Import-Dolby-Effects-initialization.patch
cd ../..

echo 'Adding optimization patch'
cd system/core
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0001-Dont-enable-f2fs-iostat-by-default.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0002-Tune-F2FS-and-dirty-writeout-policy-for-modern-devices.patch
patch -p1 <0001-Dont-enable-f2fs-iostat-by-default.patch
patch -p1 <0002-Tune-F2FS-and-dirty-writeout-policy-for-modern-devices.patch
cd ../..

cd frameworks/base
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0003-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
wget https://raw.githubusercontent.com/xiaomi-haydn-devs/Patch-Haydn/udc-14/Optimization/0004-Remove-USB-charging-notification.patch
patch -p1 <0003-BootReceiver-Return-early-if-trace-pipe-doesnt-exists.patch
patch -p1 <0004-Remove-USB-charging-notification.patch
cd ../..

echo 'delete vendorsetup.sh from device tree once this is done'
