#!/bin/sh

CMD="less"
if [ -x highlight ]; then
  CMD="highlight -O ansi"
fi

case "$1" in
  *.tar*) tar tf "$1";;
  *.tgz) tar tf "$1";;
  *.zip) unzip -l "$1";;
  *.rar) unrar l "$1";;
  *.7z) 7z l "$1";;
  *.pdf) pdftotext "$1" -;;
  *) $CMD "$1";;
esac