#!/bin/sh
if [ $# -eq 0 ]
then
  rm -rf ~/.xdd
elif [ $1 = "encode" ]
then
  ~/.xdd/encode.sh $2
elif [ $1 = "decode" ]
then
  ~/.xdd/decode.sh $2
else
    echo $1" is not a valid action"
fi
