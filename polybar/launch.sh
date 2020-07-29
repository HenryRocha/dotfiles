#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main -c /home/henryrocha/.config/polybar/mainMonitor.conf &
polybar main -c /home/henryrocha/.config/polybar/externalMonitor.conf &
