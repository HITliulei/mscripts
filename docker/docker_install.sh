#!/bin/bash
# install docker

echo 'install docker'

echo 'delete docker now'

systemctl stop docker
apt remove docker docker-engine docker-ce docker.io -y
apt autoremove -y
apt autoremove docker-ce-* -y
apt autoremove containerd.io -y
rm -rf /etc/systemd/system/docker.service.d
rm -rf /var/lib/docker


echo   "\033[31m install some tools \033[0m"
apt update
apt install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/ $(lsb_release -cs) stable"
apt update

echo "\033[31m install now \033[0m"
apt install -y docker-ce docker-ce-cli containerd.io
#apt install -y docker-ce=5:19.03.15~3-0~ubuntu-$(lsb_release -cs) docker-ce-cli=5:19.03.15~3-0~ubuntu~ubuntu-$(lsb_release -cs) containerd.io=1.2.13-2

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

