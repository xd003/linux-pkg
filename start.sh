#!/usr/bin/env bash

# Add Chaotic AUR
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

# Install Zinit, Neovim & Create cache dir
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
rm -rf ~/.local/share/nvim && git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
mkdir -p $HOME/.cache/zsh

# Install Packages
cat << EOF
┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉
┋1) BSPWM (XORG)
┋┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉
┋2) HYPRLAND (WAYLAND)
┋┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉
EOF
echo
read -e -p "Enter your input : " opt
echo

paru -S $(cat common.txt) && 
sudo systemctl enable ly &&
sudo systemctl enable systemd-oomd &&

case $opt in
1)
  paru -S $(cat bspwm.txt) && 
  sudo systemctl enable touchegg.service &&
  mkdir $HOME/xqp && git clone https://github.com/baskerville/xqp $HOME/xqp && cd $HOME/xqp && sudo make && sudo make install && rm -rf $HOME/xqp &&
  systemctl enable betterlockscreen@xd003
  ;;
2)
  paru -S $(cat hyprland.txt)
  ;;
esac

# Update database for locate command
sudo updatedb
