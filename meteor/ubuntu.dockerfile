FROM ubuntu:20.04

ARG METEOR_VERSION

RUN apt update && apt install python build-essential curl git sudo nano -y && apt clean --dry-run

# Configure groups
RUN addgroup --gid 927 sudonopwd && addgroup --gid 1000 meteor

# Configure user meteor
RUN adduser -q --uid 1000 --gid 1000 --home /home/meteor --disabled-password --gecos "" --shell /bin/bash meteor && usermod -a -G sudonopwd,sudo meteor

# Configure sudo allowed commands
# [username] [any-hostname]=([run-as-username]:[run-as-groupname]) [commands-allowed]
RUN echo "%sudonopwd   ALL=(ALL:ALL) NOPASSWD: /usr/bin/cp" >> /etc/sudoers.d/sudonopwd

USER meteor

RUN curl https://install.meteor.com/?release=${METEOR_VERSION} | sh

RUN meteor npm i -g yarn
