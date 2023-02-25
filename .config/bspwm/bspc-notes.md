# bspc notes for eww project

## events

bspwm and bspc communicate over a socket in /tmp. See the man
pages for details on the file.

Alternatively (probably better), we can subscribe to events
directly via bspc. For example, to subscribe to events like
adding and removal of nodes, use `bspc subscribe node`.

## state

The entire working state of bspwm can be dumped to a json file
using `bspc wm -d > bspwm-state.json`

A working state of bspwm can be restored using `bspc wm
--load-state <file_path>`. Investigate the --adopt-orphans
option, it might be necessary for state restoration.

