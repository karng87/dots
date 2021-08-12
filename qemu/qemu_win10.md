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
