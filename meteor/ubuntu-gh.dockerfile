ARG FROM_IMAGE

FROM ${FROM_IMAGE}

USER root

# Configure GH groups
RUN addgroup --gid 1001 gh

# Configure user gh
RUN adduser -q --uid 1001 --gid 1001 --home /home/gh --disabled-password --gecos "" --shell /bin/bash gh && usermod -a -G sudonopwd,sudo,meteor gh

RUN cp -r /home/meteor/.meteor /home/gh/ && chown gh:gh -R /home/gh

USER gh

RUN meteor npm i -g yarn
