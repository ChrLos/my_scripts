#!/bin/bash

interfaces_found=$(ls /sys/class/net/ | grep -v "lo")
interfaces_qty=$(echo "$interfaces_found" | wc -l)

network_interface_location="/etc/network/interfaces"

if [ -z "$interfaces_found" ]; then
    echo "You don't have any interface"
    exit 1
fi

if [ $interfaces_qty -gt 1 ]; then
    read -p "Type your interface name" interfaces_found
fi

echo "" | sudo tee -a $network_interface_location > /dev/null
echo "#AUTO ADDED INTERFACE BY SCRIPT" | sudo tee -a $network_interface_location > /dev/null
echo "allow-hotplug $interfaces_found" | sudo tee -a $network_interface_location > /dev/null
echo "iface $interfaces_found inet dhcp" | sudo tee -a $network_interface_location > /dev/null