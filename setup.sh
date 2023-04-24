#!/bin/bash

if [[ $(command -v pacman) ]]; then
  echo "Detected pacman package manager"
  sudo pacman -Syu
  sudo pacman -S lz4
elif [[ $(command -v apt-get) ]]; then
  echo "Detected apt package manager"
  sudo apt-get update
  sudo apt-get install lz4
elif [[ $(command -v dnf) ]]; then
  echo "Detected dnf package manager"
  sudo dnf update
  sudo dnf install lz4
else
  echo "Unsupported package manager"
  exit 1
fi

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

. $SHELL_CONFIG_FILE