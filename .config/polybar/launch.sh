#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybarstu.log
polybar polybarstu 2>&1 | tee -a /tmp/polybarstu.log & disown

echo "Bars launched..."
