#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    		Multimedia Package - Arch    		 |"
echo "|                                              |"
echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

echo "[----------------- Core Packages ----------------]"
sudo pacman -S --noconfirm firefox discord vlc kdenlive elisa

echo "[----------------- Discord Addons ----------------]"
paru -S --noconfirm betterdiscord-installer

# Check if paru is installed
if ! command -v paru &> /dev/null
then
    echo "[----------------- System Checking ----------------]"
    echo "paru is not installed. Installing paru..."
    # Install paru if not installed - First Base package dev.
    sudo pacman -S --needed --noconfirm base-devel
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm
    cd ..
    rm -rf paru
fi

echo "[----------------- OBS Studio + Addons ----------------]"
# Install OBS Studio with Browser Extension + VKCapture + VAAPI - 
paru -S --noconfirm obs-studio-rc obs-vkcapture obs-vaapi
# Install Spotify
paru -S --noconfirm spotify

# Install codecs
echo "[----------------- Media Codecs ----------------]"
sudo pacman -S x265 x264 svt0av libmpeg2 libvpx gst-plugins-ugly gst-plugin-va 

# Image programs
sudo pacman -S gwenview gimp specacle

# Print a message indicating that the installation is complete
echo "Installation complete. Please add your printer via KDE Printer Settings"
