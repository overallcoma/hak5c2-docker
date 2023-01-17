FROM debian:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install unzip -y
RUN apt install wget -y
RUN shopt -s extglob
RUN rm /hack5c2/!(*amd64_linux)
RUN mkdir /hak5c2
RUN wget -q https://c2.hak5.org/download/latest -O /hak5c2/cloudc2.zip
RUN unzip /hak5c2/cloudc2.zip
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
