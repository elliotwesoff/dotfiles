#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

echo "---" >> /tmp/polybar.log
polybar -r --config=$HOME/.config/polybar/config.ini main >> /tmp/polybar.log

