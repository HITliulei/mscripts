#!/bin/bash


K8S_VERSION=1.19.8
if [[ $# == 1 ]]; then
    echo "$1 k8s_version"
    K8S_VERSION=$1
fi

swapoff -a && sysctl -w vm.swappiness=0  # 关闭swap

sudo sed -ri '/^[^#]*swap/s@^@#@' /etc/fstab  # 取消开机挂载swap

systemctl stop ufw
systemctl disable ufw
# ufw allow 22

curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
# deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-$(lsb_release -cs) main
# deb [arch=arm64] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
deb [arch=amd64] https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF
apt update

apt install -y kubelet=$K8S_VERSION-00 kubeadm=$K8S_VERSION-00 kubectl=$K8S_VERSION-00

# ipv4 转发
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sysctl -p


cat <<EOF | sudo tee /etc/modules-load.d/containerd.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

#
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf
net.bridge.bridge-nf-call-iptables  = 1
net.ipv4.ip_forward                 = 1
net.bridge.bridge-nf-call-ip6tables = 1
EOF

# Apply sysctl params without reboot
sysctl --system


#注意: kubeadm 方式部署的话，在/etc/kubernetes/manifests/kube-apiserver.yaml修改
#增加这一句话     - --enable-aggregator-routing=true 开启路由

