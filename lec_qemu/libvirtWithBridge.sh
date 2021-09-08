export MAIN_CONN=enp3s0f0
bash -x <<EOS
systemctl stop libvirtd
nmcli c delete "$MAIN_CONN"
nmcli c delete "Wired connection 1"
nmcli c add type bridge ifname br0 autoconnect yes con-name br0 stp off
#nmcli c modify br0 ipv4.addresses 192.168.1.99/24 ipv4.method manual
#nmcli c modify br0 ipv4.gateway 192.168.1.1
#nmcli c modify br0 ipv4.dns 192.168.1.1
nmcli c add type bridge-slave autoconnect yes con-name "$MAIN_CONN" ifname "$MAIN_CONN" master br0
systemctl restart NetworkManager
systemctl start libvirtd
systemctl enable libvirtd
echo "net.ipv4.ip_forward = 1" | sudo tee /etc/sysctl.d/99-ipforward.conf
sudo sysctl -p /etc/sysctl.d/99-ipforward.conf
EOS

## sudo virsh net-define bridged-network.xml
