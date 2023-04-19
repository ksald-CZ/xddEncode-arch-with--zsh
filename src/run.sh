#!/bin/sh
if [ $1 = "encode" ]
then
    ~/xdd/encode.sh $2
else
    if [ $1 = "decode" ]
    then
        ~/xdd/decode.sh $2
    else
        echo $1" is not a valid action"
    fi
fi
