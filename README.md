# Serveur Docker Lemp

Installer `docker` et `docker-compose`

Sur Debian & Ubuntu:
```bash
sudo apt install docker docker-compose
```

Sur ArchLinux:
```bash
sudo pacman -S docker docker-compose
```

<hr>

Créez le dossier `src` à la racine du serveur lemp (voir schema ci-dessous).

dans le repertoire du serveur lemp, entrer la commande `sudo docker-compose up -d`, et voila, le serveur LEMP fonctionne.

- Pour eteindre le serveur, faire `sudo docker-compose stop`

- Pour voir les infos des containers, faire `sudo docker-compose ps`

- Les fichiers du serveur se situent dans le dossier `/src/`

- La configuration php utilise ici `php.ini-production`. Pour utiliser la configuration `php.ini-development`, remplacer le contenu du fichier `php.ini`

- PHP-MY-ADMIN se situe au localhost au port `:8080` (`localhost:8080`)

- Pour accéder à la ligne de commande de mariadb (mysql), faire:
```
sudo docker exec -ti docker-lemp-mariadb-1 mysql -u root -p
```
<sub>Ici, `docker-lemp-mariadb-1` est le nom du container mariadb (mysql)</sup>

<hr>

```
.                                <--Lancer le serveur depuis ici
├── docker-compose.yml
├── nginx
│   └── conf.d
│       └── server.conf
├── php.dockerfile
├── README.md
└── src
    └── index.php
```
<sub>Repertoire du serveur LEMP</sub>
