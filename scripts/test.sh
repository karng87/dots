#!/bin/bash

function getWid(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
  echo $( curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2}|\
    awk /wordid/ | \
    awk 'NR==1{print $0}' | \
    awk -F'=' '{print $3}' | \
    sed -E 's/(.*)\" class$/\1/')
}
wid=$(getWid)

function printDic(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
    clear
    curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2} |\
    sed -E 's/[^>]+|>([^<]+<?)/\1/g'
    #sed -E -n '/완료/,/영영사전 더보기/p'
    #sed -E 's/^>+\s*//' |\
    #sed -E '/^[^a-z0-9].+/d' |\
    #sed -E '/^$/d' |\
    #sed -E 's/(^[0-9]\.)\s?<>+(.*)/\t\1 \2\n/' |\
    #sed -E 's/^[a-z].*<>>>$/\t&\n/' |\
    #sed -E 's/<|>|//g'
}
printDic $1
