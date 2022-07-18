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
sudo pacman -Syu paru firefox gnome-keyring seahorse libsecret telegram-desktop flatpak xf86-video-intel xarchiver thunar thunar-archive-plugin noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts-emoji \
swaybg swayidle  swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad thunar geany mpv mpd mpc viewnior imagemagick xfce-polkit xorg-xwayland
paru -S 7-zip termius vscodium-bin 1password freedownloadmanager powerpill \
hyprland-bin ly wlogout

#Flatpak package Install
flatpak install flathub com.github.rafostar.Clapper

#Enable Display Manager
sudo systemctl enable ly

#Copy all configs
mkdir -p $HOME/hypr && wget https://staging.xd003.workers.dev/0:/Dumps/hyprland.tar.gz -P $HOME
tar -xzvf $HOME/hyprland.tar.gz -C $HOME/hypr && rm -rf $HOME/hyprland.tar.gz
mkdir -p ~/.config/hypr && cp -r $HOME/hypr/dotfiles/dark/* ~/.config/hypr/
mkdir -p /usr/local/share/fonts && cp -r $HOME/hypr/fonts/* /usr/local/share/fonts/
