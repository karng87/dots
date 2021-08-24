#!/bin/bash

daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum="https://dic.daum.net/search.do?q"

function test(){
  curl -s -A 'Mozilla/4.0' "${daum}=${1}" |\
  sed -En -e '/link_speller/{s/>([^<]+)<|./\1/g;p;q}' -e '/wordid/!b;s/wordid=([^"]+)"|(>[^<]+)<|./\1\2/g;p;q' 
}

res=$( test $1 )

if expr match $res ">" > /dev/null
  then echo else $res | sed -En 's/[^>]+|(.)/\1/g'
  else echo "${res}" | sed -E 's/.*/https:\/\/dic.daum.net\/search.do?q=&/'
fi
