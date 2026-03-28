setup: install db-migrate

install:
	npm install

db-migrate:
	npm run migrate

build:
	npm run build

prepare-env:
	cp -n .env.example .env

start:
	NODE_ENV=production npm run start

dev:
	npx concurrently "make start-frontend" "make start-backend"

start-backend:
	npm start -- --watch --verbose-watch --ignore-watch='node_modules .git .sqlite'

start-frontend:
	npx webpack --watch --progress

lint:
	npx eslint .

lint-fix:
	npx eslint --fix .

test:
	NODE_ENV=test npm test -s

.PHONY: ci test dev up down build start

# Команда для CI (запуск тестов через Docker Compose)
ci:
	docker-compose -f docker-compose.yml up --abort-on-container-exit --exit-code-from app

# Существующие команды
test:
	npm test

dev:
	docker-compose up

up:
	docker-compose up

down:
	docker-compose down

build:
	docker-compose -f docker-compose.yml build app

start:
	make migrate && npm start

migrate:
	npx sequelize db:migrate