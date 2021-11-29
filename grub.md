# [boot menu[(http://nemonein.egloos.com/5327629)
## e
```
grub> ls
(hd0) (hd1) (hd1,gpt2) (hd1,gpt1)
```
> hd0 hd1 -> disk drive
>> gpt1 gpt2 -> partision number
```
grub> ls (hd1,gpt1)
```
> check drive and partision
```
grub> set root=(hd1,gpt1)
grub> linux /boot/vmlinuz<auto tab> root=/dev/sda2
grub> intrd /boot/initrd.img<audto tab>
grub> boot
```
booting .....

## after boot
```bash
# update-grub
# grub-insall /dev/sdXX


grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=FALSE" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
