#!/bin/bash

ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen # en_US.UTF8 UTF8
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#echo "KEYMAP=ko" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:8755 | chpasswd

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

pacman -S libhangul fcitx5-hangul fcitx5

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# [link](http://nemonein.egloos.com/5327699)
pacamn -S refind
# TODO sdb1? or sda1 한번만 설치 다른 하드에 설치 되어 있으면 안해도됨
refind-install --usedefault /dev/sdXX
# refind linux config
mkrlconf
lsblk -f
vim /boot/refind_linux.conf
# "Boot with standard options"  "root=UUID=yourUUID ro rootflags=subvol=archlinux_root"
# "Boot to single-user mode"    "root=UUID=yourUUID ro rootflags=subvol=archlinux_root single"
# "Boot with minimal options"   "ro root=UUID=yourUUID

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m jkarng
echo jkarng:8755 | chpasswd
usermod -aG libvirt video audio tty input jkarng

echo "jkarng ALL=(ALL) ALL" >> /etc/sudoers.d/jkarng


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"


