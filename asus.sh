#!/bin/bash
cd /root/batcomputer
git clone https://github.com/d-dragon-project/asus
cd asus
apt-get install dkms
apt-get install bc
apt-get install rsync
VER=$(sed -n 's/\PACKAGE_VERSION="\(.*\)"/\1/p' dkms.conf)
sudo rsync -rvhP ./ /usr/src/rtl88x2bu-${VER}
sudo dkms add -m rtl88x2bu -v ${VER}
sudo dkms build -m rtl88x2bu -v ${VER}
sudo dkms install -m rtl88x2bu -v ${VER}
sudo modprobe 88x2bu
clear
