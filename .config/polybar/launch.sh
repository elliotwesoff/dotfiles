#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

echo "--- starting polybar ---" >> /tmp/polybar.log
date >> /tmp/polybar.log

polybar -r --config=$HOME/.config/polybar/config.ini main >> /tmp/polybar.log & disown
polybar -r --config=$HOME/.config/polybar/config.ini pcstats >> /tmp/polybar.log & disown

