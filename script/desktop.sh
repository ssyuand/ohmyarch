#!/bin/bash
install_desktop() {

#ly
git clone --recurse-submodules https://github.com/nullgemm/ly.git ~/library/ly
cd ~/library/ly && sudo make install
sudo systemctl enable ly

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
git clone https://git.suckless.org/dwm ~/.config/dwm
sudo cp ~/ohmyarch/dotfile/config.h ~/.config/dwm/config.h
cd ~/.config/dwm && sudo make install

# rofi
mkdir -p ~/.local/share/rofi/themes
cp ~/ohmyarch/dotfile/.config/rofi/light.rasi ~/.local/share/rofi/themes/light.rasi

# picom
git clone https://github.com/jonaburg/picom ~/library/picom
cd ~/library/picom && meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

#feh
mkdir ~/Desktop
tar -xvf ~/ohmyarch/dotfile/neon.tar -C ~/Desktop
echo "Desktop environment done!"
}
