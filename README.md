# wii-fi-fixer
Linux Wi-Fi script for detecting and fixing common Intel wifi issues


## Detects and fixes:

- If the wifi radio is off.
- Restarts NetworkManager (tested on Ubuntu/GNOME).
- Airplane mode.
- If modules are not loaded - detects and load them.

## Examples

In Airport mode:
[![asciicast](https://asciinema.org/a/557456.svg)](https://asciinema.org/a/557456)

No driver modules loaded for Intel wireless:
[![asciicast](https://asciinema.org/a/557452.svg)](https://asciinema.org/a/557452)

WiFi Connected to the wrong WAP (router):
[![asciicast](https://asciinema.org/a/557458.svg)](https://asciinema.org/a/557458)

Updated..Added Power Save Indicator (useful if unsure):
[![asciicast](https://asciinema.org/a/557462.svg)](https://asciinema.org/a/557462)


## Install

- git clone https://github.com/ctsdownloads/wii-fi-fixer.git

- cd to wii-fi-fixer

- chmod +x wifi-fixer-bash-script.sh

- Open wifi-fixer-bash-script.sh in a text editor, locate 
assigned_wap="Your-SSID-Here"
Change the SSID to the name of your WiFi access point. Save the file, close the text editor.

- (In a terminal still) 
sh wifi-fixer-bash-script.sh

- Profit, it's all set and it does the heavy lifting for you from here.
