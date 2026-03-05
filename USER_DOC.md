
# USER DOCUMENTATION — INCEPTION

## Inception services

The Inception stack runs three services that work together to host a self-managed WordPress website:

- ***Nginx***: handles HTTPS connections on port 443 and forwards requests to WordPress and it is the only service accessible from outside.

- ***WordPress***: huns the web application (PHP-FPM) that displays the website and it is only accessible internally.

- ***MariaDB***: it's the database that stores all the website’s content and it is only accessible internally.

> All saved data (database files, uploads, themes, and plugins) is stored on the host machine in: /home/$(USER)/data/

## User guide

### Start the project

1.  Clone the repository: `git clone <repo_url> Inception`.
2.  Install Docker Engine, Docker Compose and Make.
3.  Build and run: `make` (in the root repository).
4.  Fill in your desired passwords.
5.  Fill in your environment variables.
6.  To check that the project started correctly and all the services are running: `make status`.
7.  Open a browser and go to: `https://$(your_site's_url)`.
    The certificate is self-signed and your browser will show a security warning. Click **Advanced → Accept the risk and continue**.
8.  Go to `https://$(your_site's_url)/wp-admin`to access the administration panel.
9.  Log in with the WordPress administrator credentials.

> Add `127.0.0.1 $(your_site's_url)` to `/etc/hosts` if needed.

> All the credentials and variables previously filled are stored in `srcs/.env`. For more information, see [DEV_DOC.md](DEV_DOC.md).


### Stop the project

- To stop the containers: `make stop`.
- To stop the containers and clean the project: `make fclean`.

## More information on...

[USER_DOC.md](README.md) and [DEV_DOC.md](DEV_DOC.md).