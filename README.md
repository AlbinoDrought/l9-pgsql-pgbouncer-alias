# Reproduction

Reproduces issue described in https://github.com/laravel/framework/discussions/43536

## Steps To Reproduce

- Run Postgres
- Run pgbouncer with an aliased DB name
- Run `php artisan migrate` to create the `migrations` table because this is a fresh test DB
- Run `php artisan migrate` again to encounter the `SQLSTATE[42P07]: Duplicate table: 7 ERROR:  relation "migrations" already exists` error

See [./docker-compose.yml](./docker-compose.yml) for a ready-to-go config.
