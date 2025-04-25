#!/bin/sh
sudo apt install nala -y
sudo nala install xorg dmenu xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Required Packages to Compile dwm-flexipatch
sudo nala install git make gcc libx11-dev libxft-dev libxinerama-dev -y
git clone https://github.com/bakkeby/dwm-flexipatch.git ~/dwm-flexipatch

# Apply Patches
curl -fsSL https://raw.githubusercontent.com/ChrLos/my_scripts/refs/heads/main/patches/patches.h > ~/dwm-flexipatch/patches.h
curl -fsSL https://raw.githubusercontent.com/ChrLos/my_scripts/refs/heads/main/patches/config.h > ~/dwm-flexipatch/config.h

# Add dwm session to xdm
echo "exec dwm" > ~/.xsession

# Start Compiling
cd ~/dwm-flexipatch
sudo make clean install