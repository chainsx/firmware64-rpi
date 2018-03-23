#!/bin/sh
# Powered by chainsx
echo "Install Image,dtbs"
cp -rfp boot/* /boot/
echo "Remove old modules"
rm -rf /lib/modules/*
echo "OK"
echo "Install modules"
cp -rfp lib/modules/* /lib/modules/
echo "OK"
echo "Install firmware"
cp -rfp lib/firmware/* /lib/firmware/
echo "OK"
echo "Install kernel_headers"
cp -rfp usr/include/* /usr/include/
echo "OK"
echo "Configure files"
sed '/^kernel/'d /boot/config.txt
echo "kernel=kernel8.img" >> /boot/config.txt
echo "OK"
echo "You can reboot to use this new kernel."
