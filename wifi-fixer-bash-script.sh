#!/bin/bash

# Detect the active wireless interface name
interface=$(iw dev | awk '/Interface/ {print $2}')

echo "The name of your wireless interface is: $interface"

# Check wireless signal strength and restart radio
signal_strength=$(iw dev $interface link | awk '/signal/ {print $2}')
if [ -z "$signal_strength" ]; then
  echo "Signal strength is not available, attempting to refresh Wi-Fi radio, NetworkManager, iwlwifi and iwlmvm modules...\n\n"
  nmcli radio wifi on
  sudo rfkill unblock wifi
  sudo rmmod iwlmvm iwlwifi
  sudo modprobe iwlmvm iwlwifi
  sudo systemctl restart NetworkManager
  sleep 5
  signal_strength=$(iw dev $interface link | awk '/signal/ {print $2}')
  if [ -z "$signal_strength" ]; then
    echo  "Unable to refresh Wi-Fi module, please check your configuration\n\n"
    if lsmod | grep iwlwifi > /dev/null; then
      echo "The \033[1miwlwifi and iwlmvm modules are loaded\033[0m, but Wi-Fi should be connected or at least ready to connect. If not, check Network settings and try reconnecting to your Wi-Fi router. If it's still not successful, try the Linux kernel \033[1mprevious to $(uname -r)\033[0m to see if that works.\n\n"
    fi
    exit 1
  else
    echo "Signal strength is: $signal_strength dBm"
  fi
else
  echo "Signal strength is: $signal_strength dBm"
fi

# Check signal quality
signal_quality=$(iwconfig $interface | awk '/Quality/ {print $2}' | cut -d= -f2)
echo "Signal quality is: $signal_quality\n\n"

for interface in $(iw dev | awk '$1=="Interface"{print $2}'); do echo $interface; iw dev $interface get power_save; done

# Check if connected to the right WAP, change assisgned wap to your prefered WAP where it says Your-SSID-Here.
connected_wap=$(iw dev $interface link | awk '/SSID/ {print $2}')
assigned_wap="Your-SSID-Here"
if [ "$connected_wap" != "$assigned_wap" ]; then
  echo "\033[1;31mNot connected to the default WAP\033[00m.\n\n" 
  echo "\033[1mEven if you have a working connection, check your Wi-Fi settings.\033[0m\n\n"
  exit 1
else
  echo "\n\n\033[1mConnected successfully to this WAP: $connected_wap\033[0m"
fi


