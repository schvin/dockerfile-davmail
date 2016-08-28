FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESEHD_AT 2016-08-28b

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/4.7.2/davmail-linux-x86_64-4.7.2-2427.tgz/download
WORKDIR cd /usr/local
RUN tar xfz /tmp/download && ln -s davmail* davmail

# XXX change user context, and add config
#ADD davmail.properties
#ENTRYPOINT /usr/local/davmail/davmail.sh /usr/local/davmail/davmail.properties
