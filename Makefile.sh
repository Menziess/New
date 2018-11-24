
help:
	@echo "Tasks in \033[1;32m${APP_NAME}\033[0m:"
	@echo "    init"
	@echo "        Install and activate project environment."
	@echo "    clean"
	@echo "        Remove build artifacts."
	@echo "    lint"
	@echo "        Check style with mypy."
	@echo "    test"
	@echo "        Run pytest."
	@echo "    build"
	@echo "        Run pybuilder build command."
	@echo "    docker-dev"
	@echo "        Build ${APP_NAME} and run development docker container."
	@echo "    docker-dev-stack"
	@echo "        Build ${APP_NAME} and run development docker stack."
	@echo ""
	@echo "By github/menziess"

init:
	pipenv install -d
	pipenv shell

clean:
	pyb clean -c

lint:
	mypy . --ignore-missing-imports

test:
	pytest

build:
	pyb -c

docker-dev:
	docker build --rm -f "Dockerfile" -t new:latest .
	docker run --rm -it -p 3000:3000/tcp -v $(pwd):/app new:latest

docker-dev-stack:
	docker build --rm -f "Dockerfile" -t new:latest .
	docker stack deploy -c docker-compose.yml new-stack
