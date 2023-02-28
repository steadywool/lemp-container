# LEMP Container

LEMP Container that can be used with Docker & Podman 🐋

## Features

- [Nginx Alpine (reverse proxy server)](https://hub.docker.com/_/nginx)

- [MariaDB (database server)](https://hub.docker.com/_/mariadb)

- [PHP FPM (server-side scripting language)](https://hub.docker.com/_/php)

- [PhpMyAdmin (MySQL/MariaDB interface)](https://hub.docker.com/_/phpmyadmin)

## Installation

To install this LEMP Stack, you need to install `docker` & `docker-compose` as root:
```bash
# On Debian or Ubuntu
apt install docker docker-compose

# On Archlinux
pacman -S docker docker-compose
```

Then clone this repository using `git`:
```
git clone https://github.com/kaniville/lemp-container.git
```

You need to start the Docker service as root:
```
systemctl enable docker.service
systemctl start docker.service
```

## Usage

To start the container, go inside the `lemp-container` directory and run:
```
docker compose up -d
```

To stop the container, replace `up -d` with `down` like this:
```
docker compose down
```

You can see if the LEMP stack is running with the option `ps`:
```
docker compose ps
```

⚠️ **BE CAREFUL: by default Docker need root access. Use Podman or Docker in rootless mode if you care about security.**

After the container has been started, you can access your LEMP server from `localhost:8080` with your favorite web browser.

PhpMyAdmin is available at `localhost:8081`.

## FAQ

- **Why can't I communicate with my database ?**

In your `*.php` files, when you configure the database host, use `mariadb` instead of `localhost`:
```php
$conn = mysqli_connect('mariadb', 'USER', 'PASSWORD', 'DATABASE' , "PORT");
```

- **How can I use another port for the Nginx server instead of `8080` ?**

Stop the containers & modify the docker-compose.yml file like this:
```yml
 nginx:
    image: docker.io/nginx:alpine
    ports:
      # If you want to change the used port, modify the first one
      - 127.0.0.1:80:80 # Nginx+Php server
      - 127.0.0.1:8080:8080 # Phpmyadmin
```

Here Nginx uses port `80` instead of `8080` and PhpMyAdmin uses port `8080` instead of `8081`.

⚠️ **BEWARE: By default, Docker & Podman rootless can't expose privileged TCP/UDP ports (<1024).**

- **I can't access this server from other devices on the same network !**

You need to remove the two "127.0.0.1" from the `docker-compose.yml` file like this:
```yml
 nginx:
    image: docker.io/nginx:alpine
    ports:
      # If you want to connect from other devices on the same network, remove the two "127.0.0.1:"
      - 8080:80 # Nginx+Php server
      - 8081:8080 # Phpmyadmin
```

- **I can't use this thing with a Raspberry Pi !**

You can change the image user for Mysql to one compatible with the architecture of a Raspberry Pi.

```yml
mariadb:
    # Use this image instead of the official one
    image: docker.io/monstrenyatko/rpi-mariadb
```
