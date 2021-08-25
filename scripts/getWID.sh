#!/bin/bash

daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum="https://dic.daum.net/search.do?q"

function gosed(){
  sed -En -e '/link_speller/{s/>([^<]+)<|./\1/g;p;q}' \
      -e '/wordid/!b;s/wordid=([^"]+)"|(>[^<]+)<|./\1\2/g;p;q' \
      <<< $1
}

function gocurl(){
  curl -s -A 'Mozilla/4.0' "${daum}=$1"
}

res=$( gosed "$( gocurl ${1} )" )

if [[ "$res" =~ '>' ]]
  then echo $res
  else gosed "$( gocurl $res )"
fi
