#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/themes"
theme='menu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`

# Options
dark='󰖔 dark theme'
light='󰖨 light theme'
auto="󰔎 auto theme"

dark_theme='MacOSGary'
light_theme='WhiteSur-Light'

yes=' yes'
no='󰜺 no'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Uptime: $uptime" \
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
			sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$dark_theme/" ~/.config/gtk-3.0/settings.ini
			sleep 0.2
			i3-msg restart
			sleep 0.3
			notify-send "Dark theme"
			sleep 0.2
			systemctl --user stop auto-theme.timer
			systemctl --user disable auto-theme.timer
		elif [[ $1 == '--light' ]]; then
			sed -i "s/^gtk-theme-name=.*/gtk-theme-name=$light_theme/" ~/.config/gtk-3.0/settings.ini
			sleep 0.2
			i3-msg restart
			sleep 0.3
			notify-send "Light theme"
			sleep 0.2
			systemctl --user stop auto-theme.timer
			systemctl --user disable auto-theme.timer
		elif [[ $1 == '--auto' ]]; then
			systemctl --user start auto-theme.timer
			systemctl --user enable auto-theme.timer
			systemctl --user restart auto-theme.service
			sleep 0.2
			i3-msg restart
			sleep 0.3
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
