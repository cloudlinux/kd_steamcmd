FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y curl lib32gcc1 && apt-get clean && rm -rf /var/lib/apt/lists

RUN mkdir -p /opt/steamcmd &&\
    cd /opt/steamcmd &&\
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

WORKDIR /opt/steamcmd

ENTRYPOINT ["./steamcmd.sh"]
