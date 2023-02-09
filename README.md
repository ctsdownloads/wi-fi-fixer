# wi-fi-fixer
Linux Wi-Fi script for detecting and fixing common Intel wifi issues

## (Check back periodically for updates) 


## Detects and fixes common issues with Intel wifi on GNOME environments:

- Logic provided to be downloaded on one computer, then run onto another.
- Checks if the wifi radio is off, turns it on.
- Restarts NetworkManager if down, then fixes it by restarting NetworkManager (GNOME).
- Checks for Airplane mode. turns it off.
- Checks for Intel wifi modules, if not loaded - detects and loads them.
- Once setup, this little script will tell you if you're connected to the wrong Wi-Fi WAP.




## Examples

In Airplane mode:
[![asciicast](https://asciinema.org/a/557456.svg)](https://asciinema.org/a/557456)

No driver modules loaded for Intel wireless:
[![asciicast](https://asciinema.org/a/557452.svg)](https://asciinema.org/a/557452)

WiFi Connected to the wrong WAP (router):
[![asciicast](https://asciinema.org/a/557458.svg)](https://asciinema.org/a/557458)

Updated..Added Power Save Indicator (useful if unsure):
[![asciicast](https://asciinema.org/a/557462.svg)](https://asciinema.org/a/557462)


## From a computer that has internet (Just copy, paste and enter - that's it!)

- Open a terminal.
- Copy/paste/enter key with the code below.
- Follow the instructions that appear on your screen.

    sudo apt-get install git -y > /dev/null && git clone https://github.com/ctsdownloads/wi-fi-fixer.git && cd wi-fi-fixer && chmod +x wifi-fixer-bash-script.sh && wget https://gist.githubusercontent.com/ctsdownloads/41188544c0b47fb1ed87abddff065245/raw/52dceae3c33093ad51e2898a3bcc092122d9ebc5/unpack-commands.txt -P ~/wi-fi-fixer && echo -e "\033[1;33mEnter your wifi SSID, then press Enter: \033[0m" && read ssid && [ -f wifi-fixer-bash-script.sh ] && sed -i "s/assigned_wap=.*/assigned_wap="$ssid"/" wifi-fixer-bash-script.sh && cd ~/ && tar -czvf wi-fi-fixer.tar.gz wi-fi-fixer/* > /dev/null && sleep 2 && rm -rf wi-fi-fixer && echo -e "- \033[1;33mYour wi-fi-fixer is packed and ready to be copied to a flash drive.\033[0m \n
    - Copy wi-fi-fixer.tar.gz located in your /home/$USER directory to a USB flash drive. \n
    - On the laptop without Wi-Fi, plugin your USB flash drive containing wi-fi-fixer.tar.gz, copy it to the laptop's home directory. \n
    - Right click and extract this wi-fi-fixer.tar.gz to your home directory. \n
    - Inside the wi-fi-fixer directory, look for unpack-commands.txt - open it and copy/paste that command to fix your Wi-Fi on the laptop.\n"


## From the computer that needs the Wi-Fi fixed (Just copy, paste and enter - that's it!)

- Insert USB flash drive with your newly created/customized wi-fi-fixer.tar.gz file.
- Copy it to the laptop's home directory that you would like to have Wi-Fi fixed on.
- Right click, extract, **read the unpack-commands.txt file that has the code to be run.**




## Troubleshooting

- Can't find NetworkManager errors? This was tested on Ubuntu GNOME. Should work on any GNOME desktop (MATE?). You can edit and replace sudo systemctl restart NetworkManager with whatever works best for your desktop environment.

- It's telling me I'm on the wrong WAP! Well, are you? If you didn't edit the file and follow step 3 above, do so.
