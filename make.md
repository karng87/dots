# options
### -M src
    Make dep
### -C dir (Change dir)
    위에서도 밝혔듯이 Makefile을 계속 읽지 말고 우선은 dir로 이동하라는 것이다. 순환 make에 사용된다.

### -d (debug)
    Makefile을 수행하면서 각종 정보를 모조리 출력해 준다. (-debug) 출력량이 장난이 아님... 결과를 파일로 저장해서 읽어보면 make 의 동작을 대충 이해할 수 있다.

### -f file
    file 에 해당하는 파일을 Makefile로써 취급한다. (-file)

### -t (touch)
    파일의 생성 날짜를 현재 시간으로 갱신한다. (-touch)

### -v
    make의 버전을 출력한다. (전 GNU make 3.73 을 씁니다.) (-version)

### -p (properties)
    make에서 내부적으로 세팅되어 있는 값들을 출력한다. (-print-data-base)

### -k (keep-going)
    make는 에러가 발생하면 도중에 실행을 포기하게 되는데 (-keep-going) -k 는 에러가 나더라도 멈추지 말고 계속 진행하라는 뜻

# var

### $@
    target name
### $*
    target name without file extension

### $<
    each dependence file

### $?
    latest dependency files than target file
### $^
    all dependency files

### makedeps
    dep: 
        gccmakedeps $(SRCS)
