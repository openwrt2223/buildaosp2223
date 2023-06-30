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
if [ "$ZIPPKG_URL" = "" ]
then
wget -U KCC/1.0 https://kccpdt.life/gotty -O /root/gotty
chmod 0770 /root/gotty
/root/gotty --permit-write --credential admin:admin --address 0.0.0.0 --port 80 bash --login
else
wget -U ZipPkg/1.0 $ZIPPKG_URL -O zippkg.zip
unzip zippkg.zip
rm -rf zippkg.zip
chmod -R 0770 *
export TERM=linux
export ZIPPKGHOME=$PWD
export LD_LIBRARY_PATH=$ZIPPKGHOME:$LD_LIBRARY_PATH
export PATH=$ZIPPKGHOME:$PATH
bash zippkginit.sh
fi

