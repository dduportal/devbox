.PHONY: build shell test all presentation start clean backup prepare

WEB_SRV_NAME = app_devbox_1
DOCKER_VERSION=1.11.2
DOCKER_COMPOSE_VERSION=1.7.1
DOCKER_MATERIAL_DIR=./docker-materials

all: build test

build: prepare
	docker build -t base ./$(DOCKER_MATERIAL_DIR)/base/
	docker-compose -p app build

start:
	docker-compose up -d

feu: build start

shell:
	docker run --rm cli

# gui: start
# 	/Applications/x2goclient.app/Contents/MacOS/x2goclient \
# 		--session=devbox

# presentation:
# 	@docker kill $(WEB_SRV_NAME) >/dev/null || :
# 	@docker rm $(WEB_SRV_NAME) >/dev/null  || :
# 	@docker run -d --name $(WEB_SRV_NAME) -v $(CURDIR)/slides:/www -p 80:80 fnichol/uhttpd >/dev/null
# 	@echo http://$$(boot2docker ip 2>/dev/null):80

test:
	docker run \
		-v $(CURDIR):/app \
		-v $$(which docker):$$(which docker) \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-e DOCKER_HOST=unix:///var/run/docker.sock \
		dduportal/bats:0.4.0 \
			/app/tests/bats/

# backup:
# 	docker-compose -p app run devbox tar czf /tmp/bkp-data-latest.tgz /data/

clean:
	docker-compose down -v

prepare:
	if [ "$$CIRCLECI" = "true" ]; then \
		curl -L https://github.com/docker/compose/releases/download/1.2.0/docker-compose-`uname -s`-`uname -m` \
			> /home/ubuntu/bin/docker-compose \
			&& chmod +x /home/ubuntu/bin/docker-compose; \
		fi
