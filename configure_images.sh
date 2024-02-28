#!/bin/bash

docker build --tag cuda11.2cudnn8.1:latest cuda11.2+cudnn8.1
#docker build  --build-arg VER="3.7" --tag python-3.7:latest python-3.x-anaconda
docker build  --build-arg VER="3.8" --tag python-3.8:latest python-3.x-anaconda
#docker build  --build-arg VER="3.9" --tag python-3.9:latest python-3.x-anaconda


