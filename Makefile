.PHONY: install-docker
install-docker:
	bash ./install-docker.bash

.PHONY: deploy-chain
deploy-chain:
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	docker-compose up -d

.PHONY: deploy-validator
deploy-validator:
	rm -rf ./genesis.json
	cp /tmp/genesis.json genesis.json
	cp /tmp/.env ./.env
	docker compose -f ./validator/docker-compose.yaml --env-file ./.env up -d
