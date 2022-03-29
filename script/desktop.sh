#!/bin/bash
install_desktop() {
# .bashrc
cp ~/ohmyarch/dotfile/.bashrc ~/
sudo cp ~/ohmyarch/dotfile/.bashrc /root

# .config
cp -r ~/ohmyarch/dotfile/.config ~/
sudo cp -r ~/ohmyarch/dotfile/.config /root

# library
cp ~/ohmyarch/dotfile/library.tar.xz ~/
cd ~/ && tar -xvf ./library.tar.xz

# fonts
sudo cp ~/ohmyarch/dotfile/fonts/* /usr/share/fonts/

# xinitrc
cp ~/ohmyarch/dotfile/.xinitrc ~/

# .gitconfig
cp ~/ohmyarch/dotfile/.gitconfig ~/

# dwm
echo "DWM" | figlet
cp ~/ohmyarch/dotfile/config.h ~/library/dwm/config.h
cd ~/library/dwm && sudo make install

# picom
cd ~/library/picom && meson --buildtype=release . build
sudo ninja -C build install

# rofi
mkdir -p ~/.local/share/rofi/themes
cp ~/ohmyarch/dotfile/.config/rofi/light.rasi ~/.local/share/rofi/themes/light.rasi

#ly
cd ~/library/ly && sudo make install
sudo systemctl enable ly

#feh
mkdir ~/Desktop
tar -xvf ~/ohmyarch/dotfile/neon.tar -C ~/Desktop
echo "Desktop environment done!"
}
