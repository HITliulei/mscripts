

wget http://nginx.org/download/nginx-1.16.1.tar.gz
mkdir -p nginx/core
mv nginx-1.16.1.tar.gz nginx/core
tar -xzf nginx-1.16.1.tar.gz
./configure
make
make install