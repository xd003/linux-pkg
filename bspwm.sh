#!/usr/bin/env bash

#Install Pacman & Aur Packages
sudo pacman -S bspwm xdo sxhkd polybar alacritty xfce4-power-manager rofi jgmenu dunst pavucontrol exa zsh zsh-completions zsh-syntax-highlighting zsh-autosuggestions dmenu nitrogen flameshot xsetroot xprintidle
paru -S ttf-icomoon-feather xbanish

git clone https://github.com/baskerville/xqp $HOME && cd $HOME/xqp && sudo make && sudo make install && rm -rf $HOME/xqp

#If need to lock system after device sleeps
#sudo pacman -S xss-lock
