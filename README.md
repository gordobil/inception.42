_This project has been created as part of the 42 curriculum by ngordobi._

# INCEPTION

## Description

Inception is a **system administration project** focused on **containerized infrastructure using Docker**. The goal is to build a secure, multi service architecture, composed of a server (NGINX), a database (MariaDB) and a website (Wordpress); each one running in its own dedicated Docker container and built from custom Docker images.

The project uses ***Docker containers instead of virtual machines***, because virtual machines run a full operating system, which makes them heavier and slower; and Docker containers share the host system’s kernel, making them lighter, faster to start, and more resource-efficient.

***Secrets and environment variables*** are both used to pass configuration data to containers, but secrets are designed for sensitive information like passwords, and are stored more securely; environment variables are easier to use but can be exposed in container metadata, making them less secure for confidential data.

***Docker networks*** isolate containers and allow them to communicate securely using internal DNS, while using the ***host network*** makes containers share the host’s network stack, reducing isolation and increasing exposure. Using a custom Docker network improves security and service separation.

***Docker volumes*** are managed by Docker and are portable and independent from the host filesystem. ***Bind mounts*** map a specific host directory into a container, which makes them more flexible for development but dependent on the host structure.


## Instructions

> For a complete step-by-step setup guide, see [USER_DOC.md](USER_DOC.md); and for more information on the environment variables and the Makefile commands, see [DEV_DOC.md](DEV_DOC.md).

1.  Clone the repository: `git clone <repo_url> Inception`.
2.  Install Docker Engine, Docker Compose and Make.
3.  Build and run: `make` (in the root repository).
4.  Fill in your desired passwords.
5.  Fill in your environment variables.
6.  Open a browser and go to: `https://$(your_site's_url)`.

> Add `127.0.0.1 $(your_site's_url)` to `/etc/hosts` if needed.


## Resources

### Documentation

- Docker Engine: https://docs.docker.com/engine/
- Docker Compose: https://docs.docker.com/compose/
- Mariadb: https://mariadb.org/documentation/
- Nginx: https://nginx.org/en/docs/
- Wordpress: https://wordpress.org/documentation/

### Inception resources

- Inception Virtual Machine building guide: https://github.com/Bakr-1/inceptionVm-guide
- Inception guide: https://github.com/waltergcc/42-inception/tree/main

### More information on...

[USER_DOC.md](USER_DOC.md) and [DEV_DOC.md](DEV_DOC.md).



> In this project, AI assistance has only been used to fix very specific issues that could not be fixed in any other way.