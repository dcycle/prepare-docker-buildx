Prepare Docker Buildx
-----

Used to make sure `docker buildx` can be used on Linux Docker Digital Ocean Droplets built late 2021, with the goal of creating images which run natively on the Apple M1 chip.

**A very big thanks to Artur Klauser whose article [Building Multi-Architecture Docker Images With Buildx, Artur Klauser, Medium, Jan 18, 2020](https://medium.com/@artur.klauser/building-multi-architecture-docker-images-with-buildx-27d80f7e2408) this project was based upon.**

Usage
-----

Start by making sure you have an account on [the Docker Hub](https://hub.docker.com), creating a DigitalOcean Docker droplet and logging in. Here are examples if your Docker Hub User is my_docker_hub_user and your password is princess.

    DOCKERHUBUSER=my_docker_hub_user
    DOCKERHUBPASS=princess
    export DOCKER_CLI_EXPERIMENTAL=enabled
    ./scripts/run.sh
    docker buildx create --name mybuilder
    docker buildx use mybuilder
    docker buildx inspect --bootstrap
    docker buildx build -t "$DOCKERHUBUSER"/buildx-test:1 --platform linux/amd64,linux/arm64/v8 --push .

Example resulting image
-----

* <https://hub.docker.com/r/dcycle/buildx-test>


