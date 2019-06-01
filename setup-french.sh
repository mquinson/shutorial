#! /bin/sh
clear
echo "Configuration du système..."
apt-get install -y locales-all manpages-fr manpages-fr-dev manpages-fr-extra > /dev/null || true
export LANG=fr_FR.UTF-8
export LANGUAGE="fr_FR:fr:en"
(sleep 1; echo "Ceci est votre terminal...")

clear
