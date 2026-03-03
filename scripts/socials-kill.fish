#!/usr/bin/env fish
#
# socials-kill.fish

pkill --echo --ignore-case Discord

echo waiting for discord to terminate

while pgrep -i discord
  echo waiting...
  sleep 1
end

notify-send "pkill" "discord killed"
