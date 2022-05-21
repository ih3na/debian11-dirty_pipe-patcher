#!/bin/bash

# Updating and Installing necessary packages
apt update -y
apt install linux-source -y

# Extracting the Kernel Package
cd /usr/src/
mkdir kernel
cd kernel
tar -xaf /usr/src/

# Copytinf the config file


# Compiling and building the packages

# Compiling externel modules


# Installing the packages

# Finishing things up

