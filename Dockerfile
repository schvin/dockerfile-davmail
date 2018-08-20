FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESHED_AT 2018-08-20

EXPOSE 1110

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/4.8.6/davmail-4.8.6-2600.zip/download
WORKDIR /usr/local
RUN unzip /tmp/download && mv davmail* davmail

ADD davmail.properties /usr/local/davmail/
ENTRYPOINT /bin/sh /usr/local/davmail/davmail.sh /usr/local/davmail/davmail.properties
