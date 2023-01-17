FROM debian:latest

RUN apt update -y
RUN apt upgrade -y
RUN apt install unzip -y
RUN apt install wget -y
RUN mkdir /hak5c2
RUN cd /hak5c2
RUN wget -q https://c2.hak5.org/download/latest -O cloudc2.zip
RUN unzip cloudc2.zip
RUN find . -type f -not -name '*amd64_linux' -delete
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT /bin/bash /docker-entrypoint.sh
