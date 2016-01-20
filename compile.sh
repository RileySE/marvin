#!/bin/bash

export PATH=$PATH:/usr/local/cuda/bin

GAPS_DIR=/home/riley/gaps

if uname | grep -q Darwin; then
  CUDA_LIB_DIR=/usr/local/cuda/lib
  CUDNN_LIB_DIR=/usr/local/cudnn/v4rc/lib
elif uname | grep -q Linux; then
  CUDA_LIB_DIR=/usr/local/cuda/lib64
  CUDNN_LIB_DIR=/usr/local/cudnn/v4rc/lib64
fi

#Normal
nvcc -std=c++11 -O3 -o marvin marvin.cu -I$GAPS_DIR/pkgs -I$GAPS_DIR/apps -I/usr/local/cuda/include -I/usr/local/cudnn/v4rc/include -L$CUDA_LIB_DIR -L$CUDNN_LIB_DIR -L$GAPS_DIR/lib/x86_64 -lcudart -lcublas -lcudnn -lcurand -lR3Shapes -lR2Shapes -lRNBasics -lPDB -ljpeg -lpng -lfglut -lGLU -lGL -lm -lX11
#Debug
#nvcc -std=c++11 -g -o marvin marvin.cu -I$GAPS_DIR/pkgs -I$GAPS_DIR/apps -I/usr/local/cuda/include -I/usr/local/cudnn/v4rc/include -L$CUDA_LIB_DIR -L$CUDNN_LIB_DIR -L$GAPS_DIR/lib/x86_64 -lcudart -lcublas -lcudnn -lcurand -lR3Shapes -lR2Shapes -lRNBasics -lPDB -ljpeg -lpng -lfglut -lGLU -lGL -lm -lX11
