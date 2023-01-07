# shiny-envs

[![Build status](https://github.com/cnboonhan/shiny-envs/workflows/CI/badge.svg?branch=main&event=push)](https://github.com/cnboonhan/shiny-envs/actions?query=workflow%3ACI)

This repository contains my standard development environments. Ideally, the development machine only has a minimal set of "bare-metal" dependencies; Development happens in spun-up ephermal containers, and persistent files are stored in docker volumes.

The necessary bare-metal dependencies are:
* [docker](https://docs.docker.com/get-docker/)
* [docker-compose](https://github.com/docker/compose/releases)
* [lazydocker](https://github.com/jesseduffield/lazydocker)

Run the `setup.bash` script as root to install these dependencies.

We use lazydocker custom commands to spin up development environments, using the provided `lazydocker.yml` configuration.
```
mkdir -p $HOME/.config/lazydocker && ln -s $PWD/lazydocker.yml  $HOME/.config/lazydocker/config.yml
```

We save files to persist across container launches using volumes. Each container mounts the persistence filestorage volume `/sda` on `/mnt` and executes a script `/mnt/.customrc` on each terminal launch. A sample `customrc` is provided that symlinks the contents of `/mnt` to the container home directory.

You can download prebuilt docker images directly from Docker Hub. For example:
```
docker pull cnboonhan/dev
docker tag cnboonhan/dev dev
docker image rm cnboonhan/dev
```

The main development interface is to be the browser via `ttyd` at `127.0.0.1:8898`. The default credentials are `root:root`.
