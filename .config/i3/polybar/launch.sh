#!/bin/bash

killall -q polybar

notify-send "Polybar init"

GTK3_CONFIG="$HOME/.config/gtk-3.0/settings.ini"
if grep -q 'WhiteSur-Light' "$GTK3_CONFIG"; then
    polybar --config="$HOME/.config/i3/polybar/config.ini" emi-bar &
else
    polybar --config="$HOME/.config/i3/polybar/config-dark.ini" emi-bar &
fi

$HOME/.config/polybar/theme.sh
