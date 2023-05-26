FROM ubuntu:20.04
MAINTAINER openwrt2223 "openwrt2223@danwin1210.de"
ENV TERM=linux
ENV SHELL=/bin/sh
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
    && apt install cron -y

