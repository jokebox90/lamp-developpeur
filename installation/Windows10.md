# Installation de Linux Apache MySQL PHP

## Etapes d'installation

1. [Activer les extensions de virtualisation](#activer-les-extensions-de-virtualisation)
2. [Installer le gestionnaire de logiciels Chocolately](#installer-le-gestionnaire-de-logiciels-chocolately)
3. [Installer des outils de développement](#installer-des-outils-de-développement)
4. [Installer Debian Linux pour Windows Subsystem for Linux](#installer-debian-linux-pour-windows-subsystem-for-linux)
5. [Utiliser Windows Terminal pour toutes vos actions](#utilier-windows-terminal-pour-toutes-vos-actions)
6. [Mettre à jour Debian Linux](#mettre-à-jour-debian-linux)
7. [Installer LAMP et PhpMyAdmin avec Git et Vim dans Debian Linux](#installer-lamp-et-phpmyadmin-avec-git-et-vim-dans-debian-linux)
8. [Démarrer VSCode dans le répertoire Web](#démarrer-vscode-dans-le-répertoire-web)
## Activer les extensions de virtualisation

Ouvrir Powershell en tant qu'administrateur :

1. Menu "Démarrer"
2. Rechercher "powershell"
3. Faire un Clic-droit sur Powershell
4. Cliquer sur "Exécuter en tant qu'administrateur"

```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

> Important: Redémarer Windows

## Installer le gestionnaire de logiciels Chocolately

Ouvrir Powershell en tant qu'administrateur :

1. Menu "Démarrer"
2. Rechercher "powershell"
3. Faire un Clic-droit sur Powershell
4. Cliquer sur "Exécuter en tant qu'administrateur"

Copier coller la commande suivante pour lancer le téléchargement et l'installation de Chocolately :

```ps
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

> Note: Garder la fenêtre Powershell ouverte pour la suite.

## Installer des outils de développement

Si besoin, ouvrir Powershell en tant qu'administrateur :

1. Menu "Démarrer"
2. Rechercher "powershell"
3. Faire un Clic-droit sur Powershell
4. Cliquer sur "Exécuter en tant qu'administrateur"

Copier-coller les commandes suivantes :

```ps
# Installe un terminal ergonomique pour Windows
choco install -y microsoft-windows-terminal

# Installe la dernière version complète de Powershell (v7)
choco install -y powershell-core

# Installe la dernière version de Windows Subsystem for Linux (wsl2)
choco install -y --force wsl2
```

> Important: Redémarer Windows

## Installer Debian Linux pour Windows Subsystem for Linux

1. Debian Linux est disponible directement depuis [Microsoft Store à partir de ce lien.](https://www.microsoft.com/fr-fr/p/debian/9msvkqc78pk6?rtc=1&activetab=pivot:overviewtab)
2. Un fois récupérée et ouverte, Debian demande la création d'un utilisateur et d'un mot de passe.
3. L'environnement est prêt à être utilisé

> Note: fermer la fenêtre Debian et démarrer la partie suivante avec Windows Terminal
## Utiliser Windows Terminal pour toutes vos actions

Windows Terminal est un point d'accès unique et ergonomique pour gérer le développement en ligne de commande. Il dispose d'un menu dans la barre de titre de sa fenêtre qui permet d'ouvrir rapidement la console Windows, Powershell et Debian Linux.

Ouvrir Windows Terminal avec l'utilisateur principal (les droits d'administrations ne sont plus nécessaires) :

1. Menu "Démarrer"
2. Rechercher "windows terminal"
3. Cliquer sur l'application pour la lancer

## Mettre à jour Debian Linux

Démarrer Debian à partir du menu de Windows Terminal.

Copier-coller les commandes suivantes pour démarrer avec la dernière version stable des logiciels et du système Debian.

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Met à jour le système avec la dernière version des logiciels
sudo apt upgrade -y
```

Copier-coller les commandes suivantes pour démarrer avec la dernière version stable des logiciels et du système Debian.

> Note: Garder la fenêtre Windows Terminal sur Debian Linux ouverte pour la suite.

## Démarrer avec Git et Vim dans Debian Linux

Si besoin, démarrer Debian à partir du menu de Windows Terminal.

Installer de Git et d'autres outils utiles au quotidien du développeur.

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Installe git et vim
sudo apt install -y git vim

# Installer des outils complémentaires (sauvent la vie)
sudo apt install -y \
  apache2-utils \
  apt-transport-https \
  build-essential \
  curl \
  dnsutils \
  ftp \
  gnupg2 \
  htop \
  iproute2 \
  lsof \
  python3-pip \
  net-tools \
  netcat \
  nmap \
  nmon \
  openssl \
  rsync \
  ssh \
  tcpdump \
  tree \
  unzip \
  wget \
  whois \
  zip
```

## Installer LAMP et PhpMyAdmin avec Git et Vim dans Debian Linux

Copier-coller les commandes suivantes pour obtenir une installation complète de Linux Apache MySQL PHP.

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Installe la partie serveur Web et serveur SQL
sudo apt install -y \
  apache2 \
  imagemagick \
  libapache2-mod-php7.4 \
  mariadb-server \
  mariadb-client

# Démarre le serveur MySQL
sudo /etc/init.d/apache2 start

# Démarre le serveur MySQL
sudo /etc/init.d/mariadb start

# Installe PHP et ses extensions courantes
sudo apt install -y \
  php7.4-apcu \
  php7.4-bcmath \
  php7.4-curl \
  php7.4-dev \
  php7.4-gd \
  php7.4-gmp \
  php-imagick \
  php7.4-intl \
  php7.4-mysql \
  php7.4-mbstring \
  php-pear \
  php7.4-xml \
  php7.4-xmlrpc \
  php7.4-zip

# Installe PhpMyAdmin
sudo apt install -y phpmyadmin
```

En cas d'erreur, copier-coller la commande suivante Pour réinitialiser PhpMyAdmin. Les données de MySQL/MariaDB sont CONSERVEES.

```bash
# Pour réinitialiser PhpMyAdmin en cas d'erreur
sudo dpkg-reconfigure -plow phpmyadmin
```

## Démarrer VSCode dans le répertoire Web

Important, cette étape permet de lier le dossier Web avec le répertoire de l'utilisateur.


```bash
# Création du lien avec le dossier Web
sudo ln -s /var/www/html ~/Sites
sudo chown -Rv $(id -u):$(id -g) Sites/

# Donne des droits complet sur le serveur Web Apache
sudo cp /etc/apache2/envvars /etc/apache2/envvars.$(date +'%Y-%m-%d')
sudo sed -i 's/www-data/'$USER'/g' /etc/apache2/envvars

# Activation de PHP xDebug
sudo pecl install xdebug

# Active le debugger de PHP
sudo tee -a /etc/php/7.4/apache2/php.ini <<EOM

[XDebug]
xdebug.mode = debug,develop
xdebug.force_display_errors = 1
xdebug.force_error_reporting = 1
xdebug.start_with_request = 1
EOM

sudo /etc/init.d/apache2 restart
```

Ensuite il est possible de démarrer VSCode ou naviguer dans le dossier Web.

```bash
# Navigation dans les fichiers, Sites/ ==> http://localhost/
cd Sites

# Création du fichier d'information de PHP disponible ici ==> http://localhost/sysinfo.php
echo '<?php phpinfo(); ?>' | tee sysinfo.php

# Création d'un dossier de projet disponible ici ==> http://localhost/site-jeanot-lapin
mkdir site-jeanot-lapin

# Ouverture de VSCode
code site-jeanot-lapin
```
