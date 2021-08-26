#!/bin/bash
daum="https://dic.daum.net/search.do?q"
daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum_tts="https://tts-dic.daum.net/read?lang=en&txt" #=

audio_dir=~/Project/dic/mp3
all_audios=${audio_dir}/*.mp3
bing=''

function trim_voice(){
  sed -E -e '/\+/{s/.*_(.+)\.mp3$/\1/}'\
    -e '/\+/!{s/.*\/([^_]+)_.*/\1/}' <<< $1
}
function urlencoding(){
  sed -E -e '/%27/{s//'"'"'/g}'\
         -e '/%3A/{s//:/g}'\
         -e '/%2C/{s//,/g}'\
         -e 's/\+/ /g' <<< $1
}
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
  for i in ${all_audios} 
    do 
        echo ${i}
        mpv ${i} > /dev/null 2>&1
        sleep 1
        mpv ${i} > /dev/null 2>&1
        sleep 1
        mpv ${i} > /dev/null 2>&1
    done

  for i in ${all_audios} 
    do  
        urlencoding $(trim_voice $i)
        mpv $i >/dev/null 2>&1
        sleep 1
    done
}

function printDic(){
  local W1=${1%%.*}
  local W2=${W1##*/}

  local W3=${W2%%_*}
  local W4=${W3%%-*}

  local W="$( getWid $W4 )"
  local WD=${W##*>}
  local WID=${W%%>*}

  local MD=${audio_dir}/${WD}

  local Contents_1=$(  )
  local Contents_wd=$( sed -E \
                          -e 's/(>[^<]+<)|data-audio data-url="([^"]+)"|./\1/g' \
                        <<< $Contents_1 )
  if [[ ${WD} != ${1} ]] 
    then clear; echo "=== Did you mean ${WD}, can't find the ${W1} ===";sleep 2
  fi

    clear
    echo -e "======== ${WD} ========\n"

    curl -s -A 'Mozilla/4.0' "${daum_id}=${WID}"\
    |sed -En -e '/num_mean/bX'\
            -e '/mean_info/bX'\
            -e '/mean_example/bX'\
            -e '/txt_mean/bX'\
            -e '/inner_tit/bX'\
            -e '/tit_sort"/bX'\
            -e '/txt_sort"/bX'\
            -e '/tit_word"/bX'\
            -e '/txt_subword/bX'\
            -e '/txt_emph1/bX'\
            -e '/txt_example/bX'\
            -e '/txt_pronounce/bX'\
            -e '/data-audio data-url="http/bX'\
            -e 'b'\
            -e ':X s/>([^<]+)<|data-url=("[^"]+")|./\1\2/g'\
            -e 's/\s+/ /g'\
            -e 's/유의어|복합어.*|관련어|뜻\/문법|예문|미국|영국/\n\t<< & >>\n/'\
            -e 's/^[가-힣]([2-9][0-9]?)/\n\1/g'\
            -e 's/^[0-9][0-9]?[. ]/\t&/Mg'\
            -e 's/^\s?[가-힣]+.*/\t&\n/g'\
            -e 's/^"(http[^"]+)".*/\1/'\
            -e 'p'\
    |awk -v MD=${MD} 'BEGIN{ FNAME; I;}
            checkfile(file){

            }

            {if($0 ~ /http/) {
                    if(/&format/){\
                      FNAME = gensub(/.*en&*txt=([^&.]+).*/,MD"_\\1.mp3","1")
                      #print FNAME
                    }else {
                      FNAME = MD"_"(I++)".mp3"
                      #print FNAME
                    }
                      cmd_curl="xargs -I{} curl -o "FNAME" {} > /dev/null 2>&1" 
                      print $0 | cmd_curl
                      close(cmd_curl) 
                      cmd_mpv="mpv "FNAME" > /dev/null 2>&1"
                      print $0 | cmd_mpv 
                      close (cmd_mpv)
                }else  print $0

              print "sleep 1" | "/bin/bash"
              close("/bin/bash")
            }'
    echo "================ END ==================="
}

printDic $1
