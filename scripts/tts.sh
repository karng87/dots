#!/bin/bash
daum_tts="http://tts-dic.daum.net/read?lang=en\&txt" #=Look+at+the+response+to+the+tsunami+--+it%27s+inspiring.&format=mpeg

function daumTTS(){
    sed -E -e 's/'"'"'/%27/g'\
           -e 's/:/%3A/g'\
           -e 's/,/%2C/g'\
           -e 's/\s+/ /g'\
           -e 's/ /+/g'\
           -e 's#^#'"${daum_tts}"='#'\
           -e 's#$#.\&format=mpeg#' <<< "$1"
}

mpv $(daumTTS "$1")
