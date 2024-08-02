#!/bin/sh

CMD="cat"
if [ -e `which bat` ]; then
  CMD="bat --color=always --theme=base16 --paging=never"
elif [ -e `which highlight` ]; then
  CMD="highlight -O ansi"
elif [ -e `which pygmentize` ]; then
  CMD="pygmentize -g"
fi

TYPE=`file --mime-type -Lb "$1"`

case "$TYPE" in
  application/x-tar) tar tf "$1";;
  application/zip) unzip -l "$1";;
  application/json) $CMD "$1";;
  text/*) $CMD "$1";;
  *) echo $TYPE
esac
