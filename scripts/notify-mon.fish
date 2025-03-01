#!/usr/bin/env fish
#
# notify-mon.fish

set file $argv[1]

# make sure an argument was supplied
if test -z $file
  echo usage: ./notify-mon.fish /path/to/tail
  exit 1
end

tail --lines=0 -F $file | while read --list line
  notify-send --urgency=normal "$line"
end
