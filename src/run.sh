#!/bin/sh

SHELL_CONFIG_FILE=
if [[ $(command -v zsh) ]]; then
  echo "Detected zsh shell"
  SHELL_CONFIG_FILE=~/.zshrc
elif [[ $(command -v bash) ]]; then
  echo "Detected bash shell"
  SHELL_CONFIG_FILE=~/.bashrc
else
  echo "Unsupported shell"
  exit 1
fi

if [ $# -eq 0 ]
then
  rm -rf ~/.xdd
  sed '/alias xdd/d' -i $SHELL_CONFIG_FILE
elif [ $1 = "encode" ]
then
  ~/.xdd/encode.sh $2
elif [ $1 = "decode" ]
then
  ~/.xdd/decode.sh $2
else
    echo $1" is not a valid action"
fi
