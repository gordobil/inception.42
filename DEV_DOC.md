
# DEVELOPER DOCUMENTATION — INCEPTION

## Environment variables and secrets

Both environment variables and secrets or passwords are submited by the user just as they compile the project, and they are stored in `srcs/.env` and `secrets/` respectively.


### `.env` guide

> The ***marked*** variables are submited by the user when they compile the project.

| Variable                | Description                           |
| ----------------------- | ------------------------------------- |
| `BD_NAME`               | WordPress database name               |
| ***`DB_USER`***         | MariaDB application user              |
| `DB_HOST`               | Database host                         |
| `DB_SCRIPT_SQL`         | SQL init file                         |
| ***`WP_URL`***          | Site's custom URL                     |
| `WP_FULL_URL`           | Site's custom URL with https protocol |
| ***`WP_TITLE`***        | WordPress site title                  |
| ***`WP_ADMIN_USER`***   | WordPress admin login                 |
| ***`WP_ADMIN_EMAIL`***  | WordPress admin email                 |
| ***`WP_USER`***         | WordPress user login                  |
| ***`WP_EMAIL`***        | WordPress user email                  |
| `CERT_FOLDER`           | SSL certificate director              |
| `CERTIFICATE`           | SSL certificate                       |
| `KEY`                   | SSL key                               |
| ***`COUNTRY`***         | WordPress site country                |
| ***`LOCALITY`***        | WordPress site locality               |
| `ORGANIZATION`          | WordPress site organization           |
| `UNIT`                  | WordPress site unit                   |
| ***`COMMON_NAME`***     | WordPress site URL                    |


### Makefile guide

| Makefile command | Called command                                       | Description                        |
| ---------------- | ---------------------------------------------------- | ---------------------------------- |
| `make`           | `make all` / `make build`                            | Build and start Docker containers. |
| `make build`     | `data` + `secrets` + `env` + `docker compose up ...` | Create all the required files.     |
| `make data`      | `mkdir -p /home/$(USER)/data/mariadb && ...`         | Create host data directories.      |
| `make secrets`   | `mkdir -p ./secrets && touch ./secrets/ ...`         | Create and fill password files.    |
| `make env`       | `touch ./src/.env && echo "WP_URL= ...`              | Create and fill .env file.         |
| `make up`        | `docker compose -f $(DC_FILE) up -d`                 | Run containers.                    |
| `make status`    | `docker compose -f $(DC_FILE) ps -a`                 | Show running containers.           |
| `make logs`      | `docker compose -f $(DC_FILE) logs`                  | Show container logs.               |
| `make help`      | `echo "MAKEFILE COMMA ...`                           | Makefile command guide.            |
| `make stop`      | `docker compose -f $(DC_FILE) stop`                  | Stop containers.                   |
| `make restart`   | `docker compose -f $(DC_FILE) restart`               | Restart containers.                |
| `make fclean`    | `docker compose -f $(DC_FILE) down && rm /home/ ...` | Remove containers and volume data. |
| `make re`        | `stop` + `fclean` + `all`                            | Stop, clean and rebuild project.   |

> The project's data is stored in `/home/data/wordpress/` and `/home/data/mariadb/`. The data remains in the directories and in the containers even if you restart them. It is only removed when you clean the project: `make fclean`.


### Repository structure

```
.
├── DEV_DOC_.md
├── .gitignore
├── Makefile
├── README.md
├── *secrets*
│   ├── db_password
│   ├── db_root_password
│   ├── wp_admin_password
│   └── wp_password
├── src
│   ├── docker-compose.yml
│   ├── *.env*
│   └── requirements
│       ├── mariadb
│       │   ├── conf
│       │   │   └── 50-server.cnf
│       │   ├── Dockerfile
│       │   └── tools
│       │       └── mariadb-run.sh
│       ├── nginx
│       │   ├── conf
│       │   │   └── nginx.conf
│       │   └── Dockerfile
│       └── wordpress
│           ├── conf
│           │   └── www.conf
│           ├── Dockerfile
│           └── tools
│               └── wp-install.sh
└── USER_DOC.md
```

> The *marked* directories and files are created when the project is cmpiled.
