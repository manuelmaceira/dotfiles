#!/bin/bash

. /home/micah/.cache/wal/colors.sh
convert /home/micah/.config/i3/scripts/lock/lock.png -fuzz 50% -fill "$color4" -opaque "#30AF91" /tmp/lock.png
convert /tmp/lock.png -fuzz 10% -fill "$color0" -opaque "#FFFFFF" /tmp/lock.png
convert /tmp/lock.png -resize 256x256 /tmp/lock.png

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
convert /tmp/screen.png /tmp/lock.png -gravity center -composite -matte /tmp/screen.png

i3lock -i /tmp/screen.png \
  --radius=125 --ring-width=6 \
  --insidecolor=00000000 --line-uses-inside \
  --insidevercolor=00000000 --veriftext="" \
  --insidewrongcolor=00000000 --wrongtext="" \
  --ringcolor=${color4:1:6}ff \
  --separatorcolor=${color4:1:6}ff \
  --keyhlcolor=${color0:1:6}ff \
  --bshlcolor=${color0:1:6}ff \
  --ringvercolor=${color0:1:6}ff \
  --ringwrongcolor=${color2:1:6}ff \

rm /tmp/screen.png /tmp/lock.png
