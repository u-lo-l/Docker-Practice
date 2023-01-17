NAME = inception
R = \033[0;31m
G = \033[0;32m
B = \033[0;34m
E = \033[0m

COMPOSE = ./srcs/docker-compose.yml
VOL_PATH = /home/dkim2/data

CURR_IMAGES = $(sudo docker images -aq)

.PHONY: up down clean re

up : $(NAME)

$(NAME):
	@ sudo mkdir -p $(VOL_PATH)/wp_vol;
	@ echo "=> $(G) $(VOL_PATH)/wp_vol created$(E)";
	@ sudo mkdir -p $(VOL_PATH)/db_vol;
	@ echo "=> $(G) $(VOL_PATH)/db_vol created$(E)"
#	@ sudo docker compose -f $(COMPOSE) -p $(NAME) build -q
	@ echo "=> $(G) build done $(E)";
	@ sudo docker compose -f $(COMPOSE) -p $(NAME) up -d
	@ echo "=> $(G) services ready$(E)"
down:
	@ sudo docker compose -f $(COMPOSE) -p $(NAME) down \
						--volumes \
						--remove-orphans

clean:
	@ echo -n "$(R)"
	@ echo "  deleting $(VOL_PATH) $(E)"
	@ sudo rm -rf $(VOL_PATH)
	echo $(CURR_IMAGES)
	@ echo "  deleting $(sudo docker images -aq)"
	@ sudo docker rmi $(sudo docker images -qa) -f
	@ echo "  deleting unsing data"
	@ sudo docker system prune -af
	@ echo -n "$(E)"
re: clean up
