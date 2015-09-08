
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

RUN apt-get -y install gdb

COPY gdbwrapper /usr/local/bin/
COPY miwrapper.awk /usr/local/share/
COPY id_rsa.pub /home/user/.ssh/authorized_keys
COPY create_matching_user.sh /usr/sbin/
COPY user.bashrc /home/user/.bashrc
COPY user.bash_profile /home/user/.bash_profile
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

VOLUME /embox
CMD /usr/sbin/create_matching_user.sh user /embox && \
	/etc/init.d/ssh start && \
	/bin/bash

