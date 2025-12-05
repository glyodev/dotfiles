#!/bin/bash

IMG="$HOME/Pictures/Backgrounds/archwin.png"

i3lock \
  --image="$IMG" \
  --centered \
  --clock \
  --indicator \
  --time-color=ffffffff \
  --date-color=ffffffff \
  --time-size=70 \
  --date-size=25 \
  --time-font="Noto Sans" \
  --date-font="Noto Sans" \
  --time-pos="x/2:y/2-50" \
  --date-pos="x/2:y/2+20" \
  --ring-color=ffffffff \
  --inside-color=00000000 \
  --ring-width=8

