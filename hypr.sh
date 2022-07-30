#!/usr/bin/env bash

#Install Pacman & Aur Packages
sudo pacman -Syu swaybg swayidle  swaylock wlroots wl-clipboard waybar wofi foot mako grim slurp wf-recorder light yad mpv mpd mpc viewnior imagemagick xorg-xwayland qt5-wayland
paru -S hyprland-bin xfce-polkit

#Clean config directory
sudo rm -rf $HOME/.config/hypr

#Copy all configs
mkdir -p $HOME/hypr && wget https://staging.xd003.workers.dev/0:/Dumps/hyprland.tar.gz -P $HOME
tar -xzvf $HOME/hyprland.tar.gz -C $HOME/hypr && rm -rf $HOME/hyprland.tar.gz
mkdir -p ~/.config/hypr && cp -r $HOME/hypr/dotfiles/dark/* ~/.config/hypr/
sudo mkdir -p /usr/local/share/fonts && sudo cp -r $HOME/hypr/fonts/* /usr/local/share/fonts/ && sudo fc-cache -fv
sudo mkdir -p /usr/share/themes && sudo cp -r $HOME/hypr/gtk/theme/* /usr/share/themes/
sudo mkdir -p /usr/share/icons && sudo cp -r $HOME/hypr/gtk/icons/* /usr/share/icons/
sudo cp -r $HOME/hypr/gtk/cursor/* /usr/share/icons/
