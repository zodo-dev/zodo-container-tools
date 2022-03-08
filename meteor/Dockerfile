ARG NODE_VERSION=16
ARG METEOR_VERSION=2.6.1

FROM node:${NODE_VERSION}-slim

RUN mkdir -p /node_modules/bin && chown node:node -R /node_modules

RUN apt update && apt install python build-essential curl git -y && apt clean --dry-run

ENV NPM_PACKAGES=/node_modules

ENV PATH=$NPM_PACKAGES/bin:$PATH

USER node

RUN npm config set prefix $NPM_PACKAGES

RUN npm i -g meteor

USER root

RUN ln -s /home/node/.meteor/meteor /usr/local/bin/

USER node

RUN meteor npm i -g yarn
