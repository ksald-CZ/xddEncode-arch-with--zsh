#!/bin/sh
name=$(./a.out $1)
tar -cvf - $1 | lz4 -9 > $name.tar.xdd