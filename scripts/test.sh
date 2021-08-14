#!/bin/bash
W=${1%%.*}
W1=${W##*/}
W2=${W1%%-*}

function getWid(){
  echo $( curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2}|\
    awk /wordid/ | \
    awk 'NR==1{print $0}' | \
    awk -F'=' '{print $3}' | \
    sed -E 's/(.*)\" class$/\1/')
}
wid=$(getWid)
echo ${wid}
#https://dic.daum.net/word/view.do?wordid=${wid}

#curl -s -A 'Mozilla/4.0' https://dic.daum.net/word/view.do?wordid=${wid} | \
curl -s -A 'Mozilla/4.0' https://dic.daum.net/word/view.do?wordid=${W2} |\
  # clas="num_mean">
#awk -F 'num_mean' '{print $0}'| \
sed -E 's/[^>]+|>([^<]+<?)/\1/g'
#grep -E ^[0-9][^0-9] | \
#sed -E 's/<\s+<//' | \
#sed -E 's/<*>*$//' | \
#sed -E 's/\s//g' |\
#sed -E 's/<+|>+|<>/ /g' |\
#sed -E 's/^[0-9]\.+/\t/'
#html2text -utf8 -nobs -style compact -width 500

