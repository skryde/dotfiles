#!/bin/bash

flameshot &

# Set keyboard layout...
setxkbmap -layout latam

# Start some programs
polybar --reload example &
jetbrains-toolbox --minimize &
/usr/bin/discord --start-minimized &

# Set background image
feh --no-fehbg --bg-scale "$HOME/archpixel-wall-purple.png"

