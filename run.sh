#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt install openvpn openssh-server wget curl git nano vim tar zip unzip screen tmate cron tor i2pd iperf3 busybox python2 python3 nodejs build-essential qemu-system inetutils-ping net-tools dnsutils sudo strace rename ntpdate socat curlftpfs u-boot-tools -y
dpkg --add-architecture i386
apt install curl python python3 git libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-dev g++-multilib flex bison gperf build-essential libncurses5 libncurses5:i386 libncurses5-dev:i386 tofrodos python-markdown python3-markdown libxml2-utils xsltproc zlib1g-dev:i386 dpkg-dev libsdl1.2-dev git-core gnupg zip zlib1g-dev gcc-multilib libc6-dev-i386 x11proto-core-dev libx11-dev unzip m4 lib32z-dev ccache libssl-dev lib32ncurses5-dev -y
apt clean
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
chmod 0770 /root/cmd.sh
