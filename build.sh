#!/bin/bash

base_dir=`pwd`
tmp_dir=$base_dir/tmp

rm -rf $tmp_dir 
mkdir -p $tmp_dir
cd $tmp_dir
wget http://cdn.mysql.com/Downloads/Connector-C/mysql-connector-c-6.1.6-src.tar.gz
if [ $? -ne 0 ]
then
    echo -e "\033[31m mysql-connector: download from git error \033[0m"
    exit 1
fi

tar -zxvf mysql-connector-c-6.1.6-src.tar.gz  && cd mysql-connector-c-6.1.6-src 
if [ $? -ne 0 ]
then
    echo -e "\033[31m mysql-connector: tar extarct mysql-connector error \033[0m"
    exit 1
fi

mkdir build && cd build
cmake -D CMAKE_INSTALL_PREFIX=${base_dir}/ DISABLE_SHARED=1 ../ && make && make install
if [ $? -ne 0 ]
then
    echo -e "\033[31m mysql-connector: make error \033[0m"
    exit 1
fi
rm -rf $tmp_dir


