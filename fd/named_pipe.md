# pipe 
    데이터를 저장하지 않기 때문에 
    파일 내용을 
        random access 할 수 없습니다. 
    파일을 open 한 후에는 
        처음부터 끝까지 
        한 번에 읽거나 써야 합니다.
    mkfifo mypipe

    데이터를 mypipe 로 입력할때 
        exec 3<> mypipe
            pipe 로 데이터를 전달할 때 
                데이터를 읽는 상대편이 없으면 
                    block 되기 때문입니다. 
    pipe 는 파일과 달리 
        데이터를 저장하지 않기 때문에 
        읽는 상대편이 없으면 
            작업이 중단됩니다. 
    writer 가 없는 상태에서 
        읽기를 시도할 때도 
            block 됩니다. 
    pipe 는 
        writer 와 
        reader 가 
            서로 연결되어 있어야 
                작업이 진행될 수 있으며 
        writer 가 쓰기를 완료하고 종료하게 되면 
        reader 도 함께 종료하게 됩니다.

# anonymous pipe
    unnamed pipe
    | : 파이프를 이용해 명령들을 연결하여 사용하거나 
        명령, 프로세스 치환을 사용하면 
        명령 실행 중에 
            자동으로 pipe 가 생성되어 사용된 후 사라지게 되는데요. 
            이때 생성되는 파이프를 이름이 없다고 해서 
            unnamed pipe 또는 
            anonymous pipe 라고 합니다. 

    named pipe 
        직접 파이프를 
            파일로 만들어 사용합니다. 
        shell 에서 IPC (Inter Process Communication) 필요할때 활용할 수 있습니다.

# named pipe
        파일과 동일하게 사용될 수 있는데 
        파일과 다른 점은 
            redirection 을 이용해 데이터를 출력했을 때 
                파일은 데이터를 저장하는 반면 
            pipe 는 저장하지 않는다는 점입니다. 

        만약에 
            디스크 용량이 부족한 상태에서 
            용량이 큰 파일을 다루고자 할 때 
            pipe 를 이용하면 
            프로세스 중간에 
            임시파일을 만들지 않아도 되므로 
            디스크 사용을 피할 수 있습니다. 

        다음은 gzip 으로 압축돼 있는 
        mysql 데이터 파일을 압축 해제하여 
            mypipe 로 출력하고 
            mysql 프롬프트 상에서 
            named pipe 를 이용해 
            테이블에 로드 하는 예입니다.

```bash 
    mkfifo /tmp/mypipe       # 또는 mknod /tmp/mypipe p
    gzip --stdout -d dbfile.gz > /tmp/mypipe
        # -d : -- decompress
        # --stdout : -c

        # 다음은 mysql 프롬프트 상에서 실행하는 명령입니다.
    mysql> LOAD DATA INFILE '/tmp/mypipe' INTO TABLE tableName;
```
## nc
    network concatenate
    nc -l localhost 8080
        option : -l == listen to port 8080 in here
        return: print the message from port 8080 to stdio




