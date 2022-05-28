docker-tm-up:
	docker compose -p trucking -f src/main/resources/db/container/database/docker-compose.yaml up -d

docker-tm-down:
	docker compose -p trucking -f src/main/resources/db/container/database/docker-compose.yaml down --remove-orphans

docker-tm-logs:
	docker compose -p trucking -f src/main/resources/db/container/ddatabase/ocker-compose.yaml logs -f