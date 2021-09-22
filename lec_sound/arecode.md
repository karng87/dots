# lspic | grep Audio
    cat /proc/asound/cards
# amixer

# aplay -l
    card num, device num

# arecord -l
    arecord
        -D  : device plughw:0,0, hw:0,0
        -d  :duration secounds
        -c  : 1=mono 2=stereo
        -t  : type wave raw 
        -r  : rate 

    arecord -D plughw:0,0 -t wav -c 2 -d 60 test.wav

# TCP
    arecord -D pluginhw:0,0 -t raw -c 1 -r 16000 | speexenc | ip 7080
