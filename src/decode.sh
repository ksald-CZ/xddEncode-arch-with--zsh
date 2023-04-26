#!/bin/sh

suffix=".tar.xdd"

if [ -f "$1" ]; then
  case "$1" in
    *"$suffix") lz4 -d "$1" | tar -xvf -;;
    *) echo "The file $1 does not end with $suffix.";;
  esac
else
  ~/.xdd/xddEncode "$1" "$1.dec" decrypt
  tar --zstd -xvf "$1.dec"
  rm "$1.dec"
fi