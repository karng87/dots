sudo vim /etc/default/grub
> GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet video=1920x1080"

sudo grub-mkconfig -o /boot/grub/gurb.cfg

cd .config/i3
vim config
> /terminal
>> replace terminator
> bar {
    status_command i3status
  }
exec xrandr --output DP.. 1920x1080
exec nitrogen --restore
reboot
