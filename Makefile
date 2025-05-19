service ?= .
DOCKER_COMPOSE := $(shell command -v docker-compose >/dev/null 2>&1 && echo docker-compose || echo docker compose)

env_file ?= .

up:
	@echo "Using $(env_file)"
	$(DOCKER_COMPOSE) --env-file $(env_file) -f $(service)/docker-compose.yml up -d

down:
	$(DOCKER_COMPOSE) -f $(service)/docker-compose.yml down -v

ps:
	$(DOCKER_COMPOSE) --env-file $(env_file) -f $(service)/docker-compose.yml ps