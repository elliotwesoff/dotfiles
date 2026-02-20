#!/usr/bin/env fish

set pid $argv[1]

while pgrep --pid $pid
  echo (date) - process $pid is still running...
  sleep 30
end

systemctl suspend
