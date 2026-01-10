#!/bin/bash

sudo pacman -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# docker run --rm --runtime=nvidia --gpus "device=0" ubuntu nvidia-smi
# docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
