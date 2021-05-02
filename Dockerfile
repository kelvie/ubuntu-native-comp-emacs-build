FROM ubuntu:20.04
MAINTAINER Kelvie Wong <kelvie@kelvie.ca>

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Los_Angeles
RUN apt update
RUN apt-get install -fy software-properties-common 
RUN add-apt-repository ppa:ubuntu-elisp/ppa --enable-source -y -n

# For libgccjit that doesn't break
#RUN add-apt-repository ppa:ubuntu-toolchain-r/ppa -y -n

RUN apt-get update

RUN apt-get install -fy git-core dpkg-dev vim-tiny libgccjit-9-dev
WORKDIR /src

RUN apt-get source emacs-snapshot
RUN apt-get -fy build-dep emacs-snapshot

ADD build.sh rules ./

CMD /src/build.sh
