#!/bin/bash

echo '安装 java 8'
apt-get update
apt-get install openjdk-8-jdk -y
java -version

echo '安装 maven'
apt install maven -y
mvn -v