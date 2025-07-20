DOCKER_COMPOSE_FILE = ./srcs/docker-compose.yml

build:
	mkdir -p /home/eebert/data/wordpress
	mkdir -p /home/eebert/data/mariadb
	docker compose -f $(DOCKER_COMPOSE_FILE) up --build -d

kill:
	docker compose -f $(DOCKER_COMPOSE_FILE) kill

stop:
	docker compose -f $(DOCKER_COMPOSE_FILE) down


clean:
	docker compose -f $(DOCKER_COMPOSE_FILE) down --volumes --remove-orphans
	rm -rf /home/eebert/data/wordpress
	rm -rf /home/eebert/data/mariadb


rebuild: clean build

.PHONY: build stop clean rebuild
