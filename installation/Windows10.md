# Installation de Linux Apache MySQL PHP sur Windows 10

## Activer les extensions de virtualisation dans Windows 10

```
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

> Important: Redémarer Windows

## Installation de Chocolately, le gestionnaire de paquet Windows

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

## Installation des outils de développement pour Windows 10

Ouvrir Powershell en tant qu'administrateur :

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

## Installation de Debian Linux pour Windows Subsystem for Linux

Debian Linux est disponible directement depuis [Microsoft Store à partir de ce lien.](https://www.microsoft.com/fr-fr/p/debian/9msvkqc78pk6?rtc=1&activetab=pivot:overviewtab)