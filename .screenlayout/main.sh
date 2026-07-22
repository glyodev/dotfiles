#!/bin/sh

dir="$HOME/.screenlayout"
current=$(cat "$dir/current")

if "$dir/$current.sh" >/dev/null 2>&1; then
    notify-send -u low "$current established"
else
    notify-send -u critical "Not HDMI connected, '$current' not established"
		def='only-laptop'
		echo "$def" > "$dir/current" && "$dir/$def.sh"
fi
