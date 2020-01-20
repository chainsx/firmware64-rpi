#!/bin/sh

ARCH=$(arch)
TARGET=aarch64

echo You are running this scipt on a $ARCH mechine....

if [ "$ARCH" != "$TARGET" ];then
sudo apt-get install qemu-user-static
else
echo "You are running this script on a aarch64 mechine, progress...."
fi

ROOTFS=root

sudo apt install debootstrap debian-keyring
mkdir $ROOTFS
sudo debootstrap --arch=arm64 buster ./$ROOTFS http://mirrors.tuna.tsinghua.edu.cn/debian

if [ "$ARCH" != "$TARGET" ];then
sudo cp /usr/bin/qemu-aarch64-static $ROOTFS/usr/bin
else
echo "You are running this script on a aarch64 mechine, progress...."
fi

chroot $ROOTFS apt-get install -y sudo ssh net-tools ethtool wireless-tools network-manager iputils-ping rsyslog alsa-utils bash-completion gnupg busybox kmod --no-install-recommends

cat <<EOF | chroot $ROOTFS adduser pi && addgroup pi adm && addgroup pi sudo && addgroup pi audio
raspberry
raspberry
pi
0
0
0
0
y
EOF

chroot $ROOTFS apt clean

if [ "$ARCH" != "$TARGET" ];then
sudo rm $ROOTFS/usr/bin/qemu-aarch64-static
else
echo "You are running this script on a aarch64 mechine, progress...."
fi

echo '127.0.0.1 raspberrypi' >> $ROOTFS/etc/hosts

#echo 'raspberrypi' >> $ROOTFS/etc/hostname

mkdir kernel
mkdir tmp

wget -O kernel/firmware-bin.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi-bin_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/firmware-bin.deb tmp
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

wget -O kernel/firmware-dev.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi-dev_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/firmware-dev.deb tmp
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

wget -O kernel/libraspberrypi0.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi0_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/libraspberrypi0.deb tmp
cp -rfp tmp/lib/* $ROOTFS/lib
rm -rf tmp/lib
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

wget -O kernel/bootloader.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-bootloader_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/bootloader.deb tmp
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

wget -O kernel/kernel.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-kernel_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/kernel.deb tmp
cp -rfp tmp/lib/* $ROOTFS/lib
rm -rf tmp/lib
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

mkdir kernel-headers

wget -O kernel-headers/headers.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-kernel-headers_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel-headers/headers.deb tmp
cp -rfp tmp/lib/* $ROOTFS/lib
rm -rf tmp/lib
cp -rfp tmp/* $ROOTFS
rm -rf tmp/*

rm -rf $ROOTFS/lib/modules/*7+
rm -rf $ROOTFS/lib/modules/*7l+
rm -rf kernel
rm -rf kernel-headers
rm $ROOTFS/boot/kernel.img
rm $ROOTFS/boot/kernel7.img
rm $ROOTFS/boot/kernel7l.img
rm -rf tmp

cp files/cmdline.txt $ROOTFS/boot
cp files/cobfig.txt $ROOTFS/boot

git clone --depth=1 https://github.com/RPi-Distro/firmware-nonfree
rm -rf firmware-nonfree/.git
mv firmware-nonfree firmware
mv firmware $ROOTFS/lib

cat /dev/null > $ROOTFS/etc/fstab
cat files/fstab >> $ROOTFS/etc/fstab
