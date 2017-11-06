FROM ubuntu:16.04

LABEL maintainer="Ricardo N Feliciano (FelicianoTech) <ricardo@feliciano.tech>"

RUN apt-get update && apt-get install -y \
	wget

RUN wget https://clis.ng.bluemix.net/download/bluemix-cli/0.6.1/linux64 && \
	tar xfv linux64 && \
	Bluemix_CLI/install_bluemix_cli && \
	bx plugin install container-service -r Bluemix && \
	bx plugin install container-registry -r Bluemix

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.8.2/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/kubectl

RUN wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.09.0~ce-0~ubuntu_amd64.deb && \
	dpkg -i docker-ce_17.09.0~ce-0~ubuntu_amd64.deb
