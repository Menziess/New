
APP_NAME=new

GREEN=\033[1;32m
WHITE=\033[0m

help:
	@echo "Work in progress: ${GREEN}test${WHITE}"

init:
	pipenv install -d
	pipenv shell

test:
	pytest

build:
	pyb

build:
	pyb

dev:
	docker build --rm -f "Dockerfile" -t new:latest .
	docker run --rm -it -p 3000:3000/tcp -v $(pwd):/app new:latest

dev-stack:
	docker build --rm -f "Dockerfile" -t new:latest .
	docker stack deploy -c docker-compose.yml new-stack
