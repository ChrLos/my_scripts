#!/bin/sh

sudo apt install nala -y
sudo nala install xorg dwm xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

./set_max_volume.sh