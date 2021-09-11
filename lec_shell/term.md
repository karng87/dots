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

