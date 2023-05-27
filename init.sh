#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
dpkg-reconfigure tzdata <<EOF
6
31
EOF
cd /data/
mkdir -p /root/swap
chown -R root:root /root/swap/
chmod -R 0770 /root/swap/
dd if=/dev/zero of=/root/swap/swap bs=1M count=1024
mkswap /root/swap/swap
chmod 0600 /root/swap/swap
sysctl vm.swappiness=100
swapon /root/swap/swap
adduser ubuntu <<EOF
ubuntu
ubuntu
ubuntu
1
1
1
ubuntu
yes
EOF
echo 'ubuntu ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
echo 'root:root' | chpasswd
echo 'ubuntu:ubuntu' | chpasswd
hostname kccpdtsn1
echo '127.0.0.1 kccpdtsn1' >> /etc/hosts
echo '::1 kccpdtsn1' >> /etc/hosts
dpkg --add-architecture i386
apt install curl python python3 git libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev g++-multilib flex bison gperf build-essential libncurses5 libncurses5:i386 libncurses5-dev:i386 tofrodos python-markdown python3-markdown libxml2-utils xsltproc zlib1g-dev:i386 dpkg-dev libsdl1.2-dev git-core gnupg zip zlib1g-dev gcc-multilib libc6-dev-i386 x11proto-core-dev libx11-dev unzip m4 lib32z-dev ccache libssl-dev lib32ncurses5-dev -y
mkdir -p /var/run/sshd
service ssh start
df -h
free -mh
ps -ef
env
pwd
ls -all
id
lscpu
wget -U KCC/1.0 https://cf.kccpdt.life/gotty -O /root/gotty
chmod 0770 /root/gotty
/root/gotty --permit-write --credential admin:admin --address 0.0.0.0 --port 80 bash --login

