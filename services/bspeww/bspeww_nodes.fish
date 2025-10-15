#!/usr/bin/env fish

bspc subscribe node_add node_remove node_transfer | while read line
  # dump the bspwm world state and pipe it to jq. recursively grab all node
  # names (open programs) for each desktop, concatenate them, assign them
  # to an array, and do that for all desktops. finally, lowercase everything
  # for scene creds.
  bspc wm -d \
    | jq -c '.monitors[].desktops[] | .root // {} | [.[] | recurse | select(.className?) | .className]' \
    | jq -c -s . \
    | tr '[:upper:]' '[:lower:]'
end
