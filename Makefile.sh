
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
	@echo "    dev"
	@echo "        Build ${APP_NAME} and run development docker container."
	@echo "    dev-stack"
	@echo "        Build ${APP_NAME} and run development docker stack."
	@echo ""
	@echo "By github/menziess"

init:
	pipenv shell

lint:
	mypy . --ignore-missing-imports

test:
	pytest

clean:
	pyb clean -c
	find . \( -name __pycache__ -o -name "*.pyc" -o -name __init__.py \) -delete
	rm -rf .pytest_cache/ .mypy_cache/

build:
	pyb -c
	docker build --rm -f "Dockerfile" -t new:latest .

clean-build:
	make clean
	make build

dev:
	docker run --rm -it -p 3000:3000/tcp -v $$(pwd):/app new:latest bash
