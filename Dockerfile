FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER BiomeHub

LABEL version="2.13.6"
LABEL software.version="2.13.6"
LABEL software="vsearch"

RUN apt-get -y update; \
    apt-get -y upgrade; \
    apt-get -y install build-essential zlibc libc6 gcc g++ libboost1.67-all-dev cmake; \
    apt-get -y install wget; \
    apt-get -y install unzip; \
    apt-get clean

RUN wget https://github.com/torognes/vsearch/releases/download/v2.13.6/vsearch-2.13.6-linux-x86_64.tar.gz

RUN tar xzf vsearch-2.13.6-linux-x86_64.tar.gz

RUN mv /vsearch-2.13.6-linux-x86_64/bin/vsearch /usr/local/bin/

RUN rm -r /vsearch-2.13.6-linux-x86_64

RUN rm /vsearch-2.13.6-linux-x86_64.tar.gz


