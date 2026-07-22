#!/usr/bin/env bash

# Current Theme
dir="$HOME/.config/rofi/themes"
theme='menu'

# CMDs
uptime="`uptime -p | sed -e 's/up //g'`"
host=`hostname`
dir_screen="$HOME/.screenlayout"
current=`cat "$dir_screen/current"`

# Options
pc='󰌢  pc screen only (only-laptop)'
extend='󱒃  extend (extended screens)'
mirror='󰍺  mirror (both monitors)'
hdmi='󰍹  hdmi screen only (only-hdmi)'
conf="󱋆  configure"

yes='  yes'
no='󰜺  no'

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "$host" \
		-mesg "Current: $current" \
		-theme-str 'textbox-prompt-colon {str: "󱄄";}' \
		-theme-str 'listview {lines: 5;}' \
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
	echo -e "$pc\n$extend\n$mirror\n$hdmi\n$conf" | rofi_cmd
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
		if [[ $1 == '--pc' ]]; then
			echo 'only-laptop' > "$dir_screen/current" && "$dir_screen/main.sh"
		elif [[ $1 == '--extend' ]]; then
			echo 'extend' > "$dir_screen/current" && "$dir_screen/main.sh"
		elif [[ $1 == '--mirror' ]]; then
			echo 'mirror' > "$dir_screen/current" && "$dir_screen/main.sh"
		elif [[ $1 == '--hdmi' ]]; then
			echo 'only-hdmi' > "$dir_screen/current" && "$dir_screen/main.sh"
		fi
	else
		exit 0
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $pc)
		run_cmd --pc
        ;;
    $extend)
		run_cmd --extend
        ;;
    $mirror)
		run_cmd --mirror
        ;;
    $hdmi)
		run_cmd --hdmi
        ;;
    $conf)
	        exec arandr
	;;
esac
