#!/bin/bash

daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum="https://dic.daum.net/search.do?q"

  curl -s -A 'Mozilla/4.0' "${daum}=${1}" |\
  sed -En '/wordid/!b;s/wordid=([^"]+)"|(>[^<]+)<|./\1\2/g;p;q'
