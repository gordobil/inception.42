
# DEVELOPER DOCUMENTATION — INCEPTION

## Environment variables and secrets

Both environment variables and secrets or passwords are submited by the user just as they compile the project, and they are stored in `srcs/.env` and `secrets/` respectively.

### `.env` guide

> The ***marked*** variables are submited by the user just when they compile the project.

| Variable                | Description                                   |
| ----------------------- | --------------------------------------------- |
| `BD_NAME`               | WordPress database name                       |
| ***`DB_USER`***         | MariaDB application user                      |
| `DB_HOST`               | Database host                                 |
| `DB_SCRIPT_SQL`         | SQL init file                                 |
| ***`WP_URL`***          | Site's custom URL                             |
| `WP_FULL_URL`           | Site's custom URL with https protocol         |
| ***`WP_TITLE`***        | WordPress site title                          |
| ***`WP_ADMIN_USER`***   | WordPress admin login                         |
| ***`WP_ADMIN_EMAIL`***  | WordPress admin email                         |
| ***`WP_USER`***         | WordPress user login                          |
| ***`WP_EMAIL`***        | WordPress user email                          |
| `CERT_FOLDER`           | SSL certificate director                      |
| `CERTIFICATE`           | SSL certificate                               |
| `KEY`                   | SSL key                                       |
| ***`COUNTRY`***         | WordPress site country                        |
| ***`LOCALITY`***        | WordPress site locality                       |
| `ORGANIZATION`          | WordPress site organization                   |
| `UNIT`                  | WordPress site unit                           |
| ***`COMMON_NAME`***     | WordPress site URL                            |

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