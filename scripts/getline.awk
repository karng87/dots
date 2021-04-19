#!/bin/bash
word=$1
curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=$word | \
awk '/daum:word id=/ || /txt_searchword/ {gsub(/<[^>]+>/, "");if($0 !~/\s$/) print "\t" $1}'
# END{print "end line"; print "$word"; print  "'$word'" ==> expert}' 
#awk '{if(($0 ~ /^\s+'$word'/) || ($0 ~/[0-9]+/)) print $1,$2,$3,$4}'
