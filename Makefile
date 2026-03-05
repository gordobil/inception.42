
DC_FILE		= ./src/docker-compose.yml

all:	build

data:
		@if [ ! -d "/home/$(USER)/data" ]; then sudo mkdir -p /home/$(USER)/data; fi
		@if [ ! -d "/home/$(USER)/data/mariadb" ] || [ ! -d "/home/$(USER)/data/wordpress" ]; then \
		sudo mkdir -p /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress; fi

secrets:	
		@if [ ! -d "./secrets" ]; then \
		sudo mkdir -p ./secrets; \
		sudo touch ./secrets/db_password ./secrets/db_root_password; \
		sudo touch ./secrets/wp_admin_password ./secrets/wp_password; \
		echo "Database root password:"; \
		read DB_ROOT_PASSWORD && echo $$DB_ROOT_PASSWORD >> ./secrets/db_root_password > /dev/null; \
		echo "Database user password:"; \
		read DB_PASSWORD && echo $$DB_PASSWORD >> ./secrets/db_password > /dev/null; \
		echo "Site admin password:"; \
		read WP_ADMIN_PASSWORD && echo $$WP_ADMIN_PASSWORD >> ./secrets/wp_admin_password > /dev/null; \
		echo "Site user password:"; \
		read WP_PASSWORD && echo $$WP_PASSWORD >> ./secrets/wp_password > /dev/null; \
		fi
		@echo "\n";

env:
		@if [ ! -f "./src/.env" ]; then \
		sudo touch ./src/.env; \
		echo "Database user:"; \
		read DB_USER && echo "DB_USER=$$DB_USER" >> ./src/.env; \
		echo "DB_NAME=wordpress" >> ./src/.env; \
		echo "DB_HOST=mariadb" >> ./src/.env; \
		echo "DB_SCRIPT_SQL=/etc/mysql/init.sql\n" >> ./src/.env; \
		echo "URL (yourUsername.42.fr):"; \
		read WP_URL && echo "WP_URL=$$WP_URL" >> ./src/.env; \
		echo "WP_FULL_URL=https://$$WP_URL" >> ./src/.env; \
		echo "Site title:"; \
		read WP_TITLE && echo "WP_TITLE=$$WP_TITLE" >> ./src/.env; \
		echo "Site admin username:"; \
		read WP_ADMIN_USER && echo "WP_ADMIN_USER=$$WP_ADMIN_USER" >> ./src/.env; \
		echo "Site admin email:"; \
		read WP_ADMIN_EMAIL && echo "WP_ADMIN_EMAIL=$$WP_ADMIN_EMAIL" >> ./src/.env; \
		echo "Site user:"; \
		read WP_USER && echo "WP_USER=$$WP_USER" >> ./src/.env; \
		echo "Site user email:"; \
		read WP_EMAIL && echo "WP_EMAIL=$$WP_EMAIL\n" >> ./src/.env; \
		echo "CERT_FOLDER=/etc/nginx/certs" >> ./src/.env; \
		echo "CERTIFICATE=nginx-selfsigned.crt" >> ./src/.env; \
		echo "KEY=nginx-selfsigned.key\n" >> ./src/.env; \
		echo "Country (abbreviation in uppercase):"; \
		read COUNTRY && echo "COUNTRY=$$COUNTRY" >> ./src/.env; \
		echo "State:"; \
		read STATE && echo "STATE=$$STATE" >> ./src/.env; \
		echo "Locality:"; \
		read LOCALITY && echo "LOCALITY=$$LOCALITY" >> ./src/.env; \
		echo "ORGANIZATION=42" >> ./src/.env; \
		echo "UNIT=Cadet" >> ./src/.env; \
		echo "Common name (Site URL):"; \
		echo "COMMON_NAME=$$COMMON_NAME" >> ./src/.env > /dev/null; \
		fi


build:	data secrets env
		@docker compose -f $(DC_FILE) up --build -d

up:
		@docker compose -f $(DC_FILE) up -d

status:
		@docker compose -f $(DC_FILE) ps -a

logs:
		@docker compose -f $(DC_FILE) logs

help:
		@echo "\n MAKEFILE COMMAND GUIDE:\n"
		@echo "  ¬ make ----------------- build + up"
		@echo "  ¬ make build ----------- data + secrets + env"
		@echo "  ¬ make data ------------ Create host data directories"
		@echo "  ¬ make secrets --------- Create and fill password files"
		@echo "  ¬ make env ------------- Create and fill .env file"
		@echo "  ¬ make up -------------- Run containers"
		@echo "  ¬ make status ---------- Show running containers"
		@echo "  ¬ make logs ------------ Show container logs"
		@echo "  ¬ make help ------------ Makefile command guide"
		@echo "  ¬ make stop ------------ Stop containers"
		@echo "  ¬ make restart --------- Restart containers"
		@echo "  ¬ make fclean ---------- Stop and remove containers"
		@echo "  ¬ make re -------------- fclean + build + up\n"

restart:
		@docker compose -f $(DC_FILE) restart

stop:
		@docker compose -f $(DC_FILE) stop

down:
		@docker compose -f $(DC_FILE) down

fclean:
		@sudo rm -rf /home/$(USER)/data/mariadb && sudo rm -rf /home/$(USER)/data/wordpress
		@docker compose -f $(DC_FILE) down -v --rmi all --remove-orphans

re: 	stop fclean all

