# dbus
    Daemon Bus
    D-버스는 각 프로세스가 
        양방향으로 연결되어있는 라우터의 일종으로 간주 할 수 있다.
    D-버스는 
            백그라운드에서 실행되는 
        서비스 데몬으로써 
    우리는 응용 프로그램간의 기능 및 통신을 하는데 
        버스 데몬을 사용한다. 
    버스 데몬은 응용 프로그램에서 메시지 전달 및 수신의 역할을 수행한다.

    D-버스 데몬은 두 가지 유형이 있는데 
        Session Bus 
        System Bus.
    [[!systembus]](./img/systembus.png)
    [[!sessionbus]](./img/systembus.png)

    System Bus는 커널과 다양한 시스템 전체의 이벤트와 통신 할 수 있다. 
    하드웨어 추상화 계층 (HAL), 
    네트워크 매니저이나 
    udev등은 
        System Bus를 사용하는 대표적인 응용프로그램이다. 
    System Bus는 임의의 응용프로그램들이 시스템 이벤트를 
    spoof(도용)하지 못하도록 되어있다.

# Method
    다른 object에 의해 호출
        선택적으로 
    input (arguments or “in parameters”)과 
    output (return values or “out parameters”)을 가진다.

# Signal
    broadcast 메시지로 
        하나의 object에서 
    해당 signal에 대해 관심이 있는 
        여러 object로 전달된다. (event)

# Message
    프로세스간 전달되는 데이터
        Method Call Message
        Method Return Message
        Error Message
        Signal Message
        Header와 Body로 구성
