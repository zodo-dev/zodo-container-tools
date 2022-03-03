#!/usr/bin/env bash
export NODE_VERSION=16
export METEOR_VERSION=2.6.1
export CONTAINER_REGISTRY=${CONTAINER_REGISTRY:-""}
export IMAGE_NAME=meteor
export IMAGE_TAG=${METEOR_VERSION}
export IMAGE_NAME_TAG="${CONTAINER_REGISTRY}${IMAGE_NAME}:${IMAGE_TAG}"

echo "IMAGE_NAME_TAG: ${IMAGE_NAME_TAG}"
docker build . -t "${IMAGE_NAME_TAG}"
docker push "${IMAGE_NAME_TAG}"