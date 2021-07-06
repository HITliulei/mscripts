#!/bin/bash

sudo systemctl stop docker
sudo apt-get remove -y docker-ce docker-ce-cli
sudo apt-get update
sudo apt-get install -y docker-ce=5:19.03.15~3-0~ubuntu-$(lsb_release -cs) docker-ce-cli=5:19.03.15~3-0~ubuntu-$(lsb_release -cs)
sudo systemctl enable docker
sudo systemctl start docker
docker version