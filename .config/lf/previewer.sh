#!/bin/sh

CMD="cat"
test -e `which bat` && CMD="bat --color=always --theme=base16 --paging=never"
test -e `which highlight` && CMD="highlight -O ansi"
test -e `which pygmentize` && CMD="pygmentize -g"

TYPE=`file --mime-type -Lb "$1"`

case "$TYPE" in
  application/x-tar) tar tf "$1";;
  application/zip) unzip -l "$1";;
  application/json) $CMD "$1";;
  text/*) $CMD "$1";;
  *) echo $TYPE
esac