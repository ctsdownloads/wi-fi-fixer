# wi-fi-fixer Ubuntu Edition
Linux Wi-Fi script for detecting and fixing common Intel wifi issues

## (Check back periodically for updates) 


## Detects and fixes common issues with Intel wifi on GNOME environments:

- **Copy and paste twice to get this working, that's it!**
- Logic provided to be downloaded on one computer, then run on another needing the Wi-Fi fixed.
- Checks if the wifi radio is off, turns it on.
- Restarts NetworkManager if down, then fixes it by restarting NetworkManager (GNOME).
- Checks for Airplane mode. turns it off.
- Checks for Intel wifi modules, if not loaded - detects and loads them.
- NEW! Is a VPN causing problems? Checks for VPNs in case it's blocking something.
- Once setup, this little script will tell you if you're connected to the wrong Wi-Fi WAP.



## From a computer that has internet (Just copy, paste and enter - that's it!)

- Open a terminal, paste in this command:

```console
sudo apt-get install git -y > /dev/null && git clone https://github.com/ctsdownloads/wi-fi-fixer.git && cd wi-fi-fixer && chmod +x wifi-fixer-bash-script.sh && wget https://gist.githubusercontent.com/ctsdownloads/8180ae983ab1ae8b20079c9843dc0589/raw/54d7867122eda58b265a53fc98c1f202111ddb33/unpack-commands.txt -P ~/wi-fi-fixer && echo -e "\033[1;33mEnter your wifi SSID, then press Enter: \033[0m" && read ssid && [ -f wifi-fixer-bash-script.sh ] && sed -i "s/assigned_wap=.*/assigned_wap="$ssid"/" wifi-fixer-bash-script.sh && cd ~/ && echo -e "- \033[1;33mYour wi-fi-fixer is dowloaded and ready to be copied to a flash drive.\033[0m \n
- If moving this to a flash drive, copy wi-fi-fixer directory located in your /home/$USER directory to a USB flash drive. \n
- On the laptop without Wi-Fi, plugin your USB flash drive containing the wi-fi-fixer directory, copy it to the laptop's home directory that is having Wi-Fi issues. \n
- Inside the wi-fi-fixer directory, look for unpack-commands.txt - open it and copy/paste that command to fix your Wi-Fi on the laptop.\n
- Insert USB flash drive, copy the **wi-fi-fixer** directory onto the USB flash drive."
```
[![asciicast](https://asciinema.org/a/558719.svg)](https://asciinema.org/a/558719)


## From the computer that needs the Wi-Fi fixed (Just copy, paste and enter - that's it!)

- Now insert USB flash drive.
- Copy the wi-fi-fixer directory to the laptop's home directory.
- This command below is **in your wi-fi-fixer directory for non-Internet connected access**, look for unpack-commands.txt
- Open a terminal and paste in the following:

```console
cd wi-fi-fixer/ && chmod +x wifi-fixer-bash-script.sh && sh wifi-fixer-bash-script.sh
```
[![asciicast](https://asciinema.org/a/558720.svg)](https://asciinema.org/a/558720)



## Troubleshooting and questions

- Can't find NetworkManager errors? This was tested on Ubuntu GNOME. Should work on any GNOME desktop (MATE?). You can edit and replace sudo systemctl restart NetworkManager with whatever works best for your desktop environment.

- It's telling me I'm on the wrong WAP! Well, are you? If you didn't edit the file and follow step 3 above, do so.

- Can I run this on a system where the wi-fi-fixer script is already setup on? Can I even create my own laucher? Sure! To run it, just use this command:

```console
cd wi-fi-fixer/ && sh wifi-fixer-bash-script.sh
```
Note: If you choose to create a launcher, you would have it pointing to the above command.




## Examples

NEW! VPN Checks - installed, not turn on:

[![asciicast](https://asciinema.org/a/558722.svg)](https://asciinema.org/a/558722)


NEW! VPN Checks - installed and it IS turn on:

[![asciicast](https://asciinema.org/a/558723.svg)](https://asciinema.org/a/558723)


In Airplane mode:

[![asciicast](https://asciinema.org/a/557456.svg)](https://asciinema.org/a/557456)


No driver modules loaded for Intel wireless:

[![asciicast](https://asciinema.org/a/557452.svg)](https://asciinema.org/a/557452)


WiFi Connected to the wrong WAP (router):

[![asciicast](https://asciinema.org/a/557458.svg)](https://asciinema.org/a/557458)


Updated..Added Power Save Indicator (useful if unsure):

[![asciicast](https://asciinema.org/a/557462.svg)](https://asciinema.org/a/557462)


