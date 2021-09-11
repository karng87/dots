# escape
    \ ''

# quote
    no quotes
        : 모든 메타 문자가 해석 됨으로
        : / 과 ''을 이용하여 모든 문자를 escape 적용하고 / 지운다.
        : 모든 메타 문자 키워드를 해석해서 치환한다.
        : echo \a\b\ \$ \" \' \( \{ \[ \* \? \!

    single quotes
        : '' 안에서 메타문를 해석 하지 않음으로 
             모든 문자를 escpate 하지 않고 그대로 보내고 
             ' 을 지운다.

        : echo 'ab\$'''
    
    double quotes
        : ""안에서 메타 문자로 해석되는 $ `` ! " \ newline 을 \ 으로 escape 할 수 있다.

## no quotes
    둘 이상의 공백은 의미가 없으므로 하나의 공백으로 대체

    기본적으로 
        모든 
            "문자"에 대해서
                escape 처리해서 인자로 넘겨준다.

        shell 키워드 
            : if 
        메타문자 
            :   () ` | ; &  && ||
                > >> 
                < << <<<
                $ = +=
                \ ' "

        glob 문자 
            :   * ? [] ~

        alias, 
            : alias vi=nvim

## in double quotes
    " $ ` \ newline(real newline not \n)
        만 escape 문자를 해석 처리 해서 특수 기능을 없애주고 "" 지운다
       echo "\" \$ \` \\ \newline"
            : 특수기능 삭제 

## in single quotes
    any escape 전혀 처리해주지 않는다
    single quote 연결만 사용 가능 

    foo'bar
    echo 'foo'\''bar'
    echo 'foo'"'"'bar'

    ```bash
        AA=100
        sh -c "AA=200; echo $AA"
            100
        sh -c 'AA=200; echo $AA'
            200
    ```
