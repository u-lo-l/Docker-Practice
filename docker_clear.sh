sudo docker volume rm -f db_vol;
sudo docker volume rm -f wp_vol;
sudo docker volume create db_vol;
sudo docker volume create wp_vol;
sudo docker image prune -f;
sudo docker image rm -f inception:mariadb;
sudo docker image rm -f inception:wordpress;
sudo docker image rm -f inception:nginx;
