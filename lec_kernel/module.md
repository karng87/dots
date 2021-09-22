# lsmod
# modinfo module_name
# systool -v -m moudle_name

### modprobe -c | less
### modprobe -c | grep module_name
### modprobe --show-depends module_name

## automatic module loading with systemd
    sudo vi /etc/modules-load.d/my_filename.conf
        # load virtio_net.ko at boot
        vhost_net

    cf) blacklist pcspkr


# mmanual module handling

### to load a module
    modprobe module_name
### to load a module by filename( /usr/lib/modules/${uname -f}:
    insmod filename [args]

### to unload a module
    modprobe -r module_name
    or
    rmmod module_name
