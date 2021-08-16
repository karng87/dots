#!/bin/bash

function getWd(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
  curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2}|\
    awk /wordid/ |\
    awk 'NR==1{print $0}' |\
    sed -E 's/.*>(\w+).*/\1/'
}
wd=$(getWd $1)
echo "myvar: $wd"
