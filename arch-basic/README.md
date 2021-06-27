# Arch Basic Install Commands-Script

    qemu-img create -f raw myimg.raw 40G
    qemu-system-x86_64 -drive file=myimg.raw,format=raw -cdrom bootable.img -m 4096 -accel hax 
    or qemu-system-x86_64 -drive file=myimg.raw,format=raw -m 4096 -machine accel=kvm

    qemu-system-x86_64 -drive file=myimg.raw,format=raw 
         -cdrom bootable.img 
         -m 4096 
         -accel hax 

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
        mkdir -p /mnt/boot/efi
        mount /dev/sda1 /mnt/boot/efi

    pacstrap /mnt base linux linux-firmware git vim intel-ucode
    or if amd then pacstrap /mnt base linux linux-firmware git vim amd-ucode
    
    file system table:
        genfstab -U /mnt >> /mnt/etc/fstab

    Chroot:
        arch-chroot /mnt

    Download: the git repository with 
        git clone https://gitlab.com/eflinux/arch-basic

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
