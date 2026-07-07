#!/bin/bash

pkill -x polybar

while pgrep -x polybar >/dev/null; do
    sleep 0.2
done

sleep 0.3

exec polybar -c ~/.config/polybar/config.ini emi-bar
