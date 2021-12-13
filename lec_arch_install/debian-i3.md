# sudo enable
## in grub menu on booting
> hit i 
> add 'video=1920x1080' to boot list
> hit ctr+x
## set sudo group to user after reboot
> su -
> apt install xfonts-terminus
> dpkg-recofigure-plow console-setup
> usermod -aG sudo jkarng
> reboot

## intall sudo
> sudo apt update
> su -
> apt install sudo
> exit
> sudo apt update

# xrandr
> xrandr -q
> sudo lshw -c video
> arandr
>> gui xrandr

# i3
> sudo apt install 
    i3 
    xrog 
    lightdm slick-greeter lightdm-settings 
    lxappearance 
    nitrogen
        - (wall paper) 
    pcmanfm
        - (file manager) 
    pulseaudio alsa-utils 
    pavucontrol
        - (audio interfaces in i3)
    vim terminator firefox

> sudo vim /etc/default/grub
>> append 'GRUB_CMDLINE_DEFAULT="quiet video=1920x1980"'
>> uncommet 'GRUB_GFXMODE=1920x1080'
> sudo update-grub
> sudo systemctl enable lightdm
> sudo reboot
>
> sudo vim /etc/lightdm/lightdm.conf
>> uncomment and add 'display-setup-script=xrandr --output HDMI-1 --primary --mode 1920x1080'

>> cp /etc/i3status.conf ~/.config/i3
>>> vim ~/config/i3/i3status.conf
>>>> uncomment needed
> vi i3/config
>> edit 
>>> bar {
>>>         status_command i3statusa -c /home/jkarng/.config/i3/i3status.conf
>>> }



