#!/bin/bash

echo "This Script Downloads and Compiles the Linux Kernel version 5.18"

# install dependencies
apt-get update -y && apt-get install build-essential linux-source bc kmod cpio flex libncurses5-dev libelf-dev libssl-dev rsync python3 -y

# download the kernel files
wget https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.18.tar.xz
echo "Download completed"

# unpack the files
tar xJf linux-5.18.tar.xz
cd linux-5.18/
echo "Unpacking done"

# make config
make menuconfig

# copy old config file into the working directory
cp /boot/$(ls\grep config-*-amd64) ./.config

# make oldconfig
make oldconfig

# make new changes to the configfile
make menuconfig

# make packages
make -j 2 deb-pkg

echo "Packaging done"

# clean unnecessary files
make clean

# install the kernel packages
echo "Installing Packages"
cd ..
dpgkg -i *.deb



echo "Installation Complete"

# update grub
update-grub
echo "Updating Grub"

#finishing things up
echo -e "Kernel Installation Complete...\nPlease Reboot the System Into the New Kernel Version...\n"
