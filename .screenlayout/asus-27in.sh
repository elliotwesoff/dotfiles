#!/bin/sh
#
# asus-27in.sh

  # --output DP-1 --primary --mode 2560x1440 --rate "144.01" \
xrandr \
  --dpi 120 \
  --output eDP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-1 --off \
  --output DP-4 --primary --mode 2560x1440 --rate "144.01"
