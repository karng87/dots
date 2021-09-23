# shortkey : c, e ..
## e : edit
## c : get grub shell command
## b : boot from the selected boot menu
## o : open a next line
## O : open a previous line
## d : delete the line
## ESC : back to the grub menu

### c: command
#### root command (device, partition)
    set a boot partition of drive as root path

    root(hd0,0)
        set path /dev/sda1 to root directory
    root(hd0,1)
        /dev/sda2

#### kernel command
    root (hd0,0)
    kernel /vmlinux-linux ro root=/dev/sda2

    single mode
        root(hd0,0)
        kernel /vmlinuz... ro root=/dev/sda2 single
        initrd /initrd...
        boot

#### initrd command
    root(hd0,0)
    kernel /vmlinuz-x... ro root=/dev/sda2
    initrd /initrd-xxx.img

#### boot command
    root(hd0,0)
    kernel /vmlinux-x.x.x ro root=/dev/sda2
    initrd /initrd-x.x.x.x.img
    boot
        now booting with previous setting
#### setup
    install grub
#### quit reboot halt help
