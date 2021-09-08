#!/bin/bash

dom=hani_win10
domain=hani_win10

virtdir=/var/lib/libvirt
virtio_drv="https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.204-1/virtio-win.iso"
## load driver Balloon, NetKVM, visotor

## virsh net-... 
# sudo virsh net-list --all
# sudo virsh net-edit default
# sudo virsh net-undefine br10


# sudo ip link show type bridge
# sudo ip link add br0 type bridge
# sudo ip link set enp0s29ulul up
# sudo ip link set eno0s29ulul master br0
# sudo ip link show master br0 # for check 
# sudo ip address add dev br0 192.168.0.2/24
# ip address show br0
# sudo pacman -S bridge-utiles
# sudo vi /etc/systemd/network/interfaces

## bridge-network.xml
#<network>
    #<name>bridged-network</name>
    #<forward mode="bridge" />
    #<bridge name="br0" />
#</network>
# sudo virsh net-define bridge-network.xml


sudo curl -o "${virtdir}/imagesi" "${virtio_drv}" \
&& sudo iptables -A INPUT -p tcp -m tcp --dport 5900 -j ACCEPT \
&& sudo iptables-save -f /etc/iptables/iptables.rules \
&& sudo virt-install \
--virt-type kvm \
--name windows10 \
--vcpus sockets=2,cores=1,threads=1 \
--cpu host-passthrough,cache.mode=passthrough \
--memory 4096 \
--hvm \
--os-variant win10 \
--cdrom ${virtdir}/boot/win10.iso \
--disk path=${virtdir}/images/virtio-win.iso,device=cdrom \
--disk path=${virtdir}/images/${dom}.qcow2,device=disk,format=qcow2,size=60,bus=virtio \
--network network=br20,model=virtio \
--graphics vnc,port=5900,listen=0.0.0.0 \
--sound default

## cd
# sudo virsh domblklist ${dom}
# sudo virsh change-media ${dom} sda --eject
# sudo virsh change-media ${dom} sda windrv.iso --insert

## nain command
# sudo virsh list --all
# sudo virsh start ${dom}
# sudo virsh reboot ${dom}
# sudo virsh shutdonw ${dom}
# sudo virsh destroy ${dom}
# sudo virsh undefine ${dom}

## snapshot command bakcup restore
# sudo virsh snapshot-create-as ${dom} --name ${dom}-01
# sudo virsh snapshot-revert ${dom} --snapshotname ${dom}-01
# sudo virsh snapshot-list ${dom}
# sudo virsh snapshot-delete ${dom} --snapshotname ${dom}-01

## back all virt
# sudo virsh dumpxml ${dom} > /back/${dom}.xml
# sudo cp ${virtdir}/images/${dom}.qcow2 /back

## reinstall virt
# sudo cp /back/${dom}.qcow2 ${virtdir}/images
# sudo define --file /back/${dom}.xml

