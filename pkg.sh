#!/usr/bin/env bash

#Update Packages
sudo pacman -Syu

#Add Chaotic AUR
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo
cat << EOF
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
echo "Copy the above text & paste in /etc/pacman.conf , also uncomment parallel downloads(10) & multilib"
read -n 1 -s -r -p "Press any key to continue"
sudo nano /etc/pacman.conf
