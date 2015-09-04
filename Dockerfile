
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
CMD /etc/init.d/ssh start && /bin/bash

RUN apt-get -y install gdb

VOLUME /embox
#WORKDIR /embox
#CMD ["/bin/bash"]

COPY gdbwrapper /root/
COPY miwrapper.awk /root/
#COPY bashrc /root/.bashrc
#COPY bashrc /root/.bashrc
