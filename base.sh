#!/usr/bin/env bash

#Add Chaotic AUR
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && echo
echo && cat << EOF
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
echo && echo "Copy the above text & paste in /etc/pacman.conf , also uncomment parallel downloads(15) & multilib"
read -n 1 -s -r -p "Press any key to continue: "
sudo nano /etc/pacman.conf

#Install Pacman & AUR packages
sudo pacman -Syu paru firefox viewnior xdg-user-dirs gnome-keyring seahorse libsecret telegram-desktop flatpak xarchiver celluloid-git thunar thunar-archive-plugin thunar-volman gvfs \
xf86-video-intel intel-media-driver libva-intel-driver libva-utils intel-gpu-tools grub-customizer \
noise-suppression-for-voice exa bat duf zsh reflector zathura zathura-pdf-mupdf neovim \
noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts-emoji ttf-roboto papirus-icon-theme kvantum qt5ct lxappearance \
bspwm sxhkd polybar alacritty xdo xfce4-power-manager rofi jgmenu dunst pavucontrol dmenu nitrogen flameshot xorg-xsetroot xprintidle xss-lock i3lock-color maim

paru -S 7-zip termius vscodium-bin 1password freedownloadmanager ventoy-bin ly nerd-fonts-jetbrains-mono orchis-theme nextdns ttf-icomoon-feather xbanish sublime-text-4

#Start NextDNS Service
sudo nextdns install -config bd435d -report-client-info -auto-activate

#Enable Display Manager
sudo systemctl enable ly

mkdir $HOME/xqp && git clone https://github.com/baskerville/xqp $HOME/xqp && cd $HOME/xqp && sudo make && sudo make install && rm -rf $HOME/xqp
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
mkdir -p $HOME/.cache/zsh

#Flatpak package Install
#flatpak install flathub com.github.rafostar.Clapper

#Install polkit if on pure arch base
#paru -S xfce-polkit
