IMAGE_BASE = test-https

.PHONY: all
all: ca-certificates build run

.PHONY: clean
clean:
	- rm instance/localhost.*

#######################################################################
# OpenSSL: Generate certificates
#######################################################################

.PHONY: ca-certificates
ca-certificates: instance/localhost.key instance/localhost.crt

.PRECIOUS: %.key
%.key:
	openssl genrsa \
		-out $@ \
		2048

.PRECIOUS: %.csr
%.csr: %.key
	openssl req \
		-subj \
		"/C=US/ST=New York/L=New York/O=SamOrg/CN=samuel.roeca@gmail.com" \
		-new -key $< \
		-out $@

.PRECIOUS: %.crt
%.crt: %.csr %.key
	openssl x509 \
		-req -days 365 \
		-in $*.csr \
		-signkey $*.key \
		-out $@

#######################################################################
# Docker
#######################################################################

.PHONY: run
run:
	docker-compose up
	# docker run \
	# 	--rm \
	# 	--net="host" \
	# 	-p 8443:8443 \
	# 	$(IMAGE_BASE):base

.PHONY: build
build:
	# docker build -t $(IMAGE_BASE):base .
	docker-compose build
