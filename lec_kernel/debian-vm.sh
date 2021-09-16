#!/bin/bash

sudo virt-install \
  --connect qemu:///system \
  --virt-type kvm \
  --name debian-vm \
  --ram 2048 --vcpus 2 \
  --disk size=10 \
  --disk size=1 \
  --vnc \
  --cdrom /home/jkarng/Documents/debian-11.0.0-amd64-netinst.iso \
  --network bridge=br0 \
  --os-varian debian10

# sudo virsh list --all
# sudo virsh net-list --all
# sudo virsh vncdisplay debian-vm
# sudo virsh vncdisplay win10
# sudo virt-view vnc://localhost

