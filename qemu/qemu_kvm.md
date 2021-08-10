# vmware xen kvm
    vmware: full virtualization
    xen: para-virtualization
    kvm: kernel base virtualization

## hypervisor
    a kind of emulator
    virtual machine monitor
    [[!hypervisor]](./img/hypervisor.svg)

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

## basic raw image:
### qemu-img create -f raw win 25G
### qemu-system-x86_64 -cdrom win.iso -m 4096 -enable-kvm -drive file=win,format=raw -cpu host -smp cores=6 -usbdevice tablet -vga std

### qemu-system-x86_64 -m 4096 -enable-kvm -drive file=win,format=raw -cpu host -smp cores=6 -vga std -usbdevice tablet -soundhw hda

#### Intel CPU
        cat /proc/cpuinfo | grep vmx
#### AMD CPU
        cat /proc/cpuinfo | grep svm
#### spice guest tools
        intall in windows guest 
#### NAT
    network address translation : hub
    NAT 는 사설 IP 주소와 공인 IP 주소를 변환해 주는 일종의 변환기 입니다. 
    NAT = 인터넷 공유기 라는 공식을 대입시키시면 됩니다.

    VMware Workstation 은 이 NAT 라우터를 자체적으로 내장하여 
    내부 사설망으로 구성된 가상 머신들이 외부와 통신할 수 있게 해줍니다.

#### Bridged Network
    호스트의 네트워크와 게스트의 네트워크를 브릿지하여(연결하여) 
    게스트 컴퓨터가 네트워킹 하는 방식입니다. 
    즉, 호스트와 게스트를 하나로 연결하여 
    두 개의 네트워크를 마치 하나의 네트워크처럼 쓰는 것 입니다.

    브릿지 네트워킹은 
        VMnet0 스위치에 
        게스트 컴퓨터의 네트워크 어댑터와 
        호스트 컴퓨터의 네트워크 어댑터가 연결되어 
    서로 브릿지된 상태입니다. 
    이렇게 게스트와 호스트의 네트워크가 브릿지 됨으로써 
    호스트 네트워크와 게스트 네트워크가 서로 동등한 수준의 네트워크를 제공받게 됩니다.

    호스트와 게스트가 서로 동등한 자격을 가지기 때문에 
    게스트 컴퓨터에도 호스트 컴퓨터와 같이 
        공인(Public) IP를 할당하거나 
        호스트 컴퓨터가 사설망에 연결된 경우 호스트와 동일한 IP 대역을 할당할 수 있습니다. 
        이 때는 반드시 공인이든 사설이든 
        게스트 컴퓨터에도 할당할 수 있는 여분의 IP가 존재해야 합니다.
    

