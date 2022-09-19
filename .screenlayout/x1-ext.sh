#!/bin/sh

# --output eDP-1 --off \
xrandr \
  --output eDP-1 --mode 2880x1800 --dpi 192 \
  --output DP-3 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 100 --left-of eDP-1

