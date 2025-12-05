#!/bin/bash

# Archivo de configuración de Alacritty
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"

# Ruta al archivo de configuración de rofi
ROFI_CONFIG="$HOME/.config/rofi/config.rasi"

# Ruta al archivo de configuración de qt6ct
QT6CT_CONFIG="$HOME/.config/qt6ct/qt6ct.conf"

# Configuraciones GTK
GTK3_CONFIG="$HOME/.config/gtk-3.0/settings.ini"
GTK4_CONFIG="$HOME/.config/gtk-4.0/settings.ini"

# Detectar la cantidad de monitores conectados
SCREEN=$(xrandr | grep " connected " | wc -l)
PRIMARY_MONITOR="eDP-1"
SECONDARY_MONITOR="HDMI-1"

# Verifica si 'WhiteSur-Light' está presente en .gtkrc-2.0 para aplicar configuraciones según el tema
if grep -q 'WhiteSur-Light' $GTK3_CONFIG; then
    # Configuración para el tema claro
    sed -i 's|import = \[.*|import = ["~/.config/alacritty/rice-colors.toml", "~/.config/alacritty/fonts.toml"]|' "$ALACRITTY_CONFIG"
    sed -i 's|@theme .*|@theme "~/.config/rofi/themes/spotlight.rasi"|' "$ROFI_CONFIG"
    sed -i 's|color_scheme_path=.*|color_scheme_path=/usr/share/qt6ct/colors/airy.conf|' "$QT6CT_CONFIG"
		sed -i 's/gtk-theme-name=MacOSGary/gtk-theme-name=WhiteSur-Light/' "$GTK3_CONFIG"
		sed -i 's/gtk-theme-name=MacOSGary/gtk-theme-name=WhiteSur-Light/' "$GTK4_CONFIG"

    xfconf-query -c xfce4-notifyd -p /theme -s "Bright"
    
    # Establecer fondo claro en todos los monitores
    if [[ $SCREEN -eq 1 ]]; then
        nitrogen --set-auto "Pictures/Backgrounds/14.jpg" --head=0
    elif [[ $SCREEN -eq 2 ]]; then
        nitrogen --set-auto "Pictures/Backgrounds/14.jpg" --head=0
        nitrogen --set-auto "Pictures/Backgrounds/14.jpg" --head=1
    fi

		notify-send "Tema claro establecido"
else
    # Configuración para el tema oscuro
    sed -i 's|import = \[.*|import = ["~/.config/alacritty/rice-colors-dark.toml", "~/.config/alacritty/fonts.toml"]|' "$ALACRITTY_CONFIG"
    sed -i 's|@theme .*|@theme "~/.config/rofi/themes/spotlight-dark.rasi"|' "$ROFI_CONFIG"
    sed -i 's|color_scheme_path=.*|color_scheme_path=/usr/share/qt6ct/colors/darker.conf|' "$QT6CT_CONFIG"
		sed -i 's/gtk-theme-name=WhiteSur-Light/gtk-theme-name=MacOSGary/' "$GTK3_CONFIG"
		sed -i 's/gtk-theme-name=WhiteSur-Light/gtk-theme-name=MacOSGary/' "$GTK4_CONFIG"

    xfconf-query -c xfce4-notifyd -p /theme -s "Default"
    
    # Establecer fondo oscuro en todos los monitores
    if [[ $SCREEN -eq 1 ]]; then
        nitrogen --set-auto "Pictures/Backgrounds/13.jpg" --head=0
    elif [[ $SCREEN -eq 2 ]]; then
        nitrogen --set-auto "Pictures/Backgrounds/13.jpg" --head=0
        nitrogen --set-auto "Pictures/Backgrounds/13.jpg" --head=1
    fi
		
		notify-send "Tema oscuro establecido"
fi

# Restaurar fondo
#nitrogen --restore

