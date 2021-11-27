# WORK IN PROGRESS - NOT READY FOR USE
# Instructions used from https://www.hostnextra.com/kb/install-snipe-it-on-ubuntu-20-04/
# Run on a fresh install of Ubuntu Server 20.04 LTS
# Update and upgrade packages
sudo apt update && sudo apt upgrade -y

# Install unzip
sudo apt-get install unzip -y

# Install Apache
sudo apt install apache2 -y

# Start and enable Apache services on startup
systemctl start apache2 && systemctl enable apache2

# Add ports through the firewall (if the firewall is enabled)
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Reload the firewall (if being used)
sudo ufw reload

echo
echo "Now would be a good time to check to see if the Apache server is running by visiting"
echo
echo "http://[SERVER IP]"
echo
echo

#Enable Apache mod_rewrire module
sudo a2enmod rewrite

#Restart Apache service again
sudo systemctl restart apache2

# Install MariaDB
sudo apt install mariadb-server mariadb-client -y

# Start and enable MariaDB on system startup
sudo systemctl start mariadb && sudo systemctl enable mariadb

# Start MySQL secure installation prompts
sudo mysql_secure_installation

# Common answers to the questions that MySQL Secure Installation script asks
# Set a root password? [Y/n]: y
# Remove anonymous users? : y
# Disallow root login remotely? : y
# Remove test database and access to it? : y
# Reload privilege tables now? : y

# Installs PHP, PHP Composer, and other required PHP packages
sudo apt install php php-bcmath php-bz2 php-intl php-gd php-mbstring php-mysql php-zip php-opcache php-pdo php-calendar php-ctype php-exif php-ffi php-fileinfo php-ftp php-iconv php-intl php-json php-mysqli php-phar php-posix php-readline php-shmop php-sockets php-sysvmsg php-sysvsem php-sysvshm php-tokenizer php-curl php-ldap -y

# Download the PHP Composer instlaler
curl -sS https://getcomposer.org/installer | php

# Move the composer.phar executable to /usr/local/bin
sudo mv composer.phar /usr/local/bin/composer

# Create the MySQL DB
sudo mysql -u root -p

CREATE DATABASE snipe_it;
CREATE USER ‘snipe_it_user’@’localhost’ IDENTIFIED BY ‘EXAMPLE_PASSWORD’;
GRANT ALL PRIVILEGES ON snipe_it.* TO ‘snipe_it_user’@’localhost’;
FLUSH PRIVILEGES;
EXIT;

# Install Snipe-IT
cd /var/www/

# Download git repo for Snipe-IT
git clone https://github.com/snipe/snipe-it snipe-it

# Go into the Snipe-IT Directory
cd /var/www/snipe-it

# Copy the Snipe-IT Sample Configuration file
sudo cp /var/www/snipe-it/.env.example /var/www/snipe-it/.env

# UPDATE THE SCRIPT TO PERFORM THE FOLLOWING HERE:
# 
# Update the APP_URL to a user-defined FQDN
# Update the APP_TIMEZONE to a user-defined Time Zone (provide the user a timezone selection)
#
# APP_URL=example.com
# APP_TIMEZONE=’America/New_York’
#
# Inject the DB settings into the .env file
#
# APP_URL=example.com
# APP_TIMEZONE=’America/New_York’

# Change permissions on the following files
# chown -R www-data:www-data /var/www/snipe-it
# chmod -R 755 /var/www/snipe-it
# chown -R www-data:www-data /var/www/snipe-it
# chmod -R 755 /var/www/snipe-it

# Generate PHP Artisan Key
sudo php artisan key:generate

# Disable the default Apache configuration file
a2dissite 000-default.conf

# Create a new Apache configuration file
nano /etc/apache2/sites-available/snipe-it.conf

# Inject the following data into the snipe-it.conf file without #'s'

# <VirtualHost *:80>
# ServerName example.com
# DocumentRoot /var/www/snipe-it/public
# <Directory /var/www/snipe-it/public>
# Options Indexes FollowSymLinks MultiViews
# AllowOverride All
# Order allow,deny
# allow from all
# </Directory>
# </VirtualHost>

# Enable the new configuration file
sudo 2ensite snipe-it.conf

# Restart Apache service
sudo systemctl restart apache2