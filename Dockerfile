
FROM library/ubuntu:14.04
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

# base + x86
RUN apt-get update && apt-get -y install \
	software-properties-common \
	gcc-multilib \
	build-essential \
	git \
	curl \
	python \
	qemu

# ARM
RUN add-apt-repository ppa:terry.guo/gcc-arm-embedded
RUN apt-get update && apt-get -y install \
	gcc-arm-none-eabi=4.9.3.2015q2-*

VOLUME /embox
WORKDIR /embox
CMD ["/bin/bash"]

