#!/usr/bin/env bash
export METEOR_VERSION=${METEOR_VERSION:-2.6.1}
export CONTAINER_REGISTRY=${CONTAINER_REGISTRY:-""}
export IMAGE_NAME=meteor
export IMAGE_TAG=${METEOR_VERSION}
export IMAGE_NAME_TAG="${IMAGE_NAME}:${IMAGE_TAG}"
export PUBLISH_GH=${PUBLISH_GH:-false}
export PUBLISH_DOCKER_HUB=${PUBLISH_DOCKER_HUB:-false}

echo "IMAGE_NAME_TAG: ${IMAGE_NAME_TAG}"
docker build . -t "${IMAGE_NAME_TAG}" -f ubuntu.dockerfile
if [ "${PUBLISH_GH}" == "true" ]; then
  echo Publishing on Github
  docker tag "${IMAGE_NAME_TAG}" "${GH_REGISTRY}${IMAGE_NAME_TAG}"
  docker push "${GH_REGISTRY}${IMAGE_NAME_TAG}"
fi
if [ "${PUBLISH_DOCKER_HUB}" == "true" ]; then
  echo Publishing on Docker Hub
  docker tag "${IMAGE_NAME_TAG}" "zododev/${IMAGE_NAME_TAG}"
  docker push "zododev/${IMAGE_NAME_TAG}"
fi
