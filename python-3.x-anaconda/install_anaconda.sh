#!/bin/bash

set -x
apt-get update --fix-missing
apt-get install -y --no-install-recommends bzip2 ca-certificates git libglib2.0-0 libsm6 libxext6 libxrender1 mercurial openssh-client procps subversion wget
apt-get clean
rm -rf /var/lib/apt/lists/*

if [ "${PYTHON_VER}" == "3.8" ]; then
    ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh";
    SHA256SUM="2751ab3d678ff0277ae80f9e8a74f218cfc70fe9a9cdc7bb1c137d7e47e33d53";
elif [ "${PYTHON_VER}" == "3.9" ]; then
    ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh";
    SHA256SUM="fedf9e340039557f7b5e8a8a86affa9d299f5e9820144bd7b92ae9f7ee08ac60";
elif [ "${PYTHON_VER}" == "3.7" ]; then
    ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh";
    SHA256SUM="2b9f088b2022edb474915d9f69a803d6449d5fdb4c303041f60ac4aefcc208bb";
fi

wget "${ANACONDA_URL}" -O anaconda.sh -q
echo "${SHA256SUM} anaconda.sh" > shasum
sha256sum --check --status shasum
/bin/bash anaconda.sh -b -p /opt/conda
rm anaconda.sh shasum
ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh
#echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
#echo "conda activate base" >> ~/.bashrc
find /opt/conda/ -follow -type f -name '*.a' -delete
find /opt/conda/ -follow -type f -name '*.js.map' -delete
/opt/conda/bin/pip install --upgrade pip
/opt/conda/bin/conda clean -afy

