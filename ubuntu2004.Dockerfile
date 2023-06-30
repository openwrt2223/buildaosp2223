FROM ubuntu:20.04
MAINTAINER openwrt2223 "openwrt2223@danwin1210.de"
ENV TERM=linux
ENV SHELL=/bin/sh
COPY run.sh /root/run.sh
COPY sources.list /root/sources.list
COPY cmd.sh /root/cmd.sh
USER root:root
RUN export DEBIAN_FRONTEND=noninteractive \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && mv /root/sources.list /etc/apt/sources.list \
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
    && chmod 0770 /root/run.sh \
    && bash /root/run.sh \
    && rm -rf /root/run.sh

EXPOSE 80 443 22
CMD ["/root/cmd.sh"]
