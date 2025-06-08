#!/bin/bash

if [ $(grep -cE "xrandr --output .* --mode .*" ~/.xsession || grep -cE "xrandr --output .* --mode .*" ~/.xinitrc) -gt 0 ]; then
    echo "Settings already exist"
    exit 1
fi

read -p "Type Your Display Name: " display_name
read -p "Type Your Desired Resolution: " resolution

resolution_command="xrandr --output $display_name --mode $resolution"

sed -i "1i$resolution_command" ~/.xsession
sed -i "1i$resolution_command" ~/.xinitrc #Fallback incase .xsession doesn't work