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
sudo pacman -Syu --noconfirm paru firefox viewnior xdg-user-dirs xdg-utils gnome-keyring seahorse libsecret telegram-desktop flatpak xarchiver celluloid-git thunar thunar-archive-plugin thunar-volman gvfs ranger \
libva-utils intel-gpu-tools grub-customizer \
noise-suppression-for-voice exa bat duf unzip zsh reflector zathura zathura-pdf-mupdf neovim wget aria2 fd ffmpeg plocate \
noto-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts-emoji papirus-icon-theme kvantum qt5ct lxappearance \
bspwm sxhkd polybar light libxcb libpulse libnl alacritty xdo xfce4-power-manager rofi jgmenu dunst pavucontrol dmenu nitrogen flameshot xorg-xsetroot xprintidle maim python-gobject neofetch mpv fontconfig freetype2 xorg-mkfontscale xorg-mkfontdir xf86-input-libinput

paru -S 7-zip termius vscodium-bin 1password freedownloadmanager ventoy-bin ly nerd-fonts-jetbrains-mono orchis-theme nextdns ttf-icomoon-feather xbanish anydesk-bin touchegg betterlockscreen xtitle ttf-ms-fonts devour ksuperkey
#Start NextDNS Service
sudo nextdns install -config 9897ea -report-client-info -auto-activate

#Enable Systemd Services
sudo systemctl enable ly
sudo systemctl enable touchegg.service
systemctl enable betterlockscreen@xd003

mkdir $HOME/xqp && git clone https://github.com/baskerville/xqp $HOME/xqp && cd $HOME/xqp && sudo make && sudo make install && rm -rf $HOME/xqp
betterlockscreen -u /home/xd003/Pictures/Wallpapers/forest.png
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
mkdir -p $HOME/.cache/zsh
sudo updatedb
