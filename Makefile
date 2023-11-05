DB_URL=postgres://postgres:mhbbnsbtcm@localhost:5432/chat_be?sslmode=disable

network:
	docker network create chat-be

postgres:
	docker run --name postgres --network chat-be -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=mhbbnsbtcm -d postgres:14-alpine

dropdb:
	docker exec -it postgres dropdb --username=postgres chat_be

createdb:
	docker exec -it postgres createdb --username=postgres chat_be

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

.PHONY: network postgres dropdb createdb migrateup migratedown
