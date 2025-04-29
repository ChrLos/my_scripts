#!/bin/sh
sudo apt install nala -y
sudo nala install xorg dmenu xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Required Packages to Compile dwm-flexipatch
sudo nala install git make gcc libx11-dev libxft-dev libxinerama-dev -y
git clone https://github.com/bakkeby/dwm-flexipatch.git ~/dwm-flexipatch

# Apply Patches
curl -fsS https://raw.githubusercontent.com/ChrLos/my_scripts/refs/heads/main/patches/patches.h | sudo tee ~/dwm-flexipatch/patches.h > /dev/null
curl -fsS https://raw.githubusercontent.com/ChrLos/my_scripts/refs/heads/main/patches/config.h | sudo tee ~/dwm-flexipatch/config.h > /dev/null

# Add dwm session to xdm
echo "exec dwm" > ~/.xsession

# Start Compiling
cd ~/dwm-flexipatch
sudo make clean install

# Set the Master volume to 100%
amixer set Master 100%