#!/bin/sh
dwmflexipatch_path="/tmp/dwm-flexipatch"
patches_location="./patches"

sudo apt install nala -y
sudo nala install xorg dmenu xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Required Packages to Compile dwm-flexipatch
sudo nala install git make gcc libx11-dev libxft-dev libxinerama-dev -y
git clone https://github.com/bakkeby/dwm-flexipatch.git $dwmflexipatch_path

# Apply Patches
sudo cp $patches_url/patches.h $dwmflexipatch_path/patches.h
sudo cp $patches_url/config.h $dwmflexipatch_path/config.h

# Add dwm session to xdm
echo "exec dwm" > ~/.xsession
echo "exec dwm" > ~/.xinitrc #Fallback incase .xsession doesn't work

# Start Compiling
cd $dwmflexipatch_path
sudo make clean install

./set_max_volume.sh