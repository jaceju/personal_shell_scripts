brew install automake autoconf curl pcre re2c mhash libtool icu4c gettext jpeg libxml2 mcrypt gmp libevent
curl -O https://raw.github.com/c9s/phpbrew/master/phpbrew
chmod +x phpbrew
sudo cp phpbrew /usr/local/bin/phpbrew

phpbrew init

sudo phpbrew install php-5.3.27 +default +mysql +apxs2 +openssl
sudo phpbrew install php-5.4.17 +default +mysql +apxs2 +openssl 
sudo phpbrew install php-5.5.1 +default +mysql +apxs2 +openssl
sudo chown -R jaceju ~/.phpbrew /private/tmp/pear


phpbrew switch php-5.3.27
phpbrew ext install xdebug
phpbrew ext install pdo_sqlite
pear install pear.phpqatools.org/phpqatools

phpbrew switch php-5.4.17
phpbrew ext install xdebug
phpbrew ext install pdo_sqlite
pear install pear.phpqatools.org/phpqatools

phpbrew switch php-5.5.1
phpbrew ext install xdebug
phpbrew ext install pdo_sqlite
pear install pear.phpqatools.org/phpqatools
