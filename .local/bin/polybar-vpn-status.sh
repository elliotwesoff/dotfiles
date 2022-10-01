#!/bin/sh
#
# polybar-vpn-status.sh

if [[ $(expressvpn status) =~ "Connected to" ]]
then
  # dissect the output of expressvpn status:
  # only take the first line and get rid of
  # everything up until the third column - the
  # name of the connected VPN location.
  echo VPN: $(expressvpn status | head -n 1 | cut -d' ' -f3-)
else
  echo
fi

