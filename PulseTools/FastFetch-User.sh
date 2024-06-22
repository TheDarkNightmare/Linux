#!/bin/bash

echo "[----------------------------------------------]"
echo "|                                              |"
echo "|    FastFetch - System User Configuration     |"
echo "|                                              |"
echo "| Version 1.05 - TheDarkNightmare - PulseTools |"
echo "|                                              |"
echo "[----------------------------------------------]"

# Update the package database and install CUPS (Common Unix Printing System) and Gutenprint
sudo pacman -Syu --noconfirm fastfetch

# Generate default config in ~/.config/fastfetch
fastfetch --gen-config

sleep 5

# Removing default config for new one
rm ./config.jsonc

# Check if the directory exists
if [ -d "$HOME/KWinScripts/" ]; then
    cd "$HOME/KWinScripts/"

    sleep 5

    # Downloading Files (config and image logo)
    wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
    wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png

    # Coping config file to destination
    cp config.jsonc $HOME/.config/fastfetch

    # Cleaning downloaded config form temp location.
    rm config.jsonc
    sleep 5

    # Pulling font icons from repo.
    kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf

    sleep 5

    # Pulling font icons from repo.
    kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf

    echo "Installation complete. Please check your fastfetch settings"
else
    echo "Directory $HOME/KWinScripts/ does not exist."
    read -p "Would you like to create the directory and download the files? (y/n): " choice
    if [ "$choice" = "y" ]; then
        mkdir -p "$HOME/KWinScripts/"
        cd "$HOME/KWinScripts/"

        sleep 5

        # Downloading Files (config and image logo)
        wget -O config.jsonc https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/config.jsonc
        wget -O ARC2.png https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/ARC2.png

        # Coping config file to destination
        cp config.jsonc $HOME/.config/fastfetch

        # Cleaning downloaded config form temp location.
        rm config.jsonc
        sleep 5

        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFontMono-Regular.ttf

        sleep 5
        kfontview https://raw.githubusercontent.com/TheDarkNightmare/Linux/main/PulseTools/Files/SymbolsNerdFont-Regular.ttf

        echo "Installation complete. Please check your fastfetch settings"
    else
        echo "Exiting without making changes."
        exit 1
    fi
fi
