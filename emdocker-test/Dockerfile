
FROM embox/emdocker
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y --no-install-recommends install \
		nfs-kernel-server \
		nfs-common

RUN mkdir -p -m 666 /var/nfs_test
COPY exports /etc/exports

CMD mount -t tmpfs none /var/nfs_test && \
	service rpcbind restart && \
	/etc/init.d/nfs-kernel-server restart && \
	/usr/local/sbin/docker_start.sh

RUN apt-get clean
RUN rm -rf /var/lib/apt /var/cache/apt

