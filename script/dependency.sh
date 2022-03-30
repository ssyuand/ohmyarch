#!/bin/bash
install_dependency() {
yes | sudo pacman -S
	tools=(
	"alacritty"
	"ttf-droid"
	"firefox"
	"figlet"
	"fcitx-im"
	"fcitx-configtool"
	"fcitx-chewing"
	"rofi"
	"ninja"
	"neovim"
	"nerd-fonts"
	"git"
	"htop"
	"trash-cli"
	"xorg-server"
	"xorg-xsetroot"
	"xorg-xinit"
	"xorg-xrandr"
	"xorg-setxkbmap"
	"xclip"
	"sxhkd"
	"libxinerama"
	"libxft"
	"feh"
	"uthash"
	"meson"
	"libev"
	"libconfig"
	)
for tool in ${tools[@]}; do
	sudo pacman -S --needed --noconfirm $tool
done
xrandr -s 1920x1080

# fcitx
printf "export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
" > ~/.xprofile
}

aur() {
# AUR
mkdir ~/library
echo "AUR" | figlet
sudo git clone https://aur.archlinux.org/yay.git ~/library/yay
sudo chown -R syuan ~/library/*
cd ~/library/yay && makepkg -si --noconfirm
}
