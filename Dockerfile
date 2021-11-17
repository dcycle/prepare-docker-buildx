# https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408
FROM alpine:latest
CMD echo "Running on $(uname -m)"
