#!/bin/sh
set -x

stat vendor || composer install

# this is not production code, just a hack to wait for db to boot:
php -r "while (!is_resource(fsockopen('${DB_HOST}:${DB_PORT}'))) { echo 'Waiting for ${DB_HOST}:${DB_PORT}'; sleep(1); }"
echo "Found ${DB_HOST}:${DB_PORT}"

php artisan migrate
php artisan migrate
