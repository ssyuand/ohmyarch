ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
printf "LANG=en_US.UTF-8" >> /etc/locale.conf
#printf "en_US.UTF-8 UTF-8" >> /etc/locale.gen
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
#locale-gen

# wheel ALL=(ALL) ALL
pacman -Sy vim
visudo

# network
pacman -Sy networkmanager
systemctl enable NetworkManager

#open root
passwd
useradd -mG wheel syuan
echo "enter your passwd syuand:"
passwd syuan
usermod -aG wheel,audio,video,optical,storage syuan

