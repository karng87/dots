## $$: process id
## $?: return value
## $#: argc
## $@: argv
## $*: argv
## $1: arg1
## $2: arg2

### $' ' : expand escape

## array arr=(e1...)
### arr=(e1 e2 ...)
### arr=([idx1]=e1 [idx2]=e2 ...)

### ${arr[@]} : all elements for each
### ${!arr[@]} : all index value  
    for idx in ${!arr[@]} do; echo ${arr[idx]}; done
    for a in ${arr[@]} do; echo $a; done

### ${!name@} : name 으로 시작하는 모든 변수

### ${arr[*]} : all elements with together for quotes 
### ${!arr[*]} : all index
### ${!name*} : name 으로 시작하는 모든 변수

### #{#arr[@]}
### #{#arr[N]}

### extract
    ${arr[@]:start:end}

### add element
    arr+=(e ...)
    arr+=([idx]=value)
### unset ${arr[@]}
    arr=()
### unset ${arr[N]}

### ${arr[@]/pat/subs}  : single subs
### ${arr[@]/pat/}  : single remove
### ${arr[@]//pat/subs} : global


## parameter
### ${#v1}  :v1 length

### ${v1#pattern}   :cut 1st pattern matched from front
### ${v1##pattern}  :cut greedy pattern matched from front

### ${v1%pattern}   :cut first pattern matched from end 
### ${v1%%pattern}  :cut greedy pattern matched from end 

### ${v1-v2}   :if v1 = non-exist then apply v2
### ${v1=v2}   :if v1 = non-exist then apply v2 to v1

### ${v1:-v2}  :if v1 = null or non-exist then apply v2
### ${v1:=v2}  :if v1 = null or non-exist then apply v2 to v1
