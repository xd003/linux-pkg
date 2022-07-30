#!/usr/bin/env bash

#Update Packages
sudo pacman -Syu

#Add Chaotic AUR
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo
echo && cat << EOF
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
echo && echo "Copy the above text & paste in /etc/pacman.conf , also uncomment parallel downloads(10) & multilib"
read -n 1 -s -r -p "Press any key to continue: "
sudo nano /etc/pacman.conf

#Install Pacman & AUR packages
sudo pacman -Syu paru firefox gedit xdg-user-dirs gnome-keyring seahorse libsecret telegram-desktop flatpak xf86-video-intel intel-media-driver libva-intel-driver libva-utils intel-gpu-tools xarchiver celluloid-git thunar thunar-archive-plugin thunar-volman orchis-kde-theme-gitnoto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts-emoji papirus-icon-theme orchis-theme \
paru -S 7-zip termius vscodium-bin 1password freedownloadmanager powerpill ventoy-bin ly nerd-fonts-jetbrains-mono \

#Flatpak package Install
#flatpak install flathub com.github.rafostar.Clapper

#Enable Display Manager
sudo systemctl enable ly
