FROM ubuntu:16.04

MAINTAINER Danilo Rodrigues <danilo.jrodrigues@gmail.com>

RUN apt-get update -qq && apt-get install -y build-essential wget

WORKDIR /opt

# INSTALL PHASH
RUN apt-get install -y libavformat-dev libmpg123-dev libsamplerate-dev libsndfile-dev
RUN apt-get install -y cimg-dev libavcodec-dev ffmpeg libswscale-dev
RUN apt-get install -y libjpeg-dev libpng-dev imagemagick libfftw3-dev
RUN apt-get install -y ffmpeg gstreamer1.0-libav
RUN wget http://www.phash.org/releases/pHash-0.9.6.tar.gz && tar -xvf pHash-0.9.6.tar.gz
WORKDIR /opt/pHash-0.9.6/
RUN ./configure
RUN make
RUN make install

WORKDIR /opt
RUN rm pHash-0.9.6.tar.gz
