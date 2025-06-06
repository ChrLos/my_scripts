#!/bin/sh
dwmflexipatch_path="/tmp/dwm-flexipatch"
patches_url="https://raw.githubusercontent.com/ChrLos/dwm-scripts/refs/heads/main/patches"

sudo apt install nala curl -y
sudo nala install xorg dmenu xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Required Packages to Compile dwm-flexipatch
sudo nala install git make gcc libx11-dev libxft-dev libxinerama-dev -y
git clone https://github.com/bakkeby/dwm-flexipatch.git $dwmflexipatch_path

# Apply Patches
curl -fsSL $patches_url/patches.h | sudo tee $dwmflexipatch_path/patches.h > /dev/null
curl -fsSL $patches_url/config.h | sudo tee $dwmflexipatch_path/config.h > /dev/null

# Add dwm session to xdm
echo "exec dwm" > ~/.xsession
echo "exec dwm" > ~/.xinitrc #Fallback incase .xsession doesn't work

# Start Compiling
cd $dwmflexipatch_path
sudo make clean install

# Change Volume to 100%, Unmute it then Save it
amixer set Master 100%
amixer set PCM 100%

amixer set Master unmute
amixer set PCM unmute

sudo alsactl store