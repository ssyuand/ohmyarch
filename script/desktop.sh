#!/bin/bash
install_desktop() {

#ly
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly && sudo make install
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

# dwm
echo "DWM" | figlet
git clone https://git.suckless.org/dwm ~/.config/dwm
#cp ~/ohmyarch/dotfile/config.h ~/.config/dwm/config.h
cd ~/.config/dwm && sudo make install

#feh
mkdir ~/Desktop
tar -xvf ~/ohmyarch/dotfile/neon.tar -C ~/Desktop

echo "Desktop environment done!"
}
