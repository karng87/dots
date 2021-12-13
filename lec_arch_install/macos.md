# macos
## [https://github.com/Dunedan/mbp-2016-linux](https://github.com/Dunedan/mbp-2016-linux)
## [https://www.youtube.com/watch?v=x0Qmaa38UM8](https://www.youtube.com/watch?v=x0Qmaa38UM8)

## wifi
> ip a
> iwctl
>> device list 
>> station device scan
>> station device get-networks
>> sattion device connect SSID-name

## new partision 
> fdisk -l
> lsblk -f
> fdisk /dev/sda3
>> p
>> n
>> w

## format
> mkfs.ext4 /dev/sda3

## mount
> mount /dev/sda3 /mnt
> mkdir /mnt/boot
> sda1 is uefi disk
>> mount /dev/sda1 /mnt/boot
> lsblk

## pacstrap
> pacstrap /mnt base linux linux linux-firmware vim intel-ucode
>> ucode (unit code)
    ucode: micro code (microprocessor unit)
>>> amd-ucode
>>> intel-ucode

## generate file system table
> genfstab -U /mnt >> /mnt/etc/fstab

## chroot
> arch-chroot /mnt

### swap file
> dd if=/dev/zero of=/swapfile bs=1G count=2 status=porgress
> chmod 600 /swapfile
> mkswap /swapfile
> swapon /swapfile
> vim /mnt/etc/fstab
>> add last line '/swapfile none swap defaults 0 0'

### set link timezone
> timedatectl list-timezones | grep Seoul
> ln -sf /usr/share/zoneinfo/Asia/Seoul/ /etc/localtime
> hwclock --systohc

### set locale
> vim /etc/locale.gen
>> uncomment 'en_Us.UTF-8 UTF-8'
> locale-gen
> echo LANG=en_US.UTF-8 >> /etc/local.conf
> locale-gen

### set keyboard
> echo KEYMAP=ko >> /etc/vconsole.conf

### set hostname
> vim /etc/hostname
>> 'iMac'
> vim /etc/hosts
>> '127,0,0,1 localhost'
>> '::1 localhost'
>> '127,0,0,1 iMac.localdomain iMac'

### set passwd
> passwd
### insall program
> pacman -S efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-header git reflector bluez bluez-utils pluseaudio pulsaudio-bluetooth alsa-utils cups xdg-utils xdg-user-dirs

### bootctl (systemd-boot EFI boot manager)
> bootctl status
> bootctl --path=\boot install
> cd /boot
> ls
> cd ./loader
>> vim loader.conf
>>> 'default arch-*'
> ls
> cd ./entries
> ls
> vim arch.conf
>> 'title Arch Linux'
>> 'liux /vmlinuz-linux'
>> 'initrd /initramfs-linux.img'
>> 'initrd /intel-ucode.img'
>> 'options root=/dev/sda3 rw'

### config network
> cd
> systemctl enable NetworkManger
> systemctl enable bluetooth
> systemctl enable org.cups.cupsd

### user 
> useradd -mG wheel jkarng
>> usermod -aG wheel jkarng
> passwd jkarng
> EDITOR=vim visudo
>> uncomment 'wheel ALL=(ALL)ALL

### exit
> exit

## umout
> umount -a
> reboot

# after reboot
> mncli or iwctl
## install gnome
> sudo pacman -S xorg gdm gnome gnome-extra gnome-tweaks firefox
> sudo systemctl enable gdm
> reboot

## install kde
> sudo pacman -S xf86-video-intel xorg sddm plasma kde-application packagekit-qt5 firefox

## install theme
> sudo pacman -S materia-gtk-theme meateria-kde papirus-icon-theme

## sddm (simple desktop display manager)
> sudo systemctl enable sddm
> reboot



