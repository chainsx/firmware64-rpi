#!/bin/sh
sudo apt install debootstrap debian-keyring
mkdir root
sudo debootstrap --arch=arm64 buster ./root http://mirrors.tuna.tsinghua.edu.cn/debian

chroot root apt-get install -y sudo ssh net-tools ethtool wireless-tools network-manager iputils-ping rsyslog alsa-utils bash-completion --no-install-recommends

chroot root adduser pi && addgroup pi adm && addgroup pi sudo && addgroup pi audio |cat <<EOF
raspberry
raspberry
pi
0
0
0
0
y
EOF

chroot root apt clean

echo '127.0.0.1 raspberrypi' >> root/etc/hosts
echo 'raspberrypi' >> root/etc/hostname

mkdir kernel
mkdir tmp

wget -O kernel/firmware-bin.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi-bin_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/firmware-bin.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*
wget -O kernel/firmware-dev.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi-dev_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/firmware-dev.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*
wget -O kernel/libraspberrypi0.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/libraspberrypi0_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/libraspberrypi0.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*
wget -O kernel/bootloader.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-bootloader_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/bootloader.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*
wget -O kernel/kernel.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-kernel_1.20190925-2_armhf.deb
echo 'Installing to root ....'
sudo dpkg -x kernel/kernel.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*

mkdir kernel-headers

wget -O kernel-headers/headers.deb https://mirrors.tuna.tsinghua.edu.cn/raspberrypi/pool/main/r/raspberrypi-firmware/raspberrypi-kernel-headers_1.20190925-2_armhf.debecho 'Installing to root ....'
sudo dpkg -x kernel-headers/headers.deb tmp
cp -rfp tmp/* root
rm -rf tmp/*

rm -rf root/lib/modules/*7+
rm -rf root/lib/modules/*7l+
rm -rf kernel
rm -rf kernel-headers
rm root/boot/kernel.img
rm root/boot/kernel7.img
rm root/boot/kernel7l.img
rm -rf tmp

cp files/cmdline.txt root/boot
cp files/cobfig.txt root/boot

git clone --depth=1 https://github.com/RPi-Distro/firmware-nonfree
rm -rf firmware-nonfree/.git
mv firmware-nonfree firmware
mv firmware root/lib
