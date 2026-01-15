#!/bin/bash
# Path to your wallpaper folder
DIR="$home/pavan/Wallpapers"

# Pick a random image from the folder
PICS=($(find "$DIR" -type f \( -name "*.jpg" -name "*.png" -name "*.gif" -name "*.jpeg" \)))
RANDOM_PIC=${PICS[RANDOM % ${#PICS[@]}]}

# Set the wallpaper with a smooth transition
swww img "$RANDOM_PIC" --transition-type grow --transition-duration 1.5