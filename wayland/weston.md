# DRI
    Direct Rendering Infrastructure(DRI)

    DRI는 
        X Window 시스템 환경에서 
    그래픽 하드웨어를 직접 접근하기 위한 
        framework이다. 

    DRI는 
        X server의 변경과 
        여러가지의 클라이언트 라이브러리, 
        그리고 커널의 DRM(Direct Rendering Manager)를 포함 한다. 
    DRI 사용의 가장 중요한 목표는 
        Mesa(Opengl을 지원하는 공개소스)를 위한 
            H/W 가속을 지원하는
        빠른 OpenGL 프로그램을 만들기 위함이다. 
    (GPU H/W를 이용하는 빠른 가속을 User space 또는 어플리케이션에 지원하기 위해)

    수많은 3D 가속 드라이버가
        (3DFX, AMD, Intel, Matrox) 
    DRI 스펙으로 구현 되었다.

    DRI는 크게 다음 3개의 컴포넌트를 포함한다.
        - X server
        - The direct rendering client
        - Kernel-level device driver(DRM)


# [[DRM]](https://en.wikipedia.org/wiki/Direct_Rendering_Manager)
[[!Access to video card without DRM]](.img/Access_to_video_card_without_DRM.svg)
    Kernel-level device driver(DRM)
    Direct Rendering Manager

    DRM은 
        FBDEV(fb드라이버)를 
        대체하는 디스플레이 컨트롤 드라이버이자 
    GPU접근을 가능케 하는
        리눅스 커널의 서브 시스템이다. 
    (DRM드라이버를 사용하여 디스플레이컨트롤과 GPU컨트롤을 함께 제어 할 수 있다.)

    리눅스 커널의 서브 시스템인 
        DRM(Direct Rendering Manager)은 
        GPU를 접근할 수 있는 Display H/W IP
            (통칭하여 그래픽 하드웨어, X86 desktop PC에서의 Video cards)를 
            제어하기 위한 커널 드라이버라고 할 수 있다.

    커널의 DRM드라이버는 크게 다음과 같은 기능의 User API를 제공 하고 있다.
        • GPU Access API: 
            User-space에서 GPU를 access(3D rendering, video decoding)하기 위한 API
    
        • DRM Security:
            master로 지정된 1개의 프로세스에 의해서만 
            호출 되도록 제한하는 기능을 제공하는 API

        • KMS(Kernel Mode Setting) API: 
            디스플레이 설정(resolution, refresh rate등)을 위한 API
        • GEM(Graphics Execution Manager) API: 
            그래픽 메모리(allocation, free, synchronization 등) 관리를 위한 API

# KMS 
    Kernel Mode Setting(KMS)
    kernel에서 
        그래픽 하드웨어 출력에 대한 
        설정/변경 을 담당한다.
    (resolutions, color depths, memory layouts and refresh rate)

    커널 부팅시에 
        mode-setting이 가능해 졌다.
# GEM
    Graphics Execution Manager (GEM)
    • GEM은 GPU의 메모리를 할당하고 해제 한다.
    • GEM은 
        i915 그래픽 드라이버를 위한 
        비디오 메모리 매니저를 제공하기 위해 
        intel 엔지니어에 의해 개발되었다

    • GEM을 통해 
        user space 프로그램은 
            gpu의 비디오 메모리에 있는 
                메모리 객체를 create, handle, destroy할 수 있다

    • user space 프로그램이 비디오 메모리를 필요로 할 경우 
        GEM API를 사용하여 DRM driver에세 할당을 요청하면 된다.

    • GEM API는 buffer를 populate하고 
        필요하지 않을 때 release하는 동작을 제공한다.
    • GEM 은 
        동일한 DRM device를 사용하는 
        두개 이상의 user space 프로그램이 GEM개체를 공유할 수 있게 한다.

# X Window & Wayland

    wayland는 그래픽 시스템에 있어 
        서버와 
        클라이언트간의 
        통신을 
            정의한 프로토콜 이다. 

    wayland는 초창기에 Kristian Høgsberg에 의해 
    기존 X window를 더 단순하고 모던하게 바꾸려는 목적과 함께 
    오픈소스 프로젝트로서 주도 되었으며 
    이러한 노력의 일환으로 
        wayland 레퍼런스 컴포지터인 
            weston의 개발이 함께 시작되었다. 

    프로젝트가 시작 된 주요 이유는 
        X window에서 수행되던 수많은 하부 기능들이 
        커널(memory management, command scheduling, mode setting)이나 
        라이브러리(cairo, pixman, freetype, fontconfig, pango, etc)로 
        옮겨져 사용 되지 않음에도 불구하고 
        user는 잔존해 있는 X protocol을 지원해야만 했기 때문이다.
    [[!x windows vs wayland]](./img/x_vs_wayland.png)
    [[!display server]](./img/display_server.png)
    [[!display server protocol]](./img/display_server_protocol.png)
    [[!without_wayland]](./img/without_wayland.png)
    [[!with]](./img/with_wayland.png)

# 원리
    디스플레이 패널은 
        CPU/GPU가 준비해 놓은 버퍼를 
        특정 주기마다 출력한다
        (AP를 사용하는 임베디드에서는 
            디스플레이 컨트롤러 H/W IP가 이역할을 담당한다). 

## vertical blank
    이 출력되는 구간을 
        Vertical Blank
    (일반적인 패널에서 좌측 위 끝에서 우측아래 끝까지 그려지는 구간)라고 하며 

    이 주기가 패널의 fps를 결정 하게 된다. 
    또한 tearing을 방지하기 위해 
    이 구간 동안 AP의 디스플레이 컨트롤러 IP가 
    frame buffer에 접근하지 않도록 구현되어 있다.(Vsync, sync/fence 활용)

### tearing: 
    framebuffer가 패널로 출력 되고 있는도중 
    CPU가 frambuffer 영역을 갱신하여 
    패널 화면에 
    다음 frame이 섞여 출력되어 
        화면이 깨져보이는 현상
