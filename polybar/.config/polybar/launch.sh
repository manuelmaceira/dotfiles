#!/bin/bash

killall -q -9 polybar

while pgrep -x polybar >/dev/null; do sleep 0.01; done

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar top-bar & done
