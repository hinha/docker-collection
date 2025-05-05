


observer_up: observer_down
	docker-compose -f observability/docker-compose.yml up -d

observer_down:
	docker-compose -f observability/docker-compose.yml down -v

observer_restart:
	docker-compose -f observability/docker-compose.yml up -d --build