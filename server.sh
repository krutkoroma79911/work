sudo apt-get update &&
sudo apt-get upgrade &&

sudo apt-get install apache2 -y &&

sudo apt-get install mysql-server -y &&
sudo mysql_secure_installation &&
sudo apt-get install php libapache2-mod-php -y &&

sudo apt install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
php7.2 php7.2-common php7.2-cli php7.2-dev \
libapache2-mod-php7.2 \
php7.2-sqlite3 php7.2-mysql php7.2-pgsql \
php7.2-curl php7.2-gd \
php7.2-imap php7.2-mbstring \
php7.2-xml php7.2-xsl php7.2-zip php7.2-bcmath php7.2-soap \
php7.2-intl php7.2-readline php7.2-ldap &&
sudo service apache2 restart