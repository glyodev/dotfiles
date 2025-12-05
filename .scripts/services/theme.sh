#!/bin/bash

# Variables de temas
THEME_CLARO="WhiteSur-Light"
THEME_OSCURO="Sweet-Ambar-Blue-Dark-v40"

# Determinar la hora actual
HORA_ACTUAL=$(date +%H%M)

# Seleccionar el tema basado en la hora
if [[ "$HORA_ACTUAL" -ge 630 && "$HORA_ACTUAL" -lt 1830 ]]; then
    NUEVO_TEMA="$THEME_CLARO"
else
    NUEVO_TEMA="$THEME_OSCURO"
fi

# Verificar el tema actual en .gtkrc-2.0
TEMA_ACTUAL=$(grep '^gtk-theme-name=' "$HOME/.gtkrc-2.0" | cut -d '"' -f2)

# Cambiar solo si el tema es diferente
if [[ "$TEMA_ACTUAL" != "$NUEVO_TEMA" ]]; then
    # Actualizar tema en GTK 2
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NUEVO_TEMA\"/" "$HOME/.gtkrc-2.0"

    # Actualizar tema en GTK 3
    sed -i "s/^gtk-theme-name=.*/gtk-theme-name=\"$NUEVO_TEMA\"/" "$HOME/.config/gtk-3.0/settings.ini"

    # Recargar bspwm para aplicar el tema
    bspc wm -r
    echo "Tema cambiado a $NUEVO_TEMA y bspwm recargado."
else
    echo "El tema ya está configurado como $NUEVO_TEMA. No se requiere cambio."
fi

