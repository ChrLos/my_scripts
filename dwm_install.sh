#!/bin/sh
sudo apt install nala -y
sudo nala install xorg dwm xdm thunar alacritty pulseaudio alsamixergui lynx j4-dmenu-desktop -y

# Change Volume to 100%, Unmute it then Save it
amixer set Master 100%
amixer set PCM 100%

amixer set Master unmute
amixer set PCM unmute

sudo alsactl store