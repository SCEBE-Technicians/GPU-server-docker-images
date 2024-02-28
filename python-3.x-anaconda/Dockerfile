FROM cuda11.2cudnn8.1 

ARG VER

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV PYTHON_VER ${VER:-3.9}

COPY install_anaconda.sh /
COPY requirements.txt /

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/3bf863cc.pub
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y libsndfile1-dev libsndfile1
RUN apt-get install -y gcc g++ cmake

RUN /bin/bash /install_anaconda.sh
RUN rm /install_anaconda.sh

RUN /opt/conda/bin/pip install -r /requirements.txt
RUN rm /requirements.txt

RUN /opt/conda/bin/pip install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
RUN /opt/conda/bin/pip install torchmetrics
