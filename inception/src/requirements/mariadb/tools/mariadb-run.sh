
#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password)
DB_ROOT_PASSWORD=$(cat /run/secrets/db_root_password)

export DB_PASSWORD
export DB_ROOT_PASSWORD

echo "CREATE DATABASE IF NOT EXISTS $DB_NAME;" > $DB_SCRIPT_SQL
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" >> $DB_SCRIPT_SQL
echo "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;" >> $DB_SCRIPT_SQL
echo "FLUSH PRIVILEGES;" >> $DB_SCRIPT_SQL
sleep 5

mysql_install_db
mysqld

