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

RUN wget https://github.com/torognes/vsearch/archive/v2.13.6.tar.gz; \
    tar xzf v2.13.6.tar.gz
	
WORKDIR /vsearch-2.13.6; \
        ./autogen.sh; \
        ./configure; \
        make; \
        make install; \
		cp bin/vsearch /usr/local/bin/

WORKDIR /

