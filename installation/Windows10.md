# Installation de Linux Apache MySQL PHP

## Etapes d'installation

1. [Activer les extensions de virtualisation](#activer-les-extensions-de-virtualisation)
2. [Installer le gestionnaire de logiciels Chocolately](#installer-le-gestionnaire-de-logiciels-chocolately)
3. [Installer des outils de développement](#installer-des-outils-de-développement)
4. [Installer Debian Linux pour Windows Subsystem for Linux](#installer-debian-linux-pour-windows-subsystem-for-linux)
5. [Utiliser Windows Terminal pour toutes vos actions](#utilier-windows-terminal-pour-toutes-vos-actions)
6. [Mettre à jour Debian Linux](#mettre-à-jour-debian-linux)

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

Windows Terminal est un point d'accès unique et ergonomique pour gérer le développement en ligne de commande. dispose d'un menu accessible de puis la barre de titre de sa fenêtre pour ouvrir rapidement la console Windows, Powershell et Debian Linux.

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

# Installe d'outils complémentaires (sauvent la vie)
sudo apt install -y \
  apache2-utils \
  curl \
  dnsutils \
  ftp \
  iproute2 \
  lsof \
  python3-pip \
  net-tools \
  netcat \
  rsync \
  tree \
  unzip \
  wget \
  whois \
  zip
```
