#!/bin/bash

function getWd(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
  wd=$( curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2}|\
    awk /wordid/ |\
    awk 'NR==1{print $0}' |\
    sed -E 's/.*>(\w+).*/\1/' )
}

function getWid(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
  wid=$( curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2}|\
    awk /wordid/ | \
    awk 'NR==1{print $0}' | \
    awk -F'=' '{print $3}' | \
    sed -E 's/(.*)\" class$/\1/')
}

function printDic(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
    clear
    echo "#######- ${W2} -#######" && \
    curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2} |\
    sed -E 's/[^>]+|>([^<]+<?)/\1/g' |\
    sed -En '/완료/,/영영사전 더보기/p' |\
    sed -E '/^>$/d' |\
    sed -E '/^[[>a-z]/!d' |\
    awk '!x[$0]++' |\
    sed -E 's/<|>//g' |\
    sed -E 's/(\.)(\S)/\1 \2/' |\
    sed -E 's/^[0-9]/\t&/' 
    #sed -E -n '1,+25p'
    echo "================ END ==================="
}
 
