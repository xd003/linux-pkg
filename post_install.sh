#!/usr/bin/env bash

# Install pkg

#Start NextDNS Service
sudo nextdns install -config 9897ea -report-client-info -auto-activate

#Enable Systemd Services
sudo systemctl enable ly
sudo systemctl enable touchegg.service
systemctl enable betterlockscreen@xd003
sudo systemctl enable systemd-oomd
sudo systemctl enable auto-cpufreq

mkdir $HOME/xqp && git clone https://github.com/baskerville/xqp $HOME/xqp && cd $HOME/xqp && sudo make && sudo make install && rm -rf $HOME/xqp
## wget WALLS_URL && betterlockscreen -u /home/xd003/Pictures/Wallpapers/forest.png
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
mkdir -p $HOME/.cache/zsh
sudo updatedb
