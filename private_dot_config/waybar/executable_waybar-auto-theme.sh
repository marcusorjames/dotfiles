#!/bin/bash

WAYBAR="$HOME/.config/waybar"
OVERRIDE="$WAYBAR/style-override.css"
LIGHT="$WAYBAR/style-light-override.css"

# Omarchy current wallpaper
WALLPAPER="$HOME/.config/omarchy/current/background"

[ ! -f "$WALLPAPER" ] && exit 0

# Get average brightness (0–1)
BRIGHTNESS=$(magick "$WALLPAPER" -colorspace Gray -resize 1x1 txt:- \
  | awk -F'[(),]' 'NR==2 {print $2}')

THRESHOLD=0.5

# Compare using awk instead of bc
awk -v b="$BRIGHTNESS" -v t="$THRESHOLD" '
  BEGIN {
    if (b > t) exit 10;
    else exit 20;
  }
'

case $? in
  10) cp "$LIGHT" "$OVERRIDE" ;;   # light wallpaper
  20) : > "$OVERRIDE" ;;           # dark wallpaper
esac

# Reload Waybar safely
WAYBAR_PID=$(pgrep -x waybar)
if [ -n "$WAYBAR_PID" ]; then
    kill -SIGUSR2 "$WAYBAR_PID"
fi
