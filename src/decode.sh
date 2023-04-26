#!/bin/sh
~/.xdd/xddEncode $1 $1.dec decrypt
tar --zstd -xvf $1.dec
rm $1.dec