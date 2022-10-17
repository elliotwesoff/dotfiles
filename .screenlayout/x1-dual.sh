#!/bin/sh

xrandr \
  --output eDP-1 --mode 2880x1800 \
  --output DP-3 --primary --mode 2560x1440 --pos 0x0 --rotate normal --rate 120 --left-of eDP-1

