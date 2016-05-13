DOCKER=/usr/local/bin/docker
IMAGE=lappsgrid/masc
VERSION=1.0.0

masc:
	#./packages.sh update
	$(DOCKER) build -t $(IMAGE) .

version:
	$(DOCKER) bulid -t $(IMAGE):$(VERSION) .
push:
	$(DOCKER)  push $(IMAGE)
	
tag:
	if [ -n "$(TAG)" ] ; then $(DOCKER) tag $(IMAGE):$(VERSION) $(IMAGE):$(TAG) ; fi

help:
	@echo
	@echo "GOALS"
	@echo "masc      - builds a server with the MASC DataSource."
	@echo "version   - builds a versioned image"
	@echo "push      - uploads the image to hub.docker.com"
	@echo "tag       - Tags the image on hub.docker.com"
	@echo
