# sudo pacman -S avahi
# sudo pacman -S python-pycups
    python3 airprint-generate.py -d /etc/avahi/services
## /etc/nsswitch.conf
    add 
        hosts: ... mdns_minimal [NOTFOUND=return] resolve ...
## /etc/dhcpd.conf
    #noipv4ll

##
