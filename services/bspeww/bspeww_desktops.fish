#!/usr/bin/env fish

function action
  # parse the currently selected desktop node from wmtrl -d
  wmctrl -d | grep -F '*' | rev | cut -d ' ' -f 1 | rev
end

action

bspc subscribe desktop_focus | while read line
  action
end
