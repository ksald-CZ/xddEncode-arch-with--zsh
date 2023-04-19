#!/bin/sh
if [ $1 = "encode" ]
then
    ./encode.sh $2
else
    if [ $1 = "decode" ]
    then
        ./decode.sh $2
    else
        echo $1" is not a valid action"
    fi
fi
