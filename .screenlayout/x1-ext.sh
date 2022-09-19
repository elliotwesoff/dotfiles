#!/bin/sh

if [[ $(xrandr -q | grep -w "DP-3 connected") ]]
then
  xrandr \
    --output eDP-1 --off \
    --output DP-3 --mode 2560x1440 --rate 100
fi

