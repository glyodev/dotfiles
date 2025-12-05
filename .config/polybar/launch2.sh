#!/bin/bash

# killall -q polybar

# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

if grep -q 'WhiteSur-Light' "$HOME/.gtkrc-2.0"; then
    # Si la línea existe, inicia Polybar con config.ini
    polybar --config="$HOME/.config/bspwm/config.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    polybar --config="$HOME/.config/bspwm/config2.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched with config.ini ..."
else
    # Si la línea no existe, inicia Polybar con config-dark.ini
    polybar --config="$HOME/.config/bspwm/config-dark.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    polybar --config="$HOME/.config/bspwm/config2-dark.ini" 2>&1 | tee -a /tmp/polybar.log & disown
    echo "Polybar launched with config-dark.ini ..."
fi

$HOME/.config/polybar/theme.sh
