#!/bin/sh
name=$(~/.xdd/xddEncode $1)
tar -cvf - $1 | lz4 -9 > $name.tar.xdd
~/.xdd/xddEncode $name.tar.xdd $name.xdd encrypt
rm $name.tar.xdd