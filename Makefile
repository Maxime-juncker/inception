all:
	$(MAKE) build;
	$(MAKE) start;

build:
	docker compose -f ./srcs/docker-compose.yml build

start:
	docker compose -f ./srcs/docker-compose.yml up


#clean: TODO


#fclean: TODOdocker-compose build -f ./requirements/docker-compose.yml