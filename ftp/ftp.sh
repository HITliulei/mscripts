#!/bin/bash
# install ftp

apt-get install vsftpd

vsftpd -v
 
systemctl status vsftpd.service

systemctl enable vsftpd.service