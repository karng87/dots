# regex (Regular Expression)
echo 'aa=11,xx=00,bb=22,aa=33,yy=00,bb=44' |
sed -E 's/(.*)aa.*bb/\1ZZZ/'
    =>  aa=11,xx=00,bb=22,ZZZ=4

# 다음의 경우는 두 개의 greedy (.*) 가 사용되었는데요.
    결과적으로 앞쪽이 먼저 처리되는 것을 볼수 있습니다.
echo 'aa=11,xx=00,bb=22,aa=33,yy=00,bb=44' | 
sed -E 's/aa.*bb(.*)/ZZZ\1/'
    => ZZZ=44

echo "111,222,333,444" | 
sed -En 's/(.*),(.*),(.*),(.*)/\1:\2:\3:\4/p'
    => 111:222:333:444

## hidden 에 주의
    regex 매칭에 포함되지 않는 부분은 
    hidden 으로 출력에 포함되므로 주의해야 합니다.

    여기서 매칭이 안되는 111, 444 는 hidden 이다.
echo '111,222,333,444' | 
sed -E 's/,(.*),(.*),/,\2,\1,/'
    => 111,333,222,444

## BRE
    basic regular expression
## ERE
    extended regular expression
## PRE
    perl regular expression

## escape
    bre
        ?   
        +   *
        |   &
        {}  []
        ()  <>
## \s \S
    [[:space:]]

## \w \W
    [[:alnum:]_]

## \b \B
    < > word boundary

## () => \1 \2 
## all matched => &
    back reference
    \1
    \2
    \3

    echo "aaa@bbb@aaa" | sed -En '/(\w+)@(\w+)@\1/p'
        aaa@bbb@aaa

    echo "111 sedsed 33" | sed -En '/(\bsed\b).*\1/p'
        
    echo "111 sed sed 33" | sed -En '/(\bsed\b).*\1/p'
        111 sed sed 33

### nesting (()())


# substitution
    sed -E 's///'
    sed -E 's///g'

# [number] subs
    echo "f[oo[12]b]ar[345]z12[o2]30[6789]x[12x3]x" |       sed -E 's/(\[[0-9]+])|./\1/g'
    
# gredy mating
    .*
        : []*
        : [^]*
## * == {,}
## + == {1,}
## ? == {.1}




