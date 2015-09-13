
FROM library/ubuntu-debootstrap:14.04
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get update && \
	apt-get -y --no-install-recommends install \
		software-properties-common && \
	add-apt-repository ppa:terry.guo/gcc-arm-embedded && \
	apt-get update && \
	DEBIAN_FRONTEND=noninteractive \
		apt-get -y --no-install-recommends install \
			gcc-arm-none-eabi=4.9.3.2015q2-* \
		&& \
	apt-get -y autoremove software-properties-common && \
	DEBIAN_FRONTEND=noninteractive \
		apt-get -y --no-install-recommends install \
			sudo \
			iptables \
			openssh-server \
			python \
			curl \
			make \
			patch \
			gcc-multilib \
			gdb \
			qemu-system \
		&& \
	apt-get clean && \
	rm -rf /var/lib/apt /var/cache/apt

EXPOSE 22
RUN mkdir /var/run/sshd

COPY create_matching_user.sh /usr/sbin/
COPY id_rsa.pub /home/user/.ssh/authorized_keys
COPY user.bashrc /home/user/.bashrc
COPY user.bash_profile /home/user/.bash_profile
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

VOLUME /embox
CMD /usr/sbin/create_matching_user.sh user /embox && \
	/etc/init.d/ssh start && \
	/bin/bash
COPY gdbwrapper2 /usr/local/bin/
COPY killgdbwrapper /usr/local/bin/
