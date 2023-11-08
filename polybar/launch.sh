#!/usr/bin/env sh

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#MONITOR=eDP-1-1 polybar -c ~/.config/polybar/config.ini main &
#MONITOR=DP-1-1-1-8 polybar -c ~/.config/polybar/config.ini main &
#MONITOR=DP-1-1-1-1 polybar -c ~/.config/polybar/config.ini main &

#MONITOR=DP-1-1-3 polybar -c ~/.config/polybar/config.ini main &
#MONITOR=DP-1-1-1 polybar -c ~/.config/polybar/config.ini main &

#MONITOR=DP-1-1-8 polybar -c ~/.config/polybar/config.ini main &
#MONITOR=DP-1-1-1 polybar -c ~/.config/polybar/config.ini main &

MONITOR=DP-0.8 polybar -c ~/.config/polybar/config.ini main &
MONITOR=DP-0.1 polybar -c ~/.config/polybar/config.ini main &
MONITOR=HDMO-0 polybar -c ~/.config/polybar/config.ini main &
