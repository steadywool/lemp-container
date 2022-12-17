# LEMP Container

LEMP Container that can be used with Docker & Podman 🐋

## Features

- [Nginx Alpine (reverse proxy server)](https://hub.docker.com/_/nginx)

- [MariaDB (database server)](https://hub.docker.com/_/mariadb)

- [PHP FPM (server-side scripting language)](https://hub.docker.com/_/php)

- [PhpMyAdmin (MySQL/MariaDB interface)](https://hub.docker.com/_/phpmyadmin)

## Installation

To install this LEMP Stack, you need `podman` & `podman-compose` or `docker` & `docker-compose` are installed.

Then clone this repository using `git`:
```
git clone https://github.com/kaniville/lemp-container.git
```

## Usage

To start the container, go inside the `lemp-container` directory and run:
```
podman-compose up -d
```
or with Docker:
```
docker compose up -d
```

To stop the container, replace `up -d` with `down` like this:
```
podman-compose down
```

You can see if the LEMP stack is running with the option `ps`:
```
podman-compose ps
```

⚠️ **BE CAREFUL: by default Docker need root access. Use Podman or Docker in rootless mode if you care about security.**

After the container has been started, you can access your LEMP Stack from `localhost:8080` with your favorite web browser.

The PhpMyAdmin is available at `localhost:8081`.

To modify these ports, you can edit the `docker-compose.yaml` file.
