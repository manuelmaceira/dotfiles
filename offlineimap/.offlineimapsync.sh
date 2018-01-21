#!/bin/bash

imapserver=$(cat ~/.offlineimaprc | grep remotehost | awk '{print $3}')
imapactive=$(ps -ef | grep '/usr/bin/[o]fflineimap' | wc -l)
netactive=$(ping -c3 $imapserver > /dev/null 2>&1 && echo up || echo down)

mailsync="/usr/bin/offlineimap -u quiet -q"

case $imapactive in
'1')
  echo "killing offlineimap"
  killall offlineimap
  killall offlineimap
  killall offlineimap
;;
esac
case $netactive in
'up')
  echo "syncing mail"
  $mailsync
;;
'down')
  :
;;
esac

echo "FINISHED"
