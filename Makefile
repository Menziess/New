
# Some useful variables
GREEN=\033[1;32m
WHITE=\033[0m

help:
	@echo "Work in progress: ${GREEN}test${WHITE}"

dev:
	docker run -d -p 3000:3000

