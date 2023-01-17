FROM debian:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install unzip -y
RUN apt install wget -y
RUN mkdir /hak5c2
RUN wget -q https://c2.hak5.org/download/latest -O /hak5c2/cloudc2.zip
RUN unzip /hak5c2/cloudc2.zip /hak5c2
RUN find ./hak5c2/ -type f -not -name '*amd64_linux' -delete
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT /bin/bash /docker-entrypoint.sh
