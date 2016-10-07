DOCKER=docker
IMAGE=lappsgrid/masc
VERSION=1.1.0

latest:
	./packages.sh update
	$(DOCKER) build -t $(IMAGE) .

masc:
	./packages.sh update
	$(DOCKER) build -t $(IMAGE):$(VERSION) .
	
push:
	$(DOCKER)  push $(IMAGE)
	
tag:
	$(DOCKER) tag $(IMAGE) $(IMAGE):$(VERSION) && $(DOCKER) push $(IMAGE):$(VERSION)

run:
	docker run -d -p 8080:8080 --name masc lappsgrid/masc
	
stop:
	docker rm -f masc

test:
	./test.lsd
	
login:
	docker exec -it masc /bin/bash

help:
	@echo
	@echo "GOALS"
	@echo "latest - builds a server with the MASC DataSource. (Default)"
	@echo "masc   - builds a versioned image"
	@echo "push   - uploads the latest image to hub.docker.com"
	@echo "tag    - tags the image and pushes to hub.docker.com"
	@echo "run    - runs the latest Docker image"
	@echo "stop   - stops the running Docker container"
	@echo "test   - starts the container and attempts to fetch documents."
	@echo "login  - launches a Bash shell in the running container"
	@echo "help   - prints this helpful message"
	@echo
