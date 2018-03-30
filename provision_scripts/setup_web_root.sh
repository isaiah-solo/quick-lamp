# Make web root a symlink to the vagrant directory
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant/public /var/www/html
fi

# Reload services
service apache2 reload
service php5-fpm reload

# Set proper permissions for web root
chmod -R 755 /var/www/html/* && chown -R www-data:vagrant /var/www/html/*
