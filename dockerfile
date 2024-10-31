
FROM ubuntu:18.04

LABEL vendor="mister.semik"

ARG APP_VERSION=0.0.1
ARG USER='testuser' && PASS='testpass'

RUN echo "The application version is ${APP_VERSION}"
RUN apt-get update && apt-get install -y openssh-server net-tools iputils-ping  nano \
sudo curl wget nmap

RUN useradd -rm -d /home/${USER}  -s /bin/bash -g root -G sudo -u 1000 ${USER} 
RUN  echo ${USER}':'${PASS} | chpasswd

RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]


