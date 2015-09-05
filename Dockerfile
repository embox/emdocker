
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

EXPOSE 22
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd
COPY id_rsa.pub /root/.ssh/authorized_keys

RUN apt-get -y install gdb

COPY gdbwrapper /usr/local/bin/
COPY miwrapper.awk /usr/local/share/

VOLUME /embox
WORKDIR /embox
CMD /etc/init.d/ssh start && /bin/bash
