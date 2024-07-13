#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    		Multimedia Package - Arch    		 |"
echo "|                                              |"
echo "| Version 1.01 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

echo "[----------------- Core Packages ----------------]"
sudo pacman -S --noconfirm firefox discord vlc kdenlive elisa thunderbird

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

echo "[----------------- Discord Addons ----------------]"
# Install Betterdiscord for apllying new Theme and Plugins.
yay -S --noconfirm betterdiscord-installer

echo "[----------------- OBS Studio + Addons ----------------]"
# Install OBS Studio with Browser Extension + VKCapture + VAAPI - 
yay -S --noconfirm obs-studio-browser obs-vkcapture obs-vaapi obs-cmd lib32-obs-vkacapture

echo "[----------------- Video Capture Fix ----------------]"
# Install XWaylandVideoBridge for screenshare for discord and settings discord to start up as X11 TYPE SESSION 
sudo pacman -S --noconfirm xwaylandvideobridge

# Install Spotify
yay -S --noconfirm spotify

# Install codecs
echo "[----------------- Media Codecs ----------------]"
sudo pacman -S x265 x264 svt0av libmpeg2 libvpx gst-plugins-ugly gst-plugin-va 

# Image programs
sudo pacman -S gwenview gimp specacle

# Print a message indicating that the installation is complete
echo "Installation complete."
