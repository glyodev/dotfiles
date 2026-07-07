#!/bin/bash

killall -q polybar

while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

polybar -c ~/.config/polybar/config.ini emi-bar &
