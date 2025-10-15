#!/usr/bin/env fish

bspc subscribe desktop_focus | while read line
  # parse the currently selected desktop node from wmtrl -d
  wmctrl -d | grep -F '*' | rev | cut -d ' ' -f 1 | rev
end
