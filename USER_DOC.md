
# USER DOCUMENTATION — INCEPTION

## Inception services

The Inception stack runs three services that work together to host a self-managed WordPress website:

- ***Nginx***: handles HTTPS connections on port 443 and forwards requests to WordPress and it is the only service accessible from outside.

- ***WordPress***: huns the web application (PHP-FPM) that displays the website and it is only accessible internally.

- ***MariaDB***: it's the database that stores all the website’s content and it is only accessible internally.

> All saved data (database files, uploads, themes, and plugins) is stored on the host machine in: /home/$(USER)/data/

## User guide

### Start the project

1.  Install Docker Engine, Docker Compose and Make.
2.  Build and run: `make` (in the root repository).
3.  Fill in your desired passwords.
4.  Fill in your environment variables.
5.  To check that the project started correctly: `make status`.

### Stop the project

To stop the containers: `make stop`.

To stop the containers and clean the project: `make fclean`.

### Makefile guide

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