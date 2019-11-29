FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESHED_AT 2019-11-29

EXPOSE 1110

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/5.2.0/davmail-5.2.0-2961.zip/download
RUN mkdir /usr/local/davmail
WORKDIR /usr/local/davmail
RUN unzip /tmp/download

ADD davmail.properties /usr/local/davmail/
ENTRYPOINT /usr/local/davmail/davmail /usr/local/davmail/davmail.properties
