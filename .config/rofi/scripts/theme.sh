#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/themes"
theme='menu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`
currect=''

# Options
dark='󰖔 dark theme'
light='󰖨 light theme'
auto="󰔎 auto theme"

dark_theme='MacOSGary'
light_theme='WhiteSur-Light'

yes=' yes'
no='󰜺 no'

current_theme=$(grep "^gtk-theme-name=" ~/.config/gtk-3.0/settings.ini | cut -d= -f2)
mode=""
if systemctl --user is-enabled --quiet auto-theme.timer; then
    mode="Auto"
elif [[ "$current_theme" == "$light_theme" ]]; then
    mode="Light"
else
    mode="Dark"
fi

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Current: $current_theme • $mode" \
		-theme-str 'textbox-prompt-colon {str: "󰔎";}' \
		-theme-str 'listview {lines: 3;}' \
		-theme ${dir}/${theme}.rasi
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 250px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
		-theme ${dir}/${theme}.rasi
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$dark\n$light\n$auto" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--dark' ]]; then
    	systemctl --user disable --now auto-theme.timer

    	sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$dark_theme/" \
        ~/.config/gtk-3.0/settings.ini

    	sleep 0.2
    	i3-msg restart
    	sleep 0.3

    	notify-send "Dark theme"
		elif [[ $1 == '--light' ]]; then
    	systemctl --user disable --now auto-theme.timer

    	sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$light_theme/" \
        ~/.config/gtk-3.0/settings.ini

    	sleep 0.2
    	i3-msg restart
    	sleep 0.3

    	notify-send "Light theme"
		elif [[ $1 == '--auto' ]]; then
			systemctl --user enable --now auto-theme.timer
			systemctl --user restart auto-theme.service

			notify-send "Auto theme enabled"
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $dark)
		run_cmd --dark
        ;;
    $light)
		run_cmd --light
        ;;
    $auto)
	        run_cmd --auto
	;;
esac
