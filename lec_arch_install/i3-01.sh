#!/bin/bash
sudo pacman -S i3 terminator lxappearance nitrogen pcmanfm firefox dmenu 
git clone https://aur.archlinux.org/ly
cd ly
makepkg -si
cd
sudo systemctl enable ly.service
reboot
