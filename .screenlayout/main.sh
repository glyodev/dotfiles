#!/bin/sh

dir="$HOME/.screenlayout"
echo $dir 
current=`cat "$dir/current"`
echo $current

exec "$dir/$current.sh"
