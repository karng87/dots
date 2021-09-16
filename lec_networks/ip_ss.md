# ip(intenet protocol), ss(socket state)
    ip
        ip config
    ss
        investigate network ports
        = netstat (deprecated)
    ss -at
        all tcp socket
    ss -au
        all udp socket
    ss -atn
        all tcp socket with port number

# ip address
    ip a
    ip address add dev br0 192.168.0.2/24
        nmcli connection modify br0 ipv4.addresses 192.168.0.2
        nmcli connection modify br0 ipv4.dns 8.8.8.8
        nmcli connection modify br0 ipv4.method manual 
            static ip
        nmcli connection up br0 
    ip address del 192.168.0.2 dev eth0
    ip route del 192.168.0.2 dev eth0

# ip link 
    ip link show type bridge
        link - lan card interface

# ip route 
    ip route show
        navigate a way

# ip neighbor
     = arp (deprecated)

### netwrok interface
    ip link show dev eth0
    ip link set etho up|down
### statc ip address
    ip address add 192.168.0.2/24 192.168.0.255 dev eth0

# bridge

### creating a bridge
    ip link add name br0 type bridge
    ip link set bridge br0 up

    to add interface
        ip link set eth0 up
        ip link set eth0 master br0
    to remove interface
        ip link set etho nomaster
        ip link set eth0 down

### delete a bridge
    ip link delete br0 type bridge

### bridge link
    show bridge

# bridge-utils

### show current bridges
    brctl show
    ip link show type bridge

### create a new bridge
    brctl addbr br0
        add bridge br0

### add a device to a bridge
    brctl addif br0 eth0
        add interface br0 eth0

### set the bridge device up
    ip link set dev br0 up

### delete a bridge
    ip link set dev br0 down
    brctl delbr br0
