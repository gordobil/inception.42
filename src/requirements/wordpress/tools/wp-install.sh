
#!/bin/bash

cd /var/www/html
curl -f -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar

until mysqladmin ping -h mariadb --silent; do
	sleep 1
done

if [ ! -f wp-config.php ]; then
	./wp-cli.phar core download --allow-root
	./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
	./wp-cli.phar core install --url=localhost --title=inception --admin_user=ngordobi --admin_password=gordobil --admin_email=ngordobi@inception.com --allow-root
	./wp-cli.phar user create guest guest@inception.com --role=subscriber --user_pass=12345 --allow-root
fi

php-fpm8.2 -F

