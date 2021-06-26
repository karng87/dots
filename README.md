# Qemu

## links
    [[Arch linux gui install]](https://sourceforge.net/projects/arch-linux-gui/files/)
    https://sourceforge.net/projects/arch-linux-gui/files

    [[windows]](https://qemu.weilnetz.de/w64)
    https://qemu.weilnetz.de/w64

### debian package
    https://dennisnotes.com/note/20180614-ubuntu-18.04-qemu-setup/

    sudo apt-get install qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagentsdf

### arch package
    sudo pacman -S qemu qemu-block-gluster qemu-block-iscsi qemu-block-rbd samba

## Create Image
    https://www.youtube.com/watch?v=Ov3FnPsmChc

    qemu-img create -f raw myimg.raw 40G
        or qemu-img create -f qcow2 raw myimg.cow2 40G
    qemu-img info myimg.raw
    qemu-img info myimg.cow2

## Run Image
    qemu-system-x86_64 -drive file=myimg.raw,format=raw -cdrom bootable.img -m 4096 -accel hax 
    qemu-system-x86_64 -drive file=myimg.raw,format=raw -m 4096 -accel hax

## qemu-system-x86_64 
     -drive file=myimg.raw,format=raw 
     -cdrom bootable.img 
     -m 4096 
     -accel hax 
    Ater install

## qemu-system-x86_64 
     -drive file=myimg.raw,format=raw 
     -m 4096 
     -accel hax
========================
---
# arch install

### setfont ter-232b.psf.gz
    ls /usr/share/kbd/consolefonts/ |grep ter-232
    setfont ter-234b.psf.gz
### loadkeys  us.map.gz

    nmtui
        nmtui
    nmcli
        nmcli connection show 
        nmcli device wifi list
        nmcli device wifi connect SSID passwd passwd [hidden yes]
### timedatectl set-ntp true
        timedatectl status
### lsblk
        gdisk /dev/...
        efi 200M
        swap 

### mkfs.fat -F32 /dev/.. Efi
        mkswap /dev/...
        swapon /dev/..
        mkfs.ext4 /dev/..

### mount /dev/.. /mnt
        mkdir -P /mnt/boot/efi
        mount /dev/.. /mnt/boot/eif
        lsblk
        ---
### pacstrap /mnt base linux linux-firmware vim intel-ucode
### genfstab -U /mnt >> /mnt/etc/fstab
### cat /mnt/ect/fstab
### arch-chroot /mnt
---

### ln -sf /usr/share/zoneinf/Asia/Seoul /etc/localtime
### hwclock --systohc
---
### vin /etc/local-gen
        uncomment en_US.UTF-8 UTF_8
### locale-gen
### echo "LANG-en_US_UTF-8" >> /etc/local.conf
### echo "KEYMAP=us" >> /etc/vconsole.conf
### echo "arch" >> /etc/hostname
### vi /etc/host
        127.0.0.1   localhost
        ::1         localhost
        127.0.1.1   arch.localdomain arch
### passwd
### pacman 
    pacman -S grub efibootmgr netowrkmanager network-manager-applet wpa_supplicant dialog mtools dosfstool base-devel linux-header git reflector bluez bluez-utils cups hplip xdg-utils xdg-user-dirs inettuils dnsutils bash-completion tlp powertop alsa-uitls pulseaudio pulseaudio-bluetooth acpi acpi_call

### pacman -S openssh

### grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
### grup-mkconfig -o /boot/grub/grub.cfg
---
### systemctl enable NetworManager
### systemctl enable bluetooth
### systemctl enable cups
### systemctl enable sshd
### systemctl enable tlp
---
### useradd -mG wheel lee 
### passwd lee
### usermod -c 'MJ Lee" lee
#---
### EDITOR=vim visudo
#    uncomment wheel ALL(ALL) ALL
### exit
#---
### umount -a
### reboot
---
### nmtui
    wifi wlan
### sudo timedatect set-ntp true
### sudo hwclock --systohc

### sudo pacman -S rsysnc
### sudo pacman -Syy

### sudo systtemctl enable --now fstrim.timer
### sudo pacman -S xf86-video-intel nvidia nvidia-utils nvidia-settings xorg gdm gnome gnome-extra firefox chorome-gnome-shell gnome-tweaks

### sudo vim /etc/mkinitcpio.conf
    MODULES=(i915 nvidia)
### sudo mkinitciop -P linux
### sudo vim /etc/gdm/custom.conf
    Uncomment 
        WaylandEnable=false
### sudo systemctl enable gdm
### sudo pacman -S simplescreenrecorder
### reboot
---
## Note Book inte graphic and nvidia 3d accelarater
### AUR system76-power
### sudo systemctl enable --now system76-power.service
### sudo systemctl satus system76-power.service
### system76-power --help
### sudo system76-power graphics intergrated
### exit

### sudo system76-power graphics hybrid
### sudo system76-power graphics nvidia


---

## neovim
    pyenv global 3.9 2.7..

    python2.7 -m pip install --upgrade pip
    python -m pip install --upgrade pip

    pip3 uninstall neovim
    pip3 uninstall pynvim
    pip3 install pynvim

    pip2 uninstall neovim
    pip2 uninstall pynvim
    pip2 install pynvim

    pip uninstall neovim
    pip uninstall pynvim
    pip install pynvim
    
## texlive 
### tlmgr (TextLive Mgr)
    edit TEXMFDIST/scripts/texlive/tlmgr.pl
        replace 
            $Master = "$Master/../.."; 
                with 
            $Master = "${Master}/../../..";
    edit bashrc
        TEXMFDIST=/usr/share/texmf-dist
        alias tlmgr='${TEXMFDIST}/scripts/texlive/tlmgr.pl --usermode'

    shell> tlmgr option repository https://mirror.kakao.com/CTAN/
    shell> tlmgr install package_name
