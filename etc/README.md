# Avahi
    Zero-configuration networking
        including a system for multicast DNS/DNS-SD service discovery
    For example
        you can plug into a network and printers 
## Firewall
    Be sure to open UDP port 5353 if you are using a firewall.

## sudo pacman -S avahi
## sudo pacman -S nss-mdns
    using a hostname.local

## systemctl enable avahi-daemon.service
## systemctl start avahi-daemon.service
## edit /etc/nsswitch.conf
    hosts: ... mdns_minimal [NOTFOUND=return] resolve [!UNAVAIL=return] dns

## http://localhost:631
    add priter

## airprint service
    add /etc/avahi/services/airprint.service

## ssh
    cp /usr/share/doc/avahi/ssh.service /etc/avahi/service/
## samba
    auto

# CUPS
    Common Unix Printing System
    made by apple
### system v print command
#### lp -d -n
    -d printer name
    -n number of copies 
#### lpstat
    -p -t -a
#### cancel username (ex admin)
    -a cancel all jobs

# IPP
    internet printing protocol
