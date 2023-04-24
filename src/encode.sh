#!/bin/sh
name=$(~/.xdd/a.out $1)
tar -cvf - $1 | lz4 -9 > $name.tar.xdd