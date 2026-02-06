
DC_FILE		= ./src/docker-compose.yml

all: build

data:
	@if [ ! -d "/home/ngordobi/data/mariadb" ] || [ ! -d "/home/ngordobi/data/wordpress" ]; then \
	mkdir -p /home/ngordobi/data/mariadb /home/ngordobi/data/wordpress; fi

build:	data
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
	@docker compose -f $(DC_FILE) down -v --rmi all --remove-orphans

re: stop clean all

