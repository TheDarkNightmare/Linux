#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    		Game Ready Packages - Arch    		 |"
echo "|                                              |"
echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

echo "[----------------- Core Packages ----------------]"
# Install Steam Client  
sudo pacman -S --noconfirm steam lutris

# Check if yay is installed
if ! command -v yay &> /dev/null
then
    echo "[----------------- System Checking ----------------]"
    echo "yay is not installed. Installing yay ..."
    # Install paru if not installed - First Base package dev.
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ..
    rm -rf yay
fi

echo "[----------------- ProtonUP-QT ----------------]"
yay -S --noconfirm protonup-qt

echo "[----------------- Vulkan Game Monitor Statistics  ----------------]"
# Install MangoHud for 64 lib + 32 lib + Goverlay Settings
yay -S --noconfirm goverlay mangohud lib32-mangohud 

echo "[----------------- Bottles GUI Container ----------------]"
# Install Bottles Container for Linux Games and Programs.
yay -S --noconfirm bottles

# Install Custom Wine TKG
echo "[----------------- WineTKG ----------------]"
git clone https://github.com/Frogging-Family/wine-tkg-git
cd wine-tkg-git
cd wine-tkg-git

echo "[----------------- Compiling Wine TKG  ----------------]"
makepkg -si --noconfirm


# Print a message indicating that the installation is complete
echo "Installation complete."
