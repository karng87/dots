# Arch Basic Install Commands-Script
docker run -it --rm ubuntu

# windows 10
https://andybor.blogspot.com/2021/01/qemu-linux-ubuntu-windows-10.html

    set path in environments
    set hypervisor platform in control panel

    qemu-img create ^(like \ in linux)
        -f qcow2 ubuntu-20.10-desktop-amd64.qcow2 ^
        15G
    qemu-system-x86_64 ^
        -machine type=q35,accel=whpx ^
        -smp 2 ^ (Shared memory MultiProcessing)
        -hda ubuntu-20.10-desktop-amd64.qcow2 ^
        -cdrom ubuntu-20.10-desktop-amd64.iso ^
        -m 4G ^
        -vga virtio ^
        -usb ^
        -device usb-tablet ^
        -display default,show-cursor=on

    qemu-system-x86_64 ^
        -machine type=q35,accel=whpx ^
        -smp 2 ^
        -hda ubuntu-20.10-desktop-amd64.qcow2 ^
        -m 8G ^
        -vga virtio ^
        -usb ^
        -device usb-tablet ^
        -display default,show-cursor=on

## MacOS
https://andybor.blogspot.com/2020/12/linux-macos-qemu.html
    brew install qemu
    Big Sur:
        vim entitlements.xml
```xml
    <?xml version="1.0" encoding="UTF-8"?>

    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">

    <plist version="1.0">

    <dict>

        <key>com.apple.security.hypervisor</key>

        <true/>

    </dict>

    </plist>
```
    codesign 
        -s - 
        --entitlements entitlements.xml 
        --force /usr/local/bin/qemu-system-x86_64

    qemu-img create 
        -f qcow2 
        ubuntu-20.10-desktop-amd64.qcow2 
        15G

    qemu-system-x86_64
        -machine type=q35,accel=whpx
        -smp 2
        -hda ubuntu-20.10-desktop-amd64.qcow2
        -cdrom ubuntu-20.10-desktop-amd64.iso 
        -m 4G
        -vga virtio
        -usb
        -device usb-tablet 
        -display default,show-cursor=on

    qemu-system-x86_64 
        -machine type=q35,accel=whpx 
        -smp 2 
        -hda ubuntu-20.10-desktop-amd64.qcow2 
        -m 8G 
        -vga virtio 
        -usb 
        -device usb-tablet 
        -display default,show-cursor=on

## linux

    qemu-img 
        create 
        -f qcow2 
        arch.img
        40G

    qemu-system-x86_64 
        -drive 
            file=arch.img,format=raw 
        -cdrom 
            archintall.iso 
        -m 4G
        -accel kvm

    ::: Booting ::: 

    ls /usr/share/kbd/consolefonts/
    setfont ter-132n
    pacman -Syy

    lsblk
    fdisk /dev/sda
        swap efi base

    format:
        mkfs.fat -F32 /dev/sda1 (above 260M)
        mkfs.ext4 /dev/sda3
        mkswap /dev/sda2
        swapon /dev/sda2
    mount:
        mount /dev/sda3 /mnt
        mkdir -p /mnt/boot
        mount /dev/sda1 /mnt/boot

    pacstrap /mnt base linux linux-firmware git vim intel-ucode
    or if amd then pacstrap /mnt base linux linux-firmware git vim amd-ucode
    
    file system table:
        genfstab -U /mnt >> /mnt/etc/fstab

    Chroot:
        arch-chroot /mnt

    Download: the git repository with 
        git clone https://gitlab.com/karng87/dots.git

        cd arch-basic
        chmod +x install-uefi.sh
        run with ./install-uefi.sh

If needed, load your keymap
Refresh the servers with pacman -Syy
Partition the disk
Format the partitions
Mount the partitions
Install the base packages into /mnt (pacstrap /mnt base linux linux-firmware git vim intel-ucode (or amd-ucode))
Generate the FSTAB file with genfstab -U /mnt >> /mnt/etc/fstab
Chroot in with arch-chroot /mnt
Download the git repository with git clone https://gitlab.com/eflinux/arch-basic
 cd arch-basic
 chmod +x install-uefi.sh
 run with ./install-uefi.sh
