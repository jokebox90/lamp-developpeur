# Windows Apache MySQL PHP

## Préconfigurer de Windows
### Activer les extensions de virtualisation

Ouvrir Powershell en tant qu'administrateur :

1. Menu "Démarrer"
2. Rechercher "powershell"
3. Faire un Clic-droit sur Powershell
4. Cliquer sur "Exécuter en tant qu'administrateur"

```powershell
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

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

## Installer des outils de développement

> Ouvrir Powershell en tant qu'administrateur

Copier-coller les commandes suivantes :

```powershell
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

> Note: Garder la fenêtre Windows Terminal sur Debian Linux ouverte pour la suite.

## Démarrer avec Debian Linux

Démarrer Debian Linux à partir du menu de Windows Terminal.
### Mettre à jour Debian Linux

Copier-coller les commandes suivantes pour démarrer avec la dernière version stable des logiciels et du système Debian.

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Met à jour le système avec la dernière version des logiciels
sudo apt upgrade -y
```

### Installer Git et un éditeur de texte

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Installe git et vim
sudo apt install -y \
  git \
  vim
```

### Installer des outils Linux de base

```bash
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

### Installer le serveur Web Apache

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Installe la partie serveur Web et serveur SQL
sudo apt install -y \
  apache2

# Démarre le serveur Web
sudo /etc/init.d/apache2 start
```

## Installer le serveur SQL MariaDB

```bash
# Met à jour les informations sur les logiciels
sudo apt update

# Installe la partie serveur SQL
sudo apt install -y \
  mariadb-server \
  mariadb-client

# Démarre le serveur Web
sudo /etc/init.d/mariadb start
```

## Installer PHP et ses extensions courantes

### Configurer des sources de paquet Debian supplémentaires pour PHP 8.1

```bash
curl -sL https://packages.sury.org/php/README.txt | sudo bash -
```

### Installer PHP 7.4 pour conserver la compatibilité


```bash
sudo apt install -y \
  imagemagick \
  libapache2-mod-php7.4 \
  php-imagick \
  php-pear \
  php7.4-apcu \
  php7.4-bcmath \
  php7.4-cli \
  php7.4-curl \
  php7.4-dev \
  php7.4-fpm \
  php7.4-gd \
  php7.4-gmp \
  php7.4-intl \
  php7.4-mbstring \
  php7.4-mysql \
  php7.4-xdebug \
  php7.4-xml \
  php7.4-xmlrpc \
  php7.4-zip \
```

### Installer PHP 8.1

```bash
sudo apt install -y \
  libapache2-mod-php8.1 \
  php8.1-apcu \
  php8.1-bcmath \
  php8.1-cli \
  php8.1-curl \
  php8.1-dev \
  php8.1-fpm \
  php8.1-gd \
  php8.1-gmp \
  php8.1-intl \
  php8.1-mbstring \
  php8.1-mysql \
  php8.1-xdebug \
  php8.1-xml \
  php8.1-xmlrpc \
  php8.1-zip

# Utilise uniquement PHP 8.1 sur Apache
sudo a2dismod php7.4 && sudo a2enmod php8.1

# Utilise uniquement PHP 8.1 sur Debian
sudo ln -sf /usr/bin/php8.1 /usr/bin/php.default
sudo update-alternatives --set php /usr/bin/php8.1
sudo update-alternatives --set phar /usr/bin/phar8.1
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.1

echo '<?php phpinfo(); ?>' | tee ~/Sites/sysinfo.php
```
### Installation de Composer

Installation du gestionnaire de paquet PHP.

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer
```

## Installation de PhpMyAdmin

Installation de l'outil de gestion de base de données.

```bash
composer create-project phpmyadmin/phpmyadmin --no-cache --no-dev ~/Sites/phpmyadmin
```

## Préparation de l'environnement Debian Fullstack

```bash
# Donne des droits complet sur le serveur Web Apache
sudo chown -R $(id -u):$(id -g) /var/www/html
sudo cp /etc/apache2/envvars /etc/apache2/envvars.$(date +'%Y-%m-%d')
sudo sed -i 's/www-data/'$USER'/g' /etc/apache2/envvars
sudo /etc/init.d/apache2 restart

# Création du lien avec le dossier Web
ln -s /var/www/html ~/Sites
tee ~/Sites/index.html <<EOM
<html>
<head>
  <title>Bienvenue sur Apache Web Server!</title>
</head>
<body>
  <h1>Bonjour, $USER</h1>
</body>
</html>
EOM

mkdir -p $HOME/WebConfig
ln -sf /etc/mysql $HOME/WebConfig/mysql
ln -sf /etc/php $HOME/WebConfig/php
ln -sf /etc/apache2 $HOME/WebConfig/apache2

sudo chown -R $(id -u):$(id -g) /etc/mysql/.
sudo chown -R $(id -u):$(id -g) /etc/php/.
sudo chown -R $(id -u):$(id -g) /etc/apache2/.
```
