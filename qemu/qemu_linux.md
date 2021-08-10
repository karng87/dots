qemu-ing.exe create -f qcow2 -o cluster_size-2M arch.img 100G

./qemu-system-x86_64 -hda arch.img
-cdrom archinstall.iso
-boot menu=on
-hda arch.img
-accel whpx
-usb -device usb-tablet -show-cursor
-smp 2 -m 8G
-net nic -net tap,ifname="Local Area Connection"
-device AC97


./qemu-system-x86_64 
-hda arch.img
-accel whpx
-usb -device usb-tablet -show-cursor
-vga virtio
-smp 2 -m 8G
-net nic -net tap,ifname="Local Area Connection",script=no,downscript=no
-device AC97
[-soundhw all]
