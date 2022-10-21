#!/bin/bash

# Enlève les users créés
sudo userdel -r Merry && sudo userdel -r Pippin

# Désinstalle proftpd et sa configuration
sudo apt-get autoremove --purge proftpd

# Désinstalle openssl et sa configuration
sudo apt-get remove --purge openssl
