# Installation

Installer `docker` et `docker-compose`

Sur Debian & Ubuntu:
```bash
sudo apt install docker docker-compose
```

Sur ArchLinux:
```bash
sudo pacman -S docker docker-compose
```

Vous pouvez également installer `git` et faire `git clone https://github.com/Kaniville/docker-lemp` pour le télecharger.

Si vous avez décider de télecharger le fichier zip, un simple `unzip NOM_DU_ZIP.zip` dans le répertoire ou il a été télecharger suffit à le décompresser.

# Configuration

Créez le dossier `src` à la racine du serveur lemp (voir schema ci-dessous).

dans le repertoire du serveur lemp, entrer la commande `sudo docker-compose up -d`, pour construire les container et les démarrés.

- Pour démarrer le serveur sans reconstruire les containers, `sudo docker-compose start`

- Pour eteindre le serveur, faire `sudo docker-compose stop`

- Pour voir les infos des containers, faire `sudo docker-compose ps`

- Les fichiers du serveur se situent dans le dossier `/src/`

- La configuration php utilise ici `php.ini-production`. Pour utiliser la configuration `php.ini-development`, remplacer le contenu du fichier `php.ini`

- PHP-MY-ADMIN se situe au localhost au port `:8080` (`localhost:8080`)

- Pour accéder à la ligne de commande de mariadb (mysql), faire:
```
sudo docker exec -ti docker-lemp-mariadb-1 mysql -u root -p
```

- Pour rendre accessible le serveur LEMP à tous les appareils sous le même réseau, dans le fichier `docker-compose.yml`, 
remplacer `127.0.0.1:PORT:PORT` par uniquement `PORT:PORT`.

<sub>Ici, `docker-lemp-mariadb-1` est le nom du container mariadb (mysql)</sup>

<hr>

```
.                       <-- Dossier "docker-lemp"
├── config
│   ├── nginx
│   │   ├── conf.d
│   │   │   └── server.conf
│   │   └── nginx.conf
│   └── php
│       ├── php.ini
│       ├── php.ini-development
│       └── php.ini-production
├── docker-compose.yml
├── php-dockerfile
├── README.md
└── src
```

<sub>Repertoire du serveur LEMP</sub>

- Pour afficher les infos des images/containers docker, `sudo docker images` & `sudo docker container ps`

- Pour supprimer toutes les images docker inutilisées, `sudo docker image prune`

- Pour supprimer tout les containers inutilisés, `sudo docker container prune`

- Pour supprimer une seule image ou un seul container, remplacez `prune` par `rm CONTAINER_ID`
