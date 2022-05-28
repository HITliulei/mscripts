#!/bin/bash
# install docker office


apt-get remove docker docker-engine docker.io containerd runc

apt-get update
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#echo \
#  "deb [arch=arm64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
#  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

systemctl enable docker
systemctl start docker

echo "\033[31m create docker user group \033[0m"
groupadd docker
gpasswd -a $USER docker
newgrp docker

cat <<EOF >  /etc/docker/daemon.json
{
	"registry-mirrors": ["http://hub-mirror.c.163.com"],
	"insecure-registries":["192.168.1.104:5000"],
	"exec-opts": ["native.cgroupdriver=systemd"],
	"iptables": false
}
EOF

systemctl restart docker.service
