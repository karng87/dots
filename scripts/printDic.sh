#!/bin/bash
daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum_tts="https://tts-dic.daum.net/read?lang=en&txt" #=
audio_dir=~/Project/dic/mp3

function printDic(){
  local W1=${1%%.*}
  local W2=${W##*/}

  local W3=${W1%%_*}
  local W4=${W1%%-*}

  local W="$( ./getWID.sh $W4 )"
  local WD=${W##*>}
  local WID=${W%%>*}
  local Contents_1=$( curl -s -A 'Mozilla/4.0' "${daum_id}=${WID}" )
  local Contents_wd=$( sed -E \
                          -e 's/(>[^<]+<)|data-audio data-url="([^"]+)"|./\1/g' \
                        <<< $Contents_1 )
  # txt_cleanword
  #   num_mean txt_mean
  #     txt_pronounce
  #       data-audio data-url="h..

  # inner_tit = 뜻
  # tit_sort
  #   txt_sort
  #   txt_subword
  #     num_mean txt_mean


  # card_tit = families
  # inner_tit = 관련어
  # tit_word
  #   txt_emph1
  #     mena_info 


  # card_tit = examples
  # inner_tit = 예문
  # txt_word
  #   txt_example txt_ex
  #     data-audio data-url="h..
  #     mean_example txt_ex

    clear
    echo "======== ${WD} ========"
    sed -En '/mean_example|txt_example|txt_pronounce|data-audio data-url="http/{s/(>[^<]+<)|data-url=("[^"]+")|./\1\2/gp}' <<< $Contents_1 \
    |sed -En -e '/^>/{s/[<>]//g;s/\.$/&\n/;bX};/^"/{s/^"([^"]+).*/\1/;bX};b;' -e ':X p'
              
      

    num=0

  #for i in $Contents_snd;do curl -o ${audio_dir}/${WD}_$(( num++ )).mp3 $i 1>/dev/null; mpv $i 1>/dev/null 2>&1;sleep 1;done
    echo "================ END ==================="
}

printDic $1
