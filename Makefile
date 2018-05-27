IMAGE_BASE = test-https

.PHONY: all
all: instance/localhost.crt build run

#######################################################################
# Docker
#######################################################################

.PHONY: run
run:
	docker run \
		--rm \
		--net="host" \
		-p 8443:8443 \
		$(IMAGE_BASE):base

.PHONY: build
build:
	docker build -t $(IMAGE_BASE):base .

#######################################################################
# OpenSSL: Generate certificates
#######################################################################

instance/localhost.key:
	openssl genrsa -out instance/localhost.key 2048

instance/localhost.csr: instance/localhost.key
	openssl req -new -key instance/localhost.key -out instance/localhost.csr

instance/localhost.crt: instance/localhost.csr instance/localhost.key
	openssl x509 \
		-req \
		-days 365 \
		-in instance/localhost.csr \
		-signkey instance/localhost.key \
		-out instance/localhost.crt
