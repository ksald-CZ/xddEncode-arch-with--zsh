#!/bin/sh
name=$(~/.xdd/xddEncode $1)
tar --zstd -cvf $name.xdd.v $1
~/.xdd/xddEncode $name.xdd.v $name.xdd encrypt
rm $name.xdd.v