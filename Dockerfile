FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive
ENV STEAM_DIR /opt/steamcmd

RUN apt-get update && apt-get install -y curl lib32gcc1 && apt-get clean && rm -rf /var/lib/apt/lists

RUN mkdir -p $STEAM_DIR &&\
    cd $STEAM_DIR &&\
    curl -s https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -vxz

RUN $STEAM_DIR/steamcmd.sh +login anonymous +quit

WORKDIR $STEAM_DIR

ENTRYPOINT ["./steamcmd.sh"]
