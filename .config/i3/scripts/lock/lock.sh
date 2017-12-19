#!/bin/bash

. /home/micah/.cache/wal/colors.sh
convert /home/micah/.config/i3/scripts/lock/lock.png -fuzz 50% -fill "$color4" -opaque "#30AF91" /tmp/out.png
convert /tmp/out.png -fuzz 10% -fill "$color0" -opaque "#FFFFFF" /tmp/out.png
convert /tmp/out.png -resize 256x256 /tmp/out.png

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png /tmp/out.png -gravity center -composite -matte /tmp/screen.png
i3lock -u -i /tmp/screen.png
rm /tmp/screen.png
