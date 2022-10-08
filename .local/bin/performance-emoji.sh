#!/bin/sh
#
# performance-emoji.sh

POWER_PROF=$(cat /sys/firmware/acpi/platform_profile)

if [[ $POWER_PROF =~  performance ]]
then
  echo 🐆
elif [[ $POWER_PROF =~ balanced ]]
then
  echo 🐔
elif [[ $POWER_PROF =~ low ]]
then
  echo 🐢
else
  echo 🤷
fi

