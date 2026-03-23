#!/usr/bin/env fish
#
# notify-mon

set udev_identifier $argv[1]

journalctl -f -o cat -t $udev_identifier | while read --list line
  set action (echo $udev_identifier | cut --delimiter="-" --fields=2 -)
  notify-send --urgency=normal udev "$action $line"
end
