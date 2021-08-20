sudo pacman -S fcitx5 fictx5-configtool libhangul fictx5-hangul fcitx5-gtk fcitx5-qt

edit /etc/environment
    GTK_IM_MODULE=fcitx 
    QT_IM_MODULE=fcitx 
    XMODIFIERS=@im=fcitx

ficitx5-configtool
