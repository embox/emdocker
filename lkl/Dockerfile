FROM i386/ubuntu:18.04

RUN apt-get update && \
	DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
		sudo \
		iptables \
		openssh-server \
		iproute2 \
		bzip2 \
		unzip \
		xz-utils \
		python \
		curl \
		make \
		patch \
		cpio \
		bc \
		gcc \
		g++ \
		flex \
		bison \
		git \
		ca-certificates \
		qemu-system-x86 \
		&& \
	apt-get clean && \
	rm -rf /var/lib/apt /var/cache/apt
