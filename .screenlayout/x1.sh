#!/bin/sh
# 
# x1.sh

# xrandr --output eDP-1 --mode 2880x1800 --pos 2560x327 --rotate normal --dpi 192 \
# --output DP-3 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 100 \
xrandr \
  --output eDP-1 --mode 1920x1200 \
  --output HDMI-1 --off \
  --output DP-1 --off \
  --output DP-2 --off \
  --output DP-3 --off \
  --output DP-4 --off

