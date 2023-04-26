#!/bin/sh
~/.xdd/xddEncode $1 $1.dec decrypt
lz4 -d $1.dec | tar -xvf -
rm $1.dec