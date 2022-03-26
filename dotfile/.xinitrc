#!/bin/bash
FILE=/dev/input/by-id/usb-Topre_Corporation_HHKB_Professional-event-kbd
if [ -L "$FILE" ]; then
	setxkbmap -option
	xmodmap ~/ohmyarch/dotfile/xmodmap/.xmodmap-hhkb
else 
	setxkbmap -option
	xmodmap ~/ohmyarch/dotfile/xmodmap/.xmodmap-laptop
fi

~/ohmyarch/script/wallpaper.sh &
~/ohmyarch/script/statusbar.sh &
picom --experimental-backends -b
exec fcitx &
exec sxhkd &
exec dwm
