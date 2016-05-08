
FROM library/ubuntu-debootstrap:14.04
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get update
RUN apt-get -y --no-install-recommends install \
	software-properties-common
RUN add-apt-repository ppa:terry.guo/gcc-arm-embedded
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y --no-install-recommends install \
		gcc-arm-none-eabi=4.9.3.2015q3-*
RUN apt-get -y autoremove software-properties-common
RUN DEBIAN_FRONTEND=noninteractive \
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
		qemu-system

RUN apt-get clean
RUN rm -rf /var/lib/apt /var/cache/apt

COPY create_matching_user.sh /usr/local/sbin/
COPY docker_start.sh /usr/local/sbin/

COPY id_rsa.pub /home/user/.ssh/authorized_keys
COPY user.bashrc /home/user/.bashrc
COPY user.bash_profile /home/user/.bash_profile
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

EXPOSE 22
VOLUME /embox
CMD ["/usr/local/sbin/docker_start.sh"]
