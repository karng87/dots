# install
    paru qemu
    paru virt-manager
    paru iptables-ntf dnsmasq bridge-utils

        만약 커널에 문제가 있다면
    /etc/mkinitcpio.conf 에서 MODULES에
        kvmgt vfio 
        vfio-iommu-type1 vfio-mdev 
        virtio-net virtio-scsi virtio-serial virtio-balloon 
            를 추가해주고 
    sudo mkinitcpio -p linux

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
    download window dirver
        https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/?C=M;O=D

    https://www.ibm.com/docs/en/linux-on-systems?topic=choices-kvm-default-nat-based-networking

## network
    sudo virsh net-define ./new-kvm-nat-network.xml
## display driver
    qxl: redhat qxl controller
## share dir
    spice's webdav
    https://dausruddin.com/how-to-enable-clipboard-and-folder-sharing-in-qemu-kvm-on-windows-guest/

    paru virt-viewer
    paru cockpit

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
