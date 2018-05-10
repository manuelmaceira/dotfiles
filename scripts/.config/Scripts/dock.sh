#!/bin/sh -e

# Save this file as /etc/sbin/thinkpad-dock.sh

# NB: you will need to modify the username and tweak the xrandr
# commands to suit your setup.

# wait for the dock state to change
sleep 0.5

username=micah

if [[ "$ACTION" == "add" ]]; then
  DOCKED=1
  logger -t DOCKING "Detected condition: docked"
elif [[ "$ACTION" == "remove" ]]; then
  DOCKED=0
  logger -t DOCKING "Detected condition: un-docked"
else
  logger -t DOCKING "Detected condition: unknown"
  echo Please set env var \$ACTION to 'add' or 'remove'
  exit 1
fi

# invoke from XSetup with NO_KDM_REBOOT otherwise you'll end up in a KDM reboot loop
NO_KDM_REBOOT=0
for p in $*; do
  case "$p" in
  "NO_KDM_REBOOT") NO_KDM_REBOOT=1 ;;
  "SWITCH_TO_LOCAL") DOCKED=0 ;;
  esac
done


export DISPLAY=:0
su $username -c '/home/micah/.config/Scripts/screen.sh -r HDMI-2 HDMI-3'
