FROM nvidia/cuda:13.0.0-base-ubuntu24.04

USER root
RUN mkdir /work


RUN apt update && apt upgrade -y
RUN apt install -y wget curl tar git

RUN mkdir /work/gminer
RUN wget -o /tmp/gminer.tar.gz https://github.com/develsoftware/GMinerRelease/releases/download/3.44/gminer_3_44_linux64.tar.xz
RUN tar -xvzf /tmp/gminer.tar.gz -C /work/gminer

# RUN apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN mkdir /work/xmrig
RUN wget -o /tmp/xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-noble-x64.tar.gz
RUN tar -xvzf /tmp/xmrig.tar.gz -C /work/xmrig

COPY * /work

WORKDIR /work

ENTRYPOINT [ "./start_mining.sh", ";"]