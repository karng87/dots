# [ip](https://limkydev.tistory.com/166?category=954021)
    하나의 IP는 네트워크 부분 + 호스트 부분으로 구성되어 있습니다. 
    하나의 네트워크 즉 하나의 브로드캐스트 도메인에 있는 IP끼리 통신하기 위해선
        네크워크 영역이 같아야하며, 
        호스트 IP는 달라야합니다. 
    호스트 IP가 다르지 않다면 IP 충돌이 나겠죠? 
    당연히 통신하기 위해선 네트워크 영역이 같아야 합니다. 
    그런데 잠깐! 네트워크 영역이 다르다고 해서 통신할 수 없을까요? 
    아닙니다. 
    네트워크 영역이 달라도 
    라우터나 게이트웨이와 같은 통신장비를 통해 통신할 수 있습니다!. 
    다만 라우터와 네트워크장비 없이 통신할 수 있는 영역을 
    우리는 
        브로드캐스트 도메인이라고 하고 
    하나의 네티워크 영역에는 
        당연히 네트워크 영역은 같고, 
        호스트 IP는 자신의 노드를 식별할 수 있도록 다른 호스트 IP와 달라야 하겠죠? 

    예를 들어 
        192.168.0.3 과 192.168.0.4 를 보면 
            192.168.0 은 네트워크 영역이고 
            3과 4는 호스트 IP입니다. 
        이를 해석하면 
            192.168.0 이라는 네트워크 영역에서 
            서로 통신할 수 있는 3과 4가 존재한다고 보면 됩니다.

# MAC (Media Access Control) Address
    network card unique serial number

![network layer](./img/network_layers.gif?raw=true)

# Transport protocol
## ARP, TCP, UDP
    ARP
        :translate ip to MAC address
# Presentation Layer
## Jpeg, Mpeg, SMB, AFP protocol
# Application Layer
## HTTP, DNS, FTP, DHCP, SSH, SMTP, Telnet

# subnet
## subnetting
### ip ( 4 byte )
    32자리로 이루어진 2진수, 
    IP는 네트워크 영역과 호스트 IP로 구성됨, 
    동일한 네트워크 내에서 호스트 IP는 각자 달라야 함.
        subnet ip network domain + host ip network domain
        subnet ip network domain : 같을때먄 통신 가능
        host ip network domain : 달라야 식별 가능

    network address :: host ip network all 0
    broadcast address :: hot ip network all 1

### subnet mask
    192.168.0.1/24
        24 numbers is 1 :: 24 bit
        rest numbers is 0 :: 32 - 24 = 8 bit
        subnet network ip :: 24 bit
        subnet host ip :: (32 - 24) - (network addr) - (broadcast addr) 

    ff:ff:ff:f~
        host ip :: 2 ^ 8 range

### subnet network
    ip & subnet mask = subnet ip network
      1101 0010. 0110 0100. 0110 0100. 0000 0001 = 210.100.100.1 (IP주소)
      1111 1111. 1111 1111. 1111 1111. 0000 0000 = 255.255.255.0 (C클래스 기본서브넷마스크)
    --------------------------------------------------------------------
      1101 0010. 0110 0100. 0110 0100. 0000 0000 = 210.100.100.0 (서브넷네트워크)

 
    ip | subnet mask = host ip network
# protocol
## unicast
    only one castinng  with actor
## broadcast
    every casting with actor
    ARP(Address Resolution Protocol)
        : to get MAC address by broadcast protocol
## Multicast
    only special group castingg with actor

# deprecated net-tools in favor o fiproute2
# ipconfig (x) use ip command

## ip command arg(show, add, del, brd)
    ip address show
        ip a add ip/netmask dev eth0
            $> ip a add 192.168.1.2/255.255.255.0 dev eth0
        ip a del ip dev eth0
            $> ip a del 192.168.1.2 dev eth0
        ip a brd ip dev eth0
            $> ip a brd 192,168,1.255 dev eth0

    ip link show
        :: link : link layer(OSI 2), link to the (dhcp) server

        ip link set dev eth0 up
        ip link set dev eth0 down

    ip route show
        ip route list
        ip route add 192.168.1.0/24 dev etho0
        ip route add default 192.168.1.0/24 dev eth0
        ip route del default
        ip route del 192.168.1.0/24 dev eth0

    ip neight show
        ip n show

    
## ip  options
    ip -4 command
    ip -6 command

## ip link
    MTU : maximum transmission unit
    qdisk : queue
    qlen : queue length

## ip link show dev wlan0
