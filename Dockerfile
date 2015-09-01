
FROM library/ubuntu:14.04
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get -y update
RUN apt-get -y install \
	gcc-multilib \
	build-essential \
	git \
	curl \
	python 

VOLUME /embox
CMD ( \
	cd /embox; \
	[ ! -d .git ] && git clone https://github.com/embox/embox.git ; \
	exec /bin/bash \
)

