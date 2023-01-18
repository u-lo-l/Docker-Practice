NAME = inception
R = \033[0;31m
G = \033[0;32m
B = \033[0;34m
E = \033[0m

COMPOSE = ./srcs/docker-compose.yml
VOL_PATH = /home/dkim2/data

CURR_IMAGES = $(sudo docker images -aq)

.PHONY: up down restart clean

up :
	@ sudo mkdir -p $(VOL_PATH)/wp_vol;
	@ echo "=> $(G) $(VOL_PATH)/wp_vol created$(E)";
	@ sudo mkdir -p $(VOL_PATH)/db_vol;
	@ echo "=> $(G) $(VOL_PATH)/db_vol created$(E)"
	@ sudo docker compose -f $(COMPOSE) -p $(NAME) build 
	@ echo "=> $(G) build done $(E)";
	@ sudo docker compose -f $(COMPOSE) -p $(NAME) up -d
	@ echo "=> $(G) services ready$(E)"
down:
	@ sudo docker compose -f $(COMPOSE) -p $(NAME) down \
						--volumes \
						--remove-orphans
restart: down up

clean: down
	@ echo -n "$(R)"
	@ sudo rm -rf $(VOL_PATH)
	@ echo "  $(VOL_PATH) deleted"
	@ sudo docker system prune -af > /dev/null
	@ echo "  unsing data delete"
	@ echo "  all service contents deleted"
	@ echo -n "$(E)"

re: clean up
