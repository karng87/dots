# install
```bash
bootctl install
```

# edit config file
```bash
vi /boot/loader/loader.conf
> default arch
> timeout 3
```

# create arch.conf
```bash
vi /boot/loader/entries/arch.conf
> title Arch
> linux /vmlinuz-linux
> initrd /initramfs-linux.img
> options root=PARTUUID=.....
# tip -> :r !blkid
> save and exit
pacamn -Rcnsu grub
> rm /boot/grub
reboot
```
# uninstall
```bash
bootctl remove
```
