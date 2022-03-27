ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
hwclock --systohc
printf "LANG=en_US.UTF-8\n" >> /etc/locale.conf
printf "LANG=zh_TW.UTF-8" >> /etc/locale.conf
echo en_US.UTF-8 UTF-8 | sudo tee -a /etc/locale.gen
echo zh_TW.UTF-8 UTF-8 | sudo tee -a /etc/locale.gen
locale-gen

# wheel ALL=(ALL) ALL
pacman -Sy --noconfirm vim
visudo

# network
pacman -Sy --noconfirm networkmanager
systemctl enable NetworkManager

#open root
passwd
useradd -mG wheel syuan
echo "enter your passwd syuand:"
passwd syuan
usermod -aG wheel,audio,video,optical,storage syuan

cp -r /ohmyarch /home/syuan
chown -R syuan /home/syuan/ohmyarch/*
