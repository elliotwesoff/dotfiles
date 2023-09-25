#!/bin/sh
xrandr \
  --dpi 120 \
  --output eDP-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --primary --mode 3440x1440
