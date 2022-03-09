# MacOS Apache2 MariaDB PHP

## Préparer les outils de développement MacOS

### Xcode

Lancer la commande pour installer Xcode.

```bash
xcode-select --install
```

### Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## Installer la plateforme MAMP

### Serveur d'application : PHP

Ajouter des sources de paquet supplémentaires pour PHP 7.4 et 8.1 :

```bash
sudo brew tap shivammathur/php
```

Installer les dernières versions stables de PHP :

```bash
sudo brew install shivammathur/php/php@7.4
sudo brew install shivammathur/php/php@8.1
```

Utiliser la dernière version de PHP par défaut :

```bash
sudo brew link --overwrite --force shivammathur/php/php@8.1
```

### Serveur SQL: MariaDB

Installer MariaDB avec la commande suivante :

```bash
sudo brew install mariadb
```

Démarrer MariaDB avec la commande suivante :

```bash
sudo brew services start mariadb
```

Sécuriser un nouvelle installation de MariaDB :

```bash
sudo mariadb-secure-installation
```

### Serveur Web: Apache2 (httpd)

S'assurer que les anciennes versions d'apache2 sont désactivées.

```bash
sudo apachectl stop
sudo launchctl unload -w /Systems/Library/LaunchDaemons/org.apache.httpd.plist
```

Installer la dernière version d'Apache2 :

```bash
sudo brew install httpd
```

Démarrer Apache2 :

```bash
sudo brew services start httpd
```

## Préparer l'espace de travail

Créer un dossier pour lier la configuration dans :

```bash
mkdir -p $HOME/WebConfig
```

Attribuer des droits au développeur sur la configuration :

```bash
sudo chown -R $(id -u):$(id -g) $(brew --prefix)/etc/httpd/.
sudo chown -R $(id -u):$(id -g) $(brew --prefix)/etc/php/.
```

Lier les dossiers du serveur Web à l'espace de travail.

```bash
ln -sf $(brew --prefix)/etc/httpd $HOME/WebConfig/httpd
ln -sf $(brew --prefix)/etc/php $HOME/WebConfig/php
```

Avoir les dossiers du serveur Web à disposition :

```bash
sudo chown -R $(id -u):$(id -g) $(brew --prefix)/var/www/.
ln -sf $(brew --prefix)/var/www $HOME/Sites
```

Ecrire un fichier pour vérifier la configuration :

```bash
echo '<?php phpinfo(); ?>' | tee ~/Sites/sysinfo.php
```

> Se rendre sur : http://localhost/sysinfo.php
