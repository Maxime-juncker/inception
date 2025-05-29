# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mjuncker <mjuncker@student.42lyon.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/29 11:42:18 by mjuncker          #+#    #+#              #
#    Updated: 2025/05/29 11:53:59 by mjuncker         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: all
all:
	$(MAKE) build;
	$(MAKE) start;

.PHONY: build
build:
	docker compose -f ./srcs/docker-compose.yml build

.PHONY: start
start:
	docker compose -f ./srcs/docker-compose.yml up

.PHONY: clean
clean:
	docker compose -f ./srcs/docker-compose.yml down
	docker system prune -a -f

.PHONY: fclean
fclean: clean
	docker volume prune -f

.PHONY: re
re:
	$(MAKE) fclean;
	$(MAKE) all;

