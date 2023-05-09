# bspc notes for eww project

## events

bspwm and bspc communicate over a socket in /tmp. See the man
pages for details on the file.

Alternatively (probably better), we can subscribe to events
directly via bspc. For example, to subscribe to events like
adding and removal of nodes, use `bspc subscribe node`.
