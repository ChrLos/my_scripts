#!/bin/sh
sudo apt install nala -y
sudo nala install xorg dwm xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Set the Master volume to 100%
amixer set Master 100%