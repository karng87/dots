# qemu

## -accel kvm -cpu host -machine q35
## -nic user,hostfwd=tcp::60022-:22,hostfwd=tcp::5900-:5900
    ssh quest-user@127.0.0.1 -p 6002

## qemu-system-x86_64 
    -kernel /boot/vmlinuz 
    -initrd /boot/initramfs-linux.img 
    -append root=/dev/sda /dev/sda3

