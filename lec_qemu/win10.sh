#!/bin/bash
sudo virt-install \
--virt-type kvm \
--name windows10 \
--vcpus sockets=2,cores=1,threads=1 \
--cpu host-passthrough,cache.mode=passthrough \
--memory 4096 \
--hvm \
--os-variant win10 \
--cdrom /var/lib/libvirt/boot/win10.iso \
--disk path=/var/lib/libvirt/images/virtio-win-0.1.204.iso,device=cdrom \
--disk path=/var/lib/libvirt/images/win10.qcow2,device=disk,format=qcow2,size=60,bus=virtio \
--network network=br20,model=virtio \
--graphics vnc,port=5900,listen=0.0.0.0 \
--sound default
