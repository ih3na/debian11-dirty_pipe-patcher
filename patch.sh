#!/bin/bash

# Variables
sourcepkg=$(ls /bin/usr/src/|grep linux-source)
config=$(ls /boot/|grep config)

# Updating and Installing necessary packages
apt update -y
apt install linux-source hd-idle dpkg-dev libelf-dev libssl-dev rsync -y

# Extracting the Kernel Package
cd /usr/src/
mkdir kernel
cd kernel
tar -xaf /usr/src/$sourcepkg

# Copyting the config file
cp $config /usr/src/kernel


# Compiling and building the packages
make deb-pkg LOCALVERSION=-falcot KDEB_PKGVERSION=$(make kernelversion)-1

# Compiling externel modules
apt install dahdi-dkms
dkms status
modinfo dahdi_dummy

# Installing the packages
cd ..
pkgs=$(ls |grep .deb)
dpkg -i $pkgs


# Finishing things up
echo "Done!"
