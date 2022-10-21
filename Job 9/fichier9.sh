#!/bin/bash

# Récupère le fichier Shell_Userlist.csv du travail de la semaine dernière.
# Et va le lire. La boucle permet de voir s'il y a des modifications.
# Et si modification, création d'un nouvel user. Il n aura pas à rentrer de Mdp.
# Et si le nouvel user a un rôle d'administrateur, alors il sera intégré au groupe sudo.
# Et tant que ce nouvel user a un Mdp, il aura l'autorisation FTP par défaut.

cat /home/sophie/Documents/Shell_Userlist.csv | while read Id Prenom Nom Mdp Role
do
sudo useradd -m $Prenom-$Nom
echo "$Prenom-$Nom:$Mdp" | sudo chpasswd
sudo usermod -u "$Id" "$Prenom-$Nom"
if [ "$Role" = "Admin" ]
then
sudo usermod -aG sudo $Prenom-$Nom
fi
done
