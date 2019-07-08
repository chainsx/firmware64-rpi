#!/bin/sh
# Powered by chainsx
DIR=$(pwd)
echo "Are you sure to install this 64-Bit firmware?"
echo -n "Please type (yes) to continue \n"
read A
if [ $A = "yes" ];then
	echo "Backup old boot-files"
	mkdir /boot.old
	cp -rfp /boot/* /boot.old
        echo "Remount boot partition"
        umount /dev/mmcblk0p1
        mount /dev/mmcblk0p1 /boot
	echo "Install new boot-files"
	echo "Install bootloader"
	cp -rfp $DIR/../bootloader/* /boot
	echo "Install Image,dtbs"
	cp -rfp $DIR/boot/* /boot/ && rm /boot/cmdline.txt && cp /boot.old/cmdline.txt /boot
	#echo "Delete old modules"
	#rm -rf $DIR//lib/modules/*
	#echo "OK"
	echo "Install modules"
	cp -rfp $DIR/lib/modules/* /lib/modules/
	echo "OK"
#	echo "Install firmware"
#	cp -rfp $DIR/lib/firmware/* /lib/firmware/
#	echo "OK"
	echo "Install kernel_headers"
	cp -rfp $DIR/usr/include/* /usr/include/
	echo "OK"
	echo "Install 64-Bit VC4 Built by chainsx"
	cp -rfp $DIR/opt /opt
	cp -rfp /opt/vc/* /usr
	echo "Note, 64-Bit VC4 Was Installed In /opt"
	#echo "Configure files"
	#sed '/^kernel/'d /boot/config.txt
	#echo "kernel=kernel8.img" >> /boot/config.txt
	#echo "OK"
	echo "You can reboot to use this new kernel."

else
	echo "stop"
	exit
fi
