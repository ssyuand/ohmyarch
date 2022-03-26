#!/bin/bash
install_desktop() {

#ly
git clone --recurse-submodules https://github.com/nullgemm/ly.git
cd ly && sudo make install
systemctl enable ly

# dotfile
git clone https://github.com/ssyuanmd/dotfile ~/dotfile

# .bashrc
cp ~/dotfile/.bashrc ~/
sudo cp ~/dotfile/.bashrc /root

# .config
cp -r ~/dotfile/.config ~/
sudo cp -r ~/dotfile/.config /root

# fonts
sudo cp ~/dotfile/fonts/* /usr/share/fonts/

# xinitrc
cp ~/dotfile/.xinitrc ~/

# dwm
echo "DWM" | figlet
git clone https://git.suckless.org/dwm ~/.config/dwm
cp ~/dotfile/config.h ~/.config/dwm/config.h
cd ~/.config/dwm && sudo make install

#feh
mkdir ~/Desktop
tar -xvf ~/dotfile/neon.tar -C ~/Desktop

echo "Desktop environment done!"
}
