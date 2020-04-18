#!/bin/sh

if [ "$DB_TYPE" = "mariadb" ]
then
    echo "Waiting for mariadb..."

    while ! nc -z $DB_HOST $DB_PORT; do
      sleep 1
    done

    echo "MariaDB started"
fi

python manage.py collectstatic --no-input --clear

exec "$@"