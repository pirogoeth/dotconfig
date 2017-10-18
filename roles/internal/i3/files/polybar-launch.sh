#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Find available monitors
declare -a monitors
monitors=( $(xrandr -q | grep " connected " | cut -d ' ' -f1 | xargs echo) )

# Launch bars
for (( i=0; $i<${#monitors[@]}; i++ ))
do
    monitor="${monitors[$i]}"
    if [[ -f "${HOME}/.config/polybar/config-${monitor}" ]] ; then
        logger -t i3-polybar "Launching polybar for ${monitor}"
        polybar --config="${HOME}/.config/polybar/config-${monitor}" main 2>&1 1>/tmp/polybar-${monitor}.log &
    else
        logger -t i3-polybar "No polybar config found for ${monitor}"
    fi
done

logger -t i3-polybar "Bars launched..."
