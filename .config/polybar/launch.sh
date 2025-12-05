#!/bin/bash

# killall -q polybar

GTK3_CONFIG="$HOME/.config/gtk-3.0/settings.ini"

# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

if grep -q 'WhiteSur-Light' $GTK3_CONFIG; then
    # Si la línea existe, inicia Polybar con config.ini
    polybar --config="$HOME/.config/bspwm/config.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched with config.ini ..."
else
    # Si la línea no existe, inicia Polybar con config-dark.ini
    polybar --config="$HOME/.config/bspwm/config-dark.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched with config-dark.ini ..."
fi

$HOME/.config/polybar/theme.sh
