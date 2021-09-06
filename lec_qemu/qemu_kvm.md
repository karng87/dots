# Virtual Machine (VM)
[redhat vm](https://www.redhat.com/en/topics/virtualization/what-is-a-virtual-machine)
    A virtual machine (VM) is 
        a virtual environment that 
            functions as a virtual computer system 
                with its own CPU, memory, network interface, and storage, 
            created on a physical hardware system (located off- or on-premises). 
### with
    서로 힘을 보태는, 혼자는 할 수 없는.
### by
    요리저리 봐도 주변 전체에서 깔려 있어 어쩔수 없이 압박을 받는

### on, off
    연결된. 켜진

### from
    눈으로 경계를 볼수 있는 집합의 원소들중에서 가지고 나온 원소
### of
    경계지울수 없는 집합의 원소들중에서 떼어 가지고 온 원소
### to
    결국 대응이 된

# Hypervisor
    hyper : 과도한
    visor : 햇빛 가리개
    완전 가리개
        : processor
    A hypervisor is software that 
        creates and runs virtual machines (VMs). 
    A hypervisor, sometimes called 
        a virtual machine monitor (VMM), 
            isolates 
        the hypervisor operating system and resources 
            from the virtual machines and 
        enables the creation and management of those VMs.
### KVM
    Kernel-based Virtual Machine (KVM) is a hypervisor
        is an open source virtualization technology built into Linux®. 
    Specifically, 
    KVM lets you turn Linux into 
        a hypervisor that 
            allows a host machine to run multiple, 
            isolated virtual environments called guests or virtual machines (VMs).
    All hypervisors need some operating system-level components—such as 
        a memory manager, 
        process scheduler, 
        input/output (I/O) stack, 
        device drivers, 
        security manager, 
        a network stack, 
            and more—to run VMs. 
    KVM has all these components 
        because it’s part of the Linux kernel. 
    Every VM is implemented as a 
        regular Linux process, 
        scheduled by the standard Linux scheduler, 
        with dedicated virtual hardware 
            like a network card, graphics adapter, CPU(s), memory, and disks.

### vmware xen 
    vmware: full virtualization
    xen: para-virtualization
    kvm: kernel base virtualization

### Qemu
    When used as a machine emulator
        : run programs made for one machine on a different machine
    When used as a virtualization
        : execute the guest code directly on the host CPU
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
### qemu-system-x86_64 -cdrom win.iso -m 4096 -enable-kvm -drive file=win,format=raw -cpu host -smp cores=2 -usbdevice tablet -vga std

### qemu-system-x86_64 -m 4096 -enable-kvm -drive file=win,format=raw -cpu host -smp cores=2 -vga std -usbdevice tablet -soundhw hda

#### Intel CPU
        cat /proc/cpuinfo | grep vmx
#### AMD CPU
        cat /proc/cpuinfo | grep svm
#### spice guest tools
        intall spice guest tools in windows guest 
#### NAT
    network address translation : hub
    NAT 는 사설 IP 주소와 공인 IP 주소를 변환해 주는 일종의 변환기 입니다. 
    NAT = 인터넷 공유기 라는 공식을 대입시키시면 됩니다.

    VMware Workstation 은 이 NAT 라우터를 자체적으로 내장하여 
    내부 사설망으로 구성된 가상 머신들이 외부와 통신할 수 있게 해줍니다.

#### Bridged Network (32 bit - 4 byte)
    Dxxx.xxxx.xxxx.hhhh/24
    CCxx.xxxx.xxxx.hhhh/24
    BBBx.xxxx.xxxx.hhhh/24
        D,CC,BBB:
            class
        subnet: 
                32 - 24 = 8 (6 +2) 
                network id(24) + host id((32-24)-2)

        subnetmask:
                255.255.255.0
                255   => network id range
                0     => host id range + network ip + broadcast ip

