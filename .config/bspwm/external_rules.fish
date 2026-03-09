#!/usr/bin/env fish
# vi: set ts=2 sts=2 sw=2:
# requires https://github.com/baskerville/xwinfo

set wid $argv[1]
set class $argv[2]
set instance $argv[3]
set consequences $argv[4]

# eval $consequences # wat

notify-send $consequences

# echo "$(date): external_rules invocation - wid: $wid, class: $class, instance: $instance, consequences: $consequences, win_name: $win_name, win_role: $win_role" >> /dev/shm/external_rules.log

switch "$class"
  case firefox
    switch "$instance"
      case firefox
        switch (xwinfo -t $wid)
          case dialog
            printf 'state=floating\n'
          case '*'
            printf 'state=pseudo_tiled\n'
        end
    end
  case Alacritty
    switch "$instance"
      case {pulsemixer,ranger,btop}
        printf 'state=floating\n'
      case '*'
        printf 'state=pseudo_tiled\n'
    end
  case Calendar
    switch "$instance"
      case '*'
        printf 'state=floating\n'
    end
