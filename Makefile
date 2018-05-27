IMAGE_BASE = test-https

.PHONY: build
build:
	docker build -t $(IMAGE_BASE):base .

.PHONY: run
run:
	docker run \
		--rm \
		--net="host" \
		-p 8443:8443 \
		$(IMAGE_BASE):base
