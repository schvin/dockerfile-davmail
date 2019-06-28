FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESHED_AT 2019-06-28

EXPOSE 1110

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/5.2.0/davmail-5.2.0-2961.zip/download
WORKDIR /usr/local
RUN unzip /tmp/download && mv davmail* davmail

ADD davmail.properties /usr/local/davmail/
ENTRYPOINT /bin/sh /usr/local/davmail/davmail.sh /usr/local/davmail/davmail.properties
