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
	echo "Install new boot-files"
	echo "Install bootloader"
	cp -rfp $DIR/../bootloader/* /boot
	echo "Install Image,dtbs"
	cp -rfp $DIR/boot/* /boot/
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
	#echo "Configure files"
	#sed '/^kernel/'d /boot/config.txt
	#echo "kernel=kernel8.img" >> /boot/config.txt
	#echo "OK"
	echo "You can reboot to use this new kernel."

else
	echo "stop"
	exit
fi
