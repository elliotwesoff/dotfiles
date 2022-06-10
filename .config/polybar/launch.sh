#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar --config=~/.config/polybar/config.ini main 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar --config=~/.config/polybar/config.ini left 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar --config=~/.config/polybar/config.ini right 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."

