#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

while true; do
    datetime="$( date +"%F %F" )"
    xsetroot -name "$datetime"
    sleep 1m
done &
exec dwm
