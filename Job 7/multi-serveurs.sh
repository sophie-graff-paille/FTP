#!/bin/bash

# J'ai compris dans le fond les manipulations à exécuter.
# J'ai cherché, écouté et lu nombre d articles
# mais je n ai pas encore la facilité d'adapter ma compréhension à l exécution.

# Toujours faire une mise à jour et mise à niveau avant toute action
sudo apt-get update && sudo apt-get upgrade

# Installation de Proftpd
sudo apt-get install proftpd

# Création d'un user avec un home
sudo useradd -m users

# Définit les noms et Mdp en clair et les chiffre pour ne plus les redemander
echo "username:mdp" | sudo chpasswd

# Installation de git pour récupérer mes fichiers conf modifiés
sudo apt-get install git

# Cherche mes fichiers conf modifiés envoyés sur github au préalable. Car la VM est sensée être vierge.
sudo git clone https://github.com/sophie-graff-paille/FTP.git

# Ecrase les fichiers conf originaux par mes fichiers conf modifiés à l'ouverture de la nouvelle vm
echo mv /home/proftpd.conf /etc/proftpd/proftpd.conf
echo mv /home/modules.conf /etc/proftpd/modules.conf
echo mv /home/tls.conf /etc/proftpd/tls.conf

# Installation des paquets openssl 
sudo apt-get install openssl

# Création d'un dossier ssl pour y mettre les clés
sudo mkdir /etc/proftpd/ssl

# Génère les clés
sudo echo  -en "/n/n/n/n/n/n/n" | openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem

# Donne les droits à la clé
sudo chmod 600 /etc/proftpd/ssl/proftpd_key.pem

# Réinitialisation de proftpd
sudo /etc/init.d/proftpd restart

# Vérification des status de proftpd
sudo service proftpd status


