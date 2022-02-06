#!/bin/bash

APACHE="sudo /etc/init.d/apache2"
MARIADB="sudo /etc/init.d/mariadb"

function start() {
  $MARIADB start
  $APACHE start
}

function stop() {
  $APACHE stop
  $MARIADB stop
}

function status() {
  $APACHE status
  $MARIADB status
}

case $1 in

  start)
    start
    ;;

  stop)
    stop
    ;;

  status)
    status
    ;;

  *)
    echo "Erreur: commande invalide: $1"; exit 255
    ;;
esac

exit 0