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
# KVM
    Kernel-based Virtual Machine (KVM) is 
        an open source virtualization technology built into Linux®. 
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

# install
    paru qemu
    paru virt-manager
    paru iptables-ntf dnsmasq bridge-utils

## check
    LC_ALL=C lscpu | grep Virtualization
    zgrep CONFIG_KVM /proc/config.gz
        The module is available only if it sit set to either y or m.
    lsmod | grep kvm

    zgrep VIRTIO /proc/config.gz
    lsmod | grep virtio
     In case the above commands return nothing, 
     you need to load the kernel modules manually.

### check: kernel
    만약 커널에 문제가 있다면
    /etc/mkinitcpio.conf 에서 MODULES에
    MODULES=(kvmgt mdev vfio kvm irqbypass vfio-iommu-type1 vfio-mdev virtio-net virtio-blk virtio-scsi virtio-serial virtio-balloon i915)

        kvmgt vfio 
        vfio-iommu-type1 vfio-mdev 
        virtio-net virtio-blk virtio-scsi virtio-serial virtio-balloon 
            virtio-serial: error
            를 추가해주고 
    sudo mkinitcpio -p linux

### check: grub
    만약 인텔cpu라면
    /etc/default/grub 에서 
        GRUB_CMDLINE_LINUX_DEFAULT의 끝에 
            intel_iommu=on을 추가합니다.
    sudo grub-config -o /boot/grub/grub.cfg
    sudo reboot now

        실행할때마다 관리자 권한을 요구하므로, 
        매번 비밀번호를 입력하는 것이 싫다면,
            livbrit 그룹에 사용자를 추가하고
    sudo usermod -a -G libvirt $(whoami)

    /etc/libvirt/libvirtd.conf
        unix_sock_group = "libvirt" 
            주석을 제거
    https://getlabsdone.com/10-easy-steps-to-install-windows-10-on-linux-kvm/

## download
### iso
    https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/?C=M;O=D
    https://github.com/virtio-win/virtio-win-pkg-scripts/blob/master/README.md

### network xml
    https://www.ibm.com/docs/en/linux-on-systems?topic=choices-kvm-default-nat-based-networking

## network
    sudo virsh net-define ./br10.xml
    sudo virsh net-autostart br10

## display driver
    qxl: redhat qxl controller

## share dir
    spice's webdav
    https://dausruddin.com/how-to-enable-clipboard-and-folder-sharing-in-qemu-kvm-on-windows-guest/

    sudo pacman -S virt-viewer
    sudo pacman -S cockpit
    in guest windows 10
        : install spice webdav 
    in virt-manager
        : add channel
            - name: org.spice-space.webdav.0
            - type: spiceport
            - channel: org.spice-space.webdav.)
    regist cockpit service
        sudo systemctl enable --now cockpit.socket
        open http://localhost:9090



## create hda
    qemu-img create -f qcow2 win.raw 50G
    qemu-img create win.raw 50G

## install windows 10
    qemu-system-x86_64 \
        -m 4G \ 
        -cpu host \
        -smp sockets=1,threads=2 \
        -cdrom Win10_21H1_Korean_x64.iso \
        -drive file=win.raw,format=raw \
        -enable-kvm

## windows 10 
    qemu-system-x86_64 \
        -m 4G \
        -enable-kvm \
        -cpu host \
        -smp sockets=1,cores=2,threads=2 \
        -drive file=windows.raw,format=raw \
        -soundhw all

## /etc/mkinitcpio.conf
    MODULES=(kvmgt vfio vfio-iommu-type1 vfio-mdev virtio-net virtio-scsi virtio-serial virtio-balloon i915)
    sudo mkinitcpio -p linux
## /etc/default/grub
    if intel cpu
    GRUB_CMDLINE_LINUX="intel_iommu=on"
