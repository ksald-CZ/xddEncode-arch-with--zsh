#!/bin/bash

if [[ $(command -v pacman) ]]; then
  echo "Detected pacman package manager :3"
  sudo pacman -Syu
  sudo pacman -S lz4 tar wget
elif [[ $(command -v apt-get) ]]; then
  echo "Detected apt package manager :3"
  sudo apt-get update
  sudo apt-get install lz4 tar wget -y
elif [[ $(command -v dnf) ]]; then
  echo "Detected dnf package manager :3"
  sudo dnf update
  sudo dnf install lz4 tar wget -y
else
  echo "Unsupported package manager :3"
  exit 1
fi

SHELL_CONFIG_FILE=
if [[ $(command -v zsh) ]]; then
  echo "Detected zsh shell :3"
  SHELL_CONFIG_FILE=~/.zshrc
elif [[ $(command -v bash) ]]; then
  echo "Detected bash shell :3"
  SHELL_CONFIG_FILE=~/.bashrc
else
  echo "Unsupported shell :3"
  exit 1
fi

echo "alias xdd=~/.xdd/run.sh" >> $SHELL_CONFIG_FILE

mkdir -p ~/.xdd
wget -P ~/.xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/src/run.sh
wget -P ~/.xdd https://github.com/MartinRostejnsky/xddCompress/raw/main/src/a.out
wget -P ~/.xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/src/decode.sh
wget -P ~/.xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/src/encode.sh
chmod u+x ~/.xdd/run.sh
chmod u+x ~/.xdd/a.out
chmod u+x ~/.xdd/decode.sh
chmod u+x ~/.xdd/encode.sh

source $SHELL_CONFIG_FILE
. $SHELL_CONFIG_FILE
