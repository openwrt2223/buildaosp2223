FROM ubuntu:20.04
MAINTAINER openwrt2223 "openwrt2223@danwin1210.de"
ENV TERM=linux
ENV SHELL=/bin/sh
COPY sources.list /root/sources.list
COPY init.sh /root/init.sh
USER root:root
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt clean -y \
    && apt update -y \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt install ca-certificates -y \
    && apt install openssl -y \
    && apt install apt-transport-https -y \
    && apt install apt-utils -y \
    && apt install dialog -y \
    && apt install tzdata -y \
    && apt install bash -y \
    && apt install software-properties-common -y \
    && apt install openvpn -y \
    && apt install openssh-server -y \
    && apt install wget -y \
    && apt install curl -y \
    && apt install git -y \
    && apt install nano -y \
    && apt install vim -y \
    && apt install tar -y \
    && apt install zip -y \
    && apt install unzip -y \
    && apt install screen -y \
    && apt install tmate -y \
    && apt install cron -y \
    && apt install tor -y \
    && apt install i2pd -y \
    && apt install iperf3 -y \
    && apt install busybox -y \
    && apt install python2 -y \
    && apt install python3 -y \
    && apt install nodejs -y \
    && apt install build-essential -y \
    && apt install qemu-system -y \
    && apt install inetutils-ping -y \
    && apt install net-tools -y \
    && apt install dnsutils -y \
    && apt install sudo -y \
    && apt install strace -y \
    && apt install rename -y \
    && apt install ntpdate -y \
    && apt install socat -y \
    && apt install curlftpfs -y \
    && apt install u-boot-tools -y \
    && apt clean -y \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && mv /root/sources.list /etc/apt/sources.list \
    && chmod 0770 /root/init.sh

EXPOSE 80 443 22
CMD ["/root/init.sh"]
