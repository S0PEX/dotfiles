#!/bin/sh

BAR="polybar"
MISC="feh st pcmanfm stow slock xorg-xsetroot lxappearance-gtk3"
LAUNCHER="rofi"
COMPOSER="picom"
NOTIFICATION="dunst"
WINDOW_MANAGER="bspwm sxhkd"

# Install required packages
sudo pacman -S $BAR $MISC $LAUNCHER $COMPOSER $NOTIFICATION $WINDOW_MANAGER

# Link this repo directories to $HOME/.config
echo "Linking basic configuration"
stow default

echo "Done."