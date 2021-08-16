#!/bin/bash
function printDic(){
  local W=${1%%.*}
  local W1=${W##*/}
  local W2=${W1%%-*}
    clear
    echo "#######- ${W2} -#######" && \
    curl -s -A 'Mozilla/4.0' https://dic.daum.net/search.do?q=${W2} |\
    sed -En '/완료/,/내 단어장에 저장/p' |\
    #sed -En '/완료/,/영영사전 더보기/p' |\
    sed -E '/한국어사전 더보기/,$d' |\
    #sed -E '/중국어사전/,/중국어사전 더보기/d' |\
    #sed -E '/일본어사전/,/일본어사전 더보기/d' |\
    sed -E 's/<\/div>/\n/' |\

    sed -E 's/(num_search)/>\1</' |\
    sed -E 's/(sub_txt)/>\1</' |\
    sed -E 's/(txt_search)/>\1</' |\

      #sed -E 's/[^>"]+|"([^"]+)"|([^<"]+)/\1\2/g' |\
    sed -E 's/[^>]+|([^<]+)/\1/g' |\
    sed -E '/^$|^>+$|^\s$/{d}' |\
      # num_search  sub_txt txt_search
    sed -E '/num_search|sub_txt|txt_search/!d' |\
    sed -E 's/^>txt_search>([^>]+)>/\n\1/'  |\
    sed -E 's/^>>txt_search>>(.*)/\t\1/' |\
    sed -E 's/>+num_search>+/\t/' |\
    sed -E 's/>+sub_txt>+/\t/' |\
    sed -E 's/txt_search//' |\
    sed -E 's/>+//g'

    # <meta name="twitter:title" content="Daum 사전" />
    #sed -E 's/([^=]+)|"([^"]+)"/[->\2<-]\n/g'
    #sed -E 's/([^=]+)|"([^"]+)"|(=)/[1->\1<-1][2->\2<-2][3->\3<-3]\n/'
    #sed -E 's/([^=]+)|"([^"]+)"|(=)/[1->\1<-1][2->\2<-2][3->\3<-3]\n/g'
    #sed -E 's/"([^"]+)"|(.+)/[1(\1)1] - [2(\2)2]\n/g'
    #sed -E 's/([^"]+)|"([^"]+)"|(.+)/[1(\1)1] - [2(\2)2] - [3(\3)3]\n/g'
        #sed -E 's/([^"]+)|([^"]+)|"/(1s)->\1<-(1e):(s2)->\2<-(2e)/g'
        #sed -E 's/([^"]+)|(["]+)|"/[->\2<-]/g'
        #sed -E 's/([^"]+)|(["]+)|"/[->\1<-]/g'
    #sed -E 's/[^>]+|>([^<]+<?)/\1/g' 
    #sed -En '/완료/,/영영사전 더보기/p' |\
    #sed -E '/^>$/d' |\
    #sed -E '/^[[>a-z]/!d' |\
    #awk '!x[$0]++' |\
    #sed -E 's/<|>//g' |\
    #sed -E 's/(\.)(\S)/\1 \2/' |\
    #sed -E 's/^[0-9]/\t&/' 
    #sed -E -n '1,+25p'
    echo "================ END ==================="
}
printDic $1
