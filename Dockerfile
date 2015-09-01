
FROM library/ubuntu:14.04
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get -y update && apt-get -y install \
	gcc-multilib \
	build-essential \
	git \
	curl \
	python \
	qemu

VOLUME /embox
WORKDIR /embox
CMD ["/bin/bash"]

