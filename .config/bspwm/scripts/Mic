#!/bin/sh
if [ $(pactl get-source-mute @DEFAULT_SOURCE@ | grep "Mute: yes" | wc -c) -eq 0 ]
then
  echo "%{F#f7768e}"
else
  echo "%{F#7aa2f7}"
fi
