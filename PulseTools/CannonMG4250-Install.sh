#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    Cannon MG4250 Printer Drivers Install     |"
echo "|                                              |"
echo "| Version 1.03 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

# Check if yay is installed
if ! command -v yay &> /dev/null
then
    echo "yay is not installed. Installing yay..."
    # Install yay if not installed - First Base package dev.
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

# Update the package database and install CUPS (Common Unix Printing System) and Gutenprint
sudo pacman -Syu --noconfirm cups gutenprint

# Install the cups-bjnp package for network printing support for Canon printers
yay -S --noconfirm cups-bjnp

# Enable and start the CUPS service
sudo systemctl enable --now cups

# Print a message indicating that the installation is complete
echo "Installation complete. Please add your printer via KDE Printer Settings"
