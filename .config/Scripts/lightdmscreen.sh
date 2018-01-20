#!/bin/bash

left='HDMI-3'
right='HDMI-2'
laptop='LVDS-1'

if [[ ($(xrandr -q | grep $left\ con)) && ($(xrandr -q | grep $right\ con)) ]]; then
  xrandr --output $left --auto --output $right --auto --right-of $left --output $laptop --off
elif [[ $(xrandr -q | grep $left\ con) ]]; then
  xrandr --output $left --auto --output $laptop --off  --output $right --off
elif [[ $(xrandr -q | grep $right\ con) ]]; then
  xrandr --output $right --auto --output $laptop --off  --output $left --off
else
  xrandr --output $laptop --auto --output $left --off  --output $right --off
fi
exit 0;
