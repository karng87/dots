#!/bin/bash

dest_dir="~/Project/dic/mp3"

num=${1##*_}
[ $num = $1 ] && num=01 || let ++num

check_file=${dest_dir}/${1}.mp3

if [ -f "${check_file}" ]; then let num=++${1##*_};fi

  echo $num

[ -n $num ] && let ++${num}; dest_file="${dest_dir}/${1}_${num}.mp3" || num=0; dest_file="${dest_dir}/${1}.mp3"
echo "${dest_file}"
