#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    Cannon MG4250 Printer Drivers Install     |"
echo "|                                              |"
echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

# Check if paru is installed
if ! command -v paru &> /dev/null
then
    echo "paru is not installed. Installing paru..."
    # Install paru if not installed - First Base package dev.
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
fi

# Update the package database and install CUPS (Common Unix Printing System) and Gutenprint
sudo pacman -Syu --noconfirm cups gutenprint

# Install the cups-bjnp package for network printing support for Canon printers
paru -S --noconfirm cups-bjnp

# Enable and start the CUPS service
sudo systemctl enable --now cups

# Print a message indicating that the installation is complete
echo "Installation complete. Please add your printer via KDE Printer Settings"
