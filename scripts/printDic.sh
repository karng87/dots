#!/bin/bash
daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
dic_dir=~/Project/dots/scripts

function printDic(){
  local W1=${1%%.*}
  local W2=${W##*/}

  local W3=${W1%%_*}
  local W4=${W1%%-*}

  local W=$( ./getWID.sh $W4 )
  local WD=${W##*>}
  local WID=${W%%>*}

    clear
    echo "#######- ${WD} -#######" && \
    curl -s -A 'Mozilla/4.0' "${daum_id}=${WID}" |\
    sed -E 's/>([^<]+)<|data-audio data-url="([^"]+)"|./\1\2/g' |\
    sed -En '/^$/!p'

    echo "================ END ==================="
}
printDic $1
