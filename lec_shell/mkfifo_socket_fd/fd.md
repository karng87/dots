# include <fcntl.h>
    fcntl : Fd CoNTroL

## $$
    $#, $@, $1..
    $$:
        the pid  of current shell 
            ls -l /proc/$$/fd
# fd
    how to get resouce
        by exec command
        with file descriptor
    advantages 
        position index
        buffer

    File Descriptor (by user)
    File Description (by kernel)

    fd should be number
        auto get number
            exec {fd_var}< resource
        
    fd reference: &
        &0, &1, &2, ,&9, &{fd_var}
    fd direction: <, >, >>, <>
        only when creating fd at first, the direction has meaning

    fd delete:    &-

## create new fd
    exec fd meta_char resoucre 
        meta character with exec
            < :input
            > : output
                write with delete
            >>: append
                append without delete
            <>: io(input output)
                overwrite without delete

            immediately create fd without exec
            ** <<, <<< connect stdin with temporay file 

                <<  : hre document(regist here, can select end charater)
                    ls -l /dev/fd/ <<END
                    5<<END cat /dev/fd/5

                    : don't need quotes  
                        cat <<EOF
                    : take place value extend, command substitution in body 
                        :: dont want
                            cat <<\EOF or cat <<'EOF'

                    : gcc -S -xc -o - - <<\EOF
                        -xc :: extension is c , c file
                        -xc++ :: c++ file

                <<< : here string(character array end of 0)
                    ls -l /dev/fd/ <<< hello
                    5<<< string 
                :: awk -f - <<\EOF
                    : - == stdin
                :: sed -f /dev/fd/3 3<<EOF


    exec 4< myfile
    7<<< here string <&3 cat ::: <&7 == 0<&7
    exec 5> myfile
    exec 6>> myfile
    exec 7<> myfile

## dereference fd with &fd
    read var <&4 ; echo $var
        1st index line print
    read var <&4 ; echo $var
        2nd index line print
    read var <&4

## delete fd
    exec fd meta_char &-
    exec 4<&-

## create new fd from old fd with fd meta character assignment (copy)
    exec fd<&old_fd
    exec fd>&old_fd

    exec 
