#!/bin/bash
install_desktop() {

# .bashrc
cp ~/ohmyarch/dotfile/.bashrc ~/
sudo cp ~/ohmyarch/dotfile/.bashrc /root

# .config
cp -r ~/ohmyarch/dotfile/.config ~/
sudo cp -r ~/ohmyarch/dotfile/.config /root

# fonts
sudo cp ~/ohmyarch/dotfile/fonts/* /usr/share/fonts/

# xinitrc
cp ~/ohmyarch/dotfile/.xinitrc ~/

# .gitconfig
cp ~/ohmyarch/dotfile/.gitconfig ~/

# dwm
echo "DWM" | figlet
git clone https://git.suckless.org/dwm ~/library/dwm
cp ~/ohmyarch/dotfile/config.h ~/library/dwm/config.h
cd ~/library/dwm && sudo make install

# brightness
git clone https://gitlab.com/cameronnemo/brillo ~/library/brillo
sudo pacman -Sy go-md2man --noconfirm
cd ~/library/brillo && make && sudo make install.setgid

# picom
git clone https://github.com/jonaburg/picom ~/library/picom
cd ~/library/picom && meson --buildtype=release . build
sudo ninja -C build install

# rofi
mkdir -p ~/.local/share/rofi/themes
cp ~/ohmyarch/dotfile/.config/rofi/light.rasi ~/.local/share/rofi/themes/light.rasi

#ly
git clone --recurse-submodules https://github.com/nullgemm/ly.git ~/library/ly
cd ~/library/ly && sudo make install
sudo systemctl enable ly

#feh
mkdir ~/Desktop
tar -xvf ~/ohmyarch/dotfile/neon.tar -C ~/Desktop
echo "Desktop environment done!"

# touchpad
sudo cp ~/ohmyarch/dotfile/30-touchpad.conf /etc/X11/xorg.conf.d/
}
install_wireless() {
	sudo pacman -Sy bluez bluez-utils pulseaudio-bluetooth pavucontrol sbc --noconfirm
	sudo systemctl enable bluetooth
	sudo rfkill unblock all
	#pactl load-module module-bluetooth-discover
}
