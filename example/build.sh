#!/bin/bash
#
# See ./README.md.
#
set -e

if [ -z "$DOCKERHUBUSER" ]; then
  >&2 echo "You must export DOCKERHUBUSER and DOCKERHUBPASS; see ./README.md."
  exit 1
fi
if [ -z "$DOCKERHUBPASS" ]; then
  >&2 echo "You must export DOCKERHUBUSER and DOCKERHUBPASS; see ./README.md."
  exit 1
fi

# Make idempotent.
rm -rf prepare-docker-buildx
# See https://github.com/dcycle/prepare-docker-buildx, for M1 native images.
git clone https://github.com/dcycle/prepare-docker-buildx.git
cd prepare-docker-buildx
export DOCKER_CLI_EXPERIMENTAL=enabled
./scripts/run.sh
cd ..

docker buildx create --name mybuilder
docker buildx use mybuilder
docker buildx inspect --bootstrap
docker login -u"$DOCKERHUBUSER" -p"$DOCKERHUBPASS"

docker buildx build -t "$DOCKERHUBUSER"/buildx-test:1 --platform linux/amd64,linux/arm64/v8 --push .
