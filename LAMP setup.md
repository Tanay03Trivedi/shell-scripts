### Update and Upgrade System
sudo apt update && sudo apt upgrade -y

### Install Apache
sudo apt install apache2 -y
sudo systemctl stop apache2
sudo systemctl start apache2
sudo systemctl enable apache2

### Install MariaDB
sudo apt update
sudo apt install mariadb-server -y
sudo systemctl stop mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb

### Secure MariaDB Installation
sudo mysql_secure_installation

### Install PHP and Required Modules
sudo apt install php libapache2-mod-php php-intl php-mysql php-curl php-cli php-zip php-xml php-gd php-common php-mbstring php-xmlrpc php-json php-sqlite3 php-soap php-ldap php-zip -y

### Install phpMyAdmin
sudo apt install phpmyadmin -y

### Configure Apache for phpMyAdmin
sudo nano /etc/apache2/apache2.conf
### Add the following line:
Include /etc/phpmyadmin/apache.conf

### Restart Apache
sudo systemctl restart apache2

### Add PHP Repository and Install Specific PHP Version
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install php7.4 -y

### Set Default PHP Version
sudo update-alternatives --list php
sudo update-alternatives --config php

### Install Composer
sudo curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer
