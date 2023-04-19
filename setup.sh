#!/bin/sh
sudo apt update
sudo apt install lz4
sudo apt-get install manpages-dev
echo 'alias xdd=~/xdd/run.sh' >> ~/.bashrc
wget -P ~/xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/run.sh
wget -P ~/xdd https://github.com/MartinRostejnsky/xddCompress/raw/main/a.out
wget -P ~/xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/decode.sh
wget -P ~/xdd https://raw.githubusercontent.com/MartinRostejnsky/xddCompress/main/encode.sh
chmod u+x ~/xdd/run.sh
chmod u+x ~/xdd/a.out
chmod u+x ~/xdd/decode.sh
chmod u+x ~/xdd/encode.sh