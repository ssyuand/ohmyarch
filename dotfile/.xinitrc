#!/bin/bash
FILE=/dev/input/by-id/usb-Topre_Corporation_HHKB_Professional-event-kbd
if [ -L "$FILE" ]; then
	setxkbmap -layout us -option
else 
	setxkbmap -layout us -option ctrl:swapcaps
fi

~/ohmyarch/script/wallpaper.sh &
~/ohmyarch/script/statusbar.sh &
picom --experimental-backends -b
exec fcitx &
exec sxhkd &
exec dwm
