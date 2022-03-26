~/ohmyarch/script/wallpaper.sh &
~/ohmyarch/script/statusbar.sh &
picom --experimental-backends -b
exec fcitx &
exec sxhkd &
exec dwm
