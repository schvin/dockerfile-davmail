FROM openjdk:jdk-alpine
MAINTAINER George Lewis <schvin@schvin.net>
ENV REFRESEHD_AT 2018-05-31
>>>>>>> 1bfa4efc34f4b3246cd5fa5fac85d02c24a2c1f2

EXPOSE 1110

RUN apk -U upgrade
RUN apk -U add curl
RUN cd /tmp && curl -L -O https://sourceforge.net/projects/davmail/files/davmail/4.8.4/davmail-linux-x86_64-4.8.4-2570.tgz/download
WORKDIR /usr/local
RUN tar xfz /tmp/download && mv davmail* davmail

ADD davmail.properties /usr/local/davmail/
ENTRYPOINT /bin/sh /usr/local/davmail/davmail.sh /usr/local/davmail/davmail.properties
