# commutative property
# associative property
# distributive property
# dd if=/dev/zero of=/dev/sd?
    Dump Disk 
# pacman -Qo bin file

# login shell
    /etc/profile ( . /etc/bash.bashrc )
        -> ~/.bash_profile 
        -> ~/.bash_login 
        -> ~/.profile ( . ~/bashrc )
# non login shell
    /etc/bash.bashrc
    ~/.bashrc

# variable
# command line
    command
    assign operator
# pattern matching
    regular exprssion
        in [[ ]] connand
# glob character
    ( *, ?, [ ] )
    over script
# shebang
    ```bash
    #!/bin/bash
        ./file.sh arg1 arg2 
        bash ./file.sh arg1 arg2
        or
        bash -m file.sh
            -m (monitor)

    #!/bin/sed -f
        file.sh arg
        sed -f file.sh arg

    #!/usr/bin/awk -f
    #!/usr/bin/env -S awk -f ...

    #!/usr/bin/make -f
    #!/usr/bin/env -S make -f ...

    #!/usr/bin/python
    #!/usr/bin/env -S python ...
    #!/usr/bin/node
    #!/usr/bin/env -S node ...
    #!/usr/bin/env -S java --source $(java version)
    ```
    
### variable status
#### unset satus
    only delcare not assignment 
        declare AA
        local AA
    unset

    set u
        => test nounset =>  emit error => exit
        cf) sh -e
            => excute command 

#### null status
    AA=
    AA=""
    AA=''
#### exist satus
    AA=" "

# term
    $
        => ${} :: parameter expantion
                : "${arr[@]}" cf) $@
                    -> "${arr[0]}" "${arr[1]}" ... }
                : "${arr[*]}" cf) $*
                    -> "${arr[0]} ${arr[1]} .. "

        => $(()) :: arithmetic expantion
        => $()  :: substitution command
                :: `cmd arg` == $( cmd arg )

        => $$   :: process id
        => $0   :: commands name
        => $1   :: fisrt arg
        => $2   :: second arg
        => $@   :: all args
        => $#   :: args number

    `
        : substitution command

    !
        : history expansion in the prompt

    comment
        : #
    command
    options
    arguments
    ;   : command ending
        : equl enter
    () : substitution command and variable
    {} : command group, distributive property
    [] : character class in globbing, array 
    <> : redirection
    !  : not, command histroy in prompt

    ?, *, + . [] {}
        : file name glob

    &   : background process
        : fd operator

    " '
        : disable word seperate and globbing
        : meta charater alias keyword to string 
        : finally delete " or ' and pass to command


# Meta characters ( operator )
    () ` | & ; 
        => command 

    && ||
        => logical command

    < << <<<
        => input redirection

    > >> 
        => output redirection

    & >& >&-
        => file description

    * ? []
        => glob character
    " ;
        => quote character
    = +=
        => assignment character
# escape
    \
# quote
## in assignment oprator
    processed by no quote, double quote, single quote
    
    str=\w*foo\w*
    echo "$str"
        => w*foow*
## in no quotes
    No quotes 
        기본적으로 
        모든 
            "문자"에 대해서
                escape 처리해서 인자로 넘겨준다.

        shell 키워드, 
        메타문자, 
        alias, 
        glob 문자, 
        quotes, 
        whitespace 문자를 
            escape 하여 
                해당 기능을 disable 할 수 있습니다.

    둘 이상의 공백은 의미가 없으므로 하나의 공백으로 대체

    ! history 확장 escape
        ```bash
            date
            echo hello !!
                => echo hello date
                => hello date
            echo hello \!!
                => hello !!
        ```
## in double quotes
    " $ ` \ newline(real newline not \n)
        만 escape 처리 해준다

       echo "\" \$ \` \
       > next line"

                => $`next line
                => translate escape character with that

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

# keyword
### delmeter
    blank : default
### test
    [ : command
    ] : last argument

    
### assignment
    = : AA="hello"
        no space between variable and value
        but string equal with space
            cf) equl [ a = b ]
### string equal
    = : with space
        $a = $b
### true or false
    0 : true
    not 0 : false

### return
    $? : have the return vale
       : rax register

# variable
### argument
    "-"     : stdin or stdout
    "--"    : end of option
    "$$"    : processor id
    "$#"    : args number
    "$@"    : all args
    "$0"    : command name
    "$1"    : arg 1
### pipe
    "coproc"    : named pipe
### named pipe
    mkfifo  : make first in first out

### socket

# expansion

