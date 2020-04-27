FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESHED_AT 2020-04-27

EXPOSE 1110

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/5.5.1/davmail-5.5.1-3299.zip/download
RUN mkdir /usr/local/davmail
WORKDIR /usr/local/davmail
RUN unzip /tmp/download

ADD davmail.properties /usr/local/davmail/
ENTRYPOINT /usr/local/davmail/davmail /usr/local/davmail/davmail.properties
