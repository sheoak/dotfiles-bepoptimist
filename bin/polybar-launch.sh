#!/usr/bin/env bash

DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
DEFAULT_NETWORK_INTERFACE=$DEFAULT_NETWORK_INTERFACE polybar bottom &
