git clone https://github.com/magento/magento2.git . &&
sudo apt install composer -Y &&

sudo usermod -a -G www-data  roman &&
sudo usermod -a -G roman www-data &&

cd ~/work/magento2 &&
composer install &&
sudo find . -type f -exec chmod 644 {} + &&
sudo find . -type d -exec chmod 775 {} + &&

sudo chmod -R 777 app/etc &&
sudo chmod -R 777 generated &&
sudo chmod -R 777 pub &&
sudo chmod -R 777 var &&

sudo update-alternatives --set php /usr/bin/php7.2 &&
sudo update-alternatives --set php-config /usr/bin/php-config7.2 &&
sudo update-alternatives --set phpize /usr/bin/phpize7.2 &&

sudo sed -i "s/error_reporting = .*/error_reporting = E_ALL/" /etc/php/7.2/cli/php.ini &&
sudo sed -i "s/display_errors = .*/display_errors = On/" /etc/php/7.2/cli/php.ini &&
sudo sed -i "s/memory_limit = .*/memory_limit = 1G/" /etc/php/7.2/cli/php.ini &&
sudo sed -i "s/;date.timezone.*/date.timezone = Europe\/Kiev/" /etc/php/7.2/cli/php.ini &&

sudo apt install -y php-xdebug php-pear &&
sudo apt install -y sqlite3 libsqlite3-dev &&
sudo su &&
echo "xdebug.remote_enable = 1" >> /etc/php/7.2/mods-available/xdebug.ini &&
echo "xdebug.remote_connect_back = 1" >> /etc/php/7.2/mods-available/xdebug.ini &&
echo "xdebug.remote_port = 9000" >> /etc/php/7.2/mods-available/xdebug.ini &&
echo "xdebug.max_nesting_level = 512" >> /etc/php/7.2/mods-available/xdebug.ini &&
echo "xdebug.idekey = PHPSTORM" >> /etc/php/7.2/mods-available/xdebug.ini &&
echo "opcache.revalidate_freq = 0" >> /etc/php/7.2/mods-available/opcache.ini &&
echo "opcache.save_comments = 1" >> /etc/php/7.2/mods-available/opcache.ini
