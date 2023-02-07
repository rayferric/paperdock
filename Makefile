deploy:
	mkdir -p ./.data
	docker-compose up -d paperdock

attach:
	docker attach $$(docker-compose ps -q paperdock) || true

deploy-attach: deploy attach

