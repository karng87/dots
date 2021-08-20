# Device hierarchy (디바이스 체계/구조)
    리눅스 커널은 실제로 
        디바이스들을 트리 형태의 구조로 표현하고 
        이 정보들을 sysfs을 통해 나타내며

# device
    /dev

# sysfs
    /sys

# disk
    /dev/disk
        build-in persistent naming schemes
# ls -iR /dev/disk

# KERNEL=="hdc", SYMLINK+="cdrom cdrom0"
    KERNEL: 커널에 의해서 디폴트로 정해진 장치의 주소 이름
    “/dev/cdrom”과 “/dev/cdrom0”란 두 개의 심볼릭 링크를 생성, 
    두 링크 모두 “/dev/hdc”를 연결하고 있습니다. 
    위처럼 NAME key가 지정되지 않았다면 
    default kernel name(hdc)으로 지정됩니다.


    
