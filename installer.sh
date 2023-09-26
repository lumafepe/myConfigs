#!/bin/bash

# Check if yay is installed, if not, install it
if ! command -v yay &> /dev/null; then
    echo "yay is not installed. Installing yay..."

    # Clone the yay repository
    git clone https://aur.archlinux.org/yay.git /tmp/yay

    # Navigate to the yay directory
    cd /tmp/yay

    # Build and install yay
    makepkg -si

    # Clean up
    rm -rf /tmp/yay
fi

# Path to the input file
input_file="packages.txt"

# Check if the file exists
if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

# Construct a string with all package names
packages=$(awk '{print $1}' "$input_file" | tr '\n' ' ')

# Install all packages using yay
yay -S $packages

# Move files from 'config' folder to ~/.config/
config_folder="config"
if [ -d "$config_folder" ]; then
    mv "$config_folder"/* ~/.config/
    echo "Moved files from '$config_folder' to ~/.config/"
    chmod +x ~/.config/polybar/scripts/info-softwarecounter.py
    echo "Granted execute permission to ~/.config/polybar/scripts/info-softwarecounter.py"
else
    echo "Directory '$config_folder' not found."
fi
