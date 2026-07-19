#!/bin/sh
dir="$HOME/.screenlayout"
current=`cat "$dir/current"`

notify-send -u low "$current established"
exec "$dir/$current.sh"
