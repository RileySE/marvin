#!/bin/bash

export PATH=$PATH:/usr/local/cuda/bin

GAPS_DIR=/home/riley/gaps

if uname | grep -q Darwin; then
  CUDA_LIB_DIR=/usr/local/cuda/lib
elif uname | grep -q Linux; then
  CUDA_LIB_DIR=/usr/local/lib64
  CUDNN_LIB_DIR=/usr/local/cudnn/v3/lib64
fi

#normal
nvcc -w -std=c++11 -O3 -o marvin_old marvin_old.cu -I$GAPS_DIR/pkgs -I$GAPS_DIR/apps -I/usr/local/cuda/include -I/usr/local/cudnn/v3/include -L$CUDA_LIB_DIR -L$CUDNN_LIB_DIR -L$GAPS_DIR/lib/x86_64 -lcudart -lcublas -lcudnn -lR3Shapes -lR2Shapes -lRNBasics -lPDB -ljpeg -lpng -lfglut -lGLU -lGL -lm -lX11
#debug
#nvcc -w -std=c++11 -g -o marvin_old marvin_old.cu -I$GAPS_DIR/pkgs -I$GAPS_DIR/apps -I/usr/local/cuda/include -L$CUDA_LIB_DIR -L$GAPS_DIR/lib/x86_64 -lcudart -lcublas -lcudnn -lR3Shapes -lR2Shapes -lRNBasics -lPDB -ljpeg -lpng -lfglut -lGLU -lGL -lm -lX11


chmod 700 ./marvin_old
