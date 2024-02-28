#!/bin/bash

apt update
apt upgrade -y
apt install git zlib1g-dev software-properties-common
add-apt-repository -y ppa:fangq/ppa
apt update
apt install libzmat1-dev

cd /root

git clone https://github.com/IMSY-DKFZ/mcx.git

cd mcx/src
make
cp bin/mcx /usr/local/bin


cd ~
rm -rf mcx
git clone https://github.com/IMSY-DKFZ/simpa.git
cd simpa
git checkout main
git pull

/opt/conda/bin/pip install pyqt5==5.12.3 
/opt/conda/bin/pip install pyqtwebengine==5.12.1
/opt/conda/bin/pip install -r requirements.txt

#/opt/conda/bin/pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
