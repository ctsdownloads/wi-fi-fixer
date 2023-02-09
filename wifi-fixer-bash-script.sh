#!/bin/bash
# Detect the active wireless interface name
interface=$(iw dev | awk '/Interface/ {print $2}')
echo "\033[1;33mThe name of your wireless interface is: $interface\033[0m \n"
# Check wireless signal strength and restart radio
signal_strength=$(iw dev $interface link | awk '/signal/ {print $2}')
if [ -z "$signal_strength" ]; then
  echo "Signal strength is not available, attempting to refresh Wi-Fi radio, NetworkManager, iwlwifi and iwlmvm modules... \n"
  nmcli radio wifi on
  sudo rfkill unblock wifi
  sudo rmmod iwlmvm iwlwifi
  sudo modprobe iwlmvm iwlwifi
  sudo systemctl restart NetworkManager
  sleep 1
  signal_strength=$(iw dev $interface link | awk '/signal/ {print $2}')
  if [ -z "$signal_strength" ]; then
    echo  "Unable to refresh Wi-Fi module, please check your configuration \n"
    if lsmod | grep iwlwifi > /dev/null; then
      echo "\033[1m AND FIXED: Ignore the rmmod an Wi-Fi module errors above. \n
      - The iwlwifi and iwlmvm modules are loaded\033[0m, but Wi-Fi should be connected or at least ready to connect. \n
      - If not, check Network settings and try reconnecting to your Wi-Fi router. \n 
      - If it's still not successful, try the Linux kernel \033[1;33mprevious to $(uname -r)\033[0m to see if that works. \n
      - Arrow up once, click enter to re-run this script to check your connection  \n"
    fi
    exit 1
  else
    echo "Signal strength is: $signal_strength dBm"
  fi
else
  echo "Signal strength is: $signal_strength dBm"
fi
# Check signal quality
signal_quality=$(nmcli d wifi list ifname $interface | grep '*' | awk '{print $9}')/100
echo "Signal quality is: $signal_quality\n"
for interface in $(iw dev | awk '$1=="Interface"{print $2}'); do echo $interface; iw dev $interface get power_save; done
# Check if connected to the right WAP, change assisgned wap to your prefered WAP where it says Your-SSID-Here.
connected_wap=$(iw dev $interface link | awk '/SSID/ {print $2}')
assigned_wap=Slower
if [ "$connected_wap" != "$assigned_wap" ]; then
  echo "\033[1;31mNot connected to the default WAP\033[00m.\n" 
  echo "\033[1mEven if you have a working connection, check your Wi-Fi settings.\033[0m \n"
  exit 1
else
  echo "\n \033[1mConnected successfully to this WAP: $connected_wap\033[0m \n"
fi
