#!/bin/bash

GTK_SETTINGS="$HOME/.config/gtk-3.0/settings.ini"
theme=$(grep "^gtk-theme-name=" "$GTK_SETTINGS" | cut -d= -f2)

if [[ "$theme" == *Light* ]]; then

    # Polybar
    ln -sf ~/.config/polybar/light.ini ~/.config/polybar/colors.ini

    # Alacritty
    ln -sf ~/.config/alacritty/light.toml ~/.config/alacritty/rice-colors.toml

    # Rofi
    ln -sf ~/.config/rofi/themes/colors/light.rasi ~/.config/rofi/themes/colors/colors.rasi

    # Dunst
    ln -sf ~/.config/dunst/light.conf ~/.config/dunst/dunstrc

    # Wallpaper
    feh --bg-scale ~/Pictures/Wallpapers/fondo3.jpg
else

    ln -sf ~/.config/polybar/dark.ini ~/.config/polybar/colors.ini

    # Alacritty
    ln -sf ~/.config/alacritty/dark.toml ~/.config/alacritty/rice-colors.toml

    # Rofi
    ln -sf ~/.config/rofi/themes/colors/dark.rasi ~/.config/rofi/themes/colors/colors.rasi

    # Dunst
    ln -sf ~/.config/dunst/dark.conf ~/.config/dunst/dunstrc

    # Wallpaper
    feh --bg-scale ~/Pictures/Wallpapers/fondo2.jpg
fi

# Reiniciar Dunst
systemctl --user restart dunst.service
