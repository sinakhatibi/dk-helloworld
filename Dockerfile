FROM ubuntu:16.04
MAINTAINER Sina Khatibi <info@sinakhatibi.com>
LABEL Description="Docker image for Hello World"

ENV TZ=Europe/Berlin
ENV BAKE_HOME=`pwd`/bake 
ENV PATH="${BAKE_HOME}:${PATH}"
ENV PYTHONPATH="${PYTHONPATH}:${BAKE_HOME}"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get install -y \
gcc \
g++ \
python \
python3 \
python3-dev \
curl

RUN mkdir -p /usr/mycode
WORKDIR /usr/mycode

HEALTHCHECK --interval=5m --timeout=3s CMD curl --fail http://localhost:9000/guid/ || exit 1

COPY ./hello_world.cpp /usr/mycode
RUN g++ -o hello_world hello_world.cpp
ARG OPT
ENV TT=$OPT
CMD ./hello_world ${TT}