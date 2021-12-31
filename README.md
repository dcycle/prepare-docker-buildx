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
    docker login -u"$DOCKERHUBUSER" -p"$DOCKERHUBPASS"
    docker buildx build -t "$DOCKERHUBUSER"/buildx-test:1 --platform linux/amd64,linux/arm64/v8 --push .

The dreaded `dpkg: error processing package libc-bin (--configure)` error
-----

This one is truly ugly. At the time of this writing, it happens when I try to install git on the PHP:7.4 image on the ARM architecture, running QEMU emulation on a Ubuntu machine with the above script.

I used a technique documented in the forum post [libc-bin error during upgrade, by sixdigit, Aug 21, 2020, Linux Mint Forums](https://forums.linuxmint.com/viewtopic.php?p=1871690) to get around this, but this causes further issues so I do not recommend it: [You can see a working example here](https://github.com/dcycle/prepare-docker-buildx/tree/master/example/Dockerfile).

Complete steps to reproduce can be found at https://github.com/docker-library/drupal/issues/206.

Example using a Dockerfile
-----

In this project's example folder you will find a complete project which you can run directly on a new DigitalOcean Docker droplet. Once you create the droplet and log in, the following should work:

    cd ~
    git clone https://github.com/dcycle/prepare-docker-buildx.git
    cd prepare-docker-buildx/example
    export DOCKERHUBUSER=my_docker_hub_user
    export DOCKERHUBPASS=princess
    ./build.sh

Experimental feature in progress
-----

**This feature is experimental and under development; it is not ready for use.**

This script relies on [Qemu](https://www.qemu.org).

By default we install Qemu using the package manager, which is relatively fast, but which installs an earlier version of Qemu which can cause some errors [such as this one](https://askubuntu.com/questions/1339558).

If you would like the latest version of Qemu, you can run, instead of `./scripts/run.sh`,

    export INSTALL_QEMU_MAKE=1 && ./scripts/run.sh

This installs the latest version of Qemu, but can take an extremely long time to install, around one to two hours.

Example speed increases
-----

Although M1 can run Intel images in emulation, you will get way better performance by creating native images. See [Docker PHP on the M1 chip, example with Static Analysis on Drupal: 9 times faster, Dcycle Blog, November 17, 2021](https://blog.dcycle.com/blog/2021-11-17/m1-docker-php-speed-test/).

Example resulting image
-----

* <https://hub.docker.com/r/dcycle/buildx-test>
