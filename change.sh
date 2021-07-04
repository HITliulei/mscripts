#!/bin/bash

HOSTNAME=ubuntu

if [[ $# == 1 ]]; then
    HOSTNAME=$1
fi

hostnamectl set-hostname $HOSTNAME

swapoff -a && sysctl -w vm.swappiness=0  # 关闭swap

sudo sed -ri '/^[^#]*swap/s@^@#@' /etc/fstab  # 取消开机挂载swap

systemctl stop ufw
systemctl disable ufw
# ufw allow 22


