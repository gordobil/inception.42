
# DEVELOPER DOCUMENTATION — INCEPTION

## Environment variables and secrets

Both environment variables and secrets or passwords are submited by the user just as they compile the project, and they are stored in `srcs/.env` and `secrets/` respectively.

### `.env` guide

> The ***marked*** variables are submited by the user just when they compile the project.

| Variable                | Description                                   |
| ----------------------- | --------------------------------------------- |
| `BD_NAME`               | WordPress database name                       |
| ***`DB_USER`***         | MariaDB application user                      |
| `DB_HOST`               | Password for the application user             |
| `DB_SCRIPT_SQL`         | MariaDB root password                         |
| `WP_URL`                | Must match `MYSQL_DATABASE`                   |
| `WP_FULL_URL`           | Must match `MYSQL_USER`                       |
| `WP_ADMIN_USER`         | Must match `MYSQL_PASSWORD`                   |
| `WP_ADMIN_EMAIL`        | Set to `mariadb` (Docker DNS name)            |
| `WP_USER`               | WordPress site title                          |
| `WP_EMAIL`              | WordPress admin login                         |
| `CERT_FOLDER`           | WordPress admin password                      |
| `CERTIFICATE`           | WordPress admin email                         |
| `KEY`                   | Secondary WordPress user (editor)             |
| `COUNTRY`               | Secondary user password                       |
| `LOCALITY`              | Secondary user email                          |
| `ORGANIZATION`          | Full public URL, e.g. `https://edobele.42.fr` |
| `UNIT`                  | Nginx `server_name`, e.g. `edobele.42.fr`     |
| `COMMON_NAME`           | Nginx `server_name`, e.g. `edobele.42.fr`     |

## Makefile guide

```bash
make            # build + up
make build      # data + secrets + env
make data       # Create host data directories
make secrets    # Create and fill password files
make env        # Create and fill .env file
make up         # Run containers
make status     # Show running containers
make logs       # Show container logs
make help       # Makefile command guide
make stop       # Stop containers
make restart    # Restart containers
make fclean     # Stop and remove containers
make re         # fclean + build + up
```