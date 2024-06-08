 
#!/bin/bash

echo "[    FastFetch - System User Configuration    ]"
echo "[ Version 1.01 - TheDarkNightmare - PulseTools ]"

# Update the package database and install CUPS (Common Unix Printing System) and Gutenprint
sudo pacman -Syu --noconfirm fastfetch

fastfetch --gen-config

cd ~/.config/fastfetch/

wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc

# Print a message indicating that the installation is complete
echo "Installation complete. Please check your fastfetch settings"

