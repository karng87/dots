# systemd
    a suite of basic building blocks for a linux system.
    it provide a service manager
        that runs as PID 1 and 
        start the rest of the system
    init script
        logging daemon
        date
        locale
        users
    network configuration
        log
        name resolution
## unit
    /usr/lib/systemd/systm/
        units provided by installed packages
    /etc/systemd/system/
        units installed by systemctl enable

    service
    mount
    device
    socket

### analyziing
    syytemctl status
        show system status
    systemctl list-units
        list running units
    systemctl --failed
        list failed units
    systemctl list-unit-files

### checking 
    systemctl help unit
        show a manual page
### power
    systemctl reboot
    systemctl poweroff
    systemctl suspend
    systemctl hibernate
    systemclt hybrid-sleep
### runlevel
    systemctl get-default
    systemctl set-default graphical.target
    systemctl set-default nulti-user.target


# D_BUS
    daemon bus
        for inter-process communication

# systemclt get-default

## systemclt set-default multi-user.target
## systemclt set-default graphical.target
