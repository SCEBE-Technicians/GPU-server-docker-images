FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

SHELL ["/bin/bash", "-c"]

RUN apt-get update
RUN apt install -q -y software-properties-common wget gosu

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
RUN mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
RUN add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
RUN apt-get update

RUN apt-get install -y cuda-libraries-11-2

RUN apt-get install --no-install-recommends -y \
    libcudnn8=8.1.1.33-1+cuda11.2  \
    libcudnn8-dev=8.1.1.33-1+cuda11.2  \
    libnvinfer8=8.0.0-1+cuda11.0 \
    libnvinfer-dev=8.0.0-1+cuda11.0 \
    libnvinfer-plugin8=8.0.0-1+cuda11.0 \
    libcusolver-11-1

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*;


ENV LANG C.UTF-8
ENV LD_LIBRARY_PATH /usr/local/cuda-11.2/targets/x86_64-linux/lib:/usr/local/cuda-11.0/targets/x86_64-linux/lib:/usr/local/cuda/extras/CUPTI/lib64:/usr/local/cuda/lib64:/usr/local/cuda-11.1/targets/x86_64-linux/lib:$LD_LIBRARY_PATH

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
