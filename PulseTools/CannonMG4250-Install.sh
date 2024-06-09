 
#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    Cannon MG4250 Printer Drivers Install     |"
echo "|                                              |"
echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

# Update the package database and install CUPS (Common Unix Printing System) and Gutenprint
sudo pacman -Syu --noconfirm cups gutenprint

# Install the cups-bjnp package for network printing support for Canon printers
paru -S --noconfirm cups-bjnp

# Enable and start the CUPS service
sudo systemctl enable --now cups

# Print a message indicating that the installation is complete
echo "Installation complete. Please add your printer via KDE Printer Settings"

