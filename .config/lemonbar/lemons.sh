#!/bin/sh
#
# ~/dotfiles/.config/lemonbar/lemons.sh

clock() {
  date +%H:%M:%S
}

battery() {
  capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
  status="$(cat /sys/class/power_supply/BAT0/status)"
  if [ $status = "Charging" ]; then
    echo $capacity% ch!
  else
    echo $capacity%
  fi
}

cpu_temp() {
  # who did this madness? not me...
  # average the cpu temp values from all cores.
  sensors | awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}'
}

volume() {
  amixer sget Master | awk '/Front Left:/{ print substr($5, 2, 3) }'
}

backlight() {
  b="$(cat /sys/class/backlight/intel_backlight/brightness)"
  max_b="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
  awk -v b=$b -v max_b=$max_b 'BEGIN { printf "%.2f", ((b/ max_b) * 100) }'
}

while true; do
  # BAR_INPUT="%{c}TIME: $(clock) %{r}TEMP: $(cpu_temp)C // LIFE: $(battery)%"
  BAR_INPUT="%{l}vol $(volume) | light $(backlight)% %{c}$(clock) %{r}$(cpu_temp)C // $(battery)"
  echo $BAR_INPUT
  sleep 1
done
