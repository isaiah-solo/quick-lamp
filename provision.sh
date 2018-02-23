#!/usr/bin/env bash

# Update headers
apt-get update

# Install tools
apt-get install -y curl

# Install Apache
apt-get install -y apache2

# Install PHP
apt-get install -y php5 php5-curl php5-mysql php5-ssh2 php5-gd php5-imap php5-mcrypt

# Install MySQL
echo "mysql-server mysql-server/root_password password password" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password password" | debconf-set-selections
apt-get install -y mysql-server

# Make web root a symlink to the vagrant directory
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/public /var/www/html
fi

# Reload Apache
service apache2 reload

# Set proper permissions for web root
chmod -R 755 /var/www/html/* && chown -R www-data:vagrant /var/www/html/*
