
FROM embox/emdocker
MAINTAINER Anton Kozlov <drakon.mega@gmail.com>

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y --no-install-recommends install \
		nfs-kernel-server \
		nfs-common

RUN mkdir -p -m 777 /var/nfs_test
COPY exports /etc/exports

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get -y --no-install-recommends install \
		samba

RUN mkdir -p -m 777 /var/cifs_test
COPY smb.conf /etc/samba/smb.conf

CMD mount -t tmpfs none /var/nfs_test && \
	service rpcbind restart && \
	/etc/init.d/nfs-kernel-server restart && \
	/etc/init.d/nmbd restart && \
	/etc/init.d/smbd restart && \
	/usr/local/sbin/docker_start.sh

RUN apt-get clean
RUN rm -rf /var/lib/apt /var/cache/apt

