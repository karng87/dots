# blank(공백)  ;(명령 구분자) 제약 없이 사용 가능
    동일한 문자가 명령문의 스트링에 포함될 경우
        : 반드시 escape 해주어야 한다.

## command 
### subshell substition(`())
    () ` 
        : $(cmd arg) (cmd arg)`cmd arg `
        subshell substitution
### pipe(|) 
    |
        : subshell

### background(&)
    &
### terminator command(;)
    ;

### and or (&& ||)

## assignment(=) +=)
### += (only bash)

## expansion, substitution($)
    $v1 : value
    $() : command
    ${} : parameter 
    $(()) : arithmetic

## redirection
### < << <<<
### > >>

## quotes
### '' ""

## globbing
### * ? []

## escape
### \

---
---
### stdio(-)
    seq 10 | paste - - -
        1 2 3
        4 5 6
        7 8 9
        10
    echo hello | cat - test.txt
        hello
        test.txt contents

    cat file | diff - file2

    ps jf | vi -

### stdio(-)
    gcc -S hello.c -o -

    tar czvf  - dir1 | split -d -b 100M - dir1.gz
    cat dir1.gz* | tar xzvf - C path

    tar -czv -f - dir1 | nc -N ip port
    wget -q -O - http...


