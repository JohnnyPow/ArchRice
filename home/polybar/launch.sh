#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 0.05; done

# Launch bar1 and bar2
#polybar example &

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar mybar -c ~/.rice/home/polybar/config & done
feh --bg-fill ~/.config/wall.png

echo "Bars launched..."
