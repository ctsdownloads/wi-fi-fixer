#!/bin/bash

# Detect if the OS is Ubuntu or Fedora
if [ -f /etc/fedora-release ]; then
    PM="dnf"
elif [ -f /etc/lsb-release ] && grep -qi 'ubuntu' /etc/lsb-release; then
    PM="apt"
else
    echo "Unsupported OS. Please use Ubuntu or Fedora."
    exit 1
fi

# Install necessary packages
if [ "$PM" = "dnf" ]; then
    sudo dnf install -y iw nmcli > /dev/null
elif [ "$PM" = "apt" ]; then
    sudo apt update && sudo apt install -y iw nmcli > /dev/null
fi

# Check for Mediatek MT7921e
WIFI_DEVICE=$(lspci | grep -i 'mt7921e' || lsusb | grep -i 'mediatek')
if [ -n "$WIFI_DEVICE" ]; then
    echo "Mediatek MT7921e Wi-Fi detected."
else
    echo "No Mediatek MT7921e Wi-Fi detected."
fi

# Start fixing Wi-Fi connection
echo -e "\033[1;33mFixing Wi-Fi connection for your system...\033[0m"
assigned_wap=""

# Check if SSID is assigned, otherwise prompt user to enter SSID
if [ -z "$assigned_wap" ]; then
    echo -e "\033[1;33mEnter your Wi-Fi SSID, then press Enter: \033[0m"
    read assigned_wap
fi

# Connect to the Wi-Fi network
nmcli d wifi connect "$assigned_wap" password "your_wifi_password"

if [ $? -eq 0 ]; then
    echo -e "\033[1;32mSuccessfully connected to $assigned_wap.\033[0m"
else
    echo -e "\033[1;31mFailed to connect to $assigned_wap. Please check your SSID and password.\033[0m"
fi

# End of script
