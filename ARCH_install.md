# ip a
## iwctl
    device list
    station wlan0 scan
    station wlan0 get-networks
    station wlan0 connent homeip
        passwd

## pacman -Sy

## lsblk -f
    gdisk /dev/sda
        n
        +250M
        ef00

        n
        -8G
        
        n
        swap
## mkfs
    mkfs.vfat /dev/sda1
    mkswap /dev/sda2
    swapon /dev/sda2
    mkfs.ext4 /dev/sda3
    mkfs.ext4 /dev/sda4
## mount
    mount /dev/sda3 /mnt

    mkdir -p /mnt/boot/efi
    mkdir /mnt/home

    mount /dev/sda1 /mnt/boot/efi
    mount /dev/sda4 /mnt/home
    
## pacstrap /mnt
    pacstrap /mnt base linux linux-firmware git nvim intel-ucode
## genfstab -U /mnt >> /mnt/etc/fstab
## arch-chroot /mnt

### git clone https:://gitlab.com/efilinux/arch-install-base
    cd arch-linux-base
    nvim bash.sh
        root:passwd


