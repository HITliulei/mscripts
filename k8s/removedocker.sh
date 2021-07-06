#!/bin/bash

sudo systemctl stop docker
sudo apt-get remove docker docker-engine docker-ce docker.io -y
sudo apt autoremove -y
sudo apt-get autoremove docker-ce-* -y
sudo apt-get autoremove containerd.io -y
sudo rm -rf /etc/systemd/system/docker.service.d
sudo rm -rf /var/lib/docker
sudo apt-get update