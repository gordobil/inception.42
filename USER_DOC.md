
# USER DOCUMENTATION — INCEPTION

## Inception services

The Inception stack runs three services that work together to host a self-managed WordPress website:

- ***Nginx***: handles HTTPS connections on port 443 and forwards requests to WordPress and it is the only service accessible from outside.

- ***WordPress***: huns the web application (PHP-FPM) that displays the website and it is only accessible internally.

- ***MariaDB***: it's the database that stores all the website’s content and it is only accessible internally.

> All saved data (database files, uploads, themes, and plugins) is stored on the host machine in: /home/$(USER)/data/
