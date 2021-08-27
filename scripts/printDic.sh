#!/bin/bash
daum="https://dic.daum.net/search.do?q"
daum_id="https://dic.daum.net/word/view.do?wordid" #=ekw000146827
daum_tts="https://tts-dic.daum.net/read?lang=en&txt" #=

audio_dir=~/Project/dic/mp3
all_audios=${audio_dir}/*.mp3

function trimVoice(){
  sed -E -e '/\+/{s/.*_(.+)\.mp3$/\1/}'\
    -e '/\+/!{s/.*\/([^_]+)_.*/\1/}' <<< $1
}
function urlEncoding(){
  sed -E -e '/%27/{s//'"'"'/g}'\
         -e '/%3A/{s//:/g}'\
         -e '/%2C/{s//,/g}'\
         -e 's/\+/ /g' <<< $1
}
function checkSpell(){
    sed -En -e '/link_speller/{s/>([^<]+)<|./\1/g;p;q}' \
        -e '/wordid/!b;s/wordid=([^"]+)"|(>[^<]+)<|./\1\2/g;p;q' \
        <<< $1
}

function getDaum(){
    curl -s -A 'Mozilla/4.0' "${daum}=$1"
}

function getWid(){
  local A1=${1%%.*}
  local A2=${A1##*/}

  local A3=${A2%%_*}
  local A4=${A3%%-*}

    res=$( checkSpell "$( getDaum ${A4} )" )

    if [[ "$res" =~ '>' ]]
      then echo $res
      else checkSpell "$( getDaum $res )"
    fi
}

function showDicWithWID(){
    setVAR $1
    clear
    echo -e "======== ${WD} == ${exist} ======\n"
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
            -e 'p'

    echo "================ END ==================="
}

function playdic(){

            awk -v sfile=${2} -v exist=${3} 'BEGIN{FNAME; I;}

            {if($0 ~ /http/) {
                    if(/&format/){\
                      FNAME = gensub(/.*en&*txt=([^&.]+).*/,sfile"_\\1.mp3","1")
                      #print FNAME
                    }else {
                      FNAME = sfile"_"(I++)".mp3"
                      #print FNAME
                    }
                    
                      if(exist=="New"){
                        cmd_curl="xargs -I{} curl -o "FNAME" {} > /dev/null 2>&1" 
                        print $0 | cmd_curl
                        close(cmd_curl)
                        print "curl downloading... "
                      }
                      cmd_mpv="mpv "FNAME" > /dev/null 2>&1"
                      print $0 | cmd_mpv 
                      close (cmd_mpv)
                }else  print $0

              print "sleep 1" | "/bin/bash"
              close("/bin/bash")
            }' <<< $1
}

function playall(){
  [[ -e ${1} ]] && v2=${1/%/_0} || v1="*_0"

  for i in ${audio_dir}/${v1}.mp3
    do 
        showDicWithWID "$( getWid $1 )"
        for j in ${i/0/*}
          do  
              #urlEncoding $(trimVoice $j)
              mpv $j > /dev/null 2>&1
              sleep 1
          done
    done

}

function setVAR(){
  W1=${1%%.*}
  W2=${W1##*/}

  W3=${W2%%_*}
  W4=${W3%%-*}

  W="$( getWid $W4 )"
  WD=${W##*>}
  WID=${W%%>*}
  sfile=${audio_dir}/${WD}
  exist=""
  [[ -f ${sfile}_0.mp3 ]] && exist=Old || exist=New
}

function mainDic(){
  setVAR $1
  clear

  if [[ ${WD} != ${W4} ]] 
    then clear; echo "=== Did you mean ${WD}, can't find the ${W4} ===";sleep 2
  fi
    playdic "$( showDicWithWID $1 )" ${sfile} ${exist}
}

setVAR $1
[[ -f ${sfile}_0.mp3 ]] && playall || ( mainDic $1 )
