#!/bin/bash
daum="https://dic.daum.net/search.do?q"
daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum_tts="https://tts-dic.daum.net/read?lang=en&txt" #=

audio_dir=~/Project/dic/mp3
all_audios=${audio_dir}/*.mp3

function gosed(){
    sed -En -e '/link_speller/{s/>([^<]+)<|./\1/g;p;q}' \
        -e '/wordid/!b;s/wordid=([^"]+)"|(>[^<]+)<|./\1\2/g;p;q' \
        <<< $1
}

function gocurl(){
    curl -s -A 'Mozilla/4.0' "${daum}=$1"
}

function getWid(){
    res=$( gosed "$( gocurl ${1} )" )

    if [[ "$res" =~ '>' ]]
      then echo $res
      else gosed "$( gocurl $res )"
    fi
}

function playall(){
  for i in ${all_audios}; do echo ${i}; mpv ${i} > /dev/null 2>&1;  sleep 1; mpv ${i} > /dev/null 2>&1; sleep 1; mpv ${i} > /dev/null 2>&1; done
}

function printDic(){
  local W1=${1%%.*}
  local W2=${W##*/}

  local W3=${W1%%_*}
  local W4=${W1%%-*}

  local W="$( getWid $W4 )"
  local WD=${W##*>}
  local WID=${W%%>*}

  local MD=${audio_dir}/${WD}

  local Contents_1=$( curl -s -A 'Mozilla/4.0' "${daum_id}=${WID}" )
  local Contents_wd=$( sed -E \
                          -e 's/(>[^<]+<)|data-audio data-url="([^"]+)"|./\1/g' \
                        <<< $Contents_1 )
  if [[ ${WD} != ${1} ]] 
    then clear; echo "=== Did you mean ${WD}, can't find the ${W1} ===";sleep 2
  fi

  for i in ${all_audios} 
    do 
      [[ ${i} =~ ${WD} ]] && echo match || echo dismatc
    done

  echo end
exit
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
    echo -e "======== ${WD} ========\n"
    sed -En '/num_mean"|tit_word"|txt_emph1|mean_info"|mean_example"|txt_example"|txt_pronounce|data-audio data-url="http/{s/(>[^<]+<)|data-url=("[^"]+")|./\1\2/gp}' <<< $Contents_1 \
      |sed -En -e '/^>/{s/[<>]//g;s/\.$/&\n/;bX}'\
               -e '/^"/{s/^"([^"]+).*/\1/;bX}'\
               -e 'b'\
               -e ':X p' \
      |awk -v MD=${MD} 'BEGIN{
                FNAME
                I
            }

            {
              if(/^[^a-zA-Z]/){
                    $0 = "\t"$0"\n"
              }
              if(/[A-Z ]+$/){
                $0 = gensub(/([^.]+[.?])([^.?]+$)/,"\\1 \"\\2\"",1)
              }
              if(/유의어|복합어|미국|영국/){
                    $0 = "\n "$0 
              }

              if($0 ~ /^http/) {
                    if(/mpeg$/){
                      FNAME = gensub(/.*en&*txt=([^.&]+).*/,MD"_\\1.mp3","1")
                      print FNAME
                    }else if (!/mpeg$/) {
                      FNAME = MD"_"(I++)".mp3"
                      print FNAME
                    }
                      cmd_curl="xargs -I{} curl -o "FNAME" {} > /dev/null 2>&1" 
                      print $0 | cmd_curl
                      close(cmd_curl) 
                      cmd_mpv="mpv "FNAME" > /dev/null 2>&1"
                      print $0 | cmd_mpv 
                      close (cmd_mpv)
                }else  print $0

              print "sleep 2" | "/bin/bash"
              close("/bin/bash")
            }'
              
  #for i in $Contents_snd;do curl -o ${audio_dir}/${WD}_$(( num++ )).mp3 $i 1>/dev/null; mpv $i 1>/dev/null 2>&1;sleep 1;done
    echo "================ END ==================="
}

printDic $1
