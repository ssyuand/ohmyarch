#!/bin/bash
install_neovim() {
echo "neovim" | figlet
# packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  /.local/share/nvim/site/pack/packer/start/packer.nvim

}

install_ls(){
# lua
git clone https://github.com/sumneko/lua-language-server ~/library/lua-language-server
cd ~/library/lua-language-server
git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# java
sudo pacman -Sy jdk-openjdk --noconfirm
mkdir ~/library/java
cd ~/library/java
wget https://download.eclipse.org/jdtls/milestones/1.7.0/jdt-language-server-1.7.0-202112161541.tar.gz
tar -xvzf *.tar.gz
}
