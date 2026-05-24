dcompose:
	sudo docker compose up

dclean:
	sudo docker rm suffixkitchen-pheonix-1
	sudo docker rmi suffixkitchen-pheonix

dash:
	sudo docker exec -it suffixkitchen-pheonix-1 ash

pcompose:
	doas podman compose up

pash:
	doas podman exec -it suffixkitchen-pheonix-1 ash

pclean:
	doas podman rm suffixkitchen-pheonix-1
	doas docker rmi suffixkitchen-pheonix
