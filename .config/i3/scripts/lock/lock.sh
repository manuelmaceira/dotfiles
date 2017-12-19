#!/bin/bash

. /home/micah/.cache/wal/colors.sh
convert /home/micah/.config/i3/scripts/lock/lock.png -fuzz 50% -fill "$color4" -opaque "#30AF91" /tmp/lock.png
convert /tmp/lock.png -fuzz 10% -fill "$color0" -opaque "#FFFFFF" /tmp/lock.png
convert /tmp/lock.png -resize 256x256 /tmp/lock.png

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png /tmp/lock.png -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png /tmp/lock.png
