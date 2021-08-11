# Advanced Linux Sound Architecture
    ALSA

## alsactl
    alsact init
        initialize the sound card
    alsactl restore
        read info from editable text configure
    alsactl store
        save to a file from current info

## alsamixer
    = amixer
    but provides a more intuitive n curse s based interface
    control volume
## amixer -c number

    amixer -c 0 info
    amixer -c 1 info
    amixer -c 1 scontrols
        simple controls
    
    amixer -c 1 scontents
        simple contents

    amixer contents
    amixer controls

## aplay -c 1 -t wav au.wav
## ffplay au.mp3

# Pulss Audio
    sound server: parrallel enable
    source <-> sink

## pactl
    pacmd : older command
