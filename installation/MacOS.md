# MacOS / Apache2 / MariaDB / PHP

**Installation et démarrage de MariaDB (serveur MySQL)**

Dans le terminal.

```bash
# Installation de MariaDB
brew install mariadb

# Démarrage du serveur MySQL
mysql.server start

# Active le démarrage automatique
brew services start mariadb
```

Dans le terminal, utilisation de la console MySQL :

```bash
sudo mysql
```

Dans la console MySQL, changement du mot passe administrateur :

```sql
# Changement du mot passe
ALTER USER 'root'@'localhost' IDENTIFIED BY 'ici_mon_mot_de_passe';

# Sauvegarde des changements
FLUSH PRIVILEGES;

# Quitter la console
exit;
```

**Installation et démarrage d'Apache2/PHP (serveur Web)**

```bash
# Démarrage d'Apache2
sudo apachectl start

# Sauvegarde de la configuration
sudo cp /etc/apache2/httpd.conf /etc/apache2/httpd.conf.bak

# Activation de PHP
sudo sed -i 's/^#\(LoadModule php7.*\)$/\1/g' /etc/apache2/httpd.conf

# Création d'un fichier de test PHP
echo '<?php phpinfo(); ?>' | sudo tee /Library/WebServer/Documents/sysinfo.php

# Application des changements
sudo apachectl restart
```

> Se rendre sur : http://localhost/sysinfo.php

**Installation de phpMyAdmin: outil de gestion de bases de données**

```bash
# Utilitaire de téléchargement Wget
brew install wget

# Téléchargement de l'archive phpMyAdmin
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.tar.gz

# Décompression de l'archive phpMyAdmin
tar -xzvf phpMyAdmin-5.1.1-all-languages.tar.gz

# Installation de phpMyAdmin dans le dossier qui va bien
sudo mv phpMyAdmin-5.1.1-all-languages /Library/WebServer/Documents/phpmyadmin

# Ajoute une configuration qui va bien pour MacOS
sudo sed "s/localhost/127.0.0.1/g" \
    /Library/WebServer/Documents/phpmyadmin/config.sample.inc.php \
        | sudo tee /Library/WebServer/Documents/phpmyadmin/config.inc.php
```

> Se rendre sur : http://localhost/phpmyadmin
