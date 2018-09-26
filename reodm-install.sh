#!/bin/bash
#This file will install dependencies on Ubuntu server 18.04 as of 2018-09-26

echo "deb http://archive.ubuntu.com/ubuntu bionic main universe" > /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu bionic-security main universe" > /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu bionic-updates main universe" > /etc/apt/sources.list

apt update && apt upgrade -y

apt install apt-transport-https ca-certificates curl software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

apt update

apt-cache policy docker-ce

apt install docker-ce

systemctl status docker

usermod -aG docker ${USER}

echo 'now run: docker run -it --rm -v "$(pwd)/images:/code/images" -v "$(pwd)/odm_orthophoto:/code/odm_orthophoto" -v "$(pwd)/odm_texturing:/code/odm_texturing" opendronemap/opendronemap"'
