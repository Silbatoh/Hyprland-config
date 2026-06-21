#!/bin/bash
# This script will reload the graphical elements

hyprctl reload
killall waybar hyprpaper
sleep 0.1s
waybar > /dev/null 2>&1 &
hyprpaper -c /home/silbato/.config/hypr/hyprpaper.conf > /dev/null 2>&1 &
