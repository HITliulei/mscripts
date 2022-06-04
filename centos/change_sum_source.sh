#!/bin/bash

cd /etc/yum.repos.d
mkdir bak
mv *.repo bak


wget -O /etc/yum.repos.d/CentOS-Base.repo https://repo.huaweicloud.com/repository/conf/CentOS-8-reg.repo


sed -i "s/\$releasever/8-stream/g" /etc/yum.repos.d/CentOS-Base.repo

yum clean all

yum makecache

yum list

