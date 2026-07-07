#!/bin/bash

dark_theme="MacOSGary"
light_theme="WhiteSur-Light"

SETTINGS="$HOME/.config/gtk-3.0/settings.ini"

if systemctl --user is-enabled --quiet auto-theme.timer; then

    hour=$(date +%H)

    if (( hour >= 7 && hour < 18 )); then
        target="$light_theme"
    else
        target="$dark_theme"
    fi

    current=$(grep "^gtk-theme-name=" "$SETTINGS" | cut -d= -f2)

    if [[ "$current" != "$target" ]]; then
        sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$target/" "$SETTINGS"
    fi

fi

sleep 0.2

changed=false

if [[ "$current" != "$target" ]]; then
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$target/" "$SETTINGS"
    changed=true
fi

if $changed; then
    i3-msg restart
fi
