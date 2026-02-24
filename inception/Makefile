
DC_FILE		= ./src/docker-compose.yml

all: 		build

data:
		@if [ ! -d "/home/$(USER)/data" ]; then sudo mkdir -p /home/$(USER)/data; fi
		@if [ ! -d "/home/$(USER)/data/mariadb" ] || [ ! -d "/home/$(USER)/data/wordpress" ]; then \
		sudo mkdir -p /home/$(USER)/data/mariadb /home/$(USER)/data/wordpress; fi

secrets:	
		@if [ ! -d "./secrets" ]; then \
		sudo mkdir -p ./secrets; \
		sudo touch ./secrets/db_password ./secrets/db_root_password;	\
		sudo touch ./secrets/wp_admin_password ./secrets/wp_password; \
		echo "Choose a password for 'db_password':"; \
		read DB_PASSWORD && echo $$DB_PASSWORD | sudo tee ./secrets/db_password > /dev/null; \
		echo "Choose a password for 'db_root_password':"; \
		read DB_ROOT_PASSWORD && echo $$DB_ROOT_PASSWORD | sudo tee ./secrets/db_root_password > /dev/null; \
		echo "Choose a password for 'wp_admin_password':"; \
		read WP_ADMIN_PASSWORD && echo $$WP_ADMIN_PASSWORD | sudo tee ./secrets/wp_admin_password > /dev/null; \
		echo "Choose a password for 'wp_password':"; \
		read WP_PASSWORD && echo $$WP_PASSWORD | sudo tee ./secrets/wp_password > /dev/null; \
		fi


build:		data secrets
		@docker compose -f $(DC_FILE) up --build -d

up:
		@docker compose -f $(DC_FILE) up -d

restart:
		@docker compose -f $(DC_FILE) restart

stop:
		@docker compose -f $(DC_FILE) stop

down:
		@docker compose -f $(DC_FILE) down

clean:
		@sudo rm -rf /home/$(USER)/data/mariadb && sudo rm -rf /home/$(USER)/data/wordpress
		@docker compose -f $(DC_FILE) down -v --rmi all --remove-orphans

re: 		stop clean all

