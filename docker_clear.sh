sudo docker volume rm db_vol;
sudo docker volume rm wp_vol;
sudo docker volume create db_vol;
sudo docker volume create wp_vol;
sudo docker image prune -f;
