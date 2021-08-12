# Advanced Linux Sound Architecture
    ALSA는 대부분의 DAC 칩의 한계로 인해 
    한 번에 하나의 채널 만 하드웨어로 전송하게 되는데 
    이로 인해 단일 응용 프로그램 만 ALSA에 한 번에 소리를 보낼 수 있다. 
    즉, 미디어 플레이어의 음악과 메신저의 알림 음을 동시에 받을 수 없다. 
    ALSA 개발자는 이 것을 개선하기 위해 
        Mixer를 구현하였고 
            여러 가상 오디오 채널을 단일 채널로 결합 할 수 있게 한 것이 
            alsalib 이다.


    이것이 꽤 괜찮아 보일 수 있으나 
    라이브러리 수준의 믹싱 방식은 데스크톱 환경에서 여전히 문제가 남아있었다. 
    라이브러리를 사용하면 믹싱 할 수 있지만 
        단일 응용 프로그램 만 오디오를 출력 할 수 있다. 
        그리고 정확히 이 제한은 소위 
    "사운드 서버"의 등장으로 이어진다.

     최신 데스크톱에서 발생한 가장 큰 문제는 
        여러 응용 프로그램이 사운드를 병렬로 출력해야 한다는 것이다. 
        위에서 설명한 것처럼 이것은 일반 ALSA로는 불가능했다. 
        그래서 사운드 서버가 등장했다. 
     사운드 서버는 기본적으로 컴퓨터의 백그라운드에서 지속적으로 실행되는 서비스 
     즉, 데몬이다.

    사운드 서버는 오디오를 스피커로 출력해야 하는 
        모든 애플리케이션에 
    믹서 슬롯을 제공한다. 
        응용 프로그램은 다양한 프로토콜을 통해 
        이 사운드 서버에 연결하고 
        다양한 형식의 오디오를 병렬로 스트리밍 할 수 있다. 
    그런 다음 사운드 서버는 들어오는 
        모든 오디오 슬롯을 함께 믹싱하고 
        이를 다시 ALSA로 전달한다 
        (따라서 이는 마스터 채널과 비슷해짐).

    마침내 다양한 소스의 오디오를 병렬로 출력 할 수 있게 되었고, 
    이 개념은 애플리케이션 별 볼륨 제어 및 기타 효과와 같은 
    다른 기능도 함께 얻을 수 있었다.

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
