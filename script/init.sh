#!/bin/bash
sudo chown -R syuan /home/syuan/ohmyarch
sudo chmod u+x /home/syuan/ohmyarch

DIR=$(pwd)
. "$DIR/dependency.sh"
. "$DIR/desktop.sh"
. "$DIR/neovim.sh"

config_mirror () {
    PACMAN_MIRROR=$(cat /etc/pacman.d/mirrorlist)
    if [[ $PACMAN_MIRROR != *"nctu"* ]]; then
        sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
        sudo echo 'Server = https://archlinux.cs.nctu.edu.tw/$repo/os/$arch' > /etc/pacman.d/mirrorlist
    fi
	sudo pacman -Sy
}

# config all shit
if [[ $1 == "dependency" ]]; then
	install_dependency
elif [[ $1 == "desktop" ]]; then
	install_desktop
elif [[ $1 == "neovim" ]]; then
	install_neovim
elif [[ $1 == "ls" ]]; then
	install_ls
else
	config_mirror
	install_dependency
	install_desktop
	install_neovim
	startx
fi
