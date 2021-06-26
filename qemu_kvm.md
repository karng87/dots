# kvm /  qemu based 
    https://qemu.weilnetz.de/w64/
    https://www.youtube.com/watch?v=Ov3FnPsmChc

    https://dennisnotes.com/note/20180614-ubuntu-18.04-qemu-setup/
# sudo apt-get install 
    qemu-kvm libvirt-bin bridge-utils virt-manager qemu virt-viewer spice-vdagentsdf

## Create Image
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

## qemu-img resize arch.img +10G
## qemu-img convert -f raw -O qcow2 input.raw output.qcow2

## Install OS
    qemu-system-x86_64 
        -cdrom bootable.iso
        -boot order=d 
        -drive file=myimg.raw,format=raw

