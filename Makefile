dcompose:
	sudo docker compose up

dclean:
	sudo docker rm suffixkitchen-pheonix-1
	sudo docker rmi suffixkitchen-pheonix

dash:
	sudo docker exec -it suffixkitchen-pheonix-1 ash

pash:
	doas podman exec -it suffixkitchen-pheonix-1 ash
