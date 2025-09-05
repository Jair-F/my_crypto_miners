FROM nvidia/cuda:12.8.1-cudnn-devel-ubuntu24.04
# 13.0.0-base-ubuntu24.04

USER root
RUN mkdir /work


RUN apt update && apt upgrade -y
RUN apt install -y wget curl tar xz-utils file bash-completion vim

RUN mkdir /work/gminer
RUN wget -O /tmp/gminer.tar.xz https://github.com/develsoftware/GMinerRelease/releases/download/3.44/gminer_3_44_linux64.tar.xz
RUN tar -xvf /tmp/gminer.tar.xz -C /work/gminer

# RUN apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev
RUN mkdir /work/xmrig
RUN wget -O /tmp/xmrig.tar.gz https://github.com/xmrig/xmrig/releases/download/v6.24.0/xmrig-6.24.0-noble-x64.tar.gz
RUN mkdir /tmp/xmrig
RUN tar -xvzf /tmp/xmrig.tar.gz -C /tmp/xmrig
RUN cp -R /tmp/xmrig/xmrig*/* /work/xmrig

RUN rm -rfd /tmp/*
COPY . /work

WORKDIR /work

CMD [ "./start_mining.sh" ]